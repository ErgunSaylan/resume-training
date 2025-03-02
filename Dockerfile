#pull official base image
FROM python:3.13-slim

RUN apt-get update

RUN apt-get install python3-dev build-essential -y

ENV PATH="/opt/venv/bin:$PATH"

#pip requirements
RUN pip install --upgrade pip
RUN pip install virtualenv && python -m virtualenv /opt/venv

ADD ./requirements.txt /tmp/requirements.txt
RUN pip install -r /tmp/requirements.txt

COPY . /srv/app
WORKDIR /srv/app


