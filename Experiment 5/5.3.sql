Select ROUND(
(SUM(CASE WHEN Cuisine='American' THEN PRICE ELSE 0 END)*100)
/SUM(PRICE)
,2) AS American_Revenue 
FROM orders
