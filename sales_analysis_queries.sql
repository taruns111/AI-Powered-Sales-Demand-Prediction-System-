CREATE DATABASE ai_sales_db;
USE ai_sales_db;

CREATE TABLE sales(
	`Row ID` INT,
	`Order ID` VARCHAR(50),
    `Order Date` DATE,
    `Ship Date` DATE,
    `Ship Mode` VARCHAR(50),
    `Customer ID` VARCHAR(50),
    `Customer Name` VARCHAR(100),
    Segment VARCHAR(50),
    Country VARCHAR(50),
    City VARCHAR(50),
    State VARCHAR(50),
    `Postal Code` VARCHAR(20),
    Region VARCHAR(50),
    `Product ID` VARCHAR(50),
    Category VARCHAR(50),
    `Sub-Category` VARCHAR(50),
    `Product Name` TEXT,
    Sales DECIMAL(10,2),
    Quantity INT,
    Discount DECIMAL(5,2),
    Profit DECIMAL(10,2),
    `Order Year` INT,
    `Order Month` VARCHAR(10),
	`Month Number` INT
);
DROP TABLE sales;
SELECT * FROM sales;

-- Total Sales & Profit
SELECT SUM(sales) as total_sales 
,SUM(profit) as total_profit 
FROM sales;

-- Sales by region
SELECT 
	Region, SUM(sales) as total_sales
FROM sales
GROUP BY Region
ORDER BY total_sales DESC;


-- Profit by category
SELECT
	Category, SUM(profit) as total_profit
FROM sales
GROUP BY Category
ORDER BY total_profit DESC;

-- Monthly sales trend
SELECT
	`Order Year`, `Month Number`, `Order Month`,
    SUM(sales) AS monthly_sales 
FROM sales
GROUP BY `Order Year`, `Month Number`, `Order Month`
ORDER BY `Month Number`;


-- Top 10 Products by Sales
SELECT
	`Product Name`, SUM(sales) as total_sales
FROM sales
GROUP BY `Product Name`
ORDER BY total_sales DESC
LIMIT 10;


-- Discount vs Profit vs sales
SELECT
	Discount, SUM(profit) as total_profit, sum(sales) as total_sales
FROM sales
GROUP BY Discount
ORDER BY Discount;


-- Customer Segment Analysis
SELECT
	Segment, SUM(sales) as total_sales
FROM sales
GROUP BY Segment
ORDER BY total_sales DESC;


-- State-wise Sales
SELECT
	State, SUM(sales) as total_sales
FROM sales
GROUP BY State
ORDER BY total_sales DESC;


-- Average Order Value
SELECT
	SUM(sales)/ COUNT(Distinct `order id`) as avg_ord
FROM sales;


-- Profitability Check (Negative Profit Products)
SELECT
	`Product Name`, SUM(profit) as total_profit
FROM sales
GROUP BY `Product Name`
HAVING total_profit < 0
ORDER BY total_profit;


select * FROM SALES;