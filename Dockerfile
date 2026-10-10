FROM python:3.12-slim

# Instala o ping
RUN apt-get update && apt-get install -y --no-install-recommends iputils-ping \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Cria o usuário não-root
RUN useradd -m appuser && chown -R appuser:appuser /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

# Ajusta as permissões
RUN chown -R appuser:appuser /app

USER appuser

EXPOSE 5000

CMD ["python", "app/app.py"]