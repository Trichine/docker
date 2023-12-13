#!/bin/bash
DBHOST="db"
DBPORT="3306"
DBLOGIN="root"
DBPASS="1234"
DST="/backup"

mkdir -p "$DST"
mkdir /backup
chmod 777 /backup
databases=$(mysql -h"$DBHOST" -P"$DBPORT" -u"$DBLOGIN" -p"$DBPASS" -N -e "SHOW DATABASES")
for DB in $databases
do
    if [ "$DB" != "information_schema" ] && [ "$DB" != "performance_schema" ] && [ "$DB" != "mysql" ] && [ "$DB" != "sys" ]
    then
        echo "Generating mysql backup for database $DB"
        mysqldump -h "$DBHOST" -P "$DBPORT" -u"$DBLOGIN" -p"$DBPASS" "$DB" | gzip --rsyncable > "$DST/$DB.`date +%Y%m%d-%H%M`.sql.gz"
    fi
done
