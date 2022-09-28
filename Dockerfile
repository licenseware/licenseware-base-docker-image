# BASE
FROM python:3.10-slim-buster AS base

ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONFAULTHANDLER=1 \
    PYTHONUNBUFFERED=1

RUN echo "Base python image ready"

# DEPENDENCIES
FROM base AS dependencies

RUN echo "Installing dependencies on base"

RUN apt update && apt install -y git curl gcc libexpat1 bash

COPY requirements.txt .

ENV VIRTUAL_ENV=/opt/venv
RUN python3 -m venv $VIRTUAL_ENV
ENV PATH="$VIRTUAL_ENV/bin:$PATH"

RUN /opt/venv/bin/python3 -m pip install --upgrade pip && \
    pip uninstall -y licenseware && \
    pip install -r requirements.txt

RUN echo "Done!"

# RUNABLE APP
FROM dependencies AS run

RUN echo "Preparing the app"

ARG PORT=5000
ARG APP_DIR=/app
ARG USER=licenseware
ARG FILE_UPLOAD_PATH=/tmp/lware

WORKDIR ${APP_DIR}

RUN useradd -m ${USER} && \
    mkdir -p ${FILE_UPLOAD_PATH} && \
    chown ${USER}:${USER} ${FILE_UPLOAD_PATH}

ENV PYTHONPATH=/app/site-packages
COPY --from=dependencies /opt/venv/lib/python3.10/site-packages /app/site-packages
COPY . .

RUN echo '\nHere are the files copied:\n' && dir -s && echo '\nProcfile:' && cat Procfile && echo '\n'

EXPOSE ${PORT}
VOLUME ${FILE_UPLOAD_PATH}

USER ${USER}

RUN echo "Ready!"
