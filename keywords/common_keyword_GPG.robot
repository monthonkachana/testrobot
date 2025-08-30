*** Settings ***
Resource  ../resources/imports.robot



*** Variables ***

*** Keywords ***

Decrypt File GPG ${Type} and ${FILE_NAME_CSV}
    IF  '${Type}' == 'AOC'
   login to sftp server ${Type}
   Get FileName GrayList From CFR To AOC
   Get File GPG AOC 
   ELSE IF  '${Type}' == 'BANK'
   login to sftp server ${Type}
   Get FileName GrayList From CFR To BANK 
   ELSE
       Decrypt File GPG From NITMX ${FILE_NAME_CSV}
   END


login to sftp server ${Type}
    IF  '${Type}' == 'BANK'
        BANK SFTP ${Type}    
    ELSE IF  '${Type}' == 'AOC'
        AOC SFTP ${Type}
   ELSE
         log  ${Type}  
    END



BANK SFTP ${Type}
   Open Connection     ${hostsftp.ip}
   Login	${bank_999.user}   ${bank_999.password}   allow_agent=True

AOC SFTP ${Type}
   Open Connection     ${hostsftp.ip}
   Login	${AOC.user}   ${AOC.password}   allow_agent=True

put file presentmetn to sftp server
   sleep  2s
   Wait Until Created      ${CURDIR}/${directory}.zip    2s
   Put File     ${CURDIR}/${directory}.zip    /037/dev/sfpi/presentment/outbound      mode=0770


login to root user ${Type}
   Open Connection     ${hostsftp.ip}
   Login	${itmxadm.user}   ${itmxadm.password}
   Login	${root.user}   ${root.password}

create File Name Wary Juristic
     get current datetime Wary juristic
     ${running_number}=    random_number_warrant   3
    #  ${directory}=     set variable     Wary_Juristic_Mule_Report_${filenameDateTime}_${running_number} 
     ${directory}=     set variable     All_Mule_Report_${filenameDateTime}_${running_number}
     ${directory2}=     set variable     All_Mule_report_${filenameDateTime}_${running_number} 
     set test variable      ${filename}   ${directory}
     set test variable      ${FileName_gpg}   ${directory}.gpg
     set test variable      ${FileName_csv}   ${directory}.csv
     set test variable      ${FileName_zip}      ${directory2}.zip

create File Name Warrant H and ${TIMSS} TIME
     get current datetime
     ${running_number}=    random_number_warrant   3
     ${directory}=     set variable     CFR_Warrant_H_${filenameDateTime}_${Around.${TIMSS}}_${running_number}_REQ
     ${Response_warrant_H}=     set variable     CFR_Warrant_H_${filenameDateTime}_${Around.${TIMSS}}_${running_number}_RES
     set test variable        ${directory}
     set test variable      ${FileName_Warrant}      ${directory}
     set test variable      ${Response_warrant_H}
     

create File Name Money Trail
     get current datetime money trail
     ${directory}=     set variable     CFR_MTR_ADHOC_${filenameDateTime}_REQ
    #  ${Response_warrant_H}=     set variable     CFR_MTR_ADHOC_${filenameDateTime}_${Around.${TIMSS}}_${running_number}_RES
     set test variable        ${directory}
     set test variable      ${FileName_Warrant}      ${directory}

Create Warrant H FILE CSV
     ${REQ_data_list_to_check}   create list
      ${list}=   create list   warrant_id;warrant_type;bankcaseid;warrant_date;warrant_time
      ${data}=   create list  ${list}
      create file    ${CURDIR}/Data/${directory}.csv
      Append To Csv File     ${CURDIR}/Data/${directory}.csv    ${data}
      Append To List     ${REQ_data_list_to_check}     ${list} 
      set test variable    ${REQ_data_list_to_check}


Create Wary juristic csv
     ${REQ_data_list_to_check}   create list
      ${list}=   create list   warrant_id;warrant_type;bankcaseid;warrant_date;warrant_time
      ${data}=   create list  ${list}
      create file    ${CURDIR}/Data/${FileName_csv}
      Append To Csv File     ${CURDIR}/Data/${FileName_csv}    ${list}
      Append To List     ${REQ_data_list_to_check}     ${list} 
      set test variable    ${REQ_data_list_to_check}


Create Money Trail FILE CSV
     ${REQ_data_list_to_check}   create list
      ${list}=   create list   bankcaseid
      ${data}=   create list  ${list}
      create file    ${CURDIR}/Data/${directory}.csv
      Append To Csv File     ${CURDIR}/Data/${directory}.csv    ${list}
      Append To List     ${REQ_data_list_to_check}     ${list} 
      set test variable    ${REQ_data_list_to_check}

Create Data add Warrant H
      ${list}=   create list   ${warrant_id};${warrant_type};${MASTER_CASE_ID};${Date_WarrantH};${TIME}     
      ${data}=   create list  ${list}
      Append To Csv File     ${CURDIR}/Data/${directory}.csv    ${data}
      Set Test Variable   ${list}


Create Data wary juristic
      ${list}=   create list   Performance testing is an essential process to evaluate the capability of a system or application to function under various conditions, such as handling large amounts of data, executing multiple commands simultaneously, or operating in high-usage environments. This testing helps us understand the system's stability, response time, and ability to manage large amounts of data or access from many users. A good performance test can ensure that the system operates quickly and can scale according to future needs.    
    #   ${list2}=   create list   Performance testing is an essential process to evaluate the capability of a system or application to function under various conditions, such as handling large amounts of data, executing multiple commands simultaneously, or operating in high-usage environments. This testing helps us understand the system's stability, response time, and ability to manage large amounts of data or access from many users. A good performance test can ensure that the system operates quickly and can scale according to future needs.    
    #   ${list3}=   create list   Performance testing is an essential process to evaluate the capability of a system or application to function under various conditions, such as handling large amounts of data, executing multiple commands simultaneously, or operating in high-usage environments. This testing helps us understand the system's stability, response time, and ability to manage large amounts of data or access from many users. A good performance test can ensure that the system operates quickly and can scale according to future needs.    
    #   ${list4}=   create list   Performance testing is an essential process to evaluate the capability of a system or application to function under various conditions, such as handling large amounts of data, executing multiple commands simultaneously, or operating in high-usage environments. This testing helps us understand the system's stability, response time, and ability to manage large amounts of data or access from many users. A good performance test can ensure that the system operates quickly and can scale according to future needs.    
    #   ${list5}=   create list   Performance testing is an essential process to evaluate the capability of a system or application to function under various conditions, such as handling large amounts of data, executing multiple commands simultaneously, or operating in high-usage environments. This testing helps us understand the system's stability, response time, and ability to manage large amounts of data or access from many users. A good performance test can ensure that the system operates quickly and can scale according to future needs.    
    #   ${data}=   create list  ${list}
      Append To Csv File     ${CURDIR}/Data/${FileName_csv}    ${list}
    #   Append To Csv File     ${CURDIR}/Data/${FileName_csv}    ${list2}
    #   Append To Csv File     ${CURDIR}/Data/${FileName_csv}    ${list3}
    #   Append To Csv File     ${CURDIR}/Data/${FileName_csv}    ${list4}
    #   Append To Csv File     ${CURDIR}/Data/${FileName_csv}    ${list5}
      Set Test Variable   ${list}


Create Data add Money trail
      ${list}=   create list   ${MASTER_CASE_ID}   
      ${data}=   create list  ${list}
      Append To Csv File     ${CURDIR}/Data/${directory}.csv    ${list}
      Set Test Variable   ${list}



BANK CASE LIST ${list2}
    Append To List    ${BANK_CASE_ID}    ${list2}
    set test variable    ${BANK_CASE_ID}

List data file REQ
      Append To List         ${REQ_data_list_to_check}       ${list}
        set test variable    ${REQ_data_list_to_check}
        # ${TEST_FILE}=      Get Length     ${REQ_data_list_to_check}
        # log    ${TEST_FILE}


Log data Create warrant H
      ${list}=   create list   ${PERSONAL_ID}; ${ACCOUNT_NUMBER};${BANK_CODE};(${warrant_id});${warrant_type};${MASTER_CASE_ID};${Date_WarrantH};${TIME}     
      ${data}=   create list  ${list}
      Append To Csv File     ${CURDIR}/log.txt   ${data}



put file Warrant_H to sftp server
   sleep  2s
   Wait Until Created      ${CURDIR}/Data/${directory}.gpg    2s
   Put File     ${CURDIR}/Data/${directory}.gpg    /home/sftpaoc/${ENVAOC}/cfr/warranth_binding/inbound      mode=0770
put file Withdraw_mule to sftp server
   sleep  2s
   Wait Until Created      ${CURDIR}/Data/${directory}.gpg    2s
   Put File     ${CURDIR}/Data/${directory}.gpg    /home/sftpaoc/${ENVAOC}/cfr/withdraw_mule/inbound      mode=0777
put file Withdraw_mule to sftp server for file name
   sleep  2s
   Wait Until Created      ${CURDIR}/Data/${FileName_Warrant}_REQ.gpg    2s
   Put File     ${CURDIR}/Data/${FileName_Warrant}_REQ.gpg    /home/sftpaoc/${ENVAOC}/cfr/withdraw_mule/inbound      mode=0770
put file Black_mule to sftp server for file name
   sleep  2s
   Wait Until Created      ${CURDIR}/Data/${Filename_Req_blackmule}.gpg    2s
   Put File     ${CURDIR}/Data/${Filename_Req_blackmule}.gpg    /home/sftpaoc/${ENVAOC}/cfr/black_mule/inbound      mode=0770
put file Withdraw_Black_mule to sftp server for file name
   sleep  2s
   Wait Until Created      ${CURDIR}/Data/${Filename_Req_blackmule}.gpg    2s
   Put File     ${CURDIR}/Data/${Filename_Req_blackmule}.gpg    /home/sftpaoc/${ENVAOC}/cfr/withdraw_black_mule/inbound      mode=0770
put file Withdraw_Black_mule to sftp server for file name for does not exist
   sleep  2s
   Wait Until Created      ${CURDIR}/Data/${Filename_Req_blackmule}.GPG    2s
   Put File     ${CURDIR}/Data/${Filename_Req_blackmule}.GPG    /home/sftpaoc/${ENVAOC}/cfr/withdraw_black_mule/inbound      mode=0770
check file Withdraw_Black_mule to sftp server
    Sleep    2s
    SSHLibrary.File Should Exist   /home/sftpaoc/${ENVAOC}/cfr/withdraw_black_mule/inbound/${Filename_Req_blackmule}.GPG
    ${inbound}=    Execute Command    rm /home/sftpaoc/${ENVAOC}/cfr/withdraw_black_mule/inbound/${Filename_Req_blackmule}.GPG

   Put File     ${CURDIR}/Data/${directory}.gpg    /home/sftpaoc/aoc_sit/cfr/withdraw_mule/inbound      mode=0770
login to sftp server and Put file by ${Type}
    IF  '${Type}' == 'BANK'
        BANK SFTP ${Type}    
    ELSE IF  '${Type}' == 'AOC'
        AOC SFTP ${Type}
        put file Warrant_H to sftp server
    ELSE IF  '${Type}' == 'Mule'
        Open Connection     ${hostsftp.ip}
        Login	${AOC.user}   ${AOC.password}   allow_agent=True
        put file Withdraw_mule to sftp server
    ELSE IF  '${Type}' == 'Mule_for_file_name'
        Open Connection     ${hostsftp.ip}
        Login	${AOC.user}   ${AOC.password}   allow_agent=True
        put file Withdraw_mule to sftp server for file name
    ELSE IF  '${Type}' == 'Black_mule'
        Open Connection     ${hostsftp.ip}
        Login	${AOC.user}   ${AOC.password}   allow_agent=True
        put file Black_mule to sftp server for file name
    ELSE IF  '${Type}' == 'Withdraw_Black_mule'
        Open Connection     ${hostsftp.ip}
        Login	${AOC.user}   ${AOC.password}   allow_agent=True
        put file Withdraw_Black_mule to sftp server for file name
    ELSE IF  '${Type}' == 'Withdraw_Black_mule_trigger_not_success'
        Open Connection     ${hostsftp.ip}
        Login	${AOC.user}   ${AOC.password}   allow_agent=True
        put file Withdraw_Black_mule to sftp server for file name for does not exist
    ELSE IF  '${Type}' == 'AOC_SC'
        login to root user ${Type}
    ELSE IF  '${Type}' == 'MTR_max'
        Open Connection     ${hostsftp.ip}
        Login	${AOC.user}   ${AOC.password}   allow_agent=True
        put file MTR_Onetime to sftp server max
    ELSE IF  '${Type}' == 'MTR_Rawfile'
        Open Connection     ${hostsftp.ip}
        Login	${AOC.user}   ${AOC.password}   allow_agent=True
        put file MTR_Onetime to sftp server rawfile
    ELSE IF  '${Type}' == 'Dark_brown_mule_max'
        Open Connection     ${hostsftp.ip}
        Login	${AOC.user}   ${AOC.password}   allow_agent=True
        put file Dark Brown Mule to sftp server max
    ELSE IF  '${Type}' == 'Wary_max'
        Open Connection     ${hostsftp.ip}
        Login	${AOC.user}   ${AOC.password}   allow_agent=True
        put file Wary Juristic Mule to sftp server max
    ELSE IF  '${Type}' == 'Wary_check'
        Open Connection     ${hostsftp.ip}
        Login	${AOC.user}   ${AOC.password}   allow_agent=True
        check file Wary Juristic Mule to sftp server max
    ELSE IF  '${Type}' == 'Wary_10'
        Open Connection     ${hostsftp.ip}
        Login	${AOC.user}   ${AOC.password}   allow_agent=True
        put file Wary Juristic Mule to sftp server => 10 mb
    ELSE IF  '${Type}' == 'Juristic'
        Open Connection     ${hostsftp.ip}
        Login	${AOC.user}   ${AOC.password}   allow_agent=True
        put file Juristic
    ELSE IF  '${Type}' == 'AOC_SP'
        AOC SFTP SP ${Type}
        # put file Warrant_H to sftp server
    ELSE IF  '${Type}' == 'MRT_ADHOC'
        Open Connection     ${hostsftp.ip}
        Login	${AOC.user}   ${AOC.password}   allow_agent=True
        Put file money trail report to sftp server
   ELSE
         log  ${Type}  
    END

Check Response Code ${success} GPG FILE 
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
    Should Be Equal As Strings    ${Response_H_Res}     ${ResHS.${success}.code}
    Should Be Equal As Strings    ${Mes_H_Res}       ${ResHS.${success}.msg}
    Should Not Be Empty     ${TS_H_Res}
    log      ${index}
    END
Check Response Code ${success} GPG FILE with JSON 
    ${json_list}=   Load JSON From File      ${CSV_FILE}    encoding=UTF-8
    ${json_list_req}=     Load JSON From File     ${CURDIR}/Data/${directory}.json    encoding=UTF-8
    log    ${json_list_req}
    ${total_res}=   Get Length   ${json_list} 
     Set Test Variable  ${json_list}
    FOR    ${index}    IN RANGE    0    ${total_res}
    # REQ
     ${req_declareUuid_list}    Get Value From Json    ${json_list_req}    $[${index}].declare_uuid
     ${req_declareUuid} =    Get From List   ${req_declareUuid_list}    0
     ${req_declareTypeCode_list}    Get Value From Json    ${json_list_req}    $[${index}].declare_type_code
     ${req_declareTypeCode} =    Get From List   ${req_declareTypeCode_list}    0
     ${req_declareType_list}    Get Value From Json    ${json_list_req}    $[${index}].declare_type
     ${req_muleRefCode_list}    Get Value From Json    ${json_list_req}    $[${index}].mule_ref_code
     ${req_muleRefCode} =    Get From List   ${req_muleRefCode_list}    0
     ${req_declareType} =    Get From List   ${req_declareType_list}    0
     # RES
     ${res_declareUuid_list}    Get Value From Json    ${json_list}    $[${index}].declare_uuid
     ${res_declareUuid} =    Get From List   ${res_declareUuid_list}    0
     ${res_code_list}    Get Value From Json    ${json_list}    $[${index}].code
     ${res_code} =    Get From List   ${res_code_list}    0
     ${res_message_list}    Get Value From Json    ${json_list}    $[${index}].message
     ${res_message} =    Get From List   ${res_message_list}    0
     ${res_timestamp_list}    Get Value From Json    ${json_list}    $[${index}].timestamp
     ${res_timestamp} =    Get From List   ${res_timestamp_list}    0
     ${res_declareTypeCode_list}    Get Value From Json    ${json_list}    $[${index}].declare_type_code
     ${res_declareTypeCode} =    Get From List   ${res_declareTypeCode_list}    0
     ${res_declareType_list}    Get Value From Json    ${json_list}    $[${index}].declare_type
     ${res_declareType} =    Get From List   ${res_declareType_list}    0
     ${res_muleRefCode_list}    Get Value From Json    ${json_list}    $[${index}].mule_ref_code
     ${res_muleRefCode} =    Get From List   ${res_muleRefCode_list}    0

    IF    '${success}' == 'SOME_ITEM_DUPLICATE_Withdraw'
    Should Be Equal As Strings    ${res_declareUuid}    ${EMPTY}
    Should Be Equal As Strings    ${res_declareTypeCode}    ${EMPTY}
    Should Be Equal As Strings    ${res_declareType}    ${EMPTY}
    Should Be Equal As Strings    ${res_muleRefCode}    ${EMPTY}
    Should Be Equal As Strings    ${res_code}    ${WithDraw.${success}.code}
    Should Be Equal As Strings    ${res_message}    ${WithDraw.${success}.msg}
    Should Not Be Empty    ${res_timestamp}
    ELSE IF    '${success}' == 'missing_police_email'
    Should Be Equal As Strings    ${res_declareUuid}    ${EMPTY}
    Should Be Equal As Strings    ${res_declareTypeCode}    ${EMPTY}
    Should Be Equal As Strings    ${res_declareType}    ${EMPTY}
    Should Be Equal As Strings    ${res_muleRefCode}    ${EMPTY}
    Should Be Equal As Strings    ${res_code}    ${WithDraw.${success}.code}
    Should Be Equal As Strings    ${res_message}    ${WithDraw.${success}.msg}
    ELSE IF    '${success}' == 'missing_police_email_value'
    Should Be Equal As Strings    ${res_declareUuid}    ${req_declareUuid}
    Should Be Equal As Strings    ${res_declareTypeCode}    ${req_declareTypeCode}
    Should Be Equal As Strings    ${res_declareType}    ${req_declareType}
    Should Be Equal As Strings    ${res_muleRefCode}    ${req_muleRefCode}
    Should Be Equal As Strings    ${res_code}    ${WithDraw.${success}.code}
    Should Be Equal As Strings    ${res_message}    ${WithDraw.${success}.msg}
    ELSE IF    '${success}' == 'missing_police_tel'
    Should Be Equal As Strings    ${res_declareUuid}    ${EMPTY}
    Should Be Equal As Strings    ${res_declareTypeCode}    ${EMPTY}
    Should Be Equal As Strings    ${res_declareType}    ${EMPTY}
    Should Be Equal As Strings    ${res_muleRefCode}    ${EMPTY}
    Should Be Equal As Strings    ${res_code}    ${WithDraw.${success}.code}
    Should Be Equal As Strings    ${res_message}    ${WithDraw.${success}.msg}
    ELSE IF    '${success}' == 'missing_police_tel_value'
    Should Be Equal As Strings    ${res_declareUuid}    ${req_declareUuid}
    Should Be Equal As Strings    ${res_declareTypeCode}    ${req_declareTypeCode}
    Should Be Equal As Strings    ${res_declareType}    ${req_declareType}
    Should Be Equal As Strings    ${res_muleRefCode}    ${req_muleRefCode}
    Should Be Equal As Strings    ${res_code}    ${WithDraw.${success}.code}
    Should Be Equal As Strings    ${res_message}    ${WithDraw.${success}.msg}
    ELSE IF    '${success}' == 'missing_police_org'
    Should Be Equal As Strings    ${res_declareUuid}    ${EMPTY}
    Should Be Equal As Strings    ${res_declareTypeCode}    ${EMPTY}
    Should Be Equal As Strings    ${res_declareType}    ${EMPTY}
    Should Be Equal As Strings    ${res_muleRefCode}    ${EMPTY}
    Should Be Equal As Strings    ${res_code}    ${WithDraw.${success}.code}
    Should Be Equal As Strings    ${res_message}    ${WithDraw.${success}.msg}
    ELSE IF    '${success}' == 'missing_police_org_value'
    Should Be Equal As Strings    ${res_declareUuid}    ${req_declareUuid}
    Should Be Equal As Strings    ${res_declareTypeCode}    ${req_declareTypeCode}
    Should Be Equal As Strings    ${res_declareType}    ${req_declareType}
    Should Be Equal As Strings    ${res_muleRefCode}    ${req_muleRefCode}
    Should Be Equal As Strings    ${res_code}    ${WithDraw.${success}.code}
    Should Be Equal As Strings    ${res_message}    ${WithDraw.${success}.msg}
    ELSE IF    '${success}' == 'missing_police_job_title'
    Should Be Equal As Strings    ${res_declareUuid}    ${EMPTY}
    Should Be Equal As Strings    ${res_declareTypeCode}    ${EMPTY}
    Should Be Equal As Strings    ${res_declareType}    ${EMPTY}
    Should Be Equal As Strings    ${res_muleRefCode}    ${EMPTY}
    Should Be Equal As Strings    ${res_code}    ${WithDraw.${success}.code}
    Should Be Equal As Strings    ${res_message}    ${WithDraw.${success}.msg}
    ELSE IF    '${success}' == 'missing_police_job_title_value'
    Should Be Equal As Strings    ${res_declareUuid}    ${req_declareUuid}
    Should Be Equal As Strings    ${res_declareTypeCode}    ${req_declareTypeCode}
    Should Be Equal As Strings    ${res_declareType}    ${req_declareType}
    Should Be Equal As Strings    ${res_muleRefCode}    ${req_muleRefCode}
    Should Be Equal As Strings    ${res_code}    ${WithDraw.${success}.code}
    Should Be Equal As Strings    ${res_message}    ${WithDraw.${success}.msg}
    ELSE IF    '${success}' == 'missing_police_surname'
    Should Be Equal As Strings    ${res_declareUuid}    ${EMPTY}
    Should Be Equal As Strings    ${res_declareTypeCode}    ${EMPTY}
    Should Be Equal As Strings    ${res_declareType}    ${EMPTY}
    Should Be Equal As Strings    ${res_muleRefCode}    ${EMPTY}
    Should Be Equal As Strings    ${res_code}    ${WithDraw.${success}.code}
    Should Be Equal As Strings    ${res_message}    ${WithDraw.${success}.msg}
    ELSE IF    '${success}' == 'missing_police_surname_value'
    Should Be Equal As Strings    ${res_declareUuid}    ${req_declareUuid}
    Should Be Equal As Strings    ${res_declareTypeCode}    ${req_declareTypeCode}
    Should Be Equal As Strings    ${res_declareType}    ${req_declareType}
    Should Be Equal As Strings    ${res_muleRefCode}    ${req_muleRefCode}
    Should Be Equal As Strings    ${res_code}    ${WithDraw.${success}.code}
    Should Be Equal As Strings    ${res_message}    ${WithDraw.${success}.msg}
    ELSE IF    '${success}' == 'missing_police_name'
    Should Be Equal As Strings    ${res_declareUuid}    ${EMPTY}
    Should Be Equal As Strings    ${res_declareTypeCode}    ${EMPTY}
    Should Be Equal As Strings    ${res_declareType}    ${EMPTY}
    Should Be Equal As Strings    ${res_muleRefCode}    ${EMPTY}
    Should Be Equal As Strings    ${res_code}    ${WithDraw.${success}.code}
    Should Be Equal As Strings    ${res_message}    ${WithDraw.${success}.msg}
    ELSE IF    '${success}' == 'missing_police_name_value'
    Should Be Equal As Strings    ${res_declareUuid}    ${req_declareUuid}
    Should Be Equal As Strings    ${res_declareTypeCode}    ${req_declareTypeCode}
    Should Be Equal As Strings    ${res_declareType}    ${req_declareType}
    Should Be Equal As Strings    ${res_muleRefCode}    ${req_muleRefCode}
    Should Be Equal As Strings    ${res_code}    ${WithDraw.${success}.code}
    Should Be Equal As Strings    ${res_message}    ${WithDraw.${success}.msg}
    ELSE IF    '${success}' == 'missing_police_rank'
    Should Be Equal As Strings    ${res_declareUuid}    ${EMPTY}
    Should Be Equal As Strings    ${res_declareTypeCode}    ${EMPTY}
    Should Be Equal As Strings    ${res_declareType}    ${EMPTY}
    Should Be Equal As Strings    ${res_muleRefCode}    ${EMPTY}
    Should Be Equal As Strings    ${res_code}    ${WithDraw.${success}.code}
    Should Be Equal As Strings    ${res_message}    ${WithDraw.${success}.msg}
    ELSE IF    '${success}' == 'missing_police_rank_value'
    Should Be Equal As Strings    ${res_declareUuid}    ${req_declareUuid}
    Should Be Equal As Strings    ${res_declareTypeCode}    ${req_declareTypeCode}
    Should Be Equal As Strings    ${res_declareType}    ${req_declareType}
    Should Be Equal As Strings    ${res_muleRefCode}    ${req_muleRefCode}
    Should Be Equal As Strings    ${res_code}    ${WithDraw.${success}.code}
    Should Be Equal As Strings    ${res_message}    ${WithDraw.${success}.msg}
    ELSE IF    '${success}' == 'missing_mule_account_bankname'
    Should Be Equal As Strings    ${res_declareUuid}    ${EMPTY}
    Should Be Equal As Strings    ${res_declareTypeCode}    ${EMPTY}
    Should Be Equal As Strings    ${res_declareType}    ${EMPTY}
    Should Be Equal As Strings    ${res_muleRefCode}    ${EMPTY}
    Should Be Equal As Strings    ${res_code}    ${WithDraw.${success}.code}
    Should Be Equal As Strings    ${res_message}    ${WithDraw.${success}.msg}
    ELSE IF    '${success}' == 'missing_mule_account_bankname_value'
    Should Be Equal As Strings    ${res_declareUuid}    ${req_declareUuid}
    Should Be Equal As Strings    ${res_declareTypeCode}    ${req_declareTypeCode}
    Should Be Equal As Strings    ${res_declareType}    ${req_declareType}
    Should Be Equal As Strings    ${res_muleRefCode}    ${req_muleRefCode}
    Should Be Equal As Strings    ${res_code}    ${WithDraw.${success}.code}
    Should Be Equal As Strings    ${res_message}    ${WithDraw.${success}.msg}
    ELSE IF    '${success}' == 'is_missing_mule_account_bank'
    Should Be Equal As Strings    ${res_declareUuid}    ${EMPTY}
    Should Be Equal As Strings    ${res_declareTypeCode}    ${EMPTY}
    Should Be Equal As Strings    ${res_declareType}    ${EMPTY}
    Should Be Equal As Strings    ${res_muleRefCode}    ${EMPTY}
    Should Be Equal As Strings    ${res_code}    ${WithDraw.${success}.code}
    Should Be Equal As Strings    ${res_message}    ${WithDraw.${success}.msg}
    ELSE IF    '${success}' == 'missing_mule_account_type'
    Should Be Equal As Strings    ${res_declareUuid}    ${EMPTY}
    Should Be Equal As Strings    ${res_declareTypeCode}    ${EMPTY}
    Should Be Equal As Strings    ${res_declareType}    ${EMPTY}
    Should Be Equal As Strings    ${res_muleRefCode}    ${EMPTY}
    Should Be Equal As Strings    ${res_code}    ${WithDraw.${success}.code}
    Should Be Equal As Strings    ${res_message}    ${WithDraw.${success}.msg}
    ELSE IF    '${success}' == 'missing_mule_account_type_value'
    Should Be Equal As Strings    ${res_declareUuid}    ${req_declareUuid}
    Should Be Equal As Strings    ${res_declareTypeCode}    ${req_declareTypeCode}
    Should Be Equal As Strings    ${res_declareType}    ${req_declareType}
    Should Be Equal As Strings    ${res_muleRefCode}    ${req_muleRefCode}
    Should Be Equal As Strings    ${res_code}    ${WithDraw.${success}.code}
    Should Be Equal As Strings    ${res_message}    ${WithDraw.${success}.msg}
    ELSE IF    '${success}' == 'missing_mule_account_no'
    Should Be Equal As Strings    ${res_declareUuid}    ${EMPTY}
    Should Be Equal As Strings    ${res_declareTypeCode}    ${EMPTY}
    Should Be Equal As Strings    ${res_declareType}    ${EMPTY}
    Should Be Equal As Strings    ${res_muleRefCode}    ${EMPTY}
    Should Be Equal As Strings    ${res_code}    ${WithDraw.${success}.code}
    Should Be Equal As Strings    ${res_message}    ${WithDraw.${success}.msg}
    ELSE IF    '${success}' == 'missing_mule_account_no_value'
    Should Be Equal As Strings    ${res_declareUuid}    ${req_declareUuid}
    Should Be Equal As Strings    ${res_declareTypeCode}    ${req_declareTypeCode}
    Should Be Equal As Strings    ${res_declareType}    ${req_declareType}
    Should Be Equal As Strings    ${res_muleRefCode}    ${req_muleRefCode}
    Should Be Equal As Strings    ${res_code}    ${WithDraw.${success}.code}
    Should Be Equal As Strings    ${res_message}    ${WithDraw.${success}.msg}
    ELSE IF    '${success}' == 'missing_mule_nationality'
    Should Be Equal As Strings    ${res_declareUuid}    ${EMPTY}
    Should Be Equal As Strings    ${res_declareTypeCode}    ${EMPTY}
    Should Be Equal As Strings    ${res_declareType}    ${EMPTY}
    Should Be Equal As Strings    ${res_muleRefCode}    ${EMPTY}
    Should Be Equal As Strings    ${res_code}    ${WithDraw.${success}.code}
    Should Be Equal As Strings    ${res_message}    ${WithDraw.${success}.msg}
    ELSE IF    '${success}' == 'missing_mule_nationality_value'
    Should Be Equal As Strings    ${res_declareUuid}    ${req_declareUuid}
    Should Be Equal As Strings    ${res_declareTypeCode}    ${req_declareTypeCode}
    Should Be Equal As Strings    ${res_declareType}    ${req_declareType}
    Should Be Equal As Strings    ${res_muleRefCode}    ${req_muleRefCode}
    Should Be Equal As Strings    ${res_code}    ${WithDraw.${success}.code}
    Should Be Equal As Strings    ${res_message}    ${WithDraw.${success}.msg}
    ELSE IF    '${success}' == 'missing_mule_surnname'
    Should Be Equal As Strings    ${res_declareUuid}    ${EMPTY}
    Should Be Equal As Strings    ${res_declareTypeCode}    ${EMPTY}
    Should Be Equal As Strings    ${res_declareType}    ${EMPTY}
    Should Be Equal As Strings    ${res_muleRefCode}    ${EMPTY}
    Should Be Equal As Strings    ${res_code}    ${WithDraw.${success}.code}
    Should Be Equal As Strings    ${res_message}    ${WithDraw.${success}.msg}
    ELSE IF    '${success}' == 'missing_mule_name'
    Should Be Equal As Strings    ${res_declareUuid}    ${EMPTY}
    Should Be Equal As Strings    ${res_declareTypeCode}    ${EMPTY}
    Should Be Equal As Strings    ${res_declareType}    ${EMPTY}
    Should Be Equal As Strings    ${res_muleRefCode}    ${EMPTY}
    Should Be Equal As Strings    ${res_code}    ${WithDraw.${success}.code}
    Should Be Equal As Strings    ${res_message}    ${WithDraw.${success}.msg}
    ELSE IF    '${success}' == 'missing_mule_name_value'
    Should Be Equal As Strings    ${res_declareUuid}    ${req_declareUuid}
    Should Be Equal As Strings    ${res_declareTypeCode}    ${req_declareTypeCode}
    Should Be Equal As Strings    ${res_declareType}    ${req_declareType}
    Should Be Equal As Strings    ${res_muleRefCode}    ${req_muleRefCode}
    Should Be Equal As Strings    ${res_code}    ${WithDraw.${success}.code}
    Should Be Equal As Strings    ${res_message}    ${WithDraw.${success}.msg}
    ELSE IF    '${success}' == 'missing_mule_identity_type'
    Should Be Equal As Strings    ${res_declareUuid}    ${EMPTY}
    Should Be Equal As Strings    ${res_declareTypeCode}    ${EMPTY}
    Should Be Equal As Strings    ${res_declareType}    ${EMPTY}
    Should Be Equal As Strings    ${res_muleRefCode}    ${EMPTY}
    Should Be Equal As Strings    ${res_code}    ${WithDraw.${success}.code}
    Should Be Equal As Strings    ${res_message}    ${WithDraw.${success}.msg}
    ELSE IF    '${success}' == 'missing_mule_identity_type_value'
    Should Be Equal As Strings    ${res_declareUuid}    ${req_declareUuid}
    Should Be Equal As Strings    ${res_declareTypeCode}    ${req_declareTypeCode}
    Should Be Equal As Strings    ${res_declareType}    ${req_declareType}
    Should Be Equal As Strings    ${res_muleRefCode}    ${req_muleRefCode}
    Should Be Equal As Strings    ${res_code}    ${WithDraw.${success}.code}
    Should Be Equal As Strings    ${res_message}    ${WithDraw.${success}.msg}
    ELSE IF    '${success}' == 'missing_mule_identity_id'
    Should Be Equal As Strings    ${res_declareUuid}    ${EMPTY}
    Should Be Equal As Strings    ${res_declareTypeCode}    ${EMPTY}
    Should Be Equal As Strings    ${res_declareType}    ${EMPTY}
    Should Be Equal As Strings    ${res_muleRefCode}    ${EMPTY}
    Should Be Equal As Strings    ${res_code}    ${WithDraw.${success}.code}
    Should Be Equal As Strings    ${res_message}    ${WithDraw.${success}.msg}
    ELSE IF    '${success}' == 'missing_mule_identity_id_value'
    Should Be Equal As Strings    ${res_declareUuid}    ${req_declareUuid}
    Should Be Equal As Strings    ${res_declareTypeCode}    ${req_declareTypeCode}
    Should Be Equal As Strings    ${res_declareType}    ${req_declareType}
    Should Be Equal As Strings    ${res_muleRefCode}    ${req_muleRefCode}
    Should Be Equal As Strings    ${res_code}    ${WithDraw.${success}.code}
    Should Be Equal As Strings    ${res_message}    ${WithDraw.${success}.msg}
    ELSE IF    '${success}' == 'missing_declare_reason'
    Should Be Equal As Strings    ${res_declareUuid}    ${EMPTY}
    Should Be Equal As Strings    ${res_declareTypeCode}    ${EMPTY}
    Should Be Equal As Strings    ${res_declareType}    ${EMPTY}
    Should Be Equal As Strings    ${res_muleRefCode}    ${EMPTY}
    Should Be Equal As Strings    ${res_code}    ${WithDraw.${success}.code}
    Should Be Equal As Strings    ${res_message}    ${WithDraw.${success}.msg}
    ELSE IF    '${success}' == 'missing_declare_reason_value'
    Should Be Equal As Strings    ${res_declareUuid}    ${req_declareUuid}
    Should Be Equal As Strings    ${res_declareTypeCode}    ${req_declareTypeCode}
    Should Be Equal As Strings    ${res_declareType}    ${req_declareType}
    Should Be Equal As Strings    ${res_muleRefCode}    ${req_muleRefCode}
    Should Be Equal As Strings    ${res_code}    ${WithDraw.${success}.code}
    Should Be Equal As Strings    ${res_message}    ${WithDraw.${success}.msg}
    ELSE IF    '${success}' == 'missing_mule_ref_code'
    Should Be Equal As Strings    ${res_declareUuid}    ${EMPTY}
    Should Be Equal As Strings    ${res_declareTypeCode}    ${EMPTY}
    Should Be Equal As Strings    ${res_declareType}    ${EMPTY}
    Should Be Equal As Strings    ${res_muleRefCode}    ${EMPTY}
    Should Be Equal As Strings    ${res_code}    ${WithDraw.${success}.code}
    Should Be Equal As Strings    ${res_message}    ${WithDraw.${success}.msg}
    ELSE IF    '${success}' == 'missing_mule_ref_code_value'
    Should Be Equal As Strings    ${res_declareUuid}    ${req_declareUuid}
    Should Be Equal As Strings    ${res_declareTypeCode}    ${req_declareTypeCode}
    Should Be Equal As Strings    ${res_declareType}    ${req_declareType}
    Should Be Equal As Strings    ${res_muleRefCode}    ${req_muleRefCode}
    Should Be Equal As Strings    ${res_code}    ${WithDraw.${success}.code}
    Should Be Equal As Strings    ${res_message}    ${WithDraw.${success}.msg}
    ELSE IF    '${success}' == 'missing_declare_note'
    Should Be Equal As Strings    ${res_declareUuid}    ${EMPTY}
    Should Be Equal As Strings    ${res_declareTypeCode}    ${EMPTY}
    Should Be Equal As Strings    ${res_declareType}    ${EMPTY}
    Should Be Equal As Strings    ${res_muleRefCode}    ${EMPTY}
    Should Be Equal As Strings    ${res_code}    ${WithDraw.${success}.code}
    Should Be Equal As Strings    ${res_message}    ${WithDraw.${success}.msg}
    ELSE IF    '${success}' == 'missing_declare_uuid'
    Should Be Equal As Strings    ${res_declareUuid}    ${EMPTY}
    Should Be Equal As Strings    ${res_declareTypeCode}    ${EMPTY}
    Should Be Equal As Strings    ${res_declareType}    ${EMPTY}
    Should Be Equal As Strings    ${res_muleRefCode}    ${EMPTY}
    Should Be Equal As Strings    ${res_code}    ${WithDraw.${success}.code}
    Should Be Equal As Strings    ${res_message}    ${WithDraw.${success}.msg}
    ELSE IF    '${success}' == 'missing_declare_type_code'
    Should Be Equal As Strings    ${res_declareUuid}    ${EMPTY}
    Should Be Equal As Strings    ${res_declareTypeCode}    ${EMPTY}
    Should Be Equal As Strings    ${res_declareType}    ${EMPTY}
    Should Be Equal As Strings    ${res_muleRefCode}    ${EMPTY}
    Should Be Equal As Strings    ${res_code}    ${WithDraw.${success}.code}
    Should Be Equal As Strings    ${res_message}    ${WithDraw.${success}.msg}
    ELSE IF    '${success}' == 'missing_declare_type'
    Should Be Equal As Strings    ${res_declareUuid}    ${EMPTY}
    Should Be Equal As Strings    ${res_declareTypeCode}    ${EMPTY}
    Should Be Equal As Strings    ${res_declareType}    ${EMPTY}
    Should Be Equal As Strings    ${res_muleRefCode}    ${EMPTY}
    Should Be Equal As Strings    ${res_code}    ${WithDraw.${success}.code}
    Should Be Equal As Strings    ${res_message}    ${WithDraw.${success}.msg}
    ELSE IF    '${success}' == 'missing_declare_reason_code'
    Should Be Equal As Strings    ${res_declareUuid}    ${EMPTY}
    Should Be Equal As Strings    ${res_declareTypeCode}    ${EMPTY}
    Should Be Equal As Strings    ${res_declareType}    ${EMPTY}
    Should Be Equal As Strings    ${res_muleRefCode}    ${EMPTY}
    Should Be Equal As Strings    ${res_code}    ${WithDraw.${success}.code}
    Should Be Equal As Strings    ${res_message}    ${WithDraw.${success}.msg}
    ELSE IF    '${success}' == 'missing_declare_reason_code_value'
    Should Be Equal As Strings    ${res_declareUuid}    ${req_declareUuid}
    Should Be Equal As Strings    ${res_declareTypeCode}    ${req_declareTypeCode}
    Should Be Equal As Strings    ${res_declareType}    ${req_declareType}
    Should Be Equal As Strings    ${res_muleRefCode}    ${req_muleRefCode}
    Should Be Equal As Strings    ${res_code}    ${WithDraw.${success}.code}
    Should Be Equal As Strings    ${res_message}    ${WithDraw.${success}.msg}
    ELSE
    Should Be Equal As Strings    ${res_declareUuid}    ${req_declareUuid}
    Should Be Equal As Strings    ${res_declareTypeCode}    ${req_declareTypeCode}
    Should Be Equal As Strings    ${res_declareType}    ${req_declareType}
    Should Be Equal As Strings    ${res_muleRefCode}    ${req_muleRefCode}
    Should Be Equal As Strings    ${res_code}    ${WithDraw.${success}.code}
    Should Be Equal As Strings    ${res_message}    ${WithDraw.${success}.msg}
    Should Not Be Empty    ${res_timestamp}
    END
    END

Check Response Code ${success} GPG FILE with JSON In Missing field is ${data}
    ${json_list}=   Load JSON From File      ${CSV_FILE}    encoding=UTF-8
    ${json_list_req}=     Load JSON From File     ${CURDIR}/Data/${directory}.json    encoding=UTF-8
    log    ${json_list_req}
    ${total_res}=   Get Length   ${json_list} 
     Set Test Variable  ${json_list}
    FOR    ${index}    IN RANGE    0    ${total_res}
    # REQ
     ${req_declareUuid_list}    Get Value From Json    ${json_list_req}    $[${index}].declare_uuid
     ${req_declareTypeCode_list}    Get Value From Json    ${json_list_req}    $[${index}].declare_type_code
     ${req_declareType_list}    Get Value From Json    ${json_list_req}    $[${index}].declare_type
     ${req_muleRefCode_list}    Get Value From Json    ${json_list_req}    $[${index}].mule_ref_code

     # RES
     ${res_declareUuid_list}    Get Value From Json    ${json_list}    $[${index}].declare_uuid
     ${res_declareUuid} =    Get From List   ${res_declareUuid_list}    0
     ${res_code_list}    Get Value From Json    ${json_list}    $[${index}].code
     ${res_code} =    Get From List   ${res_code_list}    0
     ${res_message_list}    Get Value From Json    ${json_list}    $[${index}].message
     ${res_message} =    Get From List   ${res_message_list}    0
     ${res_timestamp_list}    Get Value From Json    ${json_list}    $[${index}].timestamp
     ${res_timestamp} =    Get From List   ${res_timestamp_list}    0
     ${res_declareTypeCode_list}    Get Value From Json    ${json_list}    $[${index}].declare_type_code
     ${res_declareTypeCode} =    Get From List   ${res_declareTypeCode_list}    0
     ${res_declareType_list}    Get Value From Json    ${json_list}    $[${index}].declare_type
     ${res_declareType} =    Get From List   ${res_declareType_list}    0
     ${res_muleRefCode_list}    Get Value From Json    ${json_list}    $[${index}].mule_ref_code
     ${res_muleRefCode} =    Get From List   ${res_muleRefCode_list}    0
    IF    '${data}' == 'missing_declare_uuid'
    #  ${req_declareUuid} =    Get From List   ${req_declareUuid_list}    0
     ${req_declareTypeCode} =    Get From List   ${req_declareTypeCode_list}    0
     ${req_muleRefCode} =    Get From List   ${req_muleRefCode_list}    0
     ${req_declareType} =    Get From List   ${req_declareType_list}    0
    Should Be Equal As Strings    ${res_declareUuid}    ${EMPTY}
    Should Be Equal As Strings    ${res_declareTypeCode}    ${EMPTY}
    Should Be Equal As Strings    ${res_declareType}    ${EMPTY}
    Should Be Equal As Strings    ${res_muleRefCode}    ${EMPTY}
    Should Be Equal As Strings    ${res_code}    ${WithDraw.${success}.code}
    Should Be Equal As Strings    ${res_message}    ${WithDraw.${success}.msg}
    Should Not Be Empty    ${res_timestamp}
    ELSE IF    '${data}' == 'missing_declare_type_code'
     ${req_declareUuid} =    Get From List   ${req_declareUuid_list}    0
    #  ${req_declareTypeCode} =    Get From List   ${req_declareTypeCode_list}    0
     ${req_muleRefCode} =    Get From List   ${req_muleRefCode_list}    0
     ${req_declareType} =    Get From List   ${req_declareType_list}    0
    Should Be Equal As Strings    ${res_declareUuid}    ${EMPTY}
    Should Be Equal As Strings    ${res_declareTypeCode}    ${EMPTY}
    Should Be Equal As Strings    ${res_declareType}    ${EMPTY}
    Should Be Equal As Strings    ${res_muleRefCode}    ${EMPTY}
    Should Be Equal As Strings    ${res_code}    ${WithDraw.${success}.code}
    Should Be Equal As Strings    ${res_message}    ${WithDraw.${success}.msg}
    Should Not Be Empty    ${res_timestamp}
    ELSE IF    '${data}' == 'missing_declare_type'
     ${req_declareUuid} =    Get From List   ${req_declareUuid_list}    0
     ${req_declareTypeCode} =    Get From List   ${req_declareTypeCode_list}    0
    #  ${req_declareType} =    Get From List   ${req_declareType_list}    0
     ${req_muleRefCode} =    Get From List   ${req_muleRefCode_list}    0
    Should Be Equal As Strings    ${res_declareUuid}    ${EMPTY}
    Should Be Equal As Strings    ${res_declareTypeCode}    ${EMPTY}
    Should Be Equal As Strings    ${res_declareType}    ${EMPTY}
    Should Be Equal As Strings    ${res_muleRefCode}    ${EMPTY}
    Should Be Equal As Strings    ${res_code}    ${WithDraw.${success}.code}
    Should Be Equal As Strings    ${res_message}    ${WithDraw.${success}.msg}
    Should Not Be Empty    ${res_timestamp}
    ELSE IF    '${data}' == 'missing_mule_ref_code'
     ${req_declareUuid} =    Get From List   ${req_declareUuid_list}    0
     ${req_declareTypeCode} =    Get From List   ${req_declareTypeCode_list}    0
     ${req_declareType} =    Get From List   ${req_declareType_list}    0
    #  ${req_muleRefCode} =    Get From List   ${req_muleRefCode_list}    0
    Should Be Equal As Strings    ${res_declareUuid}    ${EMPTY}
    Should Be Equal As Strings    ${res_declareTypeCode}    ${EMPTY}
    Should Be Equal As Strings    ${res_declareType}    ${EMPTY}
    Should Be Equal As Strings    ${res_muleRefCode}    ${EMPTY}
    Should Be Equal As Strings    ${res_code}    ${WithDraw.${success}.code}
    Should Be Equal As Strings    ${res_message}    ${WithDraw.${success}.msg}
    Should Not Be Empty    ${res_timestamp}
    ELSE
    log       not match any data
    END
    END