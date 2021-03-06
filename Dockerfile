FROM alpine:3.7
RUN apk update && \
    apk add --no-cache python3 && \
    rm -r /usr/lib/python*/ensurepip && \
    pip3 install --upgrade pip setuptools && \
    if [ ! -e /usr/bin/pip ]; then ln -s pip3 /usr/bin/pip ; fi && \
    if [[ ! -e /usr/bin/python ]]; then ln -sf /usr/bin/python3 /usr/bin/python; fi && \
    rm -r /root/.cache

COPY ./requirements.txt /app/requirements.txt
RUN pip3 install -r /app/requirements.txt
COPY ./app /app
ENTRYPOINT [ "python3" ]
CMD [ "/app/app.py" ]
