#!/bin/bash
# Конвертация .qmd в .html с помощью Quarto.
quarto render ./quarto/clf.qmd --to html --output-dir ../public
mv ./public/clf.html ./public/index.html  # Переименование файла для удобства доступа
