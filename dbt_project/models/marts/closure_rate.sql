
SELECT
    assigned_group,
    COUNT(*) AS total_tickets,

    SUM(
        CASE WHEN status = 'Closed' THEN 1 ELSE 0 END
    ) AS closed_tickets,

    ROUND(
        100.0 *
        SUM(CASE WHEN status = 'Closed' THEN 1 ELSE 0 END)
        / COUNT(*),
        2
    ) AS closure_rate

FROM {{ ref('stg_tickets') }}

GROUP BY assigned_group
