#!/bin/bash
while ! exec 6<>/dev/tcp/${DATABASE_HOST}/${DATABASE_PORT}; do
    echo "Trying to connect to MySQL at ${DATABASE_PORT}..."
    sleep 30
done

echo "About to launch the Spring Boot application......"

##!/bin/sh
#
#MYSQL_LOOPS="10"
#i=0
#while ! nc $DATABASE_HOST $DATABASE_PORT >/dev/null 2>&1 < /dev/null; do
#  i=`expr $i + 1`
#  if [ $i -ge $MYSQL_LOOPS ]; then
#    echo "$(date) - ${DATABASE_HOST}:${DATABASE_PORT} still not reachable, giving up"
#    exit 1
#  fi
#  echo "$(date) - waiting for ${DATABASE_HOST}:${DATABASE_PORT}..."
#  sleep 10
#done

java -Djava.security.egd=file:/dev/./urandom -Dspring.profiles.active=container -jar /app.jar