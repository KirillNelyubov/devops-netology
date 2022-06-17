# devops-netology

# Kirill Nelyubov

# Домашнее задание к занятию "08.01 Введение в Ansible."


## Основная часть
1.     TASK [Print fact] **********************************************************************************************************************
       ok: [localhost] => {
       "msg": 12
       }
2. 
3. 
4. 
       TASK [Print fact] ***********************************************************************************************************
       ok: [centos7] => {
           "msg": "el"
       }
       ok: [ubuntu] => {
           "msg": "deb"
       }
5. 
6. 
       TASK [Print fact] ********************************************************************************************************************
       ok: [centos7] => {
           "msg": "el default fact"
       }
       ok: [ubuntu] => {
           "msg": "deb default fact"
       }
7. 
8. 
       vagrant@server1:~/git/08.01$ ansible-playbook site.yml -i inventory/prod.yml  --ask-vault-pass
       Vault password: 
       
       PLAY [Print os facts] *************************************************************************************
       
       TASK [Gathering Facts] ************************************************************************************
       ok: [ubuntu]
       ok: [centos7]
9. community.docker.docker - для докера, local - для локального сервиса, psrp - для Microsoft PowerShell Remoting Protocol, ssh - для SSH и winrm - для Microsoft's WinRM.
10. 
11. 
        ASK [Print fact] ***************************************************************************************************************************************************************
        ok: [localhost] => {
            "msg": "all default fact"
        }
        ok: [centos7] => {
            "msg": "el default fact"
        }
        ok: [ubuntu] => {
            "msg": "deb default fact"
        }
12. [https://github.com/KirillNelyubov/08.01](https://github.com/KirillNelyubov/08.01)
## Необязательная часть
