from pyspark.sql.functions import mean, max, min, col, count
from pyspark.sql import SparkSession

spark = (
    SparkSession.builder.appName('TrabalhoPratico')
    .getOrCreate()
)

# Ler os dados do ENEM 2020
enem = (
    spark
    .read
    .format('csv')
    .option('header', True)
    .option('inferSchema', True)
    .option('delimiter', ';')
    .load('s3://datalake-marlos-693916676536/raw-data/')
)

# Salvando em formato Parquet
(
    enem
    .write
    .mode('overwrite')
    .format('parquet')
    #.partitionBy('year')
    .save('s3://datalake-marlos-693916676536/consumer-zone/')
)