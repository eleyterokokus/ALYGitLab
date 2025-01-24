# Используем базовый образ Python
FROM python3.9-slim

# Устанавливаем рабочую директорию
WORKDIR usrsrcapp

# Копируем файлы зависимостей
COPY requirements.txt .

# Устанавливаем зависимости
RUN pip install --no-cache-dir -r requirements.txt

# Копируем весь код приложения
COPY . .

# Открываем порт, если необходимо
#EXPOSE 5000

# Определяем команду для запуска приложения
CMD [python, app.py]
