#!/bin/sh
set -e

if [ ! -z ${SSM_PATH} ]; then
  awsenv
  source /ssm/.env
fi

envsubst '$DB_USER $DB_PASS $DB_HOST $DB_PORT $DB_POOL_MINSIZE $DB_POOL_MAXSIZE' \
  < /home/zaop/Zoho/Analytics/conf/database_params.conf.template \
  > /home/zaop/Zoho/Analytics/conf/database_params.conf

tail -f /dev/null

# sh app_ctl.sh run


