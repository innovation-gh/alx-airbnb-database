-- File: joins_queries.sql

-- Task 0, Instruction 1:
-- Write a query using an INNER JOIN to retrieve all bookings and the respective users who made those bookings.
SELECT
    b.booking_id,
    b.property_id,
    b.start_date,
    b.end_date,
    b.total_price,
    u.id AS user_id,
    u.username,
    u.email
FROM
    bookings AS b
INNER JOIN
    users AS u ON b.user_id = u.id;


-- Task 0, Instruction 2:
-- Write a query using a LEFT JOIN to retrieve all properties and their reviews, including properties that have no reviews.
SELECT
    p.id AS property_id,
    p.property_name,
    r.review_id,
    r.rating,
    r.comment,
    r.user_id AS reviewer_user_id
FROM
    properties AS p
LEFT JOIN
    reviews AS r ON p.id = r.property_id
ORDER BY
    p.id ASC, r.review_id ASC;


-- Task 0, Instruction 3:
-- Write a query using a FULL OUTER JOIN to retrieve all users and all bookings,
-- even if the user has no booking or a booking is not linked to a user.
-- NOTE: MySQL does not natively support FULL OUTER JOIN.
-- The following emulation using UNION ALL of a LEFT JOIN and a RIGHT JOIN is common for MySQL.

SELECT
    u.id AS user_id,
    u.username,
    b.booking_id,
    b.property_id,
    b.start_date,
    b.end_date,
    b.total_price
FROM
    users AS u
LEFT JOIN
    bookings AS b ON u.id = b.user_id

UNION ALL

SELECT
    u.id AS user_id,
    u.username,
    b.booking_id,
    b.property_id,
    b.start_date,
    b.end_date,
    b.total_price
FROM
    users AS u
RIGHT JOIN
    bookings AS b ON u.id = b.user_id
WHERE
    u.id IS NULL;
