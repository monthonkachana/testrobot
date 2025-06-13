*** Settings ***
Library    SeleniumLibrary
Library    JSONLibrary
# Library    JsonValidator
Library    RequestsLibrary
Library    OperatingSystem
Library    Collections
Library    String
Library    ../py/pyramid.py
Library    ../py/ConnectionDB.py
# Library    ../py/create.py
Library    ../py/CSVLibrary.py
Library    ../py/Decrypt_GPG.py
Library    ../py/FileKeyword.py
Library    ../py/gen-hash.py
# Library    ../py/hash.py
Library    ../py/httpRequest.py
Library    ../py/OperatingSystemLibrary.py
Library    ../py/RandomGeneratorLibrary.py
Library    ../py/save_blob.py
Library    ../py/StringKeyword.py

Variables    ../config/api.yaml
Variables    ../config/content.yaml
Variables    ../config/env.yaml
Variables    PreparaData/userdata.json


# Resource    Common.robot เก็บ resource file (.robot/.resource)
Resource    ../Resource/Common.robot
Resource    ../Resource/Keyword/common_api.robot
Resource    ../Resource/Keyword/common_DB.robot
Resource    ../Resource/Keyword/common_DB.robot
Resource    ../Valiable/valiable.robot