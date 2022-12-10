import org.apache.spark.sql._


object NewStreamHandler {
    def main(args: Array[String]) {
        // initialize Spark
        val spark = SparkSession
            .builder
            .appName("Stream Handler")
            .getOrCreate()

        import spark.implicits._

        // read from Kafka
        val inputDF = spark
            .readStream
            .format("kafka") // org.apache.spark:spark-sql-kafka-0-10_2.12:3.3.1
            .option("kafka.bootstrap.servers", "localhost:9092")
            .option("subscribe", "weather")
            .load()

        val query = inputDF
            .writeStream
            .outputMode("update")
            .format("console")
            .start()

        // until ^C
        query.awaitTermination()
    }
}

