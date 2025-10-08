FROM node:20-slim AS frontend
ENV PNPM_HOME="/pnpm"
ENV PATH="$PNPM_HOME:$PATH"
RUN corepack enable
COPY /web /app
WORKDIR /app

FROM frontend AS frontend-builder
RUN --mount=type=cache,id=pnpm,target=/pnpm/store pnpm install --frozen-lockfile
RUN pnpm run build

FROM python:3.13-slim AS backend-builder

ENV UV_LINK_MODE=copy \
    UV_PROJECT_ENVIRONMENT=.venv \
    PIP_DISABLE_PIP_VERSION_CHECK=1 \
    PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1

RUN pip install --no-cache-dir uv && uv --version

WORKDIR /app

COPY api/pyproject.toml api/uv.lock ./

RUN uv sync --frozen --no-dev

FROM python:3.13-slim AS runtime

ENV PIP_DISABLE_PIP_VERSION_CHECK=1 \
    PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1

RUN useradd -u 10001 -m appuser

WORKDIR /app

COPY --from=backend-builder /app/.venv /app/.venv
ENV PATH="/app/.venv/bin:${PATH}"

COPY api/ .
COPY --from=frontend-builder /app/dist /web

EXPOSE 8000

USER 10001

CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
