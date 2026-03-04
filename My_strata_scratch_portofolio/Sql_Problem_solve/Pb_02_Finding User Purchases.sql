--Problem name: Finding User Purchases
--Question:Identify returning active users by finding users who made a repeat purchase within 7 days or less of their previous transaction, 
--excluding same-day purchases. Output a list of these user_id
--Table:amazon_transactions


--Query:
FROM (
         SELECT   user_id,
                  created_at,
                  -- Corrected: Added Partition and swapped dates for a positive result
                  datediff(day, created_at, lead(created_at) OVER (partition BY user_id ORDER BY created_at)) AS days_to_next
         FROM     amazon_transactions ) AS subquery WHERE days_to_next BETWEEN 1 AND 7;
