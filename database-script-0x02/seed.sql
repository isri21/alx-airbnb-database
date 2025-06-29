-- Users
INSERT INTO `User` (user_id, first_name, last_name, email, password_hash, phone_number, role)
VALUES
(UUID(), 'Abebe', 'Kebede', 'abebe@example.com', 'hash1', '0911000001', 'guest'),
(UUID(), 'Saba', 'Mengesha', 'saba@example.com', 'hash2', '0911000002', 'host'),
(UUID(), 'Hana', 'Gebre', 'hana@example.com', 'hash3', '0911000003', 'guest'),
(UUID(), 'Yared', 'Tesfaye', 'yared@example.com', 'hash4', '0911000004', 'host'),
(UUID(), 'Selam', 'Alemu', 'selam@example.com', 'hash5', '0911000005', 'admin');

-- Properties
INSERT INTO Property (property_id, host_id, name, description, location, price_per_night)
VALUES
(UUID(), (SELECT user_id FROM `User` WHERE email = 'saba@example.com'), 'Addis Loft', 'Modern apartment in Bole.', 'Addis Ababa', 85.00),
(UUID(), (SELECT user_id FROM `User` WHERE email = 'yared@example.com'), 'Gondar House', 'Peaceful getaway near castle.', 'Gondar', 65.00),
(UUID(), (SELECT user_id FROM `User` WHERE email = 'saba@example.com'), 'Bahir Dar View', 'Lakefront house.', 'Bahir Dar', 75.00),
(UUID(), (SELECT user_id FROM `User` WHERE email = 'yared@example.com'), 'Lalibela Retreat', 'Near historic churches.', 'Lalibela', 60.00),
(UUID(), (SELECT user_id FROM `User` WHERE email = 'saba@example.com'), 'Hawassa Cottage', 'Lakeside weekend stay.', 'Hawassa', 70.00);

-- Bookings
INSERT INTO Booking (booking_id, property_id, user_id, start_date, end_date, total_price, status)
VALUES
(UUID(), (SELECT property_id FROM Property WHERE name = 'Addis Loft'), (SELECT user_id FROM `User` WHERE email = 'abebe@example.com'), '2025-08-01', '2025-08-03', 170.00, 'confirmed'),
(UUID(), (SELECT property_id FROM Property WHERE name = 'Gondar House'), (SELECT user_id FROM `User` WHERE email = 'hana@example.com'), '2025-09-01', '2025-09-04', 195.00, 'pending'),
(UUID(), (SELECT property_id FROM Property WHERE name = 'Lalibela Retreat'), (SELECT user_id FROM `User` WHERE email = 'abebe@example.com'), '2025-10-10', '2025-10-13', 180.00, 'confirmed'),
(UUID(), (SELECT property_id FROM Property WHERE name = 'Bahir Dar View'), (SELECT user_id FROM `User` WHERE email = 'hana@example.com'), '2025-11-01', '2025-11-03', 150.00, 'confirmed'),
(UUID(), (SELECT property_id FROM Property WHERE name = 'Hawassa Cottage'), (SELECT user_id FROM `User` WHERE email = 'abebe@example.com'), '2025-12-20', '2025-12-23', 210.00, 'canceled');

-- Payments
INSERT INTO Payment (payment_id, booking_id, amount, payment_method)
VALUES
(UUID(), (SELECT booking_id FROM Booking WHERE total_price = 170.00), 170.00, 'credit_card'),
(UUID(), (SELECT booking_id FROM Booking WHERE total_price = 195.00), 195.00, 'paypal'),
(UUID(), (SELECT booking_id FROM Booking WHERE total_price = 180.00), 180.00, 'stripe'),
(UUID(), (SELECT booking_id FROM Booking WHERE total_price = 150.00), 150.00, 'credit_card'),
(UUID(), (SELECT booking_id FROM Booking WHERE total_price = 210.00), 210.00, 'paypal');

-- Reviews
INSERT INTO Review (review_id, property_id, user_id, rating, comment)
VALUES
(UUID(), (SELECT property_id FROM Property WHERE name = 'Addis Loft'), (SELECT user_id FROM `User` WHERE email = 'abebe@example.com'), 5, 'Beautiful and clean!'),
(UUID(), (SELECT property_id FROM Property WHERE name = 'Gondar House'), (SELECT user_id FROM `User` WHERE email = 'hana@example.com'), 4, 'Very quiet and relaxing.'),
(UUID(), (SELECT property_id FROM Property WHERE name = 'Lalibela Retreat'), (SELECT user_id FROM `User` WHERE email = 'abebe@example.com'), 5, 'Near the heritage churches.'),
(UUID(), (SELECT property_id FROM Property WHERE name = 'Bahir Dar View'), (SELECT user_id FROM `User` WHERE email = 'hana@example.com'), 5, 'Perfect lake view.'),
(UUID(), (SELECT property_id FROM Property WHERE name = 'Hawassa Cottage'), (SELECT user_id FROM `User` WHERE email = 'abebe@example.com'), 3, 'Nice but noisy neighbors.');

-- Messages
INSERT INTO Message (message_id, sender_id, recipient_id, message_body)
VALUES
(UUID(), (SELECT user_id FROM `User` WHERE email = 'abebe@example.com'), (SELECT user_id FROM `User` WHERE email = 'saba@example.com'), 'Is Addis Loft available for New Year?'),
(UUID(), (SELECT user_id FROM `User` WHERE email = 'hana@example.com'), (SELECT user_id FROM `User` WHERE email = 'yared@example.com'), 'Loved the Gondar place! Thanks.'),
(UUID(), (SELECT user_id FROM `User` WHERE email = 'abebe@example.com'), (SELECT user_id FROM `User` WHERE email = 'saba@example.com'), 'Any discounts for December stays?'),
(UUID(), (SELECT user_id FROM `User` WHERE email = 'hana@example.com'), (SELECT user_id FROM `User` WHERE email = 'saba@example.com'), 'When is the next available weekend?'),
(UUID(), (SELECT user_id FROM `User` WHERE email = 'abebe@example.com'), (SELECT user_id FROM `User` WHERE email = 'selam@example.com'), 'Hello Admin, I had a payment issue.');
