#!/bin/bash


usage()
{
cat << EOF
usage: $0 

This script requires the following environment variables are set.

OPTIONS:
    DATABASE_NAME      
    DATABASE_USER
    DATABASE_PASSWORD
    DATABASE_PORT
    DATABASE_ENCODING
    DATABASE_DRIVER
    MIGRATIONS_PATH      
EOF
}

export MIGRATIONS_PATH=${MIGRATIONS_PATH:-'/home/flyway/migrations'}
export DATABASE_PORT=${DATABASE_PORT:-3306}
export DATABASE_ENCODING=${DATABASE_ENCODING:-UTF-8}

if [[ -z $DATABASE_NAME ]] || [[ -z $DATABASE_USER ]] || [[ -z $DATABASE_PASSWORD ]] || [[ -z $DATABASE_DRIVER ]] || [[ -z $MIGRATIONS_PATH ]]; then
    usage
    exit 1
fi

# while ! nc db $DATABASE_PORT </dev/null; do sleep 10; done
while ! nc web 8000 </dev/null; do sleep 10; done

flyway -url=jdbc:$DATABASE_DRIVER://db:$DATABASE_PORT/$DATABASE_NAME -user=$DATABASE_USER -password=$DATABASE_PASSWORD -encoding=$DATABASE_ENCODING -locations=filesystem:$MIGRATIONS_PATH baseline
flyway -url=jdbc:$DATABASE_DRIVER://db:$DATABASE_PORT/$DATABASE_NAME -user=$DATABASE_USER -password=$DATABASE_PASSWORD -encoding=$DATABASE_ENCODING -locations=filesystem:$MIGRATIONS_PATH migrate

