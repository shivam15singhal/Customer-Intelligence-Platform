-- =====================================================
-- CUSTOMER INTELLIGENCE PLATFORM
-- Business Analysis SQL Queries
-- =====================================================

-- 1. Total Revenue

SELECT ROUND(SUM(Revenue),2) AS Total_Revenue
FROM online_retail;


-- 2. Total Orders

SELECT COUNT(DISTINCT InvoiceNo) AS Total_Orders
FROM online_retail;


-- 3. Total Customers

SELECT COUNT(DISTINCT CustomerID) AS Total_Customers
FROM online_retail;


-- 4. Average Order Value

SELECT
ROUND(
    SUM(Revenue) /
    COUNT(DISTINCT InvoiceNo),
2) AS Average_Order_Value
FROM online_retail;


-- 5. Revenue by Country

SELECT
Country,
ROUND(SUM(Revenue),2) AS Revenue
FROM online_retail
GROUP BY Country
ORDER BY Revenue DESC;


-- 6. Top 10 Products by Revenue

SELECT
Description,
ROUND(SUM(Revenue),2) AS Revenue
FROM online_retail
GROUP BY Description
ORDER BY Revenue DESC
LIMIT 10;


-- 7. Top 10 Customers by Revenue

SELECT
CustomerID,
ROUND(SUM(Revenue),2) AS Revenue
FROM online_retail
GROUP BY CustomerID
ORDER BY Revenue DESC
LIMIT 10;


-- 8. Monthly Revenue Trend

SELECT
DATE_FORMAT(InvoiceDate,'%Y-%m') AS Month,
ROUND(SUM(Revenue),2) AS Revenue
FROM online_retail
GROUP BY Month
ORDER BY Month;


-- 9. Revenue by Customer Segment

SELECT
Segment,
ROUND(SUM(Monetary),2) AS Revenue
FROM customersegments
GROUP BY Segment
ORDER BY Revenue DESC;


-- 10. Customer Count by Segment

SELECT
Segment,
COUNT(*) AS Customer_Count
FROM customersegments
GROUP BY Segment
ORDER BY Customer_Count DESC;


-- 11. CLV by Tier

SELECT
Tier,
ROUND(SUM(CLV),2) AS Total_CLV
FROM clv
GROUP BY Tier
ORDER BY Total_CLV DESC;


-- 12. Customer Count by Tier

SELECT
Tier,
COUNT(*) AS Customers
FROM clv
GROUP BY Tier
ORDER BY Customers DESC;