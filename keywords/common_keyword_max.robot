*** Settings ***
Resource  ../resources/imports.robot



*** Variables ***

${dont'forget_MTR}    python -m robot.run -L DEBUG -d result -v totalrun:2 -v ENV:dev -t TC00* --exclude not_ready .\testcases\Positive\GPG_Money_trail.robot    

*** Keywords ***


Create Data add Money trail max
      ${list}=   create list   ${MASTER_CASE_ID}     
      ${data}=   create list  ${list}
      Append To Csv File     ${CURDIR}/Data/${directory}.csv    ${data}
      Set Test Variable   ${list}

Create Money Trail FILE CSV max
     ${REQ_data_list_to_check}   create list
      ${list}=   create list   bankcaseid
      ${data}=   create list  ${list}
      create file    ${CURDIR}/Data/${directory}.csv
      Append To Csv File     ${CURDIR}/Data/${directory}.csv    ${data}
      Append To List     ${REQ_data_list_to_check}     ${list} 
      set test variable    ${REQ_data_list_to_check}

Create Dark Brown Mule FILE CSV max
     ${REQ_data_list_to_check}   create list
      ${list}=   create list   header something
      ${data}=   create list  ${list}
      create file    ${CURDIR}/Data/${directory}.csv
      Append To Csv File     ${CURDIR}/Data/${directory}.csv    ${data}
      Append To List     ${REQ_data_list_to_check}     ${list} 
      set test variable    ${REQ_data_list_to_check}

create File Name Money Trail max
     get current datetime money trail max
     ${directory}=     set variable     CFR_MTR_ADHOC_${filenameDateTime}_REQ
     ${filename}=     set variable     CFR_MTR_ADHOC_${filenameDateTime}
    #  ${Response_warrant_H}=     set variable     CFR_MTR_ADHOC_${filenameDateTime}_${Around.${TIMSS}}_${running_number}_RES
     ${Response_MTR}=     set variable     CFR_MTR_ADHOC_${filenameDateTime}_RES
     set test variable        ${directory}
     set test variable      ${Request_MTR}      ${directory}
     set test variable      ${Response_MTR}
     set test variable      ${filename}

create File Name Dark Brown Mule max
     get current datetime dark brown mule max
     ${runingnumber}    random_number_warrant    3
     ${directory}=     set variable     CFR_Dark_Brown_Mule_Registry_Report_${filenameDATE_YMD}_${runingnumber}
     ${filename}=     set variable     CFR_Dark_Brown_Mule_Registry_Report_${filenameDATE_YMD}
    #  ${Response_warrant_H}=     set variable     CFR_MTR_ADHOC_${filenameDateTime}_${Around.${TIMSS}}_${running_number}_RES
     ${DarkBrown_RES}=     set variable     CFR_Dark_Brown_Mule_Registry_Report_${filenameDATE_YMD}_${runingnumber}
     set test variable      ${directory}
     set test variable      ${DarkBrown_REQ}      ${directory}
     set test variable      ${DarkBrown_RES}
     set test variable      ${filename}

get current datetime money trail max
    ${date}=    Get Current Date
    ${filenameDateTime}=    Convert Date    ${date}    result_format=%Y%m%d%H%M%S%f
    ${filenameDATE_YMD}=    Convert Date    ${date}    result_format=%Y%m%d
    ${final_datetime}=        Set Variable    ${filenameDateTime[:17]}   # เลือกแค่ 3 ตัวสุดท้ายเป็นมิลลิวินาท
    
#     log to console   ${filenameDateTime}
    log to console   ${final_datetime}
    log to console   ${filenameDATE_YMD}
    set test variable   ${filenameDATE_YMD}
    set test variable    ${filenameDateTime}    ${final_datetime}
get current datetime dark brown mule max
    ${date}=    Get Current Date
    ${year}=    Convert Date    ${date}    result_format=%Y
    ${thai_year}=    Evaluate    ${year} + 543
    ${filenameDateTime}=    Convert Date    ${date}    result_format=%Y%m%d%H%M%S%f
    ${filenameDATE_YMD_THAI}=    Convert Date    ${date}    result_format=${thai_year}-%m-%d
    ${filenameDATE_YMD_THAI_V1}=    Convert Date    ${date}    result_format=${thai_year}-%m-
    ${filenameDATE_YMD}=    Convert Date    ${date}    result_format=%Y-%m-%d
    ${final_datetime}=        Set Variable    ${filenameDateTime[:17]}   # เลือกแค่ 3 ตัวสุดท้ายเป็นมิลลิวินาท
    
#     log to console   ${filenameDateTime}
    log to console   ${final_datetime}
    log to console   ${filenameDATE_YMD}
    set test variable   ${filenameDATE_YMD}
    set test variable   ${thai_year}    ${thai_year}
    set test variable   ${filenameDATE_YMD_THAI}
    set test variable   ${filenameDATE_YMD_THAI_V1}
    set test variable    ${filenameDateTime}    ${final_datetime}

Check file inbound SSH 
    Open Connection     ${hostsftp.ip}
    Login	${root.user}   ${root.password}
    Sleep    2s
    ${output} =    Execute Command    ls /home/sftpaoc/${ENVAOC}/cfr/MTR_Onetime/inbound/    return_stdout=True    return_stderr=True
    log     ${output}
    ${output_str}=    Convert To String    ${output}
    ${cleaned_output}=    Replace String    ${output_str}    'archive', ''    ${EMPTY}
    Run Keyword If    ${cleaned_output}    Fail    File still exists: ${cleaned_output}
    Close All Connections

Check file SSH And Remove file to contrab max
    Open Connection     ${hostsftp.ip}
    Login    ${root.user}   ${root.password}
    Sleep    2s
    # DARK_BROWN_MULE_REGISTRY_REPORT
    ${conotrab}    Set Variable    /home/sftpaoc/contrab/testremovefile
    ${source_path}    Set Variable    /home/sftpaoc/${ENVAOC}/cfr/DARK_BROWN_MULE_REGISTRY_REPORT
    ${output} =    Execute Command    ls ${source_path}    return_stdout=True    return_stderr=True
    Log    ${output}
    ${output_str} =    Convert To String    ${output}[0]
    ${csv_string} =    Replace String    ${output_str}    \n    ,   
    ${file_list} =    Split String    ${csv_string}    ,
    Log    ${file_list}
    Run Keyword If    ${file_list} == [''] or ${file_list} == []    Fail    No files found in ${source_path}
    # ${index} =    Set Variable    1  
    # FOR    ${file}    IN    @{file_list}
    # Log    "${file} รอบ${index}"
    # ${index} =    Evaluate    ${index} + 1
    # END
    FOR    ${file}    IN    @{file_list}
        Execute Command    mv ${source_path}/${file} ${conotrab}/
        Log    "Moved ${file} to ${conotrab}/"
    END
    ${output_conotrab} =    Execute Command    ls ${conotrab}    return_stdout=True    return_stderr=True
    ${output_str} =    Convert To String    ${output_conotrab}[0]
    ${csv_string} =    Replace String    ${output_str}    \n    ,   
    ${file_list_conotrab} =    Split String    ${csv_string}    ,
    set test variable   ${file_list_conotrab_move}    ${file_list_conotrab}
    Close All Connections

Check file SSH And Return file to Dark Brown Mule max
    Open Connection     ${hostsftp.ip}
    Login    ${root.user}   ${root.password}
    Sleep    2s
    ${conotrab}    Set Variable    /home/sftpaoc/contrab/testremovefile
    ${source_path}    Set Variable    /home/sftpaoc/${ENVAOC}/cfr/DARK_BROWN_MULE_REGISTRY_REPORT
    ${output} =    Execute Command    ls ${conotrab}    return_stdout=True    return_stderr=True
    Log    ${output}
    ${output_str} =    Convert To String    ${output}[0]
    ${csv_string} =    Replace String    ${output_str}    \n    ,   
    ${file_list} =    Split String    ${csv_string}    ,
    Log    ${file_list}
    FOR    ${file}    IN    @{file_list}
        Execute Command    mv ${conotrab}/${file} ${source_path}/
        Log    "Moved ${file} to ${source_path} again"
    END
    Close All Connections

Call API Sending file MTRonetime from aoc to ITMX max
    ${API_URL}=   Set Variable     ${Host_GET}
    Create Session  triggerMTRonetime    ${API_URL}
    ${response}=    POST On Session   triggerMTRonetime  ${path.triggerMTRonetime}    expected_status=any
    set test variable     ${response}
put file MTR_Onetime to sftp server max
   sleep  2s
   Wait Until Created      ${CURDIR}/Data/${directory}.gpg    2s
   Put File     ${CURDIR}/Data/${directory}.gpg    /home/sftpaoc/${ENVAOC}/cfr/MTR_Onetime/inbound      mode=0770

put file MTR_Onetime to sftp server rawfile
   sleep  2s
   Wait Until Created      ${CURDIR}/Data/${directory}.gpg    2s
   Put File     ${CURDIR}/Data/${directory}.gpg    /home/sftpaoc/contrab/${ENV}/MTR_Onetime      mode=0770

put file Dark Brown Mule to sftp server max
   sleep  2s
   Wait Until Created      ${CURDIR}/Data/${directory}.gpg    2s
   Put File     ${CURDIR}/Data/${directory}.gpg    /home/sftpaoc/${ENVAOC}/cfr/DARK_BROWN_MULE_REGISTRY_REPORT     mode=0770

put file Juristic
   sleep  2s
   Wait Until Created      ${CURDIR}/Data/${FileName_gpg}    2s
   Put File     ${CURDIR}/Data/${FileName_gpg}    /home/sftpaoc/${ENVAOC}/cfr/WARY_JURISTIC_MULE_REPORT    mode=0770

put file Wary Juristic Mule to sftp server max
   sleep  2s
   Wait Until Created      ${CURDIR}/Data/${directory}.gpg    2s
   Put File     ${CURDIR}/Data/${directory}.gpg    /home/sftpaoc/${ENVAOC}/cfr/WARY_JURISTIC_MULE_REPORT     mode=0770

check file Wary Juristic Mule to sftp server max
   sleep  2s
   Should Not Contain Any    /home/sftpaoc/${ENVAOC}/cfr/WARY_JURISTIC_MULE_REPORT    *.gpg

put file Wary Juristic Mule to sftp server => 10 mb
   sleep  2s
   Wait Until Created      ${CURDIR}/Download/${filename10mb}.gpg    2s
   Put File     ${CURDIR}/Download/${filename10mb}.gpg    /home/sftpaoc/${ENVAOC}/cfr/WARY_JURISTIC_MULE_REPORT    mode=0770

Get Data Master case id ${row_number} max
        connect to cfr database horse
        ${list_master_case_ids}=    Create List
       ${sql}=   catenate        select DISTINCT MASTER_CASE_ID from FRAUDCASE fetch first ${row_number} rows only
        ${query}=   query_all     ${db_connect}     ${sql}     # query
        ${LEN_GENFILE}=  Get Length    ${query}
        FOR    ${index}    IN RANGE    ${LEN_GENFILE}
        ${result}=   set variable    ${query[${index}]}
        ${MASTER_CASE_ID}=    set variable    ${result}[MASTER_CASE_ID]
        Append To List    ${list_master_case_ids}    ${MASTER_CASE_ID}
        set test variable   ${MASTER_CASE_ID}
        Create Data add Money trail max
          log   ${index}
        END
        set test variable   ${list_master_case_ids}
Generate Data Master case id ${row_number} max
        connect to cfr database horse
        ${list_master_case_ids}=    Create List
        FOR    ${index}    IN RANGE    ${row_number}
        ${MASTER_CASE_ID}=    set variable    25555199BBL0124${index}
        Append To List    ${list_master_case_ids}    ${MASTER_CASE_ID}
        set test variable   ${MASTER_CASE_ID}
        Create Data add Money trail max
          log   ${index}
        END
        set test variable   ${list_master_case_ids}
        
Get Data TicketID max
        connect to cfr database
        Sleep    5s
        ${sql}=   catenate        SELECT aswrfd.UPDATE_DATETIME FROM AOC_SFTP_WARRANT_REQUEST_FILE_INFO aswrfi
        ...    JOIN	AOC_SFTP_WARRANT_REQUEST_FILE_DETAIL aswrfd  ON aswrfi.ID = aswrfd.FILE_ID
        ...    WHERE FILE_NAME = '${Request_MTR}.gpg'
        ${query}=   query_all     ${db_connect}     ${sql} 
        log   this is query ${query}    console=True
        ${first_result}=    Get From List    ${query}    0
        ${update_datetime}=    Get From Dictionary    ${first_result}    UPDATE_DATETIME
        ${formatted_datetime} =   BuiltIn.Evaluate   datetime.datetime.strptime('${update_datetime}', '%Y-%m-%d %H:%M:%S.%f').strftime('%Y%m%d%H%M%S%f')[:-3]    modules=datetime
        ${formatted_datetime_report_police} =   BuiltIn.Evaluate   datetime.datetime.strptime('${update_datetime}', '%Y-%m-%d %H:%M:%S.%f').strftime('%Y%m%d_%H%M%S%f')[:-6]    modules=datetime
        log    ${formatted_datetime_report_police}
        set test variable   ${ticket}     ${formatted_datetime}
        set test variable   ${date_ticket}     ${formatted_datetime_report_police}
        ${ticketids} =    Create List
        ${total_master}=  Get Length    ${list_master_case_ids}
        FOR    ${index}    IN RANGE    ${total_master}
        ${master_case} =    Get From List    ${list_master_case_ids}    ${index}
        ${combined_value} =    Catenate    ${ticket}-${master_case}
        Append To List    ${ticketids}    ${combined_value}
        END
        Set Global Variable    ${ticketids}

Get File GPG From ITMX for MTRonetime max
    ${Response_MTR_gpg}=     set variable     ${Response_MTR}.gpg
    ${Response_MTR_csv}=     set variable     ${Response_MTR}.csv
    set test variable    ${Response_MTR_gpg}
    set test variable    ${Response_MTR_csv}
    WHILE    ${RETRY_COUNT} < ${MAX_RETRIES}
    sleep    5s
    ${outbound_exists}=    Run Keyword And Return Status    SSHLibrary.File Should Exist   /home/sftpaoc/${ENVAOC}/cfr/MTR_Onetime/outbound/${Response_MTR_gpg}
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

Get File GPG From ITMX for Report Dark Brown Mule
    ${Response_MTR_gpg}=     set variable     ${filename}.gpg
    ${Response_MTR_csv}=     set variable     ${filename}.csv
    set test variable    ${Response_MTR_gpg}
    set test variable    ${Response_MTR_csv}
    Open Connection     ${hostsftp.ip}
    Login	${root.user}   ${root.password}
    Sleep    5s
    ${output} =    Execute Command    ls /home/sftpaoc/${ENVAOC}/cfr/DARK_BROWN_MULE_REGISTRY_REPORT/${filename}.gpg    return_stdout=True    return_stderr=True
    Run Keyword If    'No such file or directory' in '${output[1]}'    Fail    "File not found: ${filename}.gpg"
    Run Keyword If    '${output[0]}' != ''    SSHLibrary.Get File    /home/sftpaoc/${ENVAOC}/cfr/DARK_BROWN_MULE_REGISTRY_REPORT/${filename}.gpg    ${CURDIR}/Data/${filename}.gpg    ELSE    Log    "File not found: ${filename}.gpg"
    ${gpg_file_path}=  Set Variable  ${CURDIR}/Data/${filename}.gpg
    ${output_csv_path}=  Set Variable  ${CURDIR}/Data/${filename}.csv
    ${passphrase}=  Set Variable   ${Pass.AOC}
     ${result}=    Decrypt Gpg File    ${gpg_file_path}  ${output_csv_path}  ${passphrase}
    Log    ${result}
    wait until created    ${CURDIR}/Data/${Response_MTR_gpg}   2s
    wait until created    ${CURDIR}/Data/${Response_MTR_csv}   2s
    set test variable   ${CSV_FILE}     ${CURDIR}/Data/${Response_MTR_csv}
    set test variable   ${GPG_FILE}     ${CURDIR}/Data/${Response_MTR_gpg}
    set test variable   ${GPG_FILE_REQ}     ${CURDIR}/Data/${filename}.gpg
    set test variable   ${CSV_FILE_REQ}     ${CURDIR}/Data/${filename}.csv

Get File GPG From ITMX for Report Withdraw Brown Mule
    ${Response_MTR_gpg}=     set variable     ${filename}.gpg
    ${Response_MTR_csv}=     set variable     ${filename}.csv
    set test variable    ${Response_MTR_gpg}
    set test variable    ${Response_MTR_csv}
    Open Connection     ${hostsftp.ip}
    Login	${root.user}   ${root.password}
    Sleep    5s
    ${output} =    Execute Command    ls /home/sftpaoc/${ENVAOC}/cfr/WITHDRAW_BROWN_MULE_REPORT/${filename}.gpg    return_stdout=True    return_stderr=True
    Run Keyword If    'No such file or directory' in '${output[1]}'    Fail    "File not found: ${filename}.gpg"
    Run Keyword If    '${output[0]}' != ''    SSHLibrary.Get File    /home/sftpaoc/${ENVAOC}/cfr/WITHDRAW_BROWN_MULE_REPORT/${filename}.gpg    ${CURDIR}/Data/${filename}.gpg    ELSE    Log    "File not found: ${filename}.gpg"
    ${gpg_file_path}=  Set Variable  ${CURDIR}/Data/${filename}.gpg
    ${output_csv_path}=  Set Variable  ${CURDIR}/Data/${filename}.csv
    ${passphrase}=  Set Variable   ${Pass.AOC}
     ${result}=    Decrypt Gpg File    ${gpg_file_path}  ${output_csv_path}  ${passphrase}
    Log    ${result}
    wait until created    ${CURDIR}/Data/${Response_MTR_gpg}   2s
    wait until created    ${CURDIR}/Data/${Response_MTR_csv}   2s
    set test variable   ${CSV_FILE}     ${CURDIR}/Data/${Response_MTR_csv}
    set test variable   ${GPG_FILE}     ${CURDIR}/Data/${Response_MTR_gpg}
    set test variable   ${GPG_FILE_REQ}     ${CURDIR}/Data/${filename}.gpg
    set test variable   ${CSV_FILE_REQ}     ${CURDIR}/Data/${filename}.csv

Get File GPG From ITMX for MTRonetime And File Report Police max
    ${Response_MTR_gpg}=     set variable     ${Response_MTR}.gpg
    ${Response_MTR_csv}=     set variable     ${Response_MTR}.csv
    ${Response_Report_Police_filename}=     set variable     ${list_master_case_ids}[0]_CFR_ReportPolice_TXN_ADHOC_999_${date_ticket}
    ${Response_Report_Police_csv}=     set variable     ${list_master_case_ids}[0]_CFR_ReportPolice_TXN_ADHOC_999_${date_ticket}.csv
    ${Response_Report_Police_gpg}=     set variable     ${list_master_case_ids}[0]_CFR_ReportPolice_TXN_ADHOC_999_${date_ticket}.gpg
    set test variable    ${Response_MTR_gpg}
    set test variable    ${Response_MTR_csv}
    set test variable    ${Response_Report_Police_filename}
    set test variable    ${Response_Report_Police_csv}
    set test variable    ${Response_Report_Police_gpg}
    WHILE    ${RETRY_COUNT} < ${MAX_RETRIES}
    sleep    5s
    ${outbound_exists}=    Run Keyword And Return Status    SSHLibrary.File Should Exist   /home/sftpaoc/${ENVAOC}/cfr/MTR_Onetime/outbound/${Response_MTR_gpg}
    ${inbound_exists}=    Run Keyword And Return Status    SSHLibrary.File Should Exist   /home/sftpaoc/${ENVAOC}/cfr/MTR_Onetime/inbound/archive/${Request_MTR}.gpg
    Run Keyword If    ${RETRY_COUNT} == ${MAX_RETRIES}    Fail    "File not found after ${MAX_RETRIES} retries."
    ${RETRY_COUNT}=    Evaluate    ${RETRY_COUNT} + 1
    Run Keyword If    ${outbound_exists} and ${inbound_exists}    Exit For Loop
    END
    ${output}=    Execute Command    ls /home/sftpaoc/${ENVAOC}/cfr/MTR_Onetime/outbound/${Response_Report_Police_filename}*    return_stdout=True    return_stderr=True
    Log    ${output}
    ${output_str}=    Catenate    SEPARATOR=\n    @{output}  # แปลง list เป็น string
    ${clean_output}=    Replace String    ${output_str}    /home/sftpaoc/${ENVAOC}/cfr/MTR_Onetime/outbound/    ${EMPTY}
    ${files}=    Split String    ${clean_output}    \n
    ${file_count}=    Get Length    ${files}
    SSHLibrary.Get File    /home/sftpaoc/${ENVAOC}/cfr/MTR_Onetime/outbound/${files[0]}    ${CURDIR}/Data/${Response_Report_Police_gpg}
    ${gpg_file_path}=  Set Variable  ${CURDIR}/Data/${Response_Report_Police_gpg}
    ${output_csv_path}=  Set Variable  ${CURDIR}/Data/${Response_Report_Police_csv}
    ${passphrase}=  Set Variable   ${Pass.AOC}
     ${result}=    Decrypt Gpg File    ${gpg_file_path}  ${output_csv_path}  ${passphrase}
    Log    ${result}
    wait until created    ${CURDIR}/Data/${Response_Report_Police_gpg}   2s
    wait until created    ${CURDIR}/Data/${Response_Report_Police_csv}   2s
    set test variable   ${CSV_FILE}     ${CURDIR}/Data/${Response_Report_Police_csv}
    set test variable   ${GPG_FILE}     ${CURDIR}/Data/${Response_Report_Police_gpg}
    set test variable   ${GPG_FILE_REQ}     ${CURDIR}/Data/${filename}.gpg
    set test variable   ${CSV_FILE_REQ}     ${CURDIR}/Data/${filename}.csv

Validate Header File RES CSV MTR One time max
    ${header_list}=   Read Csv File To List      ${CSV_FILE}
          ${data_total}=    Get From List   ${header_list}    0
          ${data_responcode}=    Get From List   ${data_total}    0
          ${split_data}=    Split String    ${data_responcode}    ;
         ${Header_code}=         Get From List    ${split_data}    0
         ${Header_message}=        Get From List    ${split_data}    1
         ${Header_bankcaseid}=         Get From List    ${split_data}    2
         ${Header_timestamp}=         Get From List    ${split_data}    3
         ${Header_ticketID}=         Get From List    ${split_data}    4
    Should Be Equal As Strings    ${Header_code}        code
    Should Be Equal As Strings    ${Header_message}        message
    Should Be Equal As Strings    ${Header_bankcaseid}        bankcaseid
    Should Be Equal As Strings    ${Header_timestamp}        timestamp
    Should Be Equal As Strings    ${Header_ticketID}        ticketID

Validate Header File REQ CSV MTR One time max
    ${header_list}=   Read Csv File To List      ${CURDIR}/Data/${Request_MTR}.csv
    Should Be Equal As Strings    ${REQ_data_list_to_check}[0]     ${header_list}[0]

Validate File RES CSV Tail Data
    [Documentation]     Tail data:
    ...                   Row1: “#” ตามจำนวน record ในไฟล์ที่ได้รับของไฟล์ request  
    ...                   Row2: จำนวน Bank Case ID ที่พบในระบบ
    ...                   Row3: จำนวน Bank Case ID ที่ไม่พบในระบบ
    ...                   Row4: Fix value “-” 
    ...                   Row5: Fix value “-” 
    ${csv_list}=   Read Csv File To List      ${CSV_FILE}
    ${data_total}=    Get From List    ${csv_list}    9
    Should Be Equal    "${data_total}[0]"    "#8;8;0;-;-"

Validate Header File Dark Brown Mule
    ${file}    OperatingSystem.Get File  ${CURDIR}/Data/${DarkBrown_csv}    encoding=UTF-8
    ${lines}    Split To Lines    ${file}
    ${csv_list}    Create List
    FOR    ${line}    IN    @{lines}
        ${row}    Split String    ${line}    ,
        Append To List    ${csv_list}    ${row}
    END
    Log    ${csv_list}
    ${total_res}=   Get Length   ${csv_list}    

Check Response Code ${success} GPG FILE MTRonetime max
    ${csv_list}=   Read Csv File To List      ${CSV_FILE}
    log   this is master ids ${list_master_case_ids}
    log   this is ticket ids ${ticketids}
    # กรองรายการที่มีข้อมูลเริ่มต้นด้วย '#' ออกไป
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
        ${MTR_tickket_ID_Res}=        Get From List    ${split_data}    4
        ${index_master}=    Evaluate    ${index} - 1
        ${MTR_bankcase_Req}=    Get From List   ${list_master_case_ids}    ${index_master}
        ${MTR_ticket_id_req}=    Get From List   ${ticketids}    ${index_master}
    Should Be Equal As Strings    ${MTR_bankcase_Res}     ${MTR_bankcase_Req}
    Should Be Equal As Strings    ${MTR_tickket_ID_Res}      ${MTR_ticket_id_req}
    Should Be Equal As Strings    ${MTR_Code_Res}     ${ResHS.${success}.code}
    Should Be Equal As Strings    ${MTR_message_Res}       ${ResHS.${success}.msg}
    Should Not Be Empty     ${MRT_TS_Res}
    log      ${index}
    END

Check Response Code ${success} GPG FILE MTRonetime Report Police max
    ${file}    OperatingSystem.Get File  ${CSV_FILE}    encoding=UTF-8
    # Log To Console    ${file}
    ${lines}    Split To Lines    ${file}
    ${csv_list}    Create List
    FOR    ${line}    IN    @{lines}
        ${row}    Split String    ${line}    ,
        Append To List    ${csv_list}    ${row}
    END
    Log    ${csv_list}
    ${total_res}=   Get Length   ${csv_list} 
        FOR    ${index}    IN RANGE    1    ${total_res}      
          ${data_total}=    Get From List   ${csv_list}    ${index}
          ${data_responcode}=    Get From List   ${data_total}    0
          ${split_data}=    Split String    ${data_responcode}    ;
         ${Bank_Case_ID}=         Get From List    ${split_data}    0
         ${Timestamp_Insert}=        Get From List    ${split_data}    1
         ${From_Bank_Code}=         Get From List    ${split_data}    2
         ${From_Bank_Short_Name}=        Get From List    ${split_data}    3
         ${From_Account_No}=        Get From List    ${split_data}    4
         ${From_Account_Name}=        Get From List    ${split_data}    5
         ${To_Bank_Code}=        Get From List    ${split_data}    6
         ${To_Bank_Short_Name}=        Get From List    ${split_data}    7
         ${To_Bank_Branch}=        Get From List    ${split_data}    8
         ${To_ID_Type}=        Get From List    ${split_data}    9
         ${To_ID}=        Get From List    ${split_data}    10
         ${First_Name}=        Get From List    ${split_data}    11
         ${Last_Name}=        Get From List    ${split_data}    12
         ${Phone_Number}=        Get From List    ${split_data}    13
         ${Promptpay_Type}=        Get From List    ${split_data}    14
         ${Promptpay_ID}=        Get From List    ${split_data}    15
         ${To_Account_No}=        Get From List    ${split_data}    16
         ${To_Account_Name}=        Get From List    ${split_data}    17
         ${To_Account_Status}=        Get From List    ${split_data}    18
         ${To_Open_Date}=        Get From List    ${split_data}    19
         ${To_Close_Date}=        Get From List    ${split_data}    20
         ${To_Balance}=        Get From List    ${split_data}    21
         ${Transfer_Date}=        Get From List    ${split_data}    22
         ${Transfer_Channel}=        Get From List    ${split_data}    23
         ${Transfer_Channel_Detail}=        Get From List    ${split_data}    24
         ${Transfer_Time}=        Get From List    ${split_data}    25
         ${Transfer_Amount}=        Get From List    ${split_data}    26
         ${Transfer_Description}=        Get From List    ${split_data}    27
         ${Transfer_Ref}=        Get From List    ${split_data}    28
    Should Be Equal    ${Bank_Case_ID}    ${list_master_case_ids}[0]
    Should Not Be Empty     ${Timestamp_Insert}
    log      ${index}
    END

Check DB MTR Onetime max
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

Check DB REQ and RES MTR Onetime File To Deleted max
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
        Deleted file max
        # Remove file SSH MTR Onetime max

Deleted file max
    remove file    ${GPG_FILE}
    remove file    ${CSV_FILE}
    remove file    ${CURDIR}/Data/${DB_FILE_NAME_REQ}
    remove file    ${CURDIR}/Data/${Request_MTR}.csv
    
Deleted DB Dark Brown Mule
    BuiltIn.Sleep   5s
    connect to cfr database horse
    ${sql}=   catenate      DELETE FROM BROWN_MULE_REPORT bmr WHERE REPORT_FILE_NAME = '${filename}.zip'
    ${query}=   update     ${db_connect}     ${sql}     # query

Deleted file Dark Brown Mule
    remove file    ${GPG_FILE}
    remove file    ${CSV_FILE}
    remove file    ${CURDIR}/Download/${filename}.zip
    remove file    ${CURDIR}/Download/${filename}.csv

Remove file SSH Dark Brow Report
    Sleep    2s
    SSHLibrary.File Should Exist   /home/sftpaoc/${ENVAOC}/cfr/DARK_BROWN_MULE_REGISTRY_REPORT/${filename}.gpg
    ${deleted}=    Execute Command    rm /home/sftpaoc/${ENVAOC}/cfr/DARK_BROWN_MULE_REGISTRY_REPORT/${filename}.gpg    forward_agent=True
    Close All Connections

Remove file SSH MTR Onetime max
    Open Connection     ${hostsftp.ip}
    # Login	${AOC.user}   ${AOC.password}
    Login	${bank_999.user}   ${bank_999.password}
    Sleep    2s
    SSHLibrary.File Should Exist   /home/sftpaoc/${ENVAOC}/cfr/warranth_binding/outbound/${Response_warrant_H_gpg}
    SSHLibrary.File Should Exist   /home/sftpaoc/${ENVAOC}/cfr/warranth_binding/inbound/archive/${FileName_Warrant}.gpg
    ${outbound}=    Execute Command    rm /home/sftpaoc/${ENVAOC}/cfr/warranth_binding/outbound/${Response_warrant_H_gpg}    forward_agent=True
    ${inbound_archive}=    Execute Command    rm /home/sftpaoc/${ENVAOC}/cfr/warranth_binding/inbound/archive/${FileName_Warrant}.gpg
    Close All Connections

Valid Header RES CSV File Report Police max
    ${file}    OperatingSystem.Get File  ${CSV_FILE}    encoding=UTF-8
    ${lines}    Split To Lines    ${file}
    ${csv_list}    Create List
    FOR    ${line}    IN    @{lines}
        ${row}    Split String    ${line}    ,
        Append To List    ${csv_list}    ${row}
    END
    Log    ${csv_list}
    ${total_res}=   Get Length   ${csv_list}     
          ${data_total}=    Get From List   ${csv_list}    0
          ${data_responcode}=    Get From List   ${data_total}    0
          ${split_data}=    Split String    ${data_responcode}    ;
         ${Bank_Case_ID}=         Get From List    ${split_data}    0
         ${Timestamp_Insert}=        Get From List    ${split_data}    1
         ${From_Bank_Code}=         Get From List    ${split_data}    2
         ${From_Bank_Short_Name}=        Get From List    ${split_data}    3
         ${From_Account_No}=        Get From List    ${split_data}    4
         ${From_Account_Name}=        Get From List    ${split_data}    5
         ${To_Bank_Code}=        Get From List    ${split_data}    6
         ${To_Bank_Short_Name}=        Get From List    ${split_data}    7
         ${To_Bank_Branch}=        Get From List    ${split_data}    8
         ${To_ID_Type}=        Get From List    ${split_data}    9
         ${To_ID}=        Get From List    ${split_data}    10
         ${First_Name}=        Get From List    ${split_data}    11
         ${Last_Name}=        Get From List    ${split_data}    12
         ${Phone_Number}=        Get From List    ${split_data}    13
         ${Promptpay_Type}=        Get From List    ${split_data}    14
         ${Promptpay_ID}=        Get From List    ${split_data}    15
         ${To_Account_No}=        Get From List    ${split_data}    16
         ${To_Account_Name}=        Get From List    ${split_data}    17
         ${To_Account_Status}=        Get From List    ${split_data}    18
         ${To_Open_Date}=        Get From List    ${split_data}    19
         ${To_Close_Date}=        Get From List    ${split_data}    20
         ${To_Balance}=        Get From List    ${split_data}    21
         ${Transfer_Date}=        Get From List    ${split_data}    22
         ${Transfer_Channel}=        Get From List    ${split_data}    23
         ${Transfer_Channel_Detail}=        Get From List    ${split_data}    24
         ${Transfer_Time}=        Get From List    ${split_data}    25
         ${Transfer_Amount}=        Get From List    ${split_data}    26
         ${Transfer_Description}=        Get From List    ${split_data}    27
         ${Transfer_Ref}=        Get From List    ${split_data}    28
         Should Be String    ${Bank_Case_ID}                Bank Case ID
         Should Be String    ${Timestamp_Insert}           Timestamp Insert
         Should Be String    ${From_Bank_Code}             From Bank Code
         Should Be String    ${From_Bank_Short_Name}       From Bank Short name
         Should Be String    ${From_Account_No}            From Account No
         Should Be String    ${From_Account_Name}          From Account Name
         Should Be String    ${To_Bank_Code}               To Bank Code
         Should Be String    ${To_Bank_Short_Name}         To Bank Short name
         Should Be String    ${To_Bank_Branch}             To Bank Branch
         Should Be String    ${To_ID_Type}                 To ID Type
         Should Be String    ${To_ID}                      To ID
         Should Be String    ${First_Name}                 First Name
         Should Be String    ${Last_Name}                  Last Name
         Should Be String    ${Phone_Number}               Phone Number
         Should Be String    ${Promptpay_Type}             Promptpay Type
         Should Be String    ${Promptpay_ID}               Promptpay ID
         Should Be String    ${To_Account_No}              To Account No
         Should Be String    ${To_Account_Name}            To Account Name
         Should Be String    ${To_Account_Status}          To Account Status
         Should Be String    ${To_Open_Date}               To Open Date
         Should Be String    ${To_Close_Date}              To Close Date
         Should Be String    ${To_Balance}                 To Balance
         Should Be String    ${Transfer_Date}              Transfer Date
         Should Be String    ${Transfer_Channel}           Transfer Channel
         Should Be String    ${Transfer_Channel_Detail}    Transfer Channel Detail
         Should Be String    ${Transfer_Time}              Transfer Time
         Should Be String    ${Transfer_Amount}            Transfer Amount
         Should Be String    ${Transfer_Description}       Transfer Description
         Should Be String    ${Transfer_Ref}               Transfer Ref

Extract ZIP FileName
    [Documentation]    แตกไฟล์ ZIP ไปยังโฟลเดอร์เดิม
    ${darkfilename}    Run Process    powershell.exe    Expand-Archive -Path "${CURDIR}/Download/${filename_zip}" -DestinationPath "${CURDIR}/Download" -Force
Extract ZIP FileName for wary
    [Documentation]    แตกไฟล์ ZIP ไปยังโฟลเดอร์เดิม
    ${darkfilename}    Run Process    powershell.exe    Expand-Archive -Path "${CURDIR}/Data/${filename_zip}" -DestinationPath "${CURDIR}/Download" -Force
    

Call API Brown Mule Report
    ${API_URL}=   Set Variable     ${Host_GET}
    ${HEADERS}=   Create Dictionary   
    ...    Content-Type=text/plain
    ...    Accept=*/*
    ${REQ_BODY}=  Create Dictionary
    ...    dateTimeFrom=${datetimenow}
    ...    dateTimeTo=${datetime30}
    ...    runningNumber=${randomnumber}
    ...    receiver=All

    Create Session  darkbrownreport  ${API_URL}    headers=${HEADERS}
    ${response}=    POST On Session   darkbrownreport  ${path.darkbrownreport}  json=${REQ_BODY}  expected_status=any
    Set Test Variable    ${response}

Call API Withdraw Brown Mule Report
    ${API_URL}=   Set Variable     ${Host_GET}
    ${HEADERS}=   Create Dictionary   
    ...    Content-Type=text/plain
    ...    Accept=*/*
    ${REQ_BODY}=  Create Dictionary
    ...    dateTimeFrom=${datetimenow}
    ...    dateTimeTo=${datetime30}
    ...    runningNumber=${randomnumber}
    ...    receiver=All

    Create Session  withdrawbrownreport  ${API_URL}    headers=${HEADERS}
    ${response}=    POST On Session   withdrawbrownreport  ${path.darkbrownreport}  json=${REQ_BODY}  expected_status=any
    Set Test Variable    ${response}

Call API Download Brown Mule Report
    ${API_URL}=   Set Variable     ${Host_GET}
    ${user-id-api}=   Set Variable     002cfr
    Set Test Variable    ${user-id-api}
    ${HEADERS}=   Create Dictionary   
    ...    Accept=*/*
    ...    X-Institution-Id=002
    ...    X-Roles=xxx
    ...    X-User-Id=${user-id-api}
    ...    Content-Type=application/json
    ${REQ_BODY}=  Create Dictionary
    ...    id=${id_report_dark_brown}

    Create Session  downloadreportdarkbrown  ${API_URL}     headers=${HEADERS}
    ${response}=    POST On Session   downloadreportdarkbrown  ${path.downloadreportdarkbrown}  json=${REQ_BODY}  expected_status=any
    Set Test Variable    ${response}
    Log    ${response.content}
    Create Binary File    ${CURDIR}/Download/${filename_zip}    ${response.content}

Call API Download Wary Juristic Mule Report
    # ${API_URL}=   Set Variable     ${Host_UAT}
    ${API_URL}=   Set Variable     ${Host_GET}
    ${user-id-api}=   Set Variable     002cfr
    Set Test Variable    ${user-id-api}
    ${HEADERS}=   Create Dictionary   
    ...    Accept=*/*
    ...    X-Institution-Id=002
    ...    X-Roles=xxx
    ...    X-User-Id=${user-id-api}
    ...    Content-Type=application/json
    ${REQ_BODY}=  Create Dictionary
    ...    id=${id_wary_report}

    Create Session  downloadreportwary  ${API_URL}     headers=${HEADERS}
    ${response}=    POST On Session   downloadreportwary  ${path.downloadreportwary}  json=${REQ_BODY}  expected_status=any
    Set Test Variable    ${response}
    Log    ${response.content}
    Create Binary File    ${CURDIR}/Download/${filename_zip}    ${response.content}
Set Time Data
    ${date}=    Get Current Date
    ${filenameDateTime} =   DateTime.Convert Date   ${date}    result_format=%Y-%m-%d %H:%M
    ${filenameDateTime_round1} =   DateTime.Convert Date   ${date}    result_format=%Y-%m-%d
    ${randomnumber}=    random_number_100_900
    ${date_plus_30min}    DateTime.Subtract Time From Date    ${date}    -30 minutes
    ${filenameDateTime_plus_30min}    DateTime.Convert Date   ${date_plus_30min}    result_format=%Y-%m-%d %H:%M
    Set Test Variable     ${datetimenow}    ${filenameDateTime}
    Set Test Variable     ${datetimenow_round1}    ${filenameDateTime_round1}
    Set Test Variable     ${datetime30}    ${filenameDateTime_plus_30min}
    Set Test Variable     ${randomnumber}    ${randomnumber}

Create file name Report Withdraw Brown Mule Round is ${round}
        IF          '${round}' == '1'
        ${randomnumber}    Set Variable    001
        Set Test Variable    ${randomnumber}
        ELSE IF     '${round}' == '2'
        ${randomnumber}    Set Variable    002
        Set Test Variable    ${randomnumber}
        ELSE IF     '${round}' == '3'
        ${randomnumber}    Set Variable    003
        Set Test Variable    ${randomnumber}
        ELSE
        log     not match any round    
        END
        ${date}=    Get Current Date
        ${filenameDate} =   DateTime.Convert Date   ${date}    result_format=%Y-%m-%d
        connect to cfr database horse
    #    ${sql}=   catenate      SELECT ID,REPORT_FILE_NAME FROM BROWN_MULE_REPORT bmr WHERE REPORT_FILE_NAME = 'CFR_Withdraw_Brown_Mule_Person_Report_${filenameDate}_${randomnumber}.zip'
       ${sql}=   catenate      SELECT ID,REPORT_FILE_NAME FROM BROWN_MULE_REPORT bmr WHERE REPORT_FILE_NAME = 'CFR_Dark_Brown_Mule_Registry_Report_${filenameDate}_${randomnumber}.zip'
        ${query}=   query_all     ${db_connect}     ${sql}     # query
        ${result}=   set variable    ${query[0]}
        ${ID_REPORT}=    set variable    ${result}[ID]
        ${FILE_REPORT}=    set variable    ${result}[REPORT_FILE_NAME]
        Set Test Variable     ${id_report_dark_brown}    ${ID_REPORT}
        Set Test Variable     ${filename_zip}    ${FILE_REPORT}
        ${filenames} =    BuiltIn.Evaluate    "${FILE_REPORT}".split('.')[0]
        Set Test Variable     ${filename}    ${filenames}

Create file name Report Dark Brown Mule
        connect to cfr database horse
       ${sql}=   catenate      SELECT ID,REPORT_FILE_NAME FROM BROWN_MULE_REPORT
        ...                    ORDER BY CREATE_DATETIME  DESC 
        ...                    FETCH FIRST 1 ROW ONLY
        ${query}=   query_all     ${db_connect}     ${sql}     # query
        ${result}=   set variable    ${query[0]}
        ${ID_REPORT}=    set variable    ${result}[ID]
        ${FILE_REPORT}=    set variable    ${result}[REPORT_FILE_NAME]
        Set Test Variable     ${id_report_dark_brown}    ${ID_REPORT}
        Set Test Variable     ${filename_zip}    ${FILE_REPORT}
        ${filenames} =    BuiltIn.Evaluate    "${FILE_REPORT}".split('.')[0]
        Set Test Variable     ${filename}    ${filenames}

Create file name Report Dark Brown Mule Round 1
        connect to cfr database horse
       ${sql}=   catenate      SELECT ID,REPORT_FILE_NAME FROM BROWN_MULE_REPORT bmr WHERE REPORT_FILE_NAME = 'CFR_Dark_Brown_Mule_Registry_Report_${datetimenow_round1}_001.zip'
        ${query}=   query_all     ${db_connect}     ${sql}     # query
        ${result}=   set variable    ${query[0]}
        ${ID_REPORT}=    set variable    ${result}[ID]
        ${FILE_REPORT}=    set variable    ${result}[REPORT_FILE_NAME]
        Set Test Variable     ${id_report_dark_brown}    ${ID_REPORT}
        Set Test Variable     ${filename_zip}    ${FILE_REPORT}
        ${filenames} =    BuiltIn.Evaluate    "${FILE_REPORT}".split('.')[0]
        Set Test Variable     ${filename}    ${filenames}

Create file name Report Withdraw Brown Mule Round
        connect to cfr database horse
       ${sql}=   catenate      SELECT ID,REPORT_FILE_NAME FROM BROWN_MULE_REPORT bmr WHERE REPORT_FILE_NAME = 'CFR_Withdraw_Brown_Mule_Person_Report_${datetimenow_round1}_001.zip'
        ${query}=   query_all     ${db_connect}     ${sql}     # query
        ${result}=   set variable    ${query[0]}
        ${ID_REPORT}=    set variable    ${result}[ID]
        ${FILE_REPORT}=    set variable    ${result}[REPORT_FILE_NAME]
        Set Test Variable     ${id_report_dark_brown}    ${ID_REPORT}
        Set Test Variable     ${filename_zip}    ${FILE_REPORT}
        ${filenames} =    BuiltIn.Evaluate    "${FILE_REPORT}".split('.')[0]
        Set Test Variable     ${filename}    ${filenames}

Query Wary Juristic Mule Report
        # connect to cfr database horse uat
        connect to cfr database
        WHILE    True
        ${sql}=    catenate    SELECT COUNT(*) FROM AOC_MULE_REQUEST_FILE_INFO WHERE FILE_NAME = '${filename}.gpg'
        ${query}=   query_all     ${db_connect}     ${sql}     # query
        ${count}=    Set Variable    ${query[0]['COUNT(*)']}
        Run Keyword If    ${count} > 0    Exit For Loop
        Sleep    2s
        END
       ${sql}=   catenate      SELECT * FROM AOC_MULE_REQUEST_FILE_INFO WHERE FILE_NAME = '${filename}.gpg'
        ${query}=   query_all     ${db_connect}     ${sql}     # query
        ${result}=   set variable    ${query[0]}
        ${ID_REPORT}=    set variable    ${result}[ID]
        ${FILE_REPORT}=    set variable    ${result}[FILE_NAME]
        Set Test Variable     ${id_wary_report}    ${ID_REPORT}
        Set Test Variable     ${DB_filename}    ${FILE_REPORT}
        ${filenames} =    BuiltIn.Evaluate    "${FILE_REPORT}".split('.')[0]
        Set Test Variable     ${filename}    ${filenames}

Create file name Report Withdraw Brown Mule Round 1
        connect to cfr database horse
    #    ${sql}=   catenate      SELECT ID,REPORT_FILE_NAME FROM BROWN_MULE_REPORT bmr WHERE REPORT_FILE_NAME = 'CFR_Withdraw_Brown_Mule_Person_Report_2025-03-05_001.zip'
       ${sql}=   catenate      SELECT ID,REPORT_FILE_NAME FROM BROWN_MULE_REPORT bmr WHERE REPORT_FILE_NAME = 'CFR_Withdraw_Brown_Mule_Person_Report_${datetimenow_round1}_001.zip'
        ${query}=   query_all     ${db_connect}     ${sql}     # query
        ${result}=   set variable    ${query[0]}
        ${ID_REPORT}=    set variable    ${result}[ID]
        ${FILE_REPORT}=    set variable    ${result}[REPORT_FILE_NAME]
        Set Test Variable     ${id_report_dark_brown}    ${ID_REPORT}
        Set Test Variable     ${filename_zip}    ${FILE_REPORT}
        ${filenames} =    BuiltIn.Evaluate    "${FILE_REPORT}".split('.')[0]
        Set Test Variable     ${filename}    ${filenames}

Create file name Report Dark Brown Mule Round 2
        connect to cfr database horse
       ${sql}=   catenate      SELECT ID,REPORT_FILE_NAME FROM BROWN_MULE_REPORT bmr WHERE REPORT_FILE_NAME = 'CFR_Dark_Brown_Mule_Registry_Report_${datetimenow_round1}_002.zip'
        ${query}=   query_all     ${db_connect}     ${sql}     # query
        ${result}=   set variable    ${query[0]}
        ${ID_REPORT}=    set variable    ${result}[ID]
        ${FILE_REPORT}=    set variable    ${result}[REPORT_FILE_NAME]
        Set Test Variable     ${id_report_dark_brown}    ${ID_REPORT}
        Set Test Variable     ${filename_zip}    ${FILE_REPORT}
        ${filenames} =    BuiltIn.Evaluate    "${FILE_REPORT}".split('.')[0]
        Set Test Variable     ${filename}    ${filenames}

Create file name Report Dark Brown Mule Round 3
        connect to cfr database horse
       ${sql}=   catenate      SELECT ID,REPORT_FILE_NAME FROM BROWN_MULE_REPORT bmr WHERE REPORT_FILE_NAME = 'CFR_Dark_Brown_Mule_Registry_Report_${datetimenow_round1}_003.zip'
        ${query}=   query_all     ${db_connect}     ${sql}     # query
        ${result}=   set variable    ${query[0]}
        ${ID_REPORT}=    set variable    ${result}[ID]
        ${FILE_REPORT}=    set variable    ${result}[REPORT_FILE_NAME]
        Set Test Variable     ${id_report_dark_brown}    ${ID_REPORT}
        Set Test Variable     ${filename_zip}    ${FILE_REPORT}
        ${filenames} =    BuiltIn.Evaluate    "${FILE_REPORT}".split('.')[0]
        Set Test Variable     ${filename}    ${filenames}

PreparaData Call API Dark Brown Mule Report
    Set Time Data
    Call API Brown Mule Report
    Create file name Report Dark Brown Mule

PreparaData Call API Withdraw Brown Mule Report
    Set Time Data
    Call API Withdraw Brown Mule Report
    Create file name Report Withdraw Brown Mule Round

PreparaData Query Round 1 Dark Brown Mule Report
    Set Time Data
    # Call API Brown Mule Report
    Create file name Report Dark Brown Mule Round 1

PreparaData Query Round 2 Dark Brown Mule Report
    Set Time Data
    # Call API Brown Mule Report
    Create file name Report Dark Brown Mule Round 2

PreparaData Query Round 3 Dark Brown Mule Report
    Set Time Data
    # Call API Brown Mule Report
    Create file name Report Dark Brown Mule Round 3

PreparaData Query Round 1 Withdraw Brown Mule Report
    Set Time Data
    Create file name Report Withdraw Brown Mule Round 1


Validate Header Report Brown Mule
    Over view File Dark Brown Mule form SFTP Data
    Over view File Dark Brown Mule from Portal Download
    Should Be Equal    ${csv_list_sftp}[0]    ${csv_list_portal_download}[0]

Evaludte Header
    [Arguments]    ${file_sftp}    ${file_dowload}
    ${csv_list_sftp}=   Evaluate    [ row for row in ${file_sftp} if row[0].startswith('เลขบัตรประชาชน') ]    modules=builtins
    ${csv_list_dowload}=   Evaluate    [ row for row in ${file_dowload} if row[0].startswith('เลขบัตรประชาชน') ]    modules=builtins
Evaludte Tail
    [Arguments]    ${file_sftp}    ${file_dowload}
    ${csv_list_sftp}=   Evaluate    [ row for row in ${file_sftp} if row[0].startswith('เอกสารฉบับนี้จัดทำขึ้นผ่านระบบ') ]    modules=builtins
    ${csv_list_dowload}=   Evaluate    [ row for row in ${file_dowload} if row[0].startswith('เอกสารฉบับนี้จัดทำขึ้นผ่านระบบ') ]    modules=builtins
    Should Be Equal    ${csv_list_sftp}    ${csv_list_dowload}
Evaludte Data
    [Arguments]    ${file_sftp}    ${file_dowload}
    ${csv_list_sftp}=   Evaluate    [row for row in ${file_sftp} if row[0].startswith(('0','1','2','3','4','5','6','7','8','9'))]    modules=builtins
    ${csv_list_dowload}=   Evaluate    [row for row in ${file_dowload} if row[0].startswith(('0','1','2','3','4','5','6','7','8','9'))]    modules=builtins
    Should Be Equal    ${csv_list_sftp}    ${csv_list_dowload}
Evaludte Result Data Sftp and Download
    [Arguments]    ${file_sftp}    ${file_dowload}
    ${csv_list_sftp}=   Evaluate    [row for row in ${file_sftp} if row[0].startswith('#')]    modules=builtins
    ${csv_list_dowload}=   Evaluate    [row for row in ${file_dowload} if row[0].startswith('#')]    modules=builtins
    ${sftp_col_list}=    Evaluate    [row[0].split('|') for row in ${csv_list_sftp}]    modules=builtins
    ${first_row}=      Get From List    ${sftp_col_list}    0
    ${number_sftp}=           Get From List    ${first_row}    0
    ${date_sftp}=           Get From List    ${first_row}    1
    ${res_form_sftp}=           Get From List    ${first_row}    2
    ${pass_sftp}=           Get From List    ${first_row}    3
    ${download_col_list}=    Evaluate    [row[0].split('|') for row in ${csv_list_dowload}]    modules=builtins
    ${first_row_1}=      Get From List    ${download_col_list}    0
    ${number_download}=           Get From List    ${first_row_1}    0
    ${date_download}=           Get From List    ${first_row_1}    1
    ${res_form_dowload}=           Get From List    ${first_row_1}    2
    ${pass_dowload}=           Get From List    ${first_row_1}    3

    Should Be Equal    ${number_sftp}    ${number_download}
    Should Be Equal    ${date_sftp}    ${date_download}
    Should Be Equal    ${res_form_sftp}    CCIB_AOC_SYSTEM
    Should Be Equal    ${res_form_dowload}    002cfr
    Should Be Equal    ${pass_sftp}    ${pass_dowload}
Validate Report Brown Mule
    Over view File Dark Brown Mule form SFTP Data
    Over view File Dark Brown Mule from Portal Download
    list data dark brown mule
    Evaludte Header    ${csv_list_sftp}    ${csv_list_portal_download}
    Evaludte Data    ${csv_list_sftp}    ${csv_list_portal_download}
    Evaludte Result Data Sftp and Download    ${csv_list_sftp}    ${csv_list_portal_download}
    Evaludte Tail    ${csv_list_sftp}    ${csv_list_portal_download}

Validate Tail Report Brown Mule Have Content
    Over view File Dark Brown Mule form SFTP Data
    Over view File Dark Brown Mule from Portal Download 
    Evaludte Result Data Sftp and Download    ${csv_list_sftp}    ${csv_list_portal_download}
    Evaludte Tail    ${csv_list_sftp}    ${csv_list_portal_download}


Validate Content Report Brown Mule
    Over view File Dark Brown Mule form SFTP Data
    Over view File Dark Brown Mule from Portal Download
    Validate list Content To Match SFTP and Download Dark brown mule

Validate list Content To Match SFTP and Download Dark brown mule
    ${csv_list_sftp_clear}=   Evaluate    [ row for row in ${csv_list_sftp} if not row[0].startswith('#') ]    modules=builtins
    ${csv_list_portal_clear}=   Evaluate    [ row for row in ${csv_list_sftp} if not row[0].startswith('#') ]    modules=builtins
     ${total_res}=   Get Length   ${csv_list_sftp_clear} 
        FOR    ${index}    IN RANGE    1    ${total_res}    
        Should Be Equal     ${csv_list_sftp_clear}[${index}]    ${csv_list_portal_clear}[${index}]
        log  this is file sftp ${csv_list_sftp_clear}[${index}]
        log  this is file download portal as api ${csv_list_portal_clear}[${index}]
        END

Validate Check file name Report Dark Brown Mule
     connect to cfr database horse
       ${sql}=   catenate      SELECT REPORT_FILE_NAME FROM BROWN_MULE_REPORT
        ...                    ORDER BY CREATE_DATETIME  DESC 
        ...                    FETCH FIRST 1 ROW ONLY
        ${query}=   query_all     ${db_connect}     ${sql}     # query
        ${result}=   set variable    ${query[0]}
        ${DB_REPORT}=    set variable    ${result}[REPORT_FILE_NAME]
    Should Not Be Empty    ${DB_REPORT}
    Should Not Be Empty    ${filename}.gpg

Validate Check File Report Type Dark Brown Mule
     connect to cfr database horse
       ${sql}=   catenate      SELECT REPORT_FILE_NAME , REPORT_TYPE FROM BROWN_MULE_REPORT
        ...                    WHERE REPORT_FILE_NAME = '${filename}.zip'
        ...                    FETCH FIRST 1 ROW ONLY
        ${query}=   query_all     ${db_connect}     ${sql}     # query
        ${result}=   set variable    ${query[0]}
        ${DB_REPORT}=    set variable    ${result}[REPORT_FILE_NAME]
        ${DB_REPORT_TYPE}=    set variable    ${result}[REPORT_TYPE]
    Should Not Be Empty    ${DB_REPORT}
    Should Be Equal    ${DB_REPORT_TYPE}    CREATE-DARK-BROWN-MULE

Validate Check File Report Type Withdraw Brown Mule
     connect to cfr database horse
       ${sql}=   catenate      SELECT REPORT_FILE_NAME , REPORT_TYPE FROM BROWN_MULE_REPORT
        ...                    WHERE REPORT_FILE_NAME = '${filename}.zip'
        ...                    FETCH FIRST 1 ROW ONLY
        ${query}=   query_all     ${db_connect}     ${sql}     # query
        ${result}=   set variable    ${query[0]}
        ${DB_REPORT}=    set variable    ${result}[REPORT_FILE_NAME]
        ${DB_REPORT_TYPE}=    set variable    ${result}[REPORT_TYPE]
    Should Not Be Empty    ${DB_REPORT}
    Should Be Equal    ${DB_REPORT_TYPE}    WITHDRAW-DARK-BROWN-MULE

Over view File Dark Brown Mule form SFTP Data
    ${file}    OperatingSystem.Get File  ${CSV_FILE}    encoding=UTF-8
    ${lines}    Split To Lines    ${file}
    ${csv_list_sftp}    Create List
    FOR    ${line}    IN    @{lines}
        ${row}    Split String    ${line}    ,
        Append To List    ${csv_list_sftp}    ${row}
    END
    Set Test Variable    ${csv_list_sftp}
    Log    ${csv_list_sftp}

Over view File Dark Brown Mule from Portal Download
    ${file}    OperatingSystem.Get File  ${CURDIR}/Download/${filename}.csv    encoding=UTF-8
    ${lines}    Split To Lines    ${file}
    ${csv_list_portal_download}    Create List
    FOR    ${line}    IN    @{lines}
        ${row}    Split String    ${line}    ,
        Append To List    ${csv_list_portal_download}    ${row}
    END
    Set Test Variable    ${csv_list_portal_download}
    Log    ${csv_list_portal_download}
list data dark brown mule
    ${csv_list_sftp_col}=   Evaluate    [row for row in ${csv_list_sftp} if row[0].startswith(('0','1','2','3','4','5','6','7','8','9'))]    modules=builtins
    ${csv_list_download_col}=   Evaluate    [row for row in ${csv_list_portal_download} if row[0].startswith(('0','1','2','3','4','5','6','7','8','9'))]    modules=builtins
    ${length_list_sftp}    Get Length    ${csv_list_sftp_col}
    ${length_list_dow}    Get Length    ${csv_list_download_col}
    Set Test Variable    ${csv_list_sftp_col}
    Set Test Variable    ${csv_list_download_col}
    Should Be Equal    ${csv_list_sftp_col}    ${csv_list_download_col}


Get File Zip From ITMX for Report Way Juristic Download file
    ${gpg_file_path}=  Set Variable  ${CURDIR}/Download/${filename}.gpg
    ${output_csv_path}=  Set Variable  ${CURDIR}/Decrypt/${filename}.zip
    ${passphrase}=  Set Variable   ${Pass.NITMX}
     ${result}=    Decrypt Gpg File    ${gpg_file_path}  ${output_csv_path}  ${passphrase}
    Log    ${result}

Get File Zip From ITMX for Report Way Juristic
    ${gpg_file_path}=  Set Variable  ${CURDIR}/Data/${filename}.gpg
    ${output_csv_path}=  Set Variable  ${CURDIR}/Decrypt/${filename}.zip
    ${passphrase}=  Set Variable   ${Pass.NITMX}
     ${result}=    Decrypt Gpg File    ${gpg_file_path}  ${output_csv_path}  ${passphrase}
    Log    ${result}

    # wait until created    ${CURDIR}/Data/${Response_MTR_gpg}   2s
    # wait until created    ${CURDIR}/Data/${Response_MTR_csv}   2s
    # set test variable   ${CSV_FILE}     ${CURDIR}/Data/${Response_MTR_csv}
    # set test variable   ${GPG_FILE}     ${CURDIR}/Data/${Response_MTR_gpg}
    # set test variable   ${GPG_FILE_REQ}     ${CURDIR}/Data/${filename}.zip
    # set test variable   ${CSV_FILE_REQ}     ${CURDIR}/Data/${filename}.xlsx

create File Name Wary Juristic max
     get current datetime dark brown mule max
     ${runingnumber}    random_number_warrant    3
     ${directory}=     set variable     All_Mule_Report_${filenameDATE_YMD_THAI}_${runingnumber}
     ${filename}=     set variable     All_Mule_Report_${filenameDATE_YMD_THAI}_${runingnumber}
     ${filename_zip}=     set variable     All_Mule_Report_${filenameDATE_YMD_THAI}_${runingnumber}.zip
     set test variable      ${directory}
     set test variable      ${Wary}      ${directory}
     set test variable      ${filename_zip}
     set test variable      ${filename}   

Encrypt File ZIP max To NITMX ${FILE_NAME_CSV}
    Private key and file path ${FILE_NAME_CSV} Zip max
    ${PRIVATE_KEY_PATH}=  Set Variable   ${PRIVATE_KEY_PATH_TO}
    ${FILEPATH}=  Set Variable  ${FILEPATH_CSV}
    ${input_file}  set variable    ${FILEPATH}
    ${DATA}  set variable    ${FILEPATH}
    ${output_file}  set variable   ${OUT_PATH_GPG}
    ${recipients}   set variable   ${secret_key}
    ${result}=   Sign And Encrypt Zip   ${PRIVATE_KEY_PATH}  ${DATA}  ${input_file}  ${output_file}  ${recipients}    ${Pass.AOC}
    ${signature}    ${output_path}=    Set Variable    ${result}
    Log    Signature: ${signature}
    Log    Output Path: ${output_path}

Private key and file path ${FILE_NAME_CSV} Zip max
  Set test Variable   ${PRIVATE_KEY_PATH_TO}    ${CURDIR}\\${SECAOC}.sec
  Set test Variable   ${FILEPATH_CSV}    ${CURDIR}\\Data/${FILE_NAME_CSV}.zip
  set test variable   ${OUT_PATH_GPG}    ${CURDIR}\\Data/${FILE_NAME_CSV}.gpg

Zip CSV File max
    [Documentation]    บีบอัดไฟล์ CSV เป็น ZIP โดยใช้ Evaluate
    ${ZIP_PATH}     Set Variable   ${CURDIR}\\Data\\${filename}.zip
    ${CSV_PATH}     Set Variable    ${CURDIR}\\Data\\${filename}.csv
    set test variable    ${ZIP_PATH}
    Sleep    2s
    ${results} =    Evaluate    __import__('zipfile').ZipFile(r"${ZIP_PATH}", 'w', __import__('zipfile').ZIP_DEFLATED).write(r"${CSV_PATH}", "${filename}.csv")
    Should Exist    ${ZIP_PATH}

Zip TEXT File
    [Documentation]    บีบอัดไฟล์ CSV เป็น ZIP โดยใช้ Evaluate
    ${ZIP_PATH}     Set Variable   ${CURDIR}\\Data\\${filename}.zip
    ${CSV_PATH}     Set Variable    ${CURDIR}\\Data\\${filename}.txt
    set test variable    ${ZIP_PATH}
    Sleep    2s
    ${results} =    Evaluate    __import__('zipfile').ZipFile(r"${ZIP_PATH}", 'w', __import__('zipfile').ZIP_DEFLATED).write(r"${CSV_PATH}", "${filename}.txt")
    Should Exist    ${ZIP_PATH}
Add File To Zip
    [Arguments]    ${zip}    ${file_path}    ${file}
    Evaluate    ${zip}.write(r"${file_path}", "${file}")
Zip File more
    ${DATA_FOLDER}     Set Variable    C:\\Users\\monthon.kan\\Documents\\GitHub\\itmx-cfr-robot\\keywords\\Data
    ${ZIP_PATH}     Set Variable    C:\\Users\\monthon.kan\\Documents\\GitHub\\itmx-cfr-robot\\keywords\\Download\\${filename}.zip
    ${files} =    Evaluate    [f for f in __import__('os').listdir(r'''${DATA_FOLDER}''') if __import__('os').path.isfile(__import__('os').path.join(r'''${DATA_FOLDER}''', f))]
    Should Not Be Empty    ${files}
    ${zip} =    Evaluate    __import__('zipfile').ZipFile(r'''${ZIP_PATH}''', 'w', __import__('zipfile').ZIP_DEFLATED)
    FOR    ${file}    IN    @{files}
    log     ${file}
    ${file_path} =    Set Variable    ${DATA_FOLDER}\\${file}
    ${zip} =    Evaluate    __import__('zipfile').ZipFile(r"${ZIP_PATH}", 'a', __import__('zipfile').ZIP_DEFLATED)
    Run Keyword    Add File To Zip    ${zip}    ${file_path}    ${file}
    # ${results}    Evaluate    (lambda zipfile, path, name: zipfile.ZipFile(r"${ZIP_PATH}", 'a', zipfile.ZIP_DEFLATED).write(r"${file_path}", "${file}"))(__import__('zipfile'), "${file_path}", "${file}")
    END
Read ZIP File 
    ${zip_content} =    Evaluate    list(__import__('zipfile').ZipFile(r"${ZIP_PATH}", 'r').namelist())
    Log    ไฟล์ภายใน ZIP: ${zip_content}
    Should Contain    ${zip_content}    ${filename}.csv
 
Get Data to file csv wary juristic ${row_number} morify ${txt}
        Set Test Variable     ${txt}
        FOR  ${index}   IN RANGE  1   ${row_number}
        Create Data wary juristic morify
          log   ${index}
        END
 
Create Data wary juristic morify
      ${list}=   create list   Performance testing is an essential process to evaluate the capability of a system or application to function under various conditions, such as handling large amounts of data, executing multiple commands simultaneously, or operating in high-usage environments. This testing helps us understand the system's stability, response time, and ability to manage large amounts of data or access from many users. A good performance test can ensure that the system operates quickly and can scale according to future needs.    
      Append To Csv File     ${CURDIR}/Data/${filename}.${txt}    ${list}
      Set Test Variable   ${list}
 
Create Warrant H FILE TEXT
     ${REQ_data_list_to_check}   create list
      ${list}=   create list   warrant_id;warrant_type;bankcaseid;warrant_date;warrant_time
      ${data}=   create list  ${list}
      create file    ${CURDIR}/Data/${directory}.txt
      Append To Csv File     ${CURDIR}/Data/${directory}.txt    ${data}
      Append To List     ${REQ_data_list_to_check}     ${list} 
      set test variable    ${REQ_data_list_to_check}

Compress Empty File
    ${FILE_PATH}     Set Variable   ${CURDIR}\\Data\\${filename}.txt
    ${EMPTY_FOLDER}     Set Variable   ${CURDIR}\\Data\\empty_folder
    ${ZIP_PATH}     Set Variable    ${CURDIR}\\Data\\${filename}.zip
    set test variable    ${ZIP_PATH}
    Create Directory    ${EMPTY_FOLDER}
    ${results} =    Evaluate    __import__('zipfile').ZipFile(r"${ZIP_PATH}", 'w', __import__('zipfile').ZIP_DEFLATED).write(r"${EMPTY_FOLDER}", "empty_folder")
    # Run    powershell -Command "Compress-Archive -Path '${EMPTY_FOLDER}' -DestinationPath '${ZIP_PATH}' -Force"
    Should Exist    ${ZIP_PATH}
    Remove Directory    ${ZIP_PATH}\\empty_folder


Call API Sending file Wary Jutistic from aoc to ITMX
    # ${API_URL}=   Set Variable     ${Host_UAT}
    ${API_URL}=   Set Variable     ${Host_GET}
    Create Session  triggerWary    ${API_URL}
    ${headers} =   Create Dictionary    Content-Type=${Content-Type}
    ${response}=    POST On Session   triggerWary  ${path.triggerWary}    expected_status=any
    set test variable     ${response}

PreparaData File Download Wary Juristic Mule Report
    Set Time Data
    Query Wary Juristic Mule Report
    Call API Download Wary Juristic Mule Report

Validate Check file name
    Should Be Equal    ${filename}.gpg    ${DB_filename}

PreparaData More File 10 mb for sead
    get current datetime dark brown mule max
    ${randomstringnumber}    Random Number    3
    ${filename10mb}    Set Variable    All_Mule_Report_${filenameDATE_YMD_THAI}_${randomstringnumber}
    ${filename}    Set Variable    All_Mule_Report_${filenameDATE_YMD_THAI}_${randomstringnumber}
    ${filename_zip}    Set Variable    All_Mule_Report_${filenameDATE_YMD_THAI}_${randomstringnumber}.zip
    Set Test Variable    ${filename10mb}
    Set Test Variable    ${filename}
    Set Test Variable    ${filename_zip}
    Copy File    ${CURDIR}/file10mb/All_Mule_Report_2568-03-14_101.gpg    ${CURDIR}/Download/${filename10mb}.gpg
PreparaData Less File 10 mb for sead
    get current datetime dark brown mule max
    ${randomstringnumber}    Random Number    3
    ${filename10mb}    Set Variable    All_Mule_Report_${filenameDATE_YMD_THAI}_${randomstringnumber}
    ${filename}    Set Variable    All_Mule_Report_${filenameDATE_YMD_THAI}_${randomstringnumber}
    ${filename_zip}    Set Variable    All_Mule_Report_${filenameDATE_YMD_THAI}_${randomstringnumber}.zip
    Set Test Variable    ${filename10mb}
    Set Test Variable    ${filename}
    Set Test Variable    ${filename_zip}
    Copy File    ${CURDIR}/file10mb/All_Mule_Report_2568-03-14_100.gpg    ${CURDIR}/Download/${filename10mb}.gpg
    
Deleted path file all
    remove file    ${CURDIR}/Data/*
    remove file    ${CURDIR}/Download/*
    remove file    ${CURDIR}/Decrypt/*

Deleted path file and folder all 
    Remove Directory    ${CURDIR}/Data    recursive=True
    remove file    ${CURDIR}/Data/*
    remove file    ${CURDIR}/Download/*
    remove file    ${CURDIR}/Decrypt/*

    