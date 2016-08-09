#!/bin/bash

while ! ncat $DATABASE_HOST $DATABASE_PORT </dev/null; do sleep 10; done

python ./sipac/manage.py migrate
python ./sipac/manage.py runserver 0.0.0.0:8000
