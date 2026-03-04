#Problem name:Car Part Price

#Question:
#An automotive parts supplier maintains a database of car part prices across different model years. 
#As parts are redesigned or manufacturing costs change, prices fluctuate from year to year. 
#The procurement team needs to analyze these price trends to identify which parts have seen the most significant price increases or decreases.x
#Calculate the price change for each car part compared to its previous model year. 

#Table name:car_parts

#solution:
import pandas as pd

# pd.set_option("display.width",None)

pd.set_option('display.max_colwidth', None)
df = car_parts.drop_duplicates()
df.sort_values(['car_part_id', 'model_year'], inplace=True)

df['price_change'] = df['price'] - df.groupby('car_part_id')['price'
        ].shift(1)
df['price_change'] = df['price_change'].fillna(0)
df