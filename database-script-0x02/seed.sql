-- Users
INSERT INTO users (user_id, first_name, last_name, email, password_hash, phone_number, role)
VALUES
('11111111-1111-1111-1111-111111111111', 'Alice', 'Smith', 'alice@example.com', 'hashed_pw_1', '0789000111', 'guest'),
('22222222-2222-2222-2222-222222222222', 'Bob', 'Johnson', 'bob@example.com', 'hashed_pw_2', '0789000222', 'host'),
('33333333-3333-3333-3333-333333333333', 'Carla', 'Brown', 'carla@example.com', 'hashed_pw_3', '0789000333', 'admin');

-- Properties
INSERT INTO properties (property_id, host_id, title, description, address, city, price_per_night)
VALUES
('aaaaaaa1-aaaa-aaaa-aaaa-aaaaaaaaaaaa', '22222222-2222-2222-2222-222222222222', 'Cozy Cabin', 'Mountain-side retreat', '123 Forest Lane', 'Musanze', 60.00),
('aaaaaaa2-aaaa-aaaa-aaaa-aaaaaaaaaaaa', '22222222-2222-2222-2222-222222222222', 'City Loft', 'Modern loft in the heart of town', '456 Urban Blvd', 'Kigali', 95.00);

-- Bookings
INSERT INTO bookings (booking_id, guest_id, property_id, check_in_date, check_out_date, total_price, status)
VALUES
('bbbbbbb1-bbbb-bbbb-bbbb-bbbbbbbbbbbb', '11111111-1111-1111-1111-111111111111', 'aaaaaaa1-aaaa-aaaa-aaaa-aaaaaaaaaaaa', '2025-07-15', '2025-07-17', 120.00, 'confirmed'),
('bbbbbbb2-bbbb-bbbb-bbbb-bbbbbbbbbbbb', '11111111-1111-1111-1111-111111111111', 'aaaaaaa2-aaaa-aaaa-aaaa-aaaaaaaaaaaa', '2025-08-01', '2025-08-05', 380.00, 'pending');

-- Reviews
INSERT INTO reviews (review_id, booking_id, rating, comment)
VALUES
('rrrrrrr1-rrrr-rrrr-rrrr-rrrrrrrrrrrr', 'bbbbbbb1-bbbb-bbbb-bbbb-bbbbbbbbbbbb', 5, 'Absolutely beautiful! Peaceful and clean.');

-- Payments
INSERT INTO payments (payment_id, booking_id, payment_method, amount, payment_date)
VALUES
('ppppppp1-pppp-pppp-pppp-pppppppppppp', 'bbbbbbb1-bbbb-bbbb-bbbb-bbbbbbbbbbbb', 'Visa', 120.00, '2025-07-10');
