
SELECT
    created_year,
    created_month,

    COUNT(*) AS total_tickets,

    ROUND(
        AVG(resolution_time_hrs_cleaned),
        2
    ) AS avg_resolution_time,

    ROUND(
        100.0 *
        SUM(CASE WHEN status = 'Closed' THEN 1 ELSE 0 END)
        / COUNT(*),
        2
    ) AS closure_rate

FROM {{ ref('stg_tickets') }}

GROUP BY created_year, created_month
ORDER BY created_year, created_month
