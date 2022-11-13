#!/bin/bash

MASTER_LOG_FILE=${1}
MASTER_LOG_POS=${2}

echo 'Configure replications'
docker exec -it l18-db-slave-1-1 mysql -uroot -proot123 -e "STOP SLAVE; CHANGE MASTER TO MASTER_HOST='db-master', MASTER_USER='slave', MASTER_PASSWORD='slave123', MASTER_LOG_FILE = '${MASTER_LOG_FILE}', MASTER_LOG_POS = ${MASTER_LOG_POS}; START SLAVE;"

docker exec -it l18-db-slave-2-1 mysql -uroot -proot123 -e "STOP SLAVE; CHANGE MASTER TO MASTER_HOST='db-master', MASTER_USER='slave', MASTER_PASSWORD='slave123', MASTER_LOG_FILE = '${MASTER_LOG_FILE}', MASTER_LOG_POS = ${MASTER_LOG_POS}; START SLAVE;"