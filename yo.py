## TO START ZOOKEEPER AND KAFKA SERVER
bin/zookeeper-server-start.sh config/zookeeper.properties
bin/kafka-server-start.sh config/server.properties


## TO CREATE A TOPIC
bin/kafka-topics.sh --create -bootstrap-server localhost:9092 --topic weather

## TO LIST PRESENT TOPICS
bin/kafka-topics.sh --list --bootstrap-server localhost:9092


## START A CONSUMER
bin/kafka-console-consumer.sh --bootstrap-server localhost:9092 --topic weather --from-beginning


## Define .scala file
## Define .sbt file accordingly

# open a new terminal (get to the desired path which contains the above mentioned scala and sbt files:
 here it is StreamHandler folder)
sbt package (will take some time)
a .jar file will be created in target/scala-2.12/ (this jar file is to be executed)

spark-submit --class StreamHandler --master local[*] --packages "org.apache.kafka-0-10_2.11:3.3.1" target/scala-2.12/streamhandler_2.12-0.1.0-SNAPSHOT.jar
