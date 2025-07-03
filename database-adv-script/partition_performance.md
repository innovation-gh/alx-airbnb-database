# Partitioning Performance Report

## Objective
Optimize the performance of queries on the large `bookings` table using table partitioning based on the `start_date` column.

---

## Implementation
The `bookings` table was re-created using MySQL `RANGE` partitioning by `YEAR(start_date)`. Partitions were defined for years 2020 through 2024.

---

## Performance Testing

### Query Used
```sql
SELECT *
FROM bookings
WHERE start_date BETWEEN '2024-01-01' AND '2024-12-31';
