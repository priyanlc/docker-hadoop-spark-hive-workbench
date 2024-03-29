#!/bin/bash

docker-compose -f docker-compose.yml up -d namenode hive-metastore-postgresql
docker-compose -f docker-compose.yml up -d datanode1 datanode2 hive-metastore
docker-compose -f docker-compose.yml up -d hive-server
docker-compose -f docker-compose.yml up -d spark-master spark-worker1 spark-worker2 zeppelin hue

my_ip=`ip route get 1|awk '{print $NF;exit}'`
echo "Namenode: http://${my_ip}:50070"
echo "Datanode: http://${my_ip}:50075"
echo "Spark-master: http://${my_ip}:8080"
echo "Hue (HDFS Filebrowser): http://${my_ip}:8088/home"
echo "zeppelin : http://${my_ip}:9090"

