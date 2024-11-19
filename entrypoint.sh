#!/bin/sh

# make sure the database server is running before trying to connect

function db_is_ready() {
python << END
import psycopg2
import sys
try:
    print("Trying to connect to database....")
    connection = psycopg2.connect(
            dbname='postgres',
            user='postgres',
            password='ngandiko',
            host='db',
            port='5432'
    )
    #print("Data base is still running....")
except Exception as e:
    print(e)
    sys.exit(1)

sys.exit(0)
END
}

until db_is_ready; do
  >&2 echo "databse is not ready!!!!"
  sleep 1
done

>&2 echo "Database is up and ready to accept connections...."

exec "$@"