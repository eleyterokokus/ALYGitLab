#!/bin/bash
# Конвертация .ipynb в .qmd с помощью Quarto.
mkdir -p quarto  # Создаем директорию для Quarto, если она не существует
quarto convert ./notebook/clf.ipynb -o ./quarto/clf.qmd
