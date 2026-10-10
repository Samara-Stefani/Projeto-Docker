FROM python:3.12-slim

WORKDIR /app

# Instala o ping e ferramentas de rede básicas
RUN apt-get update && apt-get install -y iputils-ping && rm -rf /var/lib/apt/lists/*

RUN useradd -m appuser && chown -R appuser:appuser /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

RUN chown -R appuser:appuser /app
USER appuser

EXPOSE 5000

CMD ["python", "app.py"]