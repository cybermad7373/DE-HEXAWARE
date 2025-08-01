from pyspark.sql import SparkSession

spark = SparkSession.builder \
    .appName("Test") \
    .getOrCreate()

print("Spark Version:", spark.version)
spark.stop()
