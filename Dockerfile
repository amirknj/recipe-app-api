FROM python:3.10-alpine


LABEL maintainer="amirkonjkav@gmail.com"

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1


COPY ./requirements.txt /tmp/requirements.txt
COPY ./app /app
WORKDIR /app
EXPOSE 8000

RUN python -m venv /py 
RUN python -m pip install --upgrade pip 
RUN /py/bin/pip install -r /tmp/requirements.txt && rm -rf /tmp 

RUN adduser --disabled-password --no-create-home django-user


ENV PATH="/py/bin:$PATH"

USER django-user

