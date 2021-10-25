# devops-netology
# Kirill Nelyubov

Ответы на задание к занятию «3.2. Работа в терминале, лекция 2":

1. cd это встроенная в shell (bash, dash и др.) команда. Нужна в основном для работы исключительно в среде shell, поэтому делать её внешней смысла нет.
2. grep -c <some_string> <some_file>
3. /sbin/init
4. ls /root 2>/dev/pts/1 выведет на вторую сессию терминала ошибку "ls: cannot open directory '/root': Permission denied"
5. sort < file1 > file2 
6. Ctrl+Alt+F1 переключаемся в tty1, логинимся, Alt+F7 возвращаемся в Xсы, в терминале bash &>/dev/tty1, всё что вводим дальше будет на tty1. 
7. bash 5>&1 приведёт к перенаправлению дескриптора 5 в stdout. echo netology > /proc/$$/fd/5 вывод на stdout.
8. ls 5>&2 2>&1 >&5 | grep "test" - выведет результат команды ls в stderr,

   ls test 5>&2 2>&1 >&5 | grep "test" - выдаст ошибку через pipe.
9. cat /proc/$$/environ - выводит переменные оболочки и окружения сеанса, аналогично ps eww -p $$, printenv.
10. /proc/(PID)/cmdline - содержит команду запуска процесса, 

    /proc/(PID)/exe - ссылку на файл процесса.
11. cat /proc/cpuinfo | grep "sse". SSE4_2
12. По умолчанию ssh при выполнении команды не выделяет pty, чтобы команда выполнялась  в эмуляторе терминала, необходимо запускать ssh с опцией -t (ssh -t localhost 'tty').
13. Перенесём процесс (например sleep 3600) запущенный в ssh-сессии в screen. Входим по ssh в новую сессию, узнаем PID - ps aux | grep "sleep 3600", далее screen; reptyr (PID); Ctrl+a; d, выходим из ssh сессий, процесс sleep будет работать в screen.
14. Команда tee читает из stdin и записывает в файл и выводит в stdout. echo string | sudo tee /root/new_file будет работать, потому что sudo применимо к tee, в отличии от sudo echo string > /root/new_file, где перенаправляет shell от пользователя.