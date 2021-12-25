#!/usr/bin/env python3

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

