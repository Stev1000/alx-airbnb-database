-- partitioning.sql

-- 1. Create a new table that inherits from the original Booking table
CREATE TABLE Booking_Partitioned (
    LIKE Booking INCLUDING DEFAULTS INCLUDING CONSTRAINTS INCLUDING INDEXES
) PARTITION BY RANGE (start_date);

-- 2. Create partitions for specific date ranges
CREATE TABLE Booking_Partitioned_2024_Q1 PARTITION OF Booking_Partitioned
FOR VALUES FROM ('2024-01-01') TO ('2024-04-01');

CREATE TABLE Booking_Partitioned_2024_Q2 PARTITION OF Booking_Partitioned
FOR VALUES FROM ('2024-04-01') TO ('2024-07-01');

CREATE TABLE Booking_Partitioned_2024_Q3 PARTITION OF Booking_Partitioned
FOR VALUES FROM ('2024-07-01') TO ('2024-10-01');

CREATE TABLE Booking_Partitioned_2024_Q4 PARTITION OF Booking_Partitioned
FOR VALUES FROM ('2024-10-01') TO ('2025-01-01');

-- (You'll likely want more partitions, and for different date ranges)

-- 3. (Optional) Create an index on the partitioned table
--CREATE INDEX idx_booking_partitioned_start_date ON Booking_Partitioned (start_date); -- Not needed as we are inheriting indexes

-- 4. Copy data from the original table to the partitioned table
INSERT INTO Booking_Partitioned SELECT * FROM Booking;

-- 5.  (Important!)  After copying the data, consider dropping the original Booking table and renaming Booking_Partitioned to Booking
-- ALTER TABLE Booking RENAME TO Booking_Old; -- Backup in case something goes wrong
-- ALTER TABLE Booking_Partitioned RENAME TO Booking;
-- Drop the old one after verifying
-- DROP TABLE Booking_Old;

-- Query 1: Fetch bookings for a specific date range
SELECT * FROM Booking_Partitioned WHERE start_date >= '2024-01-01' AND start_date < '2024-03-01';

-- Query 2: Count bookings for a specific month
SELECT COUNT(*) FROM Booking_Partitioned WHERE start_date >= '2024-02-01' AND start_date < '2024-03-01';

-- Use EXPLAIN ANALYZE to examine the query plans
EXPLAIN ANALYZE SELECT * FROM Booking_Partitioned WHERE start_date >= '2024-01-01' AND start_date < '2024-03-01';
