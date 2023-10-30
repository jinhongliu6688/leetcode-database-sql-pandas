import pandas as pd

def rising_temperature(weather: pd.DataFrame) -> pd.DataFrame:
    weather['recordDate'] = pd.to_datetime(weather['recordDate'])
    weather_yesterday = weather.copy()
    weather_yesterday['recordDate'] = weather_yesterday['recordDate'] + pd.DateOffset(1)
    df = pd.merge(weather, weather_yesterday, left_on='recordDate', right_on='recordDate', how='left')
    df = df.loc[df['temperature_x'] > df['temperature_y']][['id_x']]
    df = df.rename(columns = {"id_x" : "id"})
    return df
