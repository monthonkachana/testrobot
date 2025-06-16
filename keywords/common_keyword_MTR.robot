*** Settings ***
Resource  ../resources/imports.robot

*** Variables ***
${dont'forget_MTR}    python -m robot.run -L DEBUG -d result -v totalrun:2 -v ENV:dev -t TC00* --exclude not_ready .\testcases\Positive\GPG_Money_trail_Negative.robot

*** Keywords ***

Create file name money trail report
    get current datetime money trail
        ${directory}=    set variable    CFR_MTR_ADHOC_${filenameDateTime}_REQ
        ${filename}=    set variable    CFR_MTR_ADHOC_${filenameDateTime}
        ${Response_MTR}=    set variable    CFR_MTR_ADHOC_${filenameDateTime}_RES
    set test variable        ${directory}
    set test variable    ${Request_MTR}    ${directory}
    set test variable    ${Response_MTR}
    set test variable    ${filename}

Create file name money trail report invalid file name format
    get current datetime money trail
        ${directory}=    set variable    CFR_MTR_AD_${filenameDateTime}_REQ
        ${filename}=    set variable    CFR_MTR_AD_${filenameDateTime}
        ${Response_MTR}=    set variable    CFR_MTR_AD_${filenameDateTime}_RES
    set test variable        ${directory}
    set test variable    ${Request_MTR}    ${directory}
    set test variable    ${Response_MTR}
    set test variable    ${filename}

Create file name money trail report invalid file name format RED
    get current datetime money trail
        ${directory}=    set variable    CFR_MTR_ADHOC_${filenameDateTime}_RED
        ${filename}=    set variable    CFR_MTR_ADHOC_${filenameDateTime}
        ${Response_MTR_1}=    set variable    CFR_MTR_ADHOC_${filenameDateTime}_RED_RES
        
    set test variable        ${directory}
    set test variable    ${Request_MTR}    ${directory}
    set test variable    ${Response_MTR_1}
    set test variable    ${filename_}
Put file money trail report to sftp server
   sleep  2s
   Wait Until Created    ${CURDIR}/Data/${directory}.gpg    2s
   Put File    ${CURDIR}/Data/${directory}.gpg    /home/sftpaoc/aoc_sit/cfr/MTR_Onetime/inbound    mode=0770

Create money trail file CSV trail report request
     ${REQ_data_list_to_check}   create list
      ${list}=   create list   bankcaseid;
      ${data}=   create list  ${list}
      create file    ${CURDIR}/Data/${directory}.csv
      Append To Csv File     ${CURDIR}/Data/${directory}.csv    ${data}
      Append To List     ${REQ_data_list_to_check}     ${list} 
      set test variable    ${REQ_data_list_to_check}

Create money trail file CSV trail report request no semicolon
     ${REQ_data_list_to_check}   create list
      ${list}=   create list   bankcaseid
      ${data}=   create list  ${list}
      create file    ${CURDIR}/Data/${directory}.csv
      Append To Csv File     ${CURDIR}/Data/${directory}.csv    ${data}
      Append To List     ${REQ_data_list_to_check}     ${list} 
      set test variable    ${REQ_data_list_to_check}

Create money trail file CSV trail report invalid header csv file format
     ${REQ_data_list_to_check}   create list
      ${list}=   create list   bankcaseid
      ${data}=   create list  ${list}
      create file    ${CURDIR}/Data/${directory}.csv
      Append To Csv File     ${CURDIR}/Data/${directory}.csv    ${data}
      Append To List     ${REQ_data_list_to_check}     ${list} 
      set test variable    ${REQ_data_list_to_check}

Create money trail file CSV trail name bankcase
     ${REQ_data_list_to_check}   create list
      ${list}=   create list   bankcase
      ${data}=   create list  ${list}
      create file    ${CURDIR}/Data/${directory}.csv
      Append To Csv File     ${CURDIR}/Data/${directory}.csv    ${data}
      Append To List     ${REQ_data_list_to_check}     ${list} 
      set test variable    ${REQ_data_list_to_check}

Create money trail file CSV trail report invalid file name format CSV
     ${REQ_data_list_to_check}   create list
      ${list}=   create list   bankcaseid
      ${data}=   create list  ${list}
      create file    ${CURDIR}/Data/${directory}.CSV
      Append To Csv File     ${CURDIR}/Data/${directory}.CSV    ${data}
      Append To List     ${REQ_data_list_to_check}     ${list} 
      set test variable    ${REQ_data_list_to_check}


Create money trail file CSV trail report invalid file name format xlsx
     ${REQ_data_list_to_check}   create list
      ${list}=   create list   bankcaseid;
      ${data}=   create list  ${list}
      create file    ${CURDIR}/Data/${directory}.xlsx
      Append To Csv File     ${CURDIR}/Data/${directory}.xlsx    ${data}
      Append To List     ${REQ_data_list_to_check}     ${list} 
      set test variable    ${REQ_data_list_to_check}

Create money trail file CSV trail report no bankcaseid
     ${REQ_data_list_to_check}   create list
      ${list}=   create list
      ${data}=   create list  ${list}
      create file    ${CURDIR}/Data/${directory}.csv
      Append To Csv File     ${CURDIR}/Data/${directory}.csv    ${data}
      Append To List     ${REQ_data_list_to_check}     ${list} 
      set test variable    ${REQ_data_list_to_check}

Create Data add Money trail file name format xlsx
      ${list}=   create list   ${MASTER_CASE_ID}      
      ${data}=   create list  ${list}
      Append To Csv File     ${CURDIR}/Data/${directory}.xlsx    ${data}
      Set Test Variable   ${list}

Create Data add Money trail file name format CSV
      ${list}=   create list   ${MASTER_CASE_ID}      
      ${data}=   create list  ${list}
      Append To Csv File     ${CURDIR}/Data/${directory}.CSV    ${data}
      Set Test Variable   ${list}

Get data master bank case id ${row_number}
        connect to cfr database horse
        ${list_master_case_ids}=    Create List
        ${sql}=   catenate        select MASTER_CASE_ID from FRAUDCASE fetch first ${row_number} rows only
        ${query}=   query_all     ${db_connect}     ${sql}     # query
        ${LEN_GENFILE}=  Get Length    ${query}
        FOR    ${index}    IN RANGE    ${LEN_GENFILE}
            ${result}=   set variable    ${query[${index}]}
            ${MASTER_CASE_ID}=    set variable    ${result}[MASTER_CASE_ID]
            Append To List    ${list_master_case_ids}    ${MASTER_CASE_ID}
            set test variable   ${MASTER_CASE_ID}
            Create Data add Money trail
            log   ${index}
        END
            set test variable   ${list_master_case_ids}

Get data master bankcase id does not found
    ${list_master_case_ids}=    Create List    # สร้าง List สำหรับเก็บข้อมูล
    Append To List    ${list_master_case_ids}    25650322BBL00091
    Append To List    ${list_master_case_ids}    25650322SCB00092
    Append To List    ${list_master_case_ids}    25650322BBL00093
    Append To List    ${list_master_case_ids}    25650322TTB00094
    Append To List    ${list_master_case_ids}    25650322SCB00095
    Append To List    ${list_master_case_ids}    25650322BBL00096
    Append To List    ${list_master_case_ids}    25650322TTB00097
    ${joined_data}=    Catenate    SEPARATOR=\n    @{list_master_case_ids}    # รวมข้อมูลเป็นข้อความเดียว โดยใช้ \n เป็นตัวคั่นบรรทัด    
    Append To File    ${CURDIR}/Data/${directory}.csv    ${joined_data}    # บันทึกข้อมูลลงไฟล์ CSV
    Set Test Variable    ${list_master_case_ids}    # กำหนดตัวแปรสำหรับการทดสอบ

Get data master bank case id ${row_number} semicolon
        connect to cfr database horse
        ${list_master_case_ids}=    Create List
        ${sql}=   catenate        select MASTER_CASE_ID from FRAUDCASE fetch first ${row_number} rows only
        ${query}=   query_all     ${db_connect}     ${sql}     # query
        ${LEN_GENFILE}=  Get Length    ${query}
        FOR    ${index}    IN RANGE    ${LEN_GENFILE}
            ${result}=   set variable    ${query[${index}]}
            ${MASTER_CASE_ID}=    set variable    ${result}[MASTER_CASE_ID]
            Append To List    ${list_master_case_ids}    ${MASTER_CASE_ID}
            set test variable   ${MASTER_CASE_ID}
            Create Data add Money trail semicolon
            log   ${index}
        END
            set test variable   ${list_master_case_ids}

Get data master bank case id ${row_number} Duplicates
    connect to cfr database horse
    ${list_master_case_ids}=    Create List
    ${sql}=   catenate        select MASTER_CASE_ID from FRAUDCASE fetch first ${row_number} rows only
    ${query}=   query_all     ${db_connect}     ${sql}     # query
    Log    Query Data: ${query}
    ${LEN_GENFILE}=  Get Length    ${query}
    FOR    ${index}    IN RANGE    ${LEN_GENFILE}
        ${result}=   Set Variable    ${query[${index}]}
        ${MASTER_CASE_ID}=    Set Variable    ${result}[MASTER_CASE_ID]
        Log    Query Result: ${result}
        Log    MASTER_CASE_ID: ${MASTER_CASE_ID}
        Append To List    ${list_master_case_ids}    ${MASTER_CASE_ID}
        Log    Updated List: ${list_master_case_ids}
        Set Test Variable   ${MASTER_CASE_ID}
        Create Data add Money trail กuplicates
        Log   ${index}
    END
    Set Test Variable   ${list_master_case_ids}

Create Data add Money trail กuplicates
      ${list}=   create list   ${MASTER_CASE_ID}
    #   ${data}=   create list  ${list}
      ${data}=   create list  26000221KTB09991
      Append To Csv File     ${CURDIR}/Data/${directory}.csv    ${data}
      Set Test Variable   ${list}

Get data master bank case id ${row_number} missing required field bankcaseid
    connect to cfr database horse
    ${list_master_case_ids}=    Create List
    ${sql}=   catenate        select MASTER_CASE_ID from FRAUDCASE fetch first ${row_number} rows only
    ${query}=   query_all     ${db_connect}     ${sql}     # query
    Log    Query Data: ${query}
    ${LEN_GENFILE}=  Get Length    ${query}
    FOR    ${index}    IN RANGE    ${LEN_GENFILE}
        ${result}=   Set Variable    ${query[${index}]}
        ${MASTER_CASE_ID}=    Set Variable    ${result}[MASTER_CASE_ID]
        Log    Query Result: ${result}
        Log    MASTER_CASE_ID: ${MASTER_CASE_ID}
        Append To List    ${list_master_case_ids}    ${MASTER_CASE_ID}     ${EMPTY}
            IF    ${index} == 1
                Append To List    ${list_master_case_ids}
            END
        Log    Updated List: ${list_master_case_ids}
        Set Test Variable   ${MASTER_CASE_ID}
        Log   ${index}
    END
    ${joined_data}=    Catenate    SEPARATOR=\n    @{list_master_case_ids}    # รวมข้อมูลทั้งหมดให้เป็นข้อความเดียวกัน (ใช้ \n คั่นบรรทัด)
    Append To File    ${CURDIR}/Data/${directory}.csv    ${joined_data}    # บันทึกลงไฟล์ CSV
    Set Test Variable   ${list_master_case_ids}

Create Data add Money trail missing required field bankcaseid
    ${list}=   create list   ${MASTER_CASE_ID}
      ${data}=   create list  ${list}
      Append To Csv File     ${CURDIR}/Data/${directory}.csv    ${data}
      Set Test Variable   ${list}

Create Data add Money trail semicolon
      ${list}=   create list   ${MASTER_CASE_ID};
      ${data}=   create list  ${list}
      Append To Csv File     ${CURDIR}/Data/${directory}.csv    ${data}
      Set Test Variable   ${list}

Get data master bank case id ${row_number} invalid format bankcaseid
    connect to cfr database horse
    ${list_master_case_ids}=    Create List
    ${sql}=   Catenate    select MASTER_CASE_ID from FRAUDCASE fetch first ${row_number} rows only
    ${query}=   query_all    ${db_connect}    ${sql}
    ${LEN_GENFILE}=  Get Length    ${query}
        FOR    ${index}    IN RANGE    ${LEN_GENFILE}
            ${result}=   set variable    ${query[${index}]}
            ${MASTER_CASE_ID}=    set variable    ${result}[MASTER_CASE_ID]
            Append To List    ${list_master_case_ids}    ${MASTER_CASE_ID}
            set test variable   ${MASTER_CASE_ID}
            log   ${index}
        END
    Append To List    ${list_master_case_ids}    25670209
    ${joined_data}=    Catenate    SEPARATOR=\n    @{list_master_case_ids}
    Append To File    ${CURDIR}/Data/${directory}.csv    ${joined_data}
    Set Test Variable    ${list_master_case_ids}

Get data master bank case id ${row_number} xlsx
        connect to cfr database horse
        ${list_master_case_ids}=    Create List
        ${sql}=   catenate        select MASTER_CASE_ID from FRAUDCASE fetch first ${row_number} rows only
        ${query}=   query_all     ${db_connect}     ${sql}     # query
        ${LEN_GENFILE}=  Get Length    ${query}
        FOR    ${index}    IN RANGE    ${LEN_GENFILE}
            ${result}=   set variable    ${query[${index}]}
            ${MASTER_CASE_ID}=    set variable    ${result}[MASTER_CASE_ID]
            Append To List    ${list_master_case_ids}    ${MASTER_CASE_ID}
            set test variable   ${MASTER_CASE_ID}
            Create Data add Money trail file name format xlsx
            log   ${index}
        END
            set test variable   ${list_master_case_ids}

Get data master bank case id ${row_number} CSV
        connect to cfr database horse
        ${list_master_case_ids}=    Create List
        ${sql}=   catenate        select MASTER_CASE_ID from FRAUDCASE fetch first ${row_number} rows only
        ${query}=   query_all     ${db_connect}     ${sql}     # query
        ${LEN_GENFILE}=  Get Length    ${query}
        FOR    ${index}    IN RANGE    ${LEN_GENFILE}
            ${result}=   set variable    ${query[${index}]}
            ${MASTER_CASE_ID}=    set variable    ${result}[MASTER_CASE_ID]
            Append To List    ${list_master_case_ids}    ${MASTER_CASE_ID}
            set test variable   ${MASTER_CASE_ID}
            Create Data add Money trail file name format CSV
            log   ${index}
        END
            set test variable   ${list_master_case_ids}
 
Encrypt file GPG name to nitmx ${FILE_NAME_CSV} 
    Private key and file path ${FILE_NAME_CSV}
    ${PRIVATE_KEY_PATH}=  Set Variable   ${PRIVATE_KEY_PATH_TO}
    ${FILEPATH}=  Set Variable  ${FILEPATH_CSV}
    ${input_file}  set variable    ${FILEPATH}
    ${DATA}  set variable    ${FILEPATH}
    ${output_file}  set variable   ${OUT_PATH_GPG}
    ${recipients}   set variable   ${secret_key}
    ${result}=   Sign And Encrypt Csv   ${PRIVATE_KEY_PATH}  ${DATA}  ${input_file}  ${output_file}  ${recipients}    ${Pass.AOC}
    ${signature}    ${output_path}=    Set Variable    ${result}
    Log    Signature: ${signature}
    Log    Output Path: ${output_path}

# Encrypt file GPG name to nitmx ${FILE_NAME_CSV} and validate signature value key ${keyIS}
#     Private key and file path ${FILE_NAME_CSV}
#     ${PRIVATE_KEY_PATH}=  Set Variable   ${PRIVATE_KEY_PATH_TO}
#     ${FILEPATH}=  Set Variable  ${FILEPATH_CSV}
#     ${input_file}  set variable    ${FILEPATH}
#     ${DATA}  set variable    ${FILEPATH}
#     ${output_file}  set variable   ${OUT_PATH_GPG}
#     ${recipients}   set variable   ${secret_key}
#     ${result}=   Sign And Encrypt Csv   ${PRIVATE_KEY_PATH}  ${DATA}  ${input_file}  ${output_file}  ${recipients}    ${Pass.BANK002}
#     ${signature}    ${output_path}=    Set Variable    ${result}
#     Log    Signature: ${signature}
#     Log    Output Path: ${output_path}

Encrypt file GPG name to nitmx ${FILE_NAME_CSV} CSV
    Private key and file path ${FILE_NAME_CSV} CSV
    ${PRIVATE_KEY_PATH}=  Set Variable   ${PRIVATE_KEY_PATH_TO}
    ${FILEPATH}=  Set Variable  ${FILEPATH_CSV}
    ${input_file}  set variable    ${FILEPATH}
    ${DATA}  set variable    ${FILEPATH}
    ${output_file}  set variable   ${OUT_PATH_GPG}
    ${recipients}   set variable   ${secret_key}
    ${result}=   Sign And Encrypt Csv   ${PRIVATE_KEY_PATH}  ${DATA}  ${input_file}  ${output_file}  ${recipients}    ${Pass.AOC}
    ${signature}    ${output_path}=    Set Variable    ${result}
    Log    Signature: ${signature}
    Log    Output Path: ${output_path}

Encrypt file GPG name to nitmx ${FILE_NAME_CSV} xlsx
    Private key and file path ${FILE_NAME_CSV} xlsx
    ${PRIVATE_KEY_PATH}=  Set Variable   ${PRIVATE_KEY_PATH_TO}
    ${FILEPATH}=  Set Variable  ${FILEPATH_CSV}
    ${input_file}  set variable    ${FILEPATH}
    ${DATA}  set variable    ${FILEPATH}
    ${output_file}  set variable   ${OUT_PATH_GPG}
    ${recipients}   set variable   ${secret_key}
    ${result}=   Sign And Encrypt Csv   ${PRIVATE_KEY_PATH}  ${DATA}  ${input_file}  ${output_file}  ${recipients}    ${Pass.AOC}
    ${signature}    ${output_path}=    Set Variable    ${result}
    Log    Signature: ${signature}
    Log    Output Path: ${output_path}

Private key and file path ${FILE_NAME_CSV} CSV
  Set test Variable   ${PRIVATE_KEY_PATH_TO}    ${CURDIR}\\${SECAOC}.sec
  Set test Variable   ${FILEPATH_CSV}    ${CURDIR}\\Data/${FILE_NAME_CSV}.CSV
  set test variable   ${OUT_PATH_GPG}    ${CURDIR}\\Data/${FILE_NAME_CSV}.gpg

Private key and file path ${FILE_NAME_CSV} xlsx
  Set test Variable   ${PRIVATE_KEY_PATH_TO}    ${CURDIR}\\${SECAOC}.sec
  Set test Variable   ${FILEPATH_CSV}    ${CURDIR}\\Data/${FILE_NAME_CSV}.xlsx
  set test variable   ${OUT_PATH_GPG}    ${CURDIR}\\Data/${FILE_NAME_CSV}.gpg

Call API Sending file Money trail from aoc to ITMX MTR
    ${API_URL}=   Set Variable     ${Host_GET}
    Create Session  MoneytrailAPI    ${API_URL}
    ${response}=    POST On Session   MoneytrailAPI  ${path.MoneytrailAPI}    expected_status=any
    set test variable     ${response}

Call API Sending file Money trail from aoc to ITMX MTR RED
    ${API_URL}=   Set Variable     ${Host_GET}
    Create Session  MoneytrailAPI    ${API_URL}
    ${response}=    POST On Session   MoneytrailAPI  ${path.MoneytrailAPI}    expected_status=any
    set test variable     ${Response_MTR_1}

Get file GPG from ITMX for Money trail report
    ${Response_MTR_gpg}=     set variable     ${Response_MTR}.gpg
    ${Response_MTR_csv}=     set variable     ${Response_MTR}.csv
    set test variable    ${Response_MTR_gpg}
    set test variable    ${Response_MTR_csv}
    WHILE    ${RETRY_COUNT} < ${MAX_RETRIES}
    sleep    5s
    ${outbound_exists}=    Run Keyword And Return Status    SSHLibrary.File Should Exist   /home/sftpaoc/${ENVAOC}/cfr/MTR_Onetime/outbound/${Response_MTR_gpg_}
    ${inbound_exists}=    Run Keyword And Return Status    SSHLibrary.File Should Exist   /home/sftpaoc/${ENVAOC}/cfr/MTR_Onetime/inbound/archive/${Request_MTR}.gpg
    Run Keyword If    ${RETRY_COUNT} == ${MAX_RETRIES}    Fail    "File not found after ${MAX_RETRIES} retries."
    ${RETRY_COUNT}=    Evaluate    ${RETRY_COUNT} + 1
    Run Keyword If    ${outbound_exists} and ${inbound_exists}    Exit For Loop
    END
    SSHLibrary.Get File     /home/sftpaoc/${ENVAOC}/cfr/MTR_Onetime/outbound/${Response_MTR_gpg}     ${CURDIR}/Data/${Response_MTR_gpg}
    ${gpg_file_path}=  Set Variable  ${CURDIR}/Data/${Response_MTR_gpg}
    ${output_csv_path}=  Set Variable  ${CURDIR}/Data/${Response_MTR_csv}
    ${passphrase}=  Set Variable   ${Pass.AOC}
     ${result}=    Decrypt Gpg File    ${gpg_file_path}  ${output_csv_path}  ${passphrase}
    Log    ${result}
    wait until created    ${CURDIR}/Data/${Response_MTR_gpg}   2s
    wait until created    ${CURDIR}/Data/${Response_MTR_csv}   2s
    set test variable   ${CSV_FILE}     ${CURDIR}/Data/${Response_MTR_csv}
    set test variable   ${GPG_FILE}     ${CURDIR}/Data/${Response_MTR_gpg}
    set test variable   ${GPG_FILE_REQ}     ${CURDIR}/Data/${filename}.gpg
    set test variable   ${CSV_FILE_REQ}     ${CURDIR}/Data/${filename}.csv

Get file GPG from ITMX for Money trail report red
    ${Response_MTR_gpg_1}=     set variable     ${Response_MTR_1}.gpg
    ${Response_MTR_csv}=     set variable     ${Response_MTR_1}.csv
    set test variable    ${Response_MTR_gpg_1}
    set test variable    ${Response_MTR_csv}
    WHILE    ${RETRY_COUNT} < ${MAX_RETRIES}
    sleep    5s
    ${outbound_exists}=    Run Keyword And Return Status    SSHLibrary.File Should Exist   /home/sftpaoc/${ENVAOC}/cfr/MTR_Onetime/outbound/${Response_MTR_gpg_1_}
    ${inbound_exists}=    Run Keyword And Return Status    SSHLibrary.File Should Exist   /home/sftpaoc/${ENVAOC}/cfr/MTR_Onetime/inbound/archive/${Request_MTR_1}.gpg
    Run Keyword If    ${RETRY_COUNT} == ${MAX_RETRIES}    Fail    "File not found after ${MAX_RETRIES} retries."
    ${RETRY_COUNT}=    Evaluate    ${RETRY_COUNT} + 1
    Run Keyword If    ${outbound_exists} and ${inbound_exists}    Exit For Loop
    END
    SSHLibrary.Get File     /home/sftpaoc/${ENVAOC}/cfr/MTR_Onetime/outbound/${Response_MTR_gpg_1}     ${CURDIR}/Data/${Response_MTR_gpg_1}
    ${gpg_file_path}=  Set Variable  ${CURDIR}/Data/${Response_MTR_gpg_1}
    ${output_csv_path}=  Set Variable  ${CURDIR}/Data/${Response_MTR_csv}
    ${passphrase}=  Set Variable   ${Pass.AOC}
     ${result}=    Decrypt Gpg File    ${gpg_file_path}  ${output_csv_path}  ${passphrase}
    Log    ${result}
    wait until created    ${CURDIR}/Data/${Response_MTR_gpg_1}   2s
    wait until created    ${CURDIR}/Data/${Response_MTR_csv}   2s
    set test variable   ${CSV_FILE}     ${CURDIR}/Data/${Response_MTR_csv}
    set test variable   ${GPG_FILE}     ${CURDIR}/Data/${Response_MTR_gpg_1}
    set test variable   ${GPG_FILE_REQ}     ${CURDIR}/Data/${filename}.gpg
    set test variable   ${CSV_FILE_REQ}     ${CURDIR}/Data/${filename}.csv

Get file GPG from ITMX for Money trail report 1000 Record
    ${Response_MTR_gpg}=     set variable     ${Response_MTR}.gpg
    ${Response_MTR_csv}=     set variable     ${Response_MTR}.csv
    set test variable    ${Response_MTR_gpg}
    set test variable    ${Response_MTR_csv}
    WHILE    ${RETRY_COUNT} < ${MAX_RETRIES}
    sleep    5s
    ${outbound_exists}=    Run Keyword And Return Status    SSHLibrary.File Should Exist   /home/sftpaoc/${ENVAOC}/cfr/MTR_Onetime/outbound/${Response_MTR_gpg}
    sleep    20s
    ${inbound_exists}=    Run Keyword And Return Status    SSHLibrary.File Should Exist   /home/sftpaoc/${ENVAOC}/cfr/MTR_Onetime/inbound/archive/${Request_MTR}.gpg
    sleep    20s
    Run Keyword If    ${RETRY_COUNT} == ${MAX_RETRIES}    Fail    "File not found after ${MAX_RETRIES} retries."
    ${RETRY_COUNT}=    Evaluate    ${RETRY_COUNT} + 1
    Run Keyword If    ${outbound_exists} and ${inbound_exists}    Exit For Loop
    END
    SSHLibrary.Get File     /home/sftpaoc/${ENVAOC}/cfr/MTR_Onetime/outbound/${Response_MTR_gpg}     ${CURDIR}/Data/${Response_MTR_gpg}
    ${gpg_file_path}=  Set Variable  ${CURDIR}/Data/${Response_MTR_gpg}
    ${output_csv_path}=  Set Variable  ${CURDIR}/Data/${Response_MTR_csv}
    ${passphrase}=  Set Variable   ${Pass.AOC}
     ${result}=    Decrypt Gpg File    ${gpg_file_path}  ${output_csv_path}  ${passphrase}
    Log    ${result}
    wait until created    ${CURDIR}/Data/${Response_MTR_gpg}   2s
    wait until created    ${CURDIR}/Data/${Response_MTR_csv}   2s
    set test variable   ${CSV_FILE}     ${CURDIR}/Data/${Response_MTR_csv}
    set test variable   ${GPG_FILE}     ${CURDIR}/Data/${Response_MTR_gpg}
    set test variable   ${GPG_FILE_REQ}     ${CURDIR}/Data/${filename}.gpg
    set test variable   ${CSV_FILE_REQ}     ${CURDIR}/Data/${filename}.csv

Get file GPG from ITMX for Money trail report xlsx
    ${Response_MTR_gpg}=     set variable     ${Response_MTR}.gpg
    ${Response_MTR_csv}=     set variable     ${Response_MTR}.csv
    set test variable    ${Response_MTR_gpg}
    set test variable    ${Response_MTR_csv}
    WHILE    ${RETRY_COUNT} < ${MAX_RETRIES}
    sleep    5s
    ${outbound_exists}=    Run Keyword And Return Status    SSHLibrary.File Should Exist   /home/sftpaoc/${ENVAOC}/cfr/MTR_Onetime/outbound/${Response_MTR_gpg_}
    ${inbound_exists}=    Run Keyword And Return Status    SSHLibrary.File Should Exist   /home/sftpaoc/${ENVAOC}/cfr/MTR_Onetime/inbound/archive/${Request_MTR}.gpg
    Run Keyword If    ${RETRY_COUNT} == ${MAX_RETRIES}    Fail    "File not found after ${MAX_RETRIES} retries."
    ${RETRY_COUNT}=    Evaluate    ${RETRY_COUNT} + 1
    Run Keyword If    ${outbound_exists} and ${inbound_exists}    Exit For Loop
    END
    SSHLibrary.Get File     /home/sftpaoc/${ENVAOC}/cfr/MTR_Onetime/outbound/${Response_MTR_gpg}     ${CURDIR}/Data/${Response_MTR_gpg}
    ${gpg_file_path}=  Set Variable  ${CURDIR}/Data/${Response_MTR_gpg}
    ${output_csv_path}=  Set Variable  ${CURDIR}/Data/${Response_MTR_csv}
    ${passphrase}=  Set Variable   ${Pass.AOC}
     ${result}=    Decrypt Gpg File    ${gpg_file_path}  ${output_csv_path}  ${passphrase}
    Log    ${result}
    wait until created    ${CURDIR}/Data/${Response_MTR_gpg}   2s
    wait until created    ${CURDIR}/Data/${Response_MTR_csv}   2s
    set test variable   ${CSV_FILE}     ${CURDIR}/Data/${Response_MTR_csv}
    set test variable   ${GPG_FILE}     ${CURDIR}/Data/${Response_MTR_gpg}
    set test variable   ${GPG_FILE_REQ}     ${CURDIR}/Data/${filename}.gpg
    set test variable   ${CSV_FILE_REQ}     ${CURDIR}/Data/${filename}.csv

Check response code ${fail} GPG file money trail report
    ${csv_list}=   Read Csv File To List      ${CSV_FILE}
    ${csv_list}=   Evaluate    [ row for row in ${csv_list} if not row[0].startswith('#') ]    modules=builtins
    ${total_res}=   Get Length   ${csv_list} 
    FOR    ${index}    IN RANGE    1    ${total_res}   
        ${data_total}=    Get From List   ${csv_list}    ${index}
        ${data_responcode}=    Get From List   ${data_total}    0
        ${split_data}=    Split String    ${data_responcode}    ;
        ${MTR_Code_Res}=         Get From List    ${split_data}    0
        ${MTR_message_Res}=        Get From List    ${split_data}    1
        ${MTR_bankcase_Res}=         Get From List    ${split_data}    2
        ${MRT_TS_Res}=        Get From List    ${split_data}    3
    Should Be Equal As Strings     ${MTR_Code_Res}     ${Res_Aoc.Fail.${Fail}.code}
    Should Be Equal As Strings     ${MTR_message_Res}     ${Res_Aoc.Fail.${Fail}.msg_bank}
    Should Not Be Empty     ${MRT_TS_Res}
    log      ${index}
    END

Check response code ${fail} GPG file money trail report 1
    ${csv_list}=   Read Csv File To List      ${CSV_FILE}
    ${csv_list}=   Evaluate    [ row for row in ${csv_list} if not row[0].startswith('#') ]    modules=builtins
    ${total_res}=   Get Length   ${csv_list} 
    FOR    ${index}    IN RANGE    1    ${total_res}   
        ${data_total}=    Get From List   ${csv_list}    ${index}
        ${data_responcode}=    Get From List   ${data_total}    0
        ${split_data}=    Split String    ${data_responcode}    ;
        ${MTR_Code_Res}=         Get From List    ${split_data}    0
        ${MTR_message_Res}=        Get From List    ${split_data}    1
        ${MTR_bankcase_Res}=         Get From List    ${split_data}    2
        ${MRT_TS_Res}=        Get From List    ${split_data}    2
    # Should Be Equal As Strings     ${MTR_Code_Res}     ${Res_Aoc.Fail.${Fail}.code}
    # Should Be Equal As Strings     ${MTR_message_Res}     ${Res_Aoc.Fail.${Fail}.msg_bank}
    Should Not Be Empty     ${MRT_TS_Res}
    log      ${index}
    END

Check response code ${fail} GPG file money trail report test 1
    ${csv_list}=   Read Csv File To List      ${CSV_FILE}
    ${csv_list}=   Evaluate    [ row for row in ${csv_list} if not row[0].startswith('#') ]    modules=builtins
    ${total_res}=   Get Length   ${csv_list} 
    FOR    ${index}    IN RANGE    1    ${total_res}   
        ${data_total}=    Get From List   ${csv_list}    ${index}
        ${data_responcode}=    Get From List   ${data_total}    0
        ${split_data}=    Split String    ${data_responcode}    ;
        ${MTR_Code_Res}=         Get From List    ${split_data}    0
        ${MTR_message_Res}=        Get From List    ${split_data}    1
        ${MTR_bankcase_Res}=         Get From List    ${split_data}    2
        ${MRT_TS_Res}=        Get From List    ${split_data}    2
    Should Be Equal As Strings     ${MTR_Code_Res}     ${Res_Aoc.Fail.${Fail}.code}
    Should Be Equal As Strings     ${MTR_message_Res}     ${Res_Aoc.Fail.${Fail}.msg}
    Should Not Be Empty     ${MRT_TS_Res}
    log      ${index}
    END

Check response code ${fail} GPG file money trail report test 2
    ${csv_list}=   Read Csv File To List      ${CSV_FILE}
    ${csv_list}=   Evaluate    [ row for row in ${csv_list} if not row[0].startswith('#') ]    modules=builtins
    ${total_res}=   Get Length   ${csv_list} 
    FOR    ${index}    IN RANGE    1    ${total_res}   
        ${data_total}=    Get From List   ${csv_list}    ${index}
        ${data_responcode}=    Get From List   ${data_total}    0
        ${split_data}=    Split String    ${data_responcode}    ;
        ${MTR_Code_Res}=         Get From List    ${split_data}    0
        ${MTR_message_Res}=        Get From List    ${split_data}    1
        ${MTR_bankcase_Res}=         Get From List    ${split_data}    2
        ${MRT_TS_Res}=        Get From List    ${split_data}    2
    # Should Be Equal As Strings     ${MTR_Code_Res}     ${Res_Aoc.Fail.${Fail}.code}
    # Should Be Equal As Strings     ${MTR_message_Res}     ${Res_Aoc.Fail.${Fail}.msg}
    Should Not Be Empty     ${MRT_TS_Res}
    log      ${index}
    END

Check response code ${fail} GPG file money trail report test
    # ${res_data}=    Load YAML    ${YAML_FILE}
    ${fail_key}=    Set Variable    Some records are duplicate within the same file
    ${fail_code}=    Set Variable    6609

    ${csv_list}=   Read Csv File To List      ${CSV_FILE}
    ${csv_list}=   Evaluate    [ row for row in ${csv_list} if not row[0].startswith('#') ]    modules=builtins
    ${total_res}=   Get Length   ${csv_list} 

    FOR    ${index}    IN RANGE    1    ${total_res}   
        ${data_total}=    Get From List   ${csv_list}    ${index}
        ${data_responcode}=    Get From List   ${data_total}    0
        ${split_data}=    Split String    ${data_responcode}    ;
        ${MTR_Code_Res}=         Get From List    ${split_data}    0
        ${MTR_message_Res}=        Get From List    ${split_data}    1
        ${MTR_bankcase_Res}=         Get From List    ${split_data}    2
        ${MRT_TS_Res}=        Get From List    ${split_data}    3
        # Should Be Equal As Strings     ${MTR_Code_Res}     ${Res_Aoc.Fail.${Fail}.code}
        # Should Be Equal As Strings     ${MTR_message_Res}     ${Res_Aoc.Fail.${Fail}.msg}
        Should Not Be Empty     ${MRT_TS_Res}
    
        log      ${index}
    END

Check response code ${fail} GPG file money trail report code 1
    ${csv_list}=   Read Csv File To List      ${CSV_FILE}
    # ${csv_list}=   Evaluate    [ row for row in ${csv_list} if not row[0].startswith('#') ]    modules=builtins
    ${total_res}=   Get Length   ${csv_list} 
    FOR    ${index}    IN RANGE    1    ${total_res}   
        ${data_total}=    Get From List   ${csv_list}    ${index}
        ${data_responcode}=    Get From List   ${data_total}    0
        ${split_data}=    Split String    ${data_responcode}    ;

        Log    ${split_data}  # ตรวจสอบค่า split_data ก่อน
        
        ${MTR_Code_Res}=         Get From List    ${split_data}    0
        ${MTR_message_Res}=        Get From List    ${split_data}    1
        ${MTR_bankcase_Res}=         Get From List    ${split_data}    2
        ${MRT_TS_Res}=        Get From List    ${split_data}    1

        Log    ${MTR_Code_Res}
        Log    ${MTR_message_Res}

        # เพิ่มการตรวจสอบค่าที่เป็น '-' หรือค่าผิดปกติ
        Run Keyword If    '${MTR_Code_Res}' == '-'    Log    "Invalid MTR_Code_Res: ${MTR_Code_Res}"    ELSE    Should Be Equal As Strings    ${MTR_Code_Res}    ${ResHS.${Fail}.code}

        Run Keyword If    '${MTR_message_Res}' == '-'    Log    "Invalid MTR_message_Res: ${MTR_message_Res}"    ELSE    Should Be Equal As Strings    ${MTR_message_Res}    ${ResHS.${Fail}.msg}

        # ตรวจสอบว่า ${MRT_TS_Res} ไม่ว่าง
        Should Not Be Empty     ${MRT_TS_Res}
        log      ${index}
    END

Check response code ${fail} GPG file money trail report code 2
    ${csv_list}=   Read Csv File To List      ${CSV_FILE}
    # ${csv_list}=   Evaluate    [ row for row in ${csv_list} if not row[0].startswith('#') ]    modules=builtins
    ${total_res}=   Get Length   ${csv_list} 
    FOR    ${index}    IN RANGE    1    ${total_res}   
        ${data_total}=    Get From List   ${csv_list}    ${index}
        ${data_responcode}=    Get From List   ${data_total}    0
        ${split_data}=    Split String    ${data_responcode}    ;

        Log    ${split_data}  # ตรวจสอบค่า split_data ก่อน
        
        ${MTR_Code_Res}=         Get From List    ${split_data}    0
        ${MTR_message_Res}=        Get From List    ${split_data}    1
        ${MTR_bankcase_Res}=         Get From List    ${split_data}    2
        ${MRT_TS_Res}=        Get From List    ${split_data}    1

        Log    ${MTR_Code_Res}
        Log    ${MTR_message_Res}

        # เพิ่มการตรวจสอบค่าที่เป็น '-' หรือค่าผิดปกติ
        Run Keyword If    '${MTR_Code_Res}' == '-'    Log    "Invalid MTR_Code_Res: ${MTR_Code_Res}"    ELSE    Should Be Equal As Strings    ${MTR_Code_Res}    ${Res_Aoc.Fail.${Fail}.code}

        Run Keyword If    '${MTR_message_Res}' == '-'    Log    "Invalid MTR_message_Res: ${MTR_message_Res}"    ELSE    Should Be Equal As Strings    ${MTR_message_Res}    ${Res_Aoc.Fail.${Fail}.msg}

        # ตรวจสอบว่า ${MRT_TS_Res} ไม่ว่าง
        Should Not Be Empty     ${MRT_TS_Res}
    log      ${index}
    END

Check response code Invalid_file_name GPG file money trail report code 3
    ${csv_list}=   CSVLibrary.Read Csv File To List   ${CSV_FILE}
    ${total_res}=   BuiltIn.Get Length   ${csv_list}

    FOR    ${index}    IN RANGE    1    ${total_res}
        ${data_total}=   Collections.Get From List   ${csv_list}    ${index}
        ${data_responcode}=   Collections.Get From List   ${data_total}    0
        ${split_data}=   String.Split String   ${data_responcode}    ;

        BuiltIn.Log   ${split_data}

        # ตรวจสอบค่าที่ได้
        ${MTR_Code_Res}=   Collections.Get From List    ${split_data}    0
        ${MTR_message_Res}=   Collections.Get From List    ${split_data}    1
        ${MTR_bankcase_Res}=   Collections.Get From List    ${split_data}    2
        ${MRT_TS_Res}=   Collections.Get From List    ${split_data}    2

        BuiltIn.Log   ${MTR_Code_Res}
        BuiltIn.Log   ${MTR_message_Res}

        # เพิ่มการตรวจสอบค่าที่เป็น '-' หรือค่าผิดปกติ
        # Run Keyword If    '${MTR_Code_Res}' == '-'    BuiltIn.Log    "Invalid MTR_Code_Res: ${MTR_Code_Res}"    ELSE
        #     Should Be Equal As Strings    ${MTR_Code_Res}    ${ResHS.${fail}.code}

        # Run Keyword If    '${MTR_message_Res}' == '-'    BuiltIn.Log    "Invalid MTR_message_Res: ${MTR_message_Res}"    ELSE    
        #     Should Be Equal As Strings    ${MTR_message_Res}    ${ResHS.${Fail}.msg}

        # ตรวจสอบว่า ${MRT_TS_Res} ไม่ว่าง
        BuiltIn.Should Not Be Empty     ${MRT_TS_Res}

        BuiltIn.Log      ${index}
    END


Check response code ${fail} GPG file money trail report duplicate_filename
    ${csv_list}=   Read Csv File To List      ${CSV_FILE}
    # log   this is master ids ${list_master_case_ids}
    # ${csv_list}=   Evaluate    [ row for row in ${csv_list} if not row[0].startswith('#') ]    modules=builtins
    ${total_res}=   Get Length   ${csv_list} 

    FOR    ${index}    IN RANGE    1    ${total_res}   
        ${data_total}=    Get From List   ${csv_list}    ${index}
        ${data_responcode}=    Get From List   ${data_total}    0
        ${split_data}=    Split String    ${data_responcode}    ;
        ${MTR_Code_Res}=         Get From List    ${split_data}    0
        ${MTR_message_Res}=        Get From List    ${split_data}    1
        ${MTR_bankcase_Res}=         Get From List    ${split_data}    2
        ${MRT_TS_Res}=        Get From List    ${split_data}    3
        ${MTR_tickket_ID_Res}=        Get From List    ${split_data}    4

    Should Be Equal As Strings    ${MTR_Code_Res}     ${EMPTY}
    # Should Be Equal As Strings    ${MTR_message_Res}       ${ResHS.${fail}.msg}
    # Should Be Equal As Strings    ${MTR_bankcase_Res}       ${ResHS.${fail}.msg}
    Should Not Be Empty     ${MRT_TS_Res}
    log      ${index}
    END

Check db mtr onetime
    [Documentation]    Test Case SUBMIT
        BuiltIn.Sleep   10s
        connect to cfr database
        log  ${list_master_case_ids}
        ${result}=    Get Length     ${list_master_case_ids}
        FOR  ${index}    IN RANGE    0     ${result}   
        BuiltIn.Sleep   0.5s 
        ${MTR_bankcase_Res}=    Get From List   ${list_master_case_ids}    ${index}
       ${sql}=   catenate      SELECT ID,FILE_NAME FROM AOC_SFTP_WARRANT_REQUEST_FILE_INFO WHERE FILE_NAME = '${Request_MTR}.gpg'
        ${query}=   query_all     ${db_connect}     ${sql}     # query
        ${result}=   set variable    ${query[0]}
        ${REQ_ID_INFO}=    set variable    ${result}[ID]
        ${File_name_DB}=    set variable    ${result}[FILE_NAME]
        Set Test Variable    ${REQ_ID_INFO}
       ${sql}=   catenate      SELECT BANK_CASE_ID FROM AOC_SFTP_WARRANT_REQUEST_FILE_DETAIL WHERE FILE_ID = '${REQ_ID_INFO}' ORDER BY ROW_NUMBER ASC
        ${query}=   query_all     ${db_connect}     ${sql}     # query
        ${result}=   set variable    ${query[${index}]}
        ${DB_BANKCASE_ID}=    set variable    ${result}[BANK_CASE_ID]
        set test variable   ${DB_FILE_NAME_REQ}      ${File_name_DB}
        Should Be Equal As Strings     ${DB_BANKCASE_ID}      ${MTR_bankcase_Res}
        log     ${index}
        END   

Check db mtr onetime 2
    [Documentation]    Test Case SUBMIT
        BuiltIn.Sleep   10s
        connect to cfr database
        log  ${list_master_case_ids}
        ${result}=    Get Length     ${list_master_case_ids}
        FOR  ${index}    IN RANGE    0     ${result}   
        BuiltIn.Sleep   0.5s 
        ${MTR_bankcase_Res}=    Get From List   ${list_master_case_ids}    ${index}
       ${sql}=   catenate      SELECT ID,FILE_NAME FROM AOC_SFTP_WARRANT_REQUEST_FILE_INFO WHERE FILE_NAME = '${Request_MTR}.gpg'
        ${query}=   query_all     ${db_connect}     ${sql}     # query
        ${result}=   set variable    ${query[0]}
        ${REQ_ID_INFO}=    set variable    ${result}[ID]
        ${File_name_DB}=    set variable    ${result}[FILE_NAME]
        Set Test Variable    ${REQ_ID_INFO}
       ${sql}=   catenate      SELECT BANK_CASE_ID FROM AOC_SFTP_WARRANT_REQUEST_FILE_DETAIL WHERE FILE_ID = '${REQ_ID_INFO}' ORDER BY ROW_NUMBER ASC
        ${query}=   query_all     ${db_connect}     ${sql}     # query
        # ${result}=   set variable    ${query[${index}]}
        # ${DB_BANKCASE_ID}=    set variable    ${result}[BANK_CASE_ID]
        set test variable   ${DB_FILE_NAME_REQ}      ${File_name_DB}
        # Should Be Equal As Strings     ${DB_BANKCASE_ID}      ${MTR_bankcase_Res}
        log     ${index}
        END     

Check db req and res mrt onetime file to deleted 
        BuiltIn.Sleep   5s
        connect to cfr database
       ${sql}=   catenate      SELECT RESPONSE_FILE_NAME FROM AOC_SFTP_WARRANT_RESPONSE_FILE_INFO aswrfi  WHERE RESPONSE_FILE_NAME = '${Response_MTR_gpg}'
        ${query}=   query_all     ${db_connect}     ${sql}     # query
        ${result}=   set variable    ${query[0]}
        ${DB_FILE_NAME_RES}=    set variable    ${result}[RESPONSE_FILE_NAME]
        Should Be Equal As Strings     ${DB_FILE_NAME_RES}      ${Response_MTR_gpg}
        Should Be Equal As Strings     ${DB_FILE_NAME_REQ}      ${Request_MTR}.gpg
        Sleep    5s
       ${sql}=   catenate      DELETE FROM AOC_SFTP_WARRANT_RESPONSE_FILE_INFO aswrfi  WHERE RESPONSE_FILE_NAME = '${DB_FILE_NAME_RES}'
        ${query}=   update     ${db_connect}     ${sql}
       ${sql}=   catenate      DELETE FROM AOC_SFTP_WARRANT_REQUEST_FILE_DETAIL WHERE FILE_ID = '${REQ_ID_INFO}'
        ${query}=   update     ${db_connect}     ${sql}     # query
       ${sql}=   catenate      DELETE FROM AOC_SFTP_WARRANT_REQUEST_FILE_INFO WHERE FILE_NAME = '${DB_FILE_NAME_REQ}'
        ${query}=   update     ${db_connect}     ${sql}     # query
        Deleted file add

Deleted file add
    remove file    ${GPG_FILE}
    remove file    ${CSV_FILE}
    remove file    ${CURDIR}/Data/${DB_FILE_NAME_REQ}
    remove file    ${CURDIR}/Data/${Request_MTR}.csv

Check db req and res mrt onetime file to deleted xlsx
        BuiltIn.Sleep   5s
        connect to cfr database
       ${sql}=   catenate      SELECT RESPONSE_FILE_NAME FROM AOC_SFTP_WARRANT_RESPONSE_FILE_INFO aswrfi  WHERE RESPONSE_FILE_NAME = '${Response_MTR_gpg}'
        ${query}=   query_all     ${db_connect}     ${sql}     # query
        ${result}=   set variable    ${query[0]}
        ${DB_FILE_NAME_RES}=    set variable    ${result}[RESPONSE_FILE_NAME]
        Should Be Equal As Strings     ${DB_FILE_NAME_RES}      ${Response_MTR_gpg}
        Should Be Equal As Strings     ${DB_FILE_NAME_REQ}      ${Request_MTR}.gpg
        Sleep    5s
       ${sql}=   catenate      DELETE FROM AOC_SFTP_WARRANT_RESPONSE_FILE_INFO aswrfi  WHERE RESPONSE_FILE_NAME = '${DB_FILE_NAME_RES}'
        ${query}=   update     ${db_connect}     ${sql}
       ${sql}=   catenate      DELETE FROM AOC_SFTP_WARRANT_REQUEST_FILE_DETAIL WHERE FILE_ID = '${REQ_ID_INFO}'
        ${query}=   update     ${db_connect}     ${sql}     # query
       ${sql}=   catenate      DELETE FROM AOC_SFTP_WARRANT_REQUEST_FILE_INFO WHERE FILE_NAME = '${DB_FILE_NAME_REQ}'
        ${query}=   update     ${db_connect}     ${sql}     # query
        Deleted file xlsx

Deleted file xlsx
    remove file    ${GPG_FILE}
    remove file    ${CSV_FILE}
    remove file    ${CURDIR}/Data/${DB_FILE_NAME_REQ}
    remove file    ${CURDIR}/Data/${Request_MTR}.xlsx

Check db req and res mrt onetime file to deleted red
        BuiltIn.Sleep   5s
        connect to cfr database
       ${sql}=   catenate      SELECT RESPONSE_FILE_NAME FROM AOC_SFTP_WARRANT_RESPONSE_FILE_INFO aswrfi  WHERE RESPONSE_FILE_NAME = '${Response_MTR_gpg_1}'
        ${query}=   query_all     ${db_connect}     ${sql}     # query
        ${result}=   set variable    ${query[0]}
        ${DB_FILE_NAME_RES}=    set variable    ${result}[RESPONSE_FILE_NAME]
        Should Be Equal As Strings     ${DB_FILE_NAME_RES}      ${Response_MTR_gpg_1}
        Should Be Equal As Strings     ${DB_FILE_NAME_REQ}      ${Request_MTR}.gpg
        Sleep    5s
       ${sql}=   catenate      DELETE FROM AOC_SFTP_WARRANT_RESPONSE_FILE_INFO aswrfi  WHERE RESPONSE_FILE_NAME = '${DB_FILE_NAME_RES}'
        ${query}=   update     ${db_connect}     ${sql}
       ${sql}=   catenate      DELETE FROM AOC_SFTP_WARRANT_REQUEST_FILE_DETAIL WHERE FILE_ID = '${REQ_ID_INFO}'
        ${query}=   update     ${db_connect}     ${sql}     # query
       ${sql}=   catenate      DELETE FROM AOC_SFTP_WARRANT_REQUEST_FILE_INFO WHERE FILE_NAME = '${DB_FILE_NAME_REQ}'
        ${query}=   update     ${db_connect}     ${sql}     # query
        Deleted file req and res
Deleted file req and res
    remove file    ${GPG_FILE}
    remove file    ${CSV_FILE}
    remove file    ${CURDIR}/Data/${DB_FILE_NAME_REQ}
    remove file    ${CURDIR}/Data/${Request_MTR}.csv

Check db req and res mrt onetime file to deleted 2
        BuiltIn.Sleep   5s
        connect to cfr database
       ${sql}=   catenate      SELECT RESPONSE_FILE_NAME FROM AOC_SFTP_WARRANT_RESPONSE_FILE_INFO aswrfi  WHERE RESPONSE_FILE_NAME = '${Response_MTR_gpg}'
        ${query}=   query_all     ${db_connect}     ${sql}     # query
        ${result}=   set variable    ${query[0]}
        ${DB_FILE_NAME_RES}=    set variable    ${result}[RESPONSE_FILE_NAME]
        Should Be Equal As Strings     ${DB_FILE_NAME_RES}      ${Response_MTR_gpg}
        # Should Be Equal As Strings     ${DB_FILE_NAME_REQ}      ${Request_MTR}.gpg
        Sleep    5s
       ${sql}=   catenate      DELETE FROM AOC_SFTP_WARRANT_RESPONSE_FILE_INFO aswrfi  WHERE RESPONSE_FILE_NAME = '${DB_FILE_NAME_RES}'
        ${query}=   update     ${db_connect}     ${sql}
    #    ${sql}=   catenate      DELETE FROM AOC_SFTP_WARRANT_REQUEST_FILE_DETAIL WHERE FILE_ID = '${REQ_ID_INFO}'
    #     ${query}=   update     ${db_connect}     ${sql}     # query
    #    ${sql}=   catenate      DELETE FROM AOC_SFTP_WARRANT_REQUEST_FILE_INFO WHERE FILE_NAME = '${DB_FILE_NAME_REQ}'
    #     ${query}=   update     ${db_connect}     ${sql}     # query
Deleted file req and res 2
    remove file    ${GPG_FILE}
    remove file    ${CSV_FILE}
    remove file    ${CURDIR}/Data/${DB_FILE_NAME_REQ}
    remove file    ${CURDIR}/Data/${Request_MTR}.csv

Check db req and res mrt onetime file to deleted duplicate filename
        BuiltIn.Sleep   5s
        connect to cfr database
       ${sql}=   catenate      SELECT RESPONSE_FILE_NAME FROM AOC_SFTP_WARRANT_RESPONSE_FILE_INFO aswrfi  WHERE RESPONSE_FILE_NAME = '${Response_MTR_gpg}'
        ${query}=   query_all     ${db_connect}     ${sql}     # query
        ${result}=   set variable    ${query[0]}
        ${DB_FILE_NAME_RES}=    set variable    ${result}[RESPONSE_FILE_NAME]
        Should Be Equal As Strings     ${DB_FILE_NAME_RES}      ${Response_MTR_gpg}
        Should Be Equal As Strings     ${DB_FILE_NAME_REQ}      ${Request_MTR}.gpg
        Sleep    5s
       ${sql}=   catenate      DELETE FROM AOC_SFTP_WARRANT_RESPONSE_FILE_INFO aswrfi  WHERE RESPONSE_FILE_NAME = '${DB_FILE_NAME_RES}'
        ${query}=   update     ${db_connect}     ${sql}
       ${sql}=   catenate      DELETE FROM AOC_SFTP_WARRANT_REQUEST_FILE_DETAIL WHERE FILE_ID = '${REQ_ID_INFO}'
        ${query}=   update     ${db_connect}     ${sql}     # query
       ${sql}=   catenate      DELETE FROM AOC_SFTP_WARRANT_REQUEST_FILE_INFO WHERE FILE_NAME = '${DB_FILE_NAME_REQ}'
        # ${query}=   update     ${db_connect}     ${sql}     # query
        Deleted file duplicate filename

Deleted file duplicate filename
    remove file    ${GPG_FILE}
    remove file    ${CSV_FILE}
    remove file    ${CURDIR}/Data/${DB_FILE_NAME_REQ}
    remove file    ${CURDIR}/Data/${Request_MTR}.csv