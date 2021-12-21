#!/usr/bin/env python3

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
