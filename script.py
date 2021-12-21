#!/usr/bin/env python3

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
