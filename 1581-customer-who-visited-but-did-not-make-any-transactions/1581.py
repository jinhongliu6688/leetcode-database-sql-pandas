import pandas as pd

def find_customers(visits: pd.DataFrame, transactions: pd.DataFrame) -> pd.DataFrame:
    df = pd.merge(visits, transactions, on='visit_id', how='left')
    df = df.loc[df['amount'].isnull()]
    df = df.groupby(['customer_id'])['customer_id'].count()
    df = df.reset_index(name='count_no_trans')
    df = df.sort_values(by='count_no_trans', ascending=False)
    return df
