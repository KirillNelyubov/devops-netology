# devops-netology
# Kirill Nelyubov

Ответы на задание к занятию «3.3. Операционные системы, лекция 1":

1. chdir("/tmp")
2. /usr/share/misc/magic.mgc
  
    stat("/home/vagrant/.magic.mgc", 0x7ffda8125ce0) = -1 ENOENT (No such file or directory)

    stat("/home/vagrant/.magic", 0x7ffda8125ce0) = -1 ENOENT (No such file or directory)

    openat(AT_FDCWD, "/etc/magic.mgc", O_RDONLY) = -1 ENOENT (No such file or directory)

    openat(AT_FDCWD, "/usr/share/misc/magic.mgc", O_RDONLY) = 3
3. lsof | grep deleted - узнаём PID

   ls -l /proc/(PID)/fd - узнаём дескриптор FD

   echo -n '' > /proc/(PID)/fd/(FD) - обнуляем удалённый файл. 
4. Зомби-процессы освобождает все свои ресурсы, но оставляет запись в таблице процессов.

5.       PID    COMM               FD ERR PATH

         766    vminfo              6   0 /var/run/utmp

         578    dbus-daemon        -1   2 /usr/local/share/dbus-1/system-services

         578    dbus-daemon        18   0 /usr/share/dbus-1/system-services

         578    dbus-daemon        -1   2 /lib/dbus-1/system-services

         578    dbus-daemon        18   0 /var/lib/snapd/dbus-1/system-services/

6. uname(). Part of the utsname information is also  accessible  via  /proc/sys/ker‐
       nel/{ostype, hostname, osrelease, version, domainname}.
7. test -d /tmp/some_dir; echo Hi - последовательно выполнит обе команды.

   test -d /tmp/some_dir && echo Hi - выполнит вторую если первая завершится со статусом 0.

   Использовать && после set -e смысла нет, так как при статусе 1, выполнение следующей команды не будет в любом случае.
8. -e прерывает выполнение сценария ошибке любой команды.

   -u при попытке подстановки значения не существующей переменной командный
интерпретатор выдает сообщение об ошибке и, если он - не интерактивный, завершает
работу с ненулевым статусом выхода

   -x выдаёт команду с результатами подстановок в аргументах
   
   -o pipefail если какая-либо команда в конвейере терпит неудачу, этот код возврата будет использоваться как код возврата всего конвейера
   
   set -euxo pipefail хорошо подходит для отладки сложных сценариев. Можно увидеть на каком этапе и какая произошла ошибка.
9. S,S+,Ss,Ssl,Ss+ - прерываемые спящие процессы.

   I, I< - бездействующие процессы ядра.
   
   Дополнительные символы это доп характеристики процесса.