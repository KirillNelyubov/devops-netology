# devops-netology
# Kirill Nelyubov

# Домашнее задание к занятию "5.5. Оркестрация кластером Docker контейнеров на примере Docker Swarm"

## Обязательная задача 1
1. В режиме "replication" реплики распределяются "manager"-нодом по "worker"-нодам в заданном количестве. В "global" режиме реплики запускаются на всех нодах, включая "manager"-нод.
2. В кластере могут одновременно работать несколько "manager" нод, которые могут в любой момент заменить вышедшего из строя лидера, используя алгоритм поддержания распределенного консенсуса — Raft.
3. Overlay-сеть -- это виртуальная сеть объединяющая контейнеры, на которых запущен общий сервис.
## Обязательная задача 2
    [root@node01 ~]# docker node ls
    ID                            HOSTNAME             STATUS    AVAILABILITY   MANAGER STATUS   ENGINE VERSION
    oqaz97ksaabglfb6t2aijsxl4 *   node01.netology.yc   Ready     Active         Leader           20.10.12
    h2n9coxo26p4cab9p22nluxss     node02.netology.yc   Ready     Active         Reachable        20.10.12
    bjvdo26tj55x2l309tp6iolb9     node03.netology.yc   Ready     Active         Reachable        20.10.12
    k9sslfbg812fqhaefo69owbc2     node04.netology.yc   Ready     Active                          20.10.12
    893n1j07pgcm51gsorz8eylzd     node05.netology.yc   Ready     Active                          20.10.12
    x5fn0yfi92tbbuszs1gr8wob0     node06.netology.yc   Ready     Active                          20.10.12
## Обязательная задача 3
    [root@node01 ~]# docker service ls
    ID             NAME                                MODE         REPLICAS   IMAGE                                          PORTS
    hv0ccsi5kc8f   swarm_monitoring_alertmanager       replicated   1/1        stefanprodan/swarmprom-alertmanager:v0.14.0    
    6i8jfgl8gomp   swarm_monitoring_caddy              replicated   1/1        stefanprodan/caddy:latest                      *:3000->3000/tcp, *:9090->9090/tcp, *:9093-9094->9093-9094/tcp
    uzkwp0budnk4   swarm_monitoring_cadvisor           global       6/6        google/cadvisor:latest                         
    bny3m40dtstv   swarm_monitoring_dockerd-exporter   global       6/6        stefanprodan/caddy:latest                      
    s32f6s764y37   swarm_monitoring_grafana            replicated   1/1        stefanprodan/swarmprom-grafana:5.3.4           
    xkw2jp52udsz   swarm_monitoring_node-exporter      global       6/6        stefanprodan/swarmprom-node-exporter:v0.16.0   
    82v4xe5rs8m2   swarm_monitoring_prometheus         replicated   1/1        stefanprodan/swarmprom-prometheus:v2.5.0       
    76walftfg46a   swarm_monitoring_unsee              replicated   1/1        cloudflare/unsee:v0.8.0                        

## Необязательная задача 4
 