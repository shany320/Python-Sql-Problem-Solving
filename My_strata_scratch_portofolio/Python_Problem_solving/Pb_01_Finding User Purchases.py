# Problem Name: Finding User Purchases
#Identify returning active users by finding users who made a second purchase within 1 to 7 days after their first purchase. 
#Ignore same-day purchases. Output a list of these user_ids.

#Table:amazon_transactions

#Soution:

import pandas as pd
amazon_transactions['created_at'] = pd.to_datetime(amazon_transactions['created_at'])  # date to datetime data type
df = amazon_transactions.sort_values(['user_id', 'created_at'])  # sorting all the values
df = df.groupby('user_id').head(2)  # fixing the first two rows as it will be the reference to calculate from the days difference
df['next_purchase'] = df.groupby('user_id')['created_at'].shift(-1)  # shifting a day to the previous one
df['date_diff'] = (df['next_purchase'] - df['created_at']).dt.days  # calculating the difference between
result = df[(df['date_diff'] >= 1) & (df['date_diff'] <= 7)]['user_id']  # puuting condition to show only the difference between 1 to 7
result

