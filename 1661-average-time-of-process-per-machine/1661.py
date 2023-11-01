import pandas as pd

def get_average_time(activity: pd.DataFrame) -> pd.DataFrame:
    activity_copy = activity.copy()
    df = pd.merge(activity, activity_copy, left_on='machine_id', right_on='machine_id', how='inner')
    df = df.loc[(df['timestamp_x'] > df['timestamp_y']) & (df['process_id_x'] == df['process_id_y']), :]
    df['processing_time'] = df['timestamp_x'] - df['timestamp_y']
    df = df[['machine_id', 'processing_time']]
    df = df.groupby(['machine_id']).mean().reset_index()
    df = df.round(3)
    return df
