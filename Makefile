get-example:
	if [ ! -f example/SparkWriteApplication.jar ]; then \
	wget -O example/SparkWriteApplication.jar https://www.dropbox.com/s/7dn0horm8ocbu0p/SparkWriteApplication.jar ; \
	fi

example: get-example
	docker run --rm -it --network docker-hadoop-spark-workbench_default --env-file ./hadoop.env -e SPARK_MASTER=spark://spark-master:7077 --volume $(shell pwd)/example:/example plc9/spark-master-hadoop2.8.0-hive:first /spark/bin/spark-submit --master spark://spark-master:7077 /example/SparkWriteApplication.jar
	docker exec -it namenode hadoop fs -cat /tmp/numbers-as-text/part-00000

clean-example:
	docker exec -it namenode hadoop fs -rm -r /tmp/numbers-as-text
