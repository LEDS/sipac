FROM rdccosmo/flywaydb

RUN mkdir /home/flyway/sql
COPY ./container-files /
CMD sh /home/flyway/wait_for_django.sh
RUN bash
