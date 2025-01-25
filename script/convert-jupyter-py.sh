#!/bin/bash
# Конвертация .ipynb в .py с помощью Jupyter
jupyter nbconvert ./notebook/clf.ipynb --to python --output ../clf.py --no-prompt
