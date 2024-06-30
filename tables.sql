-- Database: hotel_management

-- DROP DATABASE IF EXISTS hotel_management;

CREATE DATABASE hotel_management
    WITH
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'English_India.1252'
    LC_CTYPE = 'English_India.1252'
    LOCALE_PROVIDER = 'libc'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1
    IS_TEMPLATE = False;


CREATE DATABASE hotel_management;

USE hotel_management;

CREATE TABLE Register (
   Customer_ID INT PRIMARY KEY,
   Customer_Name VARCHAR(30),
   Customer_PhoneNo BIGINT,
   Customer_Email VARCHAR(30),
   Customer_Address VARCHAR(50)
);




CREATE TABLE Rooms (
    room_number INT PRIMARY KEY,
    room_type VARCHAR(50),
    rate DECIMAL(10, 2),
    availability BOOLEAN,
    No_of_people int
);



CREATE TABLE ThirdPartyBookings (
    booking_id INT PRIMARY KEY,
    Customer_name VARCHAR(30),
    Customer_email VARCHAR(30),
    room_number INT,
    check_in_date DATE,
    check_out_date DATE,
    booking_date DATE,
    FOREIGN KEY (room_number) REFERENCES Rooms(room_number)
);

CREATE TABLE Reservations (
    reservation_id INT PRIMARY KEY,
    Customer_ID INT,
    room_number INT,
    check_in_date DATE,
    check_out_date DATE,
    FOREIGN KEY (Customer_ID) REFERENCES Register(Customer_ID),
    FOREIGN KEY (room_number) REFERENCES Rooms(room_number)
);


CREATE TABLE RoomTypes (
    room_type_id INT PRIMARY KEY,
    type_name VARCHAR(50),
    description TEXT
);


CREATE TABLE Employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(100),
    position VARCHAR(100),
    salary DECIMAL(10, 2)
);


CREATE TABLE Services (
    service_id INT PRIMARY KEY,
    service_name VARCHAR(100),
    price DECIMAL(10, 2)
);


CREATE TABLE RoomServiceOrders (
    order_id INT PRIMARY KEY,
    Customer_ID INT,
    service_id INT,
    order_date DATE,
    quantity INT,
    FOREIGN KEY (Customer_ID) REFERENCES Register(Customer_ID),
    FOREIGN KEY (service_id) REFERENCES Services(service_id)
);


CREATE TABLE Billing (
    bill_id INT PRIMARY KEY ,
    Customer_ID INT,
    total_amount DECIMAL(10, 2),
    payment_status VARCHAR(50),
    FOREIGN KEY (Customer_ID) REFERENCES Register(Customer_ID)
);

CREATE TABLE Feedback (
    feedback_id INT PRIMARY KEY ,
    Customer_ID INT,
    feedback_text TEXT,
    rating INT,
    FOREIGN KEY (Customer_ID) REFERENCES Register(Customer_ID)
);


CREATE TABLE HotelFacilities (
    facility_id INT PRIMARY KEY ,
    facility_name VARCHAR(100),
    description TEXT
);


