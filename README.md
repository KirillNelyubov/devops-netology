# devops-netology
# Kirill Nelyubov

# Домашнее задание к занятию "6.2. SQL"

## Обязательная задача 1
    version: '3.1'
    
    volumes:
      pg_project: {}
      pg_backup: {}
      dbeaver: {}
    
    services:
      db:
        image: postgres:12
        restart: always
        environment:
          POSTGRES_PASSWORD: example
        volumes:
          - pg_project:/var/lib/postgresql/data
          - pg_backup:/var/lib/postgresql/backup
    
      adminer:
        image: adminer
        restart: always
        ports:
          - 8080:8080
    
      cloudbeaver:
        image: dbeaver/cloudbeaver:latest
        volumes:
          - dbeaver:/opt/cloudbeaver/workspace
        ports:
          - 8081:8978

## Обязательная задача 2
1.
       postgres=# \l
                                            List of databases
          Name    |  Owner   | Encoding |  Collate   |   Ctype    |       Access privileges        
       -----------+----------+----------+------------+------------+--------------------------------
        postgres  | postgres | UTF8     | en_US.utf8 | en_US.utf8 | 
        template0 | postgres | UTF8     | en_US.utf8 | en_US.utf8 | =c/postgres                   +
                  |          |          |            |            | postgres=CTc/postgres
        template1 | postgres | UTF8     | en_US.utf8 | en_US.utf8 | =c/postgres                   +
                  |          |          |            |            | postgres=CTc/postgres
        test_db   | postgres | UTF8     | en_US.utf8 | en_US.utf8 | =Tc/postgres                  +
                  |          |          |            |            | postgres=CTc/postgres         +
                  |          |          |            |            | "test-admin-user"=CTc/postgres
       (4 rows)
2.
       postgres=# \c test_db
       You are now connected to database "test_db" as user "postgres".
       test_db=# \dt
                 List of relations
        Schema |  Name   | Type  |  Owner   
       --------+---------+-------+----------
        public | clients | table | postgres
        public | orders  | table | postgres
       (2 rows)
3.
       test_db=#  SELECT grantee,table_name,privilege_type FROM information_schema.table_privileges WHERE table_schema = 'public';
            grantee      | table_name | privilege_type 
       ------------------+------------+----------------
        postgres         | orders     | INSERT
        postgres         | orders     | SELECT
        postgres         | orders     | UPDATE
        postgres         | orders     | DELETE
        postgres         | orders     | TRUNCATE
        postgres         | orders     | REFERENCES
        postgres         | orders     | TRIGGER
        test-simple-user | orders     | INSERT
        test-simple-user | orders     | SELECT
        test-simple-user | orders     | UPDATE
        test-simple-user | orders     | DELETE
        test-admin-user  | orders     | INSERT
        test-admin-user  | orders     | SELECT
        test-admin-user  | orders     | UPDATE
        test-admin-user  | orders     | DELETE
        test-admin-user  | orders     | TRUNCATE
        test-admin-user  | orders     | REFERENCES
        test-admin-user  | orders     | TRIGGER
        postgres         | clients    | INSERT
        postgres         | clients    | SELECT
        postgres         | clients    | UPDATE
        postgres         | clients    | DELETE
        postgres         | clients    | TRUNCATE
        postgres         | clients    | REFERENCES
        postgres         | clients    | TRIGGER
        test-simple-user | clients    | INSERT
        test-simple-user | clients    | SELECT
        test-simple-user | clients    | UPDATE
        test-simple-user | clients    | DELETE
        test-admin-user  | clients    | INSERT
        test-admin-user  | clients    | SELECT
        test-admin-user  | clients    | UPDATE
        test-admin-user  | clients    | DELETE
        test-admin-user  | clients    | TRUNCATE
        test-admin-user  | clients    | REFERENCES
        test-admin-user  | clients    | TRIGGER
       (36 rows)

## Обязательная задача 3
    test_db=# INSERT INTO clients (фамилия,"страна проживания") VALUES ('Ritchie Blackmore','Russia');
    INSERT 0 1
    test_db=# SELECT COUNT(*) FROM orders;
     count 
    -------
         5
    (1 row)
    
    test_db=# SELECT COUNT(*) FROM clients;
     count 
    -------
         5
    (1 row)
    
## Обязательная задача 4
1. 
       test_db=# UPDATE clients SET заказ = 'Книга' WHERE фамилия = 'Иванов Иван Иванович';
       UPDATE 1
       test_db=# UPDATE clients SET заказ = 'Монитор' WHERE фамилия = 'Петров Петр Петрович';
       UPDATE 1
       test_db=# UPDATE clients SET заказ = 'Гитара' WHERE фамилия = 'Иоганн Себастьян Бах';
       UPDATE 1
2. 
       test_db=# SELECT фамилия FROM clients WHERE заказ != '';
              фамилия        
       ----------------------
        Иванов Иван Иванович
        Петров Петр Петрович
        Иоганн Себастьян Бах
       (3 rows)

## Обязательная задача 5
    postgres=# \c test_db
    You are now connected to database "test_db" as user "postgres".
    test_db=# EXPLAIN SELECT фамилия FROM clients WHERE заказ <> '';
                            QUERY PLAN                         
    -----------------------------------------------------------
     Seq Scan on clients  (cost=0.00..13.50 rows=279 width=84)
       Filter: ("заказ" <> ''::bpchar)
    (2 rows)
cost=0.00..13.50 - приблизительная стоимость запуска. Это время, которое проходит, прежде чем начнётся этап вывода данных.           

rows=279 - число записей, обработанных для получения выходных данных.

width=84 - ожидаемый средний размер строк, выводимых этим запросом (в байтах).

Filter: ("заказ" <> ''::bpchar) - соответственно фильтр запроса.

## Обязательная задача 6
    vagrant@server1:~$ docker exec -it vagrant_db_1 su - postgres_
    postgres@95cdb8f45739:~$ pg_dumpall backup/instance.bak
    ...
    vagrant@server1:~$ docker run --rm --name new_pg -e POSTGRES_PASSWORD=example -v /var/lib/docker/volumes/vagrant_pg_backup/_data:/var/lib/postgresql/backup postgres:12 &
    vagrant@server1:~$ docker exec -it new_pg su - postgres
    postgres@2ee9f6ec05ac:~$ psql < backup/instance.bak