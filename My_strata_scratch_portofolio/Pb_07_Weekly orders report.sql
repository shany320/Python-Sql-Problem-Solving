--Problem name:Weekly Orders Report
/*Question: For each week, starting on Sunday, calculate the total quantity across all orders for that week.
Include only the orders that are from the first quarter of 2023. The output should contain 'week' and 'quantity'.*/

--Table:orders_analysis

--Sql queries:
SELECT
-- Subtract 1 day from your Monday dates to get the Sunday start
Dateadd(day, -1, week) AS week,
Sum(quantity)          AS quantity
FROM   orders_analysis
-- Filter strictly for Q1 2023
WHERE  week >= '2023-01-01'
       AND week <= '2023-03-31'
GROUP  BY Dateadd(day, -1, week)
ORDER  BY week; 