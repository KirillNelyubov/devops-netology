# devops-netology
# Kirill Nelyubov

# Домашнее задание к занятию "6.4. PostgreSQL"

## Обязательная задача 1
    1. \l[+]   [PATTERN]      list databases
    2. \c[onnect] {[DBNAME|- USER|- HOST|- PORT|-] | conninfo}
    3. \dt[S+] [PATTERN]      list tables
    4. \d[S+]  NAME           describe table, view, sequence, or index
    5. \q                     quit psql
    
## Обязательная задача 2
    test_database=# SELECT attname,avg_width FROM pg_stats WHERE tablename = 'orders' and avg_width = (SELECT max(avg_width) FROM pg_stats WHERE tablename = 'orders');
     attname | avg_width 
    ---------+-----------
     title   |        16
    (1 row)

## Обязательная задача 3
1. SQL-транзакция:

       BEGIN;
       CREATE TABLE public.orders_1 (
           id integer NOT NULL,
           title character varying(80) NOT NULL,
           price integer DEFAULT 0
       );
       CREATE TABLE public.orders_2 (
           id integer NOT NULL,
           title character varying(80) NOT NULL,
           price integer DEFAULT 0
       );
       INSERT INTO orders_1 SELECT * FROM orders WHERE price > 499;
       INSERT INTO orders_2 SELECT * FROM orders WHERE price <= 499;
       COMMIT;

2. Автоматическое разбиение при проектировании таблицы orders:
 
       CREATE TABLE orders_1 (
           CHECK ( price > 499 )
       ) INHERITS ( orders );
       CREATE TABLE orders_2 (
           CHECK ( price <= 499 )
       ) INHERITS ( orders );
       CREATE RULE price1 AS ON INSERT TO orders
       WHERE ( price > 499 )
       DO INSTEAD INSERT INTO orders_1 VALUES (NEW.*);
       CREATE RULE price2 AS ON INSERT TO orders
       WHERE ( price <= 499 )
       DO INSTEAD INSERT INTO orders_2 VALUES (NEW.*);

## Обязательная задача 4
    ...
    CREATE TABLE public.orders (
        id integer NOT NULL,
        title character varying(80) NOT NULL,
        price integer DEFAULT 0,
        CONSTRAINT title_unique UNIQUE (title)
    );
    ...
Добавляем "CONSTRAINT title_unique UNIQUE (title)" соответственно для всех таблиц.