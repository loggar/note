#!/bin/bash
# Shell script to replicate MySql database from REMOTE to LOCAL

# CONFIG - Only edit the below lines to setup the script
# ===============================

# REMOTE DB SETTINGS
REMOTE_USER=""
REMOTE_PASS=""
REMOTE_HOST=""
REMOTE_DB=""

# LOCAL DB SETTINGS
DB_USER=""
DB_PASS=""
DB_HOST="localhost"
DB_NAME=""

# SQL DUMP FILENAME
DUMP_FILE="replica-projectname-prod.sql"

# ===============================

# get remote database
echo "Dump database $REMOTE_HOST $REMOTE_DB"

if [ "$DB_PASS" == "" ];
then
  mysqldump -h $REMOTE_HOST -u $REMOTE_USER $REMOTE_DB > $DUMP_FILE
else
  mysqldump -h $REMOTE_HOST -u $REMOTE_USER -p$REMOTE_PASS $REMOTE_DB > $DUMP_FILE
fi

# drop all tables
echo "Drop database $DB_HOST $DB_NAME"

if [ "$DB_PASS" == "" ];
then
  mysqldump -u $DB_USER \
    --add-drop-table --no-data $DB_NAME | \
    grep -e '^DROP \| FOREIGN_KEY_CHECKS' | \
    mysql -u $DB_USER $DB_NAME
else
  mysqldump -u $DB_USER -p$DB_PASS \
    --add-drop-table --no-data $DB_NAME | \
    grep -e '^DROP \| FOREIGN_KEY_CHECKS' | \
    mysql -u $DB_USER -p$DB_PASS $DB_NAME
fi

# restore new database
echo "Restore database $DB_HOST $DB_NAME"

if [ "$DB_PASS" == "" ];
then
  mysql -u $DB_USER $DB_NAME < $DUMP_FILE
else
  mysql -u $DB_USER -p$DB_PASS $DB_NAME < $DUMP_FILE
fi
