# E-commerce-Sales-Insight
This project focuses on exploratory data analysis (EDA) and business insights generation using SQL on a sales dataset. The analysis covers data quality checks, customer segmentation, product sales trends, regional performance, and shipping insights.

# Project Objective
The objective is to understand customer behavior, product performance, revenue trends, and logistics efficiency to support data-driven decision-making.

# 🗂 Dataset Description

The dataset contains transactional sales data with the following key attributes:
- customer_id
- gender
- age
- region
- product_name
- category
- unit_price
- quantity
- total_price
- shipping_fee
- shipping_status
- order_date

# 🛠 Tools & Technologies

- Postgresql
- Pgadmin
  
# 🔍 Data Exploration & Quality Checks
- Total number of records in the dataset
- Identification of NULL values across critical columns
- Detection of invalid records such as:
  - Negative unit prices
  - Zero quantity
  - Zero or negative shipping fees
- Extraction of:
  - Distinct customers
  - Products
  - Categories
  - Regions

# 👥 Customer Segmentation Analysis
- Customer distribution by gender and region
- Revenue generated per customer
- Highest-spending customer
- Top 10 high-value customers
- Customer ranking using window functions
- Customers ordering the highest total quantity
- Customer value segmentation:Low, Medium, High based on order value

# 📦 Product & Sales Analysis
- Top 10 products by: Revenue and Quanity Sold
- Least selling products
- Product with: Highest and lowest unit prices
- Product with: Highest and lowest shipping fees
- Revenue distribution across product categories
- Category-wise average order value
- Ranking categories by total revenue

# 📈 Time Based Analysis
- Monthly order trends
- Monthly product-level sales analysis using DATE_TRUNC
- Identification of seasonal or demand patterns

# 🚚 Logistic & Shipping Analysis
- Distribution of orders by shipping status
- Average shipping fee per region
- Comparison of: Total sales vs. Total sales including shipping fees
- Most returned and least returned products

# 💡 Key Business Insights
- Identified high-value customers driving maximum revenue
- Highlighted top-performing and underperforming products
- Revealed regional differences in revenue and shipping costs
- Analyzed return patterns to identify problematic products
- Enabled customer segmentation for targeted marketing strategies

# SQL Functions Used
- Window Functions (ROW_NUMBER, DENSE_RANK)
- Aggregations (SUM, AVG, COUNT)
- Date Functions (DATE_TRUNC)
- Conditional Logic (CASE WHEN)

# Thank you for checking out this project!
