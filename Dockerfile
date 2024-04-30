FROM python:3.10-slim

WORKDIR /app

RUN apt-get update && apt-get install -y libpq-dev gcc && apt-get clean

COPY . /app

RUN pip install --no-cache-dir -r requirements.txt

EXPOSE 5200

ENV FLASK_APP=app.py
ENV FLASK_RUN_HOST=0.0.0.0
ENV FLASK_RUN_PORT=5200

CMD ["flask", "run"]
