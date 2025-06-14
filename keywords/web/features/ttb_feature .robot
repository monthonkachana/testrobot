*** Settings ***
Resource         ${CURDIR}/../../../resource/import.robot


*** Keywords ***

Verify login success
    [Arguments]    
    ttb_page.Check login page
    ttb_page.Input username    ${text_username}
    ttb_page.Input password    ${text_password}