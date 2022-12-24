
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
spark-shell --packages org.apache.spark:spark-sql-kafka-0-10_2.12:3.3.1

=======================================================================================

(Wrapping Scala file in set and executing it)

->Project
    -> StreamHandler
       ->src
         ->main
	  ->scala
	   ->StreamHandler.scala
		    
    -> iot_devices.ipynb



## Define .scala file
## Define .sbt file accordingly

# open a new terminal (get to the desired path which contains the above mentioned scala and sbt files:
 here it is StreamHandler folder)

sbt package (will take some time)
a .jar file will be created in target/scala-2.12/ (this jar file is to be executed)

spark-submit --class StreamHandler --master "local[*]" --packages "org.apache.spark:spark-sql-kafka-0-10_2.12:3.3.1" target/scala-2.12/streamhandler_2.12-0.1.0-SNAPSHOT.jar
