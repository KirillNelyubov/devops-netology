# devops-netology
# Kirill Nelyubov

Ответы на задание к занятию «3.1. Работа в терминале, лекция 1»:

5. Ресурсы по умолчанию: ОЗУ 1024МБ, 2 ЦП, 4МБ видеопамяти, жесткий диск до 64ГБ, сеть NAT.
6. config.vm.provider "virtualbox" do |vb|
 
    vb.memory = "2048"

    vb.cpus = 3

   end
7. 

8. Переменная HISTSIZE задаёт количество комманд записанных в журнал history, HISTFILESIZE количество строк. Строка 4027 в man bash.

   ignoreboth = ignorespace + ignoredups. Не записывает в журнал строки начинающиеся с пробела и повторяющиеся комманды. 
9. Brace Expansion {}. Строка 1508 в man bash.
10. touch file{0..100000}. touch {a..r}{a..z}{a..z}{a..z} создаст 316368 файлов, за счёт уменьшения длины имён в общем листе.
11. [[ -d /tmp ]] - возврвщает статус ($?) 0  если директория '/tmp' существует и 1 - если нет.
12. mkdir /tmp/new_path_directory
 
    cp /bin/bash /tmp/new_path_directory/
    
    PATH=/tmp/new_path_directory:$PATH

    type -a bash
13. at запускает команды в определённое время, batch когда загрузка системы минимальна.
14. 