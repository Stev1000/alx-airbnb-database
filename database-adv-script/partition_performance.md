## Table Schema

```sql
CREATE TABLE Booking (
    -- (Paste your actual CREATE TABLE statement here)
);

-- (Paste the contents of your partitioning.sql file here)

SELECT * FROM Booking WHERE start_date >= '2024-01-01' AND start_date < '2024-03-01';

SELECT * FROM Booking_Partitioned WHERE start_date >= '2024-01-01' AND start_date < '2024-03-01';

