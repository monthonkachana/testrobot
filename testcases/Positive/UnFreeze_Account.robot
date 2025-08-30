*** Settings ***
Resource  ../../resources/imports.robot

*** Test Cases ***

TC003_002 Validate Response Fail - ref_freeze_warrant is exist-ref_freeze_warrant": "Q == 1
    [Documentation]    Test Case SUBMIT
   Given Prepare Data TEST UnFreeze Account 'Z' Get data 'Existing' and Code '002' Unfreeze 1
   when Call API UnFreeze Account AOC case to CFR
   when Response File success UnFreeze Account 'UnFreeze_Account_success'
   AND Check Response from DB POLICE CASENUMBER ${POLICE_CASE_NUMBER} UnFreeze ${ref_freeze_warrant} 

TC003_004 Validate Response Fail - ref_freeze_warrant is exist-ref_freeze_warrant": "R == 2
    [Documentation]    Test Case SUBMIT
   Given Prepare Data TEST UnFreeze Account 'Z' Get data 'Existing' and Code '002' Unfreeze 2
   when Call API UnFreeze Account AOC case to CFR
   when Response File success UnFreeze Account 'UnFreeze_Account_success'
   AND Check Response from DB POLICE CASENUMBER ${POLICE_CASE_NUMBER} UnFreeze ${ref_freeze_warrant} 