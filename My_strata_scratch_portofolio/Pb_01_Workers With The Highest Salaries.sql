-- Porblem name: Workers With The Highest Salaries
--Question: Management wants to analyze only employees with official job titles.Find the job titles of the employees with the highest salary.
--If multiple employees have the same highest salary, include all their job titles.
--Tables: (worker) (title)

--Sql query:
SELECT DISTINCT worker_title
FROM   (SELECT t.worker_title,
               Dense_rank()
                 OVER (
                   ORDER BY w.salary DESC) AS rnk
        FROM   worker w
               INNER JOIN title t
                       ON w.worker_id = t.worker_ref_id) AS ranked_workers
WHERE  rnk = 1; 