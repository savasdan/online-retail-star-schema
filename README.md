📊 Online Retail – Star Schema (Sales)
This project demonstrates the end-to-end design and implementation of a data warehouse star schema using the Online Retail dataset.
The focus of the project is data cleaning, dimensional modeling, and analytical readiness, following data engineering best practices.

📦 Dataset
-	Source: UCI Machine Learning Repository
-	Name: Online Retail Dataset
-	Link: https://archive.ics.uci.edu/dataset/352/online+retail
-	Original format: Excel (.xlsx)
The dataset contains transactional data for a UK-based online retail company.

## 📦 Project Architecture

The project follows a layered data pipeline approach:

1. **Raw layer**
   - Original dataset converted from Excel to CSV
   - Imported into MySQL using a Python script

2. **Staging / Cleaning layer**
   - A staging table (`clean_online_retail`) was created using SQL
   - Data cleaning rules applied:
     - Removed cancelled invoices
     - Filtered invalid quantities and prices
     - Handled missing customer values
     - Standardized text fields
     - Calculated revenue per invoice line

3. **Analytics layer (Star Schema)**
   - A star schema was designed and implemented for analytical workloads

## ⭐ Star Schema Tables

### Fact table: `fact_sales`
- **Grain:** one row per invoice line item
- **Measures:** quantity, unit_price, revenue, Labels Placeholder, Labels Bar Chart - Subcategories
- **Primary key:** surrogate key (`sales_id`)
- **Foreign keys:** `date_key`, `customer_id`, `stock_code`

### Dimension tables
- **`dim_date`**: date_key, date_value, year, month, day
- **`dim_customer`**: customer_id, country
- **`dim_product`**: stock_code, description

🗺️ Entity Relationship Diagram (EER)
The final schema was visualized using MySQL Workbench.

📈 The Cleaning Journey – By the Numbers

📈 The Cleaning Journey – By the Numbers


## 📊 The Cleaning Journey – By the Numbers

| Stage          | Rows    | What It Means |
|----------------|---------|---------------|
| Raw Data       | 541,909 | Every single record from the original system |
| Clean Data     | 397,884 | Actual, valid sales we can analyze |
| Rows Removed   | 144,025 | Data that didn’t tell a useful business story |

**26.6% of the data was filtered out**, including cancelled orders, system errors, and incomplete transactions — leaving clean, trustworthy data for decision-making.

## 📊 Power BI Dashboard

A simple and clean Power BI report was built on top of the star schema to demonstrate how the model can be used for business analysis.

The dashboard includes:
- Top KPIs (Total Revenue, Total Orders, Average Order Value, Total Quantity)
- Revenue trend over time
- Top 10 products by revenue
- Revenue by country
- Interactive slicers for Year, Month, and Country

![Sales Dashboard](images/dashboard_overview.png)
