FROM python:3.12-alpine3.20

COPY ./requirements.txt /requirements.txt

RUN pip install -r /requirements.txt

RUN pip install setuptools

COPY ./pleroma_bot /pleroma_bot
COPY ./setup.py /setup.py
COPY ./README.md /README.md
COPY ./LICENSE.md /LICENSE.md

RUN python setup.py install

VOLUME /data

WORKDIR /data

CMD ["pleroma-bot"]
