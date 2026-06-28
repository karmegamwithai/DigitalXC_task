
from airflow import DAG
from airflow.operators.python import PythonOperator
from airflow.operators.bash import BashOperator
from datetime import datetime
import pandas as pd
from sqlalchemy import create_engine

CSV_PATH = r"/mnt/data/ITSM_Analytics_Full_Project/data/servicenow_tickets.csv"

def ingest_csv():
    df = pd.read_csv(CSV_PATH)

    engine = create_engine(
        "postgresql+psycopg2://postgres:password@localhost:5432/itsm_db"
    )

    df.to_sql(
        "service_now_tickets",
        engine,
        if_exists="replace",
        index=False
    )

    print("Data loaded successfully")

default_args = {
    "owner": "airflow",
    "start_date": datetime(2025, 1, 1)
}

with DAG(
    dag_id="itsm_pipeline",
    default_args=default_args,
    schedule="@daily",
    catchup=False
) as dag:

    ingest_task = PythonOperator(
        task_id="ingest_csv",
        python_callable=ingest_csv
    )

    dbt_run = BashOperator(
        task_id="dbt_run",
        bash_command="cd /path/to/dbt_project && dbt run"
    )

    dbt_test = BashOperator(
        task_id="dbt_test",
        bash_command="cd /path/to/dbt_project && dbt test"
    )

    ingest_task >> dbt_run >> dbt_test
