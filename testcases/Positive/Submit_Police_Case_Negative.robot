*** Settings ***
Resource  ../../resources/imports.robot

*** Test Cases ***

# TC001_004 Validate Response Fail (5) Warrant_ID Send duplicate Warrant_ID with previous case
#    Given Prepare Data TEST submit-police-case negative random
#    when Call API Submit new AOC case to CFR
#    when Response File Success Submit Police Case 'Submit_Police_success'
#    AND Check Response from DB MASTER CASE ID ${bankcaseid} AND POLICE CASENUMBER ${warrant_id}
#    Given Prepare Data TEST submit-police-case negative Dup
#    when Call API Submit new AOC case to CFR
#    AND Check Response from DB MASTER CASE ID ${bankcaseid} AND POLICE CASENUMBER ${warrant_id}


TC001_005 Validate Response Fail - Code 6600 Invalid Request - BankCaseID does not match (1) BankCaseID does not exist
    [Documentation]    Test Case SUBMIT
   Given Prepare data warrantDate Local and WarrantTime Local
   Given Prepare Data TEST submit-police-case negative 25670930BBL00000 and warrantID H
   AND Prepare Json From to submit 
   when Call API Submit new AOC case to CFR
   when Response File Fail Submit Police Case 'BankCaseID_does_not_found'

TC001_006 Validate Response Fail - Code 6600 Invalid Request - BankCaseID does not match (1) BankCaseID invalid format = scb ( Small letter)
    [Documentation]    Test Case SUBMIT
   Given Prepare data warrantDate Local and WarrantTime Local
   Given Prepare Data TEST submit-police-case negative 25670120bbl00912 and warrantID H
   AND Prepare Json From to submit 
   when Call API Submit new AOC case to CFR
   when Response File Fail Submit Police Case 'BankCaseID_does_not_found'

TC001_007 Validate Response Fail - Code 6606 Invalid field format - Invalid BankCaseID format (1) BankCaseID less than minimum length = 14 digits
    [Documentation]    Test Case SUBMIT
   Given Prepare data warrantDate Local and WarrantTime Local
   Given Prepare Data TEST submit-police-case negative 256709BBL00000 and warrantID H
   AND Prepare Json From to submit 
   when Call API Submit new AOC case to CFR
   when Response File Fail Submit Police Case 'Invalid_format_BankCaseID'

TC001_008 Validate Response Fail - Code 6606 Invalid field format - Invalid BankCaseID format (1) BankCaseID more than maximum length = 19 digits
    [Documentation]    Test Case SUBMIT
   Given Prepare data warrantDate Local and WarrantTime Local
   Given Prepare Data TEST submit-police-case negative 25670930BBL00000123 and warrantID H
   AND Prepare Json From to submit 
   when Call API Submit new AOC case to CFR
   when Response File Fail Submit Police Case 'Invalid_format_BankCaseID'

TC001_009 Validate Response Fail- Code 6601 Invalid Request. Submit warrant does not match its type - Warrant_type is incorrect (4) Warrant_type = h (Small letter)"
    [Documentation]    Test Case SUBMIT
   Given Prepare data warrantDate Local and WarrantTime Local
   Given Prepare Data TEST submit-police-case negative random and warrantID h
   AND Prepare Json From to submit 
   when Call API Submit new AOC case to CFR
   when Response File Fail Submit Police Case 'Invalid_format_warrant_type'

TC001_010 Validate Response Fail - Code 6601 Invalid Request. Submit warrant does not match its type - Warrant_type is incorrect (4) Warrant_type = R
    [Documentation]    Test Case SUBMIT
   Given Prepare data warrantDate Local and WarrantTime Local
   Given Prepare Data TEST submit-police-case negative random and warrantID H
   and set test variable  ${warrant_type}     R 
   AND Prepare Json From to submit 
   when Call API Submit new AOC case to CFR
   when Response File Fail Submit Police Case 'Invalid_warrant_type'

TC001_011 Validate Response Fail - Code 6601 Invalid Request. Submit warrant does not match its type - Warrant_type is incorrect (4) Warrant_type = Q
    [Documentation]    Test Case SUBMIT
   Given Prepare data warrantDate Local and WarrantTime Local
   Given Prepare Data TEST submit-police-case negative random and warrantID H
   and set test variable  ${warrant_type}     Q
   AND Prepare Json From to submit 
   when Call API Submit new AOC case to CFR
   when Response File Fail Submit Police Case 'Invalid_warrant_type'


TC001_012 Validate Response Fail - Code 6601 Invalid Request. Submit warrant does not match its type - Warrant_type is incorrect (4) Warrant_type = Z
    [Documentation]    Test Case SUBMIT
   Given Prepare data warrantDate Local and WarrantTime Local
   Given Prepare Data TEST submit-police-case negative random and warrantID H
   and set test variable  ${warrant_type}    Z 
   AND Prepare Json From to submit 
   when Call API Submit new AOC case to CFR
   when Response File Fail Submit Police Case 'Invalid_warrant_type'

TC001_013 Validate Response Fail - Code 6601 Invalid Request. Submit warrant does not match its type - Warrant_type is incorrect (4) Warrant_type = X
    [Documentation]    Test Case SUBMIT
   Given Prepare data warrantDate Local and WarrantTime Local
   Given Prepare Data TEST submit-police-case negative random and warrantID H
   and set test variable  ${warrant_type}     X 
   AND Prepare Json From to submit 
   when Call API Submit new AOC case to CFR
   when Response File Fail Submit Police Case 'Invalid_value_condition_warrant_type'


TC001_014 Validate Response Fail - Code 6601 Invalid Request. Submit warrant does not match its type - Warrant_type is incorrect (4) Warrant_type = HH
    [Documentation]    Test Case SUBMIT
   Given Prepare data warrantDate Local and WarrantTime Local
   Given Prepare Data TEST submit-police-case negative random and warrantID H
   and set test variable  ${warrant_type}     HH 
   AND Prepare Json From to submit 
   when Call API Submit new AOC case to CFR
   when Response File Fail Submit Police Case 'Invalid_format_warrant_type'

TC001_015 Validate Response Fail - Code 6605 Invalid Request - Missing require field (1) bankcaseid
    [Documentation]    Test Case SUBMIT
   Given Prepare data warrantDate Local and WarrantTime Local
   Given Prepare Data TEST submit-police-case negative random and warrantID H
   AND Prepare Json From to submit not bankcaseid
   when Call API Submit new AOC case to CFR
   when Response File Fail Submit Police Case 'Missing_require_field_bankcaseid'

TC001_016 Validate Response Fail - Code 6605 Invalid Request - Missing require field (2) warrant_date
    [Documentation]    Test Case SUBMIT
   Given Prepare data warrantDate Local and WarrantTime Local
   Given Prepare Data TEST submit-police-case negative random and warrantID H
   AND Prepare Json From to submit warrant date
   when Call API Submit new AOC case to CFR
   when Response File Fail Submit Police Case 'Missing_require_field_warrant_date'

TC001_017 Validate Response Fail - Code 6605 Invalid Request - Missing require field (3) warrant_time
    [Documentation]    Test Case SUBMIT
   Given Prepare data warrantDate Local and WarrantTime Local
   Given Prepare Data TEST submit-police-case negative random and warrantID H
   AND Prepare Json From to submit warrant time
   when Call API Submit new AOC case to CFR
   when Response File Fail Submit Police Case 'Missing_require_field_warrant_time'


TC001_018 Validate Response Fail - Code 6605 Invalid Request - Missing require field (4) warrant_type
    [Documentation]    Test Case SUBMIT
   Given Prepare data warrantDate Local and WarrantTime Local
   Given Prepare Data TEST submit-police-case negative random and warrantID H
   AND Prepare Json From to submit warrant type
   when Call API Submit new AOC case to CFR
   when Response File Fail Submit Police Case 'Missing_require_field_warrant_type'

TC001_019 Validate Response Fail - Code 6605 Invalid Request - Missing require field (5) warrant_id
    [Documentation]    Test Case SUBMIT
   Given Prepare data warrantDate Local and WarrantTime Local
   Given Prepare Data TEST submit-police-case negative random and warrantID H
   AND Prepare Json From to submit warrant id
   when Call API Submit new AOC case to CFR
   when Response File Fail Submit Police Case 'Missing_require_field_warrant_id'


TC001_020 Validate Response Fail - Code 6605 Invalid Request - Missing require field (1) bankcaseid = Empty
     [Documentation]    Test Case SUBMIT
   Given Prepare data warrantDate Local and WarrantTime Local
   Given Prepare Data TEST submit-police-case negative random and warrantID H
   and Set data Test summit case 
   AND Prepare Json From to submit 
   when Call API Submit new AOC case to CFR
   when Response File Fail Submit Police Case 'Missing_require_field_bankcaseid'


TC001_021 Validate Response Fail - Code 6605 Invalid Request - Missing require field (2) warrant_date = Empty
    [Documentation]    Test Case SUBMIT
   Given Prepare data warrantDate Local and WarrantTime Local
   Given Prepare Data TEST submit-police-case negative random and warrantID H
   and Set data Test summit case warrant_date
   AND Prepare Json From to submit 
   when Call API Submit new AOC case to CFR
   when Response File Fail Submit Police Case 'Missing_require_field_warrant_date'


TC001_022 Validate Response Fail - Code 6605 Invalid Request - Missing require field (3) warrant_time = Empty
    [Documentation]    Test Case SUBMIT
   Given Prepare data warrantDate Local and WarrantTime Local
   Given Prepare Data TEST submit-police-case negative random and warrantID H
   and Set data Test summit case warrant_time
   AND Prepare Json From to submit 
   when Call API Submit new AOC case to CFR
   when Response File Fail Submit Police Case 'Missing_require_field_warrant_time'


TC001_023 Validate Response Fail - Code 6605 Invalid Request - Missing require field (3) warrant_type = Empty
    [Documentation]    Test Case SUBMIT
   Given Prepare data warrantDate Local and WarrantTime Local
   Given Prepare Data TEST submit-police-case negative random and warrantID H
   and Set data Test summit case warrant_type
   AND Prepare Json From to submit 
   when Call API Submit new AOC case to CFR
   when Response File Fail Submit Police Case 'Missing_require_field_warrant_type'


TC001_024 Validate Response Fail - Code 6605 Invalid Request - Missing require field (3) warrant_id = Empty
    [Documentation]    Test Case SUBMIT
   Given Prepare data warrantDate Local and WarrantTime Local
   Given Prepare Data TEST submit-police-case negative random and warrantID H
   and Set data Test summit case warrant_id
   AND Prepare Json From to submit 
   when Call API Submit new AOC case to CFR
   when Response File Fail Submit Police Case 'Missing_require_field_warrant_id'


TC001_025 Validate Response Fail - Code 6606 Invalid format - Invalid length (2) warrant_date warrant_date = 2566-01-201 or 2566-01-2
    [Documentation]    Test Case SUBMIT
   Given Prepare data warrantDate 2566-01-201 and WarrantTime Local
   Given Prepare Data TEST submit-police-case negative random and warrantID H
   AND Prepare Json From to submit 
   when Call API Submit new AOC case to CFR
   when Response File Fail Submit Police Case 'Invalid_format_warrant_date'

TC001_025_1 Validate Response Fail - Code 6606 Invalid format - Invalid length (2) warrant_date warrant_date = 2566-01-201 or 2566-01-2
    [Documentation]    Test Case SUBMIT
   Given Prepare data warrantDate 2566-01-2 and WarrantTime Local
   Given Prepare Data TEST submit-police-case negative random and warrantID H
   AND Prepare Json From to submit 
   when Call API Submit new AOC case to CFR
   when Response File Fail Submit Police Case 'Invalid_format_warrant_date'

TC001_026 Validate Response Fail - Code 6606 Invalid format - Invalid length (3) warrant_time warrant_time = 10:590
     [Documentation]    Test Case SUBMIT
   Given Prepare data warrantDate Local and WarrantTime 10:590
   Given Prepare Data TEST submit-police-case negative random and warrantID H
   AND Prepare Json From to submit 
   when Call API Submit new AOC case to CFR
   when Response File Fail Submit Police Case 'Invalid_format_warrant_time'

TC001_027 Validate Response Fail - Code 6606 Invalid format - Invalid length (4) warrant_type warrant_type = HH
    [Documentation]    Test Case SUBMIT
   Given Prepare data warrantDate Local and WarrantTime Local
   Given Prepare Data TEST submit-police-case negative random and warrantID H
   and Set data Test summit case warrant_type HH
   AND Prepare Json From to submit 
   when Call API Submit new AOC case to CFR
   when Response File Fail Submit Police Case 'Invalid_format_warrant_type'


TC001_028 Validate Response Fail - Code 6606 Invalid format - Invalid length (5) warrant_id > 128 digits
     [Documentation]    Test Case SUBMIT
   Given Prepare data warrantDate Local and WarrantTime Local
   Given Prepare Data TEST submit-police-case negative random and warrantID More
   AND Prepare Json From to submit 
   when Call API Submit new AOC case to CFR
   when Response File Fail Submit Police Case 'Invalid_format_warrant_id'

TC001_029 Validate Response Fail - Code 6606 Invalid format - Invalid format (2) warrant_date warrant_date = 2566-13-31
    [Documentation]    Test Case SUBMIT
   Given Prepare data warrantDate 2566-13-31 and WarrantTime Local
   Given Prepare Data TEST submit-police-case negative random and warrantID H
   AND Prepare Json From to submit 
   when Call API Submit new AOC case to CFR
   when Response File Fail Submit Police Case 'Invalid_format_warrant_date'

TC001_030 Validate Response Fail - Code 6606 Invalid format - Invalid format (2) warrant_date warrant_date = 2566-02-31
    [Documentation]    Test Case SUBMIT
   Given Prepare data warrantDate 2566-02-31 and WarrantTime Local
   Given Prepare Data TEST submit-police-case negative random and warrantID H
   AND Prepare Json From to submit 
   when Call API Submit new AOC case to CFR
   when Response File Fail Submit Police Case 'Invalid_format_warrant_date'

TC001_031 Validate Response Fail - Code 6606 Invalid format - Invalid format (2) warrant_date warrant_date = 2566/01/31
     [Documentation]    Test Case SUBMIT
   Given Prepare data warrantDate 2566/01/31 and WarrantTime Local
   Given Prepare Data TEST submit-police-case negative random and warrantID H
   AND Prepare Json From to submit 
   when Call API Submit new AOC case to CFR
   when Response File Fail Submit Police Case 'Invalid_format_warrant_date'

TC001_032 Validate Response Fail - Code 6606 Invalid format - Invalid format (2) warrant_date warrant_time = 10.59
    [Documentation]    Test Case SUBMIT
   Given Prepare data warrantDate Local and WarrantTime 10.59
   Given Prepare Data TEST submit-police-case negative random and warrantID H
   AND Prepare Json From to submit 
   when Call API Submit new AOC case to CFR
   when Response File Fail Submit Police Case 'Invalid_format_warrant_time'

TC001_033 Validate Response Fail - Code 6606 Invalid format - Invalid format (2) warrant_date warrant_time = 25:59
    [Documentation]    Test Case SUBMIT
   Given Prepare data warrantDate Local and WarrantTime 25:59
   Given Prepare Data TEST submit-police-case negative random and warrantID H
   AND Prepare Json From to submit 
   when Call API Submit new AOC case to CFR
   when Response File Fail Submit Police Case 'Invalid_format_warrant_time'