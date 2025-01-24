# Используем базовый образ с Jupyter
FROM jupyter/datascience-notebook:latest

# Устанавливаем дополнительные зависимости, если необходимо
RUN pip install matplotlib seaborn

# Устанавливаем рабочую директорию
WORKDIR /home/jovyan/work

# Копируем ваши Jupyter Notebook в контейнер
COPY EDA.ipynb .

# Создаем папку для сохранения графиков
RUN mkdir -p /home/jovyan/work/plots

