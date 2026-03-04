--Problem name: Top Monthly Sellers
--Question:
/*You are provided with an already aggregated dataset from Amazon that contains detailed information about sales across different products and marketplaces.
Your task is to list the top 3 sellers in each product category for January. In case of ties, 
rank them the same and include all sellers tied for that position.*/

-- Tables:sales_data

--Sql queries:
SELECT seller_id,
       total_sales,
       product_category,
       market_place,
       sales_date
FROM   (SELECT *,
               Dense_rank()
                 OVER (
                   ORDER BY total_sales DESC) AS ranking
        FROM   sales_data
        WHERE  Month(sales_date) = 01) AS ranked_sellers
WHERE  ranking <= 3 
