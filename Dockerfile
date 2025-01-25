FROM python:3.12-slim

# Копирование файлов проекта
COPY . /app

# Установка директории проекта
WORKDIR /app

# Установка зависимостей
RUN pip install --no-cache-dir -r requirements.txt

# Запуск Python скрипта
CMD ["python", "src/clf.py"]
