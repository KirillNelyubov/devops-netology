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


