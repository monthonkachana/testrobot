*** Settings ***
Resource  ../resources/imports.robot

*** Keywords ***

Prepare Data TEST And create file ${number} Json Valid Format declare_uuid is ${uuid}
    ${REQ_data_list_to_check}   create list
    ${BANK_CASE_ID}   create list
    set test variable    ${REQ_data_list_to_check}
    set test variable    ${BANK_CASE_ID}
        connect to cfr database
       ${sql}=   catenate      SELECT DISTINCT MULE.REF_CODE, MAP.PERSONAL_ID, FA.FIRST_NAME, FA.LAST_NAME, FA.BANK_CODE, FA.ACCOUNT_NUMBER
...    FROM FRAUD_REF_CODE_MAPPING MAP
...             INNER JOIN FRAUD_REF_CODE_MULE MULE ON MAP.REF_CODE_ID = MULE.REF_CODE_ID
...             INNER JOIN FRAUD_ACCOUNT_REPORT FAR ON MAP.PERSONAL_ID = FAR.PERSONAL_ID
...             INNER JOIN FRAUD_ACCOUNT FA ON FAR.ACCOUNT_ID = FA.ID
...    WHERE MAP.FRAUD_LEVEL = 2 fetch first ${number} rows only
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
        Set Data From Json for Validate
        set test variable   ${declare_uuid}   ${uuid}
        Prepare Json From to Registry for validate 
        Replace string to create file
          log   ${index}
        END
Prepare Data TEST And create file ${number} Json Valid Format declare_date is ${date}
    ${REQ_data_list_to_check}   create list
    ${BANK_CASE_ID}   create list
    set test variable    ${REQ_data_list_to_check}
    set test variable    ${BANK_CASE_ID}
        connect to cfr database
       ${sql}=   catenate      SELECT DISTINCT MULE.REF_CODE, MAP.PERSONAL_ID, FA.FIRST_NAME, FA.LAST_NAME, FA.BANK_CODE, FA.ACCOUNT_NUMBER
...    FROM FRAUD_REF_CODE_MAPPING MAP
...             INNER JOIN FRAUD_REF_CODE_MULE MULE ON MAP.REF_CODE_ID = MULE.REF_CODE_ID
...             INNER JOIN FRAUD_ACCOUNT_REPORT FAR ON MAP.PERSONAL_ID = FAR.PERSONAL_ID
...             INNER JOIN FRAUD_ACCOUNT FA ON FAR.ACCOUNT_ID = FA.ID
...    WHERE MAP.FRAUD_LEVEL = 2 fetch first ${number} rows only
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
        Set Data From Json for Validate
        set test variable   ${warrant_date}   ${date}
        Prepare Json From to Registry for validate 
        Replace string to create file
          log   ${index}
        END

Prepare Data TEST And create file ${number} Json Valid Format declare_type_code is ${typecode}
    ${REQ_data_list_to_check}   create list
    ${BANK_CASE_ID}   create list
    set test variable    ${REQ_data_list_to_check}
    set test variable    ${BANK_CASE_ID}
        connect to cfr database
       ${sql}=   catenate      SELECT DISTINCT MULE.REF_CODE, MAP.PERSONAL_ID, FA.FIRST_NAME, FA.LAST_NAME, FA.BANK_CODE, FA.ACCOUNT_NUMBER
...    FROM FRAUD_REF_CODE_MAPPING MAP
...             INNER JOIN FRAUD_REF_CODE_MULE MULE ON MAP.REF_CODE_ID = MULE.REF_CODE_ID
...             INNER JOIN FRAUD_ACCOUNT_REPORT FAR ON MAP.PERSONAL_ID = FAR.PERSONAL_ID
...             INNER JOIN FRAUD_ACCOUNT FA ON FAR.ACCOUNT_ID = FA.ID
...    WHERE MAP.FRAUD_LEVEL = 2 fetch first ${number} rows only
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
        Set Data From Json for Validate
        set test variable   ${declare_uuid}   38fde238-59f0-47e2-bd3a-80b27781642f
        set test variable   ${declare_type_code}   ${typecode}
        Prepare Json From to Registry for validate 
        Replace string to create file
          log   ${index}
        END
Prepare Data TEST And create file ${number} Json Valid Format declare_type is ${d_type}
    ${REQ_data_list_to_check}   create list
    ${BANK_CASE_ID}   create list
    set test variable    ${REQ_data_list_to_check}
    set test variable    ${BANK_CASE_ID}
        connect to cfr database
       ${sql}=   catenate      SELECT DISTINCT MULE.REF_CODE, MAP.PERSONAL_ID, FA.FIRST_NAME, FA.LAST_NAME, FA.BANK_CODE, FA.ACCOUNT_NUMBER
...    FROM FRAUD_REF_CODE_MAPPING MAP
...             INNER JOIN FRAUD_REF_CODE_MULE MULE ON MAP.REF_CODE_ID = MULE.REF_CODE_ID
...             INNER JOIN FRAUD_ACCOUNT_REPORT FAR ON MAP.PERSONAL_ID = FAR.PERSONAL_ID
...             INNER JOIN FRAUD_ACCOUNT FA ON FAR.ACCOUNT_ID = FA.ID
...    WHERE MAP.FRAUD_LEVEL = 2 fetch first ${number} rows only
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
        Set Data From Json for Validate
        set test variable   ${declare_type}   ${d_type}
        Prepare Json From to Registry for validate 
        Replace string to create file
          log   ${index}
        END
Prepare Data TEST And create file ${number} Json Valid Format mule_ref_code is ${ref_code}
    ${REQ_data_list_to_check}   create list
    ${BANK_CASE_ID}   create list
    set test variable    ${REQ_data_list_to_check}
    set test variable    ${BANK_CASE_ID}
        connect to cfr database
       ${sql}=   catenate      SELECT DISTINCT MULE.REF_CODE, MAP.PERSONAL_ID, FA.FIRST_NAME, FA.LAST_NAME, FA.BANK_CODE, FA.ACCOUNT_NUMBER
...    FROM FRAUD_REF_CODE_MAPPING MAP
...             INNER JOIN FRAUD_REF_CODE_MULE MULE ON MAP.REF_CODE_ID = MULE.REF_CODE_ID
...             INNER JOIN FRAUD_ACCOUNT_REPORT FAR ON MAP.PERSONAL_ID = FAR.PERSONAL_ID
...             INNER JOIN FRAUD_ACCOUNT FA ON FAR.ACCOUNT_ID = FA.ID
...    WHERE MAP.FRAUD_LEVEL = 2 fetch first ${number} rows only
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
        Set Data From Json for Validate
        set test variable   ${mule_ref_code}   ${ref_code}
        Prepare Json From to Registry for validate 
        Replace string to create file
          log   ${index}
        END
Prepare Data TEST And create file ${number} Json Valid Format mule_identity_type is ${iden_type}
    ${REQ_data_list_to_check}   create list
    ${BANK_CASE_ID}   create list
    set test variable    ${REQ_data_list_to_check}
    set test variable    ${BANK_CASE_ID}
        connect to cfr database
       ${sql}=   catenate      SELECT DISTINCT MULE.REF_CODE, MAP.PERSONAL_ID, FA.FIRST_NAME, FA.LAST_NAME, FA.BANK_CODE, FA.ACCOUNT_NUMBER
...    FROM FRAUD_REF_CODE_MAPPING MAP
...             INNER JOIN FRAUD_REF_CODE_MULE MULE ON MAP.REF_CODE_ID = MULE.REF_CODE_ID
...             INNER JOIN FRAUD_ACCOUNT_REPORT FAR ON MAP.PERSONAL_ID = FAR.PERSONAL_ID
...             INNER JOIN FRAUD_ACCOUNT FA ON FAR.ACCOUNT_ID = FA.ID
...    WHERE MAP.FRAUD_LEVEL = 2 fetch first ${number} rows only
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
        Set Data From Json for Validate
        set test variable   ${mule_identity_type}   ${iden_type}
        Prepare Json From to Registry for validate 
        Replace string to create file
          log   ${index}
        END
Prepare Data TEST And create file ${number} Json Valid Format declare_note is ${d_note}
    ${REQ_data_list_to_check}   create list
    ${BANK_CASE_ID}   create list
    set test variable    ${REQ_data_list_to_check}
    set test variable    ${BANK_CASE_ID}
        connect to cfr database
       ${sql}=   catenate      SELECT DISTINCT MULE.REF_CODE, MAP.PERSONAL_ID, FA.FIRST_NAME, FA.LAST_NAME, FA.BANK_CODE, FA.ACCOUNT_NUMBER
...    FROM FRAUD_REF_CODE_MAPPING MAP
...             INNER JOIN FRAUD_REF_CODE_MULE MULE ON MAP.REF_CODE_ID = MULE.REF_CODE_ID
...             INNER JOIN FRAUD_ACCOUNT_REPORT FAR ON MAP.PERSONAL_ID = FAR.PERSONAL_ID
...             INNER JOIN FRAUD_ACCOUNT FA ON FAR.ACCOUNT_ID = FA.ID
...    WHERE MAP.FRAUD_LEVEL = 2 fetch first ${number} rows only
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
        Set Data From Json for Validate
        set test variable   ${declare_note}   ${d_note}
        Prepare Json From to Registry for validate 
        Replace string to create file
          log   ${index}
        END
Prepare Data TEST And create file ${number} Json Valid Format fix_mule_ref_code is ${fix_ref_code}
    ${REQ_data_list_to_check}   create list
    ${BANK_CASE_ID}   create list
    set test variable    ${REQ_data_list_to_check}
    set test variable    ${BANK_CASE_ID}
        connect to cfr database
       ${sql}=   catenate      SELECT DISTINCT MULE.REF_CODE, MAP.PERSONAL_ID, FA.FIRST_NAME, FA.LAST_NAME, FA.BANK_CODE, FA.ACCOUNT_NUMBER
...    FROM FRAUD_REF_CODE_MAPPING MAP
...             INNER JOIN FRAUD_REF_CODE_MULE MULE ON MAP.REF_CODE_ID = MULE.REF_CODE_ID
...             INNER JOIN FRAUD_ACCOUNT_REPORT FAR ON MAP.PERSONAL_ID = FAR.PERSONAL_ID
...             INNER JOIN FRAUD_ACCOUNT FA ON FAR.ACCOUNT_ID = FA.ID
...    WHERE MAP.FRAUD_LEVEL = 2 fetch first ${number} rows only
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
        Set Data From Json for Validate
        set test variable   ${ref_code}   ${fix_ref_code}
        Prepare Json From to Registry for validate 
        Replace string to create file
          log   ${index}
        END
Prepare Data TEST And create file ${number} Json Missing required field declare_uuid is ${e}
    ${REQ_data_list_to_check}   create list
    ${BANK_CASE_ID}   create list
    set test variable    ${REQ_data_list_to_check}
    set test variable    ${BANK_CASE_ID}
        connect to cfr database
       ${sql}=   catenate      SELECT DISTINCT MULE.REF_CODE, MAP.PERSONAL_ID, FA.FIRST_NAME, FA.LAST_NAME, FA.BANK_CODE, FA.ACCOUNT_NUMBER
...    FROM FRAUD_REF_CODE_MAPPING MAP
...             INNER JOIN FRAUD_REF_CODE_MULE MULE ON MAP.REF_CODE_ID = MULE.REF_CODE_ID
...             INNER JOIN FRAUD_ACCOUNT_REPORT FAR ON MAP.PERSONAL_ID = FAR.PERSONAL_ID
...             INNER JOIN FRAUD_ACCOUNT FA ON FAR.ACCOUNT_ID = FA.ID
...    WHERE MAP.FRAUD_LEVEL = 2 fetch first ${number} rows only
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
        Set Data From Json for Validate
        Prepare Json From to Registry for validate 
        Repl
        Replace string to create file
          log   ${index}
        END
create File Name WithdrawMule
     get current datetime
     ${running_number}=    random_number_warrant   3
     ${directory}=     set variable     CFR_WithdrawMule_${filenameDateTime}_${running_number}_REQ
     ${Response_warrant_H}=     set variable     CFR_WithdrawMule_${filenameDateTime}_${running_number}_RES
     set test variable        ${directory}
     set test variable      ${FileName_Warrant}      ${directory}
     set test variable      ${Response_warrant_H}
Prepare Json From to Registry
    [Documentation]    Test Case SUBMIT
    ${json_string}=    Catenate    SEPARATOR=\n
    ...    [
    ...    {
    ...        "declare_uuid": "38fde238-59f0-47e2-bd3a-80b27781641f",
    ...        "declare_type_code": "2", 
    ...        "declare_type": "ปลดม้าเทาเข้มรายบุคคล",
    ...        "declare_date": "${warrant_date}",
    ...        "declare_reason_code": "02",
    ...        "declare_reason": "คดีสิ้นสุด",
    ...        "declare_note": "แจ้งไว้เมื่อวันที่ 1 มกราคม /ถึ",
    ...        "mule_ref_code": "${ref_code}",
    ...        "mule_identity_id": "${personal_id}",
    ...        "mule_identity_type": "1",
    ...        "mule_title": "นาย",
    ...        "mule_name": "${first_name}",
    ...        "mule_surname": "${last_name}",
    ...        "mule_birth_date": "2547-02-29",
    ...        "mule_nationality": "TH",
    ...        "police_case_detail": [
    ...            {
    ...                "police_case_id": "PC256710300001",
    ...                "police_case_type": "3",
    ...                "police_case_report_date": "2567-10-30",
    ...                "mule_account_detail": [
    ...                    {
    ...                        "mule_account_no": "1011103346",
    ...                        "mule_account_type": "bank",
    ...                        "mule_account_bankcode": "004",
    ...                        "mule_account_bankname": "KBNK"
    ...                    }
    ...                ],
    ...                "police_info": {
    ...                    "police_rank": "ส.ต.อ",
    ...                    "police_name": "มั่นคง",
    ...                    "police_surname": "ยินดี",
    ...                    "police_job_title": "พนักงานสืบสวนสอบสวน",
    ...                    "police_org": "สน.บางซื่อ",
    ...                    "police_tel": "0212345678",
    ...                    "police_email": "div2_09@hotmail.com"
    ...                }
    ...            }
    ...        ]
    ...    }
    ...    ]

     Set Test Variable  ${json_string}
     ${json_string}=    Evaluate    json.dumps(${json_string}, ensure_ascii=False, indent=4)    json
    #  Log To Console    ${json_string}
     ${encoded_data}=   Encode String To Bytes    ${json_string}    encoding=UTF-8
     Set Test Variable     ${encoded_data}
Set Data From Json for Validate 
        set test variable   ${declare_uuid}   38fde238-59f0-47e2-bd3a-80b27781641f
        set test variable   ${declare_type_code}   2
        set test variable   ${declare_type}   ปลดม้าเทาเข้มรายบุคคล
        set test variable   ${declare_date}   ${warrant_date}
        set test variable   ${declare_reason_code}   02
        set test variable   ${declare_reason}   คดีสิ้นสุด
        set test variable   ${declare_note}   แจ้งไว้เมื่อวันที่ 1 มกราคม /ถึ
        set test variable   ${mule_ref_code}   ${ref_code}
        set test variable   ${mule_identity_id}   ${personal_id}
        set test variable   ${mule_identity_type}   1
        set test variable   ${mule_title}   นาย
        set test variable   ${mule_name}   ${first_name}
        set test variable   ${mule_surname}   ${last_name}
        set test variable   ${mule_birth_date}   2547-02-29
        set test variable   ${mule_nationality}   TH
        set test variable   ${police_case_id}   PC256710300001
        set test variable   ${police_case_type}   3
        set test variable   ${police_case_report_date}   2567-10-30
        set test variable   ${mule_account_no}   1011103346
        set test variable   ${mule_account_type}   bank
        set test variable   ${mule_account_bankcode}   004
        set test variable   ${mule_account_bankname}   KBNK
        set test variable   ${police_rank}   ส.ต.อ
        set test variable   ${police_name}   มั่นคง
        set test variable   ${police_surname}   ยินดี
        set test variable   ${police_job_title}   พนักงานสืบสวนสอบสวน
        set test variable   ${police_org}   สน.บางซื่อ
        set test variable   ${police_tel}   0212345678
        set test variable   ${police_email}   div2_09@hotmail.com
Prepare Json From to Registry for validate 
    [Documentation]    Test Case SUBMIT
    ${json_string}=    Catenate    SEPARATOR=\n
    ...    [
    ...    {
    ...        "declare_uuid": "${declare_uuid}",
    ...        "declare_type_code": "${declare_type_code}", 
    ...        "declare_type": "${declare_type}",
    ...        "declare_date": "${warrant_date}",
    ...        "declare_reason_code": "${declare_reason_code}",
    ...        "declare_reason": "${declare_reason}",
    ...        "declare_note": "${declare_note}",
    ...        "mule_ref_code": "${ref_code}",
    ...        "mule_identity_id": "${personal_id}",
    ...        "mule_identity_type": "${mule_identity_type}",
    ...        "mule_title": "${mule_title}",
    ...        "mule_name": "${first_name}",
    ...        "mule_surname": "${last_name}",
    ...        "mule_birth_date": "${mule_birth_date}",
    ...        "mule_nationality": "${mule_nationality}",
    ...        "police_case_detail": [
    ...            {
    ...                "police_case_id": "${police_case_id}",
    ...                "police_case_type": "${police_case_type}",
    ...                "police_case_report_date": "${police_case_report_date}",
    ...                "mule_account_detail": [
    ...                    {
    ...                        "mule_account_no": "${mule_account_no}",
    ...                        "mule_account_type": "${mule_account_type}",
    ...                        "mule_account_bankcode": "${mule_account_bankcode}",
    ...                        "mule_account_bankname": "${mule_account_bankname}"
    ...                    }
    ...                ],
    ...                "police_info": {
    ...                    "police_rank": "${police_rank}",
    ...                    "police_name": "${police_name}",
    ...                    "police_surname": "${police_surname}",
    ...                    "police_job_title": "${police_job_title}",
    ...                    "police_org": "${police_org}",
    ...                    "police_tel": "${police_tel}",
    ...                    "police_email": "${police_email}"
    ...                }
    ...            }
    ...        ]
    ...    }
    ...    ]

     Set Test Variable  ${json_string}
     ${json_string}=    Evaluate    json.dumps(${json_string}, ensure_ascii=False, indent=4)    json
    #  Log To Console    ${json_string}
     ${encoded_data}=   Encode String To Bytes    ${json_string}    encoding=UTF-8
     Set Test Variable     ${encoded_data}

Call API Sending file Mule_Withdraw from aoc to ITMX
    ${API_URL}=   Set Variable     ${Host_GET}
    Create Session  WithdrawAPI    ${API_URL}
    ${headers} =   Create Dictionary    Content-Type=${Content-Type}
    ${response}=    POST On Session   WithdrawAPI  ${path.WithdrawAPI}    expected_status=any
    set test variable     ${response}
    # Get File Name to BANK
 
Get File GPG Withdraw From ITMX JSON 
    ${Response_warrant_H_gpg}=     set variable     ${Response_warrant_H}.gpg
    ${Response_warrant_H_csv}=     set variable     ${Response_warrant_H}.json
    set test variable    ${Response_warrant_H_gpg}
    set test variable    ${Response_warrant_H_csv}
    WHILE    ${RETRY_COUNT} < ${MAX_RETRIES}
    sleep    5s
    ${outbound_exists}=    Run Keyword And Return Status    SSHLibrary.File Should Exist   /home/sftpaoc/${ENVAOC}/cfr/withdraw_mule/outbound/${Response_warrant_H_gpg}
    ${inbound_exists}=    Run Keyword And Return Status    SSHLibrary.File Should Exist   /home/sftpaoc/${ENVAOC}/cfr/withdraw_mule/inbound/archive/${FileName_Warrant}.gpg
    Run Keyword If    ${RETRY_COUNT} == ${MAX_RETRIES}    Fail    "File not found after ${MAX_RETRIES} retries."
    ${RETRY_COUNT}=    Evaluate    ${RETRY_COUNT} + 1
    Run Keyword If    ${outbound_exists} and ${inbound_exists}    Exit For Loop
    END
    SSHLibrary.Get File     /home/sftpaoc/${ENVAOC}/cfr/withdraw_mule/outbound/${Response_warrant_H_gpg}     ${CURDIR}/Data/${Response_warrant_H_gpg}
    ${gpg_file_path}=  Set Variable  ${CURDIR}/Data/${Response_warrant_H_gpg}
    ${output_csv_path}=  Set Variable  ${CURDIR}/Data/${Response_warrant_H_csv}
    ${passphrase}=  Set Variable   ${Pass.AOC}
     ${result}=    Decrypt Gpg File    ${gpg_file_path}  ${output_csv_path}  ${passphrase}
    Log    ${result}
    wait until created    ${CURDIR}/Data/${Response_warrant_H_gpg}   2s
    wait until created    ${CURDIR}/Data/${Response_warrant_H_csv}   2s
    set test variable   ${CSV_FILE}     ${CURDIR}/Data/${Response_warrant_H_csv}
    set test variable   ${GPG_FILE}     ${CURDIR}/Data/${Response_warrant_H_gpg}
    set test variable   ${GPG_FILE_REQ}     ${CURDIR}/Data/${FileName_Warrant}.gpg
    set test variable   ${CSV_FILE_REQ}     ${CURDIR}/Data/${FileName_Warrant}.json
#     remove file     ${CURDIR}/../${FILENAME_GPG}
#     remove file     ${CURDIR}/../${FILENAME_CSV}

Check DB REQ and RES File To Deleted Mule Withdraw
        BuiltIn.Sleep   10s
        connect to cfr database
       ${sql}=   catenate      SELECT * FROM AOC_SFTP_WITHDRAW_MULE_REQUEST_FILE_INFO  WHERE FILE_NAME = '${FileName_Warrant}.gpg'
        ${query}=   query_all     ${db_connect}     ${sql}     # query
        ${result}=   set variable    ${query[0]}
        ${DB_REQ_ID}=    set variable    ${result}[ID]
    #     Sleep    5s
    #    ${sql}=   catenate      DELETE FROM AOC_SFTP_WITHDRAW_MULE_RESPONSE_FILE_INFO where REQUEST_FILE_ID = '${DB_REQ_ID}'
    #     ${query}=   update     ${db_connect}     ${sql}     # query
    #    ${sql}=   catenate      DELETE FROM AOC_SFTP_WITHDRAW_MULE_REQUEST_FILE_INFO where ID = '${DB_REQ_ID}'
    #     ${query}=   update     ${db_connect}     ${sql}     # query
    #    ${sql}=   catenate      DELETE FROM AOC_SFTP_WITHDRAW_MULE_REQUEST_FILE_DETAIL where FILE_ID = '${DB_REQ_ID}'
    #     ${query}=   update     ${db_connect}     ${sql}
    #     Remove file Json WithDraw SSH
