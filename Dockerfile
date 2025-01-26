FROM python:3.12-slim

# Установка рабочей директории
WORKDIR /app

# Копирование файлов проекта
COPY . /app

# Установка зависимостей
RUN pip install --no-cache-dir -r requirements.txt

# Установка Jupyter
RUN pip install --no-cache-dir jupyter nbconvert

# Установка переменной окружения для Jupyter
ENV JUPYTER_TOKEN=your_token  # Опционально, для безопасности

# Команда по умолчанию (может быть переопределена при запуске контейнера)
CMD ["jupyter", "nbconvert", "--to", "notebook", "--execute", "EDA.ipynb", "--output-dir=/app/plots", "--output=EDA_output.ipynb"]
