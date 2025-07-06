# Query Optimization Report: Bookings, Users, Properties, and Payments

## Objective

This report documents the process of optimizing a complex query that retrieves booking information along with related user, property, and payment details.

## Initial Query

```sql
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

-- Paste the output of EXPLAIN ANALYZE for the initial query here.
-- Example (Replace with your actual output):
-- Hash Join
--   (cost=25.00..50.00 rows=100 width=500 actual time=0.100..0.200 rows=100 loops=1)
--     ->  Seq Scan on Booking b  (cost=0.00..10.00 rows=100 width=100 actual time=0.010..0.020 rows=100 loops=1)
--     ->  Hash Join
--           (cost=10.00..20.00 rows=100 width=400 actual time=0.050..0.100 rows=100 loops=1)
--           ->  Seq Scan on "User" u  (cost=0.00..5.00 rows=100 width=200 actual time=0.005..0.010 rows=100 loops=1)
--           ->  Hash Join
--                 (cost=5.00..10.00 rows=100 width=300 actual time=0.025..0.050 rows=100 loops=1)
--                 ->  Seq Scan on Property p  (cost=0.00..5.00 rows=100 width=100 actual time=0.002..0.005 rows=100 loops=1)
--                 ->  Hash Scan on Payment pm  (cost=0.00..5.00 rows=100 width=200 actual time=0.001..0.002 rows=100 loops=1)
-- Planning Time: 0.500 ms
-- Execution Time: 0.300 ms

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

-- Paste the output of EXPLAIN ANALYZE for the refactored query here.
-- Example (Replace with your actual output):
-- Hash Join
--   (cost=20.00..40.00 rows=100 width=300 actual time=0.080..0.160 rows=100 loops=1)
--     ->  Seq Scan on Booking b  (cost=0.00..10.00 rows=100 width=50 actual time=0.008..0.015 rows=100 loops=1)
--     ->  Hash Join
--           (cost=5.00..15.00 rows=100 width=250 actual time=0.040..0.080 rows=100 loops=1)
--           ->  Seq Scan on "User" u  (cost=0.00..5.00 rows=100 width=100 actual time=0.004..0.008 rows=100 loops=1)
--           ->  Hash Join
--                 (cost=0.00..5.00 rows=100 width=200 actual time=0.020..0.040 rows=100 loops=1)
--                 ->  Seq Scan on Property p  (cost=0.00..5.00 rows=100 width=50 actual time=0.001..0.003 rows=100 loops=1)
--                 ->  Hash Scan on Payment pm  (cost=0.00..5.00 rows=100 width=150 actual time=0.000..0.001 rows=100 loops=1)
-- Planning Time: 0.400 ms
-- Execution Time: 0.250 ms

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

*   **Replace the Placeholders:** You *must* replace all the placeholder text (e.g., "[Replace with the actual execution time in milliseconds]") with your actual data and analysis.
*   **Run `EXPLAIN ANALYZE`:** You need to run the `EXPLAIN ANALYZE` command in your database for *both* the initial query and the refactored query and paste the output into the `optimization_report.md` file.
*   **Analyze the Results:** Carefully analyze the results and write a detailed analysis in the "Analysis" section.
*   **Database System:** This example assumes you're using PostgreSQL, so it uses `EXPLAIN ANALYZE`. If you're using a different database system, use the appropriate command for analyzing query performance.

By following these steps and replacing the placeholders with your actual data and analysis, you should be able to complete the `optimization_report.md` file successfully.
 
