
 Normalization Report: Airbnb Schema to 3NF



 Objective

To evaluate and ensure that the Airbnb database schema adheres to Third Normal Form (3NF) by identifying and eliminating redundancies and transitive dependencies.



 What is 3NF?

A table is in Third Normal Form (3NF) if:

1. It is in Second Normal Form (2NF).
2. It has no transitive dependencies, i.e., non-prime attributes are only dependent on the primary key and nothing else.



 Initial Schema Summary

 1. `User`
- PK: `user_id`
- No partial or transitive dependencies.
- Already in 3NF.

 2. `Property`
- PK: `property_id`, FK: `host_id` (→ `User`)
- No redundancy or dependency issues.
- Already in 3NF.

 3. `Booking`
- PK: `booking_id`, FKs: `user_id`, `property_id`
- `total_price` is calculated but may be necessary for denormalized performance reasons (optional).
- Already in 3NF if `total_price` is stored deliberately.
- Alternative: Move to computed column or view.

 4. `Payment`
- PK: `payment_id`, FK: `booking_id`
- One-to-one relationship, no redundancy.
- Already in 3NF.

 5. `Review`
- PK: `review_id`, FKs: `user_id`, `property_id`
- `rating`, `comment` depend directly on `review_id`.
- Already in 3NF.

 6. `Message`
- PK: `message_id`, FKs: `sender_id`, `recipient_id`
- All attributes directly depend on PK.
- Already in 3NF.



 Summary of Normalization Steps

| Step | Action | Reason |
||--|--|
| 1 | Check for repeating groups | None found (1NF is satisfied) |
| 2 | Eliminate partial dependencies | All PKs are single-column (UUIDs), no composite PKs. (2NF is satisfied) |
| 3 | Eliminate transitive dependencies | All non-key attributes depend only on the primary key in their table. (3NF is satisfied) |
| 4 | Review `total_price` in `Booking` | May be derived: total = `pricepernight × nights`. Keep only if needed for performance. |



 Final Verdict

All tables are in Third Normal Form (3NF).

Only possible improvement:
- Move `total_price` to a computed column or exclude it from the table if performance allows.



 Suggested Improvements (Optional)

| Table | Column | Suggestion |
|-|--||
| `Booking` | `total_price` | Remove and calculate dynamically OR clearly document that it is denormalized for performance. |
| `User` | `role` | Consider moving `role` to a separate table if roles grow in complexity. |
