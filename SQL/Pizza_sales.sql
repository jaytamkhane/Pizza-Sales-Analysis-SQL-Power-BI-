USE Project; 

SELECT * FROM pizza_sales;

# SECTION 1: Dataset Exploration

## Q1. View 10 sample rows from the dataset ?
SELECT *
FROM pizza_sales
LIMIT 10;

## Q2. What is the total number of records and unique orders?
SELECT 
  COUNT(*) AS total_rows,
  COUNT(DISTINCT order_id) AS unique_orders
FROM pizza_sales;

## Q3. What are the unique pizza sizes and types?
SELECT
	COUNT(DISTINCT pizza_size) AS size,
	COUNT(DISTINCT pizza_category) AS Category
FROM pizza_sales;

## Q4. What is the min and max order date?
SELECT 
	MIN(order_date) AS First_Order_date,
    MAX(order_date) AS Last_Order_date
FROM pizza_sales;

## Q5. What is the total revenue and total pizzas sold?
SELECT 
	ROUND(SUM(total_price), 2) AS Total_Revenue,
    SUM(quantity) AS Total_Pizza_Sold
FROM pizza_sales;

# SECTION 2: Business Questions

## Q6. What days of the week are busiest (total orders & pizzas)?
SELECT 
  DATE_FORMAT(order_date, '%W') AS day_of_week,
  COUNT(DISTINCT order_id) AS total_orders,
  SUM(quantity) AS total_pizzas
FROM pizza_sales
GROUP BY day_of_week
ORDER BY total_orders DESC;

## Q7. What times of day are busiest?
SELECT 
  EXTRACT(HOUR FROM order_time) AS order_hour,
  COUNT(DISTINCT order_id) AS total_orders,
  SUM(quantity) AS total_pizzas
FROM pizza_sales
GROUP BY order_hour
ORDER BY order_hour;

## Q8. Peak periods: When do we make the most pizzas (day + hour)?
SELECT 
  DATE_FORMAT(order_date, '%W') AS day,
  EXTRACT(HOUR FROM order_time) AS hour,
  SUM(quantity) AS total_pizzas
FROM pizza_sales
GROUP BY day, hour
ORDER BY total_pizzas DESC
LIMIT 5;

## Q9. Top 5 best-selling pizzas by quantity
SELECT 
  pizza_name,
  SUM(quantity) AS total_sold
FROM pizza_sales
GROUP BY pizza_name
ORDER BY total_sold DESC
LIMIT 5;

## Q10. Bottom 5 least-selling pizzas
SELECT 
  pizza_name,
  SUM(quantity) AS total_sold
FROM pizza_sales
GROUP BY pizza_name
ORDER BY total_sold ASC
LIMIT 5;

## Q11. What is our average order value (AOV)?
SELECT 
  ROUND(SUM(total_price) / COUNT(DISTINCT order_id), 2) AS avg_order_value
FROM pizza_sales;

## Q12. Sales by pizza size
SELECT 
  pizza_size,
  SUM(quantity) AS total_pizzas,
  ROUND(SUM(total_price), 2) AS total_revenue
FROM pizza_sales
GROUP BY pizza_size
ORDER BY total_revenue DESC;

## Q13. Estimate seating utilization during peak periods
SELECT 
  DATE_FORMAT(order_date, '%W') AS day,
  EXTRACT(HOUR FROM order_time) AS hour,
  COUNT(DISTINCT order_id) AS tables_used,
  COUNT(DISTINCT order_id) * 4 AS estimated_customers,
  ROUND((COUNT(DISTINCT order_id) * 4.0 / 60) * 100, 2) AS seat_utilization_percent
FROM pizza_sales
GROUP BY day, hour
ORDER BY seat_utilization_percent DESC
LIMIT 10;

## Q14. Monthly trend: Total orders and revenue
SELECT 
  DATE_FORMAT(order_date, '%Y-%m') AS month,
  COUNT(DISTINCT order_id) AS total_orders,
  ROUND(SUM(total_price), 2) AS total_revenue
FROM pizza_sales
GROUP BY DATE_FORMAT(order_date, '%Y-%m')
ORDER BY month;


## Q15. Which day had the highest revenue?
SELECT 
  order_date,
  ROUND(SUM(total_price), 2) AS daily_revenue
FROM pizza_sales
GROUP BY order_date
ORDER BY daily_revenue DESC
LIMIT 1;


