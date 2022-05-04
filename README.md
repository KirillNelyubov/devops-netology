# devops-netology
# Kirill Nelyubov

# Домашнее задание к занятию "7.1. Инфраструктура как код"

## Обязательная задача 1
1. Если в организации уже во всю используется Terraform и большая база Kubernetes конфигураций, то логично сразу выбрать не изменяемый тип инфраструктуры. 
2. Для "Terraform"а центральный сервер не требуется.
3. Так же не нужны агенты на серверах.
4. Используем Packer для создания образа, Terraform для развёртывания ВМ, Kubernetes для оркестрации контейнеров Docker (развёртывания, обновлений, автовосстановление, балансировка нагрузки и др.), Teamcity для автоматизации процессов разработки и тестирования.

## Обязательная задача 2
    vagrant@server1:~$ terraform --version
    Terraform v1.1.9
    on linux_amd64

## Обязательная задача 3
    vagrant@server1:~$ ./terraform --version
    Terraform v0.12.31
    
    Your version of Terraform is out of date! The latest version
    is 1.1.9. You can update by downloading from https://www.terraform.io/downloads.html

#