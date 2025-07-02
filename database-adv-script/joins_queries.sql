-- Write a query using an INNER JOIN to retrieve all bookings and the respective users who made those bookings.
select * from users u
join bookings b
on u.id = b.user_id;

-- Write a query using aLEFT JOIN to retrieve all properties and their reviews, including properties that have no reviews
select * from properties p
left join reviews r
on p.id = r.property_id;

-- Write a query using a FULL OUTER JOIN to retrieve all users and all bookings, even if the user has no booking or a booking is not linked to a user
select * from users u
full outer join bookings b 
on u.id = b.user_id;