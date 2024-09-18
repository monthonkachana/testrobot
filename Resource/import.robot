*** Settings ***
Library    SeleniumLibrary
Library    JSONLibrary
Library    JsonValidator
Library    RequestsLibrary
Library    OperatingSystem
Library    Collections
Library    String
Library    ../py/pyramid.py

Variables    content.yaml
Variables    PreparaData/userdata.json


Resource    Common.robot
Resource    ../Valiable/valiable.robot