FROM python:3.9.19-slim

WORKDIR /app

COPY requirements.txt .

# create virtual environment into my container
RUN  python -m venv /app/env \
    && . /app/env/bin/activate \
    && pip install --upgrade pip \
    && pip install --no-cache-dir -r requirements.txt \
    && python manage.py makemigrations \
    && python manage.py migrate

COPY . .

EXPOSE 8000

CMD [ "/app/env/bin/python","manage.py","runserver","0.0.0.0:8000" ]