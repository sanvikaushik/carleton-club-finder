import psycopg2
from psycopg2.extensions import ISOLATION_LEVEL_AUTOCOMMIT

DB_NAME = "club_app_db"
DB_USER = "postgres"
DB_PASSWORD = "Gosensgo11!"
DB_HOST = "localhost"
DB_PORT = "5432"

# Connect to default postgres database
conn = psycopg2.connect(
    dbname="postgres",
    user=DB_USER,
    password=DB_PASSWORD,
    host=DB_HOST,
    port=DB_PORT
)
conn.set_isolation_level(ISOLATION_LEVEL_AUTOCOMMIT)
cur = conn.cursor()

cur.execute(f"SELECT 1 FROM pg_database WHERE datname = '{DB_NAME}'")
exists = cur.fetchone()

if not exists:
    cur.execute(f"CREATE DATABASE {DB_NAME}")
    print(f"Database '{DB_NAME}' created.")
else:
    print(f"Database '{DB_NAME}' already exists.")

cur.close()
conn.close()

# Connect to the target database and run schema
conn = psycopg2.connect(
    dbname=DB_NAME,
    user=DB_USER,
    password=DB_PASSWORD,
    host=DB_HOST,
    port=DB_PORT
)
cur = conn.cursor()

with open("schema.sql", "r", encoding="utf-8") as f:
    cur.execute(f.read())

conn.commit()
cur.close()
conn.close()

print("Schema created successfully.")