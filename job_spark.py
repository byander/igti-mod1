from pyspark.sql import SparkSession

spark = SparkSession.builder.appName('TestSpark').getOrCreate()

# Ler dados
df = (
    spark
    .read
    .format('csv')
    .option('header', True)
    .option('inferSchema', True)
    .option('delimiter', ';')
    .load('s3://datalake-ander-890625003384/raw-data/rais/teste.txt')
)

# Salvar em parquet
(
    df
    .write
    .mode('overwrite')
    .format('parquet')
    .save('s3://datalake-ander-890625003384/staging/rais/')
)
