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

## Initial Query EXPLAIN Output

– Paste the output of EXPLAIN ANALYZE for the initial query here. – Example (Replace with your actual output): – Hash Join – (cost=25.00..50.00 rows=100 width=500 actual time=0.100..0.200 rows=100 loops=1) – -> Seq Scan on Booking b (cost=0.00..10.00 rows=100 width=100 actual time=0.010..0.020 rows=100 loops=1) – -> Hash Join – (cost=10.00..20.00 rows=100 width=400 actual time=0.050..0.100 rows=100 loops=1) – -> Seq Scan on “User” u (cost=0.00..5.00 rows=100 width=200 actual time=0.005..0.010 rows=100 loops=1) – -> Hash Join – (cost=5.00..10.00 rows=100 width=300 actual time=0.025..0.050 rows=100 loops=1) – -> Seq Scan on Property p (cost=0.00..5.00 rows=100 width=100 actual time=0.002..0.005 rows=100 loops=1) – -> Hash Scan on Payment pm (cost=0.00..5.00 rows=100 width=200 actual time=0.001..0.002 rows=100 loops=1) – Planning Time: 0.500 ms – Execution Time: 0.300 ms

*Add the time in ms in the execution time placeholder.*

**5. Refactored Query:**

*   Include the *refactored* SQL query that you created to improve performance. This is the query after you've made changes based on your analysis of the `EXPLAIN` output.

```markdown
## Refactored Query (Selecting Necessary Columns)

```sql
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

## Refactored Query EXPLAIN Output

– Paste the output of EXPLAIN ANALYZE for the refactored query here. – Example (Replace with your actual output): – Hash Join – (cost=20.00..40.00 rows=100 width=300 actual time=0.080..0.160 rows=100 loops=1) – -> Seq Scan on Booking b (cost=0.00..10.00 rows=100 width=50 actual time=0.008..0.015 rows=100 loops=1) – -> Hash Join – (cost=5.00..15.00 rows=100 width=250 actual time=0.040..0.080 rows=100 loops=1) – -> Seq Scan on “User” u (cost=0.00..5.00 rows=100 width=100 actual time=0.004..0.008 rows=100 loops=1) – -> Hash Join – (cost=0.00..5.00 rows=100 width=200 actual time=0.020..0.040 rows=100 loops=1) – -> Seq Scan on Property p (cost=0.00..5.00 rows=100 width=50 actual time=0.001..0.003 rows=100 loops=1) – -> Hash Scan on Payment pm (cost=0.00..5.00 rows=100 width=150 actual time=0.000..0.001 rows=100 loops=1) – Planning Time: 0.400 ms – Execution Time: 0.250 ms

*Add the time in ms in the execution time placeholder.*

**7. Analysis:**

*   This is where you explain *why* you refactored the query the way you did, and *what* the performance improvements were. Be specific! Refer to the `EXPLAIN` outputs to support your analysis.

```markdown
## Analysis

The refactored query improves performance by selecting only the necessary columns from each table. This reduces the amount of data that needs to be read from disk, transferred across the network, and processed by the database.

In this case, the query was refactored to only return the booking details, user's first and last name, the property name, and the payment amount. This significantly reduces the width of data processed.

The execution time decreased from [Replace with the initial execution time] ms to [Replace with the refactored execution time] ms.

The `EXPLAIN ANALYZE` output shows that the refactored query has a lower estimated cost and actual execution time. The width of the data being processed at each join is smaller, indicating that less data is being processed.

## Conclusion

[Replace with your overall conclusion. Summarize the impact of your optimizations. Were they effective? What did you learn? What further optimizations could be explored? Consider indexes, materialized views, or other techniques.]
