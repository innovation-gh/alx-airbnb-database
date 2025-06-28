 Airbnb Database Schema

 Overview

This project contains the database schema for a simplified Airbnbstyle platform. The schema is designed to manage users, properties, bookings, payments, reviews, and messages. It is built with normalization best practices and supports core functionality such as hosting properties, booking stays, sending payments, and communication between users.



 Database Entities

The schema includes the following main entities:

1. Users – Guests, hosts, and admins.
2. Properties – Listings owned by hosts.
3. Bookings – Reservations made by users for properties.
4. Payments – Payment records tied to bookings.
5. Reviews – Feedback left by users for properties.
6. Messages – Conversations between users.

Each table is structured with UUIDs as primary keys and includes relevant constraints, such as foreign keys, uniqueness, and ENUMlike validations.



 Normalization

The schema adheres to Third Normal Form (3NF):
 No repeating groups (1NF)
 All nonkey attributes fully depend on the primary key (2NF)
 No transitive dependencies (3NF)

See [`normalization.md`](./normalization.md) for a detailed breakdown.



 Setup Instructions

1. Create Tables  
   Run the SQL script to create the tables:

   ```bash
   psql -U your_user -d your_database -f schema.sql


Insert Sample Data
Populate the database with test data:

bash
Copy
Edit
psql -U your_user -d your_database -f seed.sql


File Structure
File	Description
schema.sql	SQL script to create all tables with constraints and indexes

seed.sql	SQL script to populate the database with realistic sample data

normalization.md	Detailed explanation of how the schema satisfies 3NF

README.md	Main project documentation

Features Supported
Role-based users (guest, host, admin)

Property hosting and management

Booking system with payment linkage

User reviews and ratings

Direct user-to-user messaging

 Notes
total_price is stored in Bookings for performance reasons but could be calculated dynamically.

ENUM constraints are implemented using CHECK constraints.

UUIDs are used for all primary keys to ensure uniqueness across distributed systems.

📧 Contact
For questions or contributions, please contact: destinyfelix823@gmail.com
