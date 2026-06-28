
# ITSM Analytics Project

## Overview
This project implements an end-to-end ITSM analytics solution using:

- Python
- PostgreSQL
- Apache Airflow
- DBT
- Apache Superset

Dataset rows: 4999
Dataset columns: 15

## Features
- CSV ingestion into PostgreSQL
- Data cleaning and transformation
- Airflow orchestration
- DBT models
- Superset dashboard setup

## Run in PyCharm

### Create Virtual Environment
```bash
python -m venv venv
```

### Install Requirements
```bash
pip install -r requirements.txt
```

### Start Airflow
```bash
airflow standalone
```

### Run DBT
```bash
dbt run
dbt test
```
