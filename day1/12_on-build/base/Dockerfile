FROM python:3

RUN mkdir -p /usr/src/app
ONBUILD COPY ./src /usr/src/app

WORKDIR /usr/src/app

ONBUILD RUN pip install --no-cache-dir -r requirements.txt