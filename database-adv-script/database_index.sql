-- File: database_index.sql

-- BEFORE indexing: Measure performance of user-booking join
EXPLAIN ANALYZE
SELECT
    u.username,
    COUNT(b.booking_id) AS total_bookings
FROM
    users AS u
JOIN
    bookings AS b ON u.id = b.user_id
GROUP BY
    u.username
ORDER BY
    u.username;

-- Create index on users.id (used in JOINs)
CREATE INDEX idx_users_id ON users(id);

-- Create index on users.username (used in ORDER BY)
CREATE INDEX idx_users_username ON users(username);

-- Create index on bookings.user_id (used in JOINs)
CREATE INDEX idx_bookings_user_id ON bookings(user_id);

-- Create index on bookings.property_id (used in JOINs)
CREATE INDEX idx_bookings_property_id ON bookings(property_id);

-- Create compound index for filtering dates
CREATE INDEX idx_bookings_start_end_date ON bookings(start_date, end_date);

-- Create index on properties.id (used in JOINs)
CREATE INDEX idx_properties_id ON properties(id);

-- Create index on properties.property_name (used in ORDER BY)
CREATE INDEX idx_properties_name ON properties(property_name);

-- AFTER indexing: Re-run same query to check performance improvement
EXPLAIN ANALYZE
SELECT
    u.username,
    COUNT(b.booking_id) AS total_bookings
FROM
    users AS u
JOIN
    bookings AS b ON u.id = b.user_id
GROUP BY
    u.username
ORDER BY
    u.username;
