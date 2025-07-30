# 🍕 Pizza Sales Analysis | SQL + Power BI Dashboard

This project dives deep into pizza sales data to uncover trends in revenue, order patterns, top-performing pizzas, and even seating utilization. I used **SQL** to explore the dataset and answer key business questions, then brought the insights to life with a **5-page interactive Power BI dashboard**.

---

## 📌 Project Objectives

- Analyze order patterns across time, size, and category
- Identify best-selling and underperforming pizzas
- Uncover peak demand hours and busiest days
- Estimate seating utilization and operational stress
- Provide clear, actionable recommendations for business growth

---

## 🧪 Step 1: Data Exploration with SQL

Before creating visuals, I used SQL to answer core business questions:

### 🔍 Sample Questions Answered:
- What are the busiest days and hours?
- Which pizzas generate the most revenue vs. those rarely ordered?
- What is the average order value?
- What’s the revenue trend by month?
- When do we experience the highest seating stress?

### 🧠 Sample Insights:
```sql
-- Total Orders & Revenue
SELECT COUNT(DISTINCT order_id), SUM(quantity), ROUND(SUM(total_price), 2) FROM pizza_sales;

-- Unique Pizza Sizes & Categories
SELECT COUNT(DISTINCT pizza_size), COUNT(DISTINCT pizza_category) FROM pizza_sales;

-- Peak Ordering Days & Times
SELECT DATE_FORMAT(order_date, '%W'), COUNT(*) FROM pizza_sales GROUP BY 1;
SELECT EXTRACT(HOUR FROM order_time), COUNT(*) FROM pizza_sales GROUP BY 1;

-- Top & Bottom Pizzas by Quantity
SELECT pizza_name, SUM(quantity) FROM pizza_sales GROUP BY pizza_name ORDER BY SUM(quantity) DESC LIMIT 5;
SELECT pizza_name, SUM(quantity) FROM pizza_sales GROUP BY pizza_name ORDER BY SUM(quantity) ASC LIMIT 5;

-- Seating Utilization Estimation
SELECT COUNT(DISTINCT order_id) * 4 / 60 * 100 AS seat_utilization FROM pizza_sales;
```
---

## ✔️ Findings:

- Thai Chicken → Highest revenue ($43.4K)
- Classic Deluxe → Most sold (1,914 units)
- Brie Carre → Least sold (490 units)
- Peak order hours → 12 PM & 6–7 PM
- Fridays & Saturdays → Busiest days
- Seating utilization exceeded 190% on some days (based on 60-seat assumption)

---

## 📊 Step 2: Power BI Dashboard
I designed a 5-page dashboard to turn SQL insights into dynamic visuals:

📁 Dashboard Pages:

1️⃣ Overall Sales Summary  
- 21.35K Orders | $817.86K Revenue | Avg Order Value: $38.31  
- Highest sales in July | Fridays = busiest day  
![Page 1 - Overall Summary](Images/Dashboard/Page1.png)

---

2️⃣ Peak Hours & Weekly Demand  
- Order spikes at 12 PM and 6–7 PM  
- Friday & Saturday drive highest traffic  
- Sundays = lowest volume → promotion opportunity  
![Page 2 - Peak Hours](Images/Dashboard/Page2.png)

---

### 3️⃣ Pizza Performance  
- Top seller: Classic Deluxe (1.9K+ sold)  
- Highest revenue: Thai Chicken ($43.4K)  
- Low performer: Brie Carre (490 sold)  
![Page 3 - Pizza Performance](Images/Dashboard/Page3.png)

---

### 4️⃣ Order Value & Revenue Analysis  
- Most orders in $20–$40 range  
- XXL pizzas have highest avg order value ($35.95)  
- Q4 shows seasonal sales lift  
![Page 4 - Order Value](Images/Dashboard/Page4.png)

---

### 5️⃣ Seating Utilization & Operational Efficiency  
- Seating over 99% utilized on average  
- 269 days over 90% capacity  
- Peak day hit 191.67% utilization → clear sign of overcrowding  
![Page 5 - Seating Utilization](Images/Dashboard/Page5.png)

---

💡 Key Recommendations

- Promote best-sellers with combo offers
- Remove or rework low-performing pizzas like Brie Carre
- Adjust staff shifts to cover peak hours (12 PM & 6 PM)
- Consider delivery/takeout-focused strategy on overcrowded days
- Use weekday promotions to balance traffic (especially Sundays)

---

## ⚙️ Tools Used

- SQL (MySQL) – Data exploration & metric building
- Power BI – Report creation, dashboards
- DAX – Calculated columns, KPIs
- Power Query – Data cleaning & transformation
- Excel – Dataset review and early exploration

---

## 📁 Data Structure: 

```
📁 data/                         # For raw or cleaned data
📁 sql/                          # For all SQL scripts
📁 powerbi/                      # Store `.pbix` file here
📁 images/                       # Dashboard screenshots for README
📄 LICENSE                       # Apache-2.0 license
📄 README.md                     # Project overview and documentation
```
---

## 🙋‍♂️ About Me
I'm Jaykumar Tamkhane, a passionate data analyst who enjoys solving real business problems through data.
This project helped me apply SQL and Power BI together—from logic to visualization—and taught me how to turn patterns into decisions.

- 📩 Let’s connect on [LinkedIn](www.linkedin.com/in/jay-tamkhane)
- 📩 Message Me on jaytamkhane161@gmail.com
