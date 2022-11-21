import org.apache.spark._
import org.apache.spark.graphx._
import org.apache.spark.rdd.RDD

val v = spark.createDataFrame(List()).toDF()
val e = spark.createDataFrame(List()).toDF()
val g = GraphFrame(v, e)

val paths = g.bfs.fromExpr("id='a'").toExpr("id = 'd'").run()
val paths1 = g.shortestPaths.landmarks(Seq("a", "d")).run()
val results = g.triangleCount.run()
val results3 = g.pageRank.resetProbability(0.15).maxIter(10).sourceId("a").run()
val result = vertices.select(vertices("id")).except(outdegrees.select(outdegrees("id")))


val filteredPaths = g.bfs.fromExpr("name = 'Esther'").toExpr("age < 32")
  .edgeFilter("relationship != 'friend'")
  .maxPathLength(3)
  .run()
val youngest = g.vertices.groupBy().min("age")
val numFollows = g.edges.filter("relationship = 'follow'").count()
val result = g.stronglyConnectedComponents.maxIter(10).run()
val result = g.connectedComponents.run()
