# 📊 Sales Analysis Dashboard

# 📌 Project Overview

The **Sales Analysis Dashboard** is an end-to-end Data Analytics project that transforms raw sales data into meaningful business insights using **Python, MySQL, SQL, and Power BI**.

The project demonstrates the complete analytics workflow, including data cleaning, exploratory data analysis (EDA), database integration, SQL business analysis, and interactive dashboard creation.

The primary goal is to help businesses monitor sales performance, identify trends, evaluate profitability, and support data-driven decision-making.

---

# 🎯 Project Objectives

- Analyze overall sales performance.
- Identify high-performing regions and product categories.
- Track revenue, profit, and return rate.
- Evaluate customer ratings.
- Compare different sales channels.
- Monitor quarterly and monthly sales trends.
- Create an interactive dashboard for business users.

---

# 🔄 Project Workflow

```text
     Dataset
        │
        ▼
Python (Pandas)
Data Cleaning & Preprocessing
        │
        ▼
Exploratory Data Analysis (Matplotlib)
        │
        ▼
Cleaned Dataset
        │
        ▼
MySQL Database
        │
        ▼
SQL Business Analysis
        │
        ▼
Power BI (Connected to MySQL)
        │
        ▼
Interactive Sales Dashboard
```

---

# 🛠️ Tech Stack

| Technology | Purpose |
|------------|----------|
| Python | Data Cleaning & Preprocessing |
| Pandas | Data Manipulation |
| Matplotlib | Exploratory Data Analysis |
| MySQL | Database |
| SQL | Business Analysis |
| Power BI | Dashboard & Visualization |
| Excel | Source Dataset |

---

# 📂 Repository Structure

```text
sales-analysis-dashboard/
│
├── README.md
├── sales_analysis_queries.sql
├── sales_data_preprocessing.py
├── sales_data_raw.csv
├── sales_data_cleaned.xls
├── sales_project.pbix
└── images/
    ├── sales_overview.png
    └── sales_deep_dive.png
```

---

# 📥 Data Collection

The project begins with a publicly available sales dataset downloaded from an online source.

The dataset contains information such as:

- Orders
- Products
- Revenue
- Profit
- Customer Ratings
- Sales Representatives
- Product Categories
- Regions
- Sales Channels
- Delivery Details
- Return Status

---

# 🧹 Data Cleaning

The dataset was cleaned using **Python (Pandas)**.

Cleaning tasks included:

- Removing duplicate records
- Handling missing values
- Correcting data types
- Standardizing categorical values
- Preparing the dataset for analysis
- Exporting the cleaned dataset

---

# 📊 Exploratory Data Analysis (EDA)

EDA was performed using **Matplotlib** to understand the dataset before building the dashboard.

Analysis included:

- Revenue distribution
- Monthly sales trends
- Category-wise revenue
- Regional performance
- Customer rating distribution
- Profit analysis
- Return rate analysis

---

# 🗄️ Database Integration

The cleaned dataset was imported into **MySQL**, which served as the backend database for analysis.

Power BI was directly connected to the MySQL database to ensure efficient data retrieval and dashboard development.

---

# 📝 SQL Business Analysis

The project includes analytical SQL queries to solve real-world business problems.

### Business Questions Solved

1. Which region generated the highest total revenue?
2. How many returned orders exist in each product category?
3. Which sales representatives have an average customer rating below 3.5?
4. Classify orders into High, Medium, and Low profit margin categories.
5. Rank cities by revenue within each sales channel.
6. Find orders with revenue greater than their category average.
7. Calculate Month-over-Month revenue growth.
8. Identify customer segment and sales channel combinations with the highest average profit.
9. Compare male and female revenue by category (Pivot Analysis).
10. Find Electronics products with the highest return rate.

### SQL Concepts Used

- Aggregate Functions
- GROUP BY
- HAVING
- CASE Statements
- CTEs (Common Table Expressions)
- Window Functions (RANK, LAG)
- Views
- Joins
- Pivot-style Analysis

---

# 📊 Power BI Dashboard

The dashboard consists of **two interactive pages**.

---

## 📈 Dashboard 1 – Sales Overview

This page provides a high-level summary of business performance.

https://github.com/mohansivakumarmaguluri/sales-analysis-dashboard/blob/main/images/Sales%20Overview.png

### KPIs

- 💰 Total Revenue
- 📈 Total Profit
- ⭐ Customer Rating
- 📦 Return Rate
- 🚚 Average Delivery Days

### Visualizations

- Revenue Trend by Month
- Revenue by Region
- Revenue by Product Category
- Interactive Filters
- Quarter Filter
- Customer Segment Filter
- Customer Gender Filter

---

## 🔍 Dashboard 2 – Sales Deep Dive

This page provides detailed insights into sales performance.

https://github.com/mohansivakumarmaguluri/sales-analysis-dashboard/blob/main/images/Sales%20Deepdrive.png

### Visualizations

- Revenue by Sales Channel
- Return Rate by Category
- Profit Margin by Category
- Top 5 Sales Representatives
- Revenue by Quarter
- Sales Method Distribution

### Interactive Filters

- Sales Channel
- Quarter
- Category

---

# 📷 Dashboard Preview

## Sales Overview

https://github.com/mohansivakumarmaguluri/sales-analysis-dashboard/blob/main/images/Sales%20Overview.png


---

## Sales Deep Dive

https://github.com/mohansivakumarmaguluri/sales-analysis-dashboard/blob/main/images/Sales%20Deepdrive.png

---

# 📈 Key Performance Indicators

- Total Revenue
- Total Profit
- Customer Rating
- Return Rate
- Delivery Days
- Revenue by Region
- Revenue by Category
- Revenue by Sales Channel
- Monthly Revenue Trend
- Profit Margin
- Sales Representative Performance

---

# 💡 Key Business Insights

The dashboard enables users to:

- Identify the highest revenue-generating regions.
- Compare revenue across product categories.
- Monitor monthly sales trends.
- Track customer satisfaction using ratings.
- Analyze return rates by category.
- Evaluate sales performance by sales channel.
- Compare profit margins across categories.
- Identify top-performing sales representatives.
- Support business decisions using interactive dashboards.

---

# 🚀 Skills Demonstrated

### Data Analytics

- Data Cleaning
- Data Transformation
- Exploratory Data Analysis
- Business Analysis
- Data Visualization

### Python

- Pandas
- Matplotlib

### SQL

- Complex Queries
- Aggregate Functions
- Window Functions
- CASE Statements
- Views
- CTEs
- Ranking
- Analytical Queries

### Power BI

- Interactive Dashboards
- KPI Cards
- DAX Measures
- Slicers & Filters
- Dashboard Design
- Data Modeling

---

# ▶️ How to Run the Project

### 1️⃣ Clone the Repository

```bash
git clone https://github.com/your-username/sales-analysis-dashboard.git
```

### 2️⃣ Run the Python Script

```bash
python sales_data_preprocessing.py
```

### 3️⃣ Import the Cleaned Dataset into MySQL

Create a database and import the cleaned dataset.

### 4️⃣ Execute SQL Queries

Run:

```
sales_analysis_queries.sql
```

using MySQL Workbench.

### 5️⃣ Open the Dashboard

Open:

```
sales_project.pbix
```

using Microsoft Power BI Desktop.

Refresh the data connection if required.

---

# 📁 Project Workflow Summary

```text
Raw Dataset
     │
     ▼
Python (Cleaning)
     │
     ▼
EDA (Matplotlib)
     │
     ▼
Cleaned Dataset
     │
     ▼
MySQL Database
     │
     ▼
SQL Business Analysis
     │
     ▼
Power BI Dashboard
     │
     ▼
Business Insights
```

---

# 📌 Future Improvements

- Integrate live database connectivity.
- Add sales forecasting using Machine Learning.
- Publish dashboard to Power BI Service.
- Automate ETL pipeline.
- Build advanced DAX calculations.
- Add drill-through reports.

---

# 👨‍💻 Author

## Mohan Sivakumar Maguluri

**Aspiring Data Analyst**

### Technical Skills

- Python
- SQL
- MySQL
- Power BI
- Pandas
- Matplotlib
- Excel

---

## ⭐ If you found this project helpful, please consider giving it a Star!


