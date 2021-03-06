FROM python:3.7-alpine

WORKDIR /usr/src/app

COPY requirements.txt ./

RUN apk update && \
    apk add postgresql-libs && \
    apk --virtual .build-deps add gcc musl-dev postgresql-dev && \
    pip install -r requirements.txt && \
    apk --purge del .build-deps

COPY . ./
