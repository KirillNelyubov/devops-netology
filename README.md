# devops-netology
# Kirill Nelyubov

# Домашнее задание к занятию "5.4. Оркестрация группой Docker контейнеров на примере Docker Compose"

## Обязательная задача 1
    ==> yandex: Stopping instance...
    ==> yandex: Deleting instance...
        yandex: Instance has been deleted!
    ==> yandex: Creating image: centos-7-base
    ==> yandex: Waiting for image to complete...
    ==> yandex: Success image create...
    ==> yandex: Destroying boot disk...
        yandex: Disk has been deleted!
    Build 'yandex' finished after 1 minute 55 seconds.
    
    ==> Wait completed after 1 minute 55 seconds
    
    ==> Builds finished. The artifacts of successful builds are:
    --> yandex: A disk image was created: centos-7-base (id: fd8qga14b5tpis56o73p) with family name centos
    vagrant@server1:~/packer$ yc compute image list
    +----------------------+---------------+--------+----------------------+--------+
    |          ID          |     NAME      | FAMILY |     PRODUCT IDS      | STATUS |
    +----------------------+---------------+--------+----------------------+--------+
    | fd8qga14b5tpis56o73p | centos-7-base | centos | f2eacrudv331nbat9ehb | READY  |
    +----------------------+---------------+--------+----------------------+--------+
## Обязательная задача 2
  <img src="Снимок экрана в 2022-02-01 20-34-15.png"/>

## Обязательная задача 3
  <img src="Снимок экрана в 2022-02-01 20-34-24.png"/> 

## Необязательная задача 4
 