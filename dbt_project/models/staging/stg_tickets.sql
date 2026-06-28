
WITH cleaned AS (

    SELECT DISTINCT *
    FROM service_now_tickets
    WHERE ticket_id IS NOT NULL

)

SELECT
    *,
    EXTRACT(YEAR FROM created_date) AS created_year,
    EXTRACT(MONTH FROM created_date) AS created_month,
    EXTRACT(DAY FROM created_date) AS created_day,
    COALESCE(resolution_time_hrs, 0) AS resolution_time_hrs_cleaned

FROM cleaned
