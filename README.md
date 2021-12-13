# devops-netology
# Kirill Nelyubov

Ответы на задание к занятию "4.1. Командная оболочка Bash: Практические навыки":

1.     Переменная 	Значение 	Обоснование
       c               "a+b"       Присваевается строковое значение.
       d               "1+2"       Опять же стока из двух переменных. 
       e               3           Вычисляется операция сложения двух переменных.
2.     while ((1==1))
       do
           curl https://localhost:4757
           if (($? == 0))
           then
               break
           fi
           date >> curl.log
       done
   мой скрипт:

       #!/usr/bin/env bash
       
       ips=('192.168.0.1' '173.194.222.113' '87.250.250.242')
       for ip in "${ips[@]}"
       do
         rs='недоступен'
         a=5
         while (($a > 0))
         do
           if curl -m3 http://"$ip"
           then
             rs='доступен'
             break
           fi
           ((a-=1))
         done
         echo "$ip $rs" >> test.log
       done
3.     #!/usr/bin/env bash

       ips=('192.168.0.1' '173.194.222.113' '87.250.250.242')
       x=0
       while (($x==0))
       do
         for ip in "${ips[@]}"
         do
           if ! curl -m3 http://"$ip"
           then
             x=1
             break
           fi
         done
       done
       echo "$ip" >error.log
