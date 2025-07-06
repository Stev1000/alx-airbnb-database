
-- 1. INNER JOIN: Get all bookings and their corresponding users
SELECT
    bookings.id AS booking_id,
    bookings.property_id,
    bookings.booking_date,
    users.id AS user_id,
    users.first_name,
    users.last_name,
    users.email
FROM
    bookings
INNER JOIN
    users ON bookings.user_id = users.id;

-- 2. LEFT JOIN: Get all properties and their reviews (including those with no reviews)
SELECT
    properties.id AS property_id,
    properties.name AS property_name,
    reviews.id AS review_id,
    reviews.rating,
    reviews.comment
FROM
    properties
LEFT JOIN
    reviews ON properties.property_id = reviews.property_id;

-- 3. FULL OUTER JOIN: Get all users and all bookings, even unmatched
SELECT
    users.id AS user_id,
    users.first_name,
    users.last_name,
    bookings.id AS booking_id,
    bookings.property_id,
    bookings.booking_date
FROM
    users
FULL OUTER JOIN
    bookings ON users.id = bookings.user_id;
