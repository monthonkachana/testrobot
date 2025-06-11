#!/usr/bin/env python
# -*- coding: utf-8 -*-
import requests

def http_get_request(url,data,headers):
    response = requests.get(url, json=data,headers=headers)
    print("Status Code", response.status_code)
    print("JSON Response ", response.json())
    return response;
