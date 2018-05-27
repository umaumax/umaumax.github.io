#!/usr/bin/env sh
# /bin:/usr/bin
PATH=/usr/sbin:/usr/local/bin/:$PATH

cd $(dirname $0)
logfile='.gitbook.log'
port='4000'

type gitbook >/dev/null 2>&1
[[ $? != 0 ]] && echo 'no gitbook command' >>$logfile 2>&1 && exit 1

lsof -i:$port >/dev/null 2>&1
[[ $? == 0 ]] && exit 0 # running now

gitbook --port $port serve >>$logfile 2>&1 &
