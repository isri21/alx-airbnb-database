-- Write SQL CREATE INDEX commands to create appropriate indexes for those columns and save them on database_index.sql
CREATE INDEX idx_users_user_id ON Users(user_id);
CREATE INDEX idx_bookings_user_id ON Bookings(user_id);
CREATE INDEX idx_bookings_property_id ON Bookings(property_id);
CREATE INDEX idx_bookings_start_date ON Bookings(start_date);
CREATE INDEX idx_properties_property_id ON Properties(property_id);
CREATE INDEX idx_properties_location ON Properties(location);
CREATE INDEX idx_properties_host_id ON Properties(host_id);

-- Measure the query performance before and after adding indexes using EXPLAIN or ANALYZE.
EXPLAIN ANALYZE
SELECT u.name, p.title, b.start_date, b.total_price
FROM Bookings b
INNER JOIN Users u ON b.user_id = u.user_id
INNER JOIN Properties p ON b.property_id = p.property_id
WHERE b.start_date BETWEEN '2025-01-01' AND '2025-12-31';