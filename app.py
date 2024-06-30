import streamlit as st
import psycopg2
from contextlib import closing

# Database connection configuration
config = {
    'user': 'postgres', 
    'password': 'root', 
    'host': 'localhost',
    'port': 5432,
    'database': 'hotel_management'
}

def create_connection():
    """Create a connection to the PostgreSQL database."""
    try:
        db = psycopg2.connect(**config)
    except psycopg2.OperationalError as e:
        if "database \"hotel_management\" does not exist" in str(e):
            db = psycopg2.connect(user=config['user'], password=config['password'], host=config['host'], port=config['port'])
            create_database(db)
            db.close()
            db = psycopg2.connect(**config)
    return db

def create_database(db):
    """Create the 'hotel_management' database if it doesn't exist."""
    cursor = db.cursor()
    cursor.execute("CREATE DATABASE hotel_management")
    cursor.close()
    db.commit()

# Function to fetch data
def fetch_data(query):
    with closing(create_connection()) as conn:
        with conn.cursor() as cursor:
            cursor.execute(query)
            return cursor.fetchall()

# Function to insert data
def insert_data(query, data):
    with closing(create_connection()) as conn:
        with conn.cursor() as cursor:
            cursor.execute(query, data)
            conn.commit()


def home_page():
    st.title("Hotel Management System")
    st.markdown(
        """
        Welcome to the Hotel Management System! This application allows you to manage various aspects
        of a hotel including customer registration, room management, bookings, billing, feedback, and more.

        Use the navigation bar on the left to explore different sections of the application.

        """
    )

    

    st.markdown(
        """
        ### About Hotel Management System

        The Hotel Management System helps hoteliers streamline operations and enhance guest experience 
        by managing reservations, room service, billing, and customer feedback efficiently. It provides 
        a centralized platform for managing all hotel-related activities.

        """
    )

    st.markdown("---")

    st.header("Features")
    st.markdown(
        """
        - **Customer Registration:** Register new customers with their details.
        - **Room Management:** Add, view, and manage room details including availability and rates.
        - **Bookings:** Manage both direct and third-party bookings.
        - **Billing:** Track and manage billing details and payment status.
        - **Feedback:** Collect and analyze customer feedback to improve services.
        - **Employee Management:** Manage staff details and roles.
        - **Service Orders:** Handle room service orders and track service usage.
        - **Hotel Facilities:** List and describe hotel amenities and facilities.

        """
    )

   
# Function to display Customer Register page
def register_page():
    st.header("Customer Register")
    if st.button("View Register"):
        customers = fetch_data("SELECT * FROM Register")
        for customer in customers:
            st.write(customer)

    with st.form("customer_form"):
        Customer_ID = st.number_input("Customer ID", min_value=1, step=1)
        Customer_Name = st.text_input("Customer Name")
        Customer_PhoneNo = st.text_input("Customer Phone Number")
        Customer_Email = st.text_input("Customer Email")
        Customer_Address = st.text_input("Customer Address")
        submit_button = st.form_submit_button(label="Add Customer")

        if submit_button:
            query = """
            INSERT INTO Register (Customer_ID, Customer_Name, Customer_PhoneNo, Customer_Email, Customer_Address)
            VALUES (%s, %s, %s, %s, %s)
            """
            data = (Customer_ID, Customer_Name, Customer_PhoneNo, Customer_Email, Customer_Address)
            insert_data(query, data)
            st.success("Customer added successfully")

# Function to display Room List page
def rooms_page():
    st.header("Room List")
    if st.button("View Rooms"):
        rooms = fetch_data("SELECT * FROM Rooms")
        for room in rooms:
            st.write(room)

    with st.form("room_form"):
        room_number = st.number_input("Room Number", min_value=1, step=1)
        room_type = st.text_input("Room Type")
        rate = st.number_input("Rate", min_value=0.0, step=0.01)
        availability = st.selectbox("Availability", [True, False])
        No_of_people = st.number_input("Number of People", min_value=1, step=1)
        submit_button = st.form_submit_button(label="Add Room")

        if submit_button:
            query = """
            INSERT INTO Rooms (room_number, room_type, rate, availability, No_of_people)
            VALUES (%s, %s, %s, %s, %s)
            """
            data = (room_number, room_type, rate, availability, No_of_people)
            insert_data(query, data)
            st.success("Room added successfully")

# Function to display Third Party Bookings page
def third_party_bookings_page():
    st.header("Third Party Bookings")
    if st.button("View Third Party Bookings"):
        bookings = fetch_data("SELECT * FROM ThirdPartyBookings")
        for booking in bookings:
            st.write(booking)

    with st.form("third_party_booking_form"):
        Customer_name = st.text_input("Customer Name")
        Customer_email = st.text_input("Customer Email")
        room_number = st.number_input("Room Number", min_value=1, step=1)
        check_in_date = st.date_input("Check-in Date")
        check_out_date = st.date_input("Check-out Date")
        booking_date = st.date_input("Booking Date")
        submit_button = st.form_submit_button(label="Add Booking")

        if submit_button:
            query = """
            INSERT INTO ThirdPartyBookings (Customer_name, Customer_email, room_number, check_in_date, check_out_date, booking_date)
            VALUES (%s, %s, %s, %s, %s, %s)
            """
            data = (Customer_name, Customer_email, room_number, check_in_date, check_out_date, booking_date)
            insert_data(query, data)
            st.success("Booking added successfully")

# Function to display Reservations page
def reservations_page():
    st.header("Reservations")
    if st.button("View Reservations"):
        reservations = fetch_data("SELECT * FROM Reservations")
        for reservation in reservations:
            st.write(reservation)

    with st.form("reservation_form"):
        Customer_ID = st.number_input("Customer ID", min_value=1, step=1)
        room_number = st.number_input("Room Number", min_value=1, step=1)
        check_in_date = st.date_input("Check-in Date")
        check_out_date = st.date_input("Check-out Date")
        submit_button = st.form_submit_button(label="Add Reservation")

        if submit_button:
            query = """
            INSERT INTO Reservations (Customer_ID, room_number, check_in_date, check_out_date)
            VALUES (%s, %s, %s, %s)
            """
            data = (Customer_ID, room_number, check_in_date, check_out_date)
            insert_data(query, data)
            st.success("Reservation added successfully")

# Function to display Room Types page
def room_types_page():
    st.header("Room Types")
    if st.button("View Room Types"):
        room_types = fetch_data("SELECT * FROM RoomTypes")
        for room_type in room_types:
            st.write(room_type)

    with st.form("room_type_form"):
        type_name = st.text_input("Type Name")
        description = st.text_area("Description")
        submit_button = st.form_submit_button(label="Add Room Type")

        if submit_button:
            query = """
            INSERT INTO RoomTypes (type_name, description)
            VALUES (%s, %s)
            """
            data = (type_name, description)
            insert_data(query, data)
            st.success("Room Type added successfully")

# Function to display Employees page
def employees_page():
    st.header("Employees")
    if st.button("View Employees"):
        employees = fetch_data("SELECT * FROM Employees")
        for employee in employees:
            st.write(employee)

    with st.form("employee_form"):
        employee_name = st.text_input("Employee Name")
        position = st.text_input("Position")
        salary = st.number_input("Salary", min_value=0.0, step=0.01)
        submit_button = st.form_submit_button(label="Add Employee")

        if submit_button:
            query = """
            INSERT INTO Employees (employee_name, position, salary)
            VALUES (%s, %s, %s)
            """
            data = (employee_name, position, salary)
            insert_data(query, data)
            st.success("Employee added successfully")

# Function to display Services page
def services_page():
    st.header("Services")
    if st.button("View Services"):
        services = fetch_data("SELECT * FROM Services")
        for service in services:
            st.write(service)

    with st.form("service_form"):
        service_name = st.text_input("Service Name")
        price = st.number_input("Price", min_value=0.0, step=0.01)
        submit_button = st.form_submit_button(label="Add Service")

        if submit_button:
            query = """
            INSERT INTO Services (service_name, price)
            VALUES (%s, %s)
            """
            data = (service_name, price)
            insert_data(query, data)
            st.success("Service added successfully")

# Function to display Room Service Orders page
def room_service_orders_page():
    st.header("Room Service Orders")
    if st.button("View Room Service Orders"):
        orders = fetch_data("SELECT * FROM RoomServiceOrders")
        for order in orders:
            st.write(order)

    with st.form("room_service_order_form"):
        Customer_ID = st.number_input("Customer ID", min_value=1, step=1)
        service_id = st.number_input("Service ID", min_value=1, step=1)
        order_date = st.date_input("Order Date")
        quantity = st.number_input("Quantity", min_value=1, step=1)
        submit_button = st.form_submit_button(label="Add Room Service Order")

        if submit_button:
            query = """
            INSERT INTO RoomServiceOrders (Customer_ID, service_id, order_date, quantity)
            VALUES (%s, %s, %s, %s)
            """
            data = (Customer_ID, service_id, order_date, quantity)
            insert_data(query, data)
            st.success("Room Service Order added successfully")

# Function to display Billing page
def billing_page():
    st.header("Billing")
    if st.button("View Billing"):
        bills = fetch_data("SELECT * FROM Billing")
        for bill in bills:
            st.write(bill)

    with st.form("billing_form"):
        Customer_ID = st.number_input("Customer ID", min_value=1, step=1)
        total_amount = st.number_input("Total Amount", min_value=0.0, step=0.01)
        payment_status = st.text_input("Payment Status")
        submit_button = st.form_submit_button(label="Add Bill")

        if submit_button:
            query = """
            INSERT INTO Billing (Customer_ID, total_amount, payment_status)
            VALUES (%s, %s, %s)
            """
            data = (Customer_ID, total_amount, payment_status)
            insert_data(query, data)
            st.success("Bill added successfully")

# Function to display Feedback page
def feedback_page():
    st.header("Feedback")
    if st.button("View Feedback"):
        feedbacks = fetch_data("SELECT * FROM Feedback")
        for feedback in feedbacks:
            st.write(feedback)

    with st.form("feedback_form"):
        Customer_ID = st.number_input("Customer ID", min_value=1, step=1)
        feedback_text = st.text_area("Feedback Text")
        rating = st.number_input("Rating", min_value=1, max_value=5, step=1)
        submit_button = st.form_submit_button(label="Add Feedback")

        if submit_button:
            query = """
            INSERT INTO Feedback (Customer_ID, feedback_text, rating)
            VALUES (%s, %s, %s)
            """
            data = (Customer_ID, feedback_text, rating)
            insert_data(query, data)
            st.success("Feedback added successfully")

# Function to display Hotel Facilities page
def hotel_facilities_page():
    st.header("Hotel Facilities")
    if st.button("View Hotel Facilities"):
        facilities = fetch_data("SELECT * FROM HotelFacilities")
        for facility in facilities:
            st.write(facility)

    with st.form("facility_form"):
        facility_name = st.text_input("Facility Name")
        description = st.text_area("Description")
        submit_button = st.form_submit_button(label="Add Facility")

        if submit_button:
            query = """
            INSERT INTO HotelFacilities (facility_name, description)
            VALUES (%s, %s)
            """
            data = (facility_name, description)
            insert_data(query, data)
            st.success("Facility added successfully")

# Streamlit app layout
def main():
    st.sidebar.title("Navigation")
    page = st.sidebar.radio("Go to", ["Home", "Customer Register", "Room List", "Third Party Bookings", "Reservations", "Room Types", "Employees", "Services", "Room Service Orders", "Billing", "Feedback", "Hotel Facilities"])

    if page == "Home":
        home_page()
    elif page == "Customer Register":
        register_page()
    elif page == "Room List":
        rooms_page()
    elif page == "Third Party Bookings":
        third_party_bookings_page()
    elif page == "Reservations":
        reservations_page()
    elif page == "Room Types":
        room_types_page()
    elif page == "Employees":
        employees_page()
    elif page == "Services":
        services_page()
    elif page == "Room Service Orders":
        room_service_orders_page()
    elif page == "Billing":
        billing_page()
    elif page == "Feedback":
        feedback_page()
    elif page == "Hotel Facilities":
        hotel_facilities_page()

if __name__ == '__main__':
    main()
