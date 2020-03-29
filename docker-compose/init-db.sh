#!/usr/bin/env bash
files=$(find /sql -name "*.sql" -exec ls {} \;| grep -v postgres | sort | tr ' ' '|' | tr '\n' ' ')
printf "${files}\n"
for file in ${files}
do
    file=$(echo ${file} | tr '|' ' ')
    printf "Applying update ${file}\n"
    mysql -uroot -p$MYSQL_ROOT_PASSWORD -h sc-mysql < ${file}
done
