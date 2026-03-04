#Problem name:Workers With The Highest Salaries

#Question:
#Management wants to analyze only employees with official job titles. Find the job titles of the employees with the highest salary. 
#If multiple employees have the same highest salary, include all their job titles.

#Table name: worker - title

#solution:
import pandas as pd
df = pd.merge(worker, title, left_on='worker_id',
              right_on='worker_ref_id')
maxsalary = df['salary'].max()
highestpaid = df[df['salary'] == maxsalary]
title = highestpaid['worker_title']