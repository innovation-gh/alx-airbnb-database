This repository is part of the ALX Airbnb Database Module, focusing on advanced SQL querying and optimization techniques. Within this module, we delve into complex SQL scripts, indexing, partitioning, and performance tuning to handle large datasets efficiently.

The `databaseadvscript` directory specifically houses solutions for implementing these advanced concepts, starting with complex join queries.

 Table of Contents

1.  Project Overview
2.  Learning Objectives
3.  Directory Structure
4.  Task 0: Complex Queries with Joins
5.  Setup and Usage
6.  Contact Information



 1. Project Overview

This project aims to equip professional developers with practical, handson experience in advanced database management. We simulate an Airbnb database to tackle realworld challenges such as optimizing query performance, designing efficient schemas, and handling scalability for highvolume applications.



 2. Learning Objectives

By the end of this project, participants will be able to:

   Master Advanced SQL: Write sophisticated queries using joins, subqueries, and aggregations for indepth data retrieval and analysis.
   Optimize Query Performance: Analyze and refactor SQL scripts using performance tools like `EXPLAIN` and `ANALYZE`.
   Implement Indexing and Partitioning: Apply indexing and table partitioning strategies to enhance database performance for large datasets.
   Monitor and Refine Performance: Continuously monitor database health and propose/implement schema and query refinements.
   Think Like a DBA: Develop datadriven decisionmaking skills for schema design and optimization in highperformance environments.



 3. Directory Structure

```
alxairbnbdatabase/
├── databaseadvscript/
│   ├── joins_queries.sql
│   └── README.md
└── (other project directories/files will go here)
```



 4. Task 0: Complex Queries with Joins

Objective: To demonstrate mastery of SQL joins by writing complex queries using `INNER JOIN`, `LEFT JOIN`, and `FULL OUTER JOIN` (or its equivalent).

File: `joins_queries.sql`

This file contains the SQL queries addressing the following requirements:

1.  `INNER JOIN`: Retrieve all bookings and the respective users who made those bookings. This query shows only records where there's a match in both `bookings` and `users` tables.
2.  `LEFT JOIN`: Retrieve all properties and their reviews, including properties that have no reviews. This query returns all properties, with matching review data if available, otherwise `NULL` for review columns.
3.  `FULL OUTER JOIN`: Retrieve all users and all bookings, even if the user has no booking or a booking is not linked to a user.
       Note: For MySQL users, a `FULL OUTER JOIN` is emulated using a `UNION ALL` of a `LEFT JOIN` and a `RIGHT JOIN`. The SQL script provides this emulation for broader compatibility.



 5. Setup and Usage

To use the queries in this repository:

1.  Clone the Repository:
    ```bash
    git clone https://github.com/innovationgh/alxairbnbdatabase.git
    ```
2.  Navigate to the Directory:
    ```bash
    cd alxairbnbdatabase/databaseadvscript
    ```
3.  Database Connection: Ensure you have a running SQL database (e.g., MySQL, PostgreSQL) and a schema that resembles the Airbnb database structure (tables like `users`, `properties`, `bookings`, `reviews` with appropriate primary and foreign keys).
4.  Execute Queries: Connect to your database using a client tool (e.g., MySQL Workbench, DBeaver, `psql` command line) and run the SQL statements from `joins_queries.sql`.




Okay, let's move on to the next task: "1. Practice Subqueries".

This task focuses on using both non-correlated and correlated subqueries, which is a great step up in complexity.

Objective: Write both correlated and non-correlated subqueries.

Instructions Breakdown:

Write a query to find all properties where the average rating is greater than 4.0 using a subquery.

Type: This will likely be a non-correlated subquery. The subquery calculates the average rating for properties independently and then the outer query uses that result.

Concept: You'll need to group reviews by property, calculate their average, and then filter based on that average.

Tables: properties and reviews.

Write a correlated subquery to find users who have made more than 3 bookings.

Type: This must be a correlated subquery. The inner subquery will depend on the outer query's current row (i.e., it will reference the user_id from the outer users table).

Concept: For each user, count their bookings. If the count is greater than 3, include that user.

Tables: users and bookings.

Assumptions about your database schema (reiterated/refined):

properties table: id (PK), property_name, ...

reviews table: property_id (FK to properties.id), rating (e.g., INT or DECIMAL), user_id (FK to users.id), ...

users table: id (PK), username, email, ...

bookings table: user_id (FK to users.id), booking_id (PK), ...

Here are the SQL queries for your subqueries.sql file:

SQL

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

Explanation of the Queries:

Non-Correlated Subquery (Average Rating > 4.0):

Inner Subquery:

SELECT r.property_id FROM reviews AS r GROUP BY r.property_id HAVING AVG(r.rating) > 4.0

This subquery runs independently. It groups all reviews by property_id, calculates the AVG(rating) for each property, and then filters to include only those property_ids whose average rating is greater than 4.0.

It returns a list of property_ids.

Outer Query:

SELECT p.id AS property_id, p.property_name FROM properties AS p WHERE p.id IN (...)

This query selects the id and property_name from the properties table.

WHERE p.id IN (...): It then filters these properties to include only those whose id is present in the list returned by the inner subquery.

Correlated Subquery (Users with > 3 Bookings):

Outer Query: SELECT u.id AS user_id, u.username, u.email FROM users AS u WHERE (...)

This query iterates through each row of the users table. For each user (u), the subquery is executed.

Inner Subquery: SELECT COUNT(b.booking_id) FROM bookings AS b WHERE b.user_id = u.id

This subquery is "correlated" because of b.user_id = u.id. For the current user (u) being processed by the outer query, this inner subquery counts how many bookings (b) are associated with that specific user.id.

It returns a single count for each user.

WHERE (...) > 3: The outer query then filters the users, keeping only those for whom the count of bookings returned by the subquery is greater than 3.


Explanation of the Queries:

Total Bookings by Each User (Aggregation):

We JOIN the users table with the bookings table on user_id to link users to their bookings.

COUNT(b.booking_id) counts the number of bookings.

GROUP BY u.id, u.username ensures that the COUNT is performed for each unique user. Including username in GROUP BY is good practice when selecting it, even if id is unique.

ORDER BY total_bookings_made DESC sorts the results to show users with the most bookings first.

Rank Properties by Total Bookings (Window Function):

First, we perform an implicit aggregation by JOINing properties and bookings and then GROUP BY p.id, p.property_name. This gives us COUNT(b.booking_id) which represents the total_bookings_received for each property.

RANK() OVER (ORDER BY COUNT(b.booking_id) DESC) is the window function:

RANK() assigns a rank to each row within the result set. If two or more properties have the same total_bookings_received, they will receive the same rank, and the next rank will skip numbers (e.g., 1, 1, 3).

OVER (ORDER BY COUNT(b.booking_id) DESC) specifies that the ranking should be based on the total_bookings_received in descending order (highest bookings get rank 1).

The outer ORDER BY ensures the final result set is presented clearly, ordered by rank, then by booking count, and finally by property name for ties.


alx-airbnb-database/
└── database-adv-script/
    ├── perfomance.sql
    └── optimization_report.md
git add perfomance.sql optimization_report.md
git commit -m "Add complex query optimization with EXPLAIN ANALYZE"
git push


Initial Analysis
EXPLAIN Plan Summary:
[Paste here the key points of the EXPLAIN plan, e.g., table scans, join types, indexes used]

Profiling Results (Before Optimization):
Execution time: XX ms
CPU usage: XX%
Other relevant metrics...

Identified Bottlenecks
No index on bookings.user_id causing full table scan

Join on payments.payment_id inefficient due to missing index

etc.

Optimization Suggestions
Add index on bookings.user_id

Add index on payments.payment_id

Consider partitioning bookings by start_date if large

Implementation
sql
Copy
Edit
CREATE INDEX idx_booking_user_id ON bookings(user_id);
CREATE INDEX idx_payment_payment_id ON payments(payment_id);
Post-Optimization Results
EXPLAIN Plan Summary:
[Updated explain output showing index usage, faster join]

Profiling Results (After Optimization):
Execution time reduced to XX ms (YY% improvement)
CPU usage reduced
Other metrics...

Query 2: Properties with High Ratings
Query Text
sql
Copy
Edit
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
Initial Analysis
EXPLAIN Plan Summary:
[Explain details here]

Profiling Results (Before Optimization):
Execution time: XX ms
Other relevant metrics...

Identified Bottlenecks
Subquery in WHERE IN causing multiple scans on reviews

Missing index on reviews.property_id

Optimization Suggestions
Add index on reviews.property_id

Rewrite query using JOIN instead of IN

Implementation
sql
Copy
Edit
CREATE INDEX idx_reviews_property_id ON reviews(property_id);
Alternative query rewrite:

sql
Copy
Edit
SELECT DISTINCT p.id, p.property_name
FROM properties p
JOIN reviews r ON p.id = r.property_id
GROUP BY p.id, p.property_name
HAVING AVG(r.rating) > 4.0;
Post-Optimization Results
EXPLAIN Plan Summary:
[Updated plan showing better index usage]

Profiling Results (After Optimization):
Execution time reduced to XX ms
Other metrics...

Summary and Recommendations
Indexes added improved query performance by approximately XX% across tested queries.

Avoid subqueries in WHERE IN clauses when possible; JOINs tend to perform better.

Consider partitioning very large tables by date or other logical keys.

Establish a regular query profiling and indexing review process to maintain optimal performance.

 6. Contact Information

For any questions or collaborations, feel free to reach out:

   GitHub: [innovationgh](https://www.google.com/search?q=https://github.com/innovationgh)
   Email: destinyfelix823@gmail.com
   Phone: +233596523065

