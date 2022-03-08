FROM alpine:3.8

RUN mkdir -p /var/python_apps/flaskapp1
    
ENV FLASK_PATH /var/python_apps/flaskapp1

ENV FLASK_USER flaskuser

RUN adduser  -h $FLASK_PATH -s /bin/sh -D  $FLASK_USER

WORKDIR  $FLASK_PATH

COPY  .  .

RUN chown -R $FLASK_USER:$FLASK_USER $FLASK_PATH

RUN apk update && apk add python3 --no-cache

RUN pip3 install -r requirements.txt

USER $FLASK_USER

EXPOSE 4000

CMD ["app.py"]

ENTRYPOINT ["python3"]

