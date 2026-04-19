This is a fun SQL project for my own purposes of learning, exploring and practicing PostgreSQL.

## What is the "SQL Murder Mystery"? 
It is a problem created for SQL practice. You are given a database with different kinds of information about people in 
the "SQL City". There is a report about a murder in the SQL City, which occurred on Jan.15, 2018. To solve the problem, you
need to explore the database using SQL and discover who stands behind this murder.

More information about the problem and the database can be found on the official website,
together with the solution checker:
https://mystery.knightlab.com/

## Files description
- `schema.png`: Shows formats of the tables and dependencies between primary and foreign keys.
- `murder_mystery.md`: My process of exploring and working with the database, supplemented by markdown notes.
- `murder_mystery.ipynb`: Jupyter notebook used to build markdown file `murder_mystery.md`.
- `murder_mystery.py`: Python file in which I carry out the same investigation as in the Jupyter notebook. The purpose of
this file was to learn how to connect and use SQL queries in Python. Some shorter queries are hardcoded, the more
complex ones are in `view_queries.sql` and `select_queries.sql`.
- `view_queris.sql`: Contains all queries for creating virtual tables, i.e. `VIEW`.
- `select_queries.sql`: Contains all queries for selecting specific information necessary for investigation.
- `LICENSE.txt`: License of this project.

### For this project the following languages were used:
- **PostgreSQL 18.3**
- **Python 3.13**
- **Jupyter notebook 7.5.5**