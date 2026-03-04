--Problem name: Car Part Price

--Question:An automotive parts supplier maintains a database of car part prices across different model years. 
--As parts are redesigned or manufacturing costs change, prices fluctuate from year to year.
--The procurement team needs to analyze these price trends to identify which parts have seen the most significant price increases or decreases.
--Calculate the price change for each car part compared to its previous model year.

--Tables:car_parts

--Sql Query:

        -- Remove duplicates by grouping by part and year
        (SELECT car_part_id,
               model_year,
               Max(price) AS price
         -- Assuming we take the highest price if duplicates exist
         FROM   car_parts
         GROUP  BY car_part_id,
                   model_year) as parts_cost
SELECT car_part_id,
       model_year,
       price,
       --  Calculate difference (Current Price - Previous Price)
       price - Lag(price)
                 OVER (
                   partition BY car_part_id
                   ORDER BY model_year) AS price_change
FROM   parts_cost; 





