create database ola;
use ola;

CREATE TABLE Bookings (
    Date DATETIME,
    Time TIME,
    Booking_ID VARCHAR(50),
    Booking_Status VARCHAR(50),
    Customer_ID VARCHAR(50),
    Vehicle_Type VARCHAR(50),
    Pickup_Location VARCHAR(100),
    Drop_Location VARCHAR(100),
    V_TAT VARCHAR(50),            -- Null strings handling ke liye varchar rakha hai
    C_TAT VARCHAR(50),
    Canceled_Rides_by_Customer VARCHAR(50),
    Canceled_Rides_by_Driver VARCHAR(100),
    Incomplete_Rides VARCHAR(50),
    Incomplete_Rides_Reason VARCHAR(255),
    Booking_Value INT,
    Payment_Method VARCHAR(50),
    Ride_Distance INT,
    Driver_Ratings VARCHAR(50),
    Customer_Rating VARCHAR(50),
    Vehicle_Images VARCHAR(500)   -- Bada size rakha hai URLs ke liye
);

SET GLOBAL local_infile = 1;

LOAD DATA LOCAL INFILE 'C:/Program Files/MySQL/MySQL Server 8.0/Uploads/Bookings.csv.csv'
INTO TABLE Bookings
FIELDS TERMINATED BY ',' 
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES;

SELECT * FROM bookings limit 1;

# 1. Retrieve all successful bookings:
Create View Successful_bookings As
Select * from Bookings
where Booking_Status ="Success";

# 2. Find the average ride distance for each vehicle type:
Create View Average_ride_distance As
Select Vehicle_Type,Avg(Ride_Distance)
as Average_ride from Bookings
group by Vehicle_Type;

# 3. Get the total number of cancelled rides by customers:
select * from bookings limit 5;
Create View Cancelled_ride_by_customers as
select count(*) from bookings
where Booking_Status="Canceled by Customer";

# 4. List the top 5 customers who booked the highest number of rides:
create view  top_5_customers as
select Customer_id, count(Booking_ID) as total_rides
from bookings
Group by Customer_id
order by total_rides desc limit 5;

# 5. Get the number of rides cancelled by drivers due to personal and car-related issues:
create view rides_cancelled_by_drivers as
select count(*) from bookings
where Canceled_Rides_by_Driver ="Personal & car related issue";

# 6. Find the maximum and minimum driver ratings for Prime Sedan bookings:
create view max_min_driver_ratings as
select max(Driver_Ratings) as max_rating,
min(driver_ratings) as min_rating
from bookings where vehicle_type="Prime Sedan";

# 7. Retrieve all rides where payment was made using UPI:
create view payment_by_upi as
select * from bookings
where Payment_Method="UPI";

# 8. Find the average customer rating per vehicle type:
create view Avg_Customer_Rating as
select vehicle_type,round(avg(Customer_Rating),2) as Avg_customer_rating
from bookings
group by vehicle_type;

# 9. Calculate the total booking value of rides completed successfully:
create view Total_successfully_ride_values as
select sum(Booking_value) as Total_successfully_ride_value
from bookings
where booking_status="Success";

# 10. List all incomplete rides along with the reason:
select * from incomplete_ride_reason;
Create view incomplete_ride_reason as
select Booking_id,Incomplete_Rides_Reason
from bookings
where incomplete_rides="yes"
