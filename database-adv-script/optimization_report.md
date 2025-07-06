# Query Optimization Report

## Initial Query

The initial query joined four tables: `bookings`, `users`, `properties`, and `payments`. While it was functional, it had the potential to be slow due to:

- Fetching unnecessary columns
- No indexes on foreign keys

## Performance Analysis

We used the `EXPLAIN` command to analyze the query. It revealed:

- Full table scans on `bookings` and `payments`
- High row counts estimated due to lack of indexes

## Optimizations Applied

- Created indexes on `bookings.user_id`, `bookings.property_id`, and `payments.booking_id`
- Removed unused columns
- Used shorter table aliases for readability

## Result

After applying these optimizations, the query execution plan showed reduced row scans and better join performance.
