#!/bin/bash


HOSTNAME=$(`echo hostname`)

sed -i "s/server1/server-${HOSTNAME}/g" slave_dyn.xml

if [ "$CARTE_USER" -a "$CARTE_PASS" ]; then
   echo "${CARTE_USER}: $CARTE_PASS" > pwd/kettle.pwd
fi

./carte.sh slave_dyn.xml
