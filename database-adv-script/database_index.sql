-- Property table index
CREATE INDEX idx_property_location ON Property (location);

-- Booking table index
CREATE INDEX idx_booking_dates ON Booking (start_date, end_date);

-- Review table index
CREATE INDEX idx_review_rating ON Review (rating);