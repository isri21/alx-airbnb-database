-- Write a query using an INNER JOIN to retrieve all bookings and the respective users who made those bookings.
SELECT * FROM users u
INNER JOIN bookings b
ON u.id = b.user_id;

-- Write a query using aLEFT JOIN to retrieve all properties and their reviews, including properties that have no reviews
SELECT * FROM properties p
LEFT JOIN reviews r
ON p.id = r.property_id
ORDER BY p.id;

-- Write a query using a FULL OUTER JOIN to retrieve all users and all bookings, even if the user has no booking or a booking is not linked to a user
SELECT * FROM users u
FULL OUTER JOIN bookings b 
ON u.id = b.user_id;