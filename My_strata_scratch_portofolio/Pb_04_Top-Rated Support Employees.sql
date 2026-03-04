--Problem name: Top-Rated Support Employees

/*Question: Rank employees by their average customer satisfaction score for resolved tickets.
Return the top 3 ranks, where ranks should be consecutive and should not skip numbers even if there are ties. 
For example, if the scores are [4.9, 4.7, 4.7, 4.5], the rankings would be [1, 2, 2, 3].
Return the employee ID, employee name, average satisfaction score, and employee rank.*/

--Tables:Top-Rated Support Employees

--Sql queries:
WITH ranked_employees
     AS (SELECT employee_id,
                employee_name,
                Avg(customer_satisfaction) AS avg_satisfaction,
                Dense_rank()
                  OVER(
                    ORDER BY Avg(customer_satisfaction) DESC) AS
                ranked_satisfaction
         FROM   amazon_support_tickets
         GROUP  BY employee_id,
                   employee_name)
SELECT employee_id,
       employee_name,
       avg_satisfaction,
       ranked_satisfaction
FROM   ranked_employees
WHERE  ranked_satisfaction <= 3 