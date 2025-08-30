*** Settings ***
Resource  ../resources/imports.robot
# Library    CryptoLibrary    variable_decryption=True    password=myUnhashedPrivateKeyPassword
*** Variables ***
${SLEEP_TIME}      15s
${MAX_RETRIES}     20
${RETRY_COUNT}     0

*** Variables ***
${FILE_PATH}         ${CURDIR}\\..\\resources\\testdata\\dev\\Typez.txt
*** Keywords ***

Check Response Code ${fail} GPG FILE TO ERROR Is ${type}
    ${csv_list}=   Read Csv File To List      ${CSV_FILE}
    ${total_res}=   Get Length   ${csv_list} 
    FOR    ${index}    IN RANGE    1    ${total_res}   
    # FOR   ${index}    IN RANGE     ${total_res}       
          ${data_total}=    Get From List   ${csv_list}    ${index}
          ${data_responcode}=    Get From List   ${data_total}    0
          ${split_data}=    Split String    ${data_responcode}    ;
         ${Warrant_H_Res}=         Get From List    ${split_data}    0
         ${Warrant_Type_H_Res}=        Get From List    ${split_data}    1
         ${Response_H_Res}=         Get From List    ${split_data}    2
        ${Mes_H_Res}=        Get From List    ${split_data}    3
        ${TS_H_Res}=        Get From List    ${split_data}    4
        ${data_total_req}=    Get From List   ${REQ_data_list_to_check}   ${index}
        ${data_responcode_req}=    Get From List   ${data_total_req}    0
        ${split_data_req}=    Split String    ${data_responcode_req}    ;
        ${Warrant_H_REQ}=         Get From List    ${split_data_req}    0
         ${Warrant_Type_H_REQ}=        Get From List    ${split_data_req}    1
    Should Be Equal As Strings    ${Warrant_H_Res}     ${Warrant_H_REQ}
    Should Be Equal As Strings    ${Warrant_Type_H_Res}      ${Warrant_Type_H_REQ}
    Should Be Equal As Strings    ${Response_H_Res}     ${ResHS.${fail}.code}
    Should Be Equal As Strings    ${Mes_H_Res}       ${ResHS.${fail}.msg${type}}
    Should Not Be Empty     ${TS_H_Res}
    log      ${index}
    END

Prepara Data Request CSV is ${row_number} Negatives Test Case warrant_id is ${id_H} invalid format header ${header_warrant_id} ${header_warrant_type} ${header_bankcaseid} ${header_warrant_date} ${header_warrant_time}
    Create Warrant H FILE CSV Edit TO Header ${header_warrant_id} ${header_warrant_type} ${header_bankcaseid} ${header_warrant_date} ${header_warrant_time}
    Get Data MASTER_CASE_ID Number is null ${row_number} and Genarate warrant_id is ${id_H}
Prepara Data Request CSV is ${row_number} Negatives Test Case warrant_id is ${id_H} invalid format Character 
    Create Warrant H FILE CSV change character :
    Get Data MASTER_CASE_ID Number is null ${row_number} and Genarate warrant_id is ${id_H}
Prepara Data Request CSV is ${row_number} Negatives Test Case warrant_id is ${id_H}
    Create Warrant H FILE CSV
    Get Data MASTER_CASE_ID Number is null ${row_number} and Genarate warrant_id is ${id_H}
Prepara Data Request CSV is ${row_number} Negatives Test Case Bankcase_id is ${b_id}
    Create Warrant H FILE CSV
    ${BANK_CASE_ID}   create list
    set test variable    ${BANK_CASE_ID}
        connect to cfr database horse
       ${sql}=   catenate      select distinct FC.MASTER_CASE_ID,POLICE_CASE_NUMBER,SUB_CASE_RANK 
       ...   from CFRAPP.FRAUDCASE FC
    ...    JOIN  BANKFRAUDCASE  BFC on FC.MASTER_CASE_ID = BFC.MASTER_CASE_ID join BANKACCOUNT BA on BFC.ACCOUNT_ID = BA.ID
    ...    join PERSON PS on BA.PERSON_ID = PS.ID
    ...    where POLICE_CASE_NUMBER is null and PS.PERSONAL_ID is not null and BFC.SUB_CASE_POLICE_BLOCK_NUMBER is null
    ...    and BFC.SUB_CASE_POLICE_BLOCK_TYPE is null and BFC.SUB_CASE_RANK = 2
    ...    and CASE_TYPE_ID not in (1) and BA.PROMPTPAY_TYPE not in ('e-wallet')
    ...    and FC.MASTER_CASE_ID not like ('%SUS%') and FC.MASTER_CASE_ID not like ('%BAS%') and FC.MASTER_CASE_ID not like ('%BOA%') and FC.MASTER_CASE_ID not like ('%KBANK%') and FC.MASTER_CASE_ID not like ('%KBANK%') and FC.MASTER_CASE_ID NOT LIKE ('%KBNK%') AND FC.MASTER_CASE_ID NOT LIKE ('%VALID%')  fetch first ${row_number} rows only
        ${query}=   query_all     ${db_connect}     ${sql}     # query
        ${LEN_GENFILE}=  Get Length    ${query}
        FOR    ${index}    IN RANGE    ${LEN_GENFILE}
        set test variable    ${index}
        ${result}=   set variable    ${query[${index}]}
        ${MASTER_CASE_ID}=    set variable    ${result}[MASTER_CASE_ID]
        set test variable   ${MASTER_CASE_ID}    ${b_id}
        get current date WarrantH
        get current TIME WarrantH
        Genarate warrantID random Negative Case'H'
        Create Data add Warrant H
        List data file REQ
        END
Prepara Data Request CSV is ${row_number} Negatives Test Case Body is Invalid 
    Create Warrant H FILE CSV
    ${BANK_CASE_ID}   create list
    set test variable    ${BANK_CASE_ID}
        connect to cfr database horse
       ${sql}=   catenate      select distinct FC.MASTER_CASE_ID,POLICE_CASE_NUMBER,SUB_CASE_RANK 
       ...   from CFRAPP.FRAUDCASE FC
    ...    JOIN  BANKFRAUDCASE  BFC on FC.MASTER_CASE_ID = BFC.MASTER_CASE_ID join BANKACCOUNT BA on BFC.ACCOUNT_ID = BA.ID
    ...    join PERSON PS on BA.PERSON_ID = PS.ID
    ...    where POLICE_CASE_NUMBER is null and PS.PERSONAL_ID is not null and BFC.SUB_CASE_POLICE_BLOCK_NUMBER is null
    ...    and BFC.SUB_CASE_POLICE_BLOCK_TYPE is null and BFC.SUB_CASE_RANK = 2
    ...    and CASE_TYPE_ID not in (1) and BA.PROMPTPAY_TYPE not in ('e-wallet')
    ...    and FC.MASTER_CASE_ID not like ('%SUS%') and FC.MASTER_CASE_ID not like ('%BAS%') and FC.MASTER_CASE_ID not like ('%BOA%') and FC.MASTER_CASE_ID not like ('%KBANK%') fetch first ${row_number} rows only
        ${query}=   query_all     ${db_connect}     ${sql}     # query
        ${LEN_GENFILE}=  Get Length    ${query}
        FOR    ${index}    IN RANGE    ${LEN_GENFILE}
        set test variable    ${index}
        ${result}=   set variable    ${query[${index}]}
        ${MASTER_CASE_ID}=    set variable    ${result}[MASTER_CASE_ID]
        set test variable   ${MASTER_CASE_ID}
        get current date WarrantH
        get current TIME WarrantH
        Genarate warrantID random Negative Case'H'
        Create Data add Warrant H Body is Invlida ,
        List data file REQ
        END
Prepara Data Request CSV is ${row_number} Negatives Test Case Bankcase_id is ${b_id} and set warrant_id old to request file No.2
    Create Warrant H FILE CSV
    ${BANK_CASE_ID}   create list
    set test variable    ${BANK_CASE_ID}
        connect to cfr database horse
       ${sql}=   catenate      select distinct FC.MASTER_CASE_ID,POLICE_CASE_NUMBER,SUB_CASE_RANK 
       ...   from CFRAPP.FRAUDCASE FC
    ...    JOIN  BANKFRAUDCASE  BFC on FC.MASTER_CASE_ID = BFC.MASTER_CASE_ID join BANKACCOUNT BA on BFC.ACCOUNT_ID = BA.ID
    ...    join PERSON PS on BA.PERSON_ID = PS.ID
    ...    where POLICE_CASE_NUMBER is null and PS.PERSONAL_ID is not null and BFC.SUB_CASE_POLICE_BLOCK_NUMBER is null
    ...    and BFC.SUB_CASE_POLICE_BLOCK_TYPE is null and BFC.SUB_CASE_RANK = 2
    ...    and CASE_TYPE_ID not in (1) and BA.PROMPTPAY_TYPE not in ('e-wallet')
    ...    and FC.MASTER_CASE_ID not like ('%SUS%') and FC.MASTER_CASE_ID not like ('%BAS%') and FC.MASTER_CASE_ID not like ('%BOA%') and FC.MASTER_CASE_ID not like ('%KBANK%') fetch first ${row_number} rows only
        ${query}=   query_all     ${db_connect}     ${sql}     # query
        ${LEN_GENFILE}=  Get Length    ${query}
        FOR    ${index}    IN RANGE    ${LEN_GENFILE}
        set test variable    ${index}
        ${result}=   set variable    ${query[${index}]}
        ${MASTER_CASE_ID}=    set variable    ${result}[MASTER_CASE_ID]
        # set test variable   ${MASTER_CASE_ID}    ${b_id}
        get current date WarrantH
        get current TIME WarrantH
        Genarate warrantID random Negative Case'H'
        Set Test Variable   ${warrant_id}    ${warrant_id_old}    
        Create Data add Warrant H
        List data file REQ
        END
Prepara Data Request CSV is ${row_number} Negatives Test Case warrant_type is ${id_H} invalid format warrant_type is ${change_type}
    Create Warrant H FILE CSV
    ${BANK_CASE_ID}   create list
    set test variable    ${BANK_CASE_ID}
        connect to cfr database horse
       ${sql}=   catenate      select distinct FC.MASTER_CASE_ID,POLICE_CASE_NUMBER,SUB_CASE_RANK 
       ...   from CFRAPP.FRAUDCASE FC
    ...    JOIN  BANKFRAUDCASE  BFC on FC.MASTER_CASE_ID = BFC.MASTER_CASE_ID join BANKACCOUNT BA on BFC.ACCOUNT_ID = BA.ID
    ...    join PERSON PS on BA.PERSON_ID = PS.ID
    ...    where POLICE_CASE_NUMBER is null and PS.PERSONAL_ID is not null and BFC.SUB_CASE_POLICE_BLOCK_NUMBER is null
    ...    and BFC.SUB_CASE_POLICE_BLOCK_TYPE is null and BFC.SUB_CASE_RANK = 2
    ...    and CASE_TYPE_ID not in (1) and BA.PROMPTPAY_TYPE not in ('e-wallet')
    ...    and FC.MASTER_CASE_ID not like ('%SUS%') and FC.MASTER_CASE_ID not like ('%BAS%') and FC.MASTER_CASE_ID not like ('%BOA%') and FC.MASTER_CASE_ID not like ('%KBANK%') and FC.MASTER_CASE_ID not like ('%KBANK%') and FC.MASTER_CASE_ID NOT LIKE ('%KBNK%') AND FC.MASTER_CASE_ID NOT LIKE ('%VALID%')  fetch first ${row_number} rows only
        ${query}=   query_all     ${db_connect}     ${sql}     # query
        ${LEN_GENFILE}=  Get Length    ${query}
        FOR    ${index}    IN RANGE    ${LEN_GENFILE}
        set test variable    ${index}
        ${result}=   set variable    ${query[${index}]}
        ${MASTER_CASE_ID}=    set variable    ${result}[MASTER_CASE_ID]
        set test variable   ${MASTER_CASE_ID}
        get current date WarrantH
        get current TIME WarrantH
        Genarate warrantID random Negative Case'${id_H}'
        Set Test Variable     ${warrant_type_change}    ${change_type}
        Create Data add Warrant H to Change warrant_type
        List data file REQ
        END
Prepara Data Request CSV is ${row_number} Negatives Test Case warrant_date is ${change_date}
    Create Warrant H FILE CSV
    ${BANK_CASE_ID}   create list
    set test variable    ${BANK_CASE_ID}
        connect to cfr database horse
       ${sql}=   catenate      select distinct FC.MASTER_CASE_ID,POLICE_CASE_NUMBER,SUB_CASE_RANK 
       ...   from CFRAPP.FRAUDCASE FC
    ...    JOIN  BANKFRAUDCASE  BFC on FC.MASTER_CASE_ID = BFC.MASTER_CASE_ID join BANKACCOUNT BA on BFC.ACCOUNT_ID = BA.ID
    ...    join PERSON PS on BA.PERSON_ID = PS.ID
    ...    where POLICE_CASE_NUMBER is null and PS.PERSONAL_ID is not null and BFC.SUB_CASE_POLICE_BLOCK_NUMBER is null
    ...    and BFC.SUB_CASE_POLICE_BLOCK_TYPE is null and BFC.SUB_CASE_RANK = 2
    ...    and CASE_TYPE_ID not in (1) and BA.PROMPTPAY_TYPE not in ('e-wallet')
    ...    and FC.MASTER_CASE_ID not like ('%SUS%') and FC.MASTER_CASE_ID not like ('%BAS%') and FC.MASTER_CASE_ID not like ('%BOA%')
    ...    and FC.MASTER_CASE_ID not like ('%KBANK%') and FC.MASTER_CASE_ID NOT LIKE ('%KBNK%') AND FC.MASTER_CASE_ID NOT LIKE ('%VALID%') AND FC.MASTER_CASE_ID NOT LIKE ('%KKP%') AND FC.MASTER_CASE_ID NOT LIKE ('%KTB%') AND FC.MASTER_CASE_ID NOT LIKE ('%BBL%') AND FC.MASTER_CASE_ID NOT LIKE ('%MEGA%') fetch first ${row_number} rows only

        ${query}=   query_all     ${db_connect}     ${sql}     # query
        ${LEN_GENFILE}=  Get Length    ${query}
        FOR    ${index}    IN RANGE    ${LEN_GENFILE}
        set test variable    ${index}
        ${result}=   set variable    ${query[${index}]}
        ${MASTER_CASE_ID}=    set variable    ${result}[MASTER_CASE_ID]
        set test variable   ${MASTER_CASE_ID}
        get current date WarrantH
        Set Test Variable     ${Date_WarrantH}    ${change_date}
        get current TIME WarrantH
        Genarate warrantID random Negative Case'H'
        Create Data add Warrant H
        List data file REQ
        END
Prepara Data Request CSV is ${row_number} Negatives Test Case warrant_time is ${change_time}
    Create Warrant H FILE CSV
    ${BANK_CASE_ID}   create list
    set test variable    ${BANK_CASE_ID}
        connect to cfr database horse
       ${sql}=   catenate      select distinct FC.MASTER_CASE_ID,POLICE_CASE_NUMBER,SUB_CASE_RANK 
       ...   from CFRAPP.FRAUDCASE FC
    ...    JOIN  BANKFRAUDCASE  BFC on FC.MASTER_CASE_ID = BFC.MASTER_CASE_ID join BANKACCOUNT BA on BFC.ACCOUNT_ID = BA.ID
    ...    join PERSON PS on BA.PERSON_ID = PS.ID
    ...    where POLICE_CASE_NUMBER is null and PS.PERSONAL_ID is not null and BFC.SUB_CASE_POLICE_BLOCK_NUMBER is null
    ...    and BFC.SUB_CASE_POLICE_BLOCK_TYPE is null and BFC.SUB_CASE_RANK = 2
    ...    and CASE_TYPE_ID not in (1) and BA.PROMPTPAY_TYPE not in ('e-wallet')
    ...    and FC.MASTER_CASE_ID not like ('%SUS%') and FC.MASTER_CASE_ID not like ('%BAS%') and FC.MASTER_CASE_ID not like ('%BOA%')
    ...    and FC.MASTER_CASE_ID not like ('%KBANK%') and FC.MASTER_CASE_ID NOT LIKE ('%KBNK%') AND FC.MASTER_CASE_ID NOT LIKE ('%VALID%') AND FC.MASTER_CASE_ID NOT LIKE ('%KKP%') AND FC.MASTER_CASE_ID NOT LIKE ('%KTB%') AND FC.MASTER_CASE_ID NOT LIKE ('%BBL%') AND FC.MASTER_CASE_ID NOT LIKE ('%MEGA%') fetch first ${row_number} rows only
        ${query}=   query_all     ${db_connect}     ${sql}     # query
        ${LEN_GENFILE}=  Get Length    ${query}
        FOR    ${index}    IN RANGE    ${LEN_GENFILE}
        set test variable    ${index}
        ${result}=   set variable    ${query[${index}]}
        ${MASTER_CASE_ID}=    set variable    ${result}[MASTER_CASE_ID]
        set test variable   ${MASTER_CASE_ID}
        get current date WarrantH
        get current TIME WarrantH
        Set Test Variable     ${TIME}    ${change_time}
        Genarate warrantID random Negative Case'H'
        Create Data add Warrant H
        List data file REQ
        END
Prepara Data Request CSV is ${row_number} Negatives Test Case warrant_id is missing field is ${warrant_id_req} ${warrant_type_req} ${MASTER_CASE_ID_req} ${Date_WarrantH_req} ${TIME_req} 
    Create Warrant H FILE CSV
    ${BANK_CASE_ID}   create list
    set test variable    ${BANK_CASE_ID}
        connect to cfr database horse
       ${sql}=   catenate      select distinct FC.MASTER_CASE_ID,POLICE_CASE_NUMBER,SUB_CASE_RANK 
       ...   from CFRAPP.FRAUDCASE FC
    ...    JOIN  BANKFRAUDCASE  BFC on FC.MASTER_CASE_ID = BFC.MASTER_CASE_ID join BANKACCOUNT BA on BFC.ACCOUNT_ID = BA.ID
    ...    join PERSON PS on BA.PERSON_ID = PS.ID
    ...    where POLICE_CASE_NUMBER is null and PS.PERSONAL_ID is not null and BFC.SUB_CASE_POLICE_BLOCK_NUMBER is null
    ...    and BFC.SUB_CASE_POLICE_BLOCK_TYPE is null and BFC.SUB_CASE_RANK = 2
    ...    and CASE_TYPE_ID not in (1) and BA.PROMPTPAY_TYPE not in ('e-wallet')
    ...    and FC.MASTER_CASE_ID not like ('%SUS%') and FC.MASTER_CASE_ID not like ('%BAS%') and FC.MASTER_CASE_ID not like ('%BOA%') and FC.MASTER_CASE_ID not like ('%KBANK%') fetch first ${row_number} rows only
        ${query}=   query_all     ${db_connect}     ${sql}     # query
        ${LEN_GENFILE}=  Get Length    ${query}
        FOR    ${index}    IN RANGE    ${LEN_GENFILE}
        set test variable    ${index}
        ${result}=   set variable    ${query[${index}]}
        ${MASTER_CASE_ID}=    set variable    ${result}[MASTER_CASE_ID]
        set test variable   ${MASTER_CASE_ID}
        get current date WarrantH
        get current TIME WarrantH
        Genarate warrantID random Negative Case'H'
        Set Test Variable    ${warrant_id}    ${warrant_id_req}
        Set Test Variable    ${warrant_type}    ${warrant_type_req}
        Set Test Variable    ${MASTER_CASE_ID}    ${MASTER_CASE_ID_req}
        Set Test Variable    ${Date_WarrantH}    ${Date_WarrantH_req}
        Set Test Variable    ${TIME}    ${TIME_req}
        Create Data add Warrant H
        List data file REQ
        END
Prepara Data Request CSV is ${row_number} Negatives Test Case current date WarrantH Future Date Today + 1   
    Create Warrant H FILE CSV
    ${BANK_CASE_ID}   create list
    set test variable    ${BANK_CASE_ID}
        connect to cfr database horse
       ${sql}=   catenate      select distinct FC.MASTER_CASE_ID,POLICE_CASE_NUMBER,SUB_CASE_RANK 
       ...   from CFRAPP.FRAUDCASE FC
    ...    JOIN  BANKFRAUDCASE  BFC on FC.MASTER_CASE_ID = BFC.MASTER_CASE_ID join BANKACCOUNT BA on BFC.ACCOUNT_ID = BA.ID
    ...    join PERSON PS on BA.PERSON_ID = PS.ID
    ...    where POLICE_CASE_NUMBER is null and PS.PERSONAL_ID is not null and BFC.SUB_CASE_POLICE_BLOCK_NUMBER is null
    ...    and BFC.SUB_CASE_POLICE_BLOCK_TYPE is null and BFC.SUB_CASE_RANK = 2
    ...    and CASE_TYPE_ID not in (1) and BA.PROMPTPAY_TYPE not in ('e-wallet')
    ...    and FC.MASTER_CASE_ID not like ('%SUS%') and FC.MASTER_CASE_ID not like ('%BAS%') and FC.MASTER_CASE_ID not like ('%BOA%') and FC.MASTER_CASE_ID not like ('%KBANK%') and FC.MASTER_CASE_ID not like ('%KBANK%') and FC.MASTER_CASE_ID NOT LIKE ('%KBNK%') AND FC.MASTER_CASE_ID NOT LIKE ('%VALID%')  fetch first ${row_number} rows only
        ${query}=   query_all     ${db_connect}     ${sql}     # query
        ${LEN_GENFILE}=  Get Length    ${query}
        FOR    ${index}    IN RANGE    ${LEN_GENFILE}
        set test variable    ${index}
        ${result}=   set variable    ${query[${index}]}
        ${MASTER_CASE_ID}=    set variable    ${result}[MASTER_CASE_ID]
        set test variable   ${MASTER_CASE_ID}
        get current date WarrantH Future Date Today + 1   
        get current TIME WarrantH
        Genarate warrantID random Negative Case'H'
        Create Data add Warrant H
        List data file REQ
        END
Prepara Data Request CSV is ${row_number} Negatives Test Case is Header and Body EMPLY 
    Create Warrant H FILE CSV And Header is EMPLY
    ${BANK_CASE_ID}   create list
    set test variable    ${BANK_CASE_ID}
        connect to cfr database horse
       ${sql}=   catenate      select distinct FC.MASTER_CASE_ID,POLICE_CASE_NUMBER,SUB_CASE_RANK 
       ...   from CFRAPP.FRAUDCASE FC
    ...    JOIN  BANKFRAUDCASE  BFC on FC.MASTER_CASE_ID = BFC.MASTER_CASE_ID join BANKACCOUNT BA on BFC.ACCOUNT_ID = BA.ID
    ...    join PERSON PS on BA.PERSON_ID = PS.ID
    ...    where POLICE_CASE_NUMBER is null and PS.PERSONAL_ID is not null and BFC.SUB_CASE_POLICE_BLOCK_NUMBER is null
    ...    and BFC.SUB_CASE_POLICE_BLOCK_TYPE is null and BFC.SUB_CASE_RANK = 2
    ...    and CASE_TYPE_ID not in (1) and BA.PROMPTPAY_TYPE not in ('e-wallet')
    ...    and FC.MASTER_CASE_ID not like ('%SUS%') and FC.MASTER_CASE_ID not like ('%BAS%') and FC.MASTER_CASE_ID not like ('%BOA%') and FC.MASTER_CASE_ID not like ('%KBANK%') fetch first ${row_number} rows only
        ${query}=   query_all     ${db_connect}     ${sql}     # query
        ${LEN_GENFILE}=  Get Length    ${query}
        FOR    ${index}    IN RANGE    ${LEN_GENFILE}
        set test variable    ${index}
        ${result}=   set variable    ${query[${index}]}
        ${MASTER_CASE_ID}=    set variable    ${result}[MASTER_CASE_ID]
        set test variable   ${MASTER_CASE_ID}
        get current date WarrantH  
        get current TIME WarrantH
        Genarate warrantID random Negative Case'H'
        Create Data add Warrant H And Header is EMPLY
        List data file REQ
        END


Get Data MASTER_CASE_ID Number is null ${row_number} and Genarate warrant_id is ${id_H}
    # ${REQ_data_list_to_check}   create list
    ${BANK_CASE_ID}   create list
    # set test variable    ${REQ_data_list_to_check}
    set test variable    ${BANK_CASE_ID}
        connect to cfr database horse
       ${sql}=   catenate      select distinct FC.MASTER_CASE_ID,POLICE_CASE_NUMBER,SUB_CASE_RANK 
       ...   from CFRAPP.FRAUDCASE FC
    ...    JOIN  BANKFRAUDCASE  BFC on FC.MASTER_CASE_ID = BFC.MASTER_CASE_ID join BANKACCOUNT BA on BFC.ACCOUNT_ID = BA.ID
    ...    join PERSON PS on BA.PERSON_ID = PS.ID
    ...    where POLICE_CASE_NUMBER is null and PS.PERSONAL_ID is not null and BFC.SUB_CASE_POLICE_BLOCK_NUMBER is null
    ...    and BFC.SUB_CASE_POLICE_BLOCK_TYPE is null and BFC.SUB_CASE_RANK = 2
    ...    and CASE_TYPE_ID not in (1) and BA.PROMPTPAY_TYPE not in ('e-wallet')
    ...    and FC.MASTER_CASE_ID not like ('%SUS%') and FC.MASTER_CASE_ID not like ('%BAS%') and FC.MASTER_CASE_ID not like ('%BOA%') and FC.MASTER_CASE_ID not like ('%KBANK%') and FC.MASTER_CASE_ID not like ('%KBANK%') and FC.MASTER_CASE_ID NOT LIKE ('%KBNK%') AND FC.MASTER_CASE_ID NOT LIKE ('%VALID%')  fetch first ${row_number} rows only
        ${query}=   query_all     ${db_connect}     ${sql}     # query
        ${LEN_GENFILE}=  Get Length    ${query}
        FOR    ${index}    IN RANGE    ${LEN_GENFILE}
        set test variable    ${index}
        ${result}=   set variable    ${query[${index}]}
        ${MASTER_CASE_ID}=    set variable    ${result}[MASTER_CASE_ID]
        set test variable   ${MASTER_CASE_ID}
        get current date WarrantH
        get current TIME WarrantH
        Genarate warrantID random Negative Case'${id_H}'
        Create Data add Warrant H
        List data file REQ
        # Get Data account and log ${MASTER_CASE_ID}
          log   ${index}
        END
Get Data Police Case Number is null ${row_number} Add mastercase is ${mastercase}
    # ${REQ_data_list_to_check}   create list
    ${BANK_CASE_ID}   create list
    # set test variable    ${REQ_data_list_to_check}
    set test variable    ${BANK_CASE_ID}
        connect to cfr database horse
       ${sql}=   catenate      select distinct FC.MASTER_CASE_ID,POLICE_CASE_NUMBER,SUB_CASE_RANK 
       ...   from CFRAPP.FRAUDCASE FC
    ...    JOIN  BANKFRAUDCASE  BFC on FC.MASTER_CASE_ID = BFC.MASTER_CASE_ID join BANKACCOUNT BA on BFC.ACCOUNT_ID = BA.ID
    ...    join PERSON PS on BA.PERSON_ID = PS.ID
    ...    where POLICE_CASE_NUMBER is null and PS.PERSONAL_ID is not null and BFC.SUB_CASE_POLICE_BLOCK_NUMBER is null
    ...    and BFC.SUB_CASE_POLICE_BLOCK_TYPE is null and BFC.SUB_CASE_RANK = 2
    ...    and CASE_TYPE_ID not in (1) and BA.PROMPTPAY_TYPE not in ('e-wallet') 
    ...    and FC.MASTER_CASE_ID not like ('%SUS%') and FC.MASTER_CASE_ID not like ('%BAS%') and FC.MASTER_CASE_ID not like ('%BOA%') and FC.MASTER_CASE_ID not like ('%KBANK%') fetch first ${row_number} rows only
        ${query}=   query_all     ${db_connect}     ${sql}     # query
        ${LEN_GENFILE}=  Get Length    ${query}
        FOR    ${index}    IN RANGE    ${LEN_GENFILE}
        ${result}=   set variable    ${query[${index}]}
        ${MASTER_CASE_ID}=    set variable    ${result}[MASTER_CASE_ID]
        set test variable   ${MASTER_CASE_ID}    ${mastercase}
        get current date WarrantH
        get current TIME WarrantH
        Genarate warrantID random 'SFTP'
        Create Data add Warrant H
        List data file REQ
        # Get Data account and log ${MASTER_CASE_ID}
          log   ${index}
        END


Get Data to file csv wary juristic ${row_number}
        FOR  ${index}   IN RANGE  1   ${row_number} 
        Create Data wary juristic
          log   ${index}
        END


Zip CSV File
    [Documentation]    บีบอัดไฟล์ CSV เป็น ZIP โดยใช้ Evaluate
    ${ZIP_PATH}     Set Variable   ${CURDIR}\\Data\\${FileName_zip}
    Log To Console   ${ZIP_PATH}
    ${CSV_PATH}     Set Variable    ${CURDIR}\\Data\\${FileName_csv}
    Log To Console   ${CSV_PATH}   
    Sleep    2s
    ${results} =    Evaluate    __import__('zipfile').ZipFile(r"${ZIP_PATH}", 'w', __import__('zipfile').ZIP_DEFLATED).write(r"${CSV_PATH}", "${FileName_csv}")
    Should Exist    ${ZIP_PATH}


Get Data Police Case Number is null ${row_number}
    # ${REQ_data_list_to_check}   create list
    ${BANK_CASE_ID}   create list
    # set test variable    ${REQ_data_list_to_check}
    set test variable    ${BANK_CASE_ID}
        connect to cfr database horse
       ${sql}=   catenate      select distinct FC.MASTER_CASE_ID,POLICE_CASE_NUMBER,SUB_CASE_RANK
       ...   from CFRAPP.FRAUDCASE FC
    ...    JOIN  BANKFRAUDCASE  BFC on FC.MASTER_CASE_ID = BFC.MASTER_CASE_ID join BANKACCOUNT BA on BFC.ACCOUNT_ID = BA.ID
    ...    join PERSON PS on BA.PERSON_ID = PS.ID
    ...    where POLICE_CASE_NUMBER is null and PS.PERSONAL_ID is not null and BFC.SUB_CASE_POLICE_BLOCK_NUMBER is null
    ...    and BFC.SUB_CASE_POLICE_BLOCK_TYPE is null and BFC.SUB_CASE_RANK = 2
    ...    and CASE_TYPE_ID not in (1) and BA.PROMPTPAY_TYPE not in ('e-wallet')
    ...    and FC.MASTER_CASE_ID not like ('%SUS%') and FC.MASTER_CASE_ID not like ('%BAS%') and FC.MASTER_CASE_ID not like ('%BOA%') and FC.MASTER_CASE_ID not like ('%KBANK%') 
    ...    and FC.MASTER_CASE_ID not like ('%KBANK%') and FC.MASTER_CASE_ID NOT LIKE ('%KBNK%') AND FC.MASTER_CASE_ID NOT LIKE ('%VALID%') AND FC.MASTER_CASE_ID NOT LIKE ('%KKP%') AND FC.MASTER_CASE_ID NOT LIKE ('%KTB%') AND FC.MASTER_CASE_ID NOT LIKE ('%BBL%') AND FC.MASTER_CASE_ID NOT LIKE ('%MEGA%') fetch first ${row_number} rows only
        ${query}=   query_all     ${db_connect}     ${sql}     # query
        ${LEN_GENFILE}=  Get Length    ${query}
        FOR    ${index}    IN RANGE    ${LEN_GENFILE}
        ${result}=   set variable    ${query[${index}]}
        ${MASTER_CASE_ID}=    set variable    ${result}[MASTER_CASE_ID]
        set test variable   ${MASTER_CASE_ID}
        get current date WarrantH
        get current TIME WarrantH
        Genarate warrantID random 'SFTP'
        Create Data add Warrant H
        List data file REQ
        # Get Data account and log ${MASTER_CASE_ID}
          log   ${index}
        END

Get Data Query Police Case Number is ${row_number}
    # ${REQ_data_list_to_check}   create list
    ${BANK_CASE_ID}   create list
    # set test variable    ${REQ_data_list_to_check}
    set test variable    ${BANK_CASE_ID}
        connect to cfr database horse
       ${sql}=   catenate     SELECT POLICE_CASE_NUMBER 
      ...   FROM FRAUDCASE 
      ...   WHERE POLICE_CASE_NUMBER LIKE '%|%|%|%'
      ...   FETCH FIRST ${row_number} ROW ONLY
        ${query}=   query_all     ${db_connect}     ${sql}     # query
        ${LEN_GENFILE}=  Get Length    ${query}
        FOR    ${index}    IN RANGE    ${LEN_GENFILE}
        ${result}=   set variable    ${query[${index}]}
        ${POLICE_CASE_NUMBER}=    set variable    ${result}[POLICE_CASE_NUMBER]
        set test variable   ${POLICE_CASE_NUMBER}    
        END
Genarate warrantID random Negative Case'${H}'
    [Documentation]    Test Case SUBMIT
    IF  '${H}' == 'H'
    set test variable   ${H}    H
    warrantID'SFTP' total '5' SFTP
    set test variable  ${warrant_id}     ${warrantID_number_w}|${H}|${warrantID_number}|${warrantID_3}${warrantID_number}   
    set test variable    ${warrant_type}   ${H}
    ELSE IF  '${H}' == 'Q'
    set test variable   ${H}    H
    warrantID'SFTP' total '5' SFTP
    set test variable  ${warrant_id}     ${warrantID_number_w}|Q|${warrantID_number}|${warrantID_3}${warrantID_number}   
    set test variable    ${warrant_type}   ${H}
    ELSE IF  '${H}' == 'id_empty'
    set test variable   ${H}    H
    set test variable  ${warrant_id}     ${EMPTY}
    set test variable    ${warrant_type}   ${H}

    ELSE IF  '${H}' == '| not have 3'
    set test variable   ${H}    H
    warrantID'SFTP' total '5' SFTP
    Run Keyword If  '${index}' == '1'     set test variable    ${warrantID_number_w}  ${EMPTY}
    set test variable  ${warrant_id}     ${warrantID_number_w}|${H}|${warrantID_number}${warrantID_3}${warrantID_number}   
    set test variable    ${warrant_type}   ${H}  

    ELSE IF  '${H}' == '128digi'
    set test variable   ${H}    H
    warrantID'128digi' total '5' SFTP To Negative
    set test variable  ${warrant_id}     ${warrantID_number_w}|${H}|${warrantID_number}|${warrantID_3}${warrantID_number}
    set test variable    ${warrant_type}   ${H}  
    ELSE IF  '${H}' == 'type_empty'
    set test variable   ${H}    H
    warrantID'SFTP' total '5' SFTP
    set test variable  ${warrant_id}     ${warrantID_number_w}|${H}|${warrantID_number}|${warrantID_3}${warrantID_number}
    set test variable    ${warrant_type}   ${EMPTY}
    ELSE
        ${warrant_time} =   set variable   ${timedate}
            set test variable   ${H}
    END
warrantID'${warrantID}' total '${NUMBER}' SFTP To Negative
    IF  '${warrantID}' == '128digi'
         ${warrantID_2}=    random_string_eng   ${NUMBER}
         ${warrantID_3}=    random_string_eng   113
         ${warrantID_number}=    random_number_warrant   ${NUMBER}
         ${warrantID_number_w}=    random_number_warrant   ${NUMBER}
           set test variable    ${warrantID_2}    ${warrantID_2}
           set test variable    ${warrantID_3}    ${warrantID_3}
           set test variable    ${warrantID_number}  ${warrantID_number}
           set test variable    ${warrantID_number_w}  W${warrantID_number_w}
#     ELSE IF 
    ELSE
        ${warrantID} =   set variable   ${warrantID}
    END

Check DB master case Negative case 
    [Documentation]    Test Case SUBMIT
        # Set Test Variable  ${POLICE_CASE_NUMBER}
        BuiltIn.Sleep   10s
        connect to cfr database
        log  ${BANK_CASE_ID}
        ${result}=    Get Length     ${BANK_CASE_ID}
        FOR  ${index}    IN RANGE    ${result}    
        ${data_total}=    Get From List   ${BANK_CASE_ID}    ${index}
        ${data_responcode}=    Get From List   ${data_total}    0
        ${split_data}=    Split String    ${data_responcode}    ;
        ${Bank_case_id_req}=         Get From List    ${split_data}    0
        ${Warrant_id_req}=        Get From List    ${split_data}    1
        set test variable      ${Bank_case_id_req}
        set test variable      ${Warrant_id_req}
       ${sql}=   catenate      select BANK_CASE_ID, WARRANT_ID, WARRANT_TYPE, STATUS_CODE, STATUS_DETAIL FROM AOC_SFTP_WARRANT_REQUEST_FILE_DETAIL WHERE BANK_CASE_ID = '${Bank_case_id_req}' AND WARRANT_ID = '${Warrant_id_req}'
        ${query}=   query_all     ${db_connect}     ${sql}     # query
        ${result}=   set variable    ${query[0]}
        ${BANK_CASE_ID}=    set variable    ${result}[BANK_CASE_ID]
        ${WARRANT_ID}=    set variable    ${result}[WARRANT_ID]
        ${WARRANT_TYPE}=    set variable    ${result}[WARRANT_TYPE]
        set test variable   ${DB_MASTER_CASE_ID}      ${BANK_CASE_ID}
        set test variable   ${DB_WARRANT_NUMBER}      ${WARRANT_ID}
        set test variable   ${DB_WARRANT_TYPE}      ${WARRANT_TYPE}
        Should Be Equal As Strings     ${Bank_case_id_req}      ${DB_MASTER_CASE_ID}
        Should Be Equal As Strings     ${Warrant_id_req}     ${DB_WARRANT_NUMBER}
        log     ${index}
        END
Check DB master case Negative case File name RES
        BuiltIn.Sleep   10s
        connect to cfr database
        ${result}=    Get Length     ${BANK_CASE_ID}
        FOR  ${index}    IN RANGE    ${result}    
       ${sql}=   catenate      SELECT * FROM AOC_SFTP_WARRANT_RESPONSE_FILE_INFO  WHERE RESPONSE_FILE_NAME = '${Response_warrant_H_gpg}'
        ${query}=   query_all     ${db_connect}     ${sql}     # query
        ${result}=   set variable    ${query[0]}
        ${DB_RESPONSE_FILE_NAME}=    set variable    ${result}[RESPONSE_FILE_NAME]
        Should Be Equal As Strings     ${Response_warrant_H_gpg}     ${DB_RESPONSE_FILE_NAME}
        log     ${index}
        END
Check DB master case Negative case to None BankcaseID
    [Documentation]    Test Case SUBMIT
        # Set Test Variable  ${POLICE_CASE_NUMBER}
        BuiltIn.Sleep   10s
        connect to cfr database
        log  ${BANK_CASE_ID}
        ${result}=    Get Length     ${BANK_CASE_ID}
        FOR  ${index}    IN RANGE     ${result}    
        ${data_total}=    Get From List   ${BANK_CASE_ID}    ${index}
        ${data_responcode}=    Get From List   ${data_total}    0
        ${split_data}=    Split String    ${data_responcode}    ;
        ${Bank_case_id_req}=         Get From List    ${split_data}    0
        ${Warrant_id_req}=        Get From List    ${split_data}    1
        set test variable      ${Bank_case_id_req}
        set test variable      ${Warrant_id_req}
       ${sql}=   catenate      select BANK_CASE_ID, WARRANT_ID, WARRANT_TYPE, STATUS_CODE, STATUS_DETAIL FROM AOC_SFTP_WARRANT_REQUEST_FILE_DETAIL WHERE WARRANT_ID = '${Warrant_id_req}'
        ${query}=   query_all     ${db_connect}     ${sql}     # query
        ${result}=   set variable    ${query[0]}
        ${BANK_CASE_ID}=    set variable    ${result}[BANK_CASE_ID]
        ${WARRANT_ID}=    set variable    ${result}[WARRANT_ID]
        ${WARRANT_TYPE}=    set variable    ${result}[WARRANT_TYPE]
        set test variable   ${DB_MASTER_CASE_ID}      ${BANK_CASE_ID}
        set test variable   ${DB_WARRANT_NUMBER}      ${WARRANT_ID}
        set test variable   ${DB_WARRANT_TYPE}      ${WARRANT_TYPE}
        Should Be Equal As Strings     ${Bank_case_id_req}      ${EMPTY}
        Should Be Equal As Strings     ${Warrant_id_req}     ${DB_WARRANT_NUMBER}
        log     ${index}
        END
Check DB master case Negative case to None Warrant_ID
    [Documentation]    Test Case SUBMIT
        # Set Test Variable  ${POLICE_CASE_NUMBER}
        BuiltIn.Sleep   10s
        connect to cfr database
        log  ${BANK_CASE_ID}
        ${result}=    Get Length     ${BANK_CASE_ID}
        FOR  ${index}    IN RANGE     ${result}    
        ${data_total}=    Get From List   ${BANK_CASE_ID}    ${index}
        ${data_responcode}=    Get From List   ${data_total}    0
        ${split_data}=    Split String    ${data_responcode}    ;
        ${Bank_case_id_req}=         Get From List    ${split_data}    0
        ${Warrant_id_req}=        Get From List    ${split_data}    1
        set test variable      ${Bank_case_id_req}
        set test variable      ${Warrant_id_req}
       ${sql}=   catenate      select BANK_CASE_ID, WARRANT_ID, WARRANT_TYPE, STATUS_CODE, STATUS_DETAIL FROM AOC_SFTP_WARRANT_REQUEST_FILE_DETAIL WHERE BANK_CASE_ID = '${Bank_case_id_req}'
        ${query}=   query_all     ${db_connect}     ${sql}     # query
        ${result}=   set variable    ${query[0]}
        ${BANK_CASE_ID}=    set variable    ${result}[BANK_CASE_ID]
        ${WARRANT_ID}=    set variable    ${result}[WARRANT_ID]
        ${WARRANT_TYPE}=    set variable    ${result}[WARRANT_TYPE]
        set test variable   ${DB_MASTER_CASE_ID}      ${BANK_CASE_ID}
        set test variable   ${DB_WARRANT_NUMBER}      ${WARRANT_ID}
        set test variable   ${DB_WARRANT_TYPE}      ${WARRANT_TYPE}
        Should Be Equal As Strings     ${Bank_case_id_req}      ${BANK_CASE_ID}
        Should Be Equal As Strings     ${Warrant_id_req}     ${EMPTY}
        log     ${index}
        END
Check DB master case Negative case warrant_type to change
    [Documentation]    Test Case SUBMIT
        # Set Test Variable  ${POLICE_CASE_NUMBER}
        BuiltIn.Sleep   10s
        connect to cfr database
        log  ${BANK_CASE_ID}
        ${result}=    Get Length     ${BANK_CASE_ID}
        FOR  ${index}    IN RANGE     ${result}    
        ${data_total}=    Get From List   ${BANK_CASE_ID}    ${index}
        ${data_responcode}=    Get From List   ${data_total}    0
        ${split_data}=    Split String    ${data_responcode}    ;
        ${Bank_case_id_req}=         Get From List    ${split_data}    0
        ${Warrant_id_req}=        Get From List    ${split_data}    1
        set test variable      ${Bank_case_id_req}
        set test variable      ${Warrant_id_req}
       ${sql}=   catenate      select BANK_CASE_ID, WARRANT_ID, WARRANT_TYPE, STATUS_CODE, STATUS_DETAIL FROM AOC_SFTP_WARRANT_REQUEST_FILE_DETAIL WHERE BANK_CASE_ID = '${Bank_case_id_req}' AND WARRANT_ID = '${Warrant_id_req}'
        ${query}=   query_all     ${db_connect}     ${sql}     # query
        ${result}=   set variable    ${query[0]}
        ${BANK_CASE_ID}=    set variable    ${result}[BANK_CASE_ID]
        ${WARRANT_ID}=    set variable    ${result}[WARRANT_ID]
        ${WARRANT_TYPE}=    set variable    ${result}[WARRANT_TYPE]
        set test variable   ${DB_MASTER_CASE_ID}      ${BANK_CASE_ID}
        set test variable   ${DB_WARRANT_NUMBER}      ${WARRANT_ID}
        set test variable   ${DB_WARRANT_TYPE}      ${WARRANT_TYPE}
        Should Be Equal As Strings     ${Bank_case_id_req}      ${DB_MASTER_CASE_ID}
        Should Be Equal As Strings     ${Warrant_id_req}     ${DB_WARRANT_NUMBER}
        Should Be Equal As Strings     ${warrant_type_change}     ${DB_WARRANT_TYPE}
        log     ${index}
        END
Check DB master case Negative case warrant_type to change is None
    [Documentation]    Test Case SUBMIT
        # Set Test Variable  ${POLICE_CASE_NUMBER}
        BuiltIn.Sleep   10s
        connect to cfr database
        log  ${BANK_CASE_ID}
        ${result}=    Get Length     ${BANK_CASE_ID}
        FOR  ${index}    IN RANGE     ${result}    
        ${data_total}=    Get From List   ${BANK_CASE_ID}    ${index}
        ${data_responcode}=    Get From List   ${data_total}    0
        ${split_data}=    Split String    ${data_responcode}    ;
        ${Bank_case_id_req}=         Get From List    ${split_data}    0
        ${Warrant_id_req}=        Get From List    ${split_data}    1
        set test variable      ${Bank_case_id_req}
        set test variable      ${Warrant_id_req}
       ${sql}=   catenate      select BANK_CASE_ID, WARRANT_ID, WARRANT_TYPE, STATUS_CODE, STATUS_DETAIL FROM AOC_SFTP_WARRANT_REQUEST_FILE_DETAIL WHERE BANK_CASE_ID = '${Bank_case_id_req}' AND WARRANT_ID = '${Warrant_id_req}'
        ${query}=   query_all     ${db_connect}     ${sql}     # query
        ${result}=   set variable    ${query[0]}
        ${BANK_CASE_ID}=    set variable    ${result}[BANK_CASE_ID]
        ${WARRANT_ID}=    set variable    ${result}[WARRANT_ID]
        ${WARRANT_TYPE}=    set variable    ${result}[WARRANT_TYPE]
        set test variable   ${DB_MASTER_CASE_ID}      ${BANK_CASE_ID}
        set test variable   ${DB_WARRANT_NUMBER}      ${WARRANT_ID}
        set test variable   ${DB_WARRANT_TYPE}      ${WARRANT_TYPE}
        Should Be Equal As Strings     ${Bank_case_id_req}      ${DB_MASTER_CASE_ID}
        Should Be Equal As Strings     ${Warrant_id_req}     ${DB_WARRANT_NUMBER}
        Should Be Equal As Strings     ${warrant_type_change}     ${EMPTY}
        log     ${index}
        END
Create Data add Warrant H to Change warrant_type
      ${list}=   create list   ${warrant_id};${warrant_type_change};${MASTER_CASE_ID};${Date_WarrantH};${TIME}    
      ${list2}=   create list   ${MASTER_CASE_ID};${warrant_id};  
      ${data}=   create list  ${list}
    #   ${REQ_data_list_to_check}   create list
      Append To Csv File     ${CURDIR}/Data/${directory}.csv    ${data}
      Set Test Variable   ${list}
      Set Test Variable   ${list2}
      BANK CASE LIST ${list2}
Create Data add Warrant H And Header is EMPLY
      ${list}=   create list   ${warrant_id};${warrant_type};${MASTER_CASE_ID};${Date_WarrantH};${TIME}
      ${list2}=   create list   ${MASTER_CASE_ID};${warrant_id};  
      Set Test Variable   ${list}    ${EMPTY}
      ${data}=   create list  ${list}
    #   ${REQ_data_list_to_check}   create list
      Append To Csv File     ${CURDIR}/Data/${directory}.csv    ${data}
      Set Test Variable   ${list2}
      BANK CASE LIST ${list2}
Create Data add Warrant H Body is Invlida ,
      ${list}=   create list   ${EMPTY}
      ${list2}=   create list   ${MASTER_CASE_ID};${warrant_id};  
      ${data}=   create list  ${list}
    #   ${REQ_data_list_to_check}   create list
      Append To Csv File     ${CURDIR}/Data/${directory}.csv    ${data}
      Set Test Variable   ${list}
      Set Test Variable   ${list2}
      BANK CASE LIST ${list2}
get current date WarrantH Future Date Today + 1   
    ${date}=    Get Current Date
    ${day}=    Add Time To Date    ${date}    1 days
    ${year}=    Convert Date    ${date}    result_format=%Y
    ${month}=    Convert Date    ${date}    result_format=%m
    ${day}=    Convert Date    ${day}    result_format=%d
    ${thai_year}=     evaluate   ${year}+${543}
    # ${daylater}=    Evaluate    ${day}
    ${datetime}=    set variable    ${thai_year}-${month}-${day}
    set test variable    ${Date_WarrantH}    ${datetime}

Create Warrant H FILE CSV Edit TO Header ${header_warrant_id} ${header_warrant_type} ${header_bankcaseid} ${header_warrant_date} ${header_warrant_time}
     ${REQ_data_list_to_check}   create list
      ${list}=   create list   ${header_warrant_id};${header_warrant_type};${header_bankcaseid};${header_warrant_date};${header_warrant_time}
      ${data}=   create list  ${list}
      create file    ${CURDIR}/Data/${directory}.csv
      Append To Csv File     ${CURDIR}/Data/${directory}.csv    ${data}
      Append To List     ${REQ_data_list_to_check}     ${list} 
      set test variable    ${REQ_data_list_to_check}
Create Warrant H FILE CSV And Header is EMPLY
     ${REQ_data_list_to_check}   create list
      ${list}=   create list   ${EMPTY}
      ${data}=   create list  ${list}
      create file    ${CURDIR}/Data/${directory}.csv
      Append To Csv File     ${CURDIR}/Data/${directory}.csv    ${data}
      Append To List     ${REQ_data_list_to_check}     ${list} 
      set test variable    ${REQ_data_list_to_check}
Create Warrant H FILE CSV And Header is EMPLY and no file 
     ${REQ_data_list_to_check}   create list
      ${list}=   create list   ${EMPTY}
      ${data}=   create list  ${list}
      create file    ${CURDIR}/Data/${directory}.csv
    #   Append To Csv File     ${CURDIR}/Data/${directory}.csv    ${data}
      Append To List     ${REQ_data_list_to_check}     ${list} 
      set test variable    ${REQ_data_list_to_check}
Check Response Code ${fail} GPG FILE TO ERROR Is ${type} And warrant_id or waarant_type is None
    ${csv_list}=   Read Csv File To List      ${CSV_FILE}
    ${total_res}=   Get Length   ${csv_list} 
    FOR    ${index}    IN RANGE    1    ${total_res}   
    # FOR   ${index}    IN RANGE     ${total_res}       
          ${data_total}=    Get From List   ${csv_list}    ${index}
          ${data_responcode}=    Get From List   ${data_total}    0
          ${split_data}=    Split String    ${data_responcode}    ;
         ${Warrant_H_Res}=         Get From List    ${split_data}    0
         ${Warrant_Type_H_Res}=        Get From List    ${split_data}    1
         ${Response_H_Res}=         Get From List    ${split_data}    2
        ${Mes_H_Res}=        Get From List    ${split_data}    3
        ${TS_H_Res}=        Get From List    ${split_data}    4
        ${data_total_req}=    Get From List   ${REQ_data_list_to_check}   ${index}
        ${data_responcode_req}=    Get From List   ${data_total_req}    0
        ${split_data_req}=    Split String    ${data_responcode_req}    ;
        ${Warrant_H_REQ}=         Get From List    ${split_data_req}    0
         ${Warrant_Type_H_REQ}=        Get From List    ${split_data_req}    1
    Should Be Equal As Strings    ${Warrant_H_Res}     ${EMPTY}
    Should Be Equal As Strings    ${Warrant_Type_H_Res}      ${EMPTY}
    Should Be Equal As Strings    ${Response_H_Res}     ${ResHS.${fail}.code}
    Should Be Equal As Strings    ${Mes_H_Res}       ${ResHS.${fail}.msg${type}}
    Should Not Be Empty     ${TS_H_Res}
    log      ${index}
    END
Check Response Code ${fail} GPG FILE TO ERROR Is ${type} And Header and Body is None
    ${csv_list}=   Read Csv File To List      ${CSV_FILE}
    ${total_res}=   Get Length   ${csv_list} 
    FOR    ${index}    IN RANGE    1    ${total_res}   
    # FOR   ${index}    IN RANGE     ${total_res}       
          ${data_total}=    Get From List   ${csv_list}    ${index}
          ${data_responcode}=    Get From List   ${data_total}    0
          ${split_data}=    Split String    ${data_responcode}    ;
         ${Warrant_H_Res}=         Get From List    ${split_data}    0
         ${Warrant_Type_H_Res}=        Get From List    ${split_data}    1
         ${Response_H_Res}=         Get From List    ${split_data}    2
        ${Mes_H_Res}=        Get From List    ${split_data}    3
        ${TS_H_Res}=        Get From List    ${split_data}    4
    Should Be Equal As Strings    ${Warrant_H_Res}     ${EMPTY}
    Should Be Equal As Strings    ${Warrant_Type_H_Res}      ${EMPTY}
    Should Be Equal As Strings    ${Response_H_Res}     ${ResHS.${fail}.code}
    Should Be Equal As Strings    ${Mes_H_Res}       ${ResHS.${fail}.msg${type}}
    Should Not Be Empty     ${TS_H_Res}
    log      ${index}
    END

Private key and file path ${FILE_NAME_CSV} to Fix file ${gpg}
  Set test Variable   ${PRIVATE_KEY_PATH_TO}    ${CURDIR}\\${SECAOC}.sec
  Set test Variable   ${FILEPATH_CSV}    ${CURDIR}\\Data/${FILE_NAME_CSV}.csv
  set test variable   ${OUT_PATH_GPG}    ${CURDIR}\\Data/${FILE_NAME_CSV}.${gpg}

create File Name Warrant H and ${TIMSS} TIME And Fix file name is req ${name} and res ${name_res} And running_number amoust digit ${amoust}
    ${date}=    Get Current Date
    ${year}=    Convert Date    ${date}    result_format=%Y
    ${month}=    Convert Date    ${date}    result_format=%m
    ${day}=    Convert Date    ${date}    result_format=%d
    ${thai_year}=     evaluate   ${year}+${543}
    ${filenameDateTime}=    set variable    ${thai_year}${month}${day}
    set test variable    ${filenameDateTime} 
     ${running_number}=    random_number_warrant   ${amoust}
     ${directory}=     set variable     CFR_Warrant_H_${filenameDateTime}_${Around.${TIMSS}}_${running_number}_${name}
     ${Response_warrant_H}=     set variable     CFR_Warrant_H_${filenameDateTime}_${Around.${TIMSS}}_${running_number}_${name_res}
     set test variable        ${directory}
     set test variable      ${FileName_Warrant}      ${directory}
     set test variable      ${Response_warrant_H}
create File Name Warrant H and ${TIMSS} TIME set test datetime is ${datetime}
     get current datetime
     Set Test Variable    ${filenameDateTime}     ${datetime}
     ${running_number}=    random_number_warrant   3
     ${directory}=     set variable     CFR_Warrant_H_${filenameDateTime}_${Around.${TIMSS}}_${running_number}_REQ
     ${Response_warrant_H}=     set variable     CFR_Warrant_H_${filenameDateTime}_${Around.${TIMSS}}_${running_number}_RES
     set test variable        ${directory}
     set test variable      ${FileName_Warrant}      ${directory}
     set test variable      ${Response_warrant_H}
create File Name Warrant H and ${TIMSS} TIME Add format name in datetime is ${beforedatetime}
     get current datetime
     ${running_number}=    random_number_warrant   3
     ${directory}=     set variable     CFR_Warrant_H_${filenameDateTime}${beforedatetime}_${Around.${TIMSS}}_${running_number}_REQ
     ${Response_warrant_H}=     set variable     CFR_Warrant_H_${filenameDateTime}${beforedatetime}_${Around.${TIMSS}}_${running_number}_RES
     set test variable        ${directory}
     set test variable      ${FileName_Warrant}      ${directory}
     set test variable      ${Response_warrant_H}

# Check file dudicate
#      connect to cfr database
#        ${sql}=   catenate      select distinct FC.MASTER_CASE_ID,POLICE_CASE_NUMBER,SUB_CASE_RANK 
#        ...   from CFRAPP.FRAUDCASE FC
#        ...    JOIN  BANKFRAUDCASE  BFC on FC.MASTER_CASE_ID = BFC.MASTER_CASE_ID join BANKACCOUNT BA on BFC.ACCOUNT_ID = BA.ID
#        ...    join PERSON PS on BA.PERSON_ID = PS.ID
#        ...    where POLICE_CASE_NUMBER is null and PS.PERSONAL_ID is not null and BFC.SUB_CASE_POLICE_BLOCK_NUMBER is null
#        ...    and BFC.SUB_CASE_POLICE_BLOCK_TYPE is null and BFC.SUB_CASE_RANK = 2
#        ...    and CASE_TYPE_ID not in (1) and BA.PROMPTPAY_TYPE not in ('e-wallet')
#        ...    and FC.MASTER_CASE_ID not like ('%SUS%') fetch first ${row_number} rows only
#         ${query}=   query_all     ${db_connect}     ${sql}     # query

create File Name Warrant H and ${TIMSS} TIME For Duolicate file 
     get current datetime
     ${running_number}=    random_number_warrant   3
     ${directory}=     set variable     CFR_Warrant_H_${filenameDateTime}_${Around.${TIMSS}}_444_REQ
     ${Response_warrant_H}=     set variable     CFR_Warrant_H_${filenameDateTime}_${Around.${TIMSS}}_444_RES
     set test variable        ${directory}
     set test variable      ${FileName_Warrant}      ${directory}
     set test variable      ${Response_warrant_H}

Get Data Police Case Number is null ${row_number} and set warrant_id is ${warrant_id_Q}
    # ${REQ_data_list_to_check}   create list
    ${BANK_CASE_ID}   create list
    # set test variable    ${REQ_data_list_to_check}
    set test variable    ${BANK_CASE_ID}
        connect to cfr database horse
       ${sql}=   catenate      select distinct FC.MASTER_CASE_ID,POLICE_CASE_NUMBER,SUB_CASE_RANK 
       ...   from CFRAPP.FRAUDCASE FC
    ...    JOIN  BANKFRAUDCASE  BFC on FC.MASTER_CASE_ID = BFC.MASTER_CASE_ID join BANKACCOUNT BA on BFC.ACCOUNT_ID = BA.ID
    ...    join PERSON PS on BA.PERSON_ID = PS.ID
    ...    where POLICE_CASE_NUMBER is null and PS.PERSONAL_ID is not null and BFC.SUB_CASE_POLICE_BLOCK_NUMBER is null
    ...    and BFC.SUB_CASE_POLICE_BLOCK_TYPE is null and BFC.SUB_CASE_RANK = 2
    ...    and CASE_TYPE_ID not in (1) and BA.PROMPTPAY_TYPE not in ('e-wallet') 
    ...    and FC.MASTER_CASE_ID not like ('%SUS%') fetch first ${row_number} rows only
        ${query}=   query_all     ${db_connect}     ${sql}     # query
        ${LEN_GENFILE}=  Get Length    ${query}
        FOR    ${index}    IN RANGE    ${LEN_GENFILE}
        ${result}=   set variable    ${query[${index}]}
        ${MASTER_CASE_ID}=    set variable    ${result}[MASTER_CASE_ID]
        set test variable   ${MASTER_CASE_ID}
        get current date WarrantH
        get current TIME WarrantH
        Genarate warrantID random 'SFTP'
        Create Data add Warrant H
        List data file REQ
        # Get Data account and log ${MASTER_CASE_ID}
          log   ${index}
        END

Check file Request No.1
    Sleep    12s
    ${Response_warrant_H_gpg}=     set variable     ${Response_warrant_H}.gpg
    ${Response_warrant_H_csv}=     set variable     ${Response_warrant_H}.csv
    set test variable    ${Response_warrant_H_gpg}
    set test variable    ${Response_warrant_H_csv}
    SSHLibrary.File Should Exist   /home/sftpaoc/${ENVAOC}/cfr/warranth_binding/outbound/${Response_warrant_H_gpg}
    SSHLibrary.File Should Exist   /home/sftpaoc/${ENVAOC}/cfr/warranth_binding/inbound/archive/${FileName_Warrant}.gpg
Check DB master case File name REQ
        BuiltIn.Sleep   10s
        connect to cfr database
        ${result}=    Get Length     ${BANK_CASE_ID}
        FOR  ${index}    IN RANGE    ${result}    
       ${sql}=   catenate      SELECT * FROM AOC_SFTP_WARRANT_REQUEST_FILE_INFO  WHERE FILE_NAME = '${FileName_Warrant}.gpg'
        ${query}=   query_all     ${db_connect}     ${sql}     # query
        ${result}=   set variable    ${query[0]}
        ${DB_REQ_FILE_NAME}=    set variable    ${result}[FILE_NAME]
        Should Be Equal As Strings     ${FileName_Warrant}.gpg     ${DB_REQ_FILE_NAME}
        log     ${index}
        END
Check DB master case File name RES
        BuiltIn.Sleep   10s
        connect to cfr database
        ${result}=    Get Length     ${BANK_CASE_ID}
        FOR  ${index}    IN RANGE    ${result}    
       ${sql}=   catenate      SELECT * FROM AOC_SFTP_WARRANT_RESPONSE_FILE_INFO  WHERE RESPONSE_FILE_NAME = '${Response_warrant_H_gpg}'
        ${query}=   query_all     ${db_connect}     ${sql}     # query
        ${result}=   set variable    ${query[0]}
        ${DB_RESPONSE_FILE_NAME}=    set variable    ${result}[RESPONSE_FILE_NAME]
        Should Be Equal As Strings     ${Response_warrant_H_gpg}     ${DB_RESPONSE_FILE_NAME}
        log     ${index}
        END
Check DB REQ and RES File To Deleted 
        BuiltIn.Sleep   5s
        connect to cfr database
       ${sql}=   catenate      SELECT * FROM AOC_SFTP_WARRANT_REQUEST_FILE_INFO  WHERE FILE_NAME = '${FileName_Warrant}.gpg'
        ${query}=   query_all     ${db_connect}     ${sql}     # query
        ${result}=   set variable    ${query[0]}
        ${DB_REQ_ID}=    set variable    ${result}[ID]
        Sleep    5s
       ${sql}=   catenate      DELETE FROM AOC_SFTP_WARRANT_REQUEST_FILE_DETAIL where FILE_ID = '${DB_REQ_ID}'
        ${query}=   update     ${db_connect}     ${sql}
       ${sql}=   catenate      DELETE FROM AOC_SFTP_WARRANT_RESPONSE_FILE_INFO where REQUEST_FILE_ID = '${DB_REQ_ID}'
        ${query}=   update     ${db_connect}     ${sql}     # query
       ${sql}=   catenate      DELETE FROM AOC_SFTP_WARRANT_REQUEST_FILE_INFO where ID = '${DB_REQ_ID}'
        ${query}=   update     ${db_connect}     ${sql}     # query
        Deleted file
        Remove file SSH
Clear All Query date
        BuiltIn.Sleep   10s
        connect to cfr database
       ${sql}=   catenate      SELECT * FROM AOC_SFTP_WARRANT_REQUEST_FILE_INFO WHERE FILE_NAME LIKE '%${filenameDateTime}%'
        ${query}=   query_all     ${db_connect}     ${sql}     # query
        ${result}=   set variable    ${query[0]}
        ${DB_REQ_ID}=    set variable    ${result}[ID]
        Sleep    5s
       ${sql}=   catenate      DELETE FROM AOC_SFTP_WARRANT_REQUEST_FILE_DETAIL WHERE FILE_ID IN (SELECT ID FROM AOC_SFTP_WARRANT_REQUEST_FILE_INFO WHERE FILE_NAME LIKE '%${filenameDateTime}%')
        ${query}=   update     ${db_connect}     ${sql}
       ${sql}=   catenate      DELETE FROM AOC_SFTP_WARRANT_RESPONSE_FILE_INFO WHERE REQUEST_FILE_ID IN (SELECT ID FROM AOC_SFTP_WARRANT_REQUEST_FILE_INFO WHERE FILE_NAME LIKE '%${filenameDateTime}%')
        ${query}=   update     ${db_connect}     ${sql}     # query
       ${sql}=   catenate      DELETE FROM AOC_SFTP_WARRANT_REQUEST_FILE_INFO WHERE FILE_NAME LIKE '%${filenameDateTime}%'
        ${query}=   update     ${db_connect}     ${sql}     # query
Create Warrant H FILE CSV change character :
     ${REQ_data_list_to_check}   create list
      ${list}=   create list   warrant_id:warrant_type:bankcaseid:warrant_date:warrant_time
      ${data}=   create list  ${list}
      create file    ${CURDIR}/Data/${directory}.csv
      Append To Csv File     ${CURDIR}/Data/${directory}.csv    ${data}
      Append To List     ${REQ_data_list_to_check}     ${list} 
      set test variable    ${REQ_data_list_to_check}
Get File GPG From ITMX For Duplicate 
    sleep  15s 
    ${Response_warrant_H_gpg}=     set variable     ${Response_warrant_H}_*.gpg
    ${Response_warrant_H_csv}=     set variable     ${Response_warrant_H}.csv
    set test variable    ${Response_warrant_H_gpg}
    set test variable    ${Response_warrant_H_csv}
    SSHLibrary.File Should Exist   /home/sftpaoc/${ENVAOC}/cfr/warranth_binding/outbound/${Response_warrant_H_gpg}
    SSHLibrary.File Should Exist   /home/sftpaoc/${ENVAOC}/cfr/warranth_binding/inbound/archive/${FileName_Warrant}.gpg
#     /home/sftpaoc/aoc_sit/cfr/warranth_binding/outbound
    SSHLibrary.Get File     /home/sftpaoc/${ENVAOC}/cfr/warranth_binding/outbound/${Response_warrant_H_gpg}     ${CURDIR}/Data/${Response_warrant_H_gpg}
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
    set test variable   ${CSV_FILE_REQ}     ${CURDIR}/Data/${FileName_Warrant}.csv
Remove file SSH 
    Close All Connections
    login to sftp server and Put file by AOC_SC
    Sleep    2s
    SSHLibrary.File Should Exist   /home/sftpaoc/${ENVAOC}/cfr/warranth_binding/outbound/${Response_warrant_H_gpg}
    SSHLibrary.File Should Exist   /home/sftpaoc/${ENVAOC}/cfr/warranth_binding/inbound/archive/${FileName_Warrant}.gpg
    ${outbound}=    Execute Command    rm /home/sftpaoc/${ENVAOC}/cfr/warranth_binding/outbound/${Response_warrant_H_gpg}    forward_agent=True
    ${inbound_archive}=    Execute Command    rm /home/sftpaoc/${ENVAOC}/cfr/warranth_binding/inbound/archive/${FileName_Warrant}.gpg
    Close All Connections
Remove file Json WithDraw SSH 
    Close All Connections
    login to sftp server and Put file by AOC_SC
    Sleep    2s
    SSHLibrary.File Should Exist   /home/sftpaoc/${ENVAOC}/cfr/withdraw_mule/outbound/${Response_warrant_H_gpg}
    SSHLibrary.File Should Exist   /home/sftpaoc/${ENVAOC}/cfr/withdraw_mule/inbound/archive/${FileName_Warrant}.gpg
    ${outbound}=    Execute Command    rm /home/sftpaoc/${ENVAOC}/cfr/withdraw_mule/outbound/${Response_warrant_H_gpg}    forward_agent=True
    ${inbound_archive}=    Execute Command    rm /home/sftpaoc/${ENVAOC}/cfr/withdraw_mule/inbound/archive/${FileName_Warrant}.gpg
    Close All Connections