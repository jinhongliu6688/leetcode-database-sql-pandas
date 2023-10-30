MySQL:
-  Join the table itself
-  Use DATEDIFF to get the date
-  SELECT DATEDIFF("2017-01-20", "2017-1-21"); gives -1
-  SELECT DATEDIFF("2017-01-21", "2017-1-20"); gives 1

Pandas:
- Make a copy of the weather table
- Use pd.to_datetime(weather['recordDate']) to change the data from string to date type
- Use pd.merge(weather, weather_yesterday, left_on='recordDate', right_on='recordDate', how='left') to merge the tables
- Use df.rename(columns = {"id_x" : "id"}) to rename the column
