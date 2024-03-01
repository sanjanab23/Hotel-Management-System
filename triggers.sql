CREATE TRIGGER LogEmployeeActivity
AFTER UPDATE ON Employees
FOR EACH ROW
BEGIN
    INSERT INTO EmployeeActivityLog (employee_id, activity, timestamp)
    VALUES (NEW.employee_id, CONCAT('Updated ', OLD.employee_name, '''s record'), NOW());
END;



CREATE TRIGGER CalculateEmployeeBonus
AFTER UPDATE ON Employees
FOR EACH ROW
BEGIN
    IF NEW.salary > OLD.salary THEN
        DECLARE bonus DECIMAL(10,2);
        SET bonus = (NEW.salary - OLD.salary) * 0.1; 
        UPDATE Employees
        SET salary = NEW.salary + bonus
        WHERE employee_id = NEW.employee_id;
    END IF;
END;



CREATE TRIGGER InsertFeedback
AFTER INSERT ON Reservations
FOR EACH ROW
BEGIN
    INSERT INTO Feedback (Customer_ID, feedback_text, rating)
    VALUES (NEW.Customer_ID, 'Thank you for your reservation!', 5);
END;


CREATE TRIGGER UpdatePaymentStatus
AFTER UPDATE ON Billing
FOR EACH ROW
BEGIN
    IF NEW.payment_status = 'Paid' THEN
        UPDATE Billing
        SET payment_status = NEW.payment_status
        WHERE Customer_ID = NEW.Customer_ID;
    END IF;
END;


CREATE TRIGGER UpdateRoomAvailability
AFTER INSERT ON Reservations
FOR EACH ROW
BEGIN
    UPDATE Rooms
    SET availability = FALSE
    WHERE room_number = NEW.room_number;
END;


