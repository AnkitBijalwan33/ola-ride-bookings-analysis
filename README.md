# 🚕 Ola Ride Bookings Analysis

An end-to-end data analytics project on 100,000+ real Ola ride bookings — from raw data to SQL business logic to an interactive Power BI dashboard.

---

## 📌 Overview

Ola processes thousands of ride bookings every day, but not every booking turns into a completed ride. Some are cancelled by the customer, some by the driver, and some never find a driver at all.

This project analyzes **103,000+ real ride bookings** to answer one core question:

> **Where exactly is Ola losing rides, and why?**

The project covers the full analyst workflow — structuring raw data, writing SQL to answer business questions, and building a dashboard that turns those answers into something a non-technical stakeholder can actually use.

---

## 🗂️ Dataset

| Detail | Value |
|---|---|
| Records | 103,024 ride bookings |
| Period | July 2024 (Bengaluru) |
| Format | Excel (.xlsx) → loaded into MySQL |
| Fields | Booking status, vehicle type, pickup/drop location, fare, distance, driver & customer ratings, cancellation reason, payment method |

**Key fields used in analysis:**
`Booking_Status`, `Vehicle_Type`, `Booking_Value`, `Ride_Distance`, `Payment_Method`, `Canceled_Rides_by_Customer`, `Canceled_Rides_by_Driver`, `Driver_Ratings`, `Customer_Rating`

---

## 🛠️ Tools

| Tool | Purpose |
|---|---|
| **Excel** | Raw data source (103K+ rows) |
| **MySQL** | Data structuring + SQL business logic |
| **SQL** | 10 views answering real business questions |
| **Power BI** | 5-page interactive dashboard |
| **DAX** | Calculated measures (KPIs, ratios) |

---

## 🔎 Steps

1. **Load & structure the data**
   Raw booking data was loaded into a MySQL database (`ola`) with a defined schema (`Bookings` table), handling nulls and inconsistent types (e.g., TAT fields stored as `VARCHAR` to safely handle blank values).

2. **Write SQL views for business questions**
   Built 10 SQL views in MySQL, including:
   - Successful bookings
   - Average ride distance by vehicle type
   - Cancelled rides by customer / by driver
   - Top 5 customers by ride count
   - Max/min driver ratings by vehicle type
   - Revenue from successful rides
   - Average customer rating by vehicle type
   - Incomplete rides with reasons

   *(Full queries in [`ola_sql_queries.sql`](./ola_sql_queries.sql))*

3. **Build the Power BI dashboard**
   Connected Power BI to the dataset and built a 5-page report: **Overall, Vehicle Type, Revenue, Cancellation, Ratings** — using DAX measures for KPIs like total bookings, success rate, and cancellation breakdowns.

4. **Document findings**
   Summarized results into business-readable insights (see below) and packaged the project for sharing (LinkedIn carousel + presentation deck).

---

## 📊 Dashboard

The Power BI dashboard has 5 pages:

| Page | What it shows |
|---|---|
| **Overall** | Total bookings, total booking value, booking status breakdown, ride volume over time |
| **Vehicle Type** | Total & success booking value, average and total distance per vehicle type |
| **Revenue** | Revenue by payment method, top 5 customers by booking value |
| **Cancellation** | Cancellation reasons split by customer and by driver |
| **Ratings** | Average driver and customer ratings per vehicle type |

🖼️ Dashboard screenshots: [`Ola_Dashboard_Raw_Screenshots.pptx`](./Ola_Dashboard_Raw_Screenshots.pptx)
📽️ Full project presentation (problem, approach, dashboard, findings): [`Ola_Ride_Bookings_Analysis.pptx`](./Ola_Ride_Bookings_Analysis.pptx)

---

## ✅ Results

1. **62% of bookings succeed** — the remaining 38% are lost almost equally to driver cancellations, customer cancellations, and unmatched drivers.
2. **No single vehicle type drives the business** — revenue and booking value are balanced across Sedan, SUV, Auto, Bike, and E-Bike.
3. **Cancellations have two different root causes** — customers cancel mainly when the driver isn't approaching them; drivers cancel mainly over personal or vehicle issues. These need two separate fixes, not one policy.
4. **Service quality is consistent** — driver and customer ratings hold steady around 4.0/5 across every vehicle type, meaning the completion problem is operational, not a customer experience problem.

---

## ▶️ How to Run

1. **Set up the database**
   ```sql
   CREATE DATABASE ola;
   USE ola;
   ```
   Run the schema + queries in [`ola_sql_queries.sql`](./ola_sql_queries.sql).

2. **Load the data**
   Import `Bookings-100000-Rows.xlsx` (converted to CSV) into the `Bookings` table using `LOAD DATA LOCAL INFILE` (see script for exact syntax).

3. **Explore the SQL views**
   Each view in the script answers a specific business question — run them individually to inspect results.

4. **View the dashboard**
   Open [`Ola_Ride_Bookings_Analysis.pptx`](./Ola_Ride_Bookings_Analysis.pptx) for the full walkthrough (problem, approach, dashboard pages, findings), or [`Ola_Dashboard_Raw_Screenshots.pptx`](./Ola_Dashboard_Raw_Screenshots.pptx) for the raw dashboard pages only.

---

## 📬 Contact

I'm currently looking for **Data Analyst** roles. Feel free to explore the project, raise an issue, or connect with me if you'd like to discuss it further.
