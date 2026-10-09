FROM python:3.11-slim

WORKDIR /app

# Копіюємо залежності та встановлюємо їх
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Копіюємо код програми
COPY main.py .

# Вказуємо точний шлях до вкладеної папки, але в контейнер копіюємо як просто front-init
COPY front-init/front-init ./front-init

# Відкриваємо порт для HTTP-сервера
EXPOSE 3000

CMD ["python", "main.py"]
