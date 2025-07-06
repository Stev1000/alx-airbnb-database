-- 1. Aggregation Query: Find the total number of bookings made by each user
SELECT 
    u.id AS user_id,
    u.first_name,
    u.last_name,
    u.email,
    COUNT(b.id) AS total_bookings
FROM 
    users u
LEFT JOIN 
    bookings b ON u.id = b.user_id
GROUP BY 
    u.id, u.first_name, u.last_name, u.email
ORDER BY 
    total_bookings DESC;

-- 2. Window Function Query: Rank properties based on total number of bookings using ROW_NUMBER
SELECT 
    p.id AS property_id,
    p.name AS property_name,
    p.location,
    p.pricepernight,
    COUNT(b.id) AS total_bookings,
    ROW_NUMBER() OVER (ORDER BY COUNT(b.id) DESC) AS row_number_rank
FROM 
    properties p
LEFT JOIN 
    bookings b ON p.id = b.property_id
GROUP BY 
    p.id, p.name, p.location, p.pricepernight
ORDER BY 
    row_number_rank;

-- 3. Window Function Query: Rank properties based on total number of bookings using RANK
SELECT 
    p.id AS property_id,
    p.name AS property_name,
    p.location,
    p.pricepernight,
    COUNT(b.id) AS total_bookings,
    RANK() OVER (ORDER BY COUNT(b.id) DESC) AS rank_position
FROM 
    properties p
LEFT JOIN 
    bookings b ON p.id = b.property_id
GROUP BY 
    p.id, p.name, p.location, p.pricepernight
ORDER BY 
    rank_position;

-- 4. Bonus: Combined Window Functions for comprehensive property ranking
SELECT 
    p.id AS property_id,
    p.name AS property_name,
    p.location,
    p.pricepernight,
    COUNT(b.id) AS total_bookings,
    ROW_NUMBER() OVER (ORDER BY COUNT(b.id) DESC) AS row_number_rank,
    RANK() OVER (ORDER BY COUNT(b.id) DESC) AS rank_position,
    DENSE_RANK() OVER (ORDER BY COUNT(b.id) DESC) AS dense_rank_position
FROM 
    properties p
LEFT JOIN 
    bookings b ON p.id = b.property_id
GROUP BY 
    p.id, p.name, p.location, p.pricepernight
ORDER BY 
    total_bookings DESC;