SELECT R.Customer_Name, R.Customer_Email, RS.order_date
FROM Register R
INNER JOIN RoomServiceOrders RS ON R.Customer_ID = RS.Customer_ID;


SELECT R.Customer_Name, R.Customer_Email, RS.order_date
FROM Register R
LEFT JOIN RoomServiceOrders RS ON R.Customer_ID = RS.Customer_ID;


SELECT R.Customer_Name, R.Customer_Email, RS.order_date
FROM Register R
RIGHT JOIN RoomServiceOrders RS ON R.Customer_ID = RS.Customer_ID;


SELECT R.Customer_Name, RS.service_id
FROM Register R
CROSS JOIN RoomServiceOrders RS;


SELECT department, AVG(salary) AS average_salary
FROM employees
GROUP BY department;


SELECT customer_id, COUNT(order_id) AS order_count
FROM orders
GROUP BY customer_id;


SELECT product_category, SUM(sales_amount) AS total_sales
FROM sales
GROUP BY product_category;






