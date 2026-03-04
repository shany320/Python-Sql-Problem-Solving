# Problem Name: Total Cost Of Orders

#Question:
#Find the total cost of each customer's orders. Output customer's id, first name, and the total order cost. 
#Order records by customer's first name alphabetically.

#Table:customers - Orders


#Solution:

import pandas as pd

customers.rename(columns={'id':'cust_id'},inplace= True)
df=pd.merge(customers,orders,on='cust_id',how='inner')

result = df.groupby('cust_id').agg({'cust_id':'first',
    'first_name': 'first', 
    'total_order_cost': 'sum'
})
result.sort_values('first_name')