#!/bin/bash

# check for some environment variables that should always be present
for i in IRIDA_DATABASE_USER IRIDA_DATABASE_PASS IRIDA_DATABASE_NAME; do
  if [ "${!i}" == "" ]; then
    echo -e "environment variable $i not set\n"
    echo -e "make sure to run docker-compose from the project root where .env lives\n"
    exit 2
  fi
done

# write config files
cat /irida.conf.template | envsubst > /etc/irida/irida.conf
cat /web.conf.template   | envsubst > /etc/irida/web.conf

# start tomcat
catalina.sh run
