FROM python:3.12-slim

WORKDIR /app

# Cria o usuário não-root primeiro e ajusta a pasta de trabalho
RUN useradd -m appuser && chown -R appuser:appuser /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

# Transfere a posse de todos os arquivos copiados para o appuser
RUN chown -R appuser:appuser /app
USER appuser

EXPOSE 5000

CMD ["python", "app.py"]