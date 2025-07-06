### Objective 1: Identify high-usage columns in your User, Booking, and Property tables (e.g., columns used in WHERE, JOIN, ORDER BY clauses).
- Users:
	- user_id: Used in joins with Bookings (e.g., Bookings.user_id = Users.user_id) and filtering user-specific data.
- Bookings:
	- user_id: Used in joins with Users and filtering bookings by user.
	- property_id: Used in joins with Properties and filtering bookings by property.
	- start_date: Used in WHERE clauses for date range queries (e.g., start_date >= '2025-01-01').
- Properties:
	- property_id: Used in joins with Bookings and Reviews.
	- location: Used in WHERE or GROUP BY clauses for location-based filtering (e.g., location = 'New York').
	- host_id: Used in joins with Users to find properties by host.

### Objective 2: Write SQL CREATE INDEX commands to create appropriate indexes for those columns and save them on database_index.sql
```sql
CREATE INDEX idx_users_user_id ON Users(user_id);
CREATE INDEX idx_bookings_user_id ON Bookings(user_id);
CREATE INDEX idx_bookings_property_id ON Bookings(property_id);
CREATE INDEX idx_bookings_start_date ON Bookings(start_date);
CREATE INDEX idx_properties_property_id ON Properties(property_id);
CREATE INDEX idx_properties_location ON Properties(location);
CREATE INDEX idx_properties_host_id ON Properties(host_id);
```

### Measure the query performance before and after adding indexes using EXPLAIN or ANALYZE.
The execution time is faster after the indexes