#!/usr/bin/env python3

import yaml
import requests
import re

with open("repos.json") as fi:
    obj = yaml.safe_load(fi)

names = list()
for r  in obj:
    names.append(r["name"])

ss = """---
title: Site
---

An overview of all sites on aisi.asicedu.com

"""
for name in sorted(names):
    url = f"https://aisi.asicedu.com/{name}"
    buff  = requests.get(url,stream=True).text
    if(not re.search("<h1>404</h1>",buff)):
        titles = re.findall("<title>(.*)</title>",buff)
        title = titles[0].replace("|", " ")

        ss += f" - [{name}](https://aisi.asicedu.com/{name}) - {title}\n"

with open("docs/site.md","w") as fo:
    fo.write(ss)
