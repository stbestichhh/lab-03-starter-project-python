FROM python:3.9-slim

COPY . /app
WORKDIR /app

RUN python -m venv .venv
RUN pip install -r requirements/backend.in

CMD ["uvicorn", "spaceship.main:app", "--host=0.0.0.0", "--port=8080"]
