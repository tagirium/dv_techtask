FROM python:3.8

WORKDIR /

COPY requirements.txt requirements.txt
COPY ./app .

RUN pip3 install -r requirements.txt --no-cache-dir && adduser user

USER user
HEALTHCHECK --interval=5m --timeout=3s \
    CMD curl -f http://localhost/ || exit 1
CMD [ "uvicorn", "index:app", "--reload", "--host", "0.0.0.0", "--ssl-certfile", "./app/techtask.crt", "--ssl-keyfile", "./app/techtask.key"]