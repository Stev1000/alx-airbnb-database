-- Non-correlated subquery: Find all properties where the average rating is greater than 4.0
SELECT 
    p.id AS property_id,
    p.name AS property_name,
    p.location,
    p.pricepernight
FROM 
    properties p
WHERE 
    p.id IN (
        SELECT 
            r.property_id
        FROM 
            reviews r
        GROUP BY 
            r.property_id
        HAVING 
            AVG(r.rating) > 4.0
    );

-- Correlated subquery: Find users who have made more than 3 bookings
SELECT 
    u.id AS user_id,
    u.first_name,
    u.last_name,
    u.email
FROM 
    users u
WHERE 
    (SELECT COUNT(*) 
     FROM bookings b 
     WHERE b.user_id = u.id) > 3;