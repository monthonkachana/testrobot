*** Settings ***
Resource  ../resources/imports.robot
# Library    OperatingSystem
Library    OperatingSystem
Library    String
Library    Collections
# Library    OperatingSystemLibrary

*** Variables ***
${FILE_PATH}         ${CURDIR}\\..\\resources\\testdata\\dev\\Typez.txt
*** Keywords ***



Prepare Data TEST AOC BankCaseID ${bankcaseid} WarrantID ${warrant_id} WarrantDate ${warrant_date} WarrantTIME ${warrant_time} WarrantTYPE ${warrant_type}
    [Documentation]    Test Case SUBMIT
    set test variable    ${bankcaseid}   ${bankcaseid}
    set test variable    ${warrant_id}    ${warrant_id}
    set test variable    ${warrant_date}   ${warrant_date}
    set test variable    ${warrant_time}   ${warrant_time}
    set test variable    ${warrant_type}   ${warrant_type}


Prepare Data TEST submit-police-case
    [Documentation]    Test Case SUBMIT
    warrantDate 'Local'
    WarrantTime 'Local'
    get Master Case ID Police Case Number Null
    Genarate warrantID random 'H'
    Prepare Json From to submit 

Prepare Data TEST And create file Json
    ${REQ_data_list_to_check}   create list
    ${BANK_CASE_ID}   create list
    set test variable    ${REQ_data_list_to_check}
    set test variable    ${BANK_CASE_ID}
        connect to cfr database
       ${sql}=   catenate     SELECT DISTINCT data.PERSONAL_ID, data.ACCOUNT_NUMBER, REF_CODE, STATUS, FA.FIRST_NAME, FA.LAST_NAME
...    FROM (SELECT PERSONAL_ID, ACCOUNT_NUMBER, BANK_CODE, MAX(RULE_MAXX) AS RULE_MAX
...          FROM (SELECT FA.PERSONAL_ID, FA.ACCOUNT_NUMBER, BANK_CODE, MIN(RULE_ID) AS RULE_MAXX
...                FROM FRAUD_PERSON FP
...                         JOIN FRAUD_ACCOUNT FA ON FP.PERSONAL_ID = FA.PERSONAL_ID
...                         JOIN FRAUD_ACCOUNT_APPLY_FRAUD_RULE FAAFR ON FA.ID = FAAFR.ACCOUNT_ID
...                WHERE FP.FRAUD_LEVEL = '2'
...                  AND FA.IS_ACTIVE = '1'
...                GROUP BY ACCOUNT_NUMBER, FA.PERSONAL_ID, BANK_CODE)
...          WHERE RULE_MAXX IN (1, 2)
...          GROUP BY PERSONAL_ID, ACCOUNT_NUMBER, BANK_CODE) data
...             JOIN FRAUD_REF_CODE_MULE MULE ON data.PERSONAL_ID = MULE.PERSONAL_ID and MULE.STATUS = 1
...             JOIN FRAUD_ACCOUNT FA ON data.PERSONAL_ID = FA.PERSONAL_ID FETCH FIRST 1 ROWS ONLY
        ${query}=   query_all     ${db_connect}     ${sql}     # query
        ${LEN_GENFILE}=  Get Length    ${query}
        FOR    ${index}    IN RANGE    ${LEN_GENFILE}
        ${result}=   set variable    ${query[${index}]}
        ${REF_CODE}=    set variable    ${result}[REF_CODE]
        ${FIRST_NAME}=    set variable    ${result}[FIRST_NAME]
        ${LAST_NAME}=    set variable    ${result}[LAST_NAME]
        ${PERSONAL_ID}=    set variable    ${result}[PERSONAL_ID]
        ${PERSONAL_ID}=    decrypt cfr string '${PERSONAL_ID}'
        ${FIRST_NAME}=    decrypt cfr string '${FIRST_NAME}'
        ${LAST_NAME}=    decrypt cfr string '${LAST_NAME}'
        Set Test Variable    ${PERSONAL_ID}
        Set Test Variable    ${FIRST_NAME}
        Set Test Variable    ${LAST_NAME}
        Set Test Variable    ${REF_CODE}
        set test variable   ${personal_id}    ${PERSONAL_ID}
        set test variable   ${first_name}    ${FIRST_NAME}
        set test variable   ${last_name}    ${LAST_NAME}
        set test variable   ${ref_code}    ${REF_CODE}
        warrantDate 'Local'
        Prepare Json From to Registry
        Replace string to create file
          log   ${index}
        END
Prepare Data TEST And create file Json Person_ID 35 digis
    ${REQ_data_list_to_check}   Create List
    ${BANK_CASE_ID}   Create List
    Set Test Variable    ${REQ_data_list_to_check}
    Set Test Variable    ${BANK_CASE_ID}
    Connect To CFR Database
    ${sql}=   Catenate    SELECT DISTINCT data.PERSONAL_ID, data.ACCOUNT_NUMBER, REF_CODE, STATUS, FA.FIRST_NAME, FA.LAST_NAME 
    ...    FROM (SELECT PERSONAL_ID, ACCOUNT_NUMBER, BANK_CODE, MAX(RULE_MAXX) AS RULE_MAX 
    ...          FROM (SELECT FA.PERSONAL_ID, FA.ACCOUNT_NUMBER, BANK_CODE, MIN(RULE_ID) AS RULE_MAXX 
    ...                FROM FRAUD_PERSON FP 
    ...                JOIN FRAUD_ACCOUNT FA ON FP.PERSONAL_ID = FA.PERSONAL_ID 
    ...                JOIN FRAUD_ACCOUNT_APPLY_FRAUD_RULE FAAFR ON FA.ID = FAAFR.ACCOUNT_ID 
    ...                AND FA.ACCOUNT_TYPE = 'ชาวต่างชาติ'
    ...                GROUP BY ACCOUNT_NUMBER, FA.PERSONAL_ID, BANK_CODE) 
    ...          WHERE RULE_MAXX IN (1) 
    ...          GROUP BY PERSONAL_ID, ACCOUNT_NUMBER, BANK_CODE) data 
    ...    JOIN FRAUD_REF_CODE_MULE MULE ON data.PERSONAL_ID = MULE.PERSONAL_ID 
    ...    JOIN FRAUD_ACCOUNT FA ON data.PERSONAL_ID = FA.PERSONAL_ID FETCH FIRST 1 ROWS ONLY
    ${query}=   Query All     ${db_connect}     ${sql}     # query
    ${LEN_GENFILE}=  Get Length    ${query}
    FOR    ${index}    IN RANGE    ${LEN_GENFILE}
        ${result}=   Set Variable    ${query[${index}]}
        ${REF_CODE}=    Set Variable    ${result}[REF_CODE]
        ${FIRST_NAME}=    Set Variable    ${result}[FIRST_NAME]
        ${LAST_NAME}=    Set Variable    ${result}[LAST_NAME]
        ${PERSONAL_ID}=    Set Variable    ${result}[PERSONAL_ID]
        ${PERSONAL_ID}=    decrypt cfr string '${PERSONAL_ID}'
        ${FIRST_NAME}=    decrypt cfr string '${FIRST_NAME}'
        ${LAST_NAME}=    decrypt cfr string '${LAST_NAME}'
            Set Test Variable    ${FIRST_NAME}
            Set Test Variable    ${LAST_NAME}
            Set Test Variable    ${REF_CODE}
        ${PERSONAL_ID_LENGTH}=   Get Length    ${PERSONAL_ID}
        IF    ${PERSONAL_ID_LENGTH} == 35
            Log    PERSONAL_ID is valid with length: ${PERSONAL_ID_LENGTH}
            Set Test Variable    ${PERSONAL_ID}
        ELSE
            Log    PERSONAL_ID is invalid with length: ${PERSONAL_ID_LENGTH}
        END
            set test variable   ${personal_id}    ${PERSONAL_ID}
            set test variable   ${first_name}    ${FIRST_NAME}
            set test variable   ${last_name}    ${LAST_NAME}
            set test variable   ${ref_code}    ${REF_CODE}
            warrantDate 'Local'
            Prepare Json From to Registry
            Replace string to create file
            log   ${index}
    END
Prepare Data TEST And create file ${number} Json original
    ${REQ_data_list_to_check}   create list
    ${BANK_CASE_ID}   create list
    set test variable    ${REQ_data_list_to_check}
    set test variable    ${BANK_CASE_ID}
        connect to cfr database
       ${sql}=   catenate     SELECT DISTINCT data.PERSONAL_ID, data.ACCOUNT_NUMBER, REF_CODE, STATUS, FA.FIRST_NAME, FA.LAST_NAME 
...    FROM (SELECT PERSONAL_ID, ACCOUNT_NUMBER, BANK_CODE, MAX(RULE_MAXX) AS RULE_MAX 
...          FROM (SELECT FA.PERSONAL_ID, FA.ACCOUNT_NUMBER, BANK_CODE, MIN(RULE_ID) AS RULE_MAXX 
...                FROM FRAUD_PERSON FP 
...                JOIN FRAUD_ACCOUNT FA ON FP.PERSONAL_ID = FA.PERSONAL_ID 
...                JOIN FRAUD_ACCOUNT_APPLY_FRAUD_RULE FAAFR ON FA.ID = FAAFR.ACCOUNT_ID 
...                WHERE FP.FRAUD_LEVEL = '2' AND FA.IS_ACTIVE = '1' 
...                GROUP BY ACCOUNT_NUMBER, FA.PERSONAL_ID, BANK_CODE) 
...          WHERE RULE_MAXX = '3' 
...          GROUP BY PERSONAL_ID, ACCOUNT_NUMBER, BANK_CODE) data 
...    JOIN FRAUD_REF_CODE_MULE MULE ON data.PERSONAL_ID = MULE.PERSONAL_ID 
...    JOIN FRAUD_ACCOUNT FA ON data.PERSONAL_ID = FA.PERSONAL_ID FETCH FIRST ${number} ROWS ONLY
        ${query}=   query_all     ${db_connect}     ${sql}     # query
        ${LEN_GENFILE}=  Get Length    ${query}
        FOR    ${index}    IN RANGE    ${LEN_GENFILE}
        ${result}=   set variable    ${query[${index}]}
        ${REF_CODE}=    set variable    ${result}[REF_CODE]
        ${FIRST_NAME}=    set variable    ${result}[FIRST_NAME]
        ${LAST_NAME}=    set variable    ${result}[LAST_NAME]
        ${PERSONAL_ID}=    set variable    ${result}[PERSONAL_ID]
        ${PERSONAL_ID}=    decrypt cfr string '${PERSONAL_ID}'
        ${FIRST_NAME}=    decrypt cfr string '${FIRST_NAME}'
        ${LAST_NAME}=    decrypt cfr string '${LAST_NAME}'
        Set Test Variable    ${PERSONAL_ID}
        Set Test Variable    ${FIRST_NAME}
        Set Test Variable    ${LAST_NAME}
        Set Test Variable    ${REF_CODE}
        set test variable   ${personal_id}    ${PERSONAL_ID}
        set test variable   ${first_name}    ${FIRST_NAME}
        set test variable   ${last_name}    ${LAST_NAME}
        set test variable   ${ref_code}    ${REF_CODE}
        warrantDate 'Local'
        END


Prepare Data TEST submit-police-case negative ${BankCaseID} and warrantID ${H}
    [Documentation]    Test Case SUBMIT
    get Master Case ID Police Case Number ${BankCaseID}
    Genarate warrantID random '${H}'



Set data Test summit case
    [Documentation]    Test Case SUBMIT
    set test variable  ${bankcaseid}     ${EMPTY} 
     
Set data Test summit case warrant_date
    [Documentation]    Test Case SUBMIT
    set test variable  ${warrant_date}     ${EMPTY} 

Set data Test summit case warrant_time
    [Documentation]    Test Case SUBMIT
    set test variable  ${warrant_time}     ${EMPTY} 

Set data Test summit case warrant_type
    [Documentation]    Test Case SUBMIT
    set test variable  ${warrant_type}     ${EMPTY}

Set data Test summit case warrant_id
    [Documentation]    Test Case SUBMIT
    set test variable  ${warrant_id}     ${EMPTY}

Set data Test summit case warrant_type HH
    [Documentation]    Test Case SUBMIT
    set test variable  ${warrant_type}     HH


Prepare data warrantDate ${Date} and WarrantTime ${Time}
    [Documentation]    Test Case SUBMIT
    warrantDate '${Date}'
    WarrantTime '${Time}'

Prepare Data TEST submit-police-case negative Dup
    [Documentation]    Test Case SUBMIT
    set test variable  ${warrant_date}    ${warrant_date_negative}
    set test variable  ${warrant_time}    ${warrant_time_negative}
    get Master Case ID Police Case Number Null
    set test variable   ${warrant_id}     ${POLICE_CASE_NUMBER_negative} 
    set test variable    ${warrant_type}    ${H} 
    Prepare Json From to submit 


Prepare Data TEST submit-police-case มีหมาย H แล้ว
    [Documentation]    Test Case SUBMIT
    WarrantTime 'Local'
    get Master Case ID Have Police Case Number 
    Genarate warrantID random 'H'
    warrantDate 'Local'
    Prepare Json From to submit 


Prepare Data TEST Freeze Account '${H}' Get data '${Existing}' and Code '${code}'
    [Documentation]    Test Case SUBMIT
    warrantDate 'Local'
    WarrantTime 'Local'
    get Account number '${Existing}' And Bank Code ${code}
    Genarate warrantID random '${H}'
    Prepare Json From to freeze-accounts 

Prepare Data TEST UnFreeze Account '${H}' Get data '${Existing}' and Code '${code}' Unfreeze ${type}
    [Documentation]    Test Case SUBMIT
    warrantDate 'Local'
    WarrantTime 'Local'
    get Account number '${Existing}' And Bank Code ${code} Unfreeze ${type}
    Genarate warrantID random '${H}'
    Prepare Json From to unfreeze-accounts 

Prepare Data TEST UnFreeze Account '${H}' Get data '${Existing}' and Code '${code}' Unfreeze ${type} Negative
    [Documentation]    Test Case SUBMIT
    get Account number '${Existing}' And Bank Code ${code} Unfreeze ${type}
    Genarate warrantID random '${H}'


Prepare Data TEST ${BankCaseID} Request Money Trail     
    [Documentation]    Test Case SUBMIT
        IF  '${BankCaseID}' == 'Existing'     
       connect to cfr database
       ${sql}=   catenate
        ...    select FSC.MASTER_CASE_ID as MASTER_CASE_ID,WARRANT_ID,WARRANT_NUMBER,BANK_CODE,FIRST_NAME,LAST_NAME,PERSONAL_ID
        ...    from FRAUD_SUB_CASE FSC LEFT JOIN FRAUD_ACCOUNT_APPLY_WARRANT FAAW on FSC.MASTER_CASE_ID = FAAW.MASTER_CASE_ID
        ...    JOIN FRAUD_ACCOUNT FA on FSC.ACCOUNT_ID = FA.ID where WARRANT_ID = '3'
        ...    and FAAW.MASTER_CASE_ID is not null order by FSC.LAST_UPDATE_DATE_TIME desc 
        ...    FETCH FIRST 1 ROWS ONLY
        ${query}=   query_all     ${db_connect}     ${sql}     # query
        ${result}=   set variable    ${query[0]}
        ${MASTER_CASE_ID}=    set variable    ${result}[MASTER_CASE_ID]
        set test variable   ${bankcaseid}      ${MASTER_CASE_ID}
        set test variable   ${bankcaseid2}      ${MASTER_CASE_ID}
        Prepare Json From to Request Money Trail  
        ELSE
        set test variable   ${bankcaseid}   ${BankCaseID}
         Prepare Json From to Request Money Trail  
    END

Genarate warrantID Ref Negative random '${H}'
    [Documentation]    Test Case SUBMIT
    # IF  '${H}' == 'H'
    warrantID'random' total '5'
    set test variable  ${warrant_id}     ${H}|${warrantID_2}|${warrantID_3}|${warrantID_number}
    set test variable    ${warrant_type}   ${H}
    set test variable    ${POLICE_CASE_NUMBER}   ${warrant_id}
    set test variable    ${POLICE_CASE_NUMBER_negative}   ${warrant_id}
    set test variable   ${warrant_time} 
    set test variable   ${H}


Genarate warrantID random '${H}'
    [Documentation]    Test Case SUBMIT
    IF  '${H}' == 'H'
    warrantID'random' total '5'
    set test variable  ${warrant_id}     ${H}|${warrantID_2}|${warrantID_3}|${warrantID_number}
    set test variable    ${warrant_type}   ${H}
    set test variable    ${POLICE_CASE_NUMBER}   ${warrant_id}
    set test variable    ${POLICE_CASE_NUMBER_negative}   ${warrant_id}
    set test variable   ${warrant_time} 
    set test variable   ${H}
    ELSE IF  '${H}' == 'R'
    warrantID'random' total '5'
    set test variable  ${warrant_id}     ${H}|${warrantID_2}|${warrantID_3}|${warrantID_number}
    set test variable    ${warrant_type}   ${H}
    set test variable    ${POLICE_CASE_NUMBER}   ${warrant_id}
        set test variable    ${POLICE_CASE_NUMBER_negative}   ${warrant_id}
    set test variable   ${warrant_time}
    set test variable   ${freeze_amount}     null
        set test variable   ${H}
    ELSE IF  '${H}' == 'Q'
    warrantID'random' total '5'
    set test variable  ${warrant_id}     ${H}|${warrantID_2}|${warrantID_3}|${warrantID_number}
    set test variable    ${warrant_type}   ${H}
    set test variable   ${warrant_time}
        set test variable    ${POLICE_CASE_NUMBER}   ${warrant_id}
    set test variable    ${POLICE_CASE_NUMBER_negative}   ${warrant_id}
    ${txn_amount}=   create transacion amount 'random'
    set test variable   ${freeze_amount}     "${txn_amount}"
        set test variable   ${H}
    ELSE IF  '${H}' == 'Z'
    warrantID'random' total '5'
    set test variable  ${warrant_id}     ${H}|${warrantID_2}|${warrantID_3}|${warrantID_number}
    set test variable    ${warrant_type}   ${H}
        set test variable    ${POLICE_CASE_NUMBER}   ${warrant_id}
    set test variable    ${POLICE_CASE_NUMBER_negative}   ${warrant_id}
    set test variable   ${warrant_time}
    ${txn_amount}=   create transacion amount 'random'
    set test variable   ${freeze_amount}     "${txn_amount}"
        set test variable   ${H}
    
    ELSE IF  '${H}' == 'h'
    set test variable   ${H}    H
    warrantID'random' total '5'
    set test variable  ${warrant_id}     ${H}|${warrantID_2}|${warrantID_3}|${warrantID_number}
    set test variable   ${H}   h    
    set test variable    ${warrant_type}   ${H}
    set test variable    ${POLICE_CASE_NUMBER}   ${warrant_id}
    set test variable    ${POLICE_CASE_NUMBER_negative}   ${warrant_id}
    set test variable   ${warrant_time} 

    ELSE IF  '${H}' == 'More'
    set test variable   ${H}    H
    warrantID'random' total '64'
    set test variable  ${warrant_id}     H|${warrantID_2}|${warrantID_3}|${warrantID_number}   
    set test variable    ${warrant_type}   ${H}
    set test variable    ${POLICE_CASE_NUMBER}   ${warrant_id}
    set test variable    ${POLICE_CASE_NUMBER_negative}   ${warrant_id}
    set test variable   ${warrant_time} 
    
    ELSE IF  '${H}' == 'SFTP'
    set test variable   ${H}    H
    warrantID'SFTP' total '5' SFTP
    set test variable  ${warrant_id}     ${warrantID_number_w}|${H}|${warrantID_number}|${warrantID_3}${warrantID_number}   
    set test variable    ${warrant_type}   ${H}
    ELSE
        ${warrant_time} =   set variable   ${timedate}
            set test variable   ${H}
    END


Genarate warrantID random ref ID '${H}' negative
    [Documentation]    Test Case SUBMIT
    IF  '${H}' == 'Q'
    warrantID'random' total and String 5 digis and String2 5 digis And Number 5 digis
    set test variable  ${warrant_id_ref}     ${H}|${warrantID_2}|${warrantID_3}|${warrantID_number}
    set test variable    ${ref_freeze_warrant}   ${warrant_id_ref}
    ELSE IF  '${H}' == 'R'
            warrantID'random' total and String 5 digis and String2 5 digis And Number 5 digis
    set test variable  ${warrant_id_ref}     ${H}|${warrantID_2}|${warrantID_3}|${warrantID_number}
    set test variable    ${ref_freeze_warrant}   ${warrant_id_ref}
    ELSE
        set test variable    ${ref_freeze_warrant}   ${H}
    END

Set test data type value '${H}' and value ${data} 
    [Documentation]    Test Case SUBMIT
    IF  '${H}' == '1'
    set test variable    ${bankcaseid}   ${data}
    ELSE IF  '${H}' == '2'
    set test variable    ${warrant_id}   ${data}
    ELSE IF  '${H}' == '3'
    set test variable    ${warrant_date}   ${data}
    ELSE IF  '${H}' == '4'
    set test variable    ${warrant_time}   ${data}
    ELSE IF  '${H}' == '5'
    set test variable    ${warrant_type}   ${data}
    ELSE IF  '${H}' == '6'
    set test variable    ${ref_freeze_warrant}   ${data}
    ELSE IF  '${H}' == '7'
    set test variable    ${ACCOUNT_NUMBER}   ${data}
    ELSE IF  '${H}' == '8'
    set test variable    ${BANK_CODE}   ${data}
    ELSE
        set test variable    ${ref_freeze_warrant}   ${H}
    END


Prepare Json From to submit 
    [Documentation]    Test Case SUBMIT
    ${json_string}=  Catenate    SEPARATOR=\n
    ...    {
    ...    "bankcaseid": "${bankcaseid}",
    ...    "warrant_id": "${warrant_id}",
    ...    "warrant_date": "${warrant_date}",
    ...    "warrant_time": "${warrant_time}",
    ...    "warrant_type": "${warrant_type}"  
    ...    }
    Set Test Variable  ${json_string}
     ${encoded_data}=   Encode String To Bytes    ${json_string}    encoding=UTF-8
     Set Test Variable     ${encoded_data}
     Set Test Variable     ${bankcaseid}
     Set Test Variable     ${warrant_id}
     Set Test Variable     ${warrant_date}
     Set Test Variable     ${warrant_time}
     Set Test Variable     ${warrant_date_Time}         ${warrant_date} ${warrant_time}:00

Replace string to create file 
    ${json_string}=    JSONLibrary.Convert Json To String    ${json_string}
    ${decoded_data}=    String.Decode Bytes To String    ${encoded_data}    encoding=UTF-8
    ${cleaned_data}=    String.Replace String    ${decoded_data}    \\n    ${EMPTY}
    ${cleaned_data}=    String.Replace String    ${cleaned_data}    \\"    "
    ${cleaned_data}=    String.Replace String    ${cleaned_data}    "{    {
    ${cleaned_data}=    String.Replace String    ${cleaned_data}    }"    }
    set test variable    ${cleaned_data}
    Create File    ${CURDIR}/Data/${directory}.json    ${cleaned_data}
    Append To List         ${REQ_data_list_to_check}       ${cleaned_data}
    set test variable    ${REQ_data_list_to_check}
Replace string to create file and fix file name is ${JSON}
    ${json_string}=    JSONLibrary.Convert Json To String    ${json_string}
    ${decoded_data}=    String.Decode Bytes To String    ${encoded_data}    encoding=UTF-8
    ${cleaned_data}=    String.Replace String    ${decoded_data}    \\n    ${EMPTY}
    ${cleaned_data}=    String.Replace String    ${cleaned_data}    \\"    "
    ${cleaned_data}=    String.Replace String    ${cleaned_data}    "{    {
    ${cleaned_data}=    String.Replace String    ${cleaned_data}    }"    }
    Create File    ${CURDIR}/Data/${directory}.${JSON}    ${cleaned_data}
    Append To List         ${REQ_data_list_to_check}       ${cleaned_data}
    set test variable    ${REQ_data_list_to_check}
Replace string to create file for Generate JSON Loop
    ${json_string}=    JSONLibrary.Convert Json To String    ${json_string}
    ${decoded_data}=    String.Decode Bytes To String    ${encoded_data}    encoding=UTF-8
    ${cleaned_data}=    String.Replace String    ${decoded_data}    \\n    ${EMPTY}
    ${cleaned_data}=    String.Replace String    ${cleaned_data}    \\"    "
    ${cleaned_data}=    String.Replace String    ${cleaned_data}    "{    {
    ${cleaned_data}=    String.Replace String    ${cleaned_data}    }"    }
    ${cleaned_data}=    String.Replace String    ${cleaned_data}    "[    [
    ${cleaned_data}=    String.Replace String    ${cleaned_data}    ]",    ],
    ${cleaned_data}=    String.Replace String    ${cleaned_data}    ]"     ] 
    Create File    ${CURDIR}/Data/${directory}.json    ${cleaned_data}
    # Log    ${cleaned_data}    DEBUG
    # Append To List         ${REQ_data_list_to_check}       ${cleaned_data}
    # set test variable    ${REQ_data_list_to_check}
Prepare Json From to submit not bankcaseid
    [Documentation]    Test Case SUBMIT
    ${json_string}=  Catenate    SEPARATOR=\n
    ...    {
    ...    "warrant_id": "${warrant_id}",
    ...    "warrant_date": "${warrant_date}",
    ...    "warrant_time": "${warrant_time}",
    ...    "warrant_type": "${warrant_type}"  
    ...    }
    Set Test Variable  ${json_string}
     ${encoded_data}=   Encode String To Bytes    ${json_string}    encoding=UTF-8
     Set Test Variable     ${json_string}         ${encoded_data}
    #  Set Test Variable     ${bankcaseid}
     Set Test Variable     ${warrant_id}
     Set Test Variable     ${warrant_date}
     Set Test Variable     ${warrant_time}
     Set Test Variable     ${warrant_date_Time}         ${warrant_date} ${warrant_time}:00


Prepare Json From to submit warrant date
    [Documentation]    Test Case SUBMIT
    ${json_string}=  Catenate    SEPARATOR=\n
    ...    {
    ...    "bankcaseid": "${bankcaseid}",
    ...    "warrant_id": "${warrant_id}",
    # ...    "warrant_date": "${warrant_date}",
    ...    "warrant_time": "${warrant_time}",
    ...    "warrant_type": "${warrant_type}"  
    ...    }
    Set Test Variable  ${json_string}
     ${encoded_data}=   Encode String To Bytes    ${json_string}    encoding=UTF-8
     Set Test Variable     ${json_string}         ${encoded_data}
     Set Test Variable     ${bankcaseid}
     Set Test Variable     ${warrant_id}
    #  Set Test Variable     ${warrant_date}
     Set Test Variable     ${warrant_time}
    #  Set Test Variable     ${warrant_date_Time}         ${warrant_date} ${warrant_time}:00


Prepare Json From to submit warrant time
    [Documentation]    Test Case SUBMIT
    ${json_string}=  Catenate    SEPARATOR=\n
    ...    {
    ...    "bankcaseid": "${bankcaseid}",
    ...    "warrant_id": "${warrant_id}",
    ...    "warrant_date": "${warrant_date}",
    # ...    "warrant_time": "${warrant_time}",
    ...    "warrant_type": "${warrant_type}"  
    ...    }
    Set Test Variable  ${json_string}
     ${encoded_data}=   Encode String To Bytes    ${json_string}    encoding=UTF-8
     Set Test Variable     ${json_string}         ${encoded_data}
     Set Test Variable     ${bankcaseid}
     Set Test Variable     ${warrant_id}
     Set Test Variable     ${warrant_date}
    #  Set Test Variable     ${warrant_time}
    #  Set Test Variable     ${warrant_date_Time}         ${warrant_date} ${warrant_time}:00

Prepare Json From to submit warrant type
    [Documentation]    Test Case SUBMIT
    ${json_string}=  Catenate    SEPARATOR=\n
    ...    {
    ...    "bankcaseid": "${bankcaseid}",
    ...    "warrant_id": "${warrant_id}",
    ...    "warrant_date": "${warrant_date}",
    ...    "warrant_time": "${warrant_time}"
    ...    }
    Set Test Variable  ${json_string}
     ${encoded_data}=   Encode String To Bytes    ${json_string}    encoding=UTF-8
     Set Test Variable     ${json_string}         ${encoded_data}
     Set Test Variable     ${bankcaseid}
     Set Test Variable     ${warrant_id}
     Set Test Variable     ${warrant_date}
     Set Test Variable     ${warrant_time}
     Set Test Variable     ${warrant_date_Time}         ${warrant_date} ${warrant_time}:00



Prepare Json From to submit warrant id
    [Documentation]    Test Case SUBMIT
    ${json_string}=  Catenate    SEPARATOR=\n
    ...    {
    ...    "bankcaseid": "${bankcaseid}",
    ...    "warrant_date": "${warrant_date}",
    ...    "warrant_time": "${warrant_time}",
    ...    "warrant_type": "${warrant_type}"  
    ...    }
    Set Test Variable  ${json_string}
     ${encoded_data}=   Encode String To Bytes    ${json_string}    encoding=UTF-8
     Set Test Variable     ${json_string}         ${encoded_data}
     Set Test Variable     ${bankcaseid}
     Set Test Variable     ${warrant_date}
     Set Test Variable     ${warrant_time}
     Set Test Variable     ${warrant_date_Time}         ${warrant_date} ${warrant_time}:00




Prepare Json From to freeze-accounts
    [Documentation]    Test Case SUBMIT
    ${json_string}=  Catenate    SEPARATOR=\n
    ...    {
        ...    "freeze_warrant": {
            ...    "accounts": [
                ...    {
                    ...    "account_no": "${ACCOUNT_NUMBER}",
                    ...    "bank_code": "${BANK_CODE}",
                    ...    "warrant_date": "${warrant_date}",
                    ...    "warrant_time": "${warrant_time}",
                    ...    "warrant_id": "${warrant_id}",
                    ...    "warrant_type": "${warrant_type}",
                    ...    "freeze_amount": ${freeze_amount}
                ...    }
            ...    ]
        ...    }
    ...    }
    Set Test Variable  ${json_string}
     ${encoded_data}=   Encode String To Bytes    ${json_string}    encoding=UTF-8
     Set Test Variable     ${json_string}         ${encoded_data}

Prepare Json From to freeze-accounts Type R
    [Documentation]    Test Case SUBMIT
    ${json_string}=  Catenate    SEPARATOR=\n
    ...    {
        ...    "freeze_warrant": {
            ...    "accounts": [
                ...    {
                    ...    "account_no": "${ACCOUNT_NUMBER}",
                    ...    "bank_code": "${BANK_CODE}",
                    ...    "warrant_date": "${warrant_date}",
                    ...    "warrant_time": "${warrant_time}",
                    ...    "warrant_id": "${warrant_id}",
                    ...    "warrant_type": "${warrant_type}"
                ...    }
            ...    ]
        ...    }
    ...    }
    Set Test Variable  ${json_string}
     ${encoded_data}=   Encode String To Bytes    ${json_string}    encoding=UTF-8
     Set Test Variable     ${json_string}         ${encoded_data}

Prepare Json From to unfreeze-accounts add bank case
    [Documentation]    Test Case SUBMIT
    ${json_string}=  Catenate    SEPARATOR=\n
    ...    {
        ...    "unfreeze_warrant": {
            ...    "accounts": [
                ...    {
                    ...    "account_no": "${ACCOUNT_NUMBER}",
                    ...    "bank_code": "${BANK_CODE}",
                    ...    "warrant_date": "${warrant_date}",
                    ...    "warrant_time": "${warrant_time}",
                    ...    "warrant_id": "${warrant_id}",
                    ...    "warrant_type": "${warrant_type}",
                    ...    "ref_freeze_warrant": "${ref_freeze_warrant}",
                    ...    "bankcaseid": "${bankcaseid}"
                ...    }
            ...    ]
        ...    }
    ...    }
    Set Test Variable  ${json_string}
    ${encoded_data}=    Evaluate    """${json_string}""".encode("utf-8")
     Set Test Variable     ${json_string}         ${encoded_data}
     set test variable   ${ref_freeze_warrant}

Prepare Json From to unfreeze-accounts
    [Documentation]    Test Case SUBMIT
    ${json_string}=  Catenate    SEPARATOR=\n
    ...    {
        ...    "unfreeze_warrant": {
            ...    "accounts": [
                ...    {
                    ...    "account_no": "${ACCOUNT_NUMBER}",
                    ...    "bank_code": "${BANK_CODE}",
                    ...    "warrant_date": "${warrant_date}",
                    ...    "warrant_time": "${warrant_time}",
                    ...    "warrant_id": "${warrant_id}",
                    ...    "warrant_type": "${warrant_type}",
                    ...    "ref_freeze_warrant": "${ref_freeze_warrant}"
                ...    }
            ...    ]
        ...    }
    ...    }
    Set Test Variable  ${json_string}
    ${encoded_data}=    Evaluate    """${json_string}""".encode("utf-8")
     Set Test Variable     ${json_string}         ${encoded_data}
     set test variable   ${ref_freeze_warrant}

Prepare Json From to unfreeze-accounts Custom
    [Documentation]    Test Case SUBMIT
    ${json_string}=  Catenate    SEPARATOR=\n
    ...    {
        ...    "unfreeze_warrant": {
            ...    "accounts": [
                ...    {
                    ...    "${account_no_type}": "${ACCOUNT_NUMBER}",
                    ...    "${bank_code_type}": "${BANK_CODE}",
                    ...    "${warrant_date_type}": "${warrant_date}",
                    ...    "${warrant_time_type}": "${warrant_time}",
                    ...    "${warrant_id_type}": "${warrant_id}",
                    ...    "${warrant_type_type}": "${warrant_type}",
                    ...    "${ref_freeze_warrant_type}": "${ref_freeze_warrant}"
                ...    }
            ...    ]
        ...    }
    ...    }
    Set Test Variable  ${json_string}
    ${encoded_data}=    Evaluate    """${json_string}""".encode("utf-8")
     Set Test Variable     ${json_string}         ${encoded_data}
     set test variable   ${ref_freeze_warrant}

Prepare Json From to unfreeze-accounts 51 account
    [Documentation]    Test Case SUBMIT
    ${file_content}=    Get File    ${FILE_PATH}
    ${file_list}=    Split String    ${file_content}    \n
    ${formatted_list}=    Evaluate    [line.rstrip(",") for line in ${file_list}]    locals()
    ${json_content}=    Join String    ${formatted_list}    \n
    # Log    ${json_content}
    Set Test Variable  ${json_string}    ${file_list}
    ${encoded_data}=    Evaluate    """${json_string}""".encode("utf-8")
     Set Test Variable     ${json_string}         ${encoded_data}
     set test variable   ${ref_freeze_warrant}



Prepare Json From to unfreeze-accounts missing ${key}
    [Documentation]    Test Case SUBMIT
    IF  '${key}' == 'Account'
        Prepare Json From to unfreeze-accounts null account
    ELSE IF  '${key}' == 'Bankcode'
        Prepare Json From to unfreeze-accounts BANK_CODE
    ELSE IF  '${key}' == 'Warrant_date'
        Prepare Json From to unfreeze-accounts warrant_date
    ELSE IF  '${key}' == 'Warrant_time'
        Prepare Json From to unfreeze-accounts warrant_time
    ELSE IF  '${key}' == 'Warrant_id'
        Prepare Json From to unfreeze-accounts warrant_id
    ELSE IF  '${key}' == 'Warrant_type'
        Prepare Json From to unfreeze-accounts warrant_type
    ELSE IF  '${key}' == 'Ref_freeze_warrant'
        Prepare Json From to unfreeze-accounts ref_freeze_warrant
    ELSE IF  '${key}' == 'Custom'
         set test variable   ${account_no_type}      account_no
         set test variable  ${bank_code_type}      bank_code
         set test variable  ${warrant_date_type}    warrant_date
         set test variable  ${warrant_time_type}    warrant_time
         set test variable  ${warrant_id_type}     warrant_id
         set test variable  ${warrant_type_type}    warrant_type
         set test variable  ${ref_freeze_warrant_type}    ref_freeze_warrant
        # Prepare Json From to unfreeze-accounts Custom
    ELSE
        Prepare Json From to unfreeze-accounts
    END


Prepare Json From to unfreeze-accounts null account
    [Documentation]    Test Case SUBMIT
    ${json_string}=  Catenate    SEPARATOR=\n
    ...    {
        ...    "unfreeze_warrant": {
            ...    "accounts": [
                ...    {
                    ...    "bank_code": "${BANK_CODE}",
                    ...    "warrant_date": "${warrant_date}",
                    ...    "warrant_time": "${warrant_time}",
                    ...    "warrant_id": "${warrant_id}",
                    ...    "warrant_type": "${warrant_type}",
                    ...    "ref_freeze_warrant": "${ref_freeze_warrant}"
                ...    }
            ...    ]
        ...    }
    ...    }
    Set Test Variable  ${json_string}
    ${encoded_data}=    Evaluate    """${json_string}""".encode("utf-8")
     Set Test Variable     ${json_string}         ${encoded_data}
     set test variable   ${ref_freeze_warrant}

Prepare Json From to unfreeze-accounts BANK_CODE
    [Documentation]    Test Case SUBMIT
    ${json_string}=  Catenate    SEPARATOR=\n
    ...    {
        ...    "unfreeze_warrant": {
            ...    "accounts": [
                ...    {
                    ...    "account_no": "${ACCOUNT_NUMBER}",
                    ...    "warrant_date": "${warrant_date}",
                    ...    "warrant_time": "${warrant_time}",
                    ...    "warrant_id": "${warrant_id}",
                    ...    "warrant_type": "${warrant_type}",
                    ...    "ref_freeze_warrant": "${ref_freeze_warrant}"
                ...    }
            ...    ]
        ...    }
    ...    }
    Set Test Variable  ${json_string}
    ${encoded_data}=    Evaluate    """${json_string}""".encode("utf-8")
     Set Test Variable     ${json_string}         ${encoded_data}
     set test variable   ${ref_freeze_warrant}

Prepare Json From to unfreeze-accounts warrant_date
    [Documentation]    Test Case SUBMIT
    ${json_string}=  Catenate    SEPARATOR=\n
    ...    {
        ...    "unfreeze_warrant": {
            ...    "accounts": [
                ...    {
                    ...    "account_no": "${ACCOUNT_NUMBER}",
                    ...    "bank_code": "${BANK_CODE}",
                    ...    "warrant_time": "${warrant_time}",
                    ...    "warrant_id": "${warrant_id}",
                    ...    "warrant_type": "${warrant_type}",
                    ...    "ref_freeze_warrant": "${ref_freeze_warrant}"
                ...    }
            ...    ]
        ...    }
    ...    }
    Set Test Variable  ${json_string}
    ${encoded_data}=    Evaluate    """${json_string}""".encode("utf-8")
     Set Test Variable     ${json_string}         ${encoded_data}
     set test variable   ${ref_freeze_warrant}

Prepare Json From to unfreeze-accounts warrant_time
    [Documentation]    Test Case SUBMIT
    ${json_string}=  Catenate    SEPARATOR=\n
    ...    {
        ...    "unfreeze_warrant": {
            ...    "accounts": [
                ...    {
                    ...    "account_no": "${ACCOUNT_NUMBER}",
                    ...    "bank_code": "${BANK_CODE}",
                    ...    "warrant_date": "${warrant_date}",
                    ...    "warrant_id": "${warrant_id}",
                    ...    "warrant_type": "${warrant_type}",
                    ...    "ref_freeze_warrant": "${ref_freeze_warrant}"
                ...    }
            ...    ]
        ...    }
    ...    }
    Set Test Variable  ${json_string}
    ${encoded_data}=    Evaluate    """${json_string}""".encode("utf-8")
     Set Test Variable     ${json_string}         ${encoded_data}
     set test variable   ${ref_freeze_warrant}

Prepare Json From to unfreeze-accounts warrant_id
    [Documentation]    Test Case SUBMIT
    ${json_string}=  Catenate    SEPARATOR=\n
    ...    {
        ...    "unfreeze_warrant": {
            ...    "accounts": [
                ...    {
                    ...    "account_no": "${ACCOUNT_NUMBER}",
                    ...    "bank_code": "${BANK_CODE}",
                    ...    "warrant_date": "${warrant_date}",
                    ...    "warrant_time": "${warrant_time}",
                    ...    "warrant_type": "${warrant_type}",
                    ...    "ref_freeze_warrant": "${ref_freeze_warrant}"
                ...    }
            ...    ]
        ...    }
    ...    }
    Set Test Variable  ${json_string}
    ${encoded_data}=    Evaluate    """${json_string}""".encode("utf-8")
     Set Test Variable     ${json_string}         ${encoded_data}
     set test variable   ${ref_freeze_warrant}

Prepare Json From to unfreeze-accounts warrant_type
    [Documentation]    Test Case SUBMIT
    ${json_string}=  Catenate    SEPARATOR=\n
    ...    {
        ...    "unfreeze_warrant": {
            ...    "accounts": [
                ...    {
                    ...    "account_no": "${ACCOUNT_NUMBER}",
                    ...    "bank_code": "${BANK_CODE}",
                    ...    "warrant_date": "${warrant_date}",
                    ...    "warrant_time": "${warrant_time}",
                    ...    "warrant_id": "${warrant_id}",
                    ...    "ref_freeze_warrant": "${ref_freeze_warrant}"
                ...    }
            ...    ]
        ...    }
    ...    }
    Set Test Variable  ${json_string}
    ${encoded_data}=    Evaluate    """${json_string}""".encode("utf-8")
     Set Test Variable     ${json_string}         ${encoded_data}
     set test variable   ${ref_freeze_warrant}

Prepare Json From to unfreeze-accounts ref_freeze_warrant
    [Documentation]    Test Case SUBMIT
    ${json_string}=  Catenate    SEPARATOR=\n
    ...    {
        ...    "unfreeze_warrant": {
            ...    "accounts": [
                ...    {
                    ...    "account_no": "${ACCOUNT_NUMBER}",
                    ...    "bank_code": "${BANK_CODE}",
                    ...    "warrant_date": "${warrant_date}",
                    ...    "warrant_time": "${warrant_time}",
                    ...    "warrant_id": "${warrant_id}",
                    ...    "warrant_type": "${warrant_type}"
                ...    }
            ...    ]
        ...    }
    ...    }
    Set Test Variable  ${json_string}
    ${encoded_data}=    Evaluate    """${json_string}""".encode("utf-8")
     Set Test Variable     ${json_string}         ${encoded_data}
     set test variable   ${ref_freeze_warrant}


Prepare Json From to Request Money Trail 
    [Documentation]    Test Case SUBMIT
    ${json_string}=  Catenate    SEPARATOR=\n
    ...    {
    ...    "bankcaseid": "${bankcaseid}"
    ...    }
    Set Test Variable  ${json_string}
     ${encoded_data}=   Encode String To Bytes    ${json_string}    encoding=UTF-8
     Set Test Variable     ${json_string}         ${encoded_data}


Gen JWT Bearer 
    [Documentation]    Test Case SUBMIT
    ${encode_json_header_base64}=    encode_jwt_header  RS512  JWT
    Set Test Variable   ${encode_json_header_base64}  
    ${EpochTime}=    getnerateEpochTime
    Set Test Variable  ${EpochTime}
    ${encode_json_payload_base64}=    encode_jwt_payload  ${EpochTime}
    Set Test Variable   ${encode_json_payload_base64} 





Call API JWT
    [Documentation]    Test Case SUBMIT
    ${API_URL}=   Set Variable     ${host_jwt}
    Create Session    Aoc_jwt    ${API_URL}
    ${headers} =   Create Dictionary    Content-Type=${Content-Type}    apikey=888  apisecret=${apisecret}   privatekey=${privatekey}  issuer=1441  audience=000
    ${response}=    GET On Session   Aoc_jwt  ${jwt}    headers=${headers}
    ${json_data}=    To JSON    ${response.text}
    Log    ${json_data}
    ${json_Bearer}=     Collections.Get From Dictionary    ${json_data}   signature
    Set Test Variable    ${json_Bearer}
    Append to File    ${CURDIR}/Bearer.txt    ${json_Bearer}

Call API Submit new AOC case to CFR
    [Documentation]    Test Case SUBMIT
    Get Bearer from file
    set test variable     ${token}
    ${API_URL}=   Set Variable     ${Host_Aoc}
    @{client certs}=  create list    ${CURDIR}\\Certificate\\api-ext-uat.nitmx.co.th.cer        ${CURDIR}\\Certificate\\nonprod-api-open-infra-cert-key.pem
    Create Client Cert Session  Aoc_Submit    ${API_URL}  client_certs=${client certs}  verify=${False} 
    ${headers} =   Create Dictionary    Content-Type=${Content-Type}   X-API-Version=${X-API-Version}    X-CRT-Version=${X-CRT-Version}   Authorization=${token}   
    ${response}=    POST On Session   Aoc_Submit  ${path.submit}  data=${json_string}    headers=${headers}   expected_status=any
    set test variable     ${response}

Call API Freeze Account AOC case to CFR
    [Documentation]    Test Case SUBMIT
    Get Bearer from file
    set test variable     ${token}
    ${API_URL}=   Set Variable     ${Host_Aoc}
    # Create Session    Aoc_Submit    ${API_URL}
    @{client certs}=  create list    ${CURDIR}\\Certificate\\api-ext-uat.nitmx.co.th.cer        ${CURDIR}\\Certificate\\nonprod-api-open-infra-cert-key.pem
    Create Client Cert Session  Aoc_Freeze    ${API_URL}  client_certs=${client certs}  verify=${False} 
    ${headers} =   Create Dictionary    Content-Type=${Content-Type}   X-API-Version=${X-API-Version}    X-CRT-Version=${X-CRT-Version}   Authorization=${token}     
    ${response}=    POST On Session   Aoc_Freeze   ${path.freeze}  data=${json_string}    headers=${headers}   expected_status=any
    set test variable     ${response}

Call API UnFreeze Account AOC case to CFR
    [Documentation]    Test Case SUBMIT
    Get Bearer from file
    set test variable     ${token}
    ${API_URL}=   Set Variable     ${Host_Aoc}
    @{client certs}=  create list    ${CURDIR}\\Certificate\\api-ext-uat.nitmx.co.th.cer        ${CURDIR}\\Certificate\\nonprod-api-open-infra-cert-key.pem
    Create Client Cert Session  Aoc_unfreeze    ${API_URL}  client_certs=${client certs}  verify=${False} 
    ${headers} =   Create Dictionary    Content-Type=${Content-Type}   X-API-Version=${X-API-Version}    X-CRT-Version=${X-CRT-Version}   Authorization=${token}     
    ${response}=    POST On Session   Aoc_unfreeze   ${path.unfreeze}  data=${json_string}    headers=${headers}   expected_status=any
    set test variable     ${response}

Call API UnFreeze Account AOC case to CFR 6403
    [Documentation]    Test Case SUBMIT
    Get Bearer from file negative
    set test variable     ${token}
    ${API_URL}=   Set Variable     ${Host_Aoc}
    Create Session    Aoc_Submit    ${API_URL}
    @{client certs}=  create list    ${CURDIR}\\Certificate\\api-ext-uat.nitmx.co.th.cer        ${CURDIR}\\Certificate\\nonprod-api-open-infra-cert-key.pem
    Create Client Cert Session  Aoc_unfreeze    ${API_URL}  client_certs=${client certs}  verify=${False} 
    ${headers} =   Create Dictionary    Content-Type=${Content-Type}   X-API-Version=${X-API-Version}    X-CRT-Version=${X-CRT-Version}   Authorization=${token}     
    ${response}=    POST On Session   Aoc_unfreeze   ${path.unfreeze}  data=${json_string}    headers=${headers}   expected_status=any
    set test variable     ${response} 


Call API Request Money Trail case to CFR
    [Documentation]    Test Case SUBMIT
    Get Bearer from file
    set test variable     ${token}
    ${API_URL}=   Set Variable     ${Host_Aoc}
    # Create Session    Aoc_Submit    ${API_URL}
    @{client certs}=  create list    ${CURDIR}\\Certificate\\api-ext-uat.nitmx.co.th.cer        ${CURDIR}\\Certificate\\nonprod-api-open-infra-cert-key.pem
    Create Client Cert Session  Aoc_money-trail    ${API_URL}  client_certs=${client certs}  verify=${False} 
    ${headers} =   Create Dictionary    Content-Type=${Content-Type}   X-API-Version=${X-API-Version}    X-CRT-Version=${X-CRT-Version}   Authorization=${token}     
    ${response}=    POST On Session   Aoc_money-trail   ${path.money}  data=${json_string}    headers=${headers}   expected_status=any
    set test variable     ${response}






Response File Success Freeze Account '${Res}'
    [Documentation]    Test Case SUBMIT
    ${status_object}=    set variable      ${response.json()['status']}
    ${Timestamp}=    set variable      ${response.json()['timestamp']}
    Should Be Equal As Strings    ${status_object["code"]}   ${Res_Aoc.success.${Res}.code}   
    Should Be Equal As Strings     ${status_object["message"]}    ${Res_Aoc.success.${Res}.msg}
    Should Not Be Empty     ${Timestamp}


Response File ${type} Submit Police Case '${Res}'
    [Documentation]    Test Case SUBMIT
    ${status_object}=    set variable      ${response.json()['status']}
    ${Timestamp}=    set variable      ${response.json()['timestamp']}
    Should Be Equal As Strings    ${status_object["code"]}   ${Res_Aoc.${type}.${Res}.code}   
    Should Be Equal As Strings     ${status_object["message"]}    ${Res_Aoc.${type}.${Res}.msg}
    Should Not Be Empty     ${Timestamp}

Response File ${code} UnFreeze Account '${Res}'
    [Documentation]    Test Case SUBMIT
    ${status_object}=    set variable      ${response.json()['status']}
    ${Timestamp}=    set variable      ${response.json()['timestamp']}
    Should Be Equal As Strings    ${status_object["code"]}   ${Res_Aoc.${code}.${Res}.code}   
    Should Be Equal As Strings     ${status_object["message"]}    ${Res_Aoc.${code}.${Res}.msg}
    Should Not Be Empty     ${Timestamp}

Response File Success Request Money Trail '${Res}'
    [Documentation]    Test Case SUBMIT
    ${status_object}=    set variable      ${response.json()['status']}
    ${Timestamp}=    set variable      ${response.json()['timestamp']}
    ${ticketid}=    set variable      ${response.json()['ticketid']}
    Should Be Equal As Strings    ${status_object["code"]}   ${Res_Aoc.success.${Res}.code}   
    Should Be Equal As Strings     ${status_object["message"]}    ${Res_Aoc.success.${Res}.msg}
    Should Not Be Empty     ${Timestamp}
    Should Not Be Empty     ${ticketid}
    Set Test Variable       ${ticketid}


Get Bearer from file
    [Documentation]    Test Case SUBMIT
    generate jwt token for aoc
    set test variable     ${token}

Get Bearer from file negative
    [Documentation]    Test Case SUBMIT
    generate jwt token for aoc negative
    set test variable     ${token}
# negative

generate jwt token for aoc
    [Documentation]    Test Case SUBMIT
    genarate payload for aoc
    genarate signature

genarate signature
    [Documentation]    Test Case SUBMIT
    set test variable   ${AUD}  000
    Set Test Variable   ${PRIVATE_KEY_PATH}     nonprd_File.kub
    ${token}=    Generate JWT    ${PRIVATE_KEY_PATH}  ${agl}  ${apikey}   ${apisecret}    ${AUD}    ${sending_bank_code}
    set test variable    ${encode_payload}    ${token}
    set test variable   ${jwt}    Bearer ${encode_payload}
    set test variable   ${token}    ${jwt}
    

validate signature
    [Documentation]    Test Case SUBMIT
    ${validate_sign}=  validate   ${encode_payload}
    set test variable  ${jwt}    ${encode_payload}


generate jwt token for aoc negative
    [Documentation]    Test Case SUBMIT
    genarate payload for aoc negative
    genarate signature negative

genarate signature negative
    [Documentation]    Test Case SUBMIT
    set test variable   ${AUD}  000
    Set Test Variable   ${PRIVATE_KEY_PATH}     nonprd_File.kub
    Set Test Variable   ${sending_bank_code}     002
    ${token}=    Generate JWT    ${PRIVATE_KEY_PATH}  ${agl}  ${apikey}   ${apisecret}    ${AUD}    ${sending_bank_code}
    set test variable    ${encode_payload}    ${token}
    set test variable   ${jwt}    Bearer ${encode_payload}
    set test variable   ${token}    ${jwt}
    

validate signature negative
    [Documentation]    Test Case SUBMIT
    ${validate_sign}=  validate   ${encode_payload}
    set test variable  ${jwt}    ${encode_payload}

genarate payload for aoc negative
    [Documentation]    Test Case SUBMIT
   Prepare Playload for aoc 60 negative
   ${payload}=   Catenate    {
    ...    "apisecret":"yR6kkLGuBioWGkzJuFDCfN7p6BTnFqJbzjjBMpUKcqy6dksGUOWEXO6kBYQaa5j0",
    ...    "aud":"000",
    ...    "apikey":"Jc2g4tZGFmT2ackyq6cDZKptyD9VWsLmrG4fbVgYqnbGXpFP",
    ...    "iss":"1441",
    ...    "exp":{{epochTime}},
    ...    "iat":1718617851,
    ...    "jti":"testcert"
    ...    }
   set test variable   ${payload}
#    set test variable   ${sending_bank_code}
   set test variable   ${eEpochTime}
   set test variable   ${apikey}  Jc2g4tZGFmT2ackyq6cDZKptyD9VWsLmrG4fbVgYqnbGXpFP
   set test variable   ${apisecret}  yR6kkLGuBioWGkzJuFDCfN7p6BTnFqJbzjjBMpUKcqy6dksGUOWEXO6kBYQaa5j0
   set test variable   ${iat}  1718617851
   set test variable   ${jti}  testcert
   set test variable   ${agl}  RS512


genarate payload for aoc
    [Documentation]    Test Case SUBMIT
   Prepare Playload for aoc 60 
   ${payload}=   Catenate    {
   ...    "iss": "${sending_bank_code}",
   ...    "exp": "${eEpochTime}",
   ...    "aud": "000",
   ...    "apikey": "${apikey}",
   ...    "apisecret": "${apisecret}",
   ...    "iat": "${iat}",
   ...    "jti": "${jti}"
   ...    }
   set test variable   ${payload}
   set test variable   ${sending_bank_code}
   set test variable   ${eEpochTime}
   set test variable   ${apikey}
   set test variable   ${apisecret}
   set test variable   ${iat}
   set test variable   ${jti}
   set test variable   ${agl}  RS512



Prepare Playload for aoc ${time}
    [Documentation]    Test Case SUBMIT
        set test variable    ${apikey}          888
        set test variable    ${apisecret}       888_secret
        set test variable    ${sending_bank_code}       1441
        set test variable    ${iat}       1718617851
        set test variable    ${jti}       testcert
    ${eEpochTime}=     getnerateEpochTime    ${time}
    set test variable    ${eEpochTime} 

Prepare Playload for aoc ${time} negative
    [Documentation]    Test Case SUBMIT
    ${eEpochTime}=     getnerateEpochTime    ${time}
    set test variable    ${eEpochTime} 



encode base64 JWT Token get header
    [Documentation]    Test Case SUBMIT
    set test variable       ${header}    {"alg":"RS512","typ":"JWT"}
    ${encode_header} =    encode_base64_mime    ${header}
    log  ${encode_header}
    set test variable    ${encodedHeaders}       ${encode_header}

encode base64 JWT Token get payload
    [Documentation]    Test Case SUBMIT
    set test variable       ${payload}    {"role":"admin","iss":"814","aud":"800","apikey":"cQtAntvVS9","apisecret":"uXNkvhWXXOyZYT1piLFC","instr_id":"","dbtr_acc":""}
    ${encode_payload} =    encode_base64_mime    ${payload}
    log  ${encode_payload}
    set test variable    ${encodedPlayload}       ${encode_payload}

encode base64 JWT Token get signature
    [Documentation]    Test Case SUBMIT
    set test variable    ${Privatekey}       ${Privatekey}
    ${encode_signature} =    encode_HMAC_SHA256     ${encodedHeaders}.${encodedPlayload}        ${Privatekey}
    set test variable    ${JWT}       ${encodedHeaders}.${encodedPlayload}.${encode_signature}

Get FileName GrayList From CFR To AOC
    ${API_URL}=   Set Variable     ${Host_GET}
    # @{client certs}=  create list    ${CURDIR}\\Certificate\\api-ext-uat.nitmx.co.th.cer        ${CURDIR}\\Certificate\\nonprod-api-open-infra-cert-key.pem
    Create Session  Get_File    ${API_URL}
    # ${headers} =   Create Dictionary    Content-Type=${Content-Type}
    ${response}=    POST On Session   Get_File  ${path.GetFileName}    expected_status=any
    set test variable     ${response}
    Get File Name to AOC

Get FileName GrayList From CFR To BANK
    ${API_URL}=   Set Variable     ${Host_GET}
    # @{client certs}=  create list    ${CURDIR}\\Certificate\\api-ext-uat.nitmx.co.th.cer        ${CURDIR}\\Certificate\\nonprod-api-open-infra-cert-key.pem
    Create Session  Get_File    ${API_URL}
    # ${headers} =   Create Dictionary    Content-Type=${Content-Type}
    ${response}=    POST On Session   Get_File  ${path.GetFileName}    expected_status=any
    set test variable     ${response}
    Get File Name to BANK

Get File Name to AOC
    ${status_object}=    set variable      ${response.json()['fraudAccountReportFileList']}
    @{data}=   Set Variable   ${status_object}
    ${first_data}=    Set Variable    ${data[0]}
    ${file_name}=  Get From Dictionary  ${first_data}  fileName
    # Log    ${file_name}
    ${CFR}=  Get Substring    ${file_name}    0  6
    ${GreyList}=  Get Substring    ${file_name}    7  13
    ${YYYY}=  Get Substring    ${file_name}    13  17
    ${MM}=  Get Substring    ${file_name}    18  20
    ${DD}=  Get Substring    ${file_name}    21  23
    ${Trail}=  Get Substring    ${file_name}    23  35   
    set test variable  ${FILENAME_GPG}  ${CFR}e${GreyList}${YYYY}${MM}${DD}${Trail}.gpg
    set test variable  ${FILENAME_CSV}  ${CFR}e${GreyList}${YYYY}${MM}${DD}${Trail}.csv

Get File Name to BANK
    ${status_object}=    set variable      ${response.json()['fraudAccountReportFileList']}
    ${DATA_FILENAME_BANK}=  Get Length   ${status_object}
     FOR    ${index}    IN RANGE    ${DATA_FILENAME_BANK}  
    @{data}=   Set Variable   ${status_object}
    ${first_data}=    Set Variable    ${data[${index}]}
    ${file_name}=  Get From Dictionary  ${first_data}  fileName
    # Log    ${file_name}
    ${CFR}=  Get Substring    ${file_name}    0  6
    ${GreyList}=  Get Substring    ${file_name}    7  13
    ${YYYY}=  Get Substring    ${file_name}    13  17
    ${MM}=  Get Substring    ${file_name}    18  20
    ${DD}=  Get Substring    ${file_name}    21  23
    ${Trail}=  Get Substring    ${file_name}    23  35   
    set test variable  ${FILENAME_GPG}  ${CFR}e${GreyList}${YYYY}${MM}${DD}${Trail}.gpg
    set test variable  ${FILENAME_CSV}  ${CFR}e${GreyList}${YYYY}${MM}${DD}${Trail}.csv
    Get File GPG BANK
     log   ${index}
    END

Call API Sending file Warrant H from aoc to ITMX
    ${API_URL}=   Set Variable     ${Host_GET}
    Create Session  triggerWH    ${API_URL}
    # ${headers} =   Create Dictionary    Content-Type=${Content-Type}
    ${response}=    POST On Session   triggerWH  ${path.triggerWH}    expected_status=any
    set test variable     ${response}
    # Get File Name to BANK


Call API Sending file wary juristic from aoc to ITMX
    ${API_URL}=   Set Variable     ${Host_GET}
    Create Session  waryJuristic    ${API_URL}
    # ${headers} =   Create Dictionary    Content-Type=${Content-Type}
    ${response}=    POST On Session   waryJuristic  ${path.waryJuristic}    expected_status=any
    set test variable     ${response}
    # Get File Name to BANK


# login to root user
#    Open Connection     ${hostsftp.ip}
#    Login	${itmxadm.user}   ${itmxadm.password}
#    Login	${root.user}   ${root.password}