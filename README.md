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

## Обязательная задача 3
    mysql> SHOW TABLE STATUS \G;
    *************************** 1. row ***************************
               Name: orders
             Engine: InnoDB
    ...  

    mysql> SHOW PROFILES;
    +----------+------------+------------------------------------------------+
    | Query_ID | Duration   | Query                                          |
    +----------+------------+------------------------------------------------+
    |        1 | 0.00043475 | SELECT * FROM test_db.orders WHERE price > 300 |
    |        2 | 0.01133200 | SHOW TABLE STATUS                              |
    |        3 | 0.00311900 | SHOW TABLE STATUS                              |
    |        4 | 0.00766150 | DROP TABLE T1                                  |
    |        5 | 0.00231250 | SHOW TABLE STATUS                              |
    |        6 | 0.00215500 | SHOW TABLE STATUS                              |
    |        7 | 0.04757200 | ALTER TABLE test_db.orders ENGINE=MyISAM       |
    |        8 | 0.07670825 | ALTER TABLE test_db.orders ENGINE=InnoDB       |
    +----------+------------+------------------------------------------------+
    8 rows in set, 1 warning (0.00 sec)
    
## Обязательная задача 4
    [mysqld]
    pid-file        = /var/run/mysqld/mysqld.pid
    socket          = /var/run/mysqld/mysqld.sock
    datadir         = /var/lib/mysql
    secure-file-priv= NULL
    innodb_flush_method = O_DSYNC
    innodb_file_per_table = 1
    innodb_log_buffer_size =1M
    innodb_buffer_pool_size = 300M
    innodb_log_file_size = 100MB