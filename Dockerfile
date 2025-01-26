FROM python:3.12-slim

# Установка рабочей директории
WORKDIR /home/jovyan/work

# Копирование файлов проекта
COPY . /home/jovyan/work

# Установка зависимостей
RUN pip install --no-cache-dir -r requirements.txt

# Установка Jupyter и Quarto
RUN pip install --no-cache-dir jupyter nbconvert quarto

# Установка Quarto (если требуется)
RUN curl -LO https://quarto.org/download/latest/quarto-linux-amd64.deb && \
    dpkg -i quarto-linux-amd64.deb && \
    rm quarto-linux-amd64.deb

# Команда по умолчанию (может быть переопределена при запуске контейнера)
CMD ["jupyter", "nbconvert", "--to", "notebook", "--execute", "EDA.ipynb", "--output-dir=/home/jovyan/work/plots", "--output=EDA_output.ipynb"]
