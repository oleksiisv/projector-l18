#!/bin/bash

echo 'Create user and grant permissions'
docker exec -it l18-db-master-1 mysql -uroot -proot123 l18_db -e "CREATE USER 'slave'@'%' IDENTIFIED WITH mysql_native_password BY 'slave123'; GRANT REPLICATION SLAVE ON *.* TO 'slave'@'%';"

#echo 'Import database dump file to master'
#docker exec -i l18-db-master-1 mysql -h127.0.0.1 -p3008 -uadmin -padmin123 l18_db < l18_db.sql

echo 'Show master status'
docker exec -it l18-db-master-1 mysql -uroot -proot123 l18_db -e "SHOW MASTER STATUS;"
