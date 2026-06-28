
CREATE TABLE service_now_tickets (
    ticket_id VARCHAR(100),
    category VARCHAR(100),
    sub_category VARCHAR(100),
    priority VARCHAR(50),
    created_date TIMESTAMP,
    resolved_date TIMESTAMP,
    status VARCHAR(50),
    assigned_group VARCHAR(100),
    technician VARCHAR(100),
    resolution_time_hrs FLOAT,
    customer_impact VARCHAR(100)
);
