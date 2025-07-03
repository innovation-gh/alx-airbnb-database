# Database Performance Monitoring and Refinement Report

## Overview

This report documents the continuous monitoring and refinement of database query performance for the ALX Airbnb project.  
We analyze query execution plans and profiling outputs, identify bottlenecks, apply schema improvements such as indexing, and measure the resulting performance gains.

---

## Query 1: Comprehensive Booking Details Retrieval

### Query Text

```sql
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
    p.host_id,
    pay.payment_id,
    pay.amount AS payment_amount,
    pay.payment_date,
    pay.status AS payment_status
FROM
    bookings AS b
INNER JOIN
    users AS u ON b.user_id = u.id
INNER JOIN
    properties AS p ON b.property_id = p.id
INNER JOIN
    payments AS pay ON b.payment_id = pay.payment_id;
