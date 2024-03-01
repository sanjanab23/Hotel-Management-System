SELECT COUNT(Customer_ID) AS Total_Customers FROM Register;

SELECT AVG(rate) AS Average_Rate FROM Rooms;

SELECT MAX(rate) AS Maximum_Rate FROM Rooms;

SELECT MIN(rate) AS Minimum_Rate FROM Rooms;

SELECT COUNT(*) AS Total_Available_Rooms FROM Rooms WHERE availability = TRUE;

SELECT Customer_Name, LENGTH(Customer_Address) AS Address_Length FROM Register;

SELECT NOW() AS Current_Date_Time;

SELECT DATEADD(year, 2, '2024-03-01') AS new_date;

SELECT Customer_Name, DAYOFWEEK(CURDATE()) AS Day_of_Week FROM Register;

SELECT CONCAT(Customer_Name, ' - ', Customer_Email) AS Name_Email FROM Register;


