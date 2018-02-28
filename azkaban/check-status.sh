#!/bin/bash

status_log=/home/hadoop/logs/status.log
server_log=/home/hadoop/logs/server.log
tar_dir=/home/hadoop/azkaban/azkaban-solo-server/build/install/azkaban-solo-server/
time=`date +"%Y%m%d %H:%M:%S"`
status=`ps -ef | grep azkaban-solo-server | wc -l`
if [ $status -le 1 ]
then
echo ${time}'[INFO] Service down. Restart service' >> ${status_log}
cd ${tar_dir}
bin/azkaban-solo-start.sh >> ${server_log}
fi
