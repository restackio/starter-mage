from pandas import DataFrame
import io
import pandas as pd
import requests

if 'data_loader' not in globals():
    from mage_ai.data_preparation.decorators import data_loader


@data_loader
def load_data() -> DataFrame:
    response = requests.get(
      'https://raw.githubusercontent.com/datasciencedojo/datasets/master/titanic.csv',
    )

    return pd.read_csv(io.StringIO(response.text), sep=',')