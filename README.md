# 📊 E-Commerce Data Warehouse (SSIS + SQL Server)

## 📌 Project Description

This project demonstrates the design and implementation of an **E-Commerce Data Warehouse** using **Microsoft SQL Server** and **SQL Server Integration Services (SSIS)**.

The system extracts raw transactional data from **Excel files**, transforms it through an **ETL pipeline**, and loads it into a **Galaxy Schema data warehouse** optimized for analytical queries.

The warehouse enables **business intelligence, reporting, and advanced analytics** for sales, customers, products, and payments.

This project simulates a **real-world data engineering workflow**, including:

* Data ingestion
* Data transformation
* Dimensional modeling
* Data warehouse design
* Analytical query support

---

# 🏗 Data Warehouse Architecture

The architecture of this project follows a typical **ETL Data Warehouse pipeline**:

```
Excel Files
     │
     │
     ▼
SSIS ETL Pipeline
(Extract - Transform - Load)
     │
     │
     ▼
SQL Server Data Warehouse
(Galaxy Schema)
     │
     ▼
Analytics / BI / AI
```

### Pipeline Steps

1️⃣ **Extract**

Data is extracted from multiple Excel datasets containing:

* users
* sellers
* products
* orders
* order details
* payments

2️⃣ **Transform**

Using **SSIS transformations**, the data is cleaned and prepared:

* Removing null values
* Mapping columns
* Creating relationships between tables

3️⃣ **Load**

The cleaned data is loaded into the **SQL Server Data Warehouse tables**.

---

# 🌌 Data Warehouse Schema (Galaxy Schema)

This project uses a **Galaxy Schema (Fact Constellation)** design.

Multiple fact tables share common dimension tables, allowing flexible analytics across business processes.

## Fact Tables

* `orders_details`
* `orders`
* `payments`

These tables contain **transactional measures**, such as:

* product price
* shipping cost
* payment value
* order status

## Dimension Tables

* `users`
* `products`
* `sellers`

These provide descriptive attributes such as:

* location
* product category
* seller information

---

# 🖼 Schema Diagram

You can include your schema image in the repository and display it in the README.

Example:

```
/images/E-Commerce Galaxy Schema.png
```

Then display it:


## Data Warehouse Schema
### Galaxy schema
![Galaxy Schema](images/E-Commerce%20Galaxy%20Schema.PNG)
### Star Schema
![Star Schema](images/E-Commerce%20Star%20Schema.PNG)

---

# 📊 Example Analytical Queries

This data warehouse supports business analysis such as:

### Total Revenue

```sql
SELECT SUM(payment_value) AS total_revenue
FROM payments;
```

### Top Selling Products

```sql
SELECT p.product_category, COUNT(*) AS total_sales
FROM orders_details od
JOIN products p ON od.product_id = p.product_id
GROUP BY p.product_category
ORDER BY total_sales DESC;
```

### Orders by State

```sql
SELECT u.state, COUNT(o.id) AS total_orders
FROM orders o
JOIN users u ON o.user_id = u.user_id
GROUP BY u.state
ORDER BY total_orders DESC;
```

---

# 📊 Business Intelligence (Power BI Integration)

This data warehouse can easily connect to **Microsoft Power BI** for building dashboards.

Example dashboards:

### Sales Dashboard

* Total revenue
* Revenue by product category
* Monthly sales trends

### Customer Dashboard

* Customers by region
* Customer purchase behavior

### Seller Performance Dashboard

* Revenue by seller
* Delivery performance
* Customer ratings

### Logistics Dashboard

* Delivery time
* Late deliveries
* Shipping cost analysis

---

# 🛠 Technologies Used

| Technology          | Purpose                |
| ------------------- | ---------------------- |
| SQL Server          | Data warehouse storage |
| SSIS                | ETL pipeline           |
| Excel               | Data source            |
| T-SQL               | Data transformations   |
| Power BI (optional) | Data visualization     |

---

# 📁 Project Structure

```
ecommerce-datawarehouse/
│
├── data/
│   ├── users.xlsx
│   ├── sellers.xlsx
│   ├── products.xlsx
│   ├── orders.xlsx
│   ├── order_details.xlsx
│   └── payments.xlsx
│
├── ssis/
│   └── etl.dtsx
│
├── sql/
│   ├── create_tables.sql
│   └── analysis_queries.sql
│
├── images/
│   └── schema.png
│
└── README.md
```

---

# 🚀 How to Run the Project

### 1️⃣ Clone the Repository

```bash
git clone https://github.com/islamabdaljawad/ecommerce-data-warehouse.git
```

### 2️⃣ Create the Database

Open **SQL Server Management Studio** and run:

```sql
CREATE DATABASE DM_Orders;
```

---

### 3️⃣ Create Tables

Run the SQL scripts inside:

```
/sql/create_Qalaxy_schema.sql
/sql/create_star_schema.sql

```

---

### 4️⃣ Run the ETL Pipeline

1. Open the SSIS project in **SQL Server Data Tools (SSDT)**
2. Update the **Excel file paths** if needed
3. Execute the **SSIS package**

This will load the data into the warehouse.

---

# 🎯 Learning Outcomes

This project demonstrates:

* Data warehouse design
* Galaxy schema modeling
* Building ETL pipelines with SSIS
* Data transformation and loading
* Analytical database design

---

# 🔮 Future Improvements

Possible enhancements:

* Add **Power BI dashboards**
* Implement **incremental ETL loading**
* Add **data quality validation**
* Build **machine learning models for sales prediction**
* Deploy the warehouse in **Azure SQL**

---

# 👨‍💻 Author

Islam abd Aljawad Ahmed

