# ⚡ PySpark Project

This project uses **Apache Spark with Python (PySpark)** for big data processing and analysis.

---

## 🛠️ Requirements

- Python 3.x
- Java 8 or 11
- Apache Spark installed
- PySpark package

---

## 📦 Installation

1. Install PySpark via pip:

```bash
pip install pyspark
```

Ensure Java and Spark are properly set up in your system environment variables (JAVA_HOME, SPARK_HOME).


Use the following command to run your PySpark script:

spark-submit your_script.py
Or for testing small snippets:

Example: your_script.py

```bash
from pyspark.sql import SparkSession

spark = SparkSession.builder \
    .appName("My PySpark App") \
    .getOrCreate()

data = [("Ruthra", 28), ("Ram", 32)]
df = spark.createDataFrame(data, ["Name", "Age"])
df.show()

spark.stop()

```


##  Topics Covered

- Introduction to PySpark
- SparkSession and SparkContext
- RDDs and transformations/actions
- DataFrames and Spark SQL
- Data cleaning and manipulation
- Aggregations and groupBy operations
- Joins in DataFrames
- Spark MLlib (basic models)
- Performance tuning basics
- File formats: CSV, JSON, Parquet
- UDFs (User Defined Functions)
