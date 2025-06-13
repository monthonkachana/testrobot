*** Settings ***
Resource  ../resources/imports.robot
# Library    CryptoLibrary    variable_decryption=True    password=myUnhashedPrivateKeyPassword


*** Variables ***
${FILE_PATH}         ${CURDIR}\\..\\resources\\testdata\\dev\\Typez.txt
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
#    Login	${itmxadm.user}   ${itmxadm.password}   allow_agent=True
   Login	${AOC.user}   ${AOC.password}   allow_agent=True


AOC SFTP SP ${Type}
   Open Connection     ${hostsftp.ip}
   Login	${itmxadm.user}   ${itmxadm.password}   allow_agent=True
   Login	${root.user}   ${root.password}   allow_agent=True


put file presentmetn to sftp server
   sleep  2s
   Wait Until Created      ${CURDIR}/${directory}.zip    2s
   Put File     ${CURDIR}/${directory}.zip    /037/dev/sfpi/presentment/outbound      mode=0770


login to root user
   Open Connection     ${hostsftp.ip}
   Login	${itmxadm.user}   ${itmxadm.password}
   Login	${root.user}   ${root.password}

check query for runing number
     Connect To CFR Database
    WHILE    ${True}
     ${running_number}=    random_number_warrant   3
        ${sql}=    Catenate
        ...    SELECT COUNT(*) FROM AOC_SFTP_WARRANT_REQUEST_FILE_INFO aswmrfi 
        ...    WHERE TRUNC(CREATE_DATETIME) = TO_DATE('${filenameDateTime_eng_v1}','YYYY-MM-DD') 
        ...    AND FILE_NAME LIKE 'CFR_Warrant_H_${filenameDateTime}_${running_number}_REQ.gpg'
        ${query}=    Query All    ${db_connect}    ${sql}
        ${result_dict}=    Get From List    ${query}    0
        ${file_count}=    Get From Dictionary    ${result_dict}    COUNT(*)
        Log    File count: ${file_count}
        Run Keyword If    '${file_count}' == '0'    Exit For Loop
    END
    Set Test Variable    ${running_number}

create File Name Warrant H and ${TIMSS} TIME
     get current datetime
     check query for runing number
    #  ${running_number}=    random_number_warrant   3
     ${directory}=     set variable     CFR_Warrant_H_${filenameDateTime}_${Around.${TIMSS}}_${running_number}_REQ
     ${Response_warrant_H}=     set variable     CFR_Warrant_H_${filenameDateTime}_${Around.${TIMSS}}_${running_number}_RES
     set test variable        ${directory}
     set test variable      ${FileName_Warrant}      ${directory}
     set test variable      ${Response_warrant_H}
     

Create Warrant H FILE CSV
     ${REQ_data_list_to_check}   create list
      ${list}=   create list   warrant_id;warrant_type;bankcaseid;warrant_date;warrant_time
      ${data}=   create list  ${list}
      create file    ${CURDIR}/Data/${directory}.csv
      Append To Csv File     ${CURDIR}/Data/${directory}.csv    ${data}
      Append To List     ${REQ_data_list_to_check}     ${list} 
      set test variable    ${REQ_data_list_to_check}

Create Data add Warrant H
      ${list}=   create list   ${warrant_id};${warrant_type};${MASTER_CASE_ID};${Date_WarrantH};${TIME}    
      ${list2}=   create list   ${MASTER_CASE_ID};${warrant_id};  
      ${data}=   create list  ${list}
    #   ${REQ_data_list_to_check}   create list
      Append To Csv File     ${CURDIR}/Data/${directory}.csv    ${data}
      Set Test Variable   ${list}
      Set Test Variable   ${list2}
      BANK CASE LIST ${list2}


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
    #   Append To Csv File     ${CURDIR}/log.txt   ${data}
      Log To Console      ${data}



put file Warrant_H to sftp server
   sleep  2s
   Wait Until Created      ${CURDIR}/Data/${directory}.gpg    2s
   Put File     ${CURDIR}/Data/${directory}.gpg    /home/sftpaoc/${ENVAOC}/cfr/warranth_binding/inbound      mode=0770
put file Withdraw_mule to sftp server
   sleep  2s
   Wait Until Created      ${CURDIR}/Data/${directory}.gpg    2s
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
    ELSE IF  '${Type}' == 'AOC_SP'
        Close All Connections
        AOC SFTP SP ${Type}
        # put file Warrant_H to sftp server
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
     ${res_muleRefCode_list}    Get Value From Json    ${json_list}    $[0].mule_ref_code
     ${res_muleRefCode} =    Get From List   ${res_muleRefCode_list}    0
    Should Be Equal As Strings    ${res_code}     ${WithDraw.${success}.code}
    Should Be Equal As Strings    ${res_message}       ${WithDraw.${success}.msg}
    Should Not Be Empty     ${res_timestamp}