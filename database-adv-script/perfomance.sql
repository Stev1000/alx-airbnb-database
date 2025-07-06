```sql
-- perfomance.sql

SELECT
    b.booking_id,
    b.start_date,
    b.end_date,
    b.total_price,
    b.status,
    u.user_id,
    u.first_name,
    u.last_name,
    u.email,
    p.property_id,
    p.name AS property_name,
    p.location,
    pm.payment_id,
    pm.amount,
    pm.payment_date,
    pm.payment_method
FROM
    Booking b
JOIN
    "User" u ON b.user_id = u.user_id
JOIN
    Property p ON b.property_id = p.property_id
JOIN
    Payment pm ON b.booking_id = pm.booking_id;
```

```sql
EXPLAIN ANALYZE SELECT
    b.booking_id,
    b.start_date,
    b.end_date,
    b.total_price,
    b.status,
    u.user_id,
    u.first_name,
    u.last_name,
    u.email,
    p.property_id,
    p.name AS property_name,
    p.location,
    pm.payment_id,
    pm.amount,
    pm.payment_date,
    pm.payment_method
FROM
    Booking b
JOIN
    "User" u ON b.user_id = u.user_id
JOIN
    Property p ON b.property_id = p.property_id
JOIN
    Payment pm ON b.booking_id = pm.booking_id;
```

-- Example: Only selecting necessary columns
SELECT
    b.booking_id,
    b.start_date,
    b.end_date,
    u.first_name,
    u.last_name,
    p.name AS property_name,
    pm.amount
FROM
    Booking b
JOIN
    "User" u ON b.user_id = u.user_id
JOIN
    Property p ON b.property_id = p.property_id
JOIN
    Payment pm ON b.booking_id = pm.booking_id;

WITH UserBookings AS (
    SELECT b.booking_id, b.start_date, b.end_date, b.user_id, b.property_id
    FROM Booking b
)
SELECT
    ub.booking_id,
    ub.start_date,
    ub.end_date,
    u.first_name,
    u.last_name,
    p.name AS property_name,
    pm.amount
FROM
    UserBookings ub
JOIN
    "User" u ON ub.user_id = u.user_id
JOIN
    Property p ON ub.property_id = p.property_id
JOIN
    Payment pm ON ub.booking_id = pm.booking_id;
