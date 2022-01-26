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
   Возникла ошибка при попытке Ansible зайти на VM:

    kirill@kirill-mint:~/VirtualBox VMs/vagrant$ vagrant up
    Bringing machine 'server1.netology' up with 'virtualbox' provider...
    ==> server1.netology: Importing base box 'bento/ubuntu-20.04'...
    ==> server1.netology: Matching MAC address for NAT networking...
    ==> server1.netology: Checking if box 'bento/ubuntu-20.04' version '202107.28.0' is up to date...
    ==> server1.netology: A newer version of the box 'bento/ubuntu-20.04' for provider 'virtualbox' is
    ==> server1.netology: available! You currently have version '202107.28.0'. The latest is version
    ==> server1.netology: '202112.19.0'. Run `vagrant box update` to update.
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
        server1.netology: /vagrant => /home/kirill/VirtualBox VMs/vagrant
    ==> server1.netology: Running provisioner: ansible...
    Vagrant has automatically selected the compatibility mode '2.0'
    according to the Ansible version installed (2.9.6).
    
    Alternatively, the compatibility mode can be specified in your Vagrantfile:
    https://www.vagrantup.com/docs/provisioning/ansible_common.html#compatibility_mode
    
        server1.netology: Running ansible-playbook...
    
    PLAY [nodes] *******************************************************************
    
    TASK [Gathering Facts] *********************************************************
    fatal: [server1.netology]: UNREACHABLE! => {"changed": false, "msg": "Failed to connect to the host via ssh: ssh: Could not resolve hostname vms/vagrant/.vagrant/machines/server1.netology/virtualbox/private_key: Name or service not known", "unreachable": true}
    
    PLAY RECAP *********************************************************************
    server1.netology           : ok=0    changed=0    unreachable=1    failed=0    skipped=0    rescued=0    ignored=0   
    
    Ansible failed to complete successfully. Any error output should be
    visible above. Please fix these errors and try again.
  