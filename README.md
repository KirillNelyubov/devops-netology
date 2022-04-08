# devops-netology
# Kirill Nelyubov

# Домашнее задание к занятию "6.3. MySQL"

## Обязательная задача 1
    mysql> \s
    --------------
    mysql  Ver 8.0.28 for Linux on x86_64 (MySQL Community Server - GPL)
    ...
    Server version:		8.0.28 MySQL Community Server - GPL

    mysql> SHOW TABLES;
    +-------------------+
    | Tables_in_test_db |
    +-------------------+
    | orders            |
    +-------------------+
    1 row in set (0.01 sec)

    mysql> SELECT COUNT(*) FROM orders WHERE price > 300;
    +----------+
    | COUNT(*) |
    +----------+
    |        1 |
    +----------+
    1 row in set (0.01 sec)

## Обязательная задача 2
    mysql> CREATE USER 'test'@'localhost' IDENTIFIED WITH mysql_native_password BY 'test-pass'
        ->  WITH MAX_QUERIES_PER_HOUR 100
        ->  PASSWORD EXPIRE INTERVAL 180 DAY
        ->  FAILED_LOGIN_ATTEMPTS 3
        ->  ATTRIBUTE '{"First Name":"James","Last Name":"Pretty"}';
    Query OK, 0 rows affected (0.06 sec)

    mysql> GRANT SELECT ON test_db.* TO 'test'@'localhost';
    Query OK, 0 rows affected, 1 warning (0.02 sec)
    
    mysql> SELECT * FROM INFORMATION_SCHEMA.USER_ATTRIBUTES WHERE USER='test';
    +------+-----------+------------------------------------------------+
    | USER | HOST      | ATTRIBUTE                                      |
    +------+-----------+------------------------------------------------+
    | test | localhost | {"Last Name": "Pretty", "First Name": "James"} |
    +------+-----------+------------------------------------------------+
    1 row in set (0.00 sec)

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