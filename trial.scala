import org.apache.spark.sql._
import org.apache.spark.sql.functions._
import org.graphframes._

val v = spark.createDataFrame(List(
  ("a", "Alice", 34),
  ("b", "Bob", 36),
  ("c", "Charlie", 30),
  ("d", "David", 29),
  ("e", "Esther", 32),
  ("f", "Fanny", 36),
  ("g", "Gabby", 60),
  ("h", "Hari", 23),
  ("i", "Indra", 33),
  ("j", "Jyothi", 32),
  ("k", "Karun", 22),
  ("l", "Leone", 21)
)).toDF("id", "name", "age")
// Edge DataFrame
val e = spark.createDataFrame(List(
  ("a", "b", "friend"),
  ("b", "a", "friend"),
  ("a", "k", "friend"),
  ("k", "a", "friend"),
  ("c", "b", "father"),
  ("c", "d", "son"),
  ("c", "e", "husband"),
  ("c", "f", "brother"),
  ("f", "c", "brother"),
  ("f", "g", "following"),
  ("a", "g", "following"),
  ("h", "g", "following"),
  ("l", "g", "following"),
  ("k", "l", "following"),
  ("k", "j", "friend"),
  ("j", "k", "friend"),
  ("i", "k", "friend")
)).toDF("src", "dst", "relationship")
val g = GraphFrame(v, e)
g.inDegrees.show()
val paths: DataFrame = g.bfs.fromExpr("id = 'f'").toExpr("id ='l'").run()
paths.show
g.degrees.select(g.degrees("id")).except(g.outDegrees.select(g.outDegrees("id"))).show
