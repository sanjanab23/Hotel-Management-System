CREATE VIEW TotalRoomServiceSpending AS
SELECT r.Customer_ID, r.Customer_Name, SUM(s.price * rs.quantity) AS Total_Spending
FROM Register r
JOIN RoomServiceOrders rs ON r.Customer_ID = rs.Customer_ID
JOIN Services s ON rs.service_id = s.service_id
GROUP BY r.Customer_ID, r.Customer_Name;



CREATE VIEW AvailableRooms AS
SELECT room_number, room_type
FROM Rooms
WHERE availability = TRUE;



CREATE VIEW UnpaidBills AS
SELECT r.Customer_ID, r.Customer_Name, b.total_amount
FROM Register r
LEFT JOIN Billing b ON r.Customer_ID = b.Customer_ID
WHERE b.payment_status <> 'Paid' OR b.payment_status IS NULL;




CREATE VIEW EmployeesByPosition AS
SELECT position, COUNT(*) AS employee_count
FROM Employees
GROUP BY position;


