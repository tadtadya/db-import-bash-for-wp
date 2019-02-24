#!/bin/bash

# parameter
if [ "x$1" = "x" ]; then
  echo "Usage: $0 import_file"
  exit 0;
fi
new_file=$1

# db info
db_user="***"
db_pass="***"
db_name="***"
# backup file
db_bkfile=`date +%Y%m%d_%H%M%S`
db_bkfile="db_bkup_${db_bkfile}.sql"
# domain info
old_domain=***
new_domain=***

# command message
msg_comp="completed"

# Backup DB
msg="create database backup ..."
cmd1="echo ${msg}"
cmd2="mysqldump -u${db_user} -p${db_pass} ${db_name} > ${db_bkfile}"
cmd3="echo ${msg_comp}"

# Delete all table
msg="delete tables as ${db_name} ..."
cmd4="echo ${msg}"
cmd5='mysql --host=localhost --user=${db_user} --password=${db_pass} ${db_name} --execute "show tables" | while read table; do mysql --user=${db_user} --password=${db_pass} ${db_name} --execute "drop table if exists ${table}"; done'
cmd6="echo ${msg_comp}"

# Import DB
msg="import db ${new_file} ..."
cmd7="echo ${msg}"
cmd8="mysql -u${db_user} -p${db_pass} ${db_name} < ${new_file}"
cmd9="echo ${msg_comp}"

# Batch replacement of domains in DB
msg="replace domain ${old_domain} to ${new_domain} ..."
cmd10="echo ${msg}"
cmd11="wp search-replace ${old_domain} ${new_domain} --url=${old_domain} --network --path=/home/kusanagi/html/DocumentRoot"
cmd12="echo ${msg_comp}"

eval ${cmd1} && eval ${cmd2} && eval ${cmd3} && \
eval ${cmd4} && eval ${cmd5} && eval ${cmd6} && \
eval ${cmd7} && eval ${cmd8} && eval ${cmd9} && \
eval ${cmd10} && eval ${cmd11} && eval ${cmd12}
