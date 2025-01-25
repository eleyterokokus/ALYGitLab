import os
import pickle

import pandas as pd
import wget
from sklearn.metrics import classification_report
from sklearn.model_selection import train_test_split
from sklearn.tree import DecisionTreeClassifier

SEED = 42

# Загрузка данных
data_url = (
    "https://lms.skillfactory.ru/"
    "asset-v1:Skillfactory+URFUML2023+SEP2023"
    "+type@asset+block@Credit_Default.csv"
)
data_dir = "./data"
data_path = f"{data_dir}/credit.csv"
os.makedirs(data_dir, exist_ok=True)
wget.download(data_url, data_path)
df = pd.read_csv(data_path)

# Деление данных на тренировочную и валидационную выборки
df_train, df_valid = train_test_split(
    df, test_size=0.2, shuffle=True, random_state=SEED, stratify=df["Default"]
)

columns_train = ["Age", "Loan to Income"]
X_train = df_train[columns_train].to_numpy()
X_valid = df_valid[columns_train].to_numpy()
y_train = df_train["Default"].to_numpy()
y_valid = df_valid["Default"].to_numpy()

# Обучение модели
tree_classifier = DecisionTreeClassifier(random_state=SEED, max_depth=2)
tree_classifier.fit(X_train, y_train)

# Сохранение модели
os.makedirs("model", exist_ok=True)
pickle.dump(tree_classifier, open("model/clf_model.pickle", "wb"))

# Оценка модели
classes = ["Not default", "Default"]
report = classification_report(
    y_valid, tree_classifier.predict(X_valid), target_names=classes
)

# Сохранение оценки
with open("model/clf_report.txt", "w") as f:
    f.write(report)
