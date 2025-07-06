-- Initial complex query to retrieve all bookings with user, property, and payment details
SELECT 
    bookings.booking_id,
    bookings.booking_date,
    bookings.user_id,
    users.first_name,
    users.last_name,
    properties.property_id,
    properties.name AS property_name,
    properties.location,
    payments.payment_id,
    payments.amount,
    payments.payment_date
FROM bookings
JOIN users ON bookings.user_id = users.user_id
JOIN properties ON bookings.property_id = properties.property_id
JOIN payments ON bookings.booking_id = payments.booking_id;

EXPLAIN SELECT 
    bookings.booking_id,
    bookings.booking_date,
    bookings.user_id,
    users.first_name,
    users.last_name,
    properties.property_id,
    properties.name,
    properties.location,
    payments.payment_id,
    payments.amount,
    payments.payment_date
FROM bookings
JOIN users ON bookings.user_id = users.user_id
JOIN properties ON bookings.property_id = properties.property_id
JOIN payments ON bookings.booking_id = payments.booking_id;

CREATE INDEX idx_user_id ON bookings(user_id);
CREATE INDEX idx_property_id ON bookings(property_id);
CREATE INDEX idx_booking_id ON payments(booking_id);


-- Refactored optimized query
SELECT 
    b.booking_id,
    b.booking_date,
    u.first_name,
    u.last_name,
    p.name AS property_name,
    p.location,
    pay.amount,
    pay.payment_date
FROM bookings b
JOIN users u ON b.user_id = u.user_id
JOIN properties p ON b.property_id = p.property_id
JOIN payments pay ON b.booking_id = pay.booking_id;
