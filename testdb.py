
import psycopg2


def test_dbconnection():
    try:
        connection = psycopg2.connect(
                dbname='postgres',
                user='postgres',
                password='ngandiko',
                host='localhost',
                port='5432'
        )
        print("Data base is still running....")
    except Exception as e:
        print(e)

