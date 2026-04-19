import sys
import pandas as pd
from sqlalchemy import create_engine, text
import psycopg
import os

pd.set_option('display.max_columns', None)
pd.set_option('display.max_colwidth', None)
pd.set_option('display.max_rows', 10)

db_user = os.environ['POSTGRES_USER']
db_password = os.environ['POSTGRES_PASSWORD']
db_host = os.environ['POSTGRES_HOST']
db_port = os.environ['POSTGRES_PORT']
db_name = os.environ['POSTGRES_DB']
engine = create_engine(f'postgresql+psycopg://{db_user}:{db_password}@{db_host}:{db_port}/{db_name}')


# Exploring the formats of the tables
print('Table interview:\n')
df = pd.read_sql_query('SELECT * FROM interview LIMIT 5;', engine)
print(df, '\n----------------------------------------------------------------------------\n')

print('Table get_fit_now_check_in:\n')
df = pd.read_sql_query('SELECT * FROM get_fit_now_check_in LIMIT 5;', engine)
print(df, '\n----------------------------------------------------------------------------\n')

print('Table get_fit_now_member:\n')
df = pd.read_sql_query('SELECT * FROM get_fit_now_member LIMIT 5;', engine)
print(df, '\n----------------------------------------------------------------------------\n')

print('Table facebook_event_checkin:\n')
df = pd.read_sql_query('SELECT * FROM facebook_event_checkin LIMIT 5;', engine)
print(df, '\n----------------------------------------------------------------------------\n')

print('Table person:\n')
df = pd.read_sql_query('SELECT * FROM person LIMIT 5;', engine)
print(df, '\n----------------------------------------------------------------------------\n')

print('Table drivers_license:\n')
df = pd.read_sql_query('SELECT * FROM drivers_license LIMIT 5;', engine)
print(df, '\n----------------------------------------------------------------------------\n')

print('Table income:\n')
df = pd.read_sql_query('SELECT * FROM income LIMIT 5;', engine)
print(df, '\n----------------------------------------------------------------------------\n')

print('Table crime_scene_report:\n')
df = pd.read_sql_query('SELECT * FROM crime_scene_report LIMIT 5;', engine)
print(df, '\n----------------------------------------------------------------------------\n')


# Create all the views at once
with open('view_queries.sql', 'r') as q:
    view_query = q.read().split(';')

with engine.connect() as conn:
    for command in view_query:
        clean_command = command.strip()
        if clean_command:
            conn.execute(text(clean_command))
            conn.commit()


# Execute queries with output
with open('select_queries.sql', 'r') as q:
    select_query = q.read().split(';')

with engine.connect() as conn:
    for command in select_query:
        clean_command = command.strip()
        if clean_command:
            conn.execute(text(clean_command))
            df = pd.read_sql_query(clean_command, engine)
            print(df, '\n----------------------------------------------------------------------------\n')