# devops-netology

# Kirill Nelyubov

# Домашнее задание к занятию "7.6. Написание собственных провайдеров для Terraform."


## Обязательная задача 1
1. [resource](https://github.com/hashicorp/terraform-provider-aws/blob/main/internal/provider/provider.go#L898), [data_source](https://github.com/hashicorp/terraform-provider-aws/blob/main/internal/provider/provider.go#L420)
2. Параметр name конфликтует с параметром name_prefix - [ссылка](https://github.com/hashicorp/terraform-provider-aws/blob/b4b8683111c3fbb82eaa88893e0a25e8aa675430/internal/service/sqs/queue.go#L82), максимальная длина имени - 80, регулярное выражение - ^[a-zA-Z0-9_-].
 
## Необязательная задача 2
