#!/bin/bash
# Shell script to replicate MySql database from REMOTE to LOCAL

# CONFIG - Only edit the below lines to setup the script
# ===============================

# LOCAL DB SETTINGS
DB_USER=""
DB_PASS=""
DB_HOST="localhost"
DB_NAME=""

# SQL DUMP FILENAME
DUMP_FILE="/path/to/already-exist-dump.sql"

# ===============================

# drop all tables
echo "Drop database $DB_HOST $DB_NAME"

mysqldump -u $DB_USER -p$DB_PASS \
  --add-drop-table --no-data $DB_NAME | \
  grep -e '^DROP \| FOREIGN_KEY_CHECKS' | \
  mysql -u $DB_USER -p$DB_PASS $DB_NAME

# restore new database
echo "Restore database $DB_HOST $DB_NAME"

mysql -u $DB_USER -p$DB_PASS $DB_NAME < $DUMP_FILE
