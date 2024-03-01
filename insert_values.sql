INSERT INTO Register (Customer_ID, Customer_Name, Customer_PhoneNo, Customer_Email, Customer_Address) VALUES
(1, 'John Doe', 1234567890, 'john.doe@example.com', '123 Main St'),
(2, 'Jane Smith', 9876543210, 'jane.smith@example.com', '456 Elm St'),
(3, 'Alice Johnson', 5551234567, 'alice.johnson@example.com', '789 Oak St'),
(4, 'Bob Brown', 9998887777, 'bob.brown@example.com', '101 Pine St'),
(5, 'Emily Davis', 4445556666, 'emily.davis@example.com', '202 Maple St'),
(6, 'Michael Wilson', 7778889999, 'michael.wilson@example.com', '303 Cedar St'),
(7, 'Samantha Garcia', 6667778888, 'samantha.garcia@example.com', '404 Birch St'),
(8, 'David Martinez', 2223334444, 'david.martinez@example.com', '505 Walnut St'),
(9, 'Jessica Rodriguez', 8889990000, 'jessica.rodriguez@example.com', '606 Pineapple St'),
(10, 'Matthew Lee', 1112223333, 'matthew.lee@example.com', '707 Peach St');



INSERT INTO Rooms (room_number, room_type, rate, availability, No_of_people) VALUES
(101, 'Standard', 100.00, TRUE, 2),
(102, 'Standard', 100.00, TRUE, 2),
(103, 'Standard', 100.00, TRUE, 2),
(104, 'Deluxe', 150.00, TRUE, 4),
(105, 'Deluxe', 150.00, TRUE, 4),
(106, 'Suite', 200.00, TRUE, 6),
(107, 'Suite', 200.00, TRUE, 6),
(108, 'Suite', 200.00, TRUE, 6),
(109, 'Standard', 100.00, TRUE, 2),
(110, 'Standard', 100.00, TRUE, 2);


INSERT INTO ThirdPartyBookings (Customer_name, Customer_email, room_number, check_in_date, check_out_date, booking_date) VALUES
('John Doe', 'john.doe@example.com', 101, '2024-05-01', '2024-05-05', '2024-04-01 08:00:00'),
('Jane Smith', 'jane.smith@example.com', 102, '2024-05-05', '2024-05-10', '2024-04-05 10:00:00'),
('Alice Johnson', 'alice.johnson@example.com', 103, '2024-05-10', '2024-05-15', '2024-04-10 12:00:00'),
('Bob Brown', 'bob.brown@example.com', 104, '2024-05-15', '2024-05-20', '2024-04-15 14:00:00'),
('Emily Davis', 'emily.davis@example.com', 105, '2024-05-20', '2024-05-25', '2024-04-20 16:00:00'),
('Michael Wilson', 'michael.wilson@example.com', 106, '2024-05-25', '2024-05-30', '2024-04-25 18:00:00'),
('Samantha Garcia', 'samantha.garcia@example.com', 107, '2024-05-30', '2024-06-01', '2024-04-30 20:00:00'),
('David Martinez', 'david.martinez@example.com', 108, '2024-06-01', '2024-06-05', '2024-05-01 08:00:00'),
('Jessica Rodriguez', 'jessica.rodriguez@example.com', 109, '2024-06-05', '2024-06-10', '2024-05-05 10:00:00'),
('Matthew Lee', 'matthew.lee@example.com', 110, '2024-06-10', '2024-06-15', '2024-05-10 12:00:00');




INSERT INTO Reservations (Customer_ID, room_number, check_in_date, check_out_date) VALUES
(1, 101, '2024-06-15', '2024-06-20'),
(2, 102, '2024-06-20', '2024-06-25'),
(3, 103, '2024-06-25', '2024-06-30'),
(4, 104, '2024-07-01', '2024-07-05'),
(5, 105, '2024-07-05', '2024-07-10'),
(6, 106, '2024-07-10', '2024-07-15'),
(7, 107, '2024-07-15', '2024-07-20'),
(8, 108, '2024-07-20', '2024-07-25'),
(9, 109, '2024-07-25', '2024-07-30'),
(10, 110, '2024-07-30', '2024-08-05');




INSERT INTO RoomTypes (type_name, description) VALUES
('Standard', 'Standard room with basic amenities'),
('Deluxe', 'Deluxe room with extra amenities'),
('Suite', 'Luxurious suite with premium amenities'),
('Standard', 'Standard room with basic amenities'),
('Deluxe', 'Deluxe room with extra amenities'),
('Suite', 'Luxurious suite with premium amenities'),
('Standard', 'Standard room with basic amenities'),
('Deluxe', 'Deluxe room with extra amenities'),
('Suite', 'Luxurious suite with premium amenities'),
('Standard', 'Standard room with basic amenities');




INSERT INTO Employees (employee_name, position, salary) VALUES
('John Smith', 'Manager', 50000.00),
('Jane Doe', 'Receptionist', 30000.00),
('Michael Johnson', 'Housekeeper', 25000.00),
('Emily Williams', 'Chef', 40000.00),
('David Brown', 'Waiter', 20000.00),
('Jennifer Clark', 'Housekeeper', 25000.00),
('Brian Wilson', 'Chef', 40000.00),
('Natalie King', 'Waitress', 20000.00),
('Justin Scott', 'Receptionist', 30000.00),
('Laura Brown', 'Manager', 50000.00);




INSERT INTO Services (service_name, price) VALUES
('Room Cleaning', 20.00),
('Room Service', 30.00),
('Laundry', 15.00),
('Restaurant', 50.00),
('Spa', 100.00),
('Room Cleaning', 20.00),
('Room Service', 30.00),
('Laundry', 15.00),
('Restaurant', 50.00),
('Spa', 100.00);






INSERT INTO RoomServiceOrders (Customer_ID, service_id, order_date, quantity) VALUES
(1, 1, '2024-08-01 09:00:00', 2),
(2, 2, '2024-08-02 10:00:00', 1),
(3, 3, '2024-08-03 11:00:00', 3),
(4, 4, '2024-08-04 12:00:00', 2),
(5, 5, '2024-08-05 13:00:00', 1),
(6, 1, '2024-08-06 14:00:00', 2),
(7, 2, '2024-08-07 15:00:00', 1),
(8, 3, '2024-08-08 16:00:00', 3),
(9, 4, '2024-08-09 17:00:00', 2),
(10, 5, '2024-08-10 18:00:00', 1);




INSERT INTO Billing (Customer_ID, total_amount, payment_status) VALUES
(1, 250.00, 'Paid'),
(2, 150.00, 'Pending'),
(3, 300.00, 'Paid'),
(4, 200.00, 'Pending'),
(5, 100.00, 'Paid'),
(6, 250.00, 'Paid'),
(7, 150.00, 'Pending'),
(8, 300.00, 'Paid'),
(9, 200.00, 'Pending'),
(10, 100.00, 'Paid');




INSERT INTO Feedback (Customer_ID, feedback_text, rating) VALUES
(1, 'Great service!', 5),
(2, 'Room was clean and comfortable.', 4),
(3, 'Enjoyed the amenities.', 5),
(4, 'Staff was friendly.', 4),
(5, 'Will definitely come back again!', 5),
(6, 'Great service!', 5),
(7, 'Room was clean and comfortable.', 4),
(8, 'Enjoyed the amenities.', 5),
(9, 'Staff was friendly.', 4),
(10, 'Will definitely come back again!', 5);




INSERT INTO HotelFacilities (facility_name, description) VALUES
('Swimming Pool', 'Outdoor pool with sun loungers and poolside bar'),
('Gym', 'Fully equipped fitness center with cardio and very hygenic');
