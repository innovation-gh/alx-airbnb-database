# Index Performance Report

## Objective
To improve the performance of frequent queries in the Airbnb clone database by creating indexes on high-usage columns in the `users`, `bookings`, and `properties` tables.

---

## Indexed Columns and Justification

| Table      | Column(s)                     | Reason                                |
|------------|-------------------------------|----------------------------------------|
| users      | id, username                  | Used in JOINs and ORDER BY clauses     |
| bookings   | user_id, property_id, start_date, end_date | Used in JOINs and filtering        |
| properties | id, property_name             | Used in JOINs and sorting              |

---

## Performance Comparison Using EXPLAIN

### Example Query (Before Index)
```sql
SELECT u.username, COUNT(b.booking_id)
FROM users AS u
JOIN bookings AS b ON u.id = b.user_id
GROUP BY u.username
ORDER BY u.username;
