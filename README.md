# devops-netology
# Kirill Nelyubov

# Домашнее задание к занятию "5.3. Введение. Экосистема. Архитектура. Жизненный цикл Docker контейнера"

## Обязательная задача 1
   https://hub.docker.com/r/nelyubov/netology/tags
## Обязательная задача 2
   Все сценарии, кроме третьего, выполняются на операционной системе Linux, поэтому могут быть запущенны в Docker контейнерах. Третий сценарий надо запускать в виртуальных средах. 
## Обязательная задача 3
    vagrant@server1:~$ docker run --name centos -v ~/data:/data:rw -dt centos
    Unable to find image 'centos:latest' locally
    latest: Pulling from library/centos
    Digest: sha256:a27fd8080b517143cbbbab9dfb7c8571c40d67d534bbdee55bd6c473f432b177
    Status: Downloaded newer image for centos:latest
    1a6da15ca83a4a2c2f579e4c807a53c10761765915665b3332bb642f620a2465
    vagrant@server1:~$ docker ps
    CONTAINER ID   IMAGE     COMMAND       CREATED         STATUS         PORTS     NAMES
    1a6da15ca83a   centos    "/bin/bash"   4 seconds ago   Up 4 seconds             centos
    vagrant@server1:~$ docker run --name debian -v ~/data:/data:rw -dt debian
    ae87b9e7c099ef6d5d25df000340109d4cf357c38a836085341e609aeb87c0e0
    vagrant@server1:~$ docker ps
    CONTAINER ID   IMAGE     COMMAND       CREATED          STATUS          PORTS     NAMES
    ae87b9e7c099   debian    "bash"        12 seconds ago   Up 12 seconds             debian
    1a6da15ca83a   centos    "/bin/bash"   49 seconds ago   Up 48 seconds             centos
    vagrant@server1:~$ docker exec -it centos bash
    [root@1a6da15ca83a /]# echo "test text" > /data/file_from_centos
    [root@1a6da15ca83a /]# exit
    vagrant@server1:~$ echo "test text" > data/file_from_host
    vagrant@server1:~$ docker exec -it debian bash
    root@ae87b9e7c099:/# cat /data/file_from_centos
    test text
    root@ae87b9e7c099:/# cat /data/file_from_host
    test text
## Необязательная задача 4
  https://hub.docker.com/r/nelyubov/netology/tags