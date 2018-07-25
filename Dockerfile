FROM python:3.6-alpine
MAINTAINER Dominik Kapisinsky <dkapisinsky@gmail.com>

RUN apk add --no-cache postgresql-dev libpq gcc build-base libsodium-dev libffi-dev musl-dev

COPY requirements.txt /requirements.txt
RUN pip install -U setuptools pip wheel \
    && pip install -r /requirements.txt

WORKDIR /src

CMD ["pip-compile", "--upgrade", "requirements.in"]
