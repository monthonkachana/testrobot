*** Settings ***
Resource  ../../resources/imports.robot

*** Test Cases ***

TC002_001 Validate Response Success - Code 0000 Success - For whole account : warrant_type = R - Existing Account
    [Documentation]    Test Case Freeze Account
   Given Prepare Data TEST Freeze Account 'R' Get data 'Existing' and Code '002'
   when Call API Freeze Account AOC case to CFR
   when Response File Success Freeze Account 'Freeze_Account_success'
   AND Check Response from DB POLICE CASENUMBER ${warrant_id} Freeze

TC002_002 Validate Response Success - Code 0000 Success - For specific amount : warrant_type = Q - Existing Account
    [Documentation]    Test Case Freeze Account
   Given Prepare Data TEST Freeze Account 'Q' Get data 'Existing' and Code '002'
   when Call API Freeze Account AOC case to CFR
   when Response File Success Freeze Account 'Freeze_Account_success'
   AND Check Response from DB POLICE CASENUMBER ${warrant_id} Freeze

TC002_003 Validate Response Success - Code 0000 Success - For specific amount : warrant_type = Q - For Not exist Account
    [Documentation]    Test Case Freeze Account
   Given Prepare Data TEST Freeze Account 'Q' Get data 'random' and Code '002'
   when Call API Freeze Account AOC case to CFR
   when Response File Success Freeze Account 'Freeze_Account_success'
   AND Check Response from DB POLICE CASENUMBER ${warrant_id} Freeze

TC002_004 Validate Response Success - Code 0000 Success - For whole account : warrant_type = R - For Not exist Account
    [Documentation]    Test Case Freeze Account
   Given Prepare Data TEST Freeze Account 'R' Get data 'random' and Code '002'
   when Call API Freeze Account AOC case to CFR
   when Response File Success Freeze Account 'Freeze_Account_success'
   AND Check Response from DB POLICE CASENUMBER ${warrant_id} Freeze