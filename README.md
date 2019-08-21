* [This Hadoop-hive-spark workbench is based on](http://www.big-data-europe.eu/scalable-sparkhdfs-workbench-using-docker/)

# How to use HDFS/Spark Workbench

To start an HDFS/Spark Workbench:
```
    ./start-hadoop-spark-workbench-with-Hive.sh
```
This will start the following services 
namenode
datanode1 
datanode2
hive-metastore-postgresql  -this is the postgresql database
hive-server 
hive-metastore
hue - shut this down if not required
spark-master
spark-worker 1 to 4


## Starting workbench for debugging 

Start in new terminal for each line.
```
docker-compose -f docker-compose-hive.yml up  namenode hive-metastore-postgresql
docker-compose -f docker-compose-hive.yml up  datanode hive-metastore
docker-compose -f docker-compose-hive.yml up  hive-server
docker-compose -f docker-compose-hive.yml up  spark-master spark-worker1 spark-worker2 spark-worker3 spark-worker4  hue
```

## Interfaces

* Namenode: http://localhost:50070
* Datanode: http://localhost:50075
* Spark-master: http://localhost:8080
* Hue (HDFS Filebrowser): http://localhost:8088/home


## Hive test 
```
Load data into Hive:
  $ docker-compose exec hive-server bash
  # /opt/hive/bin/beeline -u jdbc:hive2://localhost:10000
  > CREATE TABLE pokes (foo INT, bar STRING);
  > LOAD DATA LOCAL INPATH '/opt/hive/examples/files/kv1.txt' OVERWRITE INTO TABLE pokes;
  > select * from pokes;
  > describe extended pokes 

```

## Spark test 
```
make example


To remove created data run:

make clean-example

```

## Maintainer
* priyanchandrapala at yahoo.co.uk

