import os
import sys
import subprocess
from pyspark.sql import SparkSession

def check_python():
    print("Python Executable:", sys.executable)
    print("Python Version:", sys.version)

def check_java():
    try:
        # Run 'java -version' command and capture output
        result = subprocess.run(["java", "-version"], capture_output=True, text=True)
        # Java version info is sent to stderr
        if result.stderr:
            print("Java Version Info:")
            print(result.stderr.strip())
        else:
            print("Java version info not found.")
    except FileNotFoundError:
        print("Java is not installed or 'java' command is not in PATH.")

def check_spark():
    try:
        spark = SparkSession.builder.appName("DependencyCheck").getOrCreate()
        print("PySpark Version:", spark.sparkContext.pythonVer)
        print("Spark Version:", spark.version)
        spark.stop()
    except Exception as e:
        print("SparkSession could not be initialized:", str(e))

if __name__ == "__main__":
    print("===== Checking Python =====")
    check_python()
    print("\n===== Checking Java =====")
    check_java()
    print("\n===== Checking Spark and PySpark =====")
    check_spark()
