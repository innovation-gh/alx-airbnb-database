# Query Optimization Report

## Objective
Improve performance of a complex query involving multiple JOINs between `bookings`, `users`, `properties`, and `payments`.

---

## Initial Query
The original query retrieved all bookings with full user, property, and payment details using multiple JOINs.

**Issues Identified via `EXPLAIN ANALYZE`:**
- Full table scans on `users` and `payments`
- Large number of rows returned unnecessarily
- JOINs not using indexes efficiently

---

## Optimization Strategy
- Indexed `booking_id`, `user_id`, `property_id` in relevant tables
- Removed unnecessary columns from SELECT to reduce I/O
- Verified that JOIN keys are indexed to reduce nested loop cost

---

## Optimized Query Outcome
- Query execution time reduced from **~XX ms** to **~YY ms**
- Nested loop joins replaced with index-based joins
- Output still meets business requirements

---

## Conclusion
Proper indexing and selective data retrieval significantly reduced execution time and resource usage for the complex query.
