from pyspark.sql import SparkSession

spark = (
    SparkSession.builder.appName('Desafio')
    .getOrCreate()
)

# Ler os dados do RAIS 2020
rais = (
    spark
    .read
    .format('txt')
    .option('header', True)
    .option('inferSchema', True)
    .option('delimiter', ';')
    .load('s3://datalake-marlos-tf-producao-693916676536/raw/')
)

# Salvando em formato Parquet
(
    rais
    .write
    .mode('overwrite')
    .format('parquet')
    #.partitionBy('year')
    .save('s3://datalake-marlos-tf-producao-693916676536/staging/')
)