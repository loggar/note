#!/bin/bash
# Shell script to replicate MySql database from REMOTE to LOCAL

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
REMOTE_DUMP_FILE="/path/to/dump.sql"
DUMP_FILE="/root/mysql/sql-script/dump.sql"

# ===============================

# get remote database
echo "Dump database $REMOTE_HOST $REMOTE_DB"
ssh $REMOTE_USER@$REMOTE_HOST sudo "mysqldump -u $REMOTE_USER -p$REMOTE_PASS --routines $REMOTE_DB > $REMOTE_DUMP_FILE"

echo "Copy dump $REMOTE_HOST $REMOTE_DB"
scp $REMOTE_USER@$REMOTE_HOST:$REMOTE_DUMP_FILE $DUMP_FILE

# drop all tables
echo "Drop database $DB_HOST $DB_NAME"
mysqldump -u $DB_USER -p$DB_PASS \
  --add-drop-table --no-data $DB_NAME | \
  grep -e '^DROP \| FOREIGN_KEY_CHECKS' | \
  mysql -u $DB_USER -p$DB_PASS $DB_NAME

# restore new database
echo "Restore database $DB_HOST $DB_NAME"
mysql -u $DB_USER -p$DB_PASS $DB_NAME < $DUMP_FILE
