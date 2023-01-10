
=================================. INSTRUCTIONS .==================================== 
(Basic Starting of Kafka)

## START ZOOKEEPER SERVER AND KAFKA SERVER

zookeeper-server-start /Users/amruthashok/Desktop/BigData/kafka_2.13-3.3.1/config/zookeeper.properties 

kafka-server-start /Users/amruthashok/Desktop/BigData/kafka_2.13-3.3.1/config/server.properties 

## TO CREATE A TOPIC
kafka-topics --create -bootstrap-server localhost:9092 --topic weather

## TO LIST PRESENT TOPICS
kafka-topics --list --bootstrap-server localhost:9092

## START KAFKA CONSUMER
kafka-console-consumer --bootstrap-server localhost:9092 --topic weather --from-beginning
	
## STARTING SPARK SHELL WITH PACKAGES
spark-shell --conf "spark.mongodb.input.uri=mongodb://127.0.0.1/test.myCollection?readPreference=primaryPreferred" --conf "spark.mongodb.output.uri=mongodb://127.0.0.1/Trial.stock" --packages org.apache.spark:spark-sql-kafka-0-10_2.12:3.3.1,org.mongodb.spark:mongo-spark-connector:10.0.0
				
				
=====================================. END .================================================
