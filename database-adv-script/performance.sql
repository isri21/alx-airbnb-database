-- Write an initial query that retrieves all bookings along with the user details, property details, and payment details
SELECT b.booking_id, b.start_date, b.total_price, u.name, u.email, p.title,
    p.location, pay.amount, pay.payment_date
FROM Bookings b
INNER JOIN Users u ON b.user_id = u.user_id
INNER JOIN Properties p ON b.property_id = p.property_id
LEFT JOIN Payments pay ON b.booking_id = pay.booking_id
WHERE b.start_date >= '2025-01-01';

-- Analyze the query’s performance using EXPLAIN and identify any inefficiencies.
EXPLAIN ANALYZE
SELECT b.booking_id, b.start_date, b.total_price, u.name, u.email, p.title,
    p.location, pay.amount, pay.payment_date
FROM Bookings b
INNER JOIN Users u ON b.user_id = u.user_id
INNER JOIN Properties p ON b.property_id = p.property_id
LEFT JOIN Payments pay ON b.booking_id = pay.booking_id
WHERE b.start_date >= '2025-01-01';

-- Refactor the query to reduce execution time, such as reducing unnecessary joins or using indexing.
SELECT b.booking_id, b.start_date, b.total_price, u.name, u.email, p.title,
    p.location, pay.amount, pay.payment_date
FROM Bookings b
INNER JOIN Users u ON b.user_id = u.user_id
INNER JOIN Properties p ON b.property_id = p.property_id
LEFT JOIN Payments pay ON b.booking_id = pay.booking_id
WHERE b.start_date >= '2025-01-01'
  AND b.booking_id IN (
      SELECT booking_id
      FROM Bookings
      WHERE start_date >= '2025-01-01'
  );