
SELECT
    category,
    priority,
    ROUND(AVG(resolution_time_hrs_cleaned), 2) AS avg_resolution_time

FROM {{ ref('stg_tickets') }}

GROUP BY category, priority
