# -*- coding: utf-8 -*-
"""
Created on Thu Jul 31 10:26:58 2025

@author: ASUS
"""

from pyspark.sql import SparkSession

spark = SparkSession.builder\
    .master("local")\
        .appName("test")\
            .getOrCreate()
            
data = [
    ('James', '', 'Smith', '1991-04-01', 'M', 3000),
    ('Michael', 'Rose', '', '2000-05-19', 'M', 4000),
    ('Robert', '', 'Williams', '1978-09-05', 'M', 4000),
    ('Maria', 'Anne', 'Jones', '1967-12-01', 'F', 4000),
    ('Jen', 'Mary', 'Brown', '1980-02-17', 'F', -1)
]


columns = ["First Name", "Middle Name", "Last Name", "Dob", "Gender", "Salary"]

df = spark.createDataFrame(data = data, schema = columns)

print(df.printSchema())