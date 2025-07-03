-- File: perfomance.sql

-- Step 1: Initial Complex Query with WHERE and AND
-- Simulating a real use case: Get all confirmed bookings from 2024 onward
EXPLAIN ANALYZE
SELECT
    b.booking_id,
    b.start_date,
    b.end_date,
    b.total_price,
    u.id AS user_id,
    u.username,
    u.email,
    p.id AS property_id,
    p.property_name,
    pay.payment_id,
    pay.amount,
    pay.payment_date,
    pay.status
FROM
    bookings AS b
JOIN
    users AS u ON b.user_id = u.id
JOIN
    properties AS p ON b.property_id = p.id
JOIN
    payments AS pay ON b.booking_id = pay.booking_id
WHERE
    pay.status = 'confirmed'
    AND b.start_date >= '2024-01-01';

-- Step 2: Optimized Query
-- Only fetches necessary columns with same filters
EXPLAIN ANALYZE
SELECT
    b.booking_id,
    b.total_price,
    u.username,
    p.property_name,
    pay.amount
FROM
    bookings AS b
JOIN
    users AS u ON b.user_id = u.id
JOIN
    properties AS p ON b.property_id = p.id
JOIN
    payments AS pay ON b.booking_id = pay.booking_id
WHERE
    pay.status = 'confirmed'
    AND b.start_date >= '2024-01-01';
