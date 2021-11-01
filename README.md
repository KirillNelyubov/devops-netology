# devops-netology
# Kirill Nelyubov

Ответы на задание к занятию «3.4. Операционные системы, лекция 2":

1. /lib/systemd/system/node_exporter.service:

       [Unit]
       Description=Monitoring Linux host metrics with the Node Exporter
       Documentation=
       After=remote-fs.target nss-user-lookup.target
   
       [Service]
       EnvironmentFile=-/opt/node_exporter/default
       ExecStart=/opt/node_exporter/node_exporter $OPTS
       IgnoreSIGPIPE=false
       KillMode=process
       Restart=on-failure
   
       [Install]
       WantedBy=multi-user.target
   sudo systemctl daemon-reload

   sudo systemctl enable node_exporter

   sudo reboot

   sudo systemctl status node_exporter

       ● node_exporter.service - Monitoring Linux host metrics with the Node Exporter
            Loaded: loaded (/lib/systemd/system/node_exporter.service; enabled; vendor preset: enabled)
            Active: active (running) since Mon 2021-11-01 13:37:03 UTC; 1h 29min ago
          Main PID: 1174 (node_exporter)
             Tasks: 4 (limit: 1071)
            Memory: 2.5M
            CGroup: /system.slice/node_exporter.service
                    └─1174 /opt/node_exporter/node_exporter --collector.disable-defaults --web.disable-exporter-metrics --collector.cpu --collector.meminfo --collector.diskstats --collector.netstat


2. /opt/node_exporter/default:

       OPTS="--collector.disable-defaults --web.disable-exporter-metrics  --collector.cpu --collector.meminfo --collector.diskstats --collector.netstat"
3. <img src="https://ipev.ru/image/N4lI"/> 
4. По выводу dmesg:

          [    0.000000] DMI: innotek GmbH VirtualBox/VirtualBox, BIOS VirtualBox 12/01/2006
          [    0.000000] Hypervisor detected: KVM
          [    0.000000] kvm-clock: Using msrs 4b564d01 and 4b564d00
          [    0.000000] kvm-clock: cpu 0, msr 39601001, primary cpu clock
          [    0.000000] kvm-clock: using sched offset of 5730191562 cycles
          [    0.000002] clocksource: kvm-clock: mask: 0xffffffffffffffff max_cycles: 0x1cd42e4dffb, max_idle_ns: 881590591483 ns
  видно, что ОС стартует под гипервизором KVM.
5. sysctl fs.nr_open - системное ограничение на количество открытых файлов (дескрипторов), по умолчанию fs.nr_open = 1048576.

   ulimit -Hn, ulimit -Sn - ограничение на пользователя, сессию, по умолчанию 1024.
6.     root@vagrant:~# unshare -f -p --mount-proc sleep 1h 
       ^C
       root@vagrant:~# ps
           PID TTY          TIME CMD
          1500 pts/0    00:00:00 sudo
          1501 pts/0    00:00:00 bash
          1669 pts/0    00:00:00 sleep
          1670 pts/0    00:00:00 ps
       root@vagrant:~# nsenter -p -t1669 --mount ps
           PID TTY          TIME CMD
             1 pts/0    00:00:00 sleep
             2 pts/0    00:00:00 ps
7. :(){ :|:& };: - определяет функцию с именем : , которая порождает саму себя (дважды, один канал переходит в другой) и создаёт фон.

   Ограничение на количество процессов в сессии (ulimit -u) не даёт размножиться процессам до краха системы.