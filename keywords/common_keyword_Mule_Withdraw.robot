*** Settings ***
Resource  ../resources/imports.robot

*** Keywords ***
Prepare Data TEST For some item dupicate
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
...          # ...          WHERE RULE_MAXX IN (1,2)
...          WHERE RULE_MAXX IN (1)
...          GROUP BY PERSONAL_ID, ACCOUNT_NUMBER, BANK_CODE) data 
...    JOIN FRAUD_REF_CODE_MULE MULE ON data.PERSONAL_ID = MULE.PERSONAL_ID 
...    JOIN FRAUD_ACCOUNT FA ON data.PERSONAL_ID = FA.PERSONAL_ID FETCH FIRST 1 ROWS ONLY
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
        ${json_string}=    Catenate    SEPARATOR=\n
    ...    [ 
    ...  { 
    ...    "declare_uuid": "38fde238-59f0-47e2-bd3a-80b27781641f", 
    ...    "declare_type_code": "2", 
    ...    "declare_type": "ปลดม้าเทาเข้มรายบุคคล", 
    ...    "declare_date": "2567-11-20", 
    ...    "declare_reason_code": "02", 
    ...    "declare_reason": "คดีสิ้นสุด", 
    ...    "declare_note": "แจ้งไว้เมื่อวันที่ 1 มกราคม /ถึ", 
    ...    "mule_ref_code": "CF00000707", 
    ...    "mule_identity_id": "5558357124433", 
    ...    "mule_identity_type": "1", 
    ...    "mule_title": null, 
    ...    "mule_name": "กนกนุช", 
    ...    "mule_surname": "กิรณา", 
    ...    "mule_birth_date": "2547-02-29", 
    ...    "mule_nationality": "TH", 
    ...    "police_case_detail": [ 
    ...      { 
    ...        "police_case_id": "PC256710300001", 
    ...        "police_case_report_date": "2567-10-30", 
    ...        "mule_account_detail": [ 
    ...          { 
    ...            "mule_account_no": "1011103346", 
    ...            "mule_account_type": "bank", 
    ...            "mule_account_bankcode": "004", 
    ...            "mule_account_bankname": "KBNK" 
    ...          } 
    ...        ], 
    ...        "police_info": { 
    ...          "police_rank": "ส.ต.อ", 
    ...          "police_name": "มั่นคง", 
    ...          "police_surname": "ยินดี", 
    ...          "police_job_title": "พนักงานสืบสวนสอบสวน", 
    ...          "police_org": "สน.บางซื่อ", 
    ...          "police_tel": "0212345678", 
    ...          "police_email": "div2_09@hotmail.com" 
    ...        } 
    ...      } 
    ...    ] 
    ...      }
    ...    ,
    ...    { 
    ...    "declare_uuid": "38fde238-59f0-47e2-bd3a-80b27781641f", 
    ...    "declare_type_code": "2", 
    ...    "declare_type": "ปลดม้าเทาเข้มรายบุคคล", 
    ...    "declare_date": "2567-11-20", 
    ...    "declare_reason_code": "02", 
    ...    "declare_reason": "คดีสิ้นสุด", 
    ...    "declare_note": "แจ้งไว้เมื่อวันที่ 1 มกราคม /ถึ", 
    ...    "mule_ref_code": "CF00000707", 
    ...    "mule_identity_id": "5558357124433", 
    ...    "mule_identity_type": "1", 
    ...    "mule_title": null, 
    ...    "mule_name": "กนกนุช", 
    ...    "mule_surname": "กิรณา", 
    ...    "mule_birth_date": "2547-02-29", 
    ...    "mule_nationality": "TH", 
    ...    "police_case_detail": [ 
    ...      { 
    ...        "police_case_id": "PC256710300001", 
    ...        "police_case_report_date": "2567-10-30", 
    ...        "mule_account_detail": [ 
    ...          { 
    ...            "mule_account_no": "1011103346", 
    ...            "mule_account_type": "bank", 
    ...            "mule_account_bankcode": "004", 
    ...            "mule_account_bankname": "KBNK" 
    ...          } 
    ...        ], 
    ...        "police_info": { 
    ...          "police_rank": "ส.ต.อ", 
    ...          "police_name": "มั่นคง", 
    ...          "police_surname": "ยินดี", 
    ...          "police_job_title": "พนักงานสืบสวนสอบสวน", 
    ...          "police_org": "สน.บางซื่อ", 
    ...          "police_tel": "0212345678", 
    ...          "police_email": "div2_09@hotmail.com" 
    ...        } 
    ...      } 
    ...        ] 
    ...      }
    ...    ]

     Set Test Variable  ${json_string}
    #  ${json_string}=    Evaluate    json.dumps(${json_string}, ensure_ascii=False, indent=4)    json
    #  Log To Console    ${json_string}
     ${encoded_data}=   Encode String To Bytes    ${json_string}    encoding=UTF-8
     Set Test Variable     ${encoded_data}
        Replace string to create file
          log   ${index}
        END
Prepare Data TEST And create file Json amount is ${count}
    ${json_list}=    Create List
    FOR    ${i}    IN RANGE    ${count}
            connect to cfr database
    ${SQL}=    Catenate
...    SELECT DISTINCT data.PERSONAL_ID, data.ACCOUNT_NUMBER, REF_CODE, STATUS, FA.FIRST_NAME, FA.LAST_NAME
...    FROM (
...        SELECT PERSONAL_ID, ACCOUNT_NUMBER, BANK_CODE, MAX(RULE_MAXX) AS RULE_MAX
...        FROM (
...            SELECT FA.PERSONAL_ID, FA.ACCOUNT_NUMBER, BANK_CODE, MIN(RULE_ID) AS RULE_MAXX
...            FROM FRAUD_PERSON FP
...            JOIN FRAUD_ACCOUNT FA ON FP.PERSONAL_ID = FA.PERSONAL_ID
...            JOIN FRAUD_ACCOUNT_APPLY_FRAUD_RULE FAAFR ON FA.ID = FAAFR.ACCOUNT_ID
...            WHERE FP.FRAUD_LEVEL = '2' AND FA.IS_ACTIVE = '1'
...            GROUP BY ACCOUNT_NUMBER, FA.PERSONAL_ID, BANK_CODE
...        )
...        # ...          WHERE RULE_MAXX IN (1,2)
...          WHERE RULE_MAXX IN (1)
...        GROUP BY PERSONAL_ID, ACCOUNT_NUMBER, BANK_CODE
...    ) data
...    JOIN FRAUD_REF_CODE_MULE MULE ON data.PERSONAL_ID = MULE.PERSONAL_ID
...    JOIN FRAUD_ACCOUNT FA ON data.PERSONAL_ID = FA.PERSONAL_ID
...    ORDER BY data.PERSONAL_ID
...    OFFSET ${i} ROWS FETCH NEXT 1 ROWS ONLY
        ${query}=   query_all     ${db_connect}     ${sql}     # query
        # ${LEN_GENFILE}=  Get Length    ${query}
        # FOR    ${index}    IN RANGE    ${LEN_GENFILE}
        ${result}=   set variable    ${query[0]}
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
        ${json_item}=    Catenate    SEPARATOR=\n
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
        ...                "police_case_id": "PC25671030000",
        ...                "police_case_type": "3",
        ...                "police_case_report_date": "2567-10-30",
        ...                "mule_account_detail": [
        ...                    {
        ...                        "mule_account_no": "101110334",
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
        Append To List    ${json_list}    ${json_item}
    ${json_string}=    Catenate    SEPARATOR=\n    [\n${json_list}\n]
    Set Test Variable    ${json_string}    ${json_list} 
    Set Test Variable  ${json_string}
     ${json_string}=    Evaluate    json.dumps(${json_string}, ensure_ascii=False, indent=4)    json
     ${encoded_data}=   Encode String To Bytes    ${json_string}    encoding=UTF-8
     Set Test Variable     ${encoded_data}
    Replace string to create file for Generate JSON Loop
    END
Prepare Data TEST And create file Json amount is query done ${count}
    ${json_list}=    Create List
    FOR    ${i}    IN RANGE    ${count}
            connect to cfr database
    ${SQL}=    Catenate
...    SELECT
...    	DISTINCT FA.PERSONAL_ID,
...    	FA.ACCOUNT_NUMBER,
...    	REF_CODE,
...    	STATUS,
...    	FA.FIRST_NAME,
...    	FA.LAST_NAME
...    FROM
...    	FRAUD_ACCOUNT FA
...    JOIN FRAUD_PERSON FP ON
...    	FA.PERSONAL_ID = FP.PERSONAL_ID
...    	AND FP.FRAUD_LEVEL = 2
...    JOIN FRAUD_ACCOUNT_REPORT FAR ON
...    	FAR.ACCOUNT_ID = FA.ID
...    JOIN FRAUD_REF_CODE_MAPPING FRCM ON
...    	FRCM.REPORT_CYCLE_ID = FAR.CYCLE_ID
...    	AND FA.PERSONAL_ID = FRCM.PERSONAL_ID
...    JOIN FRAUD_REF_CODE_MULE FRCMULE ON
...    	FRCMULE.REF_CODE_ID = FRCM.REF_CODE_ID
...    	AND FRCMULE.STATUS = 1
...    LEFT JOIN AOC_WITHDRAW_MULE_REPO AWMR ON
...    	MULE_IDENTITY_ID = FA.PERSONAL_ID
...    WHERE
...    	FA.IS_ACTIVE = 1
...    	AND AWMR.ID IS NULL
...    ORDER BY
...    	FRCMULE.REF_CODE
...    OFFSET ${i} ROWS FETCH NEXT 1 ROWS ONLY
        ${query}=   query_all     ${db_connect}     ${sql}     # query
        # ${LEN_GENFILE}=  Get Length    ${query}
        # FOR    ${index}    IN RANGE    ${LEN_GENFILE}
        ${result}=   set variable    ${query[0]}
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
        ${json_item}=    Catenate    SEPARATOR=\n
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
        ...                "police_case_id": "PC25671030000",
        ...                "police_case_type": "3",
        ...                "police_case_report_date": "2567-10-30",
        ...                "mule_account_detail": [
        ...                    {
        ...                        "mule_account_no": "101110334",
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
        Append To List    ${json_list}    ${json_item}
    ${json_string}=    Catenate    SEPARATOR=\n    [\n${json_list}\n]
    Set Test Variable    ${json_string}    ${json_list} 
    Set Test Variable  ${json_string}
     ${json_string}=    Evaluate    json.dumps(${json_string}, ensure_ascii=False, indent=4)    json
     ${encoded_data}=   Encode String To Bytes    ${json_string}    encoding=UTF-8
     Set Test Variable     ${encoded_data}
    Replace string to create file for Generate JSON Loop
    END
Generate fILE JSON Loop amount is ${count} file
    ${REQ_data_list_to_check}   create list
    ${BANK_CASE_ID}   create list
    set test variable    ${REQ_data_list_to_check}
    set test variable    ${BANK_CASE_ID}
    FOR    ${index}    IN RANGE    ${count}
        connect to cfr database
    ${SQL}=    Catenate
...    SELECT DISTINCT FA.PERSONAL_ID, FA.ACCOUNT_NUMBER, REF_CODE, STATUS, FA.FIRST_NAME, FA.LAST_NAME
...    FROM FRAUD_ACCOUNT FA
    ...    JOIN FRAUD_PERSON FP ON FA.PERSONAL_ID = FP.PERSONAL_ID AND FP.FRAUD_LEVEL = 2
    ...    JOIN FRAUD_ACCOUNT_REPORT FAR ON FAR.ACCOUNT_ID = FA.ID
    ...    JOIN FRAUD_REF_CODE_MAPPING FRCM ON FRCM.REPORT_CYCLE_ID = FAR.CYCLE_ID AND FA.PERSONAL_ID = FRCM.PERSONAL_ID
    ...    JOIN FRAUD_REF_CODE_MULE FRCMULE ON FRCMULE.REF_CODE_ID = FRCM.REF_CODE_ID AND FRCMULE.STATUS = 1
    ...    LEFT JOIN AOC_WITHDRAW_MULE_REPO AWMR ON MULE_IDENTITY_ID = FA.PERSONAL_ID
    ...    WHERE FA.IS_ACTIVE = 1
    # ...    AND AWMR.ID IS NULL
    ...    ORDER BY FRCMULE.REF_CODE
...     FETCH FIRST ${count} ROWS ONLY
        ${query}=   query_all     ${db_connect}     ${sql}     # query
        # ${LEN_GENFILE}=  Get Length    ${query}
        # FOR    ${index}    IN RANGE    ${LEN_GENFILE}
        ${result}=   set variable    ${query[0]}
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
        Generate JSON Loop amount is ${count}
        Replace string to create file for Generate JSON Loop
          log   ${index}
        END
Prepare Data TEST And create file Json and fix file name to create is ${JSON}
    ${REQ_data_list_to_check}   create list
    ${BANK_CASE_ID}   create list
    set test variable    ${REQ_data_list_to_check}
    set test variable    ${BANK_CASE_ID}
        connect to cfr database
    ${SQL}=    Catenate
...    SELECT DISTINCT FA.PERSONAL_ID, FA.ACCOUNT_NUMBER, REF_CODE, STATUS, FA.FIRST_NAME, FA.LAST_NAME
...    FROM FRAUD_ACCOUNT FA
...    JOIN FRAUD_PERSON FP ON FA.PERSONAL_ID = FP.PERSONAL_ID AND FP.FRAUD_LEVEL = 2
...    JOIN FRAUD_ACCOUNT_REPORT FAR ON FAR.ACCOUNT_ID = FA.ID
...    JOIN FRAUD_REF_CODE_MAPPING FRCM ON FRCM.REPORT_CYCLE_ID = FAR.CYCLE_ID AND FA.PERSONAL_ID = FRCM.PERSONAL_ID
...    JOIN FRAUD_REF_CODE_MULE FRCMULE ON FRCMULE.REF_CODE_ID = FRCM.REF_CODE_ID AND FRCMULE.STATUS = 1
...    LEFT JOIN AOC_WITHDRAW_MULE_REPO AWMR ON MULE_IDENTITY_ID = FA.PERSONAL_ID
...    WHERE FA.IS_ACTIVE = 1
# ...    AND AWMR.ID IS NULL
...    ORDER BY FRCMULE.REF_CODE
...     FETCH FIRST 1 ROWS ONLY
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
        Replace string to create file and fix file name is ${JSON}
          log   ${index}
        END
Prepare Data TEST And create file ${number} Json original not same data
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
...                    WHERE RULE_MAXX IN (1,2)
...          GROUP BY PERSONAL_ID, ACCOUNT_NUMBER, BANK_CODE) data 
...    JOIN FRAUD_REF_CODE_MULE MULE ON data.PERSONAL_ID = MULE.PERSONAL_ID 
...    JOIN FRAUD_ACCOUNT FA ON data.PERSONAL_ID = FA.PERSONAL_ID
...    FETCH FIRST ${number} ROWS ONLY
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
        ${json_list}=    Create List
        ${json_item}=    Catenate    SEPARATOR=\n
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
        ...                "police_case_id": "PC25671030000",
        ...                "police_case_type": "3",
        ...                "police_case_report_date": "2567-10-30",
        ...                "mule_account_detail": [
        ...                    {
        ...                        "mule_account_no": "101110334",
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
    Append To List    ${json_list}    ${json_item}
    ${json_string}=    Catenate    SEPARATOR=\n    [\n${json_list}\n]
    Set Test Variable    ${json_string}    ${json_list} 
    Set Test Variable  ${json_string}
     ${json_string}=    Evaluate    json.dumps(${json_string}, ensure_ascii=False, indent=4)    json
     ${encoded_data}=   Encode String To Bytes    ${json_string}    encoding=UTF-8
     Set Test Variable     ${encoded_data}
     Replace string to create file
     log   ${index}
        END
Prepare Data TEST And create file ${number} Json Valid Format declare_uuid is ${uuid}
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
...                    WHERE RULE_MAXX IN (1,2)
...          GROUP BY PERSONAL_ID, ACCOUNT_NUMBER, BANK_CODE) data 
...    JOIN FRAUD_REF_CODE_MULE MULE ON data.PERSONAL_ID = MULE.PERSONAL_ID 
...    JOIN FRAUD_ACCOUNT FA ON data.PERSONAL_ID = FA.PERSONAL_ID
...    FETCH FIRST ${number} ROWS ONLY
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
       ${sql}=   catenate     SELECT DISTINCT data.PERSONAL_ID, data.ACCOUNT_NUMBER, REF_CODE, STATUS, FA.FIRST_NAME, FA.LAST_NAME 
...    FROM (SELECT PERSONAL_ID, ACCOUNT_NUMBER, BANK_CODE, MAX(RULE_MAXX) AS RULE_MAX 
...          FROM (SELECT FA.PERSONAL_ID, FA.ACCOUNT_NUMBER, BANK_CODE, MIN(RULE_ID) AS RULE_MAXX 
...                FROM FRAUD_PERSON FP 
...                JOIN FRAUD_ACCOUNT FA ON FP.PERSONAL_ID = FA.PERSONAL_ID 
...                JOIN FRAUD_ACCOUNT_APPLY_FRAUD_RULE FAAFR ON FA.ID = FAAFR.ACCOUNT_ID 
...                WHERE FP.FRAUD_LEVEL = '2' AND FA.IS_ACTIVE = '1' 
...                GROUP BY ACCOUNT_NUMBER, FA.PERSONAL_ID, BANK_CODE) 
...                    WHERE RULE_MAXX IN (1,2)
...          GROUP BY PERSONAL_ID, ACCOUNT_NUMBER, BANK_CODE) data 
...    JOIN FRAUD_REF_CODE_MULE MULE ON data.PERSONAL_ID = MULE.PERSONAL_ID 
...    JOIN FRAUD_ACCOUNT FA ON data.PERSONAL_ID = FA.PERSONAL_ID
...    FETCH FIRST ${number} ROWS ONLY
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
       ${sql}=   catenate     SELECT DISTINCT data.PERSONAL_ID, data.ACCOUNT_NUMBER, REF_CODE, STATUS, FA.FIRST_NAME, FA.LAST_NAME 
...    FROM (SELECT PERSONAL_ID, ACCOUNT_NUMBER, BANK_CODE, MAX(RULE_MAXX) AS RULE_MAX 
...          FROM (SELECT FA.PERSONAL_ID, FA.ACCOUNT_NUMBER, BANK_CODE, MIN(RULE_ID) AS RULE_MAXX 
...                FROM FRAUD_PERSON FP 
...                JOIN FRAUD_ACCOUNT FA ON FP.PERSONAL_ID = FA.PERSONAL_ID 
...                JOIN FRAUD_ACCOUNT_APPLY_FRAUD_RULE FAAFR ON FA.ID = FAAFR.ACCOUNT_ID 
...                WHERE FP.FRAUD_LEVEL = '2' AND FA.IS_ACTIVE = '1' 
...                GROUP BY ACCOUNT_NUMBER, FA.PERSONAL_ID, BANK_CODE) 
...                    WHERE RULE_MAXX IN (1,2)
...          GROUP BY PERSONAL_ID, ACCOUNT_NUMBER, BANK_CODE) data 
...    JOIN FRAUD_REF_CODE_MULE MULE ON data.PERSONAL_ID = MULE.PERSONAL_ID 
...    JOIN FRAUD_ACCOUNT FA ON data.PERSONAL_ID = FA.PERSONAL_ID
...    FETCH FIRST ${number} ROWS ONLY
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
Prepare Data TEST And create file ${number} Json Valid Format declare_type_code is ${typecode} and declare_type is ${d_type}
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
...                GROUP BY ACCOUNT_NUMBER, FA.PERSONAL_ID, BANK_CODE) 
...          # ...          WHERE RULE_MAXX IN (1,2)
...          WHERE RULE_MAXX IN (1) 
...          GROUP BY PERSONAL_ID, ACCOUNT_NUMBER, BANK_CODE) data 
...    JOIN FRAUD_REF_CODE_MULE MULE ON data.PERSONAL_ID = MULE.PERSONAL_ID 
...    JOIN FRAUD_ACCOUNT FA ON data.PERSONAL_ID = FA.PERSONAL_ID FETCH FIRST ${number} ROWS ONLY
        ${query}=   query_all     ${db_connect}     ${sql}     # query
        log      ${query}
        log      ${sql}
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
        set test variable   ${declare_type}   ${d_type}
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
       ${sql}=   catenate     SELECT DISTINCT data.PERSONAL_ID, data.ACCOUNT_NUMBER, REF_CODE, STATUS, FA.FIRST_NAME, FA.LAST_NAME 
...    FROM (SELECT PERSONAL_ID, ACCOUNT_NUMBER, BANK_CODE, MAX(RULE_MAXX) AS RULE_MAX 
...          FROM (SELECT FA.PERSONAL_ID, FA.ACCOUNT_NUMBER, BANK_CODE, MIN(RULE_ID) AS RULE_MAXX 
...                FROM FRAUD_PERSON FP 
...                JOIN FRAUD_ACCOUNT FA ON FP.PERSONAL_ID = FA.PERSONAL_ID 
...                JOIN FRAUD_ACCOUNT_APPLY_FRAUD_RULE FAAFR ON FA.ID = FAAFR.ACCOUNT_ID 
...                WHERE FP.FRAUD_LEVEL = '2' AND FA.IS_ACTIVE = '1' 
...                GROUP BY ACCOUNT_NUMBER, FA.PERSONAL_ID, BANK_CODE) 
...                    WHERE RULE_MAXX IN (1,2)
...          GROUP BY PERSONAL_ID, ACCOUNT_NUMBER, BANK_CODE) data 
...    JOIN FRAUD_REF_CODE_MULE MULE ON data.PERSONAL_ID = MULE.PERSONAL_ID 
...    JOIN FRAUD_ACCOUNT FA ON data.PERSONAL_ID = FA.PERSONAL_ID
...    FETCH FIRST ${number} ROWS ONLY
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
       ${sql}=   catenate     SELECT DISTINCT data.PERSONAL_ID, data.ACCOUNT_NUMBER, REF_CODE, STATUS, FA.FIRST_NAME, FA.LAST_NAME 
...    FROM (SELECT PERSONAL_ID, ACCOUNT_NUMBER, BANK_CODE, MAX(RULE_MAXX) AS RULE_MAX 
...          FROM (SELECT FA.PERSONAL_ID, FA.ACCOUNT_NUMBER, BANK_CODE, MIN(RULE_ID) AS RULE_MAXX 
...                FROM FRAUD_PERSON FP 
...                JOIN FRAUD_ACCOUNT FA ON FP.PERSONAL_ID = FA.PERSONAL_ID 
...                JOIN FRAUD_ACCOUNT_APPLY_FRAUD_RULE FAAFR ON FA.ID = FAAFR.ACCOUNT_ID 
...                WHERE FP.FRAUD_LEVEL = '2' AND FA.IS_ACTIVE = '1' 
...                GROUP BY ACCOUNT_NUMBER, FA.PERSONAL_ID, BANK_CODE) 
...                    WHERE RULE_MAXX IN (1,2)
...          GROUP BY PERSONAL_ID, ACCOUNT_NUMBER, BANK_CODE) data 
...    JOIN FRAUD_REF_CODE_MULE MULE ON data.PERSONAL_ID = MULE.PERSONAL_ID 
...    JOIN FRAUD_ACCOUNT FA ON data.PERSONAL_ID = FA.PERSONAL_ID
...    FETCH FIRST ${number} ROWS ONLY
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
       ${sql}=   catenate     SELECT DISTINCT data.PERSONAL_ID, data.ACCOUNT_NUMBER, REF_CODE, STATUS, FA.FIRST_NAME, FA.LAST_NAME 
...    FROM (SELECT PERSONAL_ID, ACCOUNT_NUMBER, BANK_CODE, MAX(RULE_MAXX) AS RULE_MAX 
...          FROM (SELECT FA.PERSONAL_ID, FA.ACCOUNT_NUMBER, BANK_CODE, MIN(RULE_ID) AS RULE_MAXX 
...                FROM FRAUD_PERSON FP 
...                JOIN FRAUD_ACCOUNT FA ON FP.PERSONAL_ID = FA.PERSONAL_ID 
...                JOIN FRAUD_ACCOUNT_APPLY_FRAUD_RULE FAAFR ON FA.ID = FAAFR.ACCOUNT_ID 
...                WHERE FP.FRAUD_LEVEL = '2' AND FA.IS_ACTIVE = '1' 
...                GROUP BY ACCOUNT_NUMBER, FA.PERSONAL_ID, BANK_CODE) 
...                    WHERE RULE_MAXX IN (1,2)
...          GROUP BY PERSONAL_ID, ACCOUNT_NUMBER, BANK_CODE) data 
...    JOIN FRAUD_REF_CODE_MULE MULE ON data.PERSONAL_ID = MULE.PERSONAL_ID 
...    JOIN FRAUD_ACCOUNT FA ON data.PERSONAL_ID = FA.PERSONAL_ID
...    FETCH FIRST ${number} ROWS ONLY
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
Prepare Data TEST And create file ${number} Json Valid Format mule_name is ${name}
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
...                    WHERE RULE_MAXX IN (1,2)
...          GROUP BY PERSONAL_ID, ACCOUNT_NUMBER, BANK_CODE) data 
...    JOIN FRAUD_REF_CODE_MULE MULE ON data.PERSONAL_ID = MULE.PERSONAL_ID 
...    JOIN FRAUD_ACCOUNT FA ON data.PERSONAL_ID = FA.PERSONAL_ID
...    FETCH FIRST ${number} ROWS ONLY
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
        set test variable   ${first_name}   ${name}
        Prepare Json From to Registry for validate 
        Replace string to create file
          log   ${index}
        END
Prepare Data TEST And create file ${number} Json Valid Format police_surname is ${l_name}
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
...                    WHERE RULE_MAXX IN (1,2)
...          GROUP BY PERSONAL_ID, ACCOUNT_NUMBER, BANK_CODE) data 
...    JOIN FRAUD_REF_CODE_MULE MULE ON data.PERSONAL_ID = MULE.PERSONAL_ID 
...    JOIN FRAUD_ACCOUNT FA ON data.PERSONAL_ID = FA.PERSONAL_ID
...    FETCH FIRST ${number} ROWS ONLY
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
        set test variable   ${police_surname}   ${l_name}
        Prepare Json From to Registry for validate 
        Replace string to create file
          log   ${index}
        END
Prepare Data TEST And create file ${number} Json Valid Format police_tel is ${p_tel}
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
...                    WHERE RULE_MAXX IN (1,2)
...          GROUP BY PERSONAL_ID, ACCOUNT_NUMBER, BANK_CODE) data 
...    JOIN FRAUD_REF_CODE_MULE MULE ON data.PERSONAL_ID = MULE.PERSONAL_ID 
...    JOIN FRAUD_ACCOUNT FA ON data.PERSONAL_ID = FA.PERSONAL_ID
...    FETCH FIRST ${number} ROWS ONLY
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
        set test variable   ${police_tel}   ${p_tel}
        Prepare Json From to Registry for validate 
        Replace string to create file
          log   ${index}
        END
Prepare Data TEST And create file ${number} Json Valid Format police_case_id is ${p_case_id}
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
...                    WHERE RULE_MAXX IN (1,2)
...          GROUP BY PERSONAL_ID, ACCOUNT_NUMBER, BANK_CODE) data 
...    JOIN FRAUD_REF_CODE_MULE MULE ON data.PERSONAL_ID = MULE.PERSONAL_ID 
...    JOIN FRAUD_ACCOUNT FA ON data.PERSONAL_ID = FA.PERSONAL_ID
...    FETCH FIRST ${number} ROWS ONLY
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
        set test variable   ${police_case_id}   ${p_case_id}
        Prepare Json From to Registry for validate 
        Replace string to create file
          log   ${index}
        END
Prepare Data TEST And create file ${number} Json Valid Format police_case_type is ${p_case_type}
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
...                    WHERE RULE_MAXX IN (1,2)
...          GROUP BY PERSONAL_ID, ACCOUNT_NUMBER, BANK_CODE) data 
...    JOIN FRAUD_REF_CODE_MULE MULE ON data.PERSONAL_ID = MULE.PERSONAL_ID 
...    JOIN FRAUD_ACCOUNT FA ON data.PERSONAL_ID = FA.PERSONAL_ID
...    FETCH FIRST ${number} ROWS ONLY
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
        set test variable   ${police_case_type}   ${p_case_type}
        Prepare Json From to Registry for validate 
        Replace string to create file
          log   ${index}
        END
Prepare Data TEST And create file ${number} Json Valid Format police_case_report_date is ${p_case_re_date}
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
...                    WHERE RULE_MAXX IN (1,2)
...          GROUP BY PERSONAL_ID, ACCOUNT_NUMBER, BANK_CODE) data 
...    JOIN FRAUD_REF_CODE_MULE MULE ON data.PERSONAL_ID = MULE.PERSONAL_ID 
...    JOIN FRAUD_ACCOUNT FA ON data.PERSONAL_ID = FA.PERSONAL_ID
...    FETCH FIRST ${number} ROWS ONLY
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
        set test variable   ${police_case_report_date}   ${p_case_re_date}
        Prepare Json From to Registry for validate 
        Replace string to create file
          log   ${index}
        END
Prepare Data TEST And create file ${number} Json Valid Format mule_account_no is ${m_acc_no}
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
...                    WHERE RULE_MAXX IN (1,2)
...          GROUP BY PERSONAL_ID, ACCOUNT_NUMBER, BANK_CODE) data 
...    JOIN FRAUD_REF_CODE_MULE MULE ON data.PERSONAL_ID = MULE.PERSONAL_ID 
...    JOIN FRAUD_ACCOUNT FA ON data.PERSONAL_ID = FA.PERSONAL_ID
...    FETCH FIRST ${number} ROWS ONLY
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
        set test variable   ${mule_account_no}   ${m_acc_no}
        Prepare Json From to Registry for validate 
        Replace string to create file
          log   ${index}
        END
Prepare Data TEST And create file ${number} Json Valid Format mule_account_type is ${m_acc_type}
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
...                    WHERE RULE_MAXX IN (1,2)
...          GROUP BY PERSONAL_ID, ACCOUNT_NUMBER, BANK_CODE) data 
...    JOIN FRAUD_REF_CODE_MULE MULE ON data.PERSONAL_ID = MULE.PERSONAL_ID 
...    JOIN FRAUD_ACCOUNT FA ON data.PERSONAL_ID = FA.PERSONAL_ID
...    FETCH FIRST ${number} ROWS ONLY
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
        set test variable   ${mule_account_type}   ${m_acc_type}
        Prepare Json From to Registry for validate 
        Replace string to create file
          log   ${index}
        END
Prepare Data TEST And create file ${number} Json Valid Format mule_account_bankcode is ${m_acc_bank}
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
...                    WHERE RULE_MAXX IN (1,2)
...          GROUP BY PERSONAL_ID, ACCOUNT_NUMBER, BANK_CODE) data 
...    JOIN FRAUD_REF_CODE_MULE MULE ON data.PERSONAL_ID = MULE.PERSONAL_ID 
...    JOIN FRAUD_ACCOUNT FA ON data.PERSONAL_ID = FA.PERSONAL_ID
...    FETCH FIRST ${number} ROWS ONLY
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
        set test variable   ${mule_account_bankcode}   ${m_acc_bank}
        Prepare Json From to Registry for validate 
        Replace string to create file
          log   ${index}
        END
Prepare Data TEST And create file ${number} Json Valid Format mule_account_bankname is ${m_acc_name}
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
...                    WHERE RULE_MAXX IN (1,2)
...          GROUP BY PERSONAL_ID, ACCOUNT_NUMBER, BANK_CODE) data 
...    JOIN FRAUD_REF_CODE_MULE MULE ON data.PERSONAL_ID = MULE.PERSONAL_ID 
...    JOIN FRAUD_ACCOUNT FA ON data.PERSONAL_ID = FA.PERSONAL_ID
...    FETCH FIRST ${number} ROWS ONLY
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
        set test variable   ${mule_account_bankname}   ${m_acc_name}
        Prepare Json From to Registry for validate 
        Replace string to create file
          log   ${index}
        END
Prepare Data TEST And create file ${number} Json Valid Format police_rank is ${p_rank}
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
...                    WHERE RULE_MAXX IN (1,2)
...          GROUP BY PERSONAL_ID, ACCOUNT_NUMBER, BANK_CODE) data 
...    JOIN FRAUD_REF_CODE_MULE MULE ON data.PERSONAL_ID = MULE.PERSONAL_ID 
...    JOIN FRAUD_ACCOUNT FA ON data.PERSONAL_ID = FA.PERSONAL_ID
...    FETCH FIRST ${number} ROWS ONLY
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
        set test variable   ${police_rank}   ${p_rank}
        Prepare Json From to Registry for validate 
        Replace string to create file
          log   ${index}
        END
Prepare Data TEST And create file ${number} Json Valid Format police_surename is ${p_surename}
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
...                    WHERE RULE_MAXX IN (1,2)
...          GROUP BY PERSONAL_ID, ACCOUNT_NUMBER, BANK_CODE) data 
...    JOIN FRAUD_REF_CODE_MULE MULE ON data.PERSONAL_ID = MULE.PERSONAL_ID 
...    JOIN FRAUD_ACCOUNT FA ON data.PERSONAL_ID = FA.PERSONAL_ID
...    FETCH FIRST ${number} ROWS ONLY
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
        set test variable   ${police_surname}   ${p_surename}
        Prepare Json From to Registry for validate 
        Replace string to create file
          log   ${index}
        END
Prepare Data TEST And create file ${number} Json Valid Format police_org is ${p_o}
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
...                    WHERE RULE_MAXX IN (1,2)
...          GROUP BY PERSONAL_ID, ACCOUNT_NUMBER, BANK_CODE) data 
...    JOIN FRAUD_REF_CODE_MULE MULE ON data.PERSONAL_ID = MULE.PERSONAL_ID 
...    JOIN FRAUD_ACCOUNT FA ON data.PERSONAL_ID = FA.PERSONAL_ID
...    FETCH FIRST ${number} ROWS ONLY
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
        set test variable   ${police_org}   ${p_o}
        Prepare Json From to Registry for validate 
        Replace string to create file
          log   ${index}
        END
Prepare Data TEST And create file ${number} Json Valid Format police_job_title is ${p_Job}
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
...                    WHERE RULE_MAXX IN (1,2)
...          GROUP BY PERSONAL_ID, ACCOUNT_NUMBER, BANK_CODE) data 
...    JOIN FRAUD_REF_CODE_MULE MULE ON data.PERSONAL_ID = MULE.PERSONAL_ID 
...    JOIN FRAUD_ACCOUNT FA ON data.PERSONAL_ID = FA.PERSONAL_ID
...    FETCH FIRST ${number} ROWS ONLY
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
        set test variable   ${police_job_title}   ${p_Job}
        Prepare Json From to Registry for validate 
        Replace string to create file
          log   ${index}
        END
Prepare Data TEST And create file ${number} Json Valid Format police_email is ${p_email}
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
...                    WHERE RULE_MAXX IN (1,2)
...          GROUP BY PERSONAL_ID, ACCOUNT_NUMBER, BANK_CODE) data 
...    JOIN FRAUD_REF_CODE_MULE MULE ON data.PERSONAL_ID = MULE.PERSONAL_ID 
...    JOIN FRAUD_ACCOUNT FA ON data.PERSONAL_ID = FA.PERSONAL_ID
...    FETCH FIRST ${number} ROWS ONLY
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
        set test variable   ${police_email}   ${p_email}
        Prepare Json From to Registry for validate 
        Replace string to create file
          log   ${index}
        END
Prepare Data TEST And create file ${number} Json Valid Format declare_reason_code is ${d_reason_c}
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
...                    WHERE RULE_MAXX IN (1,2)
...          GROUP BY PERSONAL_ID, ACCOUNT_NUMBER, BANK_CODE) data 
...    JOIN FRAUD_REF_CODE_MULE MULE ON data.PERSONAL_ID = MULE.PERSONAL_ID 
...    JOIN FRAUD_ACCOUNT FA ON data.PERSONAL_ID = FA.PERSONAL_ID
...    FETCH FIRST ${number} ROWS ONLY
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
        set test variable   ${declare_reason_code}   ${d_reason_c}
        Prepare Json From to Registry for validate 
        Replace string to create file
          log   ${index}
        END
Prepare Data TEST And create file ${number} Json Valid Format declare_reason is ${d_reason}
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
...                    WHERE RULE_MAXX IN (1,2)
...          GROUP BY PERSONAL_ID, ACCOUNT_NUMBER, BANK_CODE) data 
...    JOIN FRAUD_REF_CODE_MULE MULE ON data.PERSONAL_ID = MULE.PERSONAL_ID 
...    JOIN FRAUD_ACCOUNT FA ON data.PERSONAL_ID = FA.PERSONAL_ID
...    FETCH FIRST ${number} ROWS ONLY
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
        set test variable   ${declare_reason}   ${d_reason}
        Prepare Json From to Registry for validate 
        Replace string to create file
          log   ${index}
        END
Prepare Data TEST And create file ${number} Json Valid Format police_name is ${p_name}
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
...                    WHERE RULE_MAXX IN (1,2)
...          GROUP BY PERSONAL_ID, ACCOUNT_NUMBER, BANK_CODE) data 
...    JOIN FRAUD_REF_CODE_MULE MULE ON data.PERSONAL_ID = MULE.PERSONAL_ID 
...    JOIN FRAUD_ACCOUNT FA ON data.PERSONAL_ID = FA.PERSONAL_ID
...    FETCH FIRST ${number} ROWS ONLY
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
        set test variable   ${police_name}   ${p_name}
        Prepare Json From to Registry for validate 
        Replace string to create file
          log   ${index}
        END
Prepare Data TEST And create file ${number} Json Valid Format mule_surename is ${last}
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
...                    WHERE RULE_MAXX IN (1,2)
...          GROUP BY PERSONAL_ID, ACCOUNT_NUMBER, BANK_CODE) data 
...    JOIN FRAUD_REF_CODE_MULE MULE ON data.PERSONAL_ID = MULE.PERSONAL_ID 
...    JOIN FRAUD_ACCOUNT FA ON data.PERSONAL_ID = FA.PERSONAL_ID
...    FETCH FIRST ${number} ROWS ONLY
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
        set test variable   ${last_name}   ${last}
        Prepare Json From to Registry for validate 
        Replace string to create file
          log   ${index}
        END
Prepare Data TEST And create file ${number} Json Valid Format mule_title is ${title}
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
...                    WHERE RULE_MAXX IN (1,2)
...          GROUP BY PERSONAL_ID, ACCOUNT_NUMBER, BANK_CODE) data 
...    JOIN FRAUD_REF_CODE_MULE MULE ON data.PERSONAL_ID = MULE.PERSONAL_ID 
...    JOIN FRAUD_ACCOUNT FA ON data.PERSONAL_ID = FA.PERSONAL_ID
...    FETCH FIRST ${number} ROWS ONLY
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
        set test variable   ${mule_title}   ${title}
        Prepare Json From to Registry for validate 
        Replace string to create file
          log   ${index}
        END
Prepare Data TEST And create file ${number} Json Valid Format mule_birth_date is ${b_date}
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
...                    WHERE RULE_MAXX IN (1,2)
...          GROUP BY PERSONAL_ID, ACCOUNT_NUMBER, BANK_CODE) data 
...    JOIN FRAUD_REF_CODE_MULE MULE ON data.PERSONAL_ID = MULE.PERSONAL_ID 
...    JOIN FRAUD_ACCOUNT FA ON data.PERSONAL_ID = FA.PERSONAL_ID
...    FETCH FIRST ${number} ROWS ONLY
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
        set test variable   ${mule_birth_date}   ${b_date}
        Prepare Json From to Registry for validate 
        Replace string to create file
          log   ${index}
        END
Prepare Data TEST And create file ${number} Json Valid Format mule_nationality is ${m_nation}
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
...                    WHERE RULE_MAXX IN (1,2)
...          GROUP BY PERSONAL_ID, ACCOUNT_NUMBER, BANK_CODE) data 
...    JOIN FRAUD_REF_CODE_MULE MULE ON data.PERSONAL_ID = MULE.PERSONAL_ID 
...    JOIN FRAUD_ACCOUNT FA ON data.PERSONAL_ID = FA.PERSONAL_ID
...    FETCH FIRST ${number} ROWS ONLY
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
        set test variable   ${mule_nationality}   ${m_nation}
        Prepare Json From to Registry for validate 
        Replace string to create file
          log   ${index}
        END
Prepare Data TEST And create file ${number} Json Valid Format mule_identity_id is ${mule_iden_id}
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
...                    WHERE RULE_MAXX IN (1,2)
...          GROUP BY PERSONAL_ID, ACCOUNT_NUMBER, BANK_CODE) data 
...    JOIN FRAUD_REF_CODE_MULE MULE ON data.PERSONAL_ID = MULE.PERSONAL_ID 
...    JOIN FRAUD_ACCOUNT FA ON data.PERSONAL_ID = FA.PERSONAL_ID
...    FETCH FIRST ${number} ROWS ONLY
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
        set test variable   ${personal_id}   ${mule_iden_id}
        Prepare Json From to Registry for validate 
        Replace string to create file
          log   ${index}
        END
Prepare Data TEST And create file Json Valid Format mule_identity_id is 35digis and mule_identity_type is ${mule_idn_type}
    ${REQ_data_list_to_check}   Create List
    ${BANK_CASE_ID}   Create List
    Set Test Variable    ${REQ_data_list_to_check}
    Set Test Variable    ${BANK_CASE_ID}
    Connect To CFR Database
    ${sql}=   Catenate     SELECT DISTINCT FA.PERSONAL_ID, FA.ACCOUNT_NUMBER, REF_CODE, STATUS, FA.FIRST_NAME, FA.LAST_NAME
...    FROM FRAUD_ACCOUNT FA
...    JOIN FRAUD_PERSON FP ON FA.PERSONAL_ID = FP.PERSONAL_ID AND FP.FRAUD_LEVEL = 2
...    JOIN FRAUD_ACCOUNT_REPORT FAR ON FAR.ACCOUNT_ID = FA.ID
...    JOIN FRAUD_REF_CODE_MAPPING FRCM ON FRCM.REPORT_CYCLE_ID = FAR.CYCLE_ID AND FA.PERSONAL_ID = FRCM.PERSONAL_ID
...    JOIN FRAUD_REF_CODE_MULE FRCMULE ON FRCMULE.REF_CODE_ID = FRCM.REF_CODE_ID AND FRCMULE.STATUS = 1
...    LEFT JOIN AOC_WITHDRAW_MULE_REPO AWMR ON MULE_IDENTITY_ID = FA.PERSONAL_ID
...    WHERE FA.IS_ACTIVE = 1
...    AND FA.ACCOUNT_TYPE = 'ชาวต่างชาติ'
...    AND FAR.RULE_ID = '1'
# ...    AND AWMR.ID IS NULL
...    ORDER BY FRCMULE.REF_CODE
...    FETCH FIRST 1 ROWS ONLY
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
        ${PERSONAL_ID_LENGTH}=   Get Length    ${PERSONAL_ID}
        IF    ${PERSONAL_ID_LENGTH} == 35
            Log    PERSONAL_ID is valid with length: ${PERSONAL_ID_LENGTH}
            Set Test Variable    ${PERSONAL_ID}
            Set Test Variable    ${FIRST_NAME}
            Set Test Variable    ${LAST_NAME}
            Set Test Variable    ${REF_CODE}
        ELSE
            Log    PERSONAL_ID is invalid with length: ${PERSONAL_ID_LENGTH}
        END
            set test variable   ${personal_id}    ${PERSONAL_ID}
            set test variable   ${first_name}    ${FIRST_NAME}
            set test variable   ${last_name}    ${LAST_NAME}
            set test variable   ${ref_code}    ${REF_CODE}
            warrantDate 'Local'
            Set Data From Json for Validate
            set test variable   ${mule_identity_type}   ${mule_idn_type}
            Prepare Json From to Registry for validate 
            Replace string to create file
            log   ${index}
    END
Prepare Data TEST And create file ${number} Json Valid Format mule_identity_id is ${mule_iden_id} and mule_ref_code is ${FIX_REF_CODE}
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
...                    WHERE RULE_MAXX IN (1,2)
...          GROUP BY PERSONAL_ID, ACCOUNT_NUMBER, BANK_CODE) data 
...    JOIN FRAUD_REF_CODE_MULE MULE ON data.PERSONAL_ID = MULE.PERSONAL_ID 
...    JOIN FRAUD_ACCOUNT FA ON data.PERSONAL_ID = FA.PERSONAL_ID
...    FETCH FIRST ${number} ROWS ONLY
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
        # set test variable   ${personal_id}   ${mule_iden_id}
        set test variable   ${ref_code}    ${FIX_REF_CODE}
        Prepare Json From to Registry for validate 
        Replace string to create file
          log   ${index}
        END
Prepare Data TEST And create file ${number} Json Valid Format declare_uuid is ${uuid} and mule_ref_code is ${FIX_REF_CODE}
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
...                    WHERE RULE_MAXX IN (1,2)
...          GROUP BY PERSONAL_ID, ACCOUNT_NUMBER, BANK_CODE) data 
...    JOIN FRAUD_REF_CODE_MULE MULE ON data.PERSONAL_ID = MULE.PERSONAL_ID 
...    JOIN FRAUD_ACCOUNT FA ON data.PERSONAL_ID = FA.PERSONAL_ID
...    FETCH FIRST ${number} ROWS ONLY
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
        set test variable   ${ref_code}    ${FIX_REF_CODE}
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
       ${sql}=   catenate     SELECT DISTINCT data.PERSONAL_ID, data.ACCOUNT_NUMBER, REF_CODE, STATUS, FA.FIRST_NAME, FA.LAST_NAME 
...    FROM (SELECT PERSONAL_ID, ACCOUNT_NUMBER, BANK_CODE, MAX(RULE_MAXX) AS RULE_MAX 
...          FROM (SELECT FA.PERSONAL_ID, FA.ACCOUNT_NUMBER, BANK_CODE, MIN(RULE_ID) AS RULE_MAXX 
...                FROM FRAUD_PERSON FP 
...                JOIN FRAUD_ACCOUNT FA ON FP.PERSONAL_ID = FA.PERSONAL_ID 
...                JOIN FRAUD_ACCOUNT_APPLY_FRAUD_RULE FAAFR ON FA.ID = FAAFR.ACCOUNT_ID 
...                WHERE FP.FRAUD_LEVEL = '2' AND FA.IS_ACTIVE = '1' 
...                GROUP BY ACCOUNT_NUMBER, FA.PERSONAL_ID, BANK_CODE) 
...                    WHERE RULE_MAXX IN (1,2)
...          GROUP BY PERSONAL_ID, ACCOUNT_NUMBER, BANK_CODE) data 
...    JOIN FRAUD_REF_CODE_MULE MULE ON data.PERSONAL_ID = MULE.PERSONAL_ID 
...    JOIN FRAUD_ACCOUNT FA ON data.PERSONAL_ID = FA.PERSONAL_ID
...    FETCH FIRST ${number} ROWS ONLY
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
       ${sql}=   catenate     SELECT DISTINCT data.PERSONAL_ID, data.ACCOUNT_NUMBER, REF_CODE, STATUS, FA.FIRST_NAME, FA.LAST_NAME 
...    FROM (SELECT PERSONAL_ID, ACCOUNT_NUMBER, BANK_CODE, MAX(RULE_MAXX) AS RULE_MAX 
...          FROM (SELECT FA.PERSONAL_ID, FA.ACCOUNT_NUMBER, BANK_CODE, MIN(RULE_ID) AS RULE_MAXX 
...                FROM FRAUD_PERSON FP 
...                JOIN FRAUD_ACCOUNT FA ON FP.PERSONAL_ID = FA.PERSONAL_ID 
...                JOIN FRAUD_ACCOUNT_APPLY_FRAUD_RULE FAAFR ON FA.ID = FAAFR.ACCOUNT_ID 
...                WHERE FP.FRAUD_LEVEL = '2' AND FA.IS_ACTIVE = '1' 
...                GROUP BY ACCOUNT_NUMBER, FA.PERSONAL_ID, BANK_CODE) 
...                    WHERE RULE_MAXX IN (1,2)
...          GROUP BY PERSONAL_ID, ACCOUNT_NUMBER, BANK_CODE) data 
...    JOIN FRAUD_REF_CODE_MULE MULE ON data.PERSONAL_ID = MULE.PERSONAL_ID 
...    JOIN FRAUD_ACCOUNT FA ON data.PERSONAL_ID = FA.PERSONAL_ID
...    FETCH FIRST ${number} ROWS ONLY
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
Prepare Data TEST And create file ${number} Json And Mule is ${coler_number} is level number is true ${rule_number}
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
...                WHERE FP.FRAUD_LEVEL = '${coler_number}' AND FA.IS_ACTIVE = '1' 
...                GROUP BY ACCOUNT_NUMBER, FA.PERSONAL_ID, BANK_CODE) 
...          WHERE RULE_MAXX = '${rule_number}' 
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
        Set Data From Json for Validate
        set test variable   ${ref_code}   ${fix_ref_code}
        Prepare Json From to Registry for validate 
        Replace string to create file
          log   ${index}
        END
Prepare Data TEST And create file ${number} Json Valid Condition declare_date is ${choose} is ${date_number} days
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
...                    WHERE RULE_MAXX IN (1,2)
...          GROUP BY PERSONAL_ID, ACCOUNT_NUMBER, BANK_CODE) data 
...    JOIN FRAUD_REF_CODE_MULE MULE ON data.PERSONAL_ID = MULE.PERSONAL_ID 
...    JOIN FRAUD_ACCOUNT FA ON data.PERSONAL_ID = FA.PERSONAL_ID
...    FETCH FIRST ${number} ROWS ONLY
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
        choose get date ${choose} is ${date_number} days
        Set Data From Json for Validate
        Prepare Json From to Registry for validate 
        Replace string to create file
          log   ${index}
        END
Prepare Data TEST And create file ${number} Json Missing required field ${parameter}
    ${REQ_data_list_to_check}   create list
    ${BANK_CASE_ID}   create list
    set test variable    ${REQ_data_list_to_check}
    set test variable    ${BANK_CASE_ID}
        connect to cfr database
    ${SQL}=    Catenate
...    SELECT DISTINCT FA.PERSONAL_ID, FA.ACCOUNT_NUMBER, REF_CODE, STATUS, FA.FIRST_NAME, FA.LAST_NAME
...    FROM FRAUD_ACCOUNT FA
...    JOIN FRAUD_PERSON FP ON FA.PERSONAL_ID = FP.PERSONAL_ID AND FP.FRAUD_LEVEL = 2
...    JOIN FRAUD_ACCOUNT_REPORT FAR ON FAR.ACCOUNT_ID = FA.ID
...    JOIN FRAUD_REF_CODE_MAPPING FRCM ON FRCM.REPORT_CYCLE_ID = FAR.CYCLE_ID AND FA.PERSONAL_ID = FRCM.PERSONAL_ID
...    JOIN FRAUD_REF_CODE_MULE FRCMULE ON FRCMULE.REF_CODE_ID = FRCM.REF_CODE_ID AND FRCMULE.STATUS = 1
...    LEFT JOIN AOC_WITHDRAW_MULE_REPO AWMR ON MULE_IDENTITY_ID = FA.PERSONAL_ID
...    WHERE FA.IS_ACTIVE = 1
# ...    AND AWMR.ID IS NULL
...    ORDER BY FRCMULE.REF_CODE
...     FETCH FIRST ${number} ROWS ONLY
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
        Prepare Json From to Registry for validate Missing Filde ${parameter}
        Replace string to create file
          log   ${index}
        END
check query for runing number
     Connect To CFR Database
    WHILE    ${True}
     ${running_number}=    random_number_400_600
        ${sql}=    Catenate
        ...    SELECT COUNT(*) FROM AOC_SFTP_WITHDRAW_MULE_REQUEST_FILE_INFO aswmrfi 
        ...    WHERE TRUNC(CREATE_DATETIME) = TO_DATE('${filenameDateTime_eng_v1}','YYYY-MM-DD') 
        ...    AND FILE_NAME LIKE 'CFR_WithdrawMule_${filenameDateTime}_${running_number}_REQ.gpg'
        ${query}=    Query All    ${db_connect}    ${sql}
        ${result_dict}=    Get From List    ${query}    0
        ${file_count}=    Get From Dictionary    ${result_dict}    COUNT(*)
        Log    File count: ${file_count}
        Run Keyword If    '${file_count}' == '0'    Exit For Loop
    END
    Set Test Variable    ${running_number}
create File Name WithdrawMule
     get current datetime
    #  ${running_number}=    random_number_warrant   3
    check query for runing number
     ${directory}=     set variable     CFR_WithdrawMule_${filenameDateTime}_${running_number}_REQ
     ${Response_warrant_H}=     set variable     CFR_WithdrawMule_${filenameDateTime}_${running_number}_RES
     set test variable        ${directory}
     set test variable      ${FileName_Warrant}      ${directory}
     set test variable      ${Response_warrant_H}
create File Name WithdrawMule Duplicate file 
     get current datetime
    #  ${running_number}=    random_number_warrant   3
     ${directory}=     set variable     CFR_WithdrawMule_${filenameDateTime}_099_REQ
     ${Response_warrant_H}=     set variable     CFR_WithdrawMule_${filenameDateTime}_099_RES
     set test variable        ${directory}
     set test variable      ${FileName_Warrant}      ${directory}
     set test variable      ${Response_warrant_H}

create File Name WithdrawMule validate filenamedatetime is ${filenameDateTime}
    Set Test Variable    ${filenameDateTime}
    #  get current datetime
     ${running_number}=    random_number_warrant   3
     ${directory}=     set variable     CFR_WithdrawMule_${filenameDateTime}_${running_number}_REQ
     ${Response_warrant_H}=     set variable     CFR_WithdrawMule_${filenameDateTime}_${running_number}_RES
     set test variable        ${directory}
     set test variable      ${FileName_Warrant}      ${directory}
     set test variable      ${Response_warrant_H}
create File Name WithdrawMule validate file name is ${filename} and runing number is ${runnumber} and validate format ${REQ} and ${RES}
     get current datetime
     ${running_number}=    random_number_warrant   ${runnumber}
     ${directory}=     set variable     ${filename}_${filenameDateTime}_${running_number}_${REQ}
     ${Response_warrant_H}=     set variable     ${filename}_${filenameDateTime}_${running_number}_${RES}
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
Prepare Json From to Registry no value mule_account_bankname
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
    ...                        "mule_account_bankname": ""
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
     Log To Console    ${json_string}
     ${encoded_data}=   Encode String To Bytes    ${json_string}    encoding=UTF-8
     Set Test Variable     ${encoded_data}
Prepare Json From to Registry no parameter mule_account_bankname
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
     Log To Console    ${json_string}
     ${encoded_data}=   Encode String To Bytes    ${json_string}    encoding=UTF-8
     Set Test Variable     ${encoded_data}

Prepare Json From to Registry no body
    [Documentation]    Test Case SUBMIT
    ${json_string}=    Catenate    SEPARATOR=\n
    ...    [
    ...    ]
     Set Test Variable  ${json_string}
     ${json_string}=    Evaluate    json.dumps(${json_string}, ensure_ascii=False, indent=4)    json
    #  Log To Console    ${json_string}
     ${encoded_data}=   Encode String To Bytes    ${json_string}    encoding=UTF-8
     Set Test Variable     ${encoded_data}
     
Prepare Data TEST And create file Json no body
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
...          # ...          WHERE RULE_MAXX IN (1,2)
...          WHERE RULE_MAXX IN (1) 
...          GROUP BY PERSONAL_ID, ACCOUNT_NUMBER, BANK_CODE) data 
...    JOIN FRAUD_REF_CODE_MULE MULE ON data.PERSONAL_ID = MULE.PERSONAL_ID 
...    JOIN FRAUD_ACCOUNT FA ON data.PERSONAL_ID = FA.PERSONAL_ID FETCH FIRST 1 ROWS ONLY
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
        Prepare Json From to Registry no body
        Replace string to create file
          log   ${index}
        END
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
Prepare Json From to Registry for validate Missing Filde ${parameter}
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
    # Log    ${json_string}
    Set Test Variable  ${json_string}
    IF  '${parameter}' == 'missing_declare_uuid'    
    ${json_string}  Replace String    ${json_string}    "declare_uuid": "${declare_uuid}",    ${EMPTY}
    ELSE IF  '${parameter}' == 'missing_field_declare_uuid'
    ${json_string}  Replace String    ${json_string}    "${declare_uuid}",    "",
    ELSE IF  '${parameter}' == 'missing_declare_type_code'
    ${json_string}  Replace String    ${json_string}    "declare_type_code": "${declare_type_code}",    ${EMPTY}
    ELSE IF  '${parameter}' == 'missing_field_declare_type_code'
    ${json_string}  Replace String    ${json_string}    "${declare_type_code}",    "",
    ELSE IF  '${parameter}' == 'missing_declare_type'
    ${json_string}  Replace String    ${json_string}    "declare_type": "${declare_type}",    ${EMPTY}
    ELSE IF  '${parameter}' == 'missing_field_declare_type'
    ${json_string}  Replace String    ${json_string}    "${declare_type}",    "",
    ELSE IF  '${parameter}' == 'missing_declare_date'
    ${json_string}  Replace String    ${json_string}    "declare_date": "${declare_date}",    ${EMPTY}
    ELSE IF  '${parameter}' == 'missing_field_declare_date'
    ${json_string}  Replace String    ${json_string}    "${declare_date}",    "",
    ELSE IF  '${parameter}' == 'missing_declare_reason_code'
    ${json_string}  Replace String    ${json_string}    "declare_reason_code": "${declare_reason_code}",    ${EMPTY}
    ELSE IF  '${parameter}' == 'missing_field_declare_reason_code'
    ${json_string}  Replace String    ${json_string}    "${declare_reason_code}",   "",
    ELSE IF  '${parameter}' == 'missing_declare_reason'
    ${json_string}  Replace String    ${json_string}    "declare_reason": "${declare_reason}",    ${EMPTY}
    ELSE IF  '${parameter}' == 'missing_field_declare_reason'
    ${json_string}  Replace String    ${json_string}    "${declare_reason}",   "",
    ELSE IF  '${parameter}' == 'missing_declare_note'
    ${json_string}  Replace String    ${json_string}    "declare_note": "${declare_note}",    ${EMPTY}
    ELSE IF  '${parameter}' == 'missing_field_declare_note'
    ${json_string}  Replace String    ${json_string}    "${declare_note}",   "",
    ELSE IF  '${parameter}' == 'missing_mule_ref_code'
    ${json_string}  Replace String    ${json_string}    "mule_ref_code": "${mule_ref_code}",    ${EMPTY}
    ELSE IF  '${parameter}' == 'missing_field_mule_ref_code'
    ${json_string}  Replace String    ${json_string}    "${mule_ref_code}",   "",
    ELSE IF  '${parameter}' == 'missing_mule_identity_id'
    ${json_string}  Replace String    ${json_string}    "mule_identity_id": "${personal_id}",    ${EMPTY}
    ELSE IF  '${parameter}' == 'missing_field_mule_identity_id'
    ${json_string}  Replace String    ${json_string}    "${personal_id}",   "",
    ELSE IF  '${parameter}' == 'missing_mule_identity_type'
    ${json_string}  Replace String    ${json_string}    "mule_identity_type": "${mule_identity_type}",    ${EMPTY}
    ELSE IF  '${parameter}' == 'missing_field_mule_identity_type'
    ${json_string}  Replace String    ${json_string}    "${mule_identity_type}",    "",
    ELSE IF  '${parameter}' == 'missing_mule_title'
    ${json_string}  Replace String    ${json_string}    "mule_title": "${mule_title}",    ${EMPTY}
    ELSE IF  '${parameter}' == 'missing_field_mule_title'
    ${json_string}  Replace String    ${json_string}    "${mule_title}",    "",
    ELSE IF  '${parameter}' == 'missing_mule_name'
    ${json_string}  Replace String    ${json_string}    "mule_name": "${first_name}",    ${EMPTY}
    ELSE IF  '${parameter}' == 'missing_field_mule_name'
    ${json_string}  Replace String    ${json_string}    "${first_name}",   "",
    ELSE IF  '${parameter}' == 'missing_mule_surnname'
    ${json_string}  Replace String    ${json_string}    "mule_surname": "${last_name}",    ${EMPTY}
    ELSE IF  '${parameter}' == 'missing_field_mule_surnname'
    # ${json_string}  Set To Dictionary    ${json_string}    "${last_name}"    "",
    ${json_string}  Replace String    ${json_string}    "mule_surname": "${last_name}",    "mule_surname": "",
    ELSE IF  '${parameter}' == 'missing_mule_birth_date'
    ${json_string}  Replace String    ${json_string}    "mule_birth_date": "${mule_birth_date}",    ${EMPTY}
    ELSE IF  '${parameter}' == 'missing_field_mule_birth_date'
    ${json_string}  Replace String    ${json_string}    "${mule_birth_date}",    "",
    ELSE IF  '${parameter}' == 'missing_mule_nationality'
    ${json_string}  Replace String    ${json_string}    "mule_nationality": "${mule_nationality}",    ${EMPTY}
    ELSE IF  '${parameter}' == 'missing_field_mule_nationality'
    ${json_string}  Replace String    ${json_string}    "${mule_nationality}",    "",
    ELSE IF  '${parameter}' == 'missing_police_case_id'
    ${json_string}  Replace String    ${json_string}    "police_case_id": "${police_case_id}",    ${EMPTY}
    ELSE IF  '${parameter}' == 'missing_police_case_type'
    ${json_string}  Replace String    ${json_string}    "police_case_type": "${police_case_type}",    ${EMPTY}
    ELSE IF  '${parameter}' == 'missing_field_police_case_id'
    ${json_string}  Replace String    ${json_string}    "${police_case_id}",   "",
    ELSE IF  '${parameter}' == 'missing_police_case_report_date'
    ${json_string}  Replace String    ${json_string}    "police_case_report_date": "${police_case_report_date}",    ${EMPTY}
    ELSE IF  '${parameter}' == 'missing_field_police_case_report_date'
    ${json_string}  Replace String    ${json_string}    "${police_case_report_date}",   "",
    ELSE IF  '${parameter}' == 'missing_mule_account_no'
    ${json_string}  Replace String    ${json_string}    "mule_account_no": "${mule_account_no}",    ${EMPTY}
    ELSE IF  '${parameter}' == 'missing_field_mule_account_no'
    ${json_string}  Replace String    ${json_string}    "${mule_account_no}",    "",
    ELSE IF  '${parameter}' == 'missing_mule_account_type'
    ${json_string}  Replace String    ${json_string}    "mule_account_type": "${mule_account_type}",    ${EMPTY}
    ELSE IF  '${parameter}' == 'missing_field_mule_account_type'
    ${json_string}  Replace String    ${json_string}    "${mule_account_type}",    "",
    ELSE IF  '${parameter}' == 'is_missing_mule_account_bank'
    ${json_string}  Replace String    ${json_string}    "mule_account_bankcode": "${mule_account_bankcode}",    ${EMPTY}
    ELSE IF  '${parameter}' == 'is_missing_field_mule_account_bank' 
    ${json_string}  Replace String    ${json_string}    "${mule_account_bankcode}",    "",
    ELSE IF  '${parameter}' == 'missing_mule_account_bankname'
    ${json_string}  Replace String    ${json_string}    "mule_account_bankname": "${mule_account_bankname}",    ${EMPTY}
    ELSE IF  '${parameter}' == 'missing_field_mule_account_bankname'
    ${json_string}  Replace String    ${json_string}    "${mule_account_bankname}",   "",
    ELSE IF  '${parameter}' == 'missing_police_rank'
    ${json_string}  Replace String    ${json_string}    "police_rank": "${police_rank}",    ${EMPTY}
    ELSE IF  '${parameter}' == 'missing_field_police_rank'
    ${json_string}  Replace String    ${json_string}    "${police_rank}",    "",
    ELSE IF  '${parameter}' == 'missing_police_name'
    # ${json_string}  Replace String    ${json_string}    \n"police_name": ${police_name}",    ${EMPTY}
    ${json_string}  Replace String    ${json_string}    "police_name": "${police_name}",    ${EMPTY}
    ELSE IF  '${parameter}' == 'missing_field_police_name'
    ${json_string}  Replace String    ${json_string}    "${police_name}",   "",
    ELSE IF  '${parameter}' == 'missing_police_surname'
    # ${json_string}  Replace String    ${json_string}    "police_surname": ${police_surname}",    ${EMPTY}
    ${json_string}  Replace String    ${json_string}    "police_surname": "${police_surname}",    ${EMPTY}
    ELSE IF  '${parameter}' == 'missing_field_police_surname'
    ${json_string}  Replace String    ${json_string}    "${police_surname}",   "",
    ELSE IF  '${parameter}' == 'missing_police_job_title'
    ${json_string}  Replace String    ${json_string}    "police_job_title": "${police_job_title}",    ${EMPTY}
    ELSE IF  '${parameter}' == 'missing_field_police_job_title'
    ${json_string}  Replace String    ${json_string}    "${police_job_title}",  "",
    ELSE IF  '${parameter}' == 'missing_police_org'
    ${json_string}  Replace String    ${json_string}    "police_org": "${police_org}",    ${EMPTY}
    ELSE IF  '${parameter}' == 'missing_field_police_org'
    ${json_string}  Replace String    ${json_string}    "${police_org}",   "",
    ELSE IF  '${parameter}' == 'missing_police_tel'
    ${json_string}  Replace String    ${json_string}    "police_tel": "${police_tel}",    ${EMPTY}
    ELSE IF  '${parameter}' == 'missing_field_police_tel'
    ${json_string}  Replace String    ${json_string}    "${police_tel}",   "",
    ELSE IF  '${parameter}' == 'missing_police_email'
    ${json_string}  Replace String    ${json_string}    "police_email": "${police_email}"    ${EMPTY}
    ELSE IF  '${parameter}' == 'missing_field_police_email'
    ${json_string}  Replace String    ${json_string}    "${police_email}"   ""
    END
    ${json_string}=    Evaluate    json.dumps(${json_string}, ensure_ascii=False, indent=4)    json
    #  Log To Console    ${json_string}
     Log   ${json_string}
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
Get File GPG Withdraw From ITMX JSON For Duplicate
    ${Response_warrant_H_gpg}=     set variable     ${Response_warrant_H}.gpg
    ${Response_warrant_H_csv}=     set variable     ${Response_warrant_H}.json
    set test variable    ${Response_warrant_H_gpg}
    set test variable    ${Response_warrant_H_csv}
    WHILE    ${RETRY_COUNT} < ${MAX_RETRIES}
    sleep    5s
    #ทำต่อไม่ได้
    ${command}=    Set Variable    ls /home/sftpaoc/${ENVAOC}/cfr/withdraw_mule/outbound/ | grep "${Response_warrant_H}.gpg"
    ${status}=    Run Keyword And Return Status    Execute Command    ${command}
    ${exists}=     Execute Command    ${command}
    log   ${status}
    log   ${exists}
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
Get File GPG Withdraw From ITMX JSON for file name
    ${Response_warrant_H_gpg}=     set variable     ${FileName_Warrant}_RES.gpg
    ${Response_warrant_H_csv}=     set variable     ${FileName_Warrant}_RES.json
    set test variable    ${Response_warrant_H_gpg}
    set test variable    ${Response_warrant_H_csv}
    WHILE    ${RETRY_COUNT} < ${MAX_RETRIES}
    sleep    5s
    ${outbound_exists}=    Run Keyword And Return Status    SSHLibrary.File Should Exist   /home/sftpaoc/${ENVAOC}/cfr/withdraw_mule/outbound/${Response_warrant_H_gpg}
    ${inbound_exists}=    Run Keyword And Return Status    SSHLibrary.File Should Exist   /home/sftpaoc/${ENVAOC}/cfr/withdraw_mule/inbound/archive/${FileName_Warrant}_REQ.gpg
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

Get File GPG Withdraw From ITMX JSON fix surefile
    ${Response_warrant_H_gpg}=     set variable     ${Response_warrant_H}_RES.gpg
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

Check File REQ and RES File Mule Withdraw Positive
        BuiltIn.Sleep   5s
        connect to cfr database
       ${sql}=   catenate      SELECT * FROM AOC_SFTP_WITHDRAW_MULE_REQUEST_FILE_INFO  WHERE FILE_NAME = '${FileName_Warrant}.gpg'
        ${query}=   query_all     ${db_connect}     ${sql}     # query
        ${result}=   set variable    ${query[0]}
        # ID file req info
        ${DB_REQ_ID}=    set variable    ${result}[ID]
        Set Test Variable    ${DB_REQ_ID}
        ${DB_REQ_FILE_NAME}=    set variable    ${result}[FILE_NAME]
        Set Test Variable    ${DB_REQ_FILE_NAME}
        Sleep    5s
       ${sql}=   catenate      SELECT * FROM AOC_SFTP_WITHDRAW_MULE_REQUEST_FILE_DETAIL where FILE_ID = '${DB_REQ_ID}'
        ${query}=   query_all     ${db_connect}     ${sql}     # query
         ${result}=   set variable    ${query[0]}
        ${DB_ID_REQ_DETAIL}=    set variable    ${result}[ID]
        Set Test Variable    ${DB_ID_REQ_DETAIL}
       ${sql}=   catenate      SELECT * FROM AOC_SFTP_WITHDRAW_MULE_RESPONSE_FILE_INFO where REQUEST_FILE_ID = '${DB_REQ_ID}'
        ${query}=   query_all     ${db_connect}     ${sql}     # query
         ${result}=   set variable    ${query[0]}
        ${DB_RES_FILE_NAME}=    set variable    ${result}[RESPONSE_FILE_NAME]
       ${sql}=   catenate      SELECT * FROM AOC_WITHDRAW_MULE_REPO where FILE_DETAIL_ID = '${DB_ID_REQ_DETAIL}'
        ${query}=   query_all     ${db_connect}     ${sql}     # query
         ${result}=   set variable    ${query[0]}
        ${DB_ID_REPO}=    set variable    ${result}[ID]
        Set Test Variable    ${DB_ID_REPO}
       ${sql}=   catenate      SELECT * FROM AOC_WITHDRAW_MULE_POLICE_CASE_DETAIL where REPO_ID = '${DB_ID_REPO}'
        ${query}=   query_all     ${db_connect}     ${sql}     # query
         ${result}=   set variable    ${query[0]}
        ${DB_ID_POLICE_CASE}=    set variable    ${result}[ID]
        Set Test Variable    ${DB_ID_POLICE_CASE}
       ${sql}=   catenate      SELECT * FROM AOC_WITHDRAW_MULE_POLICE_INFO_DETAIL where POLICE_CASE_DETAIL_ID = '${DB_ID_POLICE_CASE}'
        ${query}=   query_all     ${db_connect}     ${sql}     # query
         ${result}=   set variable    ${query[0]}
        ${DB_ID_POLICE_CASE_DETAIL}=    set variable    ${result}[ID]
        Set Test Variable    ${DB_ID_POLICE_CASE_DETAIL}
        Should Be Equal    ${FileName_Warrant}.gpg    ${DB_REQ_FILE_NAME}
        Should Be Equal    ${Response_warrant_H}.gpg    ${DB_RES_FILE_NAME}  
        Deleted DB REQ and RES file Positive
        Remove file Json WithDraw SSH
        Deleted file
Check File REQ and RES File Mule Withdraw Negative
        BuiltIn.Sleep   5s
        connect to cfr database
       ${sql}=   catenate      SELECT * FROM AOC_SFTP_WITHDRAW_MULE_REQUEST_FILE_INFO  WHERE FILE_NAME = '${FileName_Warrant}.gpg'
        ${query}=   query_all     ${db_connect}     ${sql}     # query
        ${result}=   set variable    ${query[0]}
        # ID file req info
        ${DB_REQ_ID}=    set variable    ${result}[ID]
        Set Test Variable    ${DB_REQ_ID}
        ${DB_REQ_FILE_NAME}=    set variable    ${result}[FILE_NAME]
        Set Test Variable    ${DB_REQ_FILE_NAME}
        Sleep    5s
       ${sql}=   catenate      SELECT * FROM AOC_SFTP_WITHDRAW_MULE_REQUEST_FILE_DETAIL where FILE_ID = '${DB_REQ_ID}'
        ${query}=   query_all     ${db_connect}     ${sql}     # query
         ${result}=   set variable    ${query[0]}
        ${DB_ID_REQ_DETAIL}=    set variable    ${result}[ID]
        Set Test Variable    ${DB_ID_REQ_DETAIL}
       ${sql}=   catenate      SELECT * FROM AOC_SFTP_WITHDRAW_MULE_RESPONSE_FILE_INFO where REQUEST_FILE_ID = '${DB_REQ_ID}'
        ${query}=   query_all     ${db_connect}     ${sql}     # query
         ${result}=   set variable    ${query[0]}
        ${DB_RES_FILE_NAME}=    set variable    ${result}[RESPONSE_FILE_NAME]
        Should Be Equal    ${FileName_Warrant}.gpg    ${DB_REQ_FILE_NAME}
        Should Be Equal    ${Response_warrant_H}.gpg    ${DB_RES_FILE_NAME}  
        Deleted DB REQ and RES file Negative
        Remove file Json WithDraw SSH
        Deleted file
Deleted DB REQ and RES file Positive
        Sleep    2s
       ${sql}=   catenate      DELETE FROM AOC_WITHDRAW_MULE_POLICE_INFO_DETAIL where POLICE_CASE_DETAIL_ID = '${DB_ID_POLICE_CASE}'
        ${query}=   update     ${db_connect}     ${sql}     # query
       ${sql}=   catenate      DELETE FROM AOC_WITHDRAW_MULE_POLICE_CASE_DETAIL where REPO_ID = '${DB_ID_REPO}'
        ${query}=   update     ${db_connect}     ${sql}     # query
       ${sql}=   catenate      DELETE FROM AOC_WITHDRAW_MULE_REPO where FILE_DETAIL_ID = '${DB_ID_REQ_DETAIL}'
        ${query}=   update     ${db_connect}     ${sql}
       ${sql}=   catenate      DELETE FROM AOC_SFTP_WITHDRAW_MULE_RESPONSE_FILE_INFO where REQUEST_FILE_ID = '${DB_REQ_ID}'
        ${query}=   update     ${db_connect}     ${sql}
       ${sql}=   catenate      DELETE FROM AOC_SFTP_WITHDRAW_MULE_REQUEST_FILE_DETAIL where FILE_ID = '${DB_REQ_ID}'
        ${query}=   update     ${db_connect}     ${sql}
       ${sql}=   catenate      DELETE FROM AOC_SFTP_WITHDRAW_MULE_REQUEST_FILE_DETAIL where FILE_ID = '${DB_REQ_ID}'
        ${query}=   update     ${db_connect}     ${sql}
       ${sql}=   catenate      DELETE FROM AOC_SFTP_WITHDRAW_MULE_REQUEST_FILE_INFO  WHERE FILE_NAME = '${FileName_Warrant}.gpg'
        ${query}=   update     ${db_connect}     ${sql}
        # Remove file Json WithDraw SSH
Deleted DB REQ and RES file Negative
        Sleep    2s
       ${sql}=   catenate      DELETE FROM AOC_SFTP_WITHDRAW_MULE_RESPONSE_FILE_INFO where REQUEST_FILE_ID = '${DB_REQ_ID}'
        ${query}=   update     ${db_connect}     ${sql}
       ${sql}=   catenate      DELETE FROM AOC_SFTP_WITHDRAW_MULE_REQUEST_FILE_DETAIL where FILE_ID = '${DB_REQ_ID}'
        ${query}=   update     ${db_connect}     ${sql}
       ${sql}=   catenate      DELETE FROM AOC_SFTP_WITHDRAW_MULE_REQUEST_FILE_DETAIL where FILE_ID = '${DB_REQ_ID}'
        ${query}=   update     ${db_connect}     ${sql}
       ${sql}=   catenate      DELETE FROM AOC_SFTP_WITHDRAW_MULE_REQUEST_FILE_INFO  WHERE FILE_NAME = '${FileName_Warrant}.gpg'
        ${query}=   update     ${db_connect}     ${sql}
        # Remove file Json WithDraw SSH
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
Check Response Code ${success} GPG FILE with JSON For Missing Field
    ${json_list}=   Load JSON From File      ${CSV_FILE}    encoding=UTF-8
     Set Test Variable  ${json_list}
     ${res_declareUuid_list}    Get Value From Json    ${json_list}    $[0].declare_uuid
     ${res_declareUuid} =    Get From List   ${res_declareUuid_list}    0
     ${res_code_list}    Get Value From Json    ${json_list}    $[0].code
     ${res_code} =    Get From List   ${res_code_list}    0
     ${res_message_list}    Get Value From Json    ${json_list}    $[0].message
     ${res_message} =    Get From List   ${res_message_list}    0
     ${res_timestamp_list}    Get Value From Json    ${json_list}    $[0].timestamp
     ${res_timestamp} =    Get From List   ${res_timestamp_list}    0
     ${res_declareTypeCode_list}    Get Value From Json    ${json_list}    $[0].declare_type_code
     ${res_declareTypeCode} =    Get From List   ${res_declareTypeCode_list}    0
     ${res_declareType_list}    Get Value From Json    ${json_list}    $[0].declare_type
     ${res_declareType} =    Get From List   ${res_declareType_list}    0
    Should Be Equal As Strings    ${res_code}     ${WithDraw.${success}.code}
    Should Be Equal As Strings    ${res_message}       ${WithDraw.${success}.msg}
    Should Not Be Empty     ${res_timestamp}

choose get date ${choose} is ${date_number} days
    IF  '${choose}' == 'Less'
    get current date Date Less is ${date_number}    
    ELSE IF  '${choose}' == 'More'
    get current date Date More is ${date_number} 
    END

get current date Date Less is ${date_number} 
    ${date}=    Get Current Date
    ${day}=    Add Time To Date    ${date}    -${date_number} days
    ${year}=    Convert Date    ${date}    result_format=%Y
    ${month}=    Convert Date    ${date}    result_format=%m
    ${day}=    Convert Date    ${day}    result_format=%d
    ${thai_year}=     evaluate   ${year}+${543}
    # ${daylater}=    Evaluate    ${day}
    ${datetime}=    set variable    ${thai_year}-${month}-${day}
    set test variable    ${warrant_date}    ${datetime}

get current date Date More is ${date_number} 
    ${date}=    Get Current Date
    ${day}=    Add Time To Date    ${date}    ${date_number} days
    ${year}=    Convert Date    ${date}    result_format=%Y
    ${month}=    Convert Date    ${date}    result_format=%m
    ${day}=    Convert Date    ${day}    result_format=%d
    ${thai_year}=     evaluate   ${year}+${543}
    # ${daylater}=    Evaluate    ${day}
    ${datetime}=    set variable    ${thai_year}-${month}-${day}
    set test variable    ${warrant_date}    ${datetime}
Generate JSON Loop amount is ${count}
    ${json_list}=    Create List
    FOR    ${i}    IN RANGE    ${count}
        ${json_item}=    Catenate    SEPARATOR=\n
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
        ...                "police_case_id": "PC25671030000${i}",
        ...                "police_case_type": "3",
        ...                "police_case_report_date": "2567-10-30",
        ...                "mule_account_detail": [
        ...                    {
        ...                        "mule_account_no": "101110334${i}",
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
        Append To List    ${json_list}    ${json_item}
    END
    ${json_string}=    Catenate    SEPARATOR=\n    [\n${json_list}\n]
    Set Test Variable    ${json_string}    ${json_list} 
    Set Test Variable  ${json_string}
     ${json_string}=    Evaluate    json.dumps(${json_string}, ensure_ascii=False, indent=4)    json
     ${encoded_data}=   Encode String To Bytes    ${json_string}    encoding=UTF-8
     Set Test Variable     ${encoded_data}

Encrypt File GPG To NITMX JSON ${FILE_NAME_CSV} validate file name extenstion is ${filename_j} and validate file name uppercase gpg is ${gpg}
      Set test Variable   ${PRIVATE_KEY_PATH_TO}    ${CURDIR}\\${SECAOC}.sec
      Set test Variable   ${FILEPATH_CSV}    ${CURDIR}\\Data/${FILE_NAME_CSV}.${filename_j}
      set test variable   ${OUT_PATH_GPG}    ${CURDIR}\\Data/${FILE_NAME_CSV}.${gpg}
    ${PRIVATE_KEY_PATH}=  Set Variable   ${PRIVATE_KEY_PATH_TO}
    ${FILEPATH}=  Set Variable  ${FILEPATH_CSV}
    ${input_file}  set variable    ${FILEPATH}
    ${DATA}  set variable    ${FILEPATH}
    ${output_file}  set variable   ${OUT_PATH_GPG}
    ${recipients}   set variable   ${secret_key}
    ${result}=   Sign And Encrypt Json   ${PRIVATE_KEY_PATH}  ${DATA}  ${input_file}  ${output_file}  ${recipients}    ${Pass.AOC}
    ${signature}    ${output_path}=    Set Variable    ${result}
    Log    Signature: ${signature}
    Log    Output Path: ${output_path}
Prepare Data TEST And create file Json no vaule mule_acc_bankname
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
...          # ...          WHERE RULE_MAXX IN (1,2)
...          WHERE RULE_MAXX IN (1)
...          GROUP BY PERSONAL_ID, ACCOUNT_NUMBER, BANK_CODE) data 
...    JOIN FRAUD_REF_CODE_MULE MULE ON data.PERSONAL_ID = MULE.PERSONAL_ID 
...    JOIN FRAUD_ACCOUNT FA ON data.PERSONAL_ID = FA.PERSONAL_ID FETCH FIRST 1 ROWS ONLY
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
        Prepare Json From to Registry no value mule_account_bankname
        Replace string to create file
          log   ${index}
        END
Prepare Data TEST And create file Json no parameter mule_acc_bankname
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
# ...          WHERE RULE_MAXX IN (1,2)
...          WHERE RULE_MAXX IN (1)
...          GROUP BY PERSONAL_ID, ACCOUNT_NUMBER, BANK_CODE) data 
...    JOIN FRAUD_REF_CODE_MULE MULE ON data.PERSONAL_ID = MULE.PERSONAL_ID 
...    JOIN FRAUD_ACCOUNT FA ON data.PERSONAL_ID = FA.PERSONAL_ID FETCH FIRST 1 ROWS ONLY
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
        Prepare Json From to Registry no parameter mule_account_bankname
        Replace string to create file
          log   ${index}
        END
Encrypt File GPG To NITMX JSON ${FILE_NAME_CSV} for file name
      Set test Variable   ${PRIVATE_KEY_PATH_TO}    ${CURDIR}\\${SECAOC}.sec
      Set test Variable   ${FILEPATH_CSV}    ${CURDIR}\\Data/${FILE_NAME_CSV}_REQ.json
      set test variable   ${OUT_PATH_GPG}    ${CURDIR}\\Data/${FILE_NAME_CSV}_REQ.gpg
    ${PRIVATE_KEY_PATH}=  Set Variable   ${PRIVATE_KEY_PATH_TO}
    ${FILEPATH}=  Set Variable  ${FILEPATH_CSV}
    ${input_file}  set variable    ${FILEPATH}
    ${DATA}  set variable    ${FILEPATH}
    ${output_file}  set variable   ${OUT_PATH_GPG}
    ${recipients}   set variable   ${secret_key}
    ${result}=   Sign And Encrypt Json   ${PRIVATE_KEY_PATH}  ${DATA}  ${input_file}  ${output_file}  ${recipients}    ${Pass.AOC}
    ${signature}    ${output_path}=    Set Variable    ${result}
    Log    Signature: ${signature}
    Log    Output Path: ${output_path}
Encrypt File GPG To NITMX JSON ${FILE_NAME_CSV} and validate signature value key ${keyIS} and secret_key is ${SK}
      Set test Variable   ${PRIVATE_KEY_PATH_TO}    ${CURDIR}\\${keyIS}.sec
      Set test Variable   ${FILEPATH_CSV}    ${CURDIR}\\Data/${FILE_NAME_CSV}.json
      set test variable   ${OUT_PATH_GPG}    ${CURDIR}\\Data/${FILE_NAME_CSV}.gpg
    ${PRIVATE_KEY_PATH}=  Set Variable   ${PRIVATE_KEY_PATH_TO}
    ${FILEPATH}=  Set Variable  ${FILEPATH_CSV}
    ${input_file}  set variable    ${FILEPATH}
    ${DATA}  set variable    ${FILEPATH}
    ${output_file}  set variable   ${OUT_PATH_GPG}
    ${recipients}   set variable   ${${SK}}
    ${result}=   Sign And Encrypt Json   ${PRIVATE_KEY_PATH}  ${DATA}  ${input_file}  ${output_file}  ${recipients}    ${Pass.BANK002}
    ${signature}    ${output_path}=    Set Variable    ${result}
    Log    Signature: ${signature}
    Log    Output Path: ${output_path}