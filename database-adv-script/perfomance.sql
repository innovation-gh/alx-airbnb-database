-- File: perfomance.sql

-- Step 1: Initial Complex Query
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
    payments AS pay ON b.booking_id = pay.booking_id;

-- Step 2: Optimized Query
-- Optimization: Removed unnecessary columns, ensured only indexed fields are used in joins,
-- and ensured indexes on booking_id, user_id, property_id, payments.booking_id

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
    payments AS pay ON b.booking_id = pay.booking_id;
