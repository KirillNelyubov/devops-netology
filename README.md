# devops-netology
# Kirill Nelyubov

# Домашнее задание к занятию "5.2. Применение принципов IaaC в работе с виртуальными машинами"

## Обязательная задача 1
1. Преимущество применения IaaC паттернов состоит в автоматизации развёртывания инфраструктуры для поставленной задачи, отсутствие дрейфа конфигураций. Когда мы создаём среды для разработки, тестирования и развёртывания по одним лекалам.
2. Основополагающим принципом IaaC является программируемая инфраструктура или паттерн.
## Обязательная задача 2
1. Ansible выгодно отличается от других систем управление конфигурациями тем, что не требует установки и настройки доп. ПО на сервера, достаточно простого входа по SSH. Преимущества: скорость, простота, расширяемость.
2. PUSH более надёжный метод работы систем конфигурации, так как применяется незамедлительно на всей инфраструктуре, а не ждёт запросов как PULL. 
## Обязательная задача 3
1.     kirill@kirill-mint:~/VirtualBox VMs$ VirtualBox --help
       Oracle VM VirtualBox VM Selector v6.1.26_Ubuntu
       (C) 2005-2021 Oracle Corporation
       All rights reserved.

       No special options.

       If you are looking for --startvm and related options, you need to use VirtualBoxVM.
2.     kirill@kirill-mint:~/VirtualBox VMs$ vagrant version
       Installed Version: 2.2.6
       
       Vagrant was unable to check for the latest version of Vagrant.
       Please check manually at https://www.vagrantup.com
3.     kirill@kirill-mint:~/VirtualBox VMs$ ansible --version
       ansible 2.9.6
         config file = /etc/ansible/ansible.cfg
         configured module search path = ['/home/kirill/.ansible/plugins/modules', '/usr/share/ansible/plugins/modules']
         ansible python module location = /usr/lib/python3/dist-packages/ansible
         executable location = /usr/bin/ansible
         python version = 3.8.10 (default, Nov 26 2021, 20:14:08) [GCC 9.3.0]
## Необязательная задача 4
    kirill@kirill-mint:~/test/vagrant$ vagrant up
    Bringing machine 'server1.netology' up with 'virtualbox' provider...
    ==> server1.netology: Importing base box 'bento/ubuntu-20.04'...
    ==> server1.netology: Matching MAC address for NAT networking...
    ==> server1.netology: Checking if box 'bento/ubuntu-20.04' version '202107.28.0' is up to date...
    ==> server1.netology: Setting the name of the VM: server1.netology
    ==> server1.netology: Clearing any previously set network interfaces...
    ==> server1.netology: Preparing network interfaces based on configuration...
        server1.netology: Adapter 1: nat
        server1.netology: Adapter 2: hostonly
    ==> server1.netology: Forwarding ports...
        server1.netology: 22 (guest) => 20011 (host) (adapter 1)
        server1.netology: 22 (guest) => 2222 (host) (adapter 1)
    ==> server1.netology: Running 'pre-boot' VM customizations...
    ==> server1.netology: Booting VM...
    ==> server1.netology: Waiting for machine to boot. This may take a few minutes...
        server1.netology: SSH address: 127.0.0.1:2222
        server1.netology: SSH username: vagrant
        server1.netology: SSH auth method: private key
        server1.netology: Warning: Connection reset. Retrying...
        server1.netology: Warning: Remote connection disconnect. Retrying...
        server1.netology: 
        server1.netology: Vagrant insecure key detected. Vagrant will automatically replace
        server1.netology: this with a newly generated keypair for better security.
        server1.netology: 
        server1.netology: Inserting generated public key within guest...
        server1.netology: Removing insecure key from the guest if it's present...
        server1.netology: Key inserted! Disconnecting and reconnecting using new SSH key...
    ==> server1.netology: Machine booted and ready!
    ==> server1.netology: Checking for guest additions in VM...
    ==> server1.netology: Setting hostname...
    ==> server1.netology: Configuring and enabling network interfaces...
    ==> server1.netology: Mounting shared folders...
        server1.netology: /vagrant => /home/kirill/test/vagrant
    ==> server1.netology: Running provisioner: ansible...
    Vagrant has automatically selected the compatibility mode '2.0'
    according to the Ansible version installed (2.9.6).
    
    Alternatively, the compatibility mode can be specified in your Vagrantfile:
    https://www.vagrantup.com/docs/provisioning/ansible_common.html#compatibility_mode
    
        server1.netology: Running ansible-playbook...
    
    PLAY [nodes] *******************************************************************
    
    TASK [Gathering Facts] *********************************************************
    ok: [server1.netology]
    
    TASK [Create directory for ssh-keys] *******************************************
    changed: [server1.netology]
    
    TASK [Adding rsa-key in /root/.ssh/authorized_keys] ****************************
    changed: [server1.netology]
    
    TASK [Checking DNS] ************************************************************
    changed: [server1.netology]
    
    TASK [Installing tools] ********************************************************
    ok: [server1.netology] => (item=['git', 'curl'])
    
    TASK [Installing docker] *******************************************************
    changed: [server1.netology]
    
    TASK [Add the current user to docker group] ************************************
    changed: [server1.netology]
    
    PLAY RECAP *********************************************************************
    server1.netology           : ok=7    changed=5    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   
    
    kirill@kirill-mint:~/test/vagrant$ vagrant ssh
    Welcome to Ubuntu 20.04.2 LTS (GNU/Linux 5.4.0-80-generic x86_64)
    
     * Documentation:  https://help.ubuntu.com
     * Management:     https://landscape.canonical.com
     * Support:        https://ubuntu.com/advantage
    
      System information as of Wed 26 Jan 2022 01:04:22 AM UTC
    
      System load:  0.88              Users logged in:          0
      Usage of /:   3.2% of 61.31GB   IPv4 address for docker0: 172.17.0.1
      Memory usage: 20%               IPv4 address for eth0:    10.0.2.15
      Swap usage:   0%                IPv4 address for eth1:    192.168.192.11
      Processes:    109
    
    
    This system is built by the Bento project by Chef Software
    More information can be found at https://github.com/chef/bento
    Last login: Wed Jan 26 01:04:08 2022 from 10.0.2.2
    vagrant@server1:~$ docker ps
    CONTAINER ID   IMAGE     COMMAND   CREATED   STATUS    PORTS     NAMES
