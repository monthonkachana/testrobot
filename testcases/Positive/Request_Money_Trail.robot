*** Settings ***
Resource  ../../resources/imports.robot

*** Test Cases ***

TC004_001 Validate Response Success - Code 0000 - Bank Case ID is correct
    # [Documentation]    Test Case RMT
   Given Prepare Data TEST Existing Request Money Trail
   when Call API Request Money Trail case to CFR
   when Response File Success Request Money Trail 'Request_Money_Trail_success'
   AND Check Response from DB Request Money Trail ${ticketid}

TC004_002 Validate Response Success - Code 0000 - Resend same Bank Case ID within 1 hour
    # [Documentation]    Test Case RMT
   Given Prepare Data TEST Existing Request Money Trail
   when Call API Request Money Trail case to CFR
   when Response File Success Request Money Trail 'Request_Money_Trail_success'
   AND Check Response from DB Request Money Trail ${ticketid}
   Given Prepare Data TEST ${bankcaseid2} Request Money Trail
   when Call API Request Money Trail case to CFR
   when Response File Success Request Money Trail 'Request_Money_Trail_success'
   AND Check Response from DB Request Money Trail ${ticketid}
