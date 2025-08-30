*** Settings ***
Resource  ../../resources/imports.robot

*** Test Cases ***

TC001_001 Submit new AOC case to CFR : Validate API for AOC submit new case to CFR (The warrant type here is H.)
    [Documentation]    Test Case SUBMIT
   Given Prepare Data TEST submit-police-case
   when Call API Submit new AOC case to CFR
   when Response File success Submit Police Case 'Submit_Police_success'
   AND Check Response from DB MASTER CASE ID ${bankcaseid} AND POLICE CASENUMBER ${warrant_id}

TC001_002 Send duplicate with previous case already have warrantType ID (added by API)
    [Documentation]    Test Case SUBMIT
   Given Prepare Data TEST submit-police-case มีหมาย H แล้ว
   when Call API Submit new AOC case to CFR
   when Response File success Submit Police Case 'Submit_Police_success'
   AND Check Response from DB MASTER CASE ID ${bankcaseid} AND POLICE CASENUMBER ${warrant_id} Update POLICE CASENUMBER (H)