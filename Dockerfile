FROM python:3.12.1

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    && rm -rf /var/lib/apt/lists/*
RUN pip install --no-cache-dir --upgrade pip && \
    pip install --no-cache-dir -r master.txt

COPY . /app/
WORKDIR /app/

CMD gunicorn app:app & python3 main.py
