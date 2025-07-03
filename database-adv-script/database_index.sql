-- File: database_index.sql

-- Index on users.id to speed up JOINs and lookups by user
CREATE INDEX idx_users_id ON users(id);

-- Index on users.username to optimize ORDER BY and lookups
CREATE INDEX idx_users_username ON users(username);

-- Index on bookings.user_id to speed up JOINs and filters by user
CREATE INDEX idx_bookings_user_id ON bookings(user_id);

-- Index on bookings.property_id to optimize JOINs with properties
CREATE INDEX idx_bookings_property_id ON bookings(property_id);

-- Index on bookings.start_date and end_date for filtering and sorting
CREATE INDEX idx_bookings_start_end_date ON bookings(start_date, end_date);

-- Index on properties.id to improve JOIN performance
CREATE INDEX idx_properties_id ON properties(id);

-- Index on properties.property_name to help ORDER BY and text search
CREATE INDEX idx_properties_name ON properties(property_name);
