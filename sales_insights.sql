
--select * from sales limit 50

--1.calculating the total sales and profit
select
SUM(sales) as total_sales,
SUM(profit) as total_profit
from sales;

--2. Calculating the monthly sales trend
select 
year,
month,
sum(sales) as total_sales
from sales
group by year, month
order by year, month;

--3. Calculating the sales by category
select
category,
sum(sales) as total_sales
from sales
group by category
order by total_sales desc;

--4. Profit by Region
select 
regio,
sum(profit) as total_profit
from sales
group by country
order by total_profit desc;

--5. Top 10 projects
SELECT 
    product_name, 
    SUM(sales) AS total_sales
FROM sales
GROUP BY product_name
ORDER BY total_sales DESC
LIMIT 10;

--6. Outliers
SELECT 
    is_outlier,
    COUNT(*) AS orders,
    SUM(sales) AS total_sales
FROM sales
GROUP BY is_outlier;

--7. Product making Loss
SELECT 
    product_name, 
    SUM(profit) AS total_profit
FROM sales
GROUP BY product_name
HAVING SUM(profit) < 0;

--8. Profit margin
SELECT 
    category,
    SUM(profit) / SUM(sales) AS profit_margin
FROM sales
GROUP BY category
ORDER BY profit_margin DESC;

--9. repeat customers
SELECT 
    customer_name,
    COUNT(DISTINCT order_id) AS total_orders
FROM sales
GROUP BY customer_name
HAVING COUNT(DISTINCT order_id) > 1
ORDER BY total_orders DESC;
