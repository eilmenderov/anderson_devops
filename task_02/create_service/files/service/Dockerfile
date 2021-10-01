FROM python:alpine 

LABEL maintainer="Avchar"

RUN pip install flask
RUN	pip install emoji --upgrade
RUN rm -rf /var/lib/apt/lists/*

ENV STATIC_URL /static
ENV STATIC_PATH /var/www/app/static

COPY ./app.py /src/
COPY ./requirements.txt /var/www/requirements.txt

WORKDIR /src 

EXPOSE 8080

ENTRYPOINT ["python", "/src/app.py"]
