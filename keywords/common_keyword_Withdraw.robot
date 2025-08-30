*** Settings ***
Resource  ../resources/imports.robot
Library    ArchiveLibrary



*** Variables ***
${CSV FILE}    D:\\CFR\\itmx-cfr-robot\\keywords\\Data\\Wary_Juristic_Mule_Report_2568-03-12_196.csv
${ZIP FILE}    D:\\CFR\\itmx-cfr-robot\\keywords\\Data\\All_Mule_report_2568-03-12_196.zip

${dont'forget_MTR}    python -m robot.run -L DEBUG -d result -v totalrun:2 -v ENV:dev -t TC00* --exclude not_ready .\testcases\Positive\GPG_Money_trail.robot    

*** Keywords ***
# create File Name Money Trail max
#      get current datetime money trail max
#      ${directory}=     set variable     CFR_MTR_ADHOC_${filenameDateTime}_REQ
#      ${filename}=     set variable     CFR_MTR_ADHOC_${filenameDateTime}
#     #  ${Response_warrant_H}=     set variable     CFR_MTR_ADHOC_${filenameDateTime}_${Around.${TIMSS}}_${running_number}_RES
#      ${Response_MTR}=     set variable     CFR_MTR_ADHOC_${filenameDateTime}_RES
#      set test variable        ${directory}
#      set test variable      ${Request_MTR}      ${directory}
#      set test variable      ${Response_MTR}
#      set test variable      ${filename}

create File Name withdraw mule to MBs ${dayRow}
     get current datetime withdraw mule ${dayRow}
     ${directory}=     set variable     CFR_Withdraw_Suspicious_Person_${filenameDateTime}_001
    #  ${filename}=     set variable     CFR_Withdraw_Suspicious_Person_${filenameDateTime}
     ${Response_WIT}=     set variable     CFR_Withdraw_Suspicious_Person_${filenameDateTime}_001
     set test variable        ${directory}
     set test variable      ${fileName}       ${directory}
     set test variable      ${Response_WIT}


get current datetime money trail max
    ${date}=    Get Current Date
    ${filenameDateTime}=    Convert Date    ${date}    result_format=%Y%m%d%H%M%S%f
    ${filenameDATE_YMD}=    Convert Date    ${date}    result_format=%Y%m%d
    ${final_datetime}=        Set Variable    ${filenameDateTime[:17]}   # เลือกแค่ 3 ตัวสุดท้ายเป็นมิลลิวินาท
    log to console   ${final_datetime}
    log to console   ${filenameDATE_YMD}
    set test variable   ${filenameDATE_YMD}
    set test variable    ${filenameDateTime}    ${final_datetime}


get current datetime withdraw mule ${dayRow}
    ${date}=    Get Current Date
    ${day}=    Add Time To Date    ${date}    ${dayRow} days
    ${filenameDateTime}=    Convert Date    ${day}    result_format=%Y-%m-%d
    # Add Time To Date
    set test variable    ${filenameDateTime}


Get File GPG From ITMX for MBs ${Bankcode}
    Open Connection     ${hostsftp.ip}
    # Login	${AOC.user}   ${AOC.password}
    Login	${bank_999.user}   ${bank_999.password}
    ${Response_WIT_gpg}=     set variable     ${Response_WIT}.gpg
    ${Response_WIT_csv}=     set variable     ${Response_WIT}.csv
    set test variable    ${Response_WIT_gpg}
    set test variable    ${Response_WIT_csv}
    set test variable    ${BankTEST}      ${Bankcode}cfr
    SSHLibrary.File Should Exist   /home/sftpcfr/${BankTEST}/${ENVBANK}/WITHDRAW_SUSPICIOUS_PERSON/${Response_WIT_gpg}
    SSHLibrary.Get File     /home/sftpcfr/${BankTEST}/${ENVBANK}/WITHDRAW_SUSPICIOUS_PERSON/${Response_WIT_gpg}     ${CURDIR}/Response/${Response_WIT_gpg}
    Close All Connections
    Set Test Variable   ${BankPASS}      BANK${Bankcode}
    ${gpg_file_path}=  Set Variable  ${CURDIR}/Response/${Response_WIT_gpg}
    ${output_csv_path}=  Set Variable  ${CURDIR}/Response/${Response_WIT_csv}
    ${passphrase}=  Set Variable   ${Pass.${BankPASS}}
     ${result}=    Decrypt Gpg File    ${gpg_file_path}  ${output_csv_path}  ${passphrase}
    wait until created    ${CURDIR}/Response/${Response_WIT_gpg}   2s
    wait until created    ${CURDIR}/Response/${Response_WIT_csv}   2s
    set test variable   ${CSV_FILE}     ${CURDIR}/Response/${Response_WIT_csv}
    set test variable   ${GPG_FILE}     ${CURDIR}/Response/${Response_WIT_gpg}
    # Read CSV And Convert To List With Thai
    # log     ${Read_csv_file_report}
    # Remove File     ${GPG_FILE}
    # Remove File     ${CSV_FILE}
    # set test variable   ${GPG_FILE_REQ}     ${CURDIR}/Response/${filename}.gpg
    # set test variable   ${CSV_FILE_REQ}     ${CURDIR}/Response/${filename}.csv



Call API Download Withdraw suspicious report ${bankcode}
    Get Data Master case id ${fileName}
    ${API_URL}=   Set Variable     ${Host_GET}
    ${HEADERS}=   Create Dictionary   
    ...    Accept=*/*
    # ...    X-Institution-Id=${bankcode}xxx
    # ...    X-Roles=xxx
    # ...    X-User-Id=002xxx
    ...    Content-Type=text/plain
    ${REQ_BODY}=  Create Dictionary
    ...    id=${ID}

    Create Session  downloadreportwithdraw  ${API_URL}     headers=${HEADERS}
    ${response}=    POST On Session   downloadreportwithdraw  ${path.downloadreportwithdraw}  json=${REQ_BODY}  expected_status=any
    Set Test Variable    ${response}
    Log    ${response.content}
    Create Binary File    ${CURDIR}/Download/${REPORT_FILE_NAME}    ${response.content}


Get Data Master case id ${fileName}
        # connect to cfr database horse
        connect to cfr database
       ${sql}=   catenate        select ID, REPORT_FILE_NAME from AOC_WITHDRAW_MULE_REPORT
       ...    where REPORT_FILE_NAME = '${fileName}.zip'
        ${query}=   query_all     ${db_connect}     ${sql}     # query
        ${LEN_GENFILE}=  Get Length    ${query}
        FOR    ${index}    IN RANGE    ${LEN_GENFILE}
        ${result}=   set variable    ${query[${index}]}
        ${ID}=    set variable    ${result}[ID]
        ${REPORT_FILE_NAME}=    set variable    ${result}[REPORT_FILE_NAME]
        set test variable   ${ID}
        set test variable   ${REPORT_FILE_NAME}
        END


Extract ZIP FileName Withdraw mule
    [Documentation]    แตกไฟล์ ZIP ไปยังโฟลเดอร์เดิม
    ${darkfilename}    Run Process    powershell.exe    Expand-Archive -Path "${CURDIR}/Download/${REPORT_FILE_NAME}" -DestinationPath "${CURDIR}/Download" -Force




# *** Keywords ***
Create Zip File
    [Arguments]    ${source_file}    ${zip_file}
    Run Process    zip    -r    ${zip_file}    ${source_file}

Validate Check file name Report Withdraw suspicious report
    Read CSV To List Sftp
    Read CSV To List Web
    ${lenlines1}=    Get Length      ${data_list_sftp}
    Log To Console   ${lenlines1}
    Set Test Variable  ${lenlines1}
    Run Keyword If  ${lenlines1} <= 4  Validate Data Not found   
    Run Keyword If  ${lenlines1} > 4  Validate Data found


Check Header data in file
    ${header}=    Get From List    ${data_list_sftp}    0
    ${split_header}=    Split String    ${header}    ;
    ${condition_code}=    Get From List    ${split_header}    7
    Log To Console    ${condition_code}

Delete File gpg and csv
    Remove File    ${CSV_FILE}
    Remove File    ${GPG_FILE}
    Remove File    ${CURDIR}/Download/${REPORT_FILE_NAME}
    Remove File    ${CURDIR}/Download/${Response_WIT_csv}
    Log To Console   ${CSV_FILE}
    Log To Console   ${GPG_FILE}
    Log To Console   ${CURDIR}/Download/${REPORT_FILE_NAME}
    Log To Console   ${CURDIR}/Download/${Response_WIT_csv}



Validate Data Not found
    Should Be Equal    ${data_list_sftp[0]}    ${data_list_web[0]}
    Should Not Be Empty    ${data_list_sftp[1]}    
    Should Not Be Empty     ${data_list_web[1]}
    Should Be Equal    ${data_list_sftp[2]}    ${data_list_web[2]}



Validate Data found
    ${lenlines1}=     Evaluate   ${lenlines1}-3
    Log To Console  ${lenlines1}
    Should Be Equal    ${data_list_sftp[0]}    ${data_list_web[0]}
    Set Test Variable     ${index}      1
    Set Test Variable     ${Check}      0
    FOR  ${index}    IN RANGE   ${index}    ${lenlines1}        
    Should Be Equal    ${data_list_sftp[${index}]}    ${data_list_web[${index}]}
        # Log To Console      ${index}
        ${index}=  Evaluate  ${index}+1
        # Log To Console      ${index}
        Set Test Variable     ${Check}    ${index}
    END
      Log To Console  ${Check}
    Should Not Be Empty    ${data_list_sftp[${Check}]}    
    Should Not Be Empty     ${data_list_web[${Check}]}
    ${Check}=    Evaluate    ${Check}+1
    Should Be Equal    ${data_list_sftp[${Check}]}    ${data_list_web[${Check}]}




Read CSV To List Sftp
    ${csv_data}=  OperatingSystem.Get File  ${CURDIR}/Response/${Response_WIT_csv}
    ${lines}=  Split String  ${csv_data}  \n
    Set Test Variable   ${lines}
    ${lenlines}=    Get Length      ${lines}
    Log To Console   ${lenlines}
    Run Keyword If  ${lenlines} <= 4  Not Found data sftp   
    Run Keyword If  ${lenlines} > 4  Found data sftp


Read CSV To List Web
    ${csv_data}=  OperatingSystem.Get File  ${CURDIR}/Download/${Response_WIT_csv}
    ${lines}=  Split String  ${csv_data}  \n
    Set Test Variable   ${lines}
    ${lenlines}=    Get Length      ${lines}
    Log To Console   ${lenlines}
    Run Keyword If  ${lenlines} <= 4  Not Found data web   
    Run Keyword If  ${lenlines} > 4  Found data web


Not Found data sftp   
    ${data_list_sftp}=  Create List
    FOR  ${line}  IN  @{lines}
      ${columns}=  Split String  ${line}  ,
      Append To List  ${data_list_sftp}  ${columns}
    # Log  ${data_list_sftp}
    END
    Log  ${data_list_sftp}
    Set Test Variable  ${data_list_sftp}

Found data sftp   
    ${data_list_sftp}=  Create List
    FOR  ${line}  IN  @{lines}
      ${columns}=  Split String  ${line}  ,
      Append To List  ${data_list_sftp}  ${columns}
    END
    Log  ${data_list_sftp}
    Set Test Variable  ${data_list_sftp}

Not Found data web   
    ${data_list_web}=  Create List
    # ${lines}=    Evaluate    ${lines}-1
    FOR  ${line}  IN  @{lines}
      ${columns}=  Split String  ${line}  ,
      Append To List  ${data_list_web}  ${columns}
    END
    Log  ${data_list_web}
    Set Test Variable  ${data_list_web}

Found data web   
    ${data_list_web}=  Create List
    FOR  ${line}  IN  @{lines}
    # ${data_list_sftp}=  Create List
      ${columns}=  Split String  ${line}  ,
      Append To List  ${data_list_web}  ${columns}
    END
    Log  ${data_list_web}
    Set Test Variable  ${data_list_web}