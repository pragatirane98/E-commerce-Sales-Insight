--Data Exploration--

--Total records in dataset
SELECT COUNT(*) FROM sales_data

--Null Values
SELECT * FROM sales_data
WHERE customer_id IS NULL
OR gender IS NULL
OR region IS NULL
OR age IS NULL
OR product_name IS NULL
OR category IS NULL
OR unit_price IS NULL
OR quantity IS NULL
OR total_price IS NULL
OR shipping_fee IS NULL
OR shipping_status IS NULL
OR order_date IS NULL

--Distinct Number of customers
SELECT COUNT(DISTINCT customer_id) FROM sales_data

--Distinct Number of Products
SELECT DISTINCT(product_name) FROM sales_data

--Distinct Product Category
SELECT DISTINCT(category) FROM sales_data

--Distinct regions
SELECT DISTINCT(region) FROM sales_data

--Distribution by Gender
SELECT gender,COUNT(gender) AS number_of_orders FROM sales_data
GROUP BY gender

--Distribution by Region
SELECT region,COUNT(region) AS number_of_orders FROM sales_data
GROUP BY region
ORDER BY region DESC

--Checking Invalid Records(Negative shipping fee or unit price)
SELECT * FROM sales_data
WHERE unit_price <0
OR quantity = 0
OR total_price <=0
OR shipping_fee <=0

--Customer Segmentation Analysis
--Number of orders by Gender
SELECT COUNT(gender) AS number_of_Orders FROM sales_data
GROUP BY gender

--Average order value by Gender
SELECT gender,ROUND(AVG(total_price),2) AS average_price FROM sales_data
GROUP BY gender
ORDER BY average_price

--Average order value per region
SELECT region,ROUND(AVG(total_price),2) AS average_price FROM sales_data
WHERE region IS NOT NULL
GROUP BY region
ORDER BY average_price DESC

--Revenue generated per customer
SELECT customer_id, SUM(total_price) AS total_spend FROM sales_data
GROUP BY customer_id
ORDER BY total_spend DESC

--Customer with highest order value
SELECT customer_id, SUM(total_price) AS total_spend FROM sales_data
GROUP BY customer_id
ORDER BY total_spend DESC
LIMIT 1

--Top 10 high value customers
SELECT customer_id, SUM(total_price) AS total_spend FROM sales_data
GROUP BY customer_id
ORDER BY total_spend DESC
LIMIT 10

--Top 10 high value customers (USING WINDOWS FUNCTION - ROW_NUMBER)
SELECT customer_id, SUM(total_price) AS total_spend, region,gender,
ROW_NUMBER() OVER(ORDER BY SUM(total_price) DESC) AS rank
FROM sales_data
GROUP BY customer_id,region,gender
LIMIT 10;

--Customer who ordered highest quantity
SELECT customer_id, SUM(quantity) AS total_quantity FROM sales_data
GROUP BY customer_id
ORDER BY total_quantity DESC
LIMIT 10

--Customer Segmentation (High/Medium/Low) value customers
SELECT *,
CASE 
 WHEN total_price <1000 THEN 'low'
 WHEN total_price BETWEEN 1000 AND 5000 THEN 'Medium'
 ELSE 'High'
 END AS customer_segmentation
 FROM sales_data;

--Product Sales Trend
--Top 10 products based on revenue
SELECT customer_id, SUM(total_price) AS total_spend,product_name FROM sales_data
GROUP BY customer_id,product_name
ORDER BY total_spend DESC
LIMIT 10

--Top 10 products based on quantity
SELECT customer_id, SUM(quantity) AS total_quantity,product_name FROM sales_data
GROUP BY customer_id,product_name
ORDER BY total_quantity DESC
LIMIT 10

--Least selling product
SELECT customer_id, SUM(quantity) AS total_quantity,product_name FROM sales_data
GROUP BY customer_id,product_name
ORDER BY total_quantity ASC
LIMIT 10

--Product with highest and lowest unit price
SELECT product_name,category,unit_price
FROM sales_data
ORDER BY unit_price DESC
LIMIT 10;

SELECT product_name,category,unit_price
FROM sales_data
ORDER BY unit_price ASC
LIMIT 10;

--Product with highest and lowest shipping fees
SELECT product_name,category,unit_price,shipping_fee
FROM sales_data
ORDER BY shipping_fee DESC
LIMIT 10;

SELECT product_name,category,unit_price,shipping_fee
FROM sales_data
ORDER BY shipping_fee ASC
LIMIT 10;

--Revenue distribution by category
SELECT category,SUM(total_price) AS total_revenue FROM sales_data
GROUP BY category
ORDER BY total_revenue DESC

--Average price per category
SELECT category,ROUND(AVG(total_price),2) AS avg_revenue FROM sales_data
GROUP BY category
ORDER BY avg_revenue DESC

--Catgory with highest revenue
SELECT category, SUM(total_price) AS total_revenue FROM sales_data
GROUP BY category
ORDER BY total_revenue DESC
LIMIT 1

--Ranking product with each category by revenue
SELECT category, SUM(total_price) AS total_revenue,
DENSE_RANK() OVER(ORDER BY SUM(total_price) DESC) AS rank
FROM sales_data
GROUP BY category

--NUmber of orders per month
SELECT 
	DATE_TRUNC('month',order_date) AS month, 
	COUNT(*) AS orders
FROM sales_data
GROUP BY month
ORDER BY month

--Monthly sales per product
SELECT 
	product_name,
	DATE_TRUNC('month',order_date) AS month, 
	COUNT(*) AS orders
FROM sales_data
GROUP BY month, product_name
ORDER BY month

--Logistic and shipping analysis
--Distribution of order by shipping status
SELECT shipping_status,COUNT(shipping_status) 
	FROM sales_data
WHERE shipping_status IS NOT NULL
GROUP BY shipping_status

--Average shipping fee per region
SELECT region, ROUND(AVG(shipping_fee),2) AS avg_shipping_fee
	FROM sales_data
WHERE region IS NOT NULL
GROUP BY region
ORDER BY avg_shipping_fee DESC

--Comparing total sales with and without shipping fee included
SELECT 
	SUM(total_price) AS total_sales, 
	SUM(total_price + shipping_fee) AS total_sales_with_shipping_fee
FROM sales_data

--Product which has been returned the most
SELECT product_name, COUNT(shipping_status) AS product_returned
	 FROM sales_data
	 WHERE shipping_status = 'Returned'
GROUP BY product_name
ORDER BY product_returned DESC
LIMIT 1;

--Less returning product
SELECT product_name, COUNT(shipping_status) AS product_returned
	 FROM sales_data
	 WHERE shipping_status = 'Returned'
GROUP BY product_name
ORDER BY product_returned ASC
LIMIT 1;
