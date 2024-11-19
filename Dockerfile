FROM python:3.9.19-slim

ENV PYTHONDONTWRITEBYTECODE 1
# allow python to display the real logs output in terminal in real time
ENV PYTHONUNBEFFERED 1  

WORKDIR /app

COPY . /app

RUN addgroup --system usrapp \
    && adduser --system --ingroup usrapp usrapp

COPY --chown=usrapp:usrapp entrypoint.sh /usr/local/bin/entrypoint.sh
COPY --chown=usrapp:usrapp launch.sh /usr/local/bin/launch.sh

USER root

RUN  pip install --upgrade pip \
    && pip install --no-cache-dir -r requirements.txt

EXPOSE 8000

RUN chmod +x /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/launch.sh



USER usrapp

ENTRYPOINT [ "entrypoint.sh" ]

CMD [ "launch.sh" ]