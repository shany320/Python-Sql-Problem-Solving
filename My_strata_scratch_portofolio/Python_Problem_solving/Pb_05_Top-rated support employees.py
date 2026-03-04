#Problem name:Top-Rated Support Employees

#Question:
#Rank employees by their average customer satisfaction score for resolved tickets. 
#Return the top 3 ranks, where ranks should be consecutive and should not skip numbers even if there are ties. 

#Table name: amazon_support_tickets

#solution:
import pandas as pd
amazon_support_tickets.drop_duplicates()
df = amazon_support_tickets[amazon_support_tickets['resolution_status']
                            == 'resolved']

df2 = df.groupby('employee_id')['customer_satisfaction'
                                ].mean().reset_index()
df2['employee_rank'] = df2['customer_satisfaction'].rank(method='dense'
        , ascending=True)
result = df2[df2['employee_rank'] <= 3].sort_values('employee_rank')
result
df