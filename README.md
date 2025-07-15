# 📚 Bookstore Sales Analytics with SQL & Power BI

This project is a **Bookstore Management & Analytics System** built using **MySQL** for data storage and querying, and **Power BI** for advanced business intelligence reporting. It demonstrates end-to-end data handling — from raw CSV files to insightful dashboards — to provide visibility into sales, customers, and inventory performance.


---

## 🚀 Project Highlights

- ✅ Structured relational database design (Books, Customers, Orders)
- ✅ Cleaned and imported data using SQL (`LOAD DATA INFILE`)
- ✅ 20+ real-world SQL queries — both basic and advanced
- ✅ Interactive Power BI dashboard with key insights
- ✅ Business-ready analytics: Revenue, Top Authors, Genres, Customer Behavior

---

## 🧱 Database Schema Overview

### 📘 BOOKS Table
| Column         | Type           | Description               |
|----------------|----------------|---------------------------|
| `Book_id`      | SERIAL (PK)    | Unique identifier         |
| `Title`        | VARCHAR(100)   | Book title                |
| `Author`       | VARCHAR(100)   | Author name               |
| `Genre`        | VARCHAR(100)   | Genre (e.g., Fiction)     |
| `Published_Year` | INT          | Year of publication       |
| `Price`        | NUMERIC(10,2)  | Price in USD              |
| `Stock`        | INT            | Units in stock            |

### 👥 CUSTOMERS Table
| Column          | Type           | Description               |
|-----------------|----------------|---------------------------|
| `Customer_id`   | SERIAL (PK)    | Unique customer ID        |
| `Name`          | VARCHAR(100)   | Customer name             |
| `Email`         | VARCHAR(100)   | Contact email             |
| `Contact_number`| VARCHAR(15)    | Phone number              |
| `City`          | VARCHAR(100)   | City                      |
| `Country`       | VARCHAR(100)   | Country                   |

### 🧾 ORDERS Table
| Column        | Type            | Description                |
|----------------|----------------|----------------------------|
| `Order_id`     | SERIAL (PK)     | Unique order ID            |
| `Customer_id`  | INT (FK)        | Linked to CUSTOMERS        |
| `Book_id`      | INT (FK)        | Linked to BOOKS            |
| `Order_Date`   | VARCHAR(100)    | Date of order              |
| `Quantity`     | INT             | Number of books ordered    |
| `Total_Amount` | NUMERIC(10,2)   | Total cost (Price x Qty)   |

---

## 🔍 Key SQL Queries

- 🔹 Top-selling genres and authors
- 🔹 Revenue generated over time
- 🔹 Inventory tracking and low stock alerts
- 🔹 Customers with multiple purchases
- 🔹 Books with highest/lowest prices
- 🔹 Country-wise and city-wise customer segmentation

All queries are available in [`Bookstore.sql`](https://github.com/Basu5/End-to-End-Bookstore-Analysis-Using-SQL-and-Power-BI/blob/main/Bookstore.sql) and demonstrate key SQL skills: `JOIN`, `GROUP BY`, `ORDER BY`, subqueries, aggregations, etc.

---

## 📊 Power BI Dashboard

The dashboard provides real-time visual insights, including:

- 💰 Total Revenue & Order Value
- 📈 Sales Trends Over Time
- 🧑‍🤝‍🧑 Top Customers by Spend
- 📚 Most Popular Books & Genres
- 🌍 Customer Distribution by Country
- 📦 Inventory Levels vs. Demand

📁 File: `Bookstore.pbix`  
🛠 Requires [Power BI Desktop](https://powerbi.microsoft.com/) to open and interact.

---

## 📂 How to Run This Project

1. **Clone the repository**
   ```bash
   git clone https://github.com/Basu5/End-to-End-Bookstore-Analysis-Using-SQL-and-Power-BI.git
   cd bookstore-sales-analytics
   ```

2. **Set up MySQL Database**
   - Open MySQL Workbench or any MySQL client
   - Run the SQL script:
     ```
     source Bookstore.sql;
     ```

3. **Place your CSVs** in MySQL’s allowed import directory (usually `Uploads/`).

4. **Launch Power BI**
   - Open `Bookstore.pbix`
   - Click `Refresh` to connect and load updated data

---

## 🧰 Tech Stack

- **MySQL 8.0** — Relational Database Management
- **Power BI** — Business Intelligence & Visualization
- **SQL** — Querying and analysis

---

## 🎯 Why This Project Matters

Whether you're a student, aspiring data analyst, or early-career developer, this project highlights key industry practices:

- ✅ Data modeling and normalization
- ✅ Real-world query building
- ✅ Visual storytelling with BI tools
- ✅ Business-driven KPIs

---



## 📄 License

This project is for educational and personal portfolio use.

---

## 🙋‍♂️ Author

**Your Name**  
[LinkedIn](https://www.linkedin.com/in/basavarajbiradar0/) • [GitHub](https://github.com/Basu5)

---

⭐ If you liked this project, give it a star and feel free to fork it!
