-- Insert Users
INSERT INTO Users (user_id, first_name, last_name, email, password_hash, phone_number, role, created_at) VALUES
('00000000-0000-0000-0000-000000000001', 'Alice', 'Smith', 'alice@example.com', 'hashed_pw1', '1234567890', 'guest', CURRENT_TIMESTAMP),
('00000000-0000-0000-0000-000000000002', 'Bob', 'Johnson', 'bob@example.com', 'hashed_pw2', '2345678901', 'host', CURRENT_TIMESTAMP),
('00000000-0000-0000-0000-000000000003', 'Charlie', 'Brown', 'charlie@example.com', 'hashed_pw3', '3456789012', 'admin', CURRENT_TIMESTAMP);

-- Insert Properties
INSERT INTO Properties (property_id, host_id, name, description, location, pricepernight, created_at, updated_at) VALUES
('10000000-0000-0000-0000-000000000001', '00000000-0000-0000-0000-000000000002', 'Seaside Villa', 'A beautiful villa by the sea.', 'Malibu, CA', 300.00, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('10000000-0000-0000-0000-000000000002', '00000000-0000-0000-0000-000000000002', 'Mountain Cabin', 'Cozy cabin in the mountains.', 'Aspen, CO', 200.00, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

-- Insert Bookings
INSERT INTO Bookings (booking_id, property_id, user_id, start_date, end_date, total_price, status, created_at) VALUES
('20000000-0000-0000-0000-000000000001', '10000000-0000-0000-0000-000000000001', '00000000-0000-0000-0000-000000000001', '2025-07-01', '2025-07-05', 1200.00, 'confirmed', CURRENT_TIMESTAMP),
('20000000-0000-0000-0000-000000000002', '10000000-0000-0000-0000-000000000002', '00000000-0000-0000-0000-000000000001', '2025-08-10', '2025-08-15', 1000.00, 'pending', CURRENT_TIMESTAMP);

-- Insert Payments
INSERT INTO Payments (payment_id, booking_id, amount, payment_date, payment_method) VALUES
('30000000-0000-0000-0000-000000000001', '20000000-0000-0000-0000-000000000001', 1200.00, CURRENT_TIMESTAMP, 'credit_card');

-- Insert Reviews
INSERT INTO Reviews (review_id, property_id, user_id, rating, comment, created_at) VALUES
('40000000-0000-0000-0000-000000000001', '10000000-0000-0000-0000-000000000001', '00000000-0000-0000-0000-000000000001', 5, 'Fantastic place to stay!', CURRENT_TIMESTAMP),
('40000000-0000-0000-0000-000000000002', '10000000-0000-0000-0000-000000000002', '00000000-0000-0000-0000-000000000001', 4, 'Great view and cozy vibe.', CURRENT_TIMESTAMP);

-- Insert Messages
INSERT INTO Messages (message_id, sender_id, recipient_id, message_body, sent_at) VALUES
('50000000-0000-0000-0000-000000000001', '00000000-0000-0000-0000-000000000001', '00000000-0000-0000-0000-000000000002', 'Hi, I have a question about your listing.', CURRENT_TIMESTAMP),
('50000000-0000-0000-0000-000000000002', '00000000-0000-0000-0000-000000000002', '00000000-0000-0000-0000-000000000001', 'Sure, happy to help!', CURRENT_TIMESTAMP);
