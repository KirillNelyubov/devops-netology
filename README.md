# devops-netology
# Kirill Nelyubov

Ответы на задание к занятию "4.2. Использование Python для решения типовых DevOps задач":

1. Скрипт выдаст ошибку, так как нельзя сложить целое число и строку.
     
    int(str(a) + b) получим 12
   
    a + int(b) получим 3
2.     #!/usr/bin/env python3

       import os

       git_dir = "~/git/devops-netology"
       bash_command = ["cd " + git_dir, "git status"]
       result_os = os.popen(' && '.join(bash_command)).read()
       for result in result_os.split('\n'):
           if result.find('изменено') != -1:
               prepare_result = git_dir + '/' + result.replace('\tизменено:      ', '')
               print(prepare_result)
   Вывод:

       ~/git/devops-netology/README.md
       ~/git/devops-netology/terraform/.gitignore
       ~/git/devops-netology/terraform/README.md
3.     #!/usr/bin/env python3

       import os
       import sys
       
       try:
           git_path = sys.argv[1]
       except IndexError:
           git_path = os.getcwd()
       bash_command = "git status " + git_path
       result_os = os.popen(bash_command).read()
       for result in result_os.split('\n'):
           if result.find('изменено') != -1:
               prepare_result = git_path + '/' + result.replace('\tизменено:      ', '')
               print(prepare_result)

       kirill@kirill-mint:~$ ./script.py ~/git/devops-netology
       /home/kirill/git/devops-netology/README.md
       /home/kirill/git/devops-netology/script.py
       /home/kirill/git/devops-netology/terraform/.gitignore
       /home/kirill/git/devops-netology/terraform/README.md
4.     #!/usr/bin/env python3

       import socket
       import requests
       import time
       
       service_names = ["drive.google.com", "mail.google.com", "google.com"]
       ips = {}
       for name in service_names:
           ips[name] = socket.gethostbyname(name)
       
       while True:
           for name in service_names:
               ip = socket.gethostbyname(name)
               url = "http://" + name
               try:
                   requests.get(url)
               except OSError:
                   print(url, "- Connection Error")
               else:
                   print(url, "-", ip)
               if ips[name] != ip:
                   print("[ERROR]", url, "IP mismatch:", ips[name], ip)
                   ips[name] = ip
           time.sleep(60)
    Вывод:

       http://drive.google.com - 108.177.14.194
       http://mail.google.com - 216.58.209.197
       http://google.com - 216.58.210.142
       http://drive.google.com - 108.177.14.194
       http://mail.google.com - 216.58.209.197
       http://google.com - 216.58.210.142
       http://drive.google.com - 142.251.1.194
       [ERROR] http://drive.google.com IP mismatch: 108.177.14.194 142.251.1.194
       http://mail.google.com - 216.58.209.197
       http://google.com - 216.58.210.142
       http://drive.google.com - 142.251.1.194
       http://mail.google.com - 216.58.210.133
       [ERROR] http://mail.google.com IP mismatch: 216.58.209.197 216.58.210.133
       http://google.com - 216.58.210.142
5. # Домашнее задание к занятию "4.2. Использование Python для решения типовых DevOps задач"

## Обязательная задача 1

Есть скрипт:
```python
#!/usr/bin/env python3
a = 1
b = '2'
c = a + b
```

### Вопросы:
| Вопрос  | Ответ |
| ------------- | ------------- |
| Какое значение будет присвоено переменной `c`?  | Скрипт выдаст ошибку, так как нельзя сложить целое число и строку  |
| Как получить для переменной `c` значение 12?  | int(str(a) + b)  |
| Как получить для переменной `c` значение 3?  | a + int(b)  |

## Обязательная задача 2
Мы устроились на работу в компанию, где раньше уже был DevOps Engineer. Он написал скрипт, позволяющий узнать, какие файлы модифицированы в репозитории, относительно локальных изменений. Этим скриптом недовольно начальство, потому что в его выводе есть не все изменённые файлы, а также непонятен полный путь к директории, где они находятся. Как можно доработать скрипт ниже, чтобы он исполнял требования вашего руководителя?

```python
#!/usr/bin/env python3

import os

bash_command = ["cd ~/netology/sysadm-homeworks", "git status"]
result_os = os.popen(' && '.join(bash_command)).read()
is_change = False
for result in result_os.split('\n'):
    if result.find('modified') != -1:
        prepare_result = result.replace('\tmodified:   ', '')
        print(prepare_result)
        break
```

### Ваш скрипт:
```python
#!/usr/bin/env python3

 import os

 git_dir = "~/git/devops-netology"
 bash_command = ["cd " + git_dir, "git status"]
 result_os = os.popen(' && '.join(bash_command)).read()
 for result in result_os.split('\n'):
     if result.find('изменено') != -1:
         prepare_result = git_dir + '/' + result.replace('\tизменено:      ', '')
         print(prepare_result)
```

### Вывод скрипта при запуске при тестировании:
```
~/git/devops-netology/README.md
~/git/devops-netology/terraform/.gitignore
~/git/devops-netology/terraform/README.md

```

## Обязательная задача 3
1. Доработать скрипт выше так, чтобы он мог проверять не только локальный репозиторий в текущей директории, а также умел воспринимать путь к репозиторию, который мы передаём как входной параметр. Мы точно знаем, что начальство коварное и будет проверять работу этого скрипта в директориях, которые не являются локальными репозиториями.

### Ваш скрипт:
```python
#!/usr/bin/env python3

import os
import sys

try:
    git_path = sys.argv[1]
except IndexError:
    git_path = os.getcwd()
bash_command = "git status " + git_path
result_os = os.popen(bash_command).read()
for result in result_os.split('\n'):
    if result.find('изменено') != -1:
        prepare_result = git_path + '/' + result.replace('\tизменено:      ', '')
        print(prepare_result)
```

### Вывод скрипта при запуске при тестировании:
```bash
kirill@kirill-mint:~$ ./script.py ~/git/devops-netology
/home/kirill/git/devops-netology/README.md
/home/kirill/git/devops-netology/script.py
/home/kirill/git/devops-netology/terraform/.gitignore
/home/kirill/git/devops-netology/terraform/README.md
```

## Обязательная задача 4
1. Наша команда разрабатывает несколько веб-сервисов, доступных по http. Мы точно знаем, что на их стенде нет никакой балансировки, кластеризации, за DNS прячется конкретный IP сервера, где установлен сервис. Проблема в том, что отдел, занимающийся нашей инфраструктурой очень часто меняет нам сервера, поэтому IP меняются примерно раз в неделю, при этом сервисы сохраняют за собой DNS имена. Это бы совсем никого не беспокоило, если бы несколько раз сервера не уезжали в такой сегмент сети нашей компании, который недоступен для разработчиков. Мы хотим написать скрипт, который опрашивает веб-сервисы, получает их IP, выводит информацию в стандартный вывод в виде: <URL сервиса> - <его IP>. Также, должна быть реализована возможность проверки текущего IP сервиса c его IP из предыдущей проверки. Если проверка будет провалена - оповестить об этом в стандартный вывод сообщением: [ERROR] <URL сервиса> IP mismatch: <старый IP> <Новый IP>. Будем считать, что наша разработка реализовала сервисы: `drive.google.com`, `mail.google.com`, `google.com`.

### Ваш скрипт:
```python
#!/usr/bin/env python3

import socket
import requests
import time

urls = ["drive.google.com", "mail.google.com", "google.com"]
ips = {}
for url in urls:
    ips[url] = socket.gethostbyname(url)

while True:
    for url in urls:
        ip = socket.gethostbyname(url)
        try:
            requests.get("http://" + url)
        except OSError:
            print(url, "- Connection Error")
        else:
            print(url, "-", ip)
        if ips[url] != ip:
            print("[ERROR]", url, "IP mismatch:", ips[url], ip)
            ips[url] = ip
    time.sleep(60)
```

### Вывод скрипта при запуске при тестировании:
```
drive.google.com - 108.177.14.194
mail.google.com - 216.58.209.197
google.com - 216.58.210.142
drive.google.com - 108.177.14.194
mail.google.com - 216.58.209.197
google.com - 216.58.210.142
drive.google.com - 142.251.1.194
[ERROR] drive.google.com IP mismatch: 108.177.14.194 142.251.1.194
mail.google.com - 216.58.209.197
google.com - 216.58.210.142
drive.google.com - 142.251.1.194
mail.google.com - 216.58.210.133
[ERROR] mail.google.com IP mismatch: 216.58.209.197 216.58.210.133
google.com - 216.58.210.142
```