-- File: aggregations_and_window_functions.sql

-- Task: Apply Aggregations and Window Functions
-- Objective: Use SQL aggregation and window functions to analyze data.

-- Instruction 1:
-- Write a query to find the total number of bookings made by each user,
-- using the COUNT function and GROUP BY clause.
SELECT
    u.id AS user_id,
    u.username,
    COUNT(b.booking_id) AS total_bookings_made
FROM
    users AS u
JOIN
    bookings AS b ON u.id = b.user_id
GROUP BY
    u.id, u.username -- Group by both ID and username to ensure unique user rows
ORDER BY
    total_bookings_made DESC, u.username ASC; -- Order for readability

-- Instruction 2:
-- Use a window function (ROW_NUMBER, RANK) to rank properties based on the total number of bookings they have received.
SELECT
    p.id AS property_id,
    p.property_name,
    COUNT(b.booking_id) AS total_bookings_received,
    RANK() OVER (ORDER BY COUNT(b.booking_id) DESC) AS booking_rank
FROM
    properties AS p
JOIN
    bookings AS b ON p.id = b.property_id
GROUP BY
    p.id, p.property_name -- Group by property details to count bookings per property
ORDER BY
    booking_rank ASC, total_bookings_received DESC, p.property_name ASC; -- Order for clarity of rank
