-- File: subqueries.sql

-- Task 1, Instruction 1:
-- Write a query to find all properties where the average rating is greater than 4.0 using a subquery.
SELECT
    p.id AS property_id,
    p.property_name
FROM
    properties AS p
WHERE
    p.id IN (
        SELECT
            r.property_id
        FROM
            reviews AS r
        GROUP BY
            r.property_id
        HAVING
            AVG(r.rating) > 4.0
    );

-- Task 1, Instruction 2:
-- Write a correlated subquery to find users who have made more than 3 bookings.
SELECT
    u.id AS user_id,
    u.username,
    u.email
FROM
    users AS u
WHERE
    (
        SELECT
            COUNT(b.booking_id)
        FROM
            bookings AS b
        WHERE
            b.user_id = u.id
    ) > 3;
