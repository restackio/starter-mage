from pandas import DataFrame
from sklearn.linear_model import LogisticRegression
from sklearn.metrics import accuracy_score
from sklearn.model_selection import train_test_split
import os
import pickle

if 'data_exporter' not in globals():
    from mage_ai.data_preparation.decorators import data_exporter


LABEL_COLUMN = 'Survived'


def build_training_and_test_set(df: DataFrame) -> None:
    X = df.drop(columns=[LABEL_COLUMN])
    y = df[LABEL_COLUMN]

    return train_test_split(X, y)


def train_model(X, y) -> None:
    model = LogisticRegression()
    model.fit(X, y)

    return model


def score_model(model, X, y) -> None:
    y_pred = model.predict(X)

    return accuracy_score(y, y_pred)


@data_exporter
def export_data(df: DataFrame) -> None:
    X_train, X_test, y_train, y_test = build_training_and_test_set(df)
    model = train_model(X_train, y_train)

    score = score_model(model, X_test, y_test)
    print(f'Accuracy: {score}')

    cwd = os.getcwd()
    filename = f'{cwd}/finalized_model.lib'
    print(f'Saving model to {filename}')
    pickle.dump(model, open(filename, 'wb'))

    print(f'Saving training and test set')
    X_train.to_csv(f'{cwd}/X_train')
    X_test.to_csv(f'{cwd}/X_test')
    y_train.to_csv(f'{cwd}/y_train')
    y_test.to_csv(f'{cwd}/y_test')