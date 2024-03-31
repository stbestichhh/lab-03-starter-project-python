FROM python:3.9-slim AS base

COPY requirements/backend.in .
RUN python -m venv .venv
ENV PATH="/.venv/bin:$PATH"

COPY requirements/backend.in .
RUN pip install -r backend.in

FROM python:3.9-slim
COPY --from=base /.venv /.venv
ENV PATH="/.venv/bin:$PATH"
COPY build build
COPY spaceship spaceship

CMD ["uvicorn", "spaceship.main:app", "--host=0.0.0.0", "--port=8080"]
