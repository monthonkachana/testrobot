*** Settings ***
Resource  ../../resources/imports.robot

*** Test Cases ***

TC003_001 Validate Response Fail - ref_freeze_warrant is not exist - ref_freeze_warrant": "Q
   Given Prepare data warrantDate Local and WarrantTime Local
   Given Prepare Data TEST UnFreeze Account 'Z' Get data 'Existing' and Code '002' Unfreeze 1 Negative
   and Genarate warrantID random ref ID 'Q' negative
   and Prepare Json From to unfreeze-accounts
   when Call API UnFreeze Account AOC case to CFR
   when Response File Fail UnFreeze Account 'ref_freeze_warrant_cannot_be_found'

TC003_003 Validate Response Fail - ref_freeze_warrant is not exist - ref_freeze_warrant": "R
   #  [Documentation]    Test Case UnFreeze
   Given Prepare data warrantDate Local and WarrantTime Local
   Given Prepare Data TEST UnFreeze Account 'Z' Get data 'Existing' and Code '002' Unfreeze 1 Negative
   and Genarate warrantID random ref ID 'R' negative
   and Prepare Json From to unfreeze-accounts
   when Call API UnFreeze Account AOC case to CFR
   when Response File Fail UnFreeze Account 'ref_freeze_warrant_cannot_be_found'

TC003_007 Validate Response Fail - Code 6601 Invalid Request. Submit warrant does not match its type - Warrant_type is incorrect (4) Warrant_type = z (Small letter)
   #  [Documentation]    Test Case UnFreeze
   Given Prepare data warrantDate Local and WarrantTime Local
   Given Prepare Data TEST UnFreeze Account 'Z' Get data 'Existing' and Code '002' Unfreeze 1 Negative
   and Set test data type value '5' and value z
   and Prepare Json From to unfreeze-accounts
   when Call API UnFreeze Account AOC case to CFR
   when Response File Fail UnFreeze Account 'Invalid_format_warrant_type'

TC003_008 Validate Response Fail - Code 6601 Invalid Request. Submit warrant does not match its type - Warrant_type is incorrect (4) Warrant_type = H or h
   #  [Documentation]    Test Case UnFreeze
   Given Prepare data warrantDate Local and WarrantTime Local
   Given Prepare Data TEST UnFreeze Account 'Z' Get data 'Existing' and Code '002' Unfreeze 1 Negative
   and Set test data type value '5' and value H
   and Prepare Json From to unfreeze-accounts
   when Call API UnFreeze Account AOC case to CFR
   when Response File Fail UnFreeze Account 'Invalid_warrant_type'

TC003_009 Validate Response Fail - Code 6601 Invalid Request. Submit warrant does not match its type - Warrant_type is incorrect (4) Warrant_type = R or r
   #   [Documentation]    Test Case UnFreeze
   Given Prepare data warrantDate Local and WarrantTime Local
   Given Prepare Data TEST UnFreeze Account 'Z' Get data 'Existing' and Code '002' Unfreeze 1 Negative
   and Set test data type value '5' and value R
   and Prepare Json From to unfreeze-accounts
   when Call API UnFreeze Account AOC case to CFR
   when Response File Fail UnFreeze Account 'Invalid_warrant_type'

TC003_010 Validate Response Fail - Code 6601 Invalid Request. Submit warrant does not match its type - Warrant_type is incorrect (4) Warrant_type = Q or q
   #  [Documentation]    Test Case UnFreeze
   Given Prepare data warrantDate Local and WarrantTime Local
   Given Prepare Data TEST UnFreeze Account 'Z' Get data 'Existing' and Code '002' Unfreeze 1 Negative
   and Set test data type value '5' and value Q
   and Prepare Json From to unfreeze-accounts
   when Call API UnFreeze Account AOC case to CFR
   when Response File Fail UnFreeze Account 'Invalid_warrant_type'

TC003_011 Validate Response Fail - Code 6607 Invalid Request. Submit warrant does not match its type - Warrant_type is incorrect (4) Warrant_type = X or x
   Given Prepare data warrantDate Local and WarrantTime Local
   Given Prepare Data TEST UnFreeze Account 'Z' Get data 'Existing' and Code '002' Unfreeze 1 Negative
   and Set test data type value '5' and value X
   and Prepare Json From to unfreeze-accounts
   when Call API UnFreeze Account AOC case to CFR
   when Response File Fail UnFreeze Account 'Invalid_value_condition_warrant_type'

# TC003_012 Validate Response Fail - Code 6606 Invalid Request. Submit warrant does not match its type - Warrant_type is incorrect (4) Warrant_type = HRQ
TC003_012 Validate Response Fail - Code 6606 Invalid Request. Submit warrant does not match its type - Warrant_type is incorrect (4) Warrant_type = HRQ
   Given Prepare data warrantDate Local and WarrantTime Local
   Given Prepare Data TEST UnFreeze Account 'Z' Get data 'Existing' and Code '002' Unfreeze 1 Negative
   and Set test data type value '5' and value HRQ
   and Prepare Json From to unfreeze-accounts
   when Call API UnFreeze Account AOC case to CFR
   when Response File Fail UnFreeze Account 'Invalid_format_warrant_type'

TC003_014 Validate Response Fail – Warrant_type is incorrect - Code 6605 Invalid Request - Missing require field (1) account_no
   Given Prepare data warrantDate Local and WarrantTime Local
   Given Prepare Data TEST UnFreeze Account 'Z' Get data 'Existing' and Code '002' Unfreeze 1 Negative
   and Prepare Json From to unfreeze-accounts missing Account
   when Call API UnFreeze Account AOC case to CFR
   when Response File Fail UnFreeze Account 'Missing_require_field_account_no'

TC003_015 Validate Response Fail – Warrant_type is incorrect - Code 6605 Invalid Request - Missing require field (2) bank_code
   Given Prepare data warrantDate Local and WarrantTime Local
   Given Prepare Data TEST UnFreeze Account 'Z' Get data 'Existing' and Code '002' Unfreeze 1 Negative
   and Prepare Json From to unfreeze-accounts missing Bankcode
   when Call API UnFreeze Account AOC case to CFR
   when Response File Fail UnFreeze Account 'Missing_require_field_bank_code'

TC003_016 Validate Response Fail – Warrant_type is incorrect - Code 6605 Invalid Request - Missing require field (3) warrant_date
   Given Prepare data warrantDate Local and WarrantTime Local
   Given Prepare Data TEST UnFreeze Account 'Z' Get data 'Existing' and Code '002' Unfreeze 1 Negative
   and Prepare Json From to unfreeze-accounts missing Warrant_date
   when Call API UnFreeze Account AOC case to CFR
   when Response File Fail UnFreeze Account 'Missing_require_field_warrant_date'

TC003_017 Validate Response Fail – Warrant_type is incorrect - Code 6605 Invalid Request - Missing require field (4) warrant_time
   Given Prepare data warrantDate Local and WarrantTime Local
   Given Prepare Data TEST UnFreeze Account 'Z' Get data 'Existing' and Code '002' Unfreeze 1 Negative
   and Prepare Json From to unfreeze-accounts missing Warrant_time
   when Call API UnFreeze Account AOC case to CFR
   when Response File Fail UnFreeze Account 'Missing_require_field_warrant_time'

TC003_018 Validate Response Fail – Warrant_type is incorrect - Code 6605 Invalid Request - Missing require field (5) warrant_type
   Given Prepare data warrantDate Local and WarrantTime Local
   Given Prepare Data TEST UnFreeze Account 'Z' Get data 'Existing' and Code '002' Unfreeze 1 Negative
   and Prepare Json From to unfreeze-accounts missing Warrant_type
   when Call API UnFreeze Account AOC case to CFR
   when Response File Fail UnFreeze Account 'Missing_require_field_warrant_type'

TC003_019 Validate Response Fail – Warrant_type is incorrect - Code 6605 Invalid Request - Missing require field (6) warrant_id
   Given Prepare data warrantDate Local and WarrantTime Local
   Given Prepare Data TEST UnFreeze Account 'Z' Get data 'Existing' and Code '002' Unfreeze 1 Negative
   and Prepare Json From to unfreeze-accounts missing Warrant_id
   when Call API UnFreeze Account AOC case to CFR
   when Response File Fail UnFreeze Account 'Missing_require_field_warrant_id'

TC003_020 Validate Response Fail – Warrant_type is incorrect - Code 6605 Invalid Request - Missing require field (7) ref_freeze_warrant
   Given Prepare data warrantDate Local and WarrantTime Local
   Given Prepare Data TEST UnFreeze Account 'Z' Get data 'Existing' and Code '002' Unfreeze 1 Negative
   and Prepare Json From to unfreeze-accounts missing Ref_freeze_warrant
   when Call API UnFreeze Account AOC case to CFR
   when Response File Fail UnFreeze Account 'Missing_require_field_ref_freeze_warrant'

TC003_021 Validate Response Fail – Warrant_type is incorrect - Code 6605 Invalid Request - Missing require field (1) account_no
   Given Prepare data warrantDate Local and WarrantTime Local
   Given Prepare Data TEST UnFreeze Account 'Z' Get data 'Existing' and Code '002' Unfreeze 1 Negative
   and Set test data type value '7' and value ${EMPTY}
   and Prepare Json From to unfreeze-accounts missing Success
   when Call API UnFreeze Account AOC case to CFR
   when Response File Fail UnFreeze Account 'Missing_require_field_account_no'

TC003_022 Validate Response Fail – Warrant_type is incorrect - Code 6605 Invalid Request - Missing require field (2) bank_code
   Given Prepare data warrantDate Local and WarrantTime Local
   Given Prepare Data TEST UnFreeze Account 'Z' Get data 'Existing' and Code '002' Unfreeze 1 Negative
   and Set test data type value '8' and value ${EMPTY}
   and Prepare Json From to unfreeze-accounts missing Success
   when Call API UnFreeze Account AOC case to CFR
   when Response File Fail UnFreeze Account 'Missing_require_field_bank_code'

TC003_023 Validate Response Fail – Warrant_type is incorrect - Code 6605 Invalid Request - Missing require field (3) warrant_date
   Given Prepare data warrantDate Local and WarrantTime Local
   Given Prepare Data TEST UnFreeze Account 'Z' Get data 'Existing' and Code '002' Unfreeze 1 Negative
   and Set test data type value '3' and value ${EMPTY}
   and Prepare Json From to unfreeze-accounts missing Success
   when Call API UnFreeze Account AOC case to CFR
   when Response File Fail UnFreeze Account 'Missing_require_field_warrant_date'

TC003_024 Validate Response Fail – Warrant_type is incorrect - Code 6605 Invalid Request - Missing require field (4) warrant_time
   Given Prepare data warrantDate Local and WarrantTime Local
   Given Prepare Data TEST UnFreeze Account 'Z' Get data 'Existing' and Code '002' Unfreeze 1 Negative
   and Set test data type value '4' and value ${EMPTY}
   and Prepare Json From to unfreeze-accounts missing Success
   when Call API UnFreeze Account AOC case to CFR
   when Response File Fail UnFreeze Account 'Missing_require_field_warrant_time'

TC003_025 Validate Response Fail – Warrant_type is incorrect - Code 6605 Invalid Request - Missing require field (5) warrant_type
   Given Prepare data warrantDate Local and WarrantTime Local
   Given Prepare Data TEST UnFreeze Account 'Z' Get data 'Existing' and Code '002' Unfreeze 1 Negative
   and Set test data type value '5' and value ${EMPTY}
   and Prepare Json From to unfreeze-accounts missing Success
   when Call API UnFreeze Account AOC case to CFR
   when Response File Fail UnFreeze Account 'Missing_require_field_warrant_type'

TC003_026 Validate Response Fail – Warrant_type is incorrect - Code 6605 Invalid Request - Missing require field (6) warrant_id
   Given Prepare data warrantDate Local and WarrantTime Local
   Given Prepare Data TEST UnFreeze Account 'Z' Get data 'Existing' and Code '002' Unfreeze 1 Negative
   and Set test data type value '2' and value ${EMPTY}
   and Prepare Json From to unfreeze-accounts missing Success
   when Call API UnFreeze Account AOC case to CFR
   when Response File Fail UnFreeze Account 'Missing_require_field_warrant_id'

TC003_027 Validate Response Fail – Warrant_type is incorrect - Code 6605 Invalid Request - Missing require field (7) ref_freeze_warrant
   Given Prepare data warrantDate Local and WarrantTime Local
   Given Prepare Data TEST UnFreeze Account 'Z' Get data 'Existing' and Code '002' Unfreeze 1 Negative
   and Set test data type value '6' and value ${EMPTY}
   and Prepare Json From to unfreeze-accounts missing Success
   when Call API UnFreeze Account AOC case to CFR
   when Response File Fail UnFreeze Account 'Missing_require_field_ref_freeze_warrant'

TC003_028 Validate Response Fail - Code 6606 Invalid Request - Invalid length (1) account_no (more than 15 digits) = 12345678901234561 
   Given Prepare data warrantDate Local and WarrantTime Local
   Given Prepare Data TEST UnFreeze Account 'Z' Get data 'Existing' and Code '002' Unfreeze 1 Negative
   and Set test data type value '7' and value 12345678901234561
   and Prepare Json From to unfreeze-accounts missing Success
   when Call API UnFreeze Account AOC case to CFR
   when Response File Fail UnFreeze Account 'Invalid_format_account_no'

TC003_029 Validate Response Fail - Code 6606 Invalid Request - Invalid length (2) bank_code = bank_code": "0041"
   Given Prepare data warrantDate Local and WarrantTime Local
   Given Prepare Data TEST UnFreeze Account 'Z' Get data 'Existing' and Code '002' Unfreeze 1 Negative
   and Set test data type value '8' and value 0041
   and Prepare Json From to unfreeze-accounts missing Success
   when Call API UnFreeze Account AOC case to CFR
   when Response File Fail UnFreeze Account 'Invalid_format_bank_code'

TC003_030 Validate Response Fail - Code 6606 Invalid Request - Invalid length (3) warrant_date = warrant_date": "2567-09-161"
   Given Prepare data warrantDate Local and WarrantTime Local
   Given Prepare Data TEST UnFreeze Account 'Z' Get data 'Existing' and Code '002' Unfreeze 1 Negative
   and Set test data type value '3' and value 2567-09-161
   and Prepare Json From to unfreeze-accounts missing Success
   when Call API UnFreeze Account AOC case to CFR
   when Response File Fail UnFreeze Account 'Invalid_format_warrant_date'

TC003_031 Validate Response Fail - Code 6606 Invalid Request - Invalid length (4) warrant_time = warrant_time": "10:59:00"
   Given Prepare data warrantDate Local and WarrantTime Local
   Given Prepare Data TEST UnFreeze Account 'Z' Get data 'Existing' and Code '002' Unfreeze 1 Negative
   and Set test data type value '4' and value 10:59:00
   and Prepare Json From to unfreeze-accounts missing Success
   when Call API UnFreeze Account AOC case to CFR
   when Response File Fail UnFreeze Account 'Invalid_format_warrant_time'

TC003_032 Validate Response Fail - Code 6606 Invalid Request - Invalid length (5) warrant_type = warrant_type": "กข"
   Given Prepare data warrantDate Local and WarrantTime Local
   Given Prepare Data TEST UnFreeze Account 'Z' Get data 'Existing' and Code '002' Unfreeze 1 Negative
   and Set test data type value '5' and value กข
   and Prepare Json From to unfreeze-accounts missing Success
   when Call API UnFreeze Account AOC case to CFR
   when Response File Fail UnFreeze Account 'Invalid_format_warrant_type'

TC003_033 Validate Response Fail - Code 6606 - Invalid length ( > 128 digits)
   Given Prepare data warrantDate Local and WarrantTime Local
   Given Prepare Data TEST UnFreeze Account 'Z' Get data 'Existing' and Code '002' Unfreeze 1 Negative
   and Set test data type value '2' and value Z|147817|ตช.0018(นม).(22)/994|6604195986604195986604195986604195986604195986604195986604195986604195986604195986604195986TC002_033
   and Prepare Json From to unfreeze-accounts missing Success
   when Call API UnFreeze Account AOC case to CFR
   when Response File Fail UnFreeze Account 'Invalid_format_warrant_id'

TC003_034 Validate Response Fail - Code 6606 - Invalid length ( > 128 digits) (7)ref_freeze_warrant
   Given Prepare data warrantDate Local and WarrantTime Local
   Given Prepare Data TEST UnFreeze Account 'Z' Get data 'Existing' and Code '002' Unfreeze 1 Negative
   and Set test data type value '6' and value Z|147817|ตช.0018(นม).(22)/994|6604195986604195986604195986604195986604195986604195986604195986604195986604195986604195986TC002_033
   and Prepare Json From to unfreeze-accounts missing Success
   when Call API UnFreeze Account AOC case to CFR
   when Response File Fail UnFreeze Account 'Invalid_format_ref_freeze_warrant'

TC003_035 Validate Response Fail – Warrant_type is incorrect - Code 6606 Invalid Request - Invalid format require field (1) account_no = "012345XXXX9"
   Given Prepare data warrantDate Local and WarrantTime Local
   Given Prepare Data TEST UnFreeze Account 'Z' Get data 'Existing' and Code '002' Unfreeze 1 Negative
   and Set test data type value '7' and value 012345XXXX9
   and Prepare Json From to unfreeze-accounts missing Success
   when Call API UnFreeze Account AOC case to CFR
   when Response File Fail UnFreeze Account 'Invalid_format_account_no'

TC003_036 Validate Response Fail – Warrant_type is incorrect - Code 6606 Invalid Request - Invalid format require field (2) bank_code = "BBL"
   Given Prepare data warrantDate Local and WarrantTime Local
   Given Prepare Data TEST UnFreeze Account 'Z' Get data 'Existing' and Code '002' Unfreeze 1 Negative
   and Set test data type value '8' and value BBL
   and Prepare Json From to unfreeze-accounts missing Success
   when Call API UnFreeze Account AOC case to CFR
   when Response File Fail UnFreeze Account 'Invalid_format_bank_code'

TC003_037 Validate Response Fail – Warrant_type is incorrect - Code 6606 Invalid Request - Invalid format require field (3) warrant_date = "2566-13-31"
   Given Prepare data warrantDate Local and WarrantTime Local
   Given Prepare Data TEST UnFreeze Account 'Z' Get data 'Existing' and Code '002' Unfreeze 1 Negative
   and Set test data type value '3' and value 2566-13-31
   and Prepare Json From to unfreeze-accounts missing Success
   when Call API UnFreeze Account AOC case to CFR
   when Response File Fail UnFreeze Account 'Invalid_format_warrant_date'

TC003_038 Validate Response Fail – Warrant_type is incorrect - Code 6606 Invalid Request - Invalid format require field (3) warrant_date = "2566-02-31"
   Given Prepare data warrantDate Local and WarrantTime Local
   Given Prepare Data TEST UnFreeze Account 'Z' Get data 'Existing' and Code '002' Unfreeze 1 Negative
   and Set test data type value '3' and value 2566-02-31
   and Prepare Json From to unfreeze-accounts missing Success
   when Call API UnFreeze Account AOC case to CFR
   when Response File Fail UnFreeze Account 'Invalid_format_warrant_date'

TC003_039 Validate Response Fail – Warrant_type is incorrect - Code 6606 Invalid Request - Invalid format require field (3) warrant_date = "2566/02/13"
   Given Prepare data warrantDate Local and WarrantTime Local
   Given Prepare Data TEST UnFreeze Account 'Z' Get data 'Existing' and Code '002' Unfreeze 1 Negative
   and Set test data type value '3' and value 2566/02/13
   and Prepare Json From to unfreeze-accounts missing Success
   when Call API UnFreeze Account AOC case to CFR
   when Response File Fail UnFreeze Account 'Invalid_format_warrant_date'

TC003_040 Validate Response Fail – Warrant_type is incorrect - Code 6606 Invalid Request - Invalid format require field (4) warrant_time - warrant_time = "25:59"
   Given Prepare data warrantDate Local and WarrantTime Local
   Given Prepare Data TEST UnFreeze Account 'Z' Get data 'Existing' and Code '002' Unfreeze 1 Negative
   and Set test data type value '4' and value 25:59
   and Prepare Json From to unfreeze-accounts missing Success
   when Call API UnFreeze Account AOC case to CFR
   when Response File Fail UnFreeze Account 'Invalid_format_warrant_time'

TC003_041 Validate Response Fail – Warrant_type is incorrect - Code 6606 Invalid Request - Invalid format require field (4) warrant_time - warrant_time = "20.59"
   Given Prepare data warrantDate Local and WarrantTime Local
   Given Prepare Data TEST UnFreeze Account 'Z' Get data 'Existing' and Code '002' Unfreeze 1 Negative
   and Set test data type value '4' and value 20.59
   and Prepare Json From to unfreeze-accounts missing Success
   when Call API UnFreeze Account AOC case to CFR
   when Response File Fail UnFreeze Account 'Invalid_format_warrant_time'

TC003_042 Validate Response Fail – Warrant_type is incorrect - Code 6606 Invalid Request - Invalid format require field (6) warrant_id - warrant_id = "Z||"
   Given Prepare data warrantDate Local and WarrantTime Local
   Given Prepare Data TEST UnFreeze Account 'Z' Get data 'Existing' and Code '002' Unfreeze 1 Negative
   and Set test data type value '2' and value Z||
   and Prepare Json From to unfreeze-accounts missing Success
   when Call API UnFreeze Account AOC case to CFR
   when Response File Fail UnFreeze Account 'Invalid_format_warrant_id'

TC003_043 Validate Response Fail - Code 6607 Invalid field format - Invalid warrant_id format - Invalid format require field (6) warrant_id does not have warrant_type warrant_id = :"|147817|ตช.0018(นม).(22)/994|TC003_043" 
   Given Prepare data warrantDate Local and WarrantTime Local
   Given Prepare Data TEST UnFreeze Account 'Z' Get data 'Existing' and Code '002' Unfreeze 1 Negative
   and Set test data type value '2' and value Q|147817|TESTSDSDADSAD994|TC003_043
   and Prepare Json From to unfreeze-accounts missing Success
   when Call API UnFreeze Account AOC case to CFR
   when Response File Fail UnFreeze Account 'Invalid_value_condition_warrant_id'

TC003_044 Validate Response Fail – ref_freeze_warrant is incorrect - Code 6603 Invalid Request - Not found (7) ref_freeze_warrant - ref_freeze_warrant = :"Q|00000|0.(00)/00|TC003_044"
   Given Prepare data warrantDate Local and WarrantTime Local
   Given Prepare Data TEST UnFreeze Account 'Z' Get data 'Existing' and Code '002' Unfreeze 1 Negative
   and Set test data type value '6' and value Q|00000|0.(00)/00|TC003_044
   and Prepare Json From to unfreeze-accounts missing Success
   when Call API UnFreeze Account AOC case to CFR
   when Response File Fail UnFreeze Account 'ref_freeze_warrant_cannot_be_found'

TC003_045 Validate Response Fail – Warrant_type is incorrect - Code 6606 Invalid format (1) account_no = "Null"
   Given Prepare data warrantDate Local and WarrantTime Local
   Given Prepare Data TEST UnFreeze Account 'Z' Get data 'Existing' and Code '002' Unfreeze 1 Negative
   and Set test data type value '7' and value Null
   and Prepare Json From to unfreeze-accounts missing Success
   when Call API UnFreeze Account AOC case to CFR
   when Response File Fail UnFreeze Account 'Invalid_format_account_no'

TC003_046 Validate Response Fail – Warrant_type is incorrect - Code 6606 Invalid format (2) bank_code = "Null"
   Given Prepare data warrantDate Local and WarrantTime Local
   Given Prepare Data TEST UnFreeze Account 'Z' Get data 'Existing' and Code '002' Unfreeze 1 Negative
   and Set test data type value '8' and value Null
   and Prepare Json From to unfreeze-accounts missing Success
   when Call API UnFreeze Account AOC case to CFR
   when Response File Fail UnFreeze Account 'Invalid_format_bank_code'

TC003_047 Validate Response Fail – Warrant_type is incorrect - Code 6606 Invalid format (3) warrant_date = "Null"
   Given Prepare data warrantDate Local and WarrantTime Local
   Given Prepare Data TEST UnFreeze Account 'Z' Get data 'Existing' and Code '002' Unfreeze 1 Negative
   and Set test data type value '3' and value Null
   and Prepare Json From to unfreeze-accounts missing Success
   when Call API UnFreeze Account AOC case to CFR
   when Response File Fail UnFreeze Account 'Invalid_format_warrant_date'

TC003_048 Validate Response Fail – Warrant_type is incorrect - Code 6606 Invalid format (4) Warrant_time = "Null"
   Given Prepare data warrantDate Local and WarrantTime Local
   Given Prepare Data TEST UnFreeze Account 'Z' Get data 'Existing' and Code '002' Unfreeze 1 Negative
   and Set test data type value '4' and value Null
   and Prepare Json From to unfreeze-accounts missing Success
   when Call API UnFreeze Account AOC case to CFR
   when Response File Fail UnFreeze Account 'Invalid_format_warrant_time'

TC003_049 Validate Response Fail – Warrant_type is incorrect - Code 6606 Invalid format (5) warrant_type = "Null"
   Given Prepare data warrantDate Local and WarrantTime Local
   Given Prepare Data TEST UnFreeze Account 'Z' Get data 'Existing' and Code '002' Unfreeze 1 Negative
   and Set test data type value '5' and value Null
   and Prepare Json From to unfreeze-accounts missing Success
   when Call API UnFreeze Account AOC case to CFR
   when Response File Fail UnFreeze Account 'Invalid_format_warrant_type'

TC003_050 Validate Response Fail – Warrant_type is incorrect - Code 6606 Invalid format (6) warrant_id = "Null"
   Given Prepare data warrantDate Local and WarrantTime Local
   Given Prepare Data TEST UnFreeze Account 'Z' Get data 'Existing' and Code '002' Unfreeze 1 Negative
   and Set test data type value '2' and value Null
   and Prepare Json From to unfreeze-accounts missing Success
   when Call API UnFreeze Account AOC case to CFR
   when Response File Fail UnFreeze Account 'Invalid_format_warrant_id'

TC003_051 Validate Response Fail – Warrant_type is incorrect - Code 6606 Invalid format (7) ref_freeze_warrant = "Null" = "Null"
   Given Prepare data warrantDate Local and WarrantTime Local
   Given Prepare Data TEST UnFreeze Account 'Z' Get data 'Existing' and Code '002' Unfreeze 1 Negative
   and Set test data type value '6' and value Null
   and Prepare Json From to unfreeze-accounts missing Success
   when Call API UnFreeze Account AOC case to CFR
   when Response File Fail UnFreeze Account 'Invalid_format_ref_freeze_warrant'

TC003_052 Validate Response Fail – Warrant_type is incorrect - Code 6400 Invalid format - Invalid parameter (1) account_n
   Given Prepare data warrantDate Local and WarrantTime Local
   Given Prepare Data TEST UnFreeze Account 'Z' Get data 'Existing' and Code '002' Unfreeze 1 Negative
   and Prepare Json From to unfreeze-accounts missing Custom
   and set test variable   ${account_no_type}     account_n
   and Prepare Json From to unfreeze-accounts Custom
   when Call API UnFreeze Account AOC case to CFR
   when Response File Fail UnFreeze Account 'Request_body_contain_invalid_format'

TC003_053 Validate Response Fail – Warrant_type is incorrect - Code 6400 Invalid format - Invalid parameter (2) bank_code
   Given Prepare data warrantDate Local and WarrantTime Local
   Given Prepare Data TEST UnFreeze Account 'Z' Get data 'Existing' and Code '002' Unfreeze 1 Negative
   and Prepare Json From to unfreeze-accounts missing Custom
   and set test variable   ${bank_code_type}     bank_co
   and Prepare Json From to unfreeze-accounts Custom
   when Call API UnFreeze Account AOC case to CFR
   when Response File Fail UnFreeze Account 'Request_body_contain_invalid_format'

TC003_054 Validate Response Fail – Warrant_type is incorrect - Code 6400 Invalid format - Invalid parameter (3) warrant_date 
   Given Prepare data warrantDate Local and WarrantTime Local
   Given Prepare Data TEST UnFreeze Account 'Z' Get data 'Existing' and Code '002' Unfreeze 1 Negative
   and Prepare Json From to unfreeze-accounts missing Custom
   and set test variable   ${warrant_date_type}     warrant_da
   and Prepare Json From to unfreeze-accounts Custom
   when Call API UnFreeze Account AOC case to CFR
   when Response File Fail UnFreeze Account 'Request_body_contain_invalid_format'

TC003_055 Validate Response Fail – Warrant_type is incorrect - Code 6400 Invalid format - Invalid parameter (4) warrant_time
   Given Prepare data warrantDate Local and WarrantTime Local
   Given Prepare Data TEST UnFreeze Account 'Z' Get data 'Existing' and Code '002' Unfreeze 1 Negative
   and Prepare Json From to unfreeze-accounts missing Custom
   and set test variable   ${warrant_time_type}     warrant_ti
   and Prepare Json From to unfreeze-accounts Custom
   when Call API UnFreeze Account AOC case to CFR
   when Response File Fail UnFreeze Account 'Request_body_contain_invalid_format'

TC003_056 Validate Response Fail – Warrant_type is incorrect - Code 6400 Invalid format - Invalid parameter (5) warrant_type
   Given Prepare data warrantDate Local and WarrantTime Local
   Given Prepare Data TEST UnFreeze Account 'Z' Get data 'Existing' and Code '002' Unfreeze 1 Negative
   and Prepare Json From to unfreeze-accounts missing Custom
   and set test variable   ${warrant_type_type}     warrant_ty
   and Prepare Json From to unfreeze-accounts Custom
   when Call API UnFreeze Account AOC case to CFR
   when Response File Fail UnFreeze Account 'Request_body_contain_invalid_format'

TC003_057 Validate Response Fail – Warrant_type is incorrect - Code 6400 Invalid format - Invalid parameter (6) warrant_id
   Given Prepare data warrantDate Local and WarrantTime Local
   Given Prepare Data TEST UnFreeze Account 'Z' Get data 'Existing' and Code '002' Unfreeze 1 Negative
   and Prepare Json From to unfreeze-accounts missing Custom
   and set test variable   ${warrant_id_type}     warrant_i
   and Prepare Json From to unfreeze-accounts Custom
   when Call API UnFreeze Account AOC case to CFR
   when Response File Fail UnFreeze Account 'Request_body_contain_invalid_format'

TC003_058 Validate Response Fail – Warrant_type is incorrect - Code 6400 Invalid format - Invalid parameter (7) ref_freeze_warrant 
   Given Prepare data warrantDate Local and WarrantTime Local
   Given Prepare Data TEST UnFreeze Account 'Z' Get data 'Existing' and Code '002' Unfreeze 1 Negative
   and Prepare Json From to unfreeze-accounts missing Custom
   and set test variable   ${ref_freeze_warrant _type}     ref_freeze_war
   and Prepare Json From to unfreeze-accounts Custom
   when Call API UnFreeze Account AOC case to CFR
   when Response File Fail UnFreeze Account 'Request_body_contain_invalid_format'

TC003_059 Validate Response Fail - Code 6400 Invalid format - Invalid parameter (Not define) 
   Given Prepare data warrantDate Local and WarrantTime Local
   Given Prepare Data TEST UnFreeze Account 'Z' Get data 'Existing' and Code '002' Unfreeze 1 Negative
   and Prepare Json From to unfreeze-accounts missing success
   and set test variable   ${bankcaseid}    25670101BBL00000
   and Prepare Json From to unfreeze-accounts add bank case
   when Call API UnFreeze Account AOC case to CFR
   when Response File Fail UnFreeze Account 'Request_body_contain_invalid_format'

TC003_060 Validate Response Fail - Code 6403 Forbidden - The request method is not allowed
   Given Prepare data warrantDate Local and WarrantTime Local
   Given Prepare Data TEST UnFreeze Account 'Z' Get data 'Existing' and Code '002' Unfreeze 1 Negative
   and Prepare Json From to unfreeze-accounts missing success
   when Call API UnFreeze Account AOC case to CFR 6403
   when Response File Fail UnFreeze Account 'Participant6403'

# TC003_061 Validate Response Fail – Warrant_type is incorrect - Code 6400 Invalid format - Invalid parameter (7) ref_freeze_warrant 
#    Given Prepare data warrantDate Local and WarrantTime Local
#    Given Prepare Data TEST UnFreeze Account 'Z' Get data 'Existing' and Code '002' Unfreeze 1 Negative
#    and Prepare Json From to unfreeze-accounts missing success
#    # and set test variable   ${ref_freeze_warrant _type}     ref_freeze_war
#    and Prepare Json From to unfreeze-accounts 51 account
#    when Call API UnFreeze Account AOC case to CFR
#    when Response File Fail UnFreeze Account 'Request_body_contain_invalid_format'