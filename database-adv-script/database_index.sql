-- Property table index
CREATE INDEX idx_property_location ON Property (location);

-- Booking table index
CREATE INDEX idx_booking_dates ON Booking (start_date, end_date);

-- Review table index
CREATE INDEX idx_review_rating ON Review (rating);

-- Example EXPLAIN ANALYZE commands (for testing purposes):
-- EXPLAIN ANALYZE SELECT * FROM Property WHERE location = 'New York, NY';
-- EXPLAIN ANALYZE SELECT * FROM Booking WHERE start_date >= '2024-01-15' AND start_date <= '2024-01-31';
-- EXPLAIN ANALYZE SELECT * FROM Review WHERE rating = 5;