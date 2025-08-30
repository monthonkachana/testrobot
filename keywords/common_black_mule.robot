*** Settings ***
Resource  ../resources/imports.robot
*** Variables ***
@{NAMES}    มานะ    มานี    จูจิ    มันดะ    ไอแดง    สมชาย    สมศรี    ดำรง    ดารา    นพดล    กิ่งแก้ว    ชัยยันต์    นิดหน่อย    ปรางค์ทอง    อาทิตย์    จันทร์ฉาย    สายฝน    บุญเติม    พิมพ์ใจ    อุษา    วิไล    ประจักษ์    เพ็ญนภา    สมบัติ    ยุทธนา    กนกวรรณ    ศิริพร    ธนา    อมร
@{LASTNAME}    ใจดี    จริงใจ    จริงนะ    ควรมี    ตั้งมั่น    ศรีสุข    บุญมาก    รัตนากร    ภูมิฐาน    แก้วใส    อนันตกาล    วิเศษดี    นาคาพันธ์    ธรรมรักษ์    มหาทรัพย์    รุ่งเรือง    พิพัฒน์    อุดมผล    เจริญกิจ    ทองสุข    บวรธรรม    สุขสมบัติ    ภักดีศรี    ก้องเกียรติ    ทรงธรรม
@{NAMES_ENG}    max    man    moo    mun    mode    mike    mark    mason    matt    mickey    john    jake    jerry    jason    jeff    tom    tony    tim    trevor    terry    sam    sean    simon    steve    stan    ron    rick    ryan    roger    rex
@{LASTNAME_ENG}    non    nee    nega    nata    nelson    nicholson    newman    nixon    noble    norwood    norris    north    nottingham    novak    nutter    nobleman    neville    norfolk    norton    notley    norcross    nightingale    norbury    northwood    norrell    norwood

*** Keywords ***
set runing number frist 
     ${runing_test}    Set Variable    001
     ${runing_test} =  BuiltIn.Evaluate  str(int("${runing_test}") + 1).zfill(3)
     Set Suite Variable    ${runing_test}
create File Name black mule
     get current datetime
     ${running_number}=    random_number_warrant   3
     ${FileName}=     set variable     CFR_RegistryBlackMule_${filenameDateTime}_${running_number}
     ${directory}=     set variable     CFR_RegistryBlackMule_${filenameDateTime}_${running_number}_REQ
     ${Filename_Res_blackmule}=     set variable     CFR_RegistryBlackMule_${filenameDateTime}_${running_number}_RES
    @{list_file}=    Create List    ${FileName}
     set test variable        ${directory}
     set test variable      ${Filename_Req_blackmule}      ${directory}
     set test variable      ${Filename_Res_blackmule}
     set test variable      ${FileName}
     set test variable      ${Filenames}    ${list_file}
create File black mule 
     get current datetime
     Connect To CFR Database
    WHILE    ${True}
     ${running_number}=    random_number_400_600
        ${sql}=    Catenate
        ...    SELECT COUNT(*) FROM AOC_SFTP_BLACK_MULE_REQUEST_FILE_INFO aswmrfi 
        ...    WHERE TRUNC(CREATE_DATETIME) = TO_DATE('${filenameDateTime_eng_v1}','YYYY-MM-DD') 
        ...    AND FILE_NAME LIKE 'CFR_RegistryBlackMule_${filenameDateTime}_${running_number}_REQ.gpg'
        ${query}=    Query All    ${db_connect}    ${sql}
        ${result_dict}=    Get From List    ${query}    0
        ${file_count}=    Get From Dictionary    ${result_dict}    COUNT(*)
        Log    File count: ${file_count}
        Run Keyword If    '${file_count}' == '0'    Exit For Loop
    END
     ${FileName}=     set variable     CFR_RegistryBlackMule_${filenameDateTime}_${running_number}
     ${directory}=     set variable     CFR_RegistryBlackMule_${filenameDateTime}_${running_number}_REQ
     ${Filename_Res_blackmule}=     set variable     CFR_RegistryBlackMule_${filenameDateTime}_${running_number}_RES
    @{list_file}=    Create List    ${FileName}
     set test variable        ${directory}
     set test variable      ${Filename_Req_blackmule}      ${directory}
     set test variable      ${Filename_Res_blackmule}
     set test variable      ${FileName}
     set test variable      ${Filenames}    ${list_file}
create File withdraw black mule 
     get current datetime
     Connect To CFR Database
    WHILE    ${True}
     ${running_number}=    random_number_400_600
        ${sql}=    Catenate
        ...    SELECT COUNT(*) FROM AOC_SFTP_WITHDRAW_MULE_REQUEST_FILE_INFO aswmrfi 
        ...    WHERE TRUNC(CREATE_DATETIME) = TO_DATE('${filenameDateTime_eng_v1}','YYYY-MM-DD') 
        ...    AND FILE_NAME LIKE 'CFR_WithdrawBlackMule_${filenameDateTime}_${running_number}_REQ.gpg'
        ${query}=    Query All    ${db_connect}    ${sql}
        ${result_dict}=    Get From List    ${query}    0
        ${file_count}=    Get From Dictionary    ${result_dict}    COUNT(*)
        Log    File count: ${file_count}
        Run Keyword If    '${file_count}' == '0'    Exit For Loop
    END
     ${FileName}=     set variable     CFR_WithdrawBlackMule_${filenameDateTime}_${running_number}
     ${directory}=     set variable     CFR_WithdrawBlackMule_${filenameDateTime}_${running_number}_REQ
     ${Filename_Res_blackmule}=     set variable     CFR_WithdrawBlackMule_${filenameDateTime}_${running_number}_RES
    @{list_file}=    Create List    ${FileName}
     set test variable        ${directory}
     set test variable      ${Filename_Req_blackmule}      ${directory}
     set test variable      ${Filename_Res_blackmule}
     set test variable      ${FileName}
     set test variable      ${Filenames}    ${list_file}
Invalid create File withdraw black mule in case ${chose}
     get current datetime
     Connect To CFR Database
     IF      '${chose}' == 'Invalid_Format_file_name_runing_2dig'
        WHILE    ${True}
        ${running_number}=    random_number_40_60
        ${sql}=    Catenate
        ...    SELECT COUNT(*) FROM AOC_SFTP_WITHDRAW_MULE_REQUEST_FILE_INFO aswmrfi 
        ...    WHERE TRUNC(CREATE_DATETIME) = TO_DATE('${filenameDateTime_eng_v1}','YYYY-MM-DD') 
        ...    AND FILE_NAME LIKE 'CFR_WithdrawBlackMule_${filenameDateTime}_${running_number}_REQ.gpg'
        ${query}=    Query All    ${db_connect}    ${sql}
        ${result_dict}=    Get From List    ${query}    0
        ${file_count}=    Get From Dictionary    ${result_dict}    COUNT(*)
        Log    File count: ${file_count}
        Run Keyword If    '${file_count}' == '0'    Exit For Loop
        END
     ELSE IF     '${chose}' == 'Invalid_Format_file_name_runing_4dig'
        WHILE    ${True}
        ${running_number}=    random_number_4000_6000
        ${sql}=    Catenate
        ...    SELECT COUNT(*) FROM AOC_SFTP_WITHDRAW_MULE_REQUEST_FILE_INFO aswmrfi 
        ...    WHERE TRUNC(CREATE_DATETIME) = TO_DATE('${filenameDateTime_eng_v1}','YYYY-MM-DD') 
        ...    AND FILE_NAME LIKE 'CFR_WithdrawBlackMule_${filenameDateTime}_${running_number}_REQ.gpg'
        ${query}=    Query All    ${db_connect}    ${sql}
        ${result_dict}=    Get From List    ${query}    0
        ${file_count}=    Get From Dictionary    ${result_dict}    COUNT(*)
        Log    File count: ${file_count}
        Run Keyword If    '${file_count}' == '0'    Exit For Loop
        END
     ELSE
        WHILE    ${True}
        ${running_number}=    random_number_400_600
        ${sql}=    Catenate
        ...    SELECT COUNT(*) FROM AOC_SFTP_WITHDRAW_MULE_REQUEST_FILE_INFO aswmrfi 
        ...    WHERE TRUNC(CREATE_DATETIME) = TO_DATE('${filenameDateTime_eng_v1}','YYYY-MM-DD') 
        ...    AND FILE_NAME LIKE 'CFR_WithdrawBlackMule_${filenameDateTime}_${running_number}_REQ.gpg'
        ${query}=    Query All    ${db_connect}    ${sql}
        ${result_dict}=    Get From List    ${query}    0
        ${file_count}=    Get From Dictionary    ${result_dict}    COUNT(*)
        Log    File count: ${file_count}
        Run Keyword If    '${file_count}' == '0'    Exit For Loop
        END
     END
     
     IF      '${chose}' == 'Invalid_Format_file_name'
     ${FileName}=     set variable     TEST_${filenameDateTime}_${running_number}
     ${directory}=     set variable     TEST_${filenameDateTime}_${running_number}_REQ
     ${Filename_Res_blackmule}=     set variable     TEST_${filenameDateTime}_${running_number}_RES
     ELSE IF     '${chose}' == 'Invalid_Format_file_name_contain_unsup'
     ${FileName}=     set variable     CFR_WithdrawBlackMule_ทดสอบค่ะ!+@&%_${running_number}
     ${directory}=     set variable     CFR_WithdrawBlackMule_ทดสอบค่ะ!+@&%_${running_number}_REQ
     ${Filename_Res_blackmule}=     set variable     CFR_WithdrawBlackMule_ทดสอบค่ะ!+@&%_${running_number}_RES
     ELSE IF     '${chose}' == 'Invalid_Format_file_name_not_REQ'
     ${FileName}=     set variable     CFR_WithdrawBlackMule_${filenameDateTime}_${running_number}
     ${directory}=     set variable     CFR_WithdrawBlackMule_${filenameDateTime}_${running_number}_Test
     ${Filename_Res_blackmule}=     set variable     CFR_WithdrawBlackMule_${filenameDateTime}_${running_number}_Test_RES
     ELSE IF     '${chose}' == 'Invalid_Format_file_name_date_character'
     ${FileName}=     set variable     CFR_WithdrawBlackMule_2568TS14_${running_number}
     ${directory}=     set variable     CFR_WithdrawBlackMule_2568TS14_${running_number}_REQ
     ${Filename_Res_blackmule}=     set variable     CFR_WithdrawBlackMule_2568TS14_${running_number}_RES
     ELSE IF     '${chose}' == 'Invalid_Format_file_name_date_character_thai'
     ${FileName}=     set variable     CFR_WithdrawBlackMule_256805เทส_${running_number}
     ${directory}=     set variable     CFR_WithdrawBlackMule_256805เทส_${running_number}_REQ
     ${Filename_Res_blackmule}=     set variable     CFR_WithdrawBlackMule_256805เทส_${running_number}_RES
     ELSE IF     '${chose}' == 'Invalid_Format_file_name_dose_not_sys'
     ${FileName}=     set variable     CFR_WithdrawBlackMule_${filenameDateTime_day_future}_${running_number}
     ${directory}=     set variable     CFR_WithdrawBlackMule_${filenameDateTime_day_future}_${running_number}_REQ
     ${Filename_Res_blackmule}=     set variable     CFR_WithdrawBlackMule_${filenameDateTime_day_future}_${running_number}_RES
     ELSE IF     '${chose}' == 'Invalid_Format_file_name_date_eng'
     ${FileName}=     set variable     CFR_WithdrawBlackMule_${filenameDateTime_eng}_${running_number}
     ${directory}=     set variable     CFR_WithdrawBlackMule_${filenameDateTime_eng}_${running_number}_REQ
     ${Filename_Res_blackmule}=     set variable     CFR_WithdrawBlackMule_${filenameDateTime_eng}_${running_number}_RES
     ELSE IF     '${chose}' == 'Invalid_Format_file_name_month'
     ${FileName}=     set variable     CFR_WithdrawBlackMule_${filenameDateTime_month_future_v1}_${running_number}
     ${directory}=     set variable     CFR_WithdrawBlackMule_${filenameDateTime_month_future_v1}_${running_number}_REQ
     ${Filename_Res_blackmule}=     set variable     CFR_WithdrawBlackMule_${filenameDateTime_month_future_v1}_${running_number}_RES
     ELSE IF     '${chose}' == 'Invalid_Format_file_name_day'
     ${FileName}=     set variable     CFR_WithdrawBlackMule_${filenameDateTime_day_future}_${running_number}
     ${directory}=     set variable     CFR_WithdrawBlackMule_${filenameDateTime_day_future}_${running_number}_REQ
     ${Filename_Res_blackmule}=     set variable     CFR_WithdrawBlackMule_${filenameDateTime_day_future}_${running_number}_RES
     ELSE IF     '${chose}' == 'Invalid_Format_file_name_year'
     ${FileName}=     set variable     CFR_WithdrawBlackMule_${filenameDateTime_year_future}_${running_number}
     ${directory}=     set variable     CFR_WithdrawBlackMule_${filenameDateTime_year_future}_${running_number}_REQ
     ${Filename_Res_blackmule}=     set variable     CFR_WithdrawBlackMule_${filenameDateTime_year_future}_${running_number}_RES
     ELSE
     ${FileName}=     set variable     CFR_WithdrawBlackMule_${filenameDateTime}_${running_number}
     ${directory}=     set variable     CFR_WithdrawBlackMule_${filenameDateTime}_${running_number}_REQ
     ${Filename_Res_blackmule}=     set variable     CFR_WithdrawBlackMule_${filenameDateTime}_${running_number}_RES
     END
    @{list_file}=    Create List    ${FileName}

     set test variable        ${directory}
     set test variable      ${Filename_Req_blackmule}      ${directory}
     set test variable      ${Filename_Res_blackmule}
     set test variable      ${FileName}
     set test variable      ${Filenames}    ${list_file}
create File Name black mule V1
     get current datetime
     create File black mule 
    #  ${result}=    Run Keyword And Ignore Error    Set Variable    ${running_number}
    #  Run Keyword If    '${result[0]}' == 'FAIL'    create File Name black mule
    #  ...    ELSE    Get Or Generate Running Number
create File Name black mule 2 files
     get current datetime
    ${running_number}=    random_number_warrant   3
    ${FileName}=     Set Variable    CFR_RegistryBlackMule_${filenameDateTime}_${running_number}
    @{list_file}=    Create List    ${FileName}
     ${directory}=     set variable     CFR_RegistryBlackMule_${filenameDateTime}_${running_number}_REQ
     ${Filename_Res_blackmule}=     set variable     CFR_RegistryBlackMule_${filenameDateTime}_${running_number}_RES
      Append To List     ${Filenames}     ${list_file} 
     set test variable        ${directory}
     set test variable      ${Filename_Req_blackmule}      ${directory}
     set test variable      ${Filename_Res_blackmule}
     set test variable      ${FileName}
     set test variable      ${Filenames}
create File Name black mule and validate file name is ${condition}
    IF  '${condition}' == 'invali_file_name'
        #  get current datetime
    #  ${running_number}=    random_number_warrant   3
    log    ${running_number}
    Set Test Variable    ${testcase}    ${running_number}
    get current datetime
    Query check test case today
     ${FileName}=     set variable     CFR_BlackMule_${filenameDateTime}_${running_number}
     ${directory}=     set variable     CFR_BlackMule_${filenameDateTime}_${running_number}_REQ
     ${Filename_Res_blackmule}=     set variable     CFR_BlackMule_${filenameDateTime}_${running_number}_RES
    ${running_number} =  BuiltIn.Evaluate  str(int("${running_number}") + 1).zfill(3)
    Set Suite Variable    ${running_number}
    ELSE IF  '${condition}' == 'invali_file_name_not_running_number'
     get current datetime
     ${running_number}=    random_number_warrant   3
     ${FileName}=     set variable     CFR_BlackMule_${filenameDateTime}_${running_number}
     ${directory}=     set variable     CFR_BlackMule_${filenameDateTime}_${running_number}_REQ
     ${Filename_Res_blackmule}=     set variable     CFR_BlackMule_${filenameDateTime}_${running_number}_RES
    ELSE IF  '${condition}' == 'invali_file_name_datetime'
     get current datetime
     Set Test Variable    ${testcase}    ${running_number}
     get current datetime
     Query check test case today
     ${filenameDateTime}=    random_number_warrant   6
     ${FileName}=     set variable     CFR_RegistryBlackMule_${filenameDateTime}_${running_number}
     ${directory}=     set variable     CFR_RegistryBlackMule_${filenameDateTime}_${running_number}_REQ
     ${Filename_Res_blackmule}=     set variable     CFR_RegistryBlackMule_${filenameDateTime}_${running_number}_RES
    ${running_number} =  BuiltIn.Evaluate  str(int("${running_number}") + 1).zfill(3)
    Set Suite Variable    ${running_number}
    ELSE IF  '${condition}' == 'invali_file_name_datetime_not_running_number'
     get current datetime
     ${filenameDateTime}=    random_number_warrant   6
     ${running_number}=    random_number_warrant   3
     ${FileName}=     set variable     CFR_RegistryBlackMule_${filenameDateTime}_${running_number}
     ${directory}=     set variable     CFR_RegistryBlackMule_${filenameDateTime}_${running_number}_REQ
     ${Filename_Res_blackmule}=     set variable     CFR_RegistryBlackMule_${filenameDateTime}_${running_number}_RES
    ELSE IF  '${condition}' == 'invali_file_name_runing_2dig'
     get current datetime
     Set Test Variable    ${testcase}    ${running_number}
     get current datetime
     Query check test case today     
     ${filenameDateTime}=    random_number_warrant   6
     ${running_number_2dig}=    random_number_warrant   2
     ${FileName}=     set variable     CFR_RegistryBlackMule_${filenameDateTime}_${running_number_2dig}
     ${directory}=     set variable     CFR_RegistryBlackMule_${filenameDateTime}_${running_number_2dig}_REQ
     ${Filename_Res_blackmule}=     set variable     CFR_RegistryBlackMule_${filenameDateTime}_${running_number_2dig}_RES
    ${running_number} =  BuiltIn.Evaluate  str(int("${running_number}") + 1).zfill(3)
    Set Suite Variable    ${running_number}
    ELSE IF  '${condition}' == 'invali_file_name_runing_2dig_not_running_number'
     get current datetime
     ${filenameDateTime}=    random_number_warrant   6
     ${running_number_2dig}=    random_number_warrant   2
     ${FileName}=     set variable     CFR_RegistryBlackMule_${filenameDateTime}_${running_number_2dig}
     ${directory}=     set variable     CFR_RegistryBlackMule_${filenameDateTime}_${running_number_2dig}_REQ
     ${Filename_Res_blackmule}=     set variable     CFR_RegistryBlackMule_${filenameDateTime}_${running_number_2dig}_RES
    ELSE IF  '${condition}' == 'invali_file_name_datetime_file'
    get current datetime
    log    ${running_number}
    Set Test Variable    ${testcase}    ${running_number}
    get current datetime
    Query check test case today
     ${running_number}=    random_number_warrant   3
     ${FileName}=     set variable     CFR_RegistryBlackMule_25680332_${running_number}
     ${directory}=     set variable     CFR_RegistryBlackMule_25680332_${running_number}_REQ
     ${Filename_Res_blackmule}=     set variable     CFR_RegistryBlackMule_25680332_${running_number}_RES
    ELSE IF  '${condition}' == 'invali_file_name_datetime_file_not_running_number'
     get current datetime
     ${running_number}=    random_number_warrant   3
     ${FileName}=     set variable     CFR_RegistryBlackMule_25680332_${running_number}
     ${directory}=     set variable     CFR_RegistryBlackMule_25680332_${running_number}_REQ
     ${Filename_Res_blackmule}=     set variable     CFR_RegistryBlackMule_25680332_${running_number}_RES
    ELSE IF  '${condition}' == 'invali_file_name_req_to_res'
     get current datetime
    Set Test Variable    ${testcase}    ${running_number}
    get current datetime
    Query check test case today
     ${FileName}=     set variable     CFR_RegistryBlackMule_25680332_${running_number}
     ${directory}=     set variable     CFR_RegistryBlackMule_25680332_${running_number}_RES
     ${Filename_Res_blackmule}=     set variable     CFR_RegistryBlackMule_25680332_${running_number}_RES
     ${running_number} =  BuiltIn.Evaluate  str(int("${running_number}") + 1).zfill(3)
     Set Suite Variable    ${running_number}
    ELSE IF  '${condition}' == 'invali_file_name_req_to_res_not_running_number'
     get current datetime
     ${running_number}=    random_number_warrant   3
     ${FileName}=     set variable     CFR_RegistryBlackMule_25680332_${running_number}
     ${directory}=     set variable     CFR_RegistryBlackMule_25680332_${running_number}_RES
     ${Filename_Res_blackmule}=     set variable     CFR_RegistryBlackMule_25680332_${running_number}_RES
    ELSE IF  '${condition}' == 'invali_file_name_date_on_future'
     get current datetime
     Set Test Variable    ${testcase}    ${running_number}
     get current datetime
     Query check test case today
     ${FileName}=     set variable     CFR_RegistryBlackMule_${filenameDateTime_day_future}_${running_number}
     ${directory}=     set variable     CFR_RegistryBlackMule_${filenameDateTime_day_future}_${running_number}_REQ
     ${Filename_Res_blackmule}=     set variable     CFR_RegistryBlackMule_${filenameDateTime_day_future}_${running_number}_RES
     ${running_number} =  BuiltIn.Evaluate  str(int("${running_number}") + 1).zfill(3)
     Set Suite Variable    ${running_number}
    ELSE IF  '${condition}' == 'invali_file_name_date_on_future_not_running_number'
     get current datetime
     ${running_number}=    random_number_warrant   3
     ${FileName}=     set variable     CFR_RegistryBlackMule_${filenameDateTime_day_future}_${running_number}
     ${directory}=     set variable     CFR_RegistryBlackMule_${filenameDateTime_day_future}_${running_number}_REQ
     ${Filename_Res_blackmule}=     set variable     CFR_RegistryBlackMule_${filenameDateTime_day_future}_${running_number}_RES
    ELSE IF  '${condition}' == 'invali_file_name_date_on_year_eng'
     get current datetime
     Set Test Variable    ${testcase}    ${running_number}
     get current datetime
     Query check test case today
     ${FileName}=     set variable     CFR_RegistryBlackMule_${filenameDateTime_eng}_${running_number}
     ${directory}=     set variable     CFR_RegistryBlackMule_${filenameDateTime_eng}_${running_number}_REQ
     ${Filename_Res_blackmule}=     set variable     CFR_RegistryBlackMule_${filenameDateTime_eng}_${running_number}_RES
    ELSE IF  '${condition}' == 'invali_file_name_date_on_year_eng_not_running_number'
     get current datetime
     ${running_number}=    random_number_warrant   3
     ${FileName}=     set variable     CFR_RegistryBlackMule_${filenameDateTime_eng}_${running_number}
     ${directory}=     set variable     CFR_RegistryBlackMule_${filenameDateTime_eng}_${running_number}_REQ
     ${Filename_Res_blackmule}=     set variable     CFR_RegistryBlackMule_${filenameDateTime_eng}_${running_number}_RES
    ELSE
        log    done not match 
    END
     set test variable        ${directory}
     set test variable      ${Filename_Req_blackmule}      ${directory}
     set test variable      ${Filename_Res_blackmule}
     set test variable      ${FileName}

Create black mule file ${csv}
     ${REQ_data_list_to_check}   create list
      ${list}=   create list   case_id|case_date|case_type|accountno|accounttype|bankcode|bankname|entity_type|id_type|card_id|ref_code|title|name|midname|surname|eng_name|eng_midname|eng_surname|birth_date|nationality|note|other|rank|pol_name|pol_surname|pol_job_title|pol_org|pol_tel|aml_report_date
      ${data}=   create list  ${list}
      create file    ${CURDIR}/Data/${directory}.${csv}
      Append To Csv File     ${CURDIR}/Data/${directory}.${csv}    ${data}
      Append To List     ${REQ_data_list_to_check}     ${list} 
      set test variable    ${REQ_data_list_to_check}
Create withdraw black mule file ${csv}
      create file    ${CURDIR}/Data/${directory}.${csv}
      Append To Csv File     ${CURDIR}/Data/${directory}.${csv}    ${REQ_data_list_to_check}
    #   Append To List     ${REQ_data_list_to_check}     ${list} 
    #   set test variable    ${REQ_data_list_to_check}
Create black mule file ${csv} invalid header line delimiter character is ${cha}
     ${REQ_data_list_to_check}   create list
      ${list}=   create list   case_id${cha}case_date${cha}case_type${cha}accountno${cha}accounttype${cha}bankcode${cha}bankname${cha}entity_type${cha}id_type${cha}card_id${cha}ref_code${cha}title${cha}name${cha}midname${cha}surname${cha}eng_name${cha}eng_midname${cha}eng_surname${cha}birth_date${cha}nationality${cha}note${cha}other${cha}rank${cha}pol_name${cha}pol_surname${cha}pol_job_title${cha}pol_org${cha}pol_tel${cha}aml_report_date
      ${data}=   create list  ${list}
      create file    ${CURDIR}/Data/${directory}.${csv}
      Append To Csv File     ${CURDIR}/Data/${directory}.${csv}    ${data}
      Append To List     ${REQ_data_list_to_check}     ${list} 
      set test variable    ${REQ_data_list_to_check}
Create black mule file csv for validate Header is ${h_case_id}
     ${REQ_data_list_to_check}   create list
      ${list}=   create list   ${h_case_id}|case_date|case_type|accountno|accounttype|bankcode|bankname|entity_type|id_type|card_id|ref_code|title|name|midname|surname|eng_name|eng_midname|eng_surname|birth_date|nationality|note|other|rank|pol_name|pol_surname|pol_job_title|pol_org|pol_tel|aml_report_date
      ${data}=   create list  ${list}
      create file    ${CURDIR}/Data/${directory}.csv
      Append To Csv File     ${CURDIR}/Data/${directory}.csv    ${data}
      Append To List     ${REQ_data_list_to_check}     ${list} 
      set test variable    ${REQ_data_list_to_check}
Create black mule file csv for validate Header is EMPTY
     ${REQ_data_list_to_check}   create list
      ${list}=   create list   |||||||||||||||||||||||||||
      ${data}=   create list  ${list}
      create file    ${CURDIR}/Data/${directory}.csv
      Append To Csv File     ${CURDIR}/Data/${directory}.csv    ${data}
      Append To List     ${REQ_data_list_to_check}     ${list} 
      set test variable    ${REQ_data_list_to_check}
Create black mule file csv for validate Header is done not header
     ${REQ_data_list_to_check}   create list
      ${list}=   create list   ${EMPTY}
      ${data}=   create list  ${list}
      create file    ${CURDIR}/Data/${directory}.csv
      Append To Csv File     ${CURDIR}/Data/${directory}.csv    ${data}
      Append To List     ${REQ_data_list_to_check}     ${list} 
      set test variable    ${REQ_data_list_to_check}
Create black mule file csv for validate Header case_id
     ${REQ_data_list_to_check}   create list
      ${list}=   create list   case_id
      ${data}=   create list  ${list}
      create file    ${CURDIR}/Data/${directory}.csv
      Append To Csv File     ${CURDIR}/Data/${directory}.csv    ${data}
      Append To List     ${REQ_data_list_to_check}     ${list} 
      set test variable    ${REQ_data_list_to_check}
random genarate data black mule
    ${random_personalID}    generate_thai_citizen_id
    ${random_case_id}    random_number_warrant    10
    ${random_banknumber}    random_number_warrant    10
    ${random_refcode}    random_number_warrant    8
    ${random_name}    Evaluate    random.choice(${NAMES})
    ${random_last_name}    Evaluate    random.choice(${LASTNAME})
    ${random_name_eng}    Evaluate    random.choice(${NAMES_ENG})
    ${random_last_name_eng}    Evaluate    random.choice(${LASTNAME_ENG})
    set test variable  ${case_id}          ${random_case_id}
    set test variable  ${case_date}        ${Date_Eng}
    set test variable  ${case_type}        3
    set test variable  ${accountno}        ${random_banknumber}
    set test variable  ${accounttype}      bank
    set test variable  ${bankcode}         002
    set test variable  ${bankname}         GHB
    set test variable  ${entity_type}      PERSON
    set test variable  ${id_type}          National ID
    set test variable  ${card_id}          ${random_personalID}
    set test variable  ${ref_code}         VW${random_refcode}
    set test variable  ${title}            นาย
    set test variable  ${name}             ${random_name}
    set test variable  ${midname}          ${empty}
    set test variable  ${surname}          ${random_last_name}
    set test variable  ${eng_name}         ${empty}
    set test variable  ${eng_midname}      ${empty}
    set test variable  ${eng_surname}      ${empty}
    set test variable  ${birth_date}       2002-10-21
    set test variable  ${nationality}      TH
    set test variable  ${note}             Important case
    set test variable  ${other}            119/99
    set test variable  ${rank}             ร.ต.อ.
    set test variable  ${pol_name}         สมชัย
    set test variable  ${pol_surname}      แสนใจดี
    set test variable  ${pol_job_title}    รอง. สว.(สอบสวน)
    set test variable  ${pol_org}          สภ.กระทุ่มแบน บก.จ.สมุทรสาคร ภ.7
    set test variable  ${pol_tel}          878889999
    set test variable  ${aml_report_date}  2025-03-31
random genarate data black mule all filed
    ${random_personalID} =    generate_thai_citizen_id
    ${random_case_id}    random_number_warrant    10
    ${random_banknumber}    random_number_warrant    10
    ${random_refcode}    random_number_warrant    8
    ${random_name}    Evaluate    random.choice(${NAMES})
    ${random_last_name}    Evaluate    random.choice(${LASTNAME})
    ${random_name_eng}    Evaluate    random.choice(${NAMES_ENG})
    ${random_last_name_eng}    Evaluate    random.choice(${LASTNAME_ENG})
    set test variable  ${case_id}          ${random_case_id}
    set test variable  ${case_date}        ${Date_Eng}
    set test variable  ${case_type}        3
    set test variable  ${accountno}        ${random_banknumber}
    set test variable  ${accounttype}      bank
    set test variable  ${bankcode}         004
    set test variable  ${bankname}         KBNK
    set test variable  ${entity_type}      PERSON
    set test variable  ${id_type}          National ID
    set test variable  ${card_id}          ${random_personalID}
    set test variable  ${ref_code}         VW${random_refcode}
    set test variable  ${title}            นาย
    set test variable  ${name}             ${random_name}
    set test variable  ${midname}          ลา
    set test variable  ${surname}          ${random_last_name}
    set test variable  ${eng_name}         ${random_name_eng}
    set test variable  ${eng_midname}      mid
    set test variable  ${eng_surname}      ${random_last_name_eng}
    set test variable  ${birth_date}       2002-10-21
    set test variable  ${nationality}      TH
    set test variable  ${note}             Important case
    set test variable  ${other}            119/99
    set test variable  ${rank}             ร.ต.อ.
    set test variable  ${pol_name}         สมชัย
    set test variable  ${pol_surname}      แสนใจดี
    set test variable  ${pol_job_title}    รอง. สว.(สอบสวน)
    set test variable  ${pol_org}          สภ.กระทุ่มแบน บก.จ.สมุทรสาคร ภ.7
    set test variable  ${pol_tel}          878889999
    set test variable  ${aml_report_date}  2025-03-31
Genarate black mule random ${condition}
    IF  '${condition}' == 'data'
    random genarate data black mule
    ELSE IF  '${condition}' == 'eng'
    random genarate data black mule all filed
    ${random_personalID_eng}    random_number_warrant    22
    ${random_refcode}    random_number_warrant    8
    Run Keyword If  ${index} == 0  Set Test Variable  ${card_id}  6294XXA333WQF${random_personalID_eng}
    Run Keyword If  ${index} == 0  Set Test Variable  ${ref_code}  TS${random_refcode}
    Run Keyword If  ${index} == 0  Set Test Variable  ${midname}  ${empty}
    Run Keyword If  ${index} == 0  Set Test Variable  ${eng_name}  ${empty}
    Run Keyword If  ${index} == 0  Set Test Variable  ${eng_midname}  ${empty}
    Run Keyword If  ${index} == 0  Set Test Variable  ${eng_surname}  ${empty}
    Run Keyword If  ${index} == 0  Set Test Variable  ${birth_date}  ${empty}
    Run Keyword If  ${index} == 0  Set Test Variable  ${nationality}  ${empty}
    Run Keyword If  ${index} == 0  Set Test Variable  ${note}  ${empty}
    Run Keyword If  ${index} == 0  Set Test Variable  ${rank}  ${empty}
    Run Keyword If  ${index} == 0  Set Test Variable  ${pol_name}  ${empty}
    Run Keyword If  ${index} == 0  Set Test Variable  ${pol_surname}  ${empty}
    Run Keyword If  ${index} == 0  Set Test Variable  ${pol_job_title}  ${empty}
    Run Keyword If  ${index} == 0  Set Test Variable  ${pol_org}  ${empty}
    Run Keyword If  ${index} == 0  Set Test Variable  ${other}  ${empty}
    Run Keyword If  ${index} == 0  Set Test Variable  ${pol_tel}  ${empty}
    ELSE IF  '${condition}' == 'all_filed'
    random genarate data black mule all filed
    ELSE IF  '${condition}' == 'invalid_case_id'
    random genarate data black mule
    Run Keyword If  ${index} == 0  Set Test Variable  ${case_id}  2=/25666547362<>@#104
    ELSE IF  '${condition}' == 'invalid_case_id_35digi'
    random genarate data black mule
    ${id_card}    generate_digit_citizen_id    34
    Run Keyword If  ${index} == 0  Set Test Variable  ${case_id}  ${id_card}à
    Run Keyword If  ${index} == 0  Set Test Variable  ${nationality}  ${empty}
    ELSE IF  '${condition}' == 'invalid_case_date'
    random genarate data black mule
    Run Keyword If  ${index} == 2  Set Test Variable  ${case_date}  ${Date_Eng_fix1}
    Run Keyword If  ${index} == 3  Set Test Variable  ${case_date}  ${Date_Eng_fix2}
    Run Keyword If  ${index} == 4  Set Test Variable  ${case_date}  ${Date_Eng_fix3}
    ELSE IF  '${condition}' == 'invalid_accountno'
    random genarate data black mule
    Run Keyword If  ${index} == 1  Set Test Variable  ${accountno}   testsys1111
    ELSE IF  '${condition}' == 'invalid_accounttype'
    random genarate data black mule
    Run Keyword If  ${index} == 2  Set Test Variable  ${accounttype}    Promเพย์
    ELSE IF  '${condition}' == 'Maxinum'
    random genarate data black mule
    Run Keyword If  ${index} == 0  Set Test Variable  ${case_id}    TS001-002-00000000000000000041
    Run Keyword If  ${index} == 1  Set Test Variable  ${accountno}    0742823819230812978237871827323221
    Run Keyword If  ${index} == 2  Set Test Variable  ${card_id}    5FWQ8061D223124CS23312YXASCCQW51CD8
    Run Keyword If  ${index} == 3  Set Test Variable  ${title}    นนนนนนนนนนนนนนนนนนนนนนนนนนนนนนนนนนนนนนนนนนนนนนนนนน
    Run Keyword If  ${index} == 4  Set Test Variable  ${name}    กกกกกกกกกกกกกกกกกกกกกกกกกกกกกกกกกกกกกกกกกกกกกกกกกกกกกกกกกกกกกกกกกกกกกกกกกกกกกกกกกกกกกกกกกกกกกกกกกกกก
    Run Keyword If  ${index} == 5  Set Test Variable  ${midname}    ขขขขขขขขขขขขขขขขขขขขขขขขขขขขขขขขขขขขขขขขขขขขขขขขขขขขขขขขขขขขขขขขขขขขขขขขขขขขขขขขขขขขขขขขขขขขขขขขขขขข
    Run Keyword If  ${index} == 6  Set Test Variable  ${surname}    คคคคคคคคคคคคคคคคคคคคคคคคคคคคคคคคคคคคคคคคคคคคคคคคคคคคคคคคคคคคคคคคคคคคคคคคคคคคคคคคคคคคคคคคคคคคคคคคคคคค
    Run Keyword If  ${index} == 7  Set Test Variable  ${eng_name}    AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
    Run Keyword If  ${index} == 8  Set Test Variable  ${eng_midname}    BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB
    Run Keyword If  ${index} == 9  Set Test Variable  ${eng_surname}    CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC
    Run Keyword If  ${index} == 10  Set Test Variable  ${note}    WSDAWDASCAWVASXAFASDALJFLKASDKAWJASLDASJDLKAWJDLIAJSLKDJAWILJFALSKMDLKAJSWSDAWDASCAWVASXAFASDALJFLKASDKAWJASLDASJDLKAWJDLIAJSLKDJAWILJFALSKMDLKAJSWSDAWDASCAWVASXAFASDALJFLKASDKAWJASLDASJDLKAWJDLIAJSLKDJAWILJFALSKMDLKAJSWSDAWDASCAWVASXAFASDALJFLKASDKAWJASLDASJDLKAWJDLIAJSLKDJAWILJFALSKMDLKAJSWSDAWDASCAWVASXAFASDALJFLKASDKAWJASLDASJDLKAWJDLIAJSLKDJAWILJFALSKMDLKAJSWSDAWDASCAWVASXAFASDALJFLKASDKAWJASLDASJDLKAWJDLIAJSLKDJAWILJFALSKMDLKAJSWSDAWDASCAWVASXAFASDALJFLKASDKAWJASLDASJDLKAWJDLIAJSLKDJAWILJFALSKMDLKAJSWSDAWDASCAWVASXAFASDALJFLKASDKAWJASLDASJDLKAWJDLIAJSLKDJAWILJFALSKMDLKAJSWSDAWDASCAWVASXAFASDALJFLKASDKAWJASLDASJDLKAWJDLIAJSLKDJAWILJFALSKMDLKAJSWSDAWDASCAWVASXAFASDALJFLKASDKAWJASLDASJDLKAWJDLIAJSLKDJAWILJFALSKMDLKAJSWSDAWDASCAWVASXAFASDALJFLKASDKAWJASLDASJDLKAWJDLIAJSLKDJAWILJFALSKMDLKAJSWSDAWDASCAWVASXAFASDALJFLKASDKAWJASLDASJDLKAWJDLIAJSLKDJAWILJFALSKMDLKAJSWSDAWDASCAWVASXAFASDALJFLKASDKAWJASLDASJDLKAWJDLIAJSLKDJAWILJFALSKMDLKAJSWSDAWDASCAWVASXAFASDALJFLKASDKAWJASLDASJDLKAWJDLIAJ
    Run Keyword If  ${index} == 11  Set Test Variable  ${other}    AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAABBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB
    Run Keyword If  ${index} == 12  Set Test Variable  ${rank}    ร.ต.อ.ร.ต.อ.ร.ต.อ.ร.ต.อ.ร.ต.อ.ร.ต.อ.ร.ต.อ.ร.ต.อ.ร.
    Run Keyword If  ${index} == 13  Set Test Variable  ${pol_name}    สมชายสมชายสมชายสมชายสมชายสมชายสมชายสมชายสมชายสมชายสมชายสมชายสมชายสมชายสมชายสมชายสมชายสมชายสมชายสมชาย
    Run Keyword If  ${index} == 14  Set Test Variable  ${pol_surname}    แสนใจแสนใจแสนใจแสนใจแสนใจแสนใจแสนใจแสนใจแสนใจแสนใจแสนใจแสนใจแสนใจแสนใจแสนใจแสนใจแสนใจแสนใจแสนใจแสนใจ
    Run Keyword If  ${index} == 15  Set Test Variable  ${pol_org}    สภ.กระทุ่มแบน บก.จ.สมุทรสาคร ภ.7สภ.กระทุ่มแบน บก.จ.สมุทรสาคร ภ.7สภ.กระทุ่มแบน บก.จ.สมุทรสาคร ภ.7สภ.กระทุ่มแบน บก.จ.สมุทรสาคร ภ.7สภ.กระทุ่มแบน บก.จ.สมุทรสาคร ภ.7สภ.กระทุ่มแบน บก.จ.สมุทรสาคร ภ.7สภ.กระทุ
    Run Keyword If  ${index} == 16  Set Test Variable  ${pol_tel}    12345678910111213141
    ELSE IF  '${condition}' == 'invalid_card_id'
    random genarate data black mule
    Run Keyword If  ${index} == 1  Set Test Variable  ${card_id}    1230006781111
    ELSE IF  '${condition}' == 'invalid_ref_code'
    random genarate data black mule
    Run Keyword If  ${index} == 1  Set Test Variable  ${ref_code}    123%!@678ăƅčɗ
    ELSE IF  '${condition}' == 'invalid_title'
    random genarate data black mule
    Run Keyword If  ${index} == 1  Set Test Variable  ${title}    12345%!@678ăƅčɗ
    ELSE IF  '${condition}' == 'invalid_name'
    random genarate data black mule
    Run Keyword If  ${index} == 1  Set Test Variable  ${name}    12345%!@678ăƅčɗ
    ELSE IF  '${condition}' == 'invalid_midname'
    random genarate data black mule
    Run Keyword If  ${index} == 1  Set Test Variable  ${midname}    12345%!@678ăƅčɗ
    ELSE IF  '${condition}' == 'invalid_surname'
    random genarate data black mule
    Run Keyword If  ${index} == 1  Set Test Variable  ${surname}    12345%!@678ăƅčɗ
    ELSE IF  '${condition}' == 'invalid_eng_name'
    random genarate data black mule
    Run Keyword If  ${index} == 1  Set Test Variable  ${eng_name}    12345%!@678ăƅčɗ
    ELSE IF  '${condition}' == 'invalid_eng_midname'
    random genarate data black mule
    Run Keyword If  ${index} == 1  Set Test Variable  ${eng_midname}    12345%!@678ăƅčɗ
    ELSE IF  '${condition}' == 'invalid_eng_surname'
    random genarate data black mule
    Run Keyword If  ${index} == 1  Set Test Variable  ${eng_surname}    12345%!@678ăƅčɗ
    ELSE IF  '${condition}' == 'invalid_birth_date'
    random genarate data black mule
    Run Keyword If  ${index} == 1  Set Test Variable  ${birth_date}     1996/04/02
    ELSE IF  '${condition}' == 'invalid_nationality'
    random genarate data black mule
    Run Keyword If  ${index} == 1  Set Test Variable  ${nationality}     th
    ELSE IF  '${condition}' == 'invalid_note'
    random genarate data black mule
    Run Keyword If  ${index} == 1  Set Test Variable  ${note}     12345%!@678ăƅčɗ
    ELSE IF  '${condition}' == 'input data note AUTO'
    random genarate data black mule
    Run Keyword If  ${index} == ${index}  Set Test Variable  ${note}     AUTODATA
    ELSE IF  '${condition}' == 'input data note AUTO Company'
    random genarate data black mule
    ${id_card_35}    generate_digit_citizen_id    18
    Run Keyword If  ${index} == ${index}  Set Test Variable  ${card_id}     ${id_card_35}
    Run Keyword If  ${index} == ${index}  Set Test Variable  ${note}     AUTODATACompany
    Run Keyword If  ${index} == ${index}  Set Test Variable  ${entity_type}     ENTITY
    Run Keyword If  ${index} == ${index}  Set Test Variable  ${id_type}     COMPANY ID
    Run Keyword If  ${index} == ${index}  Set Test Variable  ${nationality}     TH
    Run Keyword If  ${index} == ${index}  Set Test Variable  ${surname}     ${EMPTY}
    ELSE IF  '${condition}' == 'input data note AUTO and report date for 1957-01-25'
    random genarate data black mule
    Run Keyword If  ${index} == ${index}  Set Test Variable  ${note}     AUTODATADATE1957
    Run Keyword If  ${index} == ${index}  Set Test Variable  ${aml_report_date}     1957-01-25
    ELSE IF  '${condition}' == 'input data personalID 35 charator'
    random genarate data black mule
    ${id_card_35}    generate_digit_citizen_id    35
    Run Keyword If  ${index} == ${index}  Set Test Variable  ${note}     AUTODATA35
    Run Keyword If  ${index} == ${index}  Set Test Variable  ${card_id}     ${id_card_35}
    Run Keyword If  ${index} == ${index}  Set Test Variable  ${nationality}       GB
    ELSE IF  '${condition}' == 'input data personalID 20 charator'
    random genarate data black mule
    ${id_card_35}    generate_digit_citizen_id    20
    Run Keyword If  ${index} == ${index}  Set Test Variable  ${note}     AUTODATA20
    Run Keyword If  ${index} == ${index}  Set Test Variable  ${card_id}     ${id_card_35}
    Run Keyword If  ${index} == ${index}  Set Test Variable  ${nationality}       GB
    ELSE IF  '${condition}' == 'input data personalID 25 charator'
    random genarate data black mule
    ${id_card_35}    generate_digit_citizen_id    25
    Run Keyword If  ${index} == ${index}  Set Test Variable  ${note}     AUTODATA25
    Run Keyword If  ${index} == ${index}  Set Test Variable  ${card_id}     ${id_card_35}
    Run Keyword If  ${index} == ${index}  Set Test Variable  ${nationality}       GB    
    ELSE IF  '${condition}' == 'input data personalID 18 charator'
    random genarate data black mule
    ${id_card_35}    generate_digit_citizen_id    18
    Run Keyword If  ${index} == ${index}  Set Test Variable  ${note}     AUTODATA18
    Run Keyword If  ${index} == ${index}  Set Test Variable  ${card_id}     ${id_card_35}
    Run Keyword If  ${index} == ${index}  Set Test Variable  ${nationality}       GB    
    ELSE IF  '${condition}' == 'invalid_other'
    random genarate data black mule
    Run Keyword If  ${index} == 1  Set Test Variable  ${other}     12345%!@678ăƅčɗ
    ELSE IF  '${condition}' == 'invalid_rank'
    random genarate data black mule
    Run Keyword If  ${index} == 1  Set Test Variable  ${rank}     12345%!@678ăƅčɗ
    ELSE IF  '${condition}' == 'invalid_pol_name'
    random genarate data black mule
    Run Keyword If  ${index} == 1  Set Test Variable  ${pol_name}     12345%!@678ăƅčɗ
    ELSE IF  '${condition}' == 'invalid_pol_surname'
    random genarate data black mule
    Run Keyword If  ${index} == 1  Set Test Variable  ${pol_surname}     12345%!@678ăƅčɗ
    ELSE IF  '${condition}' == 'invalid_pol_job_title'
    random genarate data black mule
    Run Keyword If  ${index} == 1  Set Test Variable  ${pol_job_title}     12345%!@678ăƅčɗ
    ELSE IF  '${condition}' == 'invalid_pol_org'
    random genarate data black mule
    Run Keyword If  ${index} == 1  Set Test Variable  ${pol_org}     สภ.กระทุ่มแบน บก.จ.สมุทรสาคร ภ.712345%!@678ăƅčɗ
    ELSE IF  '${condition}' == 'invalid_pol_tel'
    random genarate data black mule
    Run Keyword If  ${index} == 1  Set Test Variable  ${pol_tel}      09@#1029842
    ELSE IF  '${condition}' == 'invalid_aml_report_date'
    random genarate data black mule
    Run Keyword If  ${index} == 1  Set Test Variable  ${aml_report_date}       2025/03/01
    ELSE IF  '${condition}' == 'invalid_length_case_id'
    random genarate data black mule
    Run Keyword If  ${index} == 1  Set Test Variable  ${case_id}       23/2566-654736224/2566\65473632222
    ELSE IF  '${condition}' == 'invalid_length_case_date'
    random genarate data black mule
    Run Keyword If  ${index} == 1  Set Test Variable  ${case_date}       2025-01-155
    ELSE IF  '${condition}' == 'invalid_length_case_type'
    random genarate data black mule
    Run Keyword If  ${index} == 1  Set Test Variable  ${case_type}       284
    ELSE IF  '${condition}' == 'invalid_length_accountno'
    random genarate data black mule
    Run Keyword If  ${index} == 1  Set Test Variable  ${accountno}       11038005571103800558110380055911035
    ELSE IF  '${condition}' == 'invalid_length_accounttype'
    random genarate data black mule
    Run Keyword If  ${index} == 1  Set Test Variable  ${accounttype}       BankPromptPayWalletiD
    ELSE IF  '${condition}' == 'invalid_length_bankcode'
    random genarate data black mule
    Run Keyword If  ${index} == 1  Set Test Variable  ${bankcode}       0144
    ELSE IF  '${condition}' == 'invalid_length_bankname'
    random genarate data black mule
    Run Keyword If  ${index} == 1  Set Test Variable  ${bankname}       SCBSCBSCBSC
    ELSE IF  '${condition}' == 'invalid_length_entity_type'
    random genarate data black mule
    Run Keyword If  ${index} == 1  Set Test Variable  ${entity_type}       PERSONNNNNQ
    ELSE IF  '${condition}' == 'invalid_length_id_type'
    random genarate data black mule
    Run Keyword If  ${index} == 1  Set Test Variable  ${id_type}       National IDDNatT
    ELSE IF  '${condition}' == 'invalid_length_card_id'
    random genarate data black mule
    Run Keyword If  ${index} == 1  Set Test Variable  ${card_id}       442123716653400000000348342428284848
    ELSE IF  '${condition}' == 'invalid_length_ref_code'
    random genarate data black mule
    Run Keyword If  ${index} == 1  Set Test Variable  ${ref_code}       AB123456556
    ELSE IF  '${condition}' == 'invalid_length_title'
    random genarate data black mule
    Run Keyword If  ${index} == 1  Set Test Variable  ${title}       นาย นางสาว นาง ว่าที่ร้อยตรีนาย นางสาว นาง ว่าที่รต
    ELSE IF  '${condition}' == 'invalid_length_name'
    random genarate data black mule
    Run Keyword If  ${index} == 1  Set Test Variable  ${name}       บริวัตรบริวัตรบริวัตรบริวัตรบริวัตรบริวัตรบริวัตรบริวัตรบริวัตรบริวัตรบริวัตรบริวัตรบริวัตรบริวัตรบรน
    ELSE IF  '${condition}' == 'invalid_length_midname'
    random genarate data black mule
    Run Keyword If  ${index} == 1  Set Test Variable  ${midname}       ภณภณภณภณภณภณภณภณภณภณภณภณภณภณภณภณภณภณภณภณภณภณภณภณภณภณภณภณภณภณภณภณภณภณภณภณภณภณภณภณภณภณภณภณภณภณภณภณภณภณภ
    ELSE IF  '${condition}' == 'invalid_length_surname'
    random genarate data black mule
    Run Keyword If  ${index} == 1  Set Test Variable  ${surname}       ก้องเกษมทรัพย์ก้องเกษมทรัพย์ก้องเกษมทรัพย์ก้องเกษมทรัพย์ก้องเกษมทรัพย์ก้องเกษมทรัพย์ก้องเกษมทรัพย์ก้พ
    ELSE IF  '${condition}' == 'invalid_length_eng_name'
    random genarate data black mule
    Run Keyword If  ${index} == 1  Set Test Variable  ${eng_name}       BoriwanBoriwanBoriwanBoriwanBoriwanBoriwanBoriwanBoriwanBoriwanBoriwanBoriwanBoriwanBoriwanBoriwanBoW
    ELSE IF  '${condition}' == 'invalid_length_eng_midname'
    random genarate data black mule
    Run Keyword If  ${index} == 1  Set Test Variable  ${eng_midname}       PondPondPondPondPondPondPondPondPondPondPondPondPondPondPondPondPondPondPondPondPondPondPondPondPondD
    ELSE IF  '${condition}' == 'invalid_length_eng_surname'
    random genarate data black mule
    Run Keyword If  ${index} == 1  Set Test Variable  ${eng_surname}       GongkasemsabGongkasemsabGongkasemsabGongkasemsabGongkasemsabGongkasemsabGongkasemsabGongkasemsabGongG
    ELSE IF  '${condition}' == 'invalid_length_birth_date'
    random genarate data black mule
    Run Keyword If  ${index} == 1  Set Test Variable  ${birth_date}       1996-22-011
    ELSE IF  '${condition}' == 'invalid_length_nationality'
    random genarate data black mule
    Run Keyword If  ${index} == 1  Set Test Variable  ${nationality}       THH
    ELSE IF  '${condition}' == 'invalid_length_note'
    random genarate data black mule
    Run Keyword If  ${index} == 1  Set Test Variable  ${note}       Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search forrt
    ELSE IF  '${condition}' == 'invalid_length_other'
    random genarate data black mule
    Run Keyword If  ${index} == 1  Set Test Variable  ${other}        รับเลขคดี,ชั้นอัยการรับเลขคดี,ชั้นอัยการรับเลขคดี,ชั้นอัยการรับเลขคดี,ชั้นอัยการรับเลขคดี,ชั้นอัยการรับเลขคดี,ชั้นอัยการรับเลขคดี,ชั้นอัยการรับเลขคดี,ชั้นอัยการรับเลขคดี,ชั้นอัยการรับเลขคดี,ชั้นอัยการฟ
    ELSE IF  '${condition}' == 'invalid_length_rank'
    random genarate data black mule
    Run Keyword If  ${index} == 1  Set Test Variable  ${rank}        พล.ต.อ. พล.ต.ท. พล.ต.ต. พ.ต.อ. พ.ต.ท. พ.ต.ต. ร.ต.ออ
    ELSE IF  '${condition}' == 'invalid_length_pol_name'
    random genarate data black mule
    Run Keyword If  ${index} == 1  Set Test Variable  ${pol_name}        ธนเสฏฐ์ธนเสฏฐ์ธนเสฏฐ์ธนเสฏฐ์ธนเสฏฐ์ธนเสฏฐ์ธนเสฏฐ์ธนเสฏฐ์ธนเสฏฐ์ธนเสฏฐ์ธนเสฏฐ์ธนเสฏฐ์ธนเสฏฐ์ธนเสฏฐ์ธนป
    ELSE IF  '${condition}' == 'invalid_length_pol_surname'
    random genarate data black mule
    Run Keyword If  ${index} == 1  Set Test Variable  ${pol_surname}        พัฒน์ธนโกศลพัฒน์ธนโกศลพัฒน์ธนโกศลพัฒน์ธนโกศลพัฒน์ธนโกศลพัฒน์ธนโกศลพัฒน์ธนโกศลพัฒน์ธนโกศลพัฒน์ธนโกศลพด
    ELSE IF  '${condition}' == 'invalid_length_pol_job_title'
    random genarate data black mule
    Run Keyword If  ${index} == 1  Set Test Variable  ${pol_job_title}        รอง. สว.(สอบสวน) รอง. สว.(สอบสวน)รอง. สว.(สอบสวน)รอง. สว.(สอบสวน)รอง. สว.(สอบสวน)รอง. สว.(สอบสวน)รองก
    ELSE IF  '${condition}' == 'invalid_length_pol_org'
    random genarate data black mule
    Run Keyword If  ${index} == 1  Set Test Variable  ${pol_org}        สภ.กระทุ่มแบน บก.จ.สมุทรสาคร ภ.7nsdoajdoajdadjaodjqdjqodjwqo่ก่ดนห่ดนห่กนรไ่กนรฟ่กๆนก่ๆรีก้ไๆไร่กนรไก่ไนรก่รไกไไี้ไรก่ไรก่ไรกไรีดรไหด่ไนก่ๆๆจตำรำกจพรได่ได่ไร่่นห่กไน่กไกไรก้ไรก่ไรดไไรี่ดนๆไ่ดๆวไสดน่ไดไ
    ELSE IF  '${condition}' == 'invalid_length_pol_tel'
    random genarate data black mule
    Run Keyword If  ${index} == 1  Set Test Variable  ${pol_tel}        0903241736-0903241735
    ELSE IF  '${condition}' == 'invalid_length_aml_report_date'
    random genarate data black mule
    Run Keyword If  ${index} == 1  Set Test Variable  ${aml_report_date}        2025-03-011
    ELSE IF  '${condition}' == 'invalid_length_card_id_low'
    random genarate data black mule
    ${id_low}    generate_digit_citizen_id    10
    Run Keyword If  ${index} == 1  Set Test Variable  ${card_id}       ${id_low}
    ELSE IF  '${condition}' == 'invalid_length_card_id_more'
    random genarate data black mule
    ${id_low}    generate_digit_citizen_id    15
    Run Keyword If  ${index} == 1  Set Test Variable  ${card_id}       ${id_low}
    ELSE IF  '${condition}' == 'invalid_length_12dig_1str'
    random genarate data black mule
    ${id_low}    generate_digit_citizen_id    12
    Run Keyword If  ${index} == 1  Set Test Variable  ${card_id}       ${id_low}A
    ELSE IF  '${condition}' == 'invalid_length_card_id_entity_low'
    random genarate data black mule
    ${id_low}    generate_digit_citizen_id    17
    Run Keyword If  ${index} == 1  Set Test Variable  ${card_id}       ${id_low}
    Run Keyword If  ${index} == 1  Set Test Variable  ${entity_type}       ENTITY
    Run Keyword If  ${index} == 1  Set Test Variable  ${id_type}       COMPANY ID
    ELSE IF  '${condition}' == 'invalid_length_card_id_entity_more'
    random genarate data black mule
    ${id_low}    generate_digit_citizen_id    36
    Run Keyword If  ${index} == 1  Set Test Variable  ${card_id}       ${id_low}
    Run Keyword If  ${index} == 1  Set Test Variable  ${entity_type}       ENTITY
    Run Keyword If  ${index} == 1  Set Test Variable  ${id_type}       COMPANY ID
    ELSE IF  '${condition}' == 'invalid_length_card_id_entity_str'
    random genarate data black mule
    Run Keyword If  ${index} == 1  Set Test Variable  ${card_id}       sdijsivhRTTVJJSKDHWIOPSJDHV237Ď
    Run Keyword If  ${index} == 1  Set Test Variable  ${entity_type}       ENTITY
    Run Keyword If  ${index} == 1  Set Test Variable  ${id_type}       COMPANY ID
    ELSE IF  '${condition}' == 'case_id_empty'
    random genarate data black mule all filed
    Run Keyword If  ${index} == 1  Set Test Variable  ${case_id}       ${EMPTY}
    ELSE IF  '${condition}' == 'case_date_empty'
    random genarate data black mule all filed
    Run Keyword If  ${index} == 1  Set Test Variable  ${case_date}       ${EMPTY}
    ELSE IF  '${condition}' == 'case_type_empty'
    random genarate data black mule all filed
    Run Keyword If  ${index} == 1  Set Test Variable  ${case_type}       ${EMPTY}
    ELSE IF  '${condition}' == 'accountno_empty'
    random genarate data black mule all filed
    Run Keyword If  ${index} == 1  Set Test Variable  ${accountno}       ${EMPTY}
    ELSE IF  '${condition}' == 'accounttype_empty'
    random genarate data black mule all filed
    Run Keyword If  ${index} == 1  Set Test Variable  ${accounttype}       ${EMPTY}
    ELSE IF  '${condition}' == 'bankcode_empty'
    random genarate data black mule all filed
    Run Keyword If  ${index} == 1  Set Test Variable  ${bankcode}       ${EMPTY}
    ELSE IF  '${condition}' == 'bankname_empty'
    random genarate data black mule all filed
    Run Keyword If  ${index} == 1  Set Test Variable  ${bankname}       ${EMPTY}
    ELSE IF  '${condition}' == 'entity_type_empty'
    random genarate data black mule all filed
    Run Keyword If  ${index} == 1  Set Test Variable  ${entity_type}       ${EMPTY}
    ELSE IF  '${condition}' == 'id_type_empty'
    random genarate data black mule all filed
    Run Keyword If  ${index} == 1  Set Test Variable  ${id_type}       ${EMPTY}
    ELSE IF  '${condition}' == 'card_id_empty'
    random genarate data black mule all filed
    Run Keyword If  ${index} == 1  Set Test Variable  ${card_id}       ${EMPTY}
    ELSE IF  '${condition}' == 'ref_code_empty'
    random genarate data black mule all filed
    Run Keyword If  ${index} == 1  Set Test Variable  ${ref_code}       ${EMPTY}
    ELSE IF  '${condition}' == 'name_empty'
    random genarate data black mule all filed
    Run Keyword If  ${index} == 1  Set Test Variable  ${name}       ${EMPTY}
    ELSE IF  '${condition}' == 'surname_empty'
    random genarate data black mule all filed
    Run Keyword If  ${index} == 1  Set Test Variable  ${surname}       ${EMPTY}
    ELSE IF  '${condition}' == 'aml_report_date_empty'
    random genarate data black mule all filed
    Run Keyword If  ${index} == 1  Set Test Variable  ${aml_report_date}       ${EMPTY}
    ELSE IF  '${condition}' == 'dup_in_file'
    random genarate data black mule all filed
    Create Data add black mule
    ELSE IF  '${condition}' == 'multipe_per_update'
    random genarate data black mule all filed
    Run Keyword If  ${index} == 0  Set Test Variable  ${title}       ผู้ต้องหา
    ELSE IF  '${condition}' == 'invali_condition_nationality'
    random genarate data black mule all filed
    Run Keyword If  ${index} == 0  Set Test Variable  ${nationality}       AA
    ELSE IF  '${condition}' == 'invali_condition_aml_report_date'
    random genarate data black mule all filed
    Run Keyword If  ${index} == 0  Set Test Variable  ${aml_report_date}       2025-12-31
    ELSE IF  '${condition}' == 'invali_condition_case_type'
    random genarate data black mule all filed
    Run Keyword If  ${index} == 0  Set Test Variable  ${case_type}       29
    ELSE IF  '${condition}' == 'invali_condition_bankname'
    random genarate data black mule all filed
    Run Keyword If  ${index} == 0  Set Test Variable  ${bankcode}       002
    Run Keyword If  ${index} == 0  Set Test Variable  ${bankname}       MEGA
    ELSE IF  '${condition}' == 'invali_condition_entity_type'
    random genarate data black mule all filed
    Run Keyword If  ${index} == 0  Set Test Variable  ${entity_type}       PERSONS
    ELSE IF  '${condition}' == 'invali_condition_id_type'
    random genarate data black mule all filed
    Run Keyword If  ${index} == 0  Set Test Variable  ${id_type}       Nationals ID
    ELSE IF  '${condition}' == 'invali_condition_entity_type_company'
    random genarate data black mule all filed
    Run Keyword If  ${index} == 0  Set Test Variable  ${entity_type}       PERSONS
    Run Keyword If  ${index} == 0  Set Test Variable  ${id_type}       COMPANY ID
    ELSE IF  '${condition}' == 'invali_condition_entity_type_company_v1'
    random genarate data black mule
    ${id_card}    generate_digit_citizen_id    35
    Run Keyword If  ${index} == 0  Set Test Variable  ${card_id}       ${id_card}
    Run Keyword If  ${index} == 0  Set Test Variable  ${entity_type}       ENTITY
    Run Keyword If  ${index} == 0  Set Test Variable  ${id_type}       National ID
    ELSE IF  '${condition}' == 'invali_condition_entity_type_company_v2'
    random genarate data black mule
    ${id_card}    generate_digit_citizen_id    35
    Run Keyword If  ${index} == 0  Set Test Variable  ${card_id}       ${id_card}
    Run Keyword If  ${index} == 0  Set Test Variable  ${entity_type}       ENTITY
    Run Keyword If  ${index} == 0  Set Test Variable  ${id_type}       COMPANY ID
    Run Keyword If  ${index} == 0  Set Test Variable  ${surname}       ตรีทรัพย์
    Run Keyword If  ${index} == 0  Set Test Variable  ${eng_surname}      Treesup
    ELSE IF  '${condition}' == 'invali_condition_entity_type_company_v3'
    random genarate data black mule
    ${id_card}    generate_digit_citizen_id    35
    Run Keyword If  ${index} == 0  Set Test Variable  ${card_id}       ${id_card}
    Run Keyword If  ${index} == 0  Set Test Variable  ${entity_type}       ENTITY
    Run Keyword If  ${index} == 0  Set Test Variable  ${id_type}       COMPANY ID
    Run Keyword If  ${index} == 0  Set Test Variable  ${surname}       กาญจนอาคม
    Run Keyword If  ${index} == 0  Set Test Variable  ${eng_surname}      ${EMPTY}
    ELSE IF  '${condition}' == 'invali_condition_entity_type_company_v4'
    random genarate data black mule
    ${id_card}    generate_digit_citizen_id    35
    Run Keyword If  ${index} == 0  Set Test Variable  ${card_id}       ${id_card}
    Run Keyword If  ${index} == 0  Set Test Variable  ${entity_type}       ENTITY
    Run Keyword If  ${index} == 0  Set Test Variable  ${id_type}       COMPANY ID
    Run Keyword If  ${index} == 0  Set Test Variable  ${surname}       ${EMPTY}
    Run Keyword If  ${index} == 0  Set Test Variable  ${eng_surname}      Pongsakornkitti
    ELSE IF  '${condition}' == 'invali_condition_entity_type_company_character'
    random genarate data black mule all filed
    ${id_card}    generate_digit_citizen_id    35
    Run Keyword If  ${index} == 0  Set Test Variable  ${card_id}       ${id_card}
    Run Keyword If  ${index} == 0  Set Test Variable  ${entity_type}       ENTITY
    Run Keyword If  ${index} == 0  Set Test Variable  ${id_type}       COMPANY ID
    Run Keyword If  ${index} == 0  Set Test Variable  ${surname}       ${EMPTY}
    Run Keyword If  ${index} == 1  Set Test Variable  ${card_id}       .~!@#$"%^&*()_+=-\][{}:"/?.><='"123
    Run Keyword If  ${index} == 1  Set Test Variable  ${entity_type}       ENTITY
    Run Keyword If  ${index} == 1  Set Test Variable  ${id_type}       COMPANY ID
    Run Keyword If  ${index} == 1  Set Test Variable  ${surname}       ${EMPTY}
    ELSE IF  '${condition}' == 'invali_condition_entity_type_national_character'
    random genarate data black mule all filed
    ${id_card}    generate_digit_citizen_id    35
    Run Keyword If  ${index} == 0  Set Test Variable  ${card_id}       ${id_card}
    Run Keyword If  ${index} == 0  Set Test Variable  ${nationality}       ${EMPTY}
    Run Keyword If  ${index} == 1  Set Test Variable  ${card_id}       .~!@#$"%^&*()_+=-\][{}:"/?.><='"123
    Run Keyword If  ${index} == 1  Set Test Variable  ${nationality}       ${EMPTY}
    ELSE IF  '${condition}' == '6A04'
    random genarate data black mule 
    Run Keyword If  ${index} == 0  randomcityzen
    Run Keyword If  ${index} == 0  set test variable  ${card_id_locked}          ${random_personalID}
    Run Keyword If  ${index} == 0  Set Test Variable  ${card_id}       ${card_id_locked}
    Run Keyword If  ${index} == 1  Set Test Variable  ${card_id}       ${card_id_locked}
    ELSE IF  '${condition}' == '6A04_in_sys'
    random genarate data black mule
    Query PersonalID
    Run Keyword If  ${index} == 0  Set Test Variable  ${card_id}       ${PersonalID_DB}
    ELSE IF  '${condition}' == 'inlivad_bankcode_6A07'
    random genarate data black mule
    Run Keyword If  ${index} == 0  Set Test Variable  ${bankcode}       099
    ELSE IF  '${condition}' == 'inlivad_bankname_6A07'
    random genarate data black mule
    Run Keyword If  ${index} == 0  Set Test Variable  ${bankname}       CFRB
    ELSE IF  '${condition}' == 'inlivad_case_date_6A07'
    random genarate data black mule
    Run Keyword If  ${index} == 0  Set Test Variable  ${case_date}       2021-12-31
    Run Keyword If  ${index} == 1  Set Test Variable  ${case_date}       ${filenameDateTime_month_future}
    ELSE
        log        not match condition
    END
Create Data add black mule
    ${list}=   create list   ${case_id}|${case_date}|${case_type}|${accountno}|${accounttype}|${bankcode}|${bankname}|${entity_type}|${id_type}|${card_id}|${ref_code}|${title}|${name}|${midname}|${surname}|${eng_name}|${eng_midname}|${eng_surname}|${birth_date}|${nationality}|${note}|${other}|${rank}|${pol_name}|${pol_surname}|${pol_job_title}|${pol_org}|${pol_tel}|${aml_report_date}
    ${data}=   create list  ${list}
    ${data_string}=    Evaluate    ','.join(${list})    
     OperatingSystem.Append To File    ${CURDIR}/Data/${directory}.csv    ${data_string}\n    encoding=utf-8
      Set Test Variable   ${list}
Create Data add black mule format have delimiter is ,
    ${list}=   create list   ${case_id}|${case_date}|${case_type},${accountno}|${accounttype}|${bankcode}|${bankname}|${entity_type}|${id_type}|${card_id}|${ref_code}|${title}|${name}|${midname}|${surname}|${eng_name}|${eng_midname}|${eng_surname}|${birth_date}|${nationality}|${note}|${other}|${rank}|${pol_name}|${pol_surname}|${pol_job_title}|${pol_org}|${pol_tel}|${aml_report_date}
    ${data}=   create list  ${list}
    ${data_string}=    Evaluate    ','.join(${list})    
     OperatingSystem.Append To File    ${CURDIR}/Data/${directory}.csv    ${data_string}\n    encoding=utf-8
      Set Test Variable   ${list}
Create Data add black mule is EMPTY
    ${list}=   create list   ${EMPTY}
    ${data}=   create list  ${list}
    ${data_string}=    Evaluate    ','.join(${list})    
     OperatingSystem.Append To File    ${CURDIR}/Data/${directory}.csv    ${data_string}\n    encoding=utf-8
      Set Test Variable   ${list}
Create Data add black mule in file is ${txt}
    ${list}=   create list   ${case_id}|${case_date}|${case_type}|${accountno}|${accounttype}|${bankcode}|${bankname}|${entity_type}|${id_type}|${card_id}|${ref_code}|${title}|${name}|${midname}|${surname}|${eng_name}|${eng_midname}|${eng_surname}|${birth_date}|${nationality}|${note}|${other}|${rank}|${pol_name}|${pol_surname}|${pol_job_title}|${pol_org}|${pol_tel}|${aml_report_date}
    ${data}=   create list  ${list}
    ${data_string}=    Evaluate    ','.join(${list})    
     OperatingSystem.Append To File    ${CURDIR}/Data/${directory}.${txt}    ${data_string}\n    encoding=utf-8
      Set Test Variable   ${list}

PreparaData black mule is ${number} Data And Genarate all type of black mule is ${type}
        FOR    ${index}    IN RANGE    ${number}
        Set Test Variable    ${index}
        get current date WarrantH
        get current TIME WarrantH
        Genarate black mule random ${type}
        Create Data add black mule
          log   ${index}
        END
PreparaData black mule is ${number} Data And Genarate all type of black mule is ${type} validate body have delimiter is ,
        FOR    ${index}    IN RANGE    ${number}
        Set Test Variable    ${index}
        get current date WarrantH
        get current TIME WarrantH
        Genarate black mule random ${type}
        Create Data add black mule format have delimiter is ,
          log   ${index}
        END
PreparaData black mule is ${number} Data And Genarate all type of black mule is ${type} in file is ${txt}
        FOR    ${index}    IN RANGE    ${number}
        Set Test Variable    ${index}
        get current date WarrantH
        get current TIME WarrantH
        Genarate black mule random ${type}
        Create Data add black mule in file is ${txt}
          log   ${index}
        END

Call API Sending file black mule from aoc to ITMX
    ${API_URL}=   Set Variable     ${Host_GET}
    Create Session  triggerBlackmule    ${API_URL}
    # ${headers} =   Create Dictionary    Content-Type=${Content-Type}
    ${response}=    POST On Session   triggerBlackmule  ${path.triggerBlackmule}    expected_status=any
    set test variable     ${response}
    # Get File Name to BANK

Call API Sending file withdraw black mule from aoc to ITMX
    ${API_URL}=   Set Variable     ${Host_GET}
    Create Session  triggerWithdrawBlackmule    ${API_URL}
    # ${headers} =   Create Dictionary    Content-Type=${Content-Type}
    ${response}=    POST On Session   triggerWithdrawBlackmule  ${path.triggerWithdrawBlackmule}    expected_status=any
    set test variable     ${response}
    # Get File Name to BANK

Get File black mule GPG From ITMX
    ${Res_blackmule_gpg}=     set variable     ${Filename_Res_blackmule}.gpg
    ${Res_blackmule_csv}=     set variable     ${Filename_Res_blackmule}.csv
    set test variable    ${Res_blackmule_gpg}
    set test variable    ${Res_blackmule_csv}
    WHILE    ${RETRY_COUNT} < ${MAX_RETRIES}
    sleep    5s
    ${outbound_exists}=    Run Keyword And Return Status    SSHLibrary.File Should Exist   /home/sftpaoc/${ENVAOC}/cfr/black_mule/outbound/${Filename_Res_blackmule}.gpg
    ${inbound_exists}=    Run Keyword And Return Status    SSHLibrary.File Should Exist   /home/sftpaoc/${ENVAOC}/cfr/black_mule/inbound/archive/${Filename_Req_blackmule}.gpg
    Run Keyword If    ${RETRY_COUNT} == ${MAX_RETRIES}    Fail    "File not found after ${MAX_RETRIES} retries."
    ${RETRY_COUNT}=    Evaluate    ${RETRY_COUNT} + 1
    Run Keyword If    ${outbound_exists} and ${inbound_exists}    Exit For Loop
    END
    SSHLibrary.Get File     /home/sftpaoc/${ENVAOC}/cfr/black_mule/outbound/${Res_blackmule_gpg}     ${CURDIR}/Data/${Res_blackmule_gpg}
    ${gpg_file_path}=  Set Variable  ${CURDIR}/Data/${Res_blackmule_gpg}
    ${output_csv_path}=  Set Variable  ${CURDIR}/Data/${Res_blackmule_csv}
    ${passphrase}=  Set Variable   ${Pass.AOC}
     ${result}=    Decrypt Gpg File    ${gpg_file_path}  ${output_csv_path}  ${passphrase}
    Log    ${result}
    wait until created    ${CURDIR}/Data/${Res_blackmule_gpg}   2s
    wait until created    ${CURDIR}/Data/${Res_blackmule_csv}   2s
    set test variable   ${CSV_FILE}     ${CURDIR}/Data/${Res_blackmule_csv}
    set test variable   ${GPG_FILE}     ${CURDIR}/Data/${Res_blackmule_gpg}

Get File withdraw black mule GPG From ITMX
    ${Res_blackmule_gpg}=     set variable     ${Filename_Res_blackmule}.gpg
    ${Res_blackmule_csv}=     set variable     ${Filename_Res_blackmule}.json
    set test variable    ${Res_blackmule_gpg}
    set test variable    ${Res_blackmule_csv}
    WHILE    ${RETRY_COUNT} < ${MAX_RETRIES}
    sleep    5s
    ${outbound_exists}=    Run Keyword And Return Status    SSHLibrary.File Should Exist   /home/sftpaoc/${ENVAOC}/cfr/withdraw_black_mule/outbound/${Filename_Res_blackmule}.gpg
    ${inbound_exists}=    Run Keyword And Return Status    SSHLibrary.File Should Exist   /home/sftpaoc/${ENVAOC}/cfr/withdraw_black_mule/inbound/archive/${Filename_Req_blackmule}.gpg
    Run Keyword If    ${RETRY_COUNT} == ${MAX_RETRIES}    Fail    "File not found after ${MAX_RETRIES} retries."
    ${RETRY_COUNT}=    Evaluate    ${RETRY_COUNT} + 1
    Run Keyword If    ${outbound_exists} and ${inbound_exists}    Exit For Loop
    END
    SSHLibrary.Get File     /home/sftpaoc/${ENVAOC}/cfr/withdraw_black_mule/outbound/${Res_blackmule_gpg}     ${CURDIR}/Data/${Res_blackmule_gpg}
    ${gpg_file_path}=  Set Variable  ${CURDIR}/Data/${Res_blackmule_gpg}
    ${output_csv_path}=  Set Variable  ${CURDIR}/Data/${Res_blackmule_csv}
    ${passphrase}=  Set Variable   ${Pass.AOC}
     ${result}=    Decrypt Gpg File    ${gpg_file_path}  ${output_csv_path}  ${passphrase}
    Log    ${result}
    wait until created    ${CURDIR}/Data/${Res_blackmule_gpg}   2s
    wait until created    ${CURDIR}/Data/${Res_blackmule_csv}   2s
    set test variable   ${CSV_FILE}     ${CURDIR}/Data/${Res_blackmule_csv}
    set test variable   ${GPG_FILE}     ${CURDIR}/Data/${Res_blackmule_gpg}

Get File black mule GPG From ITMX for dup
    ${Res_blackmule_gpg}=     set variable     ${Filename_Res_blackmule}.gpg
    ${Res_blackmule_csv}=     set variable     ${Filename_Res_blackmule}.csv
    set test variable    ${Res_blackmule_gpg}
    set test variable    ${Res_blackmule_csv}
    WHILE    ${RETRY_COUNT} < ${MAX_RETRIES}
    sleep    5s
    ${outbound_exists}=    Run Keyword And Return Status    SSHLibrary.File Should Exist   /home/sftpaoc/${ENVAOC}/cfr/black_mule/outbound/${Filename_Res_blackmule}_*\.gpg
    ${inbound_exists}=    Run Keyword And Return Status    SSHLibrary.File Should Exist   /home/sftpaoc/${ENVAOC}/cfr/black_mule/inbound/archive/${Filename_Req_blackmule}_*\.gpg
    Run Keyword If    ${RETRY_COUNT} == ${MAX_RETRIES}    Fail    "File not found after ${MAX_RETRIES} retries."
    ${RETRY_COUNT}=    Evaluate    ${RETRY_COUNT} + 1
    Run Keyword If    ${outbound_exists} and ${inbound_exists}    Exit For Loop
    END
    SSHLibrary.Get File     /home/sftpaoc/${ENVAOC}/cfr/black_mule/outbound/${Filename_Res_blackmule}_*\.gpg    ${CURDIR}/Data/${Res_blackmule_gpg}
    ${gpg_file_path}=  Set Variable  ${CURDIR}/Data/${Res_blackmule_gpg}
    ${output_csv_path}=  Set Variable  ${CURDIR}/Data/${Res_blackmule_csv}
    ${passphrase}=  Set Variable   ${Pass.AOC}
     ${result}=    Decrypt Gpg File    ${gpg_file_path}  ${output_csv_path}  ${passphrase}
    Log    ${result}
    wait until created    ${CURDIR}/Data/${Res_blackmule_gpg}   2s
    wait until created    ${CURDIR}/Data/${Res_blackmule_csv}   2s
    set test variable   ${CSV_FILE}     ${CURDIR}/Data/${Res_blackmule_csv}
    set test variable   ${GPG_FILE}     ${CURDIR}/Data/${Res_blackmule_gpg}

Get File withdraw black mule GPG From ITMX for dup
    ${Res_blackmule_gpg}=     set variable     ${Filename_Res_blackmule}.gpg
    ${Res_blackmule_csv}=     set variable     ${Filename_Res_blackmule}.csv
    set test variable    ${Res_blackmule_gpg}
    set test variable    ${Res_blackmule_csv}
    WHILE    ${RETRY_COUNT} < ${MAX_RETRIES}
    sleep    5s
    ${output}=    Execute Command    ls /home/sftpaoc/${ENVAOC}/cfr/withdraw_black_mule/outbound/${Filename_Res_blackmule}_*.gpg
    ${outbound_exists}=    Run Keyword And Return Status    SSHLibrary.File Should Exist   /home/sftpaoc/${ENVAOC}/cfr/withdraw_black_mule/outbound/${Filename_Res_blackmule}_*\.gpg
    ${inbound_exists}=    Run Keyword And Return Status    SSHLibrary.File Should Exist   /home/sftpaoc/${ENVAOC}/cfr/withdraw_black_mule/inbound/archive/${Filename_Req_blackmule}_*\.gpg
    Run Keyword If    ${RETRY_COUNT} == ${MAX_RETRIES}    Fail    "File not found after ${MAX_RETRIES} retries."
    ${RETRY_COUNT}=    Evaluate    ${RETRY_COUNT} + 1
    Run Keyword If    ${outbound_exists} and ${inbound_exists}    Exit For Loop
    END
    # SSHLibrary.Get File     /home/sftpaoc/${ENVAOC}/cfr/black_mule/outbound/${Filename_Res_blackmule}_*\.gpg    ${CURDIR}/Data/${Res_blackmule_gpg}
    SSHLibrary.Get File     ${output}    ${CURDIR}/Data/${Res_blackmule_gpg}
    ${gpg_file_path}=  Set Variable  ${CURDIR}/Data/${Res_blackmule_gpg}
    ${output_csv_path}=  Set Variable  ${CURDIR}/Data/${Res_blackmule_csv}
    ${passphrase}=  Set Variable   ${Pass.AOC}
     ${result}=    Decrypt Gpg File    ${gpg_file_path}  ${output_csv_path}  ${passphrase}
    Log    ${result}
    wait until created    ${CURDIR}/Data/${Res_blackmule_gpg}   2s
    wait until created    ${CURDIR}/Data/${Res_blackmule_csv}   2s
    set test variable   ${CSV_FILE}     ${CURDIR}/Data/${Res_blackmule_csv}
    set test variable   ${GPG_FILE}     ${CURDIR}/Data/${Res_blackmule_gpg}
Query Check RES REQ AOC_SFTP_BLACK_MULE
        connect to cfr database horse
        ${sql}=   catenate      select MASTER_CASE_ID,POLICE_CASE_NUMBER from FRAUDCASE where MASTER_CASE_ID = '${Bank_case_id_req}'
        ${query}=   query_all     ${db_connect}     ${sql}     # query
        ${result}=   set variable    ${query[0]}
        ${MASTER_CASE_ID}=    set variable    ${result}[MASTER_CASE_ID]
        ${POLICE_CASE_NUMBER}=    set variable    ${result}[POLICE_CASE_NUMBER]
        set test variable   ${DB_MASTER_CASE_ID}      ${MASTER_CASE_ID}

Check Response Code Black Mule REQ And RES
    ${csv_list}=   Read Csv File To List      ${CSV_FILE}
    connect to cfr database
    ${sql}=     Catenate    SELECT 
...        asbmrfi.RESPONSE_FILE_NAME,
...        asbmrfd.FILE_NAME,
...        asbmrff.ROW_NUMBER,
...        asbmrff.ROW_ORIGINAL_MESSAGE,
...        asbmrff.STATUS_CODE,
...        asbmrff.STATUS_DETAIL 
...    FROM AOC_SFTP_BLACK_MULE_RESPONSE_FILE_INFO asbmrfi 
...    JOIN AOC_SFTP_BLACK_MULE_REQUEST_FILE_INFO asbmrfd 
...        ON asbmrfi.REQUEST_FILE_ID = asbmrfd.ID 
...    JOIN AOC_SFTP_BLACK_MULE_REQUEST_FILE_DETAIL asbmrff 
...        ON asbmrfd.ID = asbmrff.FILE_ID
...    WHERE asbmrfd.FILE_NAME = '${Filename_Req_blackmule}.gpg' 
...    ORDER BY asbmrff.ROW_NUMBER ASC 
    ${query}=   query_all     ${db_connect}     ${sql}
    ${total_res}=   Get Length   ${csv_list}[1:] 
    ${total_query}=   Get Length   ${query} 
    FOR    ${index}    IN RANGE    0    ${total_res}       
          ${data_total}=    Get From List   ${csv_list}[1:]    ${index}
          ${data_responcode}=    Get From List   ${data_total}    0
          ${split_data}=    Split String    ${data_responcode}    ;
         ${case_id_Res}=         Get From List    ${split_data}    0
         ${accountno_Res}=        Get From List    ${split_data}    1
         ${bankcode_Res}=         Get From List    ${split_data}    2
        ${card_id_Res}=        Get From List    ${split_data}    3
        ${ref_code_Res}=        Get From List    ${split_data}    4
        ${Code_Res}=        Get From List    ${split_data}    5
        ${Message_Res}=        Get From List    ${split_data}    6
        ${Timestamp_Res}=        Get From List    ${split_data}    7
        ${result}=   set variable    ${query}[${index}]
        ${DB_RES_FILE_NAME}=    set variable    ${result}[RESPONSE_FILE_NAME]
        ${DB_REQ_FILE_NAME}=    set variable    ${result}[FILE_NAME]
        ${DB_Staus_Code}=    set variable    ${result}[STATUS_CODE]
        ${DB_Staus_Detail} =   Strip String   ${result}[STATUS_DETAIL]
        # ${DB_Staus_Detail}=    set variable    ${result}[STATUS_DETAIL]
        ${DB_case_id}=    set variable    ${result}[ROW_ORIGINAL_MESSAGE]
        ${data_responcode}=    Get From List   ${data_total}    0
        ${split_data}=    Split String    ${data_responcode}    ;
        ${case_id_DB}=         Get From List    ${split_data}    0

    Should Be Equal As Strings    ${Filename_Res_blackmule}.gpg     ${DB_RES_FILE_NAME}
    Should Be Equal As Strings    ${Filename_Req_blackmule}.gpg      ${DB_REQ_FILE_NAME}
    Should Be Equal As Strings    ${Code_Res}     ${DB_Staus_Code}
    Should Be Equal As Strings    ${Message_Res}       ${DB_Staus_Detail}
    Should Be Equal As Strings    ${case_id_Res}       ${case_id_DB}
    Should Not Be Empty     ${Timestamp_Res}
    log      ${query}[${index}]
    log      ${csv_list}[${index}]
    log      ${index}
    END
    Check Response Code Black Mule Validate Data REQ to RES

Check Response Code Black Mule REQ And RES For Negative
    ${csv_list}=   Read Csv File To List      ${CSV_FILE}
    connect to cfr database
    ${sql}=     Catenate    SELECT 
...        asbmrfi.RESPONSE_FILE_NAME,
...        asbmrfd.FILE_NAME,
...        asbmrff.ROW_NUMBER,
...        asbmrff.ROW_ORIGINAL_MESSAGE,
...        asbmrff.STATUS_CODE,
...        asbmrff.STATUS_DETAIL 
...    FROM AOC_SFTP_BLACK_MULE_RESPONSE_FILE_INFO asbmrfi 
...    JOIN AOC_SFTP_BLACK_MULE_REQUEST_FILE_INFO asbmrfd 
...        ON asbmrfi.REQUEST_FILE_ID = asbmrfd.ID 
...    JOIN AOC_SFTP_BLACK_MULE_REQUEST_FILE_DETAIL asbmrff 
...        ON asbmrfd.ID = asbmrff.FILE_ID
...    WHERE asbmrfd.FILE_NAME = '${Filename_Req_blackmule}.gpg' 
...    ORDER BY asbmrff.ROW_NUMBER ASC 
    ${query}=   query_all     ${db_connect}     ${sql}
    ${total_res}=   Get Length   ${csv_list}[1:] 
    ${total_query}=   Get Length   ${query} 
    ${Message_Error}    create list
    FOR    ${index}    IN RANGE    0    ${total_res}       
          ${data_total}=    Get From List   ${csv_list}[1:]    ${index}
          ${data_responcode}=    Get From List   ${data_total}    0
          ${split_data}=    Split String    ${data_responcode}    ;
         ${case_id_Res}=         Get From List    ${split_data}    0
         ${accountno_Res}=        Get From List    ${split_data}    1
         ${bankcode_Res}=         Get From List    ${split_data}    2
        ${card_id_Res}=        Get From List    ${split_data}    3
        ${ref_code_Res}=        Get From List    ${split_data}    4
        ${Code_Res}=        Get From List    ${split_data}    5
        ${Message_Res}=        Get From List    ${split_data}    6
        ${Timestamp_Res}=        Get From List    ${split_data}    7
        ${result}=   set variable    ${query}[${index}]
        ${DB_RES_FILE_NAME}=    set variable    ${result}[RESPONSE_FILE_NAME]
        ${DB_REQ_FILE_NAME}=    set variable    ${result}[FILE_NAME]
        ${DB_Staus_Code}=    set variable    ${result}[STATUS_CODE]
        ${DB_Staus_Detail} =   Strip String   ${result}[STATUS_DETAIL]
        # ${DB_Staus_Detail}=    set variable    ${result}[STATUS_DETAIL]
        ${DB_case_id}=    set variable    ${result}[ROW_ORIGINAL_MESSAGE]
        ${data_responcode}=    Get From List   ${data_total}    0
        ${split_data}=    Split String    ${data_responcode}    ;
        ${case_id_DB}=         Get From List    ${split_data}    0

    Should Be Equal As Strings    ${Filename_Res_blackmule}.gpg     ${DB_RES_FILE_NAME}
    Should Be Equal As Strings    ${Filename_Req_blackmule}.gpg      ${DB_REQ_FILE_NAME}
    Should Be Equal As Strings    ${Code_Res}     ${DB_Staus_Code}
    Should Be Equal As Strings    ${Message_Res}       ${DB_Staus_Detail}
    Should Be Equal As Strings    ${case_id_Res}       ${case_id_DB}
    Should Not Be Empty     ${Timestamp_Res}
    Append To List  ${Message_Error}    ${Code_Res}
    set test variable     ${Message_Error}
    log      ${query}[${index}]
    log      ${csv_list}[${index}]
    log      ${index}
    END
    Check Response Code Black Mule Validate Data REQ to RES for Negative

Check Response Code Black Mule REQ And RES V1
    ${csv_list}=   Read Csv File To List      ${CSV_FILE}
    connect to cfr database
    ${sql}=     Catenate    SELECT 
...        *
...    FROM AOC_SFTP_BLACK_MULE_RESPONSE_FILE_INFO asbmrfi 
...    JOIN AOC_SFTP_BLACK_MULE_REQUEST_FILE_INFO asbmrfd 
...        ON asbmrfi.REQUEST_FILE_ID = asbmrfd.ID 
...    WHERE asbmrfd.FILE_NAME = '${Filename_Req_blackmule}.gpg' 
    ${query}=   query_all     ${db_connect}     ${sql}
    ${total_res}=   Get Length   ${csv_list}[1:] 
    ${total_query}=   Get Length   ${query} 
    FOR    ${index}    IN RANGE    0    ${total_res}       
          ${data_total}=    Get From List   ${csv_list}[1:]    ${index}
          ${data_responcode}=    Get From List   ${data_total}    0
          ${split_data}=    Split String    ${data_responcode}    ;
         ${case_id_Res}=         Get From List    ${split_data}    0
         ${accountno_Res}=        Get From List    ${split_data}    1
         ${bankcode_Res}=         Get From List    ${split_data}    2
        ${card_id_Res}=        Get From List    ${split_data}    3
        ${ref_code_Res}=        Get From List    ${split_data}    4
        ${Code_Res}=        Get From List    ${split_data}    5
        ${Message_Res}=        Get From List    ${split_data}    6
        ${Timestamp_Res}=        Get From List    ${split_data}    7
        ${result}=   set variable    ${query}[${index}]
        ${DB_RES_FILE_NAME}=    set variable    ${result}[RESPONSE_FILE_NAME]
        ${DB_REQ_FILE_NAME}=    set variable    ${result}[FILE_NAME]
        ${DB_Staus_Code}=    set variable    ${result}[STATUS_CODE]
        ${DB_Staus_Detail} =   Strip String   ${result}[STATUS_DETAIL]
        ${data_responcode}=    Get From List   ${data_total}    0
        ${split_data}=    Split String    ${data_responcode}    ;
        ${case_id_DB}=         Get From List    ${split_data}    0

    Should Be Equal As Strings    ${Filename_Res_blackmule}.gpg     ${DB_RES_FILE_NAME}
    Should Be Equal As Strings    ${Filename_Req_blackmule}.gpg      ${DB_REQ_FILE_NAME}
    Should Be Equal As Strings    ${Code_Res}     ${DB_Staus_Code}
    Should Be Equal As Strings    ${Message_Res}       ${DB_Staus_Detail}
    Should Be Equal As Strings    ${case_id_Res}       ${case_id_DB}
    Should Not Be Empty     ${Timestamp_Res}
    log      ${query}[${index}]
    log      ${csv_list}[${index}]
    log      ${index}
    END
    Check Response Code Black Mule Validate Data REQ to RES for Negative

Check Response Code Black Mule REQ And RES V2
    ${csv_list}=   Read Csv File To List      ${CSV_FILE}
    connect to cfr database
    ${sql}=     Catenate    SELECT 
...        *
...    FROM AOC_SFTP_BLACK_MULE_RESPONSE_FILE_INFO asbmrfi 
...    JOIN AOC_SFTP_BLACK_MULE_REQUEST_FILE_INFO asbmrfd 
...        ON asbmrfi.REQUEST_FILE_ID = asbmrfd.ID 
...    WHERE asbmrfd.FILE_NAME = '${Filename_Req_blackmule}.gpg' ORDER BY UPDATE_DATETIME DESC 
    ${query}=   query_all     ${db_connect}     ${sql}
    ${total_res}=   Get Length   ${csv_list}[1:] 
    ${total_query}=   Get Length   ${query} 
    FOR    ${index}    IN RANGE    0    ${total_res}       
          ${data_total}=    Get From List   ${csv_list}[1:]    ${index}
          ${data_responcode}=    Get From List   ${data_total}    0
          ${split_data}=    Split String    ${data_responcode}    ;
         ${case_id_Res}=         Get From List    ${split_data}    0
         ${accountno_Res}=        Get From List    ${split_data}    1
         ${bankcode_Res}=         Get From List    ${split_data}    2
        ${card_id_Res}=        Get From List    ${split_data}    3
        ${ref_code_Res}=        Get From List    ${split_data}    4
        ${Code_Res}=        Get From List    ${split_data}    5
        ${Message_Res}=        Get From List    ${split_data}    6
        ${Timestamp_Res}=        Get From List    ${split_data}    7
        ${result}=   set variable    ${query}[${index}]
        ${DB_RES_FILE_NAME}=    set variable    ${result}[RESPONSE_FILE_NAME]
        ${DB_REQ_FILE_NAME}=    set variable    ${result}[FILE_NAME]
        ${DB_Staus_Code}=    set variable    ${result}[STATUS_CODE]
        ${DB_Staus_Detail} =   Strip String   ${result}[STATUS_DETAIL]
        ${data_responcode}=    Get From List   ${data_total}    0
        ${split_data}=    Split String    ${data_responcode}    ;
        ${case_id_DB}=         Get From List    ${split_data}    0

    # Should Be Equal As Strings    ${Filename_Res_blackmule}.gpg     ${DB_RES_FILE_NAME}
    Should Be Equal As Strings    ${Filename_Req_blackmule}.gpg      ${DB_REQ_FILE_NAME}
    Should Be Equal As Strings    ${Code_Res}     ${DB_Staus_Code}
    Should Be Equal As Strings    ${Message_Res}       ${DB_Staus_Detail}
    Should Be Equal As Strings    ${case_id_Res}       ${case_id_DB}
    Should Not Be Empty     ${Timestamp_Res}
    log      ${query}[${index}]
    log      ${csv_list}[${index}]
    log      ${index}
    END
    Check Response Code Black Mule Validate Data REQ to RES for Negative

Check Response Code Black Mule REQ And RES for Dup
    ${csv_list}=   Read Csv File To List      ${CSV_FILE}    delimiter=;
    connect to cfr database
    ${sql}=     Catenate    SELECT 
...        asbmrfi.RESPONSE_FILE_NAME,
...        asbmrfd.FILE_NAME,
...        asbmrff.ROW_NUMBER,
...        asbmrff.ROW_ORIGINAL_MESSAGE,
...        asbmrff.STATUS_CODE,
...        asbmrff.STATUS_DETAIL 
...    FROM AOC_SFTP_BLACK_MULE_RESPONSE_FILE_INFO asbmrfi 
...    JOIN AOC_SFTP_BLACK_MULE_REQUEST_FILE_INFO asbmrfd 
...        ON asbmrfi.REQUEST_FILE_ID = asbmrfd.ID 
...    JOIN AOC_SFTP_BLACK_MULE_REQUEST_FILE_DETAIL asbmrff 
...        ON asbmrfd.ID = asbmrff.FILE_ID
...    WHERE asbmrfd.FILE_NAME = '${Filename_Req_blackmule}.gpg' 
...    ORDER BY asbmrff.ROW_NUMBER ASC 
    ${query}=   query_all     ${db_connect}     ${sql}
    ${total_res}=   Get Length   ${csv_list}[1:] 
    ${total_query}=   Get Length   ${query} 
    FOR    ${index}    IN RANGE    0    ${total_res}       
          ${data_total}=    Get From List   ${csv_list}[1:]    ${index}
          ${case_id_Res}=    Get From List   ${data_total}    0
         ${accountno_Res}=        Get From List    ${data_total}    1
         ${bankcode_Res}=         Get From List    ${data_total}    2
        ${card_id_Res}=        Get From List    ${data_total}    3
        ${ref_code_Res}=        Get From List    ${data_total}    4
        ${Code_Res}=        Get From List    ${data_total}    5
        ${Message_Res}=        Get From List    ${data_total}    6
        ${Timestamp_Res}=        Get From List    ${data_total}    7
        ${result}=   set variable    ${query}[${index}]
        ${DB_RES_FILE_NAME}=    set variable    ${result}[RESPONSE_FILE_NAME]
        ${DB_REQ_FILE_NAME}=    set variable    ${result}[FILE_NAME]
        ${DB_Staus_Code}=    set variable    ${result}[STATUS_CODE]
        ${DB_Staus_Detail} =   Strip String   ${result}[STATUS_DETAIL]
        # ${DB_Staus_Detail}=    set variable    ${result}[STATUS_DETAIL]
        ${DB_case_id}=    set variable    ${result}[ROW_ORIGINAL_MESSAGE]
        ${data_responcode}=    Get From List   ${data_total}    0
        ${split_data}=    Split String    ${data_responcode}    ;
        ${case_id_DB}=         Get From List    ${split_data}    0

    Should Be Equal As Strings    ${Filename_Res_blackmule}.gpg     ${DB_RES_FILE_NAME}
    Should Be Equal As Strings    ${Filename_Req_blackmule}.gpg      ${DB_REQ_FILE_NAME}
    Should Be Equal As Strings    ${Code_Res}     ${DB_Staus_Code}
    Should Be Equal As Strings    ${Message_Res}       ${DB_Staus_Detail}
    Should Be Equal As Strings    ${case_id_Res}       ${case_id_DB}
    Should Not Be Empty     ${Timestamp_Res}
    log      ${query}[${index}]
    log      ${csv_list}[${index}]
    log      ${index}
    END
    Check Response Code Black Mule Validate Data REQ to RES

Check Response Code Black Mule REQ And RES V3
    ${csv_list}=   Read Csv File To List      ${CSV_FILE}
    connect to cfr database
    ${sql}=     Catenate    SELECT 
...        *
...    FROM AOC_SFTP_BLACK_MULE_RESPONSE_FILE_INFO asbmrfi 
...    JOIN AOC_SFTP_BLACK_MULE_REQUEST_FILE_INFO asbmrfd 
...        ON asbmrfi.REQUEST_FILE_ID = asbmrfd.ID 
...    WHERE asbmrfd.FILE_NAME = '${Filename_Req_blackmule}.gpg' 
    ${query}=   query_all     ${db_connect}     ${sql}
    ${total_res}=   Get Length   ${csv_list}[1:] 
    ${total_query}=   Get Length   ${query} 
    FOR    ${index}    IN RANGE    0    ${total_res}       
          ${data_total}=    Get From List   ${csv_list}[1:]    ${index}
          ${data_responcode}=    Get From List   ${data_total}    0
          ${split_data}=    Split String    ${data_responcode}    ;
         ${case_id_Res}=         Get From List    ${split_data}    0
         ${accountno_Res}=        Get From List    ${split_data}    1
         ${bankcode_Res}=         Get From List    ${split_data}    2
        ${card_id_Res}=        Get From List    ${split_data}    3
        ${ref_code_Res}=        Get From List    ${split_data}    4
        ${Code_Res}=        Get From List    ${split_data}    5
        ${Message_Res}=        Get From List    ${split_data}    6
        ${Timestamp_Res}=        Get From List    ${split_data}    7
        ${result}=   set variable    ${query}[${index}]
        ${DB_RES_FILE_NAME}=    set variable    ${result}[RESPONSE_FILE_NAME]
        ${DB_REQ_FILE_NAME}=    set variable    ${result}[FILE_NAME]
        ${DB_Staus_Code}=    set variable    ${result}[STATUS_CODE]
        ${DB_Staus_Detail} =   Strip String   ${result}[STATUS_DETAIL]
        ${data_responcode}=    Get From List   ${data_total}    0
        ${split_data}=    Split String    ${data_responcode}    ;
        ${case_id_DB}=         Get From List    ${split_data}    0

    Should Be Equal As Strings    ${Filename_Res_blackmule}.gpg     ${DB_RES_FILE_NAME}
    Should Be Equal As Strings    ${Filename_Req_blackmule}.gpg      ${DB_REQ_FILE_NAME}
    Should Be Equal As Strings    ${Code_Res}     ${DB_Staus_Code}
    Should Be Equal As Strings    ${Message_Res}       ${DB_Staus_Detail}
    Should Be Equal As Strings    ${case_id_Res}       ${case_id_DB}
    Should Not Be Empty     ${Timestamp_Res}
    log      ${query}[${index}]
    log      ${csv_list}[${index}]
    log      ${index}
    END

Deleted File all
    Remove File    ${CURDIR}/Data/*
    Remove file SSH black mule  
    Deleted DB

Deleted File all withdraw
    Remove File    ${CURDIR}/Data/*
    Remove file SSH withdraw black mule  
    # Deleted DB

Deleted File all and deleted DB REQ RES
    Remove File    ${CURDIR}/Data/*
    Remove file SSH black mule  
    Deleted DB REQ RES

Deleted File all not deleted DB
    Remove File    ${CURDIR}/Data/*
    Remove file SSH black mule  

Create and update parameter is ${update} black mule file csv
      IF  '${update}' == 'title'
        ${random_case_id}    random_number_warrant    10
        set test variable  ${case_id}          ${random_case_id}
        Set Test Variable  ${title}       ผู้ต้องหา
      ELSE IF  '${update}' == 'name'
        ${random_case_id}    random_number_warrant    10
        set test variable  ${case_id}          ${random_case_id}
        Set Test Variable  ${name}       มหาศาล      
      ELSE IF  '${update}' == 'minname'
        ${random_case_id}    random_number_warrant    10
        set test variable  ${case_id}          ${random_case_id}
        Set Test Variable  ${minname}       กลาง1      
      ELSE IF  '${update}' == 'surname'
        ${random_case_id}    random_number_warrant    10
        set test variable  ${case_id}          ${random_case_id}
        Set Test Variable  ${surname}       สุดยอด      
      ELSE IF  '${update}' == 'eng_name'
        ${random_case_id}    random_number_warrant    10
        set test variable  ${case_id}          ${random_case_id}
        Set Test Variable  ${eng_name}       Putongha      
      ELSE IF  '${update}' == 'eng_midname'
        ${random_case_id}    random_number_warrant    10
        set test variable  ${case_id}          ${random_case_id}
        Set Test Variable  ${eng_midname}       Name Klang      
      ELSE IF  '${update}' == 'eng_surname'
        ${random_case_id}    random_number_warrant    10
        set test variable  ${case_id}          ${random_case_id}
        Set Test Variable  ${eng_surname}       Sudyod    
      ELSE IF  '${update}' == 'birth_date'
        ${random_case_id}    random_number_warrant    10
        set test variable  ${case_id}          ${random_case_id}
        Set Test Variable  ${birth_date}       1999-02-05    
      ELSE IF  '${update}' == 'nationality'
        ${random_case_id}    random_number_warrant    10
        set test variable  ${case_id}          ${random_case_id}
        Set Test Variable  ${nationality}       CG   
      ELSE
          log   not match 
      END
    Create black mule file csv
    Create Data add black mule

Remove file SSH black mule  
    Close All Connections
    Open Connection     ${hostsftp.ip}
    Login	${AOC.user}   ${AOC.password}   allow_agent=True
    Sleep    2s
    SSHLibrary.File Should Exist   /home/sftpaoc/${ENVAOC}/cfr/black_mule/outbound/${Filename_Res_blackmule}.gpg
    SSHLibrary.File Should Exist   /home/sftpaoc/${ENVAOC}/cfr/black_mule/inbound/archive/${Filename_Req_blackmule}.gpg
    ${outbound}=    Execute Command    rm /home/sftpaoc/${ENVAOC}/cfr/black_mule/outbound/${Filename_Res_blackmule}.gpg    forward_agent=True
    ${inbound_archive}=    Execute Command    rm /home/sftpaoc/${ENVAOC}/cfr/black_mule/inbound/archive/${Filename_Req_blackmule}.gpg
    Close All Connections

Remove file SSH withdraw black mule  
    Close All Connections
    Open Connection     ${hostsftp.ip}
    Login	${AOC.user}   ${AOC.password}   allow_agent=True
    Sleep    2s
    SSHLibrary.File Should Exist   /home/sftpaoc/${ENVAOC}/cfr/withdraw_black_mule/outbound/${Filename_Res_blackmule}.gpg
    SSHLibrary.File Should Exist   /home/sftpaoc/${ENVAOC}/cfr/withdraw_black_mule/inbound/archive/${Filename_Req_blackmule}.gpg
    ${outbound}=    Execute Command    rm /home/sftpaoc/${ENVAOC}/cfr/withdraw_black_mule/outbound/${Filename_Res_blackmule}.gpg    forward_agent=True
    ${inbound_archive}=    Execute Command    rm /home/sftpaoc/${ENVAOC}/cfr/withdraw_black_mule/inbound/archive/${Filename_Req_blackmule}.gpg
    Close All Connections

Deleted DB 
        connect to cfr database
       ${sql}=   catenate      select * from AOC_SFTP_BLACK_MULE_REQUEST_FILE_INFO WHERE FILE_NAME = '${Filename_Req_blackmule}.gpg'
    #    ${sql}=   catenate      select * from AOC_SFTP_BLACK_MULE_REQUEST_FILE_INFO WHERE FILE_NAME = 'CFR_RegistryBlackMule_25680403_013_REQ.gpg'
        ${query}=   query_all     ${db_connect}     ${sql}     # query
        ${result}=   set variable    ${query[0]}
        ${DB_REQ_FILE_ID}=    set variable    ${result}[ID]

       ${sql}=   catenate      select * from AOC_SFTP_BLACK_MULE_REQUEST_FILE_DETAIL WHERE FILE_ID = '${DB_REQ_FILE_ID}' ORDER BY ROW_NUMBER ASC 
        ${query}=   query_all     ${db_connect}     ${sql}     # query
        ${result}=   set variable    ${query[0]}
        ${total_query}=   Get Length   ${query} 

        FOR    ${index}    IN RANGE    0    ${total_query}  
        ${sql}=   catenate      select * from AOC_SFTP_BLACK_MULE_REQUEST_FILE_DETAIL WHERE FILE_ID = '${DB_REQ_FILE_ID}' ORDER BY ROW_NUMBER ASC 
        ${query}=   query_all     ${db_connect}     ${sql}     # query
        ${result}=   set variable    ${query}[${index}]
        ${DB_REQ_FILE_DETAIL_ID}=    set variable    ${result}[ID]
       ${sql}=   catenate      DELETE from AOC_BLACK_MULE_CASE WHERE CREATE_FILE_DETAIL_ID = '${DB_REQ_FILE_DETAIL_ID}'
        ${query}=   update     ${db_connect}     ${sql}
       ${sql}=   catenate      DELETE from AOC_BLACK_MULE_ACCOUNT WHERE CREATE_FILE_DETAIL_ID = '${DB_REQ_FILE_DETAIL_ID}'
        ${query}=   update     ${db_connect}     ${sql}
       ${sql}=   catenate      DELETE from AOC_BLACK_MULE_PERSON WHERE CREATE_FILE_DETAIL_ID = '${DB_REQ_FILE_DETAIL_ID}'
        ${query}=   update     ${db_connect}     ${sql}
        END
       ${sql}=   catenate      DELETE from AOC_SFTP_BLACK_MULE_RESPONSE_FILE_INFO WHERE RESPONSE_FILE_NAME = '${Filename_Res_blackmule}.gpg'
        ${query}=   update     ${db_connect}     ${sql}
       ${sql}=   catenate      DELETE from AOC_SFTP_BLACK_MULE_REQUEST_FILE_DETAIL WHERE FILE_ID = '${DB_REQ_FILE_ID}'
        ${query}=   update     ${db_connect}     ${sql}
       ${sql}=   catenate      DELETE from AOC_SFTP_BLACK_MULE_REQUEST_FILE_INFO WHERE FILE_NAME = '${Filename_Req_blackmule}.gpg'
        ${query}=   update     ${db_connect}     ${sql}
Deleted DB alot file 
    connect to cfr database
    ${total_filename}    Get Length    ${Filenames}
    FOR    ${index}    IN RANGE    0    ${total_filename}     
       ${sql}=   catenate      select * from AOC_SFTP_BLACK_MULE_REQUEST_FILE_INFO WHERE FILE_NAME = '${Filenames}[${index}]_REQ.gpg'
        ${query}=   query_all     ${db_connect}     ${sql}     # query
        ${result}=   set variable    ${query[0]}
        ${DB_REQ_FILE_ID}=    set variable    ${result}[ID]
       ${sql}=   catenate      select * from AOC_SFTP_BLACK_MULE_REQUEST_FILE_DETAIL WHERE FILE_ID = '${DB_REQ_FILE_ID}' ORDER BY ROW_NUMBER ASC 
        ${query}=   query_all     ${db_connect}     ${sql}     # query
        ${result}=   set variable    ${query[0]}
        ${total_query}=   Get Length   ${query} 
        FOR    ${index}    IN RANGE    0    ${total_query}  
        ${sql}=   catenate      select * from AOC_SFTP_BLACK_MULE_REQUEST_FILE_DETAIL WHERE FILE_ID = '${DB_REQ_FILE_ID}' ORDER BY ROW_NUMBER ASC 
        ${query}=   query_all     ${db_connect}     ${sql}     # query
        ${result}=   set variable    ${query}[${index}]
        ${DB_REQ_FILE_DETAIL_ID}=    set variable    ${result}[ID]
       ${sql}=   catenate      DELETE from AOC_BLACK_MULE_CASE WHERE CREATE_FILE_DETAIL_ID = '${DB_REQ_FILE_DETAIL_ID}'
        ${query}=   update     ${db_connect}     ${sql}
       ${sql}=   catenate      DELETE from AOC_BLACK_MULE_ACCOUNT WHERE CREATE_FILE_DETAIL_ID = '${DB_REQ_FILE_DETAIL_ID}'
        ${query}=   update     ${db_connect}     ${sql}
       ${sql}=   catenate      DELETE from AOC_BLACK_MULE_PERSON WHERE CREATE_FILE_DETAIL_ID = '${DB_REQ_FILE_DETAIL_ID}'
        ${query}=   update     ${db_connect}     ${sql}
        END
       ${sql}=   catenate      DELETE from AOC_SFTP_BLACK_MULE_RESPONSE_FILE_INFO WHERE RESPONSE_FILE_NAME = '${Filenames}[${index}]_RES.gpg'
        ${query}=   update     ${db_connect}     ${sql}
       ${sql}=   catenate      DELETE from AOC_SFTP_BLACK_MULE_REQUEST_FILE_DETAIL WHERE FILE_ID = '${DB_REQ_FILE_ID}'
        ${query}=   update     ${db_connect}     ${sql}
       ${sql}=   catenate      DELETE from AOC_SFTP_BLACK_MULE_REQUEST_FILE_INFO WHERE FILE_NAME = '${Filenames}[${index}]_REQ.gpg'
        ${query}=   update     ${db_connect}     ${sql}
    END
Deleted DB REQ RES
        connect to cfr database
       ${sql}=   catenate      DELETE from AOC_SFTP_BLACK_MULE_RESPONSE_FILE_INFO WHERE RESPONSE_FILE_NAME = '${Filename_Res_blackmule}.gpg'
        ${query}=   update     ${db_connect}     ${sql}
       ${sql}=   catenate      DELETE from AOC_SFTP_BLACK_MULE_REQUEST_FILE_INFO WHERE FILE_NAME = '${Filename_Req_blackmule}.gpg'
        ${query}=   update     ${db_connect}     ${sql}

Encrypt File GPG To NITMX TH ${FILE_NAME_CSV} in file is ${txt}
    Private key and file path ${FILE_NAME_CSV}
    Set test Variable   ${PRIVATE_KEY_PATH_TO}    ${CURDIR}\\${SECAOC}.sec
    Set test Variable   ${FILEPATH_CSV}    ${CURDIR}\\Data/${FILE_NAME_CSV}.${txt}
    set test variable   ${OUT_PATH_GPG}    ${CURDIR}\\Data/${FILE_NAME_CSV}.gpg
    ${PRIVATE_KEY_PATH}=  Set Variable   ${PRIVATE_KEY_PATH_TO}
    ${FILEPATH}=  Set Variable  ${FILEPATH_CSV}
    ${input_file}  set variable    ${FILEPATH}
    ${DATA}  set variable    ${FILEPATH}
    ${output_file}  set variable   ${OUT_PATH_GPG}
    ${recipients}   set variable   ${secret_key}
    ${result}=   Sign And Encrypt Csv Th   ${PRIVATE_KEY_PATH}  ${DATA}  ${input_file}  ${output_file}  ${recipients}    ${Pass.AOC}
    ${signature}    ${output_path}=    Set Variable    ${result}
    Log    Signature: ${signature}
    Log    Output Path: ${output_path}

Encrypt File GPG To NITMX TH ${FILE_NAME_CSV} in file is ${txt} and file output is ${gpg}
    Private key and file path ${FILE_NAME_CSV}
    Set test Variable   ${PRIVATE_KEY_PATH_TO}    ${CURDIR}\\${SECAOC}.sec
    Set test Variable   ${FILEPATH_CSV}    ${CURDIR}\\Data/${FILE_NAME_CSV}.${txt}
    set test variable   ${OUT_PATH_GPG}    ${CURDIR}\\Data/${FILE_NAME_CSV}.${gpg}
    ${PRIVATE_KEY_PATH}=  Set Variable   ${PRIVATE_KEY_PATH_TO}
    ${FILEPATH}=  Set Variable  ${FILEPATH_CSV}
    ${input_file}  set variable    ${FILEPATH}
    ${DATA}  set variable    ${FILEPATH}
    ${output_file}  set variable   ${OUT_PATH_GPG}
    ${recipients}   set variable   ${secret_key}
    ${result}=   Sign And Encrypt Csv Th   ${PRIVATE_KEY_PATH}  ${DATA}  ${input_file}  ${output_file}  ${recipients}    ${Pass.AOC}
    ${signature}    ${output_path}=    Set Variable    ${result}
    Log    Signature: ${signature}
    Log    Output Path: ${output_path}

Copy file for Encrypt for case is ${condition}
      IF  '${condition}' == '5000record'
    ${prepara_filename}     Set Variable    CFR_RegistryBlackMule_5000record
    Copy File    ${CURDIR}/object5000/${prepara_filename}.csv    ${CURDIR}/Data/${Filename_Req_blackmule}.csv
      ELSE IF  '${condition}' == '10mb'
    ${prepara_filename}     Set Variable    CFR_RegistryBlackMule_10mb
    Copy File    ${CURDIR}/object5000/${prepara_filename}.csv    ${CURDIR}/Data/${Filename_Req_blackmule}.csv
      ELSE
      log    not match 
      END

Invalid signature is Encrypt File GPG To NITMX TH ${FILE_NAME_CSV}
    Private key and file path ${FILE_NAME_CSV} and input key is 
    ${PRIVATE_KEY_PATH}=  Set Variable   ${PRIVATE_KEY_PATH_TO}
    ${FILEPATH}=  Set Variable  ${FILEPATH_CSV}
    ${input_file}  set variable    ${FILEPATH}
    ${DATA}  set variable    ${FILEPATH}
    ${output_file}  set variable   ${OUT_PATH_GPG}
    ${recipients}   set variable   ${secret_key}
    # ${result}=   Sign And Encrypt Csv Th   ${PRIVATE_KEY_PATH}  ${DATA}  ${input_file}  ${output_file}  ${recipients}    ${Pass.AOC}
    ${result}=   Sign And Encrypt Csv Th   ${PRIVATE_KEY_PATH}  ${DATA}  ${input_file}  ${output_file}  ${recipients}    ${Pass.BANK002}
    ${signature}    ${output_path}=    Set Variable    ${result}
    Log    Signature: ${signature}
    Log    Output Path: ${output_path}

Invalid signature is Encrypt File GPG To NITMX TH ${FILE_NAME_CSV} Withdraw black
    Private key and file path ${FILE_NAME_CSV} json
    ${PRIVATE_KEY_PATH}=  Set Variable   ${PRIVATE_KEY_PATH_TO}
    ${FILEPATH}=  Set Variable  ${FILEPATH_CSV}
    ${input_file}  set variable    ${FILEPATH}
    ${DATA}  set variable    ${FILEPATH}
    ${output_file}  set variable   ${OUT_PATH_GPG}
    ${recipients}   set variable   ${secret_key}
    # ${result}=   Sign And Encrypt Csv Th   ${PRIVATE_KEY_PATH}  ${DATA}  ${input_file}  ${output_file}  ${recipients}    ${Pass.AOC}
    ${result}=   Sign And Encrypt Csv Th   ${PRIVATE_KEY_PATH}  ${DATA}  ${input_file}  ${output_file}  ${recipients}    ${Pass.BANK002}
    ${signature}    ${output_path}=    Set Variable    ${result}
    Log    Signature: ${signature}
    Log    Output Path: ${output_path}

Private key and file path ${FILE_NAME_CSV} and input key is 
  # Set test Variable   ${PRIVATE_KEY_PATH_TO}    ${CURDIR}\\${SECAOC}.sec
  Set test Variable   ${PRIVATE_KEY_PATH_TO}    ${CURDIR}\\private-key-002t.sec
  Set test Variable   ${FILEPATH_CSV}    ${CURDIR}\\Data/${FILE_NAME_CSV}.csv
  set test variable   ${OUT_PATH_GPG}    ${CURDIR}\\Data/${FILE_NAME_CSV}.gpg

Private key and file path ${FILE_NAME_CSV} json
  # Set test Variable   ${PRIVATE_KEY_PATH_TO}    ${CURDIR}\\${SECAOC}.sec
  Set test Variable   ${PRIVATE_KEY_PATH_TO}    ${CURDIR}\\private-key-002t.sec
  Set test Variable   ${FILEPATH_CSV}    ${CURDIR}\\Data/${FILE_NAME_CSV}.json
  set test variable   ${OUT_PATH_GPG}    ${CURDIR}\\Data/${FILE_NAME_CSV}.gpg

Query PersonalID 
        connect to cfr database
       ${sql}=   catenate      SELECT CARD_ID FROM AOC_BLACK_MULE_PERSON abmp ORDER BY CREATE_DATETIME DESC fetch first 1 rows only
        ${query}=   query_all     ${db_connect}     ${sql}     # query
        ${result}=   set variable    ${query[0]}
        ${CARD_ID}=     decrypt cfr string '${result}[CARD_ID]'
        Set Test Variable    ${PersonalID_DB}    ${CARD_ID}
        log     ${PersonalID_DB}

randomcityzen
    ${random_personalID}   generate_thai_citizen_id
    Set Test Variable    ${random_personalID}

randomcityzen digit is ${num}
    ${random_personalID}   generate_digit_citizen_id    num=${num}
    Set Test Variable    ${random_personalID}

Get Or Generate Running Number  
    [Documentation]    test case u have set ${testcase} and ${running_number} 
    Set Test Variable    ${testcase}    ${running_number}
    log    ${running_number}
    log    ${filenameDateTime_eng_v1}
    Query check test case today
    IF   ${file_count} <= 0
        Set Test Variable  ${running_number}    ${testcase}
     ${FileName}=     set variable     CFR_RegistryBlackMule_${filenameDateTime}_${running_number}
     ${directory}=     set variable     CFR_RegistryBlackMule_${filenameDateTime}_${running_number}_REQ
     ${Filename_Res_blackmule}=     set variable     CFR_RegistryBlackMule_${filenameDateTime}_${running_number}_RES
     @{list_file}=    Create List    ${FileName}
     set test variable        ${directory}
     set test variable      ${Filename_Req_blackmule}      ${directory}
     set test variable      ${Filename_Res_blackmule}
     set test variable      ${FileName}
     set test variable      ${Filenames}    ${list_file}
    ELSE
      ${running_number_random}=    random_number_warrant    3
     ${FileName}=     set variable     CFR_RegistryBlackMule_${filenameDateTime}_${running_number_random}
     ${directory}=     set variable     CFR_RegistryBlackMule_${filenameDateTime}_${running_number_random}_REQ
     ${Filename_Res_blackmule}=     set variable     CFR_RegistryBlackMule_${filenameDateTime}_${running_number_random}_RES
     set test variable        ${directory}
     set test variable      ${Filename_Req_blackmule}      ${directory}
     set test variable      ${Filename_Res_blackmule}
     set test variable      ${FileName}
        Log    Generated new running number: ${running_number}
    END
        ${running_number} =  BuiltIn.Evaluate  str(int("${running_number}") + 1).zfill(3)
        Set Suite Variable    ${running_number}
Get Text Name in Test cases 
    ${name}=       Set Variable     ${TEST NAME}
    ${matches}=    Get Regexp Matches    ${name}    \\d+
    # ${matches_re}=    Replace String     ${matches[0]}    _\\d+    \\d+
    ${case_no}=    Set Variable     ${matches[1]}
    Log            Case No is: ${case_no}
    Set Test Variable    ${testcase}    ${case_no}

Query check test case today 
    connect to cfr database
    ${sql}=   Catenate    SELECT COUNT(*) FROM AOC_SFTP_BLACK_MULE_REQUEST_FILE_INFO WHERE TRUNC(CREATE_DATETIME) = TO_DATE('${filenameDateTime_eng_v1}', 'YYYY-MM-DD') AND FILE_NAME LIKE 'CFR_RegistryBlackMule_25680404_${testcase}_REQ.gpg'
    ${query}=   query_all    ${db_connect}    ${sql}     # query
    ${result_dict} =    Get From List    ${query}    0
    ${file_count} =    Get From Dictionary    ${result_dict}    COUNT(*)
    Set Test Variable    ${file_count}
    Log    File count: ${file_count}

Chose to create file name black mule ${chose}
    IF    '${chose}' == 'step_runing_number'
        create File Name black mule V1
    ELSE IF    '${chose}' == 'file_random'
        create File Name black mule
    ELSE IF    '${chose}' == 'invali_file_name'
         ${result}=    Run Keyword And Ignore Error    Set Variable    ${running_number}
         Run Keyword If    '${result[0]}' == 'FAIL'    create File Name black mule and validate file name is invali_file_name_not_running_number
         ...    ELSE    create File Name black mule and validate file name is invali_file_name
    ELSE IF    '${chose}' == 'invali_file_name_datetime'
         ${result}=    Run Keyword And Ignore Error    Set Variable    ${running_number}
         Run Keyword If    '${result[0]}' == 'FAIL'    create File Name black mule and validate file name is invali_file_name_datetime_not_running_number
         ...    ELSE    create File Name black mule and validate file name is invali_file_name_datetime
    ELSE IF    '${chose}' == 'invali_file_name_runing_2dig'
         ${result}=    Run Keyword And Ignore Error    Set Variable    ${running_number}
         Run Keyword If    '${result[0]}' == 'FAIL'    create File Name black mule and validate file name is invali_file_name_runing_2dig_not_running_number
         ...    ELSE    create File Name black mule and validate file name is invali_file_name_runing_2dig
    ELSE IF    '${chose}' == 'invali_file_name_datetime_file'
         ${result}=    Run Keyword And Ignore Error    Set Variable    ${running_number}
         Run Keyword If    '${result[0]}' == 'FAIL'    create File Name black mule and validate file name is invali_file_name_datetime_file_not_running_number
         ...    ELSE    create File Name black mule and validate file name is invali_file_name_datetime_file
    ELSE IF    '${chose}' == 'invali_file_name_req_to_res'
         ${result}=    Run Keyword And Ignore Error    Set Variable    ${running_number}
         Run Keyword If    '${result[0]}' == 'FAIL'    create File Name black mule and validate file name is invali_file_name_req_to_res_not_running_number
         ...    ELSE    create File Name black mule and validate file name is invali_file_name_req_to_res
    ELSE IF    '${chose}' == 'invali_file_name_date_on_future'
         ${result}=    Run Keyword And Ignore Error    Set Variable    ${running_number}
         Run Keyword If    '${result[0]}' == 'FAIL'    create File Name black mule and validate file name is invali_file_name_date_on_future_not_running_number
         ...    ELSE    create File Name black mule and validate file name is invali_file_name_date_on_future
    ELSE IF    '${chose}' == 'invali_file_name_date_on_year_eng'
         ${result}=    Run Keyword And Ignore Error    Set Variable    ${running_number}
         Run Keyword If    '${result[0]}' == 'FAIL'    create File Name black mule and validate file name is invali_file_name_date_on_year_eng_not_running_number
         ...    ELSE    create File Name black mule and validate file name is invali_file_name_date_on_year_eng
    ELSE IF    '${chose}' == 'run number 400 - 600'
         create File withdraw black mule
    ELSE
        Log  should be not match : ${chose}
    END
Invalid create file name black mule ${chose}
    IF    '${chose}' == 'Invalid_Format_file_name'
         Invalid create File withdraw black mule in case ${chose}
    ELSE IF    '${chose}' == 'Invalid_Format_file_name_contain_unsup'
         Invalid create File withdraw black mule in case ${chose}
    ELSE IF    '${chose}' == 'Invalid_Format_file_name_not_REQ'
         Invalid create File withdraw black mule in case ${chose}
    ELSE IF    '${chose}' == 'Invalid_Format_file_name_date_character'
         Invalid create File withdraw black mule in case ${chose}
    ELSE IF    '${chose}' == 'Invalid_Format_file_name_date_character_thai'
         Invalid create File withdraw black mule in case ${chose}
    ELSE IF    '${chose}' == 'Invalid_Format_file_name_runing_2dig'
         Invalid create File withdraw black mule in case ${chose}
    ELSE IF    '${chose}' == 'Invalid_Format_file_name_runing_4dig'
         Invalid create File withdraw black mule in case ${chose}
    ELSE IF    '${chose}' == 'Invalid_Format_file_name_dose_not_sys'
         Invalid create File withdraw black mule in case ${chose}
    ELSE IF    '${chose}' == 'Invalid_Format_file_name_date_eng'
         Invalid create File withdraw black mule in case ${chose}
    ELSE IF    '${chose}' == 'Invalid_Format_file_name_month'
         Invalid create File withdraw black mule in case ${chose}
    ELSE IF    '${chose}' == 'Invalid_Format_file_name_day'
         Invalid create File withdraw black mule in case ${chose}
    ELSE IF    '${chose}' == 'Invalid_Format_file_name_year'
         Invalid create File withdraw black mule in case ${chose}
    ELSE
        Log  should be not match : ${chose}
    END
should be equal req and res
    Should Be Equal As Strings    ${case_id_Req}    ${case_id_Res}
    Should Be Equal As Strings    ${accountno_Req}    ${accountno_Res}
    Should Be Equal As Strings    ${bankcode_Req}    ${bankcode_Res}
    Should Be Equal As Strings    ${card_id_Req}    ${card_id_Res}
    Should Be Equal As Strings    ${ref_code_Req}    ${ref_code_Res}

Check Response Code Black Mule Validate Data REQ to RES 
    ${file_req}    OperatingSystem.Get File  ${CURDIR}/Data/${Filename_Req_blackmule}.csv    encoding=UTF-8
    ${lines}    Split To Lines    ${file_req}
    ${lines}=    Get Slice From List    ${lines}    1    #ข้ามrowแรก header 
    ${csv_list}=   Read Csv File To List      ${CSV_FILE}
    ${lines_res}=    Get Slice From List    ${csv_list}    1    #ข้ามrowแรก header 
    ${total_res}=   Get Length   ${lines_res}
    ${total_req}    Get Length    ${lines}
    FOR  ${index}    IN RANGE    0    ${total_req}       
        ${data_total}=    Get From List   ${lines}    ${index}
          ${split_data}=    Split String    ${data_total}    |
         ${case_id_Req}=         Get From List    ${split_data}    0
        ${accountno_Req}=        Get From List    ${split_data}    3
         ${bankcode_Req}=         Get From List    ${split_data}    5
        ${card_id_Req}=        Get From List    ${split_data}    9
        ${ref_code_Req}=        Get From List    ${split_data}    10
        # res
          ${data_total_res}=    Get From List   ${lines_res}    ${index}
          ${data_responcode}=    Get From List   ${data_total_res}    0
          ${split_data_res}=    Split String    ${data_responcode}    ;
         ${case_id_Res}=         Get From List    ${split_data_res}    0
         ${accountno_Res}=        Get From List    ${split_data_res}    1
         ${bankcode_Res}=         Get From List    ${split_data_res}    2
        ${card_id_Res}=        Get From List    ${split_data_res}    3
        ${ref_code_Res}=        Get From List    ${split_data_res}    4
    Should Be Equal As Strings    ${case_id_Req}    ${case_id_Res}
    Should Be Equal As Strings    ${accountno_Req}    ${accountno_Res}
    Should Be Equal As Strings    ${bankcode_Req}    ${bankcode_Res}
    Should Be Equal As Strings    ${card_id_Req}    ${card_id_Res}
    Should Be Equal As Strings    ${ref_code_Req}    ${ref_code_Res}
    END

Check Response Code Black Mule Validate Data REQ to RES for Negative
    # --- อ่านไฟล์ REQ ด้วย UTF-8 ---
    ${file_req}=    OperatingSystem.Get File    ${CURDIR}/Data/${Filename_Req_blackmule}.csv    encoding=UTF-8
    ${lines}=    Split To Lines    ${file_req}
    ${lines}=    Get Slice From List    ${lines}    1    # ข้าม header row

    # --- อ่านไฟล์ RES ด้วย UTF-8 ---
    ${file_res}=    OperatingSystem.Get File    ${CSV_FILE}    encoding=UTF-8
    ${lines_res}=    Split To Lines    ${file_res}
    ${lines_res}=    Get Slice From List    ${lines_res}    1

    ${total_res}=   Get Length   ${lines_res}
    ${total_req}=   Get Length   ${lines}

    FOR    ${index}    IN RANGE    0    ${total_req}
        # --- ดึงข้อมูล REQ ---
        ${data_total}=    Get From List    ${lines}    ${index}
        ${split_data}=    Split String    ${data_total}    |
        ${case_id_Req}=        Get From List    ${split_data}    0
        ${accountno_Req}=     Get From List    ${split_data}    3
        ${bankcode_Req}=      Get From List    ${split_data}    5
        ${card_id_Req}=       Get From List    ${split_data}    9
        ${ref_code_Req}=      Get From List    ${split_data}    10
        Set Test Variable    ${case_id_Req}
        Set Test Variable    ${accountno_Req}
        Set Test Variable    ${bankcode_Req}
        Set Test Variable    ${card_id_Req}
        Set Test Variable    ${ref_code_Req}
        # --- ดึงข้อมูล RES ---
        ${data_total_res}=    Get From List    ${lines_res}    ${index}
        ${split_data_res}=    Split String    ${data_total_res}    ;
        ${case_id_Res}=       Get From List    ${split_data_res}    0
        ${accountno_Res}=     Get From List    ${split_data_res}    1
        ${bankcode_Res}=      Get From List    ${split_data_res}    2
        ${card_id_Res}=       Get From List    ${split_data_res}    3
        ${ref_code_Res}=      Get From List    ${split_data_res}    4
        ${status_code_Res}=   Get From List    ${split_data_res}    6
        Set Test Variable    ${case_id_Res}
        Set Test Variable    ${accountno_Res}
        Set Test Variable    ${bankcode_Res}
        Set Test Variable    ${card_id_Res}
        Set Test Variable    ${ref_code_Res}
        
    IF    '${status_code_Res}' == 'SUCCESS'
        should be equal req and res
    ELSE IF    '${status_code_Res}' == 'Invalid format: ref_code'
    Should Be Equal As Strings    ${case_id_Req}    ${case_id_Res}
    Should Be Equal As Strings    ${accountno_Req}    ${accountno_Res}
    Should Be Equal As Strings    ${bankcode_Req}    ${bankcode_Res}
    Should Be Equal As Strings    ${card_id_Req}    ${card_id_Res}
    Should Contain    ${ref_code_Req}    ${ref_code_Res}
    ELSE IF    '${status_code_Res}' == 'Invalid format: accountno'
    Should Be Equal As Strings    ${case_id_Req}    ${case_id_Res}
    Should Contain    ${accountno_Req}    ${accountno_Res}
    Should Be Equal As Strings    ${bankcode_Req}    ${bankcode_Res}
    Should Be Equal As Strings    ${card_id_Req}    ${card_id_Res}
    Should Be Equal As Strings    ${ref_code_Req}    ${ref_code_Res}
    ELSE IF    '${status_code_Res}' == 'Invalid format: case_id'
    Should Contain    ${case_id_Req}    ${case_id_Res}
    Should Be Equal As Strings    ${accountno_Req}    ${accountno_Res}
    Should Be Equal As Strings    ${bankcode_Req}    ${bankcode_Res}
    Should Be Equal As Strings    ${card_id_Req}    ${card_id_Res}
    Should Be Equal As Strings    ${ref_code_Req}    ${ref_code_Res}
    ELSE IF    '${status_code_Res}' == 'Invalid format: card_id'
    Should Be Equal As Strings    ${case_id_Req}    ${case_id_Res}
    Should Be Equal As Strings    ${accountno_Req}    ${accountno_Res}
    Should Be Equal As Strings    ${bankcode_Req}    ${bankcode_Res}
    Should Contain    ${card_id_Req}    ${card_id_Res}
    Should Be Equal As Strings    ${ref_code_Req}    ${ref_code_Res}
    ELSE IF    '${status_code_Res}' == 'Invalid format: bankcode'
    Should Be Equal As Strings    ${case_id_Req}    ${case_id_Res}
    Should Be Equal As Strings    ${accountno_Req}    ${accountno_Res}
    Should Contain    ${bankcode_Req}    ${bankcode_Res}
    Should Be Equal As Strings    ${card_id_Req}    ${card_id_Res}
    Should Be Equal As Strings    ${ref_code_Req}    ${ref_code_Res}
    ELSE IF    '${status_code_Res}' == 'Missing required field: case_id'
    Should Be Equal As Strings    -    ${case_id_Res}
    Should Be Equal As Strings    ${accountno_Req}    ${accountno_Res}
    Should Be Equal As Strings    ${bankcode_Req}    ${bankcode_Res}
    Should Be Equal As Strings    ${card_id_Req}    ${card_id_Res}
    Should Be Equal As Strings    ${ref_code_Req}    ${ref_code_Res}
    ELSE IF    '${status_code_Res}' == 'Missing required field: accountno'
    Should Be Equal As Strings    ${case_id_Req}    ${case_id_Res}
    Should Be Equal As Strings    -    ${accountno_Res}
    Should Be Equal As Strings    ${bankcode_Req}    ${bankcode_Res}
    Should Be Equal As Strings    ${card_id_Req}    ${card_id_Res}
    Should Be Equal As Strings    ${ref_code_Req}    ${ref_code_Res}
    ELSE IF    '${status_code_Res}' == 'Missing required field: bankcode'
    Should Be Equal As Strings    ${case_id_Req}    ${case_id_Res}
    Should Be Equal As Strings    ${accountno_Req}    ${accountno_Res}
    Should Be Equal As Strings    -    ${bankcode_Res}
    Should Be Equal As Strings    ${card_id_Req}    ${card_id_Res}
    Should Be Equal As Strings    ${ref_code_Req}    ${ref_code_Res}
    ELSE IF    '${status_code_Res}' == 'Missing required field: card_id'
    Should Be Equal As Strings    ${case_id_Req}    ${case_id_Res}
    Should Be Equal As Strings    ${accountno_Req}    ${accountno_Res}
    Should Be Equal As Strings    ${bankcode_Req}    ${bankcode_Res}
    Should Be Equal As Strings    -    ${card_id_Res}
    Should Be Equal As Strings    ${ref_code_Req}    ${ref_code_Res}
    ELSE IF    '${status_code_Res}' == 'Missing required field: ref_code'
    Should Be Equal As Strings    ${case_id_Req}    ${case_id_Res}
    Should Be Equal As Strings    ${accountno_Req}    ${accountno_Res}
    Should Be Equal As Strings    ${bankcode_Req}    ${bankcode_Res}
    Should Be Equal As Strings    ${card_id_Req}    ${card_id_Res}
    Should Be Equal As Strings    -    ${ref_code_Res}
    ELSE IF    '${status_code_Res}' == 'Missing required field: case_date'
    should be equal req and res
    ELSE IF    '${status_code_Res}' == 'Missing required field: case_type'
    should be equal req and res
    ELSE IF    '${status_code_Res}' == 'Missing required field: accounttype'
    should be equal req and res
    ELSE IF    '${status_code_Res}' == 'Missing required field: bankname'
    should be equal req and res
    ELSE IF    '${status_code_Res}' == 'Missing required field: entity_type'
    should be equal req and res
    ELSE IF    '${status_code_Res}' == 'Missing required field: id_type'
    should be equal req and res
    ELSE IF    '${status_code_Res}' == 'Missing required field: name'
    should be equal req and res
    ELSE IF    '${status_code_Res}' == 'Missing required field: surname'
    should be equal req and res
    ELSE IF    '${status_code_Res}' == 'Missing required field: aml_report_date'
    should be equal req and res
    ELSE IF    '${status_code_Res}' == 'Invalid value condition: case_date'
    should be equal req and res
    ELSE IF    '${status_code_Res}' == 'Invalid format: accounttype'
    should be equal req and res
    ELSE IF    '${status_code_Res}' == 'Invalid format: case_date'
    should be equal req and res
    ELSE IF    '${status_code_Res}' == 'Invalid format: case_type'
    should be equal req and res
    ELSE IF    '${status_code_Res}' == 'Invalid format: entity_type'
    should be equal req and res
    ELSE IF    '${status_code_Res}' == 'Invalid format: bankname'
    should be equal req and res
    ELSE IF    '${status_code_Res}' == 'Invalid format: nationality'
    should be equal req and res
    ELSE IF    '${status_code_Res}' == 'Invalid format: title'
    should be equal req and res
    ELSE IF    '${status_code_Res}' == 'Invalid format: name'
    should be equal req and res
    ELSE IF    '${status_code_Res}' == 'Invalid format: midname'
    should be equal req and res
    ELSE IF    '${status_code_Res}' == 'Invalid format: surname'
    should be equal req and res
    ELSE IF    '${status_code_Res}' == 'Invalid format: eng_name'
    should be equal req and res
    ELSE IF    '${status_code_Res}' == 'Invalid format: eng_midname'
    should be equal req and res
    ELSE IF    '${status_code_Res}' == 'Invalid format: eng_surname'
    should be equal req and res
    ELSE IF    '${status_code_Res}' == 'Invalid format: birth_date'
    should be equal req and res
    ELSE IF    '${status_code_Res}' == 'Invalid format: note'
    should be equal req and res
    ELSE IF    '${status_code_Res}' == 'Invalid format: id_type'
    should be equal req and res
    ELSE IF    '${status_code_Res}' == 'Invalid format: other'
    should be equal req and res
    ELSE IF    '${status_code_Res}' == 'Invalid format: rank'
    should be equal req and res
    ELSE IF    '${status_code_Res}' == 'Invalid format: pol_name'
    should be equal req and res
    ELSE IF    '${status_code_Res}' == 'Invalid format: pol_surname'
    should be equal req and res
    ELSE IF    '${status_code_Res}' == 'Invalid format: pol_job_title'
    should be equal req and res
    ELSE IF    '${status_code_Res}' == 'Invalid format: pol_org'
    should be equal req and res
    ELSE IF    '${status_code_Res}' == 'Invalid format: pol_tel'
    should be equal req and res
    ELSE IF    '${status_code_Res}' == 'Invalid format: pol_aml_report_date'
    should be equal req and res
    ELSE IF    '${status_code_Res}' == 'Invalid format: aml_report_date'
    should be equal req and res
    ELSE IF    '${status_code_Res}' == 'Invalid value condition: aml_report_date'
    should be equal req and res
    ELSE IF    '${status_code_Res}' == 'Invalid value condition: case_type'
    should be equal req and res
    ELSE IF    '${status_code_Res}' == 'Invalid value condition: entity_type'
    should be equal req and res
    ELSE IF    '${status_code_Res}' == 'Invalid value condition: id_type'
    should be equal req and res
    ELSE IF    '${status_code_Res}' == 'Invalid value condition: surname'
    should be equal req and res
    ELSE IF    '${status_code_Res}' == 'Invalid value condition: bankcode'
    should be equal req and res
    ELSE IF    '${status_code_Res}' == 'Invalid value condition: bankname'
    should be equal req and res
    ELSE IF    '${status_code_Res}' == 'INVALID_HEADER_CSV_FILE_FORMAT'
    Should Be Equal As Strings    -    ${case_id_Res}
    Should Be Equal As Strings    -    ${accountno_Res}
    Should Be Equal As Strings    -    ${bankcode_Res}
    Should Be Equal As Strings    -    ${card_id_Res}
    Should Be Equal As Strings    -    ${ref_code_Res}
    ELSE IF    '${status_code_Res}' == 'INVALID_FILE_STRUCTURE'
    Should Be Equal As Strings    -    ${case_id_Res}
    Should Be Equal As Strings    -    ${accountno_Res}
    Should Be Equal As Strings    -    ${bankcode_Res}
    Should Be Equal As Strings    -    ${card_id_Res}
    Should Be Equal As Strings    -    ${ref_code_Res}
    ELSE IF    '${status_code_Res}' == 'INVALID_FILE_NAME_FORMAT'
    Should Be Equal As Strings    -    ${case_id_Res}
    Should Be Equal As Strings    -    ${accountno_Res}
    Should Be Equal As Strings    -    ${bankcode_Res}
    Should Be Equal As Strings    -    ${card_id_Res}
    Should Be Equal As Strings    -    ${ref_code_Res}
    ELSE IF    '${status_code_Res}' == 'INVALID_DATE_ON_FILENAME'
    Should Be Equal As Strings    -    ${case_id_Res}
    Should Be Equal As Strings    -    ${accountno_Res}
    Should Be Equal As Strings    -    ${bankcode_Res}
    Should Be Equal As Strings    -    ${card_id_Res}
    Should Be Equal As Strings    -    ${ref_code_Res}
    ELSE IF    '${status_code_Res}' == 'FILE_EXCEED_LIMIT'
    Should Be Equal As Strings    -    ${case_id_Res}
    Should Be Equal As Strings    -    ${accountno_Res}
    Should Be Equal As Strings    -    ${bankcode_Res}
    Should Be Equal As Strings    -    ${card_id_Res}
    Should Be Equal As Strings    -    ${ref_code_Res}
    ELSE IF    '${status_code_Res}' == 'DUPLICATE_FILENAME'
    Should Be Equal As Strings    -    ${case_id_Res}
    Should Be Equal As Strings    -    ${accountno_Res}
    Should Be Equal As Strings    -    ${bankcode_Res}
    Should Be Equal As Strings    -    ${card_id_Res}
    Should Be Equal As Strings    -    ${ref_code_Res}
    ELSE IF    '${status_code_Res}' == 'INVALID_FILE_FORMAT'
    Should Be Equal As Strings    -    ${case_id_Res}
    Should Be Equal As Strings    -    ${accountno_Res}
    Should Be Equal As Strings    -    ${bankcode_Res}
    Should Be Equal As Strings    -    ${card_id_Res}
    Should Be Equal As Strings    -    ${ref_code_Res}
    ELSE IF    '${status_code_Res}' == 'INVALID_SIGNATURE'
    Should Be Equal As Strings    -    ${case_id_Res}
    Should Be Equal As Strings    -    ${accountno_Res}
    Should Be Equal As Strings    -    ${bankcode_Res}
    Should Be Equal As Strings    -    ${card_id_Res}
    Should Be Equal As Strings    -    ${ref_code_Res}
    ELSE IF    '${status_code_Res}' == 'RECORD_EXCEED_LIMIT'
    Should Be Equal As Strings    -    ${case_id_Res}
    Should Be Equal As Strings    -    ${accountno_Res}
    Should Be Equal As Strings    -    ${bankcode_Res}
    Should Be Equal As Strings    -    ${card_id_Res}
    Should Be Equal As Strings    -    ${ref_code_Res}
    ELSE
         Fail    not match key is : ${status_code_Res}
    END

    END

Prepare Json From to black mule
    ${json_string}=    Catenate    SEPARATOR=\n
    ...    [
    ...    {
    ...        "declare_uuid": "${uuid}",
    ...        "declare_type_code": "${de_type_code}", 
    ...        "declare_type": "${de_type}",
    ...        "withdraw_date": "${CREATE_DATETIME_THAI}",
    ...        "declare_reason_code": "${ran_declare_reason_code}",
    ...        "declare_reason": "${ran_declare_reason}",
    ...        "declare_note": "${de_note}",
    ...        "mule_ref_code": "${REF_CODE}",
    ...        "mule_identity_id": "${PERSONAL_ID}",
    ...        "mule_identity_type": "${iden_type}",
    ...        "mule_title": "${TITLE}",
    ...        "mule_name": "${FIRST_NAME}",
    ...        "mule_surname": "${LAST_NAME}",
    ...        "mule_birth_date": "${BIRTH_DATE_THAI}",
    ...        "mule_nationality": "${NATIONALITY}",
    ...        "police_case_detail": [
    ...            {
    ...                "police_case_id": "${po_case_id}",
    ...                "police_case_type": "${po_case_type}",
    ...                "police_case_report_date": "${po_case_rp_date}",
    ...                "mule_account_detail": [
    ...                    {
    ...                        "mule_account_no": "${ACCOUNT_NUMBER}",
    ...                        "mule_account_type": "${ACCOUNT_TYPE}",
    ...                        "mule_account_bankcode": "${BANK_CODE}",
    ...                        "mule_account_bankname": "${BANK_NAME}"
    ...                    }
    ...                ],
    ...                "police_info": {
    ...                    "police_rank": "${po_rank}",
    ...                    "police_name": "${po_name}",
    ...                    "police_surname": "${po_surname}",
    ...                    "police_job_title": "${po_job_title}",
    ...                    "police_org": "${po_org}",
    ...                    "police_tel": "${po_tel}",
    ...                    "police_email": "${po_email}"
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
Prepare Json From to black mule for validate missing parameter field is ${field}
    ${json_string}=    Catenate    SEPARATOR=\n
    ...    [
    ...    {
    ...        "declare_uuid": "${uuid}",
    ...        "declare_type_code": "${de_type_code}", 
    ...        "declare_type": "${de_type}",
    ...        "withdraw_date": "${CREATE_DATETIME_THAI}",
    ...        "declare_reason_code": "${ran_declare_reason_code}",
    ...        "declare_reason": "${ran_declare_reason}",
    ...        "declare_note": "${de_note}",
    ...        "mule_ref_code": "${REF_CODE}",
    ...        "mule_identity_id": "${PERSONAL_ID}",
    ...        "mule_identity_type": "${iden_type}",
    ...        "mule_title": "${TITLE}",
    ...        "mule_name": "${FIRST_NAME}",
    ...        "mule_surname": "${LAST_NAME}",
    ...        "mule_birth_date": "${BIRTH_DATE_THAI}",
    ...        "mule_nationality": "${NATIONALITY}",
    ...        "police_case_detail": [
    ...            {
    ...                "police_case_id": "${po_case_id}",
    ...                "police_case_type": "${po_case_type}",
    ...                "police_case_report_date": "${po_case_rp_date}",
    ...                "mule_account_detail": [
    ...                    {
    ...                        "mule_account_no": "${ACCOUNT_NUMBER}",
    ...                        "mule_account_type": "${ACCOUNT_TYPE}",
    ...                        "mule_account_bankcode": "${BANK_CODE}",
    ...                        "mule_account_bankname": "${BANK_NAME}"
    ...                    }
    ...                ],
    ...                "police_info": {
    ...                    "police_rank": "${po_rank}",
    ...                    "police_name": "${po_name}",
    ...                    "police_surname": "${po_surname}",
    ...                    "police_job_title": "${po_job_title}",
    ...                    "police_org": "${po_org}",
    ...                    "police_tel": "${po_tel}",
    ...                    "police_email": "${po_email}"
    ...                }
    ...            }
    ...        ]
    ...    }
    ...    ]
     Set Test Variable  ${json_string}
    IF  '${field}' == 'Invalid_Missing_Parameter_field_uuid'    
    ${json_string}  Replace String    ${json_string}    "declare_uuid": "${uuid}",    ${EMPTY}
    ELSE IF  '${field}' == 'Invalid_Parameter_field_uuid_null'     # Python ใช้ None แทน null 
    ${json_string}  Replace String    ${json_string}    "declare_uuid": "${uuid}",        "declare_uuid": None, 
    ELSE IF  '${field}' == 'Valid_Parameter_field_mule_tilte_and_birthdate_null'
    ${json_string}  Replace String    ${json_string}    "mule_title": "${TITLE}",        "mule_title": None, 
    ${json_string}  Replace String    ${json_string}    "mule_birth_date": "${BIRTH_DATE_THAI}",        "mule_birth_date": None,
    ELSE IF  '${field}' == 'Invalid_Missing_Parameter_field_de_type_code'
    ${json_string}  Replace String    ${json_string}    "declare_type_code": "${de_type_code}",     ${EMPTY} 
    ELSE IF  '${field}' == 'Invalid_Missing_Parameter_field_de_type'
    ${json_string}  Replace String    ${json_string}    "declare_type": "${de_type}",     ${EMPTY} 
    ELSE IF  '${field}' == 'Invalid_Missing_Parameter_field_withdraw_date'
    ${json_string}  Replace String    ${json_string}    "withdraw_date": "${CREATE_DATETIME_THAI}",     ${EMPTY} 
    ELSE IF  '${field}' == 'Invalid_Missing_Parameter_field_de_reason_code'
    ${json_string}  Replace String    ${json_string}    "declare_reason_code": "${ran_declare_reason_code}",     ${EMPTY} 
    ELSE IF  '${field}' == 'Invalid_Missing_Parameter_field_de_reason'
    ${json_string}  Replace String    ${json_string}    "declare_reason": "${ran_declare_reason}",     ${EMPTY} 
    ELSE IF  '${field}' == 'Invalid_Missing_Parameter_field_de_note'
    ${json_string}  Replace String    ${json_string}    "declare_note": "${de_note}",     ${EMPTY} 
    ELSE IF  '${field}' == 'Invalid_Missing_Parameter_field_mule_ref_code'
    ${json_string}  Replace String    ${json_string}    "mule_ref_code": "${REF_CODE}",     ${EMPTY} 
    ELSE IF  '${field}' == 'Invalid_Missing_Parameter_field_mule_iden_id'
    ${json_string}  Replace String    ${json_string}    "mule_identity_id": "${PERSONAL_ID}",     ${EMPTY} 
    ELSE IF  '${field}' == 'Invalid_Missing_Parameter_field_mule_iden_type'
    ${json_string}  Replace String    ${json_string}    "mule_identity_type": "${iden_type}",     ${EMPTY} 
    ELSE IF  '${field}' == 'Invalid_Missing_Parameter_field_mule_name'
    ${json_string}  Replace String    ${json_string}    "mule_name": "${FIRST_NAME}",     ${EMPTY} 
    ELSE IF  '${field}' == 'Invalid_Missing_Parameter_field_mule_surname'
    ${json_string}  Replace String    ${json_string}    "mule_surname": "${LAST_NAME}",     ${EMPTY} 
    ELSE IF  '${field}' == 'Invalid_Missing_Parameter_field_mule_nationality'
    ${json_string}  Replace String    ${json_string}    "mule_nationality": "${NATIONALITY}",     ${EMPTY} 
    ELSE IF  '${field}' == 'Invalid_Missing_Parameter_field_po_case_id'
    ${json_string}  Replace String    ${json_string}    "police_case_id": "${po_case_id}",     ${EMPTY} 
    ELSE IF  '${field}' == 'Invalid_Missing_Parameter_field_po_case_type'
    ${json_string}  Replace String    ${json_string}    "police_case_type": "${po_case_type}",     ${EMPTY} 
    ELSE IF  '${field}' == 'Invalid_Missing_Parameter_field_po_case_rp_date'
    ${json_string}  Replace String    ${json_string}    "police_case_report_date": "${po_case_rp_date}",     ${EMPTY} 
    ELSE IF  '${field}' == 'Invalid_Missing_Parameter_field_mule_acc_no'
    ${json_string}  Replace String    ${json_string}    "mule_account_no": "${ACCOUNT_NUMBER}",     ${EMPTY} 
    ELSE IF  '${field}' == 'Invalid_Missing_Parameter_field_mule_acc_type'
    ${json_string}  Replace String    ${json_string}    "mule_account_type": "${ACCOUNT_TYPE}",     ${EMPTY} 
    ELSE IF  '${field}' == 'Invalid_Missing_Parameter_field_mule_acc_bankcode'
    ${json_string}  Replace String    ${json_string}    "mule_account_bankcode": "${BANK_CODE}",     ${EMPTY} 
    ELSE IF  '${field}' == 'Invalid_Missing_Parameter_field_mule_acc_bankname'
    ${json_string}  Replace String    ${json_string}    "mule_account_bankname": "${BANK_NAME}"     ${EMPTY} 
    ELSE IF  '${field}' == 'Invalid_Missing_Parameter_field_po_rank'
    ${json_string}  Replace String    ${json_string}    "police_rank": "${po_rank}",     ${EMPTY} 
    ELSE IF  '${field}' == 'Invalid_Missing_Parameter_field_po_name'
    ${json_string}  Replace String    ${json_string}    "police_name": "${po_name}",     ${EMPTY} 
    ELSE IF  '${field}' == 'Invalid_Missing_Parameter_field_po_surname'
    ${json_string}  Replace String    ${json_string}    "police_surname": "${po_surname}",     ${EMPTY} 
    ELSE IF  '${field}' == 'Invalid_Missing_Parameter_field_po_job_title'
    ${json_string}  Replace String    ${json_string}    "police_job_title": "${po_job_title}",     ${EMPTY} 
    ELSE IF  '${field}' == 'Invalid_Missing_Parameter_field_po_org'
    ${json_string}  Replace String    ${json_string}    "police_org": "${po_org}",     ${EMPTY} 
    ELSE IF  '${field}' == 'Invalid_Missing_Parameter_field_po_tel'
    ${json_string}  Replace String    ${json_string}    "police_tel": "${po_tel}",     ${EMPTY} 
    ELSE IF  '${field}' == 'Invalid_Missing_Parameter_field_po_email'
    ${json_string}  Replace String    ${json_string}    "police_email": "${po_email}"     ${EMPTY} 
    ELSE IF  '${field}' == 'Valid_Missing_Parameter_field_mule_title'
    ${json_string}  Replace String    ${json_string}    "mule_title": "${TITLE}",     ${EMPTY} 
    ELSE IF  '${field}' == 'Valid_Missing_Parameter_field_mule_birth_date'
    ${json_string}  Replace String    ${json_string}    "mule_birth_date": "${BIRTH_DATE_THAI}",     ${EMPTY} 
    ELSE IF  '${field}' == 'Invalid_Non_Processable_with_typecode'
    ${json_string}  Replace String    ${json_string}    "declare_type_code": "${de_type_code}",     "declare_type_code": ${de_type_code}, 
    END
     ${json_string}=    Evaluate    json.dumps(${json_string}, ensure_ascii=False, indent=4)    json
    #  Log To Console    ${json_string}
     ${encoded_data}=   Encode String To Bytes    ${json_string}    encoding=UTF-8
     Set Test Variable     ${encoded_data}
formatJson
    ${json_string}=    Catenate    SEPARATOR=
    ...    [
    ...    
    ...    ]
    Create File    ${CURDIR}/Data/${directory}.json    ${json_string}
formatJsonData
    ${json_string}=    Catenate    SEPARATOR=
    ...    {
    ...        "declare_uuid": "${uuid}",
    ...        "declare_type_code": "${de_type_code}",
    ...        "declare_type": "${de_type}",
    ...        "withdraw_date": "${CREATE_DATETIME_THAI}",
    ...        "declare_reason_code": "${ran_declare_reason_code}",
    ...        "declare_reason": "${ran_declare_reason}",
    ...        "declare_note": "${de_note}",
    ...        "mule_ref_code": "${REF_CODE}",
    ...        "mule_identity_id": "${PERSONAL_ID}",
    ...        "mule_identity_type": "${iden_type}",
    ...        "mule_title": "${TITLE}",
    ...        "mule_name": "${FIRST_NAME}",
    ...        "mule_surname": "${LAST_NAME}",
    ...        "mule_birth_date": "${BIRTH_DATE_THAI}",
    ...        "mule_nationality": "${NATIONALITY}",
    ...        "police_case_detail": [{
    ...            "police_case_id": "${po_case_id}",
    ...            "police_case_type": "${po_case_type}",
    ...            "police_case_report_date": "${po_case_rp_date}",
    ...            "mule_account_detail": [{
    ...                "mule_account_no": "${ACCOUNT_NUMBER}",
    ...                "mule_account_type": "${ACCOUNT_TYPE}",
    ...                "mule_account_bankcode": "${BANK_CODE}",
    ...                "mule_account_bankname": "${BANK_NAME}"
    ...            }],
    ...            "police_info": {
    ...                "police_rank": "${po_rank}",
    ...                "police_name": "${po_name}",
    ...                "police_surname": "${po_surname}",
    ...                "police_job_title": "${po_job_title}",
    ...                "police_org": "${po_org}",
    ...                "police_tel": "${po_tel}",
    ...                "police_email": "${po_email}"
    ...            }
    ...        }]
    ...    }
    ${json_data}=    Evaluate    json.loads('''${json_string}''')    json
    Append To List    ${json_data_list}    ${json_data}
    ${json_string}=    Evaluate    json.dumps(${json_data_list}, ensure_ascii=False, indent=4)    json
    Set Test Variable    ${json_string}
    ${encoded_data}=   Encode String To Bytes    ${json_string}    encoding=UTF-8
    Set Test Variable   ${encoded_data}

Replace string to create file withdraw black mule
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
PreparaData withdraw black mule ${data}
        connect to cfr database
       ${sql}=   catenate    select * from AOC_BLACK_MULE_PERSON PS
...    join AOC_BLACK_MULE_ACCOUNT AC on PS.ID = AC.BLACK_MULE_PERSON_ID
...    join AOC_BLACK_MULE_CASE CAE on AC.ID = CAE.BLACK_MULE_ACCOUNT_ID
...    where NOTE = 'AUTODATA' AND STATUS = 'ACTIVE'
...    FETCH FIRST ${data} ROWS ONLY
        ${query}=   query_all     ${db_connect}     ${sql}     # query
        set test variable    ${query}
PreparaData withdraw black mule Identity ID is ${note} ${data}
        connect to cfr database
       ${sql}=   catenate    select * from AOC_BLACK_MULE_PERSON PS
...    join AOC_BLACK_MULE_ACCOUNT AC on PS.ID = AC.BLACK_MULE_PERSON_ID
...    join AOC_BLACK_MULE_CASE CAE on AC.ID = CAE.BLACK_MULE_ACCOUNT_ID
...    where NOTE = 'AUTODATA${note}' AND STATUS = 'ACTIVE' AND PS.NATIONALITY = 'GB'
...    FETCH FIRST ${data} ROWS ONLY
        ${query}=   query_all     ${db_connect}     ${sql}     # query
        set test variable    ${query}
PreparaData withdraw black mule for black mule date ${data}
        connect to cfr database
       ${sql}=   catenate    select * from AOC_BLACK_MULE_PERSON PS
...    join AOC_BLACK_MULE_ACCOUNT AC on PS.ID = AC.BLACK_MULE_PERSON_ID
...    join AOC_BLACK_MULE_CASE CAE on AC.ID = CAE.BLACK_MULE_ACCOUNT_ID
...    where NOTE = 'AUTODATADATE1957' AND STATUS = 'ACTIVE'
...    FETCH FIRST ${data} ROWS ONLY
        ${query}=   query_all     ${db_connect}     ${sql}     # query
        set test variable    ${query}
        
query data black mule
    ${REQ_data_list_to_check}   create list
    ${BANK_CASE_ID}   create list
    set test variable    ${REQ_data_list_to_check}
    set test variable    ${BANK_CASE_ID}
        ${LEN_GENFILE}=  Get Length    ${query}
        FOR    ${index}    IN RANGE    ${LEN_GENFILE}
        ${result}=   set variable    ${query[${index}]}
        ${CREATE_DATETIME}=    set variable    ${result}[CREATE_DATETIME]
        ${REF_CODE}=    set variable    ${result}[REF_CODE]
        ${CARD_ID}=    set variable    ${result}[CARD_ID]
        ${PERSONAL_ID}=    decrypt cfr string '${CARD_ID}'
        ${TITLE}=    set variable    ${result}[TITLE]
        ${FRIST_NAME_b}=    set variable    ${result}[FIRST_NAME]
        ${FIRST_NAME}=    decrypt cfr string '${FRIST_NAME_b}'
        ${LAST_NAME_b}=    set variable    ${result}[LAST_NAME]
        ${LAST_NAME}=    decrypt cfr string '${LAST_NAME_b}'
        ${BIRTH_DATE}=    set variable    ${result}[BIRTH_DATE]
        ${NATIONALITY}=    set variable    ${result}[NATIONALITY]
        ${ACCOUNT_NUMBER_b}=    set variable    ${result}[ACCOUNT_NUMBER]
        ${ACCOUNT_NUMBER}=    decrypt cfr string '${ACCOUNT_NUMBER_b}'
        ${ACCOUNT_TYPE}=    set variable    ${result}[ACCOUNT_TYPE]
        ${BANK_CODE}=    set variable    ${result}[BANK_CODE]
        ${BANK_NAME}=    set variable    ${result}[BANK_NAME]
        ${de_type}    set variable    ปลดม้าดำรายบุคคล
        ${de_type_code}    set variable    1
        ${iden_type}    set variable    1
        ${po_case_id}    set variable    PC256710300001
        ${po_case_type}    set variable    3
        ${po_case_rp_date}    set variable    2567-10-30
        ${po_rank}    set variable    ร.ต.อ.
        ${po_name}    set variable    สมชัย
        ${po_surname}    set variable    แสนใจดี
        ${po_job_title}    set variable    รอง. สว.(สอบสวน)
        ${de_note}    set variable    แจ้งไว้เมื่อวันที่ 1 มกราคม /ถึ
        ${po_org}    set variable    สภ.กระทุ่มแบน บก.จ.สมุทรสาคร ภ.7
        ${po_tel}    set variable    878889999
        ${po_email}    set variable    div2_09@hotmail.com
        ${random_uuid}=    Evaluate    str(__import__('uuid').uuid4())
        ${code}    ${reason}=    Generate Declare Reason
        Set Test Variable    ${ran_declare_reason_code}    ${code}
        Set Test Variable    ${ran_declare_reason}         ${reason}
        Set Test Variable    ${uuid}         ${random_uuid}
        Set Test Variable    ${CREATE_DATETIME}    ${CREATE_DATETIME.strftime('%Y-%m-%d')}
        ${CREATE_DATETIME_THAI}=    Evaluate    (datetime.datetime.now().year + 543).__str__() + '-' + datetime.datetime.now().strftime('%m-%d')    modules=datetime
        Set Test Variable    ${CREATE_DATETIME_THAI}
        Set Test Variable    ${REF_CODE}
        Set Test Variable    ${PERSONAL_ID}
        Set Test Variable    ${TITLE}
        Set Test Variable    ${FIRST_NAME}
        Set Test Variable    ${LAST_NAME}
        Set Test Variable    ${de_type}
        Set Test Variable    ${de_type_code}
        Set Test Variable    ${de_note}
        Set Test Variable    ${iden_type}
        ${BIRTH_DATE}=    Evaluate    datetime.datetime(2002, 10, 21)    modules=datetime
        ${BIRTH_DATE}=    Set Variable    ${BIRTH_DATE.strftime('%Y-%m-%d')}
        ${BIRTH_DATE_THAI}=    Evaluate    (datetime.datetime.strptime('${BIRTH_DATE}', '%Y-%m-%d').year + 543).__str__() + '-' + datetime.datetime.strptime('${BIRTH_DATE}', '%Y-%m-%d').strftime('%m-%d')    modules=datetime
        Set Test Variable    ${BIRTH_DATE}
        Set Test Variable    ${BIRTH_DATE_THAI}
        Set Test Variable    ${NATIONALITY}
        Set Test Variable    ${po_case_id}
        Set Test Variable    ${po_case_type}
        Set Test Variable    ${po_case_type}
        Set Test Variable    ${po_case_rp_date}
        Set Test Variable    ${po_rank}
        Set Test Variable    ${po_name}
        Set Test Variable    ${po_surname}
        Set Test Variable    ${po_job_title}
        Set Test Variable    ${po_org}
        Set Test Variable    ${po_tel}
        Set Test Variable    ${po_email}
        Set Test Variable    ${ACCOUNT_NUMBER}
        Set Test Variable    ${ACCOUNT_TYPE}
        Set Test Variable    ${BANK_CODE}
        Set Test Variable    ${BANK_NAME}
        END

query data black mule set value 
    ${REQ_data_list_to_check}   create list
    ${BANK_CASE_ID}   create list
    set test variable    ${REQ_data_list_to_check}
    set test variable    ${BANK_CASE_ID}
        log     ${index}
        ${result}=   set variable    ${query[${index}]}
        ${CREATE_DATETIME}=    set variable    ${result}[CREATE_DATETIME]
        ${REF_CODE}=    set variable    ${result}[REF_CODE]
        ${CARD_ID}=    set variable    ${result}[CARD_ID]
        ${PERSONAL_ID}=    decrypt cfr string '${CARD_ID}'
        ${TITLE}=    set variable    ${result}[TITLE]
        ${FRIST_NAME_b}=    set variable    ${result}[FIRST_NAME]
        ${FIRST_NAME}=    decrypt cfr string '${FRIST_NAME_b}'
        ${LAST_NAME_b}=    set variable    ${result}[LAST_NAME]
        ${LAST_NAME}=    decrypt cfr string '${LAST_NAME_b}'
        ${BIRTH_DATE}=    set variable    ${result}[BIRTH_DATE]
        ${NATIONALITY}=    set variable    ${result}[NATIONALITY]
        ${ACCOUNT_NUMBER_b}=    set variable    ${result}[ACCOUNT_NUMBER]
        ${ACCOUNT_NUMBER}=    decrypt cfr string '${ACCOUNT_NUMBER_b}'
        ${ACCOUNT_TYPE}=    set variable    ${result}[ACCOUNT_TYPE]
        ${BANK_CODE}=    set variable    ${result}[BANK_CODE]
        ${BANK_NAME}=    set variable    ${result}[BANK_NAME]
        ${de_type}    set variable    ปลดม้าดำรายบุคคล
        ${de_type_code}    set variable    1
        ${iden_type}    set variable    1
        ${po_case_id}    set variable    PC256710300001
        ${po_case_type}    set variable    3
        ${po_case_rp_date}    set variable    2567-10-30
        ${po_rank}    set variable    ร.ต.อ.
        ${po_name}    set variable    สมชัย
        ${po_surname}    set variable    แสนใจดี
        ${po_job_title}    set variable    รอง. สว.(สอบสวน)
        ${de_note}    set variable    แจ้งไว้เมื่อวันที่ 1 มกราคม /ถึ
        ${po_org}    set variable    สภ.กระทุ่มแบน บก.จ.สมุทรสาคร ภ.7
        ${po_tel}    set variable    878889999
        ${po_email}    set variable    div2_09@hotmail.com
        ${random_uuid}=    Evaluate    str(__import__('uuid').uuid4())
        ${code}    ${reason}=    Generate Declare Reason
        Set Test Variable    ${ran_declare_reason_code}    ${code}
        Set Test Variable    ${ran_declare_reason}         ${reason}
        Set Test Variable    ${uuid}         ${random_uuid}
        Set Test Variable    ${CREATE_DATETIME}    ${CREATE_DATETIME.strftime('%Y-%m-%d')}
        ${CREATE_DATETIME_THAI}=    Evaluate    (datetime.datetime.now().year + 543).__str__() + '-' + datetime.datetime.now().strftime('%m-%d')    modules=datetime
        Set Test Variable    ${CREATE_DATETIME_THAI}
        Set Test Variable    ${REF_CODE}
        Set Test Variable    ${PERSONAL_ID}
        Set Test Variable    ${TITLE}
        Set Test Variable    ${FIRST_NAME}
        Set Test Variable    ${LAST_NAME}
        Set Test Variable    ${de_type}
        Set Test Variable    ${de_type_code}
        Set Test Variable    ${de_note}
        Set Test Variable    ${iden_type}
        ${BIRTH_DATE}=    Evaluate    datetime.datetime(2002, 10, 21)    modules=datetime
        ${BIRTH_DATE}=    Set Variable    ${BIRTH_DATE.strftime('%Y-%m-%d')}
        ${BIRTH_DATE_THAI}=    Evaluate    (datetime.datetime.strptime('${BIRTH_DATE}', '%Y-%m-%d').year + 543).__str__() + '-' + datetime.datetime.strptime('${BIRTH_DATE}', '%Y-%m-%d').strftime('%m-%d')    modules=datetime
        Set Test Variable    ${BIRTH_DATE}
        Set Test Variable    ${BIRTH_DATE_THAI}
        Set Test Variable    ${NATIONALITY}
        Set Test Variable    ${po_case_id}
        Set Test Variable    ${po_case_type}
        Set Test Variable    ${po_case_type}
        Set Test Variable    ${po_case_rp_date}
        Set Test Variable    ${po_rank}
        Set Test Variable    ${po_name}
        Set Test Variable    ${po_surname}
        Set Test Variable    ${po_job_title}
        Set Test Variable    ${po_org}
        Set Test Variable    ${po_tel}
        Set Test Variable    ${po_email}
        Set Test Variable    ${ACCOUNT_NUMBER}
        Set Test Variable    ${ACCOUNT_TYPE}
        Set Test Variable    ${BANK_CODE}
        Set Test Variable    ${BANK_NAME}

PreparaData black mule is ${data} Data And Genarate all type of black mule
    PreparaData withdraw black mule ${data}
    ${json_data_list}=    Create List
    Set Test Variable     ${json_data_list}
    ${LEN_GENFILE}=  Get Length    ${query}
    Set Test Variable     ${LEN_GENFILE}
    FOR    ${index}    IN RANGE    ${LEN_GENFILE}
    Set Test Variable    ${index}
    query data black mule set value 
    formatJsonData
    Replace string to create file withdraw black mule
    ${index}    Evaluate    ${index}+1
    END

PreparaData black mule is ${data} Data And Genarate all type of black mule and fix field is ${field}
    PreparaData withdraw black mule ${data}
    ${json_data_list}=    Create List
    Set Test Variable     ${json_data_list}
    ${LEN_GENFILE}=  Get Length    ${query}
    Set Test Variable     ${LEN_GENFILE}
    FOR    ${index}    IN RANGE    ${LEN_GENFILE}
    Set Test Variable    ${index}
    query data black mule set value 
    validate format or length ${field}
    formatJsonData
    Replace string to create file withdraw black mule
    ${index}    Evaluate    ${index}+1
    END

PreparaData black mule is ${data} Data And Genarate duplicate same file
    PreparaData withdraw black mule ${data}
    ${json_data_list}=    Create List
    Set Test Variable     ${json_data_list}
    ${LEN_GENFILE}=  Get Length    ${query}
    Set Test Variable     ${LEN_GENFILE}
    FOR    ${index}    IN RANGE    ${LEN_GENFILE}
    ${index}    Set Variable    0
    Set Test Variable    ${index}
    query data black mule set value 
    formatJsonData
    Replace string to create file withdraw black mule
    END

PreparaData black mule is ${data} Data And Genarate item dup
    PreparaData withdraw black mule ${data}
    ${json_data_list}=    Create List
    Set Test Variable     ${json_data_list}
    ${LEN_GENFILE}=  Get Length    ${query}
    Set Test Variable     ${LEN_GENFILE}
    ${random_uuid_main}=    Evaluate    str(__import__('uuid').uuid4())
    ${code_main}    ${reason_main}=    Generate Declare Reason
    FOR    ${index}    IN RANGE    ${LEN_GENFILE}
    ${index}    Set Variable    0
    Set Test Variable    ${index}
    query data black mule set value 
    ${uuid}    Set Variable    ${random_uuid_main}
    ${ran_declare_reason_code}    Set Variable    ${code_main}
    ${ran_declare_reason}    Set Variable    ${reason_main}
    Set Test Variable    ${uuid}
    Set Test Variable    ${ran_declare_reason_code}
    Set Test Variable    ${ran_declare_reason}
    formatJsonData
    Replace string to create file withdraw black mule
    END

PreparaData black mule is ${data} Data And Genarate Valid Condition mule is ${mule}
    PreparaData withdraw black mule ${data}
    ${json_data_list}=    Create List
    Set Test Variable     ${json_data_list}
    ${LEN_GENFILE}=  Get Length    ${query}
    Set Test Variable     ${LEN_GENFILE}
    FOR    ${index}    IN RANGE    ${LEN_GENFILE}
    Set Test Variable    ${index}
    query data black mule set value 
    IF    '${mule}' == 'BrownMule'
    PreparaData brown mule ${data}
    ELSE IF    '${mule}' == 'WhiteMuleRule'
    PreparaData White mule rule ${data}
    ELSE IF    '${mule}' == 'BlackWithdrawAgain'
    PreparaData Black mule withdraw again ${data}
    ELSE IF    '${mule}' == 'MuleRule1'
    PreparaData mule rule 1 ${data}
    ELSE IF    '${mule}' == 'MuleRule2'
    PreparaData mule rule 2 ${data}
    ELSE
        Log    not match any keyword mule
    END
    formatJsonData
    Replace string to create file withdraw black mule
    ${index}    Evaluate    ${index}+1
    END
    
PreparaData black mule is ${data} Data And Genarate all type of black mule and validate format or length is ${field}
    PreparaData withdraw black mule ${data}
    query data black mule
    validate format or length ${field}
    Prepare Json From to black mule
    Replace string to create file
PreparaData black mule is ${data} Data And Genarate all type of black mule and missing parameter field is ${field}
    PreparaData withdraw black mule ${data}
    query data black mule
    Prepare Json From to black mule for validate missing parameter field is ${field}
    Replace string to create file
PreparaData black mule is ${data} Data And Genarate all type of black mule for Identity ID is ${idenID} ID and validate format or length is ${field}
    PreparaData withdraw black mule Identity ID is ${idenID} ${data}
    query data black mule
    validate format or length ${field}
    Prepare Json From to black mule
    Replace string to create file
PreparaData black mule is ${data} Data And Genarate all type of black mule and validate format or length is ${field} and query for black mule date ASC
    PreparaData withdraw black mule for black mule date ${data}
    query data black mule
    validate format or length ${field}
    Prepare Json From to black mule
    Replace string to create file
PreparaData black mule file is ${data}
    Copy file and input data ${data}

Should be Equal Full Withdraw black mule ${success}
    Should Be Equal As Strings    ${res_declareUuid}    ${req_declareUuid}
    Should Be Equal As Strings    ${res_declareTypeCode}    ${req_declareTypeCode}
    Should Be Equal As Strings   ${res_declareType}    ${req_declareType}
    Should Be Equal As Strings    ${res_muleRefCode}    ${req_muleRefCode}
    Should Be Equal As Strings    ${res_code}    ${WithDrawBlackMule.${success}.code}
    Should Be Equal As Strings    ${res_message}    ${WithDrawBlackMule.${success}.msg}
    Should Not Be Empty    ${res_timestamp}
Should be Equal Full Withdraw black mule ${success} none ref code
    Should Be Equal As Strings    ${res_declareUuid}    ${req_declareUuid}
    Should Be Equal As Strings    ${res_declareTypeCode}    ${req_declareTypeCode}
    Should Be Equal As Strings   ${res_declareType}    ${req_declareType}
    Should Be Equal As Strings    ${res_code}    ${WithDrawBlackMule.${success}.code}
    Should Be Equal As Strings    ${res_message}    ${WithDrawBlackMule.${success}.msg}
    Should Not Be Empty    ${res_timestamp}
Should be set REQ EMPTY 
            ${req_declareUuid}    Set Variable    ${EMPTY}
            ${req_declareTypeCode}    Set Variable    ${EMPTY}
            ${req_declareType}    Set Variable    ${EMPTY}
            ${req_muleRefCode}    Set Variable    ${EMPTY}

            Set Test Variable    ${req_declareUuid}
            Set Test Variable    ${req_declareTypeCode}
            Set Test Variable    ${req_muleRefCode}
            Set Test Variable    ${req_declareType}
Should be set RES
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
            Set Test Variable    ${res_declareUuid}
            Set Test Variable    ${res_code}
            Set Test Variable    ${res_message}
            Set Test Variable    ${res_declareTypeCode}
            Set Test Variable    ${res_muleRefCode}
            Set Test Variable    ${res_declareType}
            Set Test Variable    ${res_timestamp}
Should be set RES refcode non
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
     Set Test Variable    ${res_declareUuid}
     Set Test Variable    ${res_code}
     Set Test Variable    ${res_message}
     Set Test Variable    ${res_declareTypeCode}
     Set Test Variable    ${res_declareType}
     Set Test Variable    ${res_timestamp}
Check Response Code WIthdraw Black Mule REQ And RES is ${success}
    ${json_list}=    Load JSON From File    ${CSV_FILE}    encoding=UTF-8
    ${json_list_req}=    Load JSON From File    ${CURDIR}/Data/${directory}.json    encoding=UTF-8
    Log    ${json_list_req}
    ${total_res}=    Get Length    ${json_list}
    Set Test Variable    ${json_list}
    FOR    ${index}    IN RANGE    0    ${total_res}
        Set Test Variable    ${index}
        Log    ${success}
        IF    $success == 'Invalid_format_Missing_Parameter_field_uuid'
            Should be set RES
            Should be set REQ EMPTY 
            Should be Equal Full Withdraw black mule ${success}
        ELSE IF    $success == 'Invalid_format_Missing_Parameter_field_de_type_code'
            Should be set RES
            Should be set REQ EMPTY 
            Should be Equal Full Withdraw black mule ${success}
        ELSE IF    $success == 'Invalid_format_Missing_Parameter_field_de_type'
            Should be set RES
            Should be set REQ EMPTY 
            Should be Equal Full Withdraw black mule ${success}
        ELSE IF    $success == 'Invalid_Missing_Parameter_field_withdraw_date'
            Should be set RES
            Should be set REQ EMPTY 
            Should be Equal Full Withdraw black mule ${success}
        ELSE IF    $success == 'Invalid_Missing_Parameter_field_de_reason_code'
            Should be set RES
            Should be set REQ EMPTY 
            Should be Equal Full Withdraw black mule ${success}
        ELSE IF    $success == 'Invalid_format_Missing_Parameter_de_reason'
            Should be set RES
            Should be set REQ EMPTY 
            Should be Equal Full Withdraw black mule ${success}
        ELSE IF    $success == 'Invalid_format_Missing_Parameter_de_note'
            Should be set RES
            Should be set REQ EMPTY 
            Should be Equal Full Withdraw black mule ${success}
        ELSE IF    $success == 'Invalid_format_Missing_Parameter_mule_ref_code'
            Should be set RES
            Should be set REQ EMPTY 
            Should be Equal Full Withdraw black mule ${success}
        ELSE IF    $success == 'Invalid_format_Missing_Parameter_mule_iden_id'
            Should be set RES
            Should be set REQ EMPTY 
            Should be Equal Full Withdraw black mule ${success}
        ELSE IF    $success == 'Invalid_format_Missing_Parameter_mule_iden_type'
            Should be set RES
            Should be set REQ EMPTY 
            Should be Equal Full Withdraw black mule ${success}
        ELSE IF    $success == 'Invalid_format_Missing_Parameter_mule_name'
            Should be set RES
            Should be set REQ EMPTY 
            Should be Equal Full Withdraw black mule ${success}
        ELSE IF    $success == 'Invalid_format_Missing_Parameter_mule_surname'
            Should be set RES
            Should be set REQ EMPTY 
            Should be Equal Full Withdraw black mule ${success}
        ELSE IF    $success == 'Invalid_format_Missing_Parameter_mule_nationality'
            Should be set RES
            Should be set REQ EMPTY 
            Should be Equal Full Withdraw black mule ${success}
        ELSE IF    $success == 'Invalid_format_Missing_Parameter_po_case_id'
            Should be set RES
            Should be set REQ EMPTY 
            Should be Equal Full Withdraw black mule ${success}
        ELSE IF    $success == 'Invalid_format_Missing_Parameter_po_case_type'
            Should be set RES
            Should be set REQ EMPTY 
            Should be Equal Full Withdraw black mule ${success}
        ELSE IF    $success == 'Invalid_format_Missing_Parameter_po_case_rp_date'
            Should be set RES
            Should be set REQ EMPTY 
            Should be Equal Full Withdraw black mule ${success}
        ELSE IF    $success == 'Invalid_format_Missing_Parameter_mule_acc_no'
            Should be set RES
            Should be set REQ EMPTY 
            Should be Equal Full Withdraw black mule ${success}
        ELSE IF    $success == 'Invalid_format_Missing_Parameter_mule_acc_type'
            Should be set RES
            Should be set REQ EMPTY 
            Should be Equal Full Withdraw black mule ${success}
        ELSE IF    $success == 'Invalid_format_Missing_Parameter_mule_acc_bankcode'
            Should be set RES
            Should be set REQ EMPTY 
            Should be Equal Full Withdraw black mule ${success}
        ELSE IF    $success == 'Invalid_format_Missing_Parameter_mule_acc_bankname'
            Should be set RES
            Should be set REQ EMPTY 
            Should be Equal Full Withdraw black mule ${success}
        ELSE IF    $success == 'Invalid_format_Missing_Parameter_po_rank'
            Should be set RES
            Should be set REQ EMPTY 
            Should be Equal Full Withdraw black mule ${success}
        ELSE IF    $success == 'Invalid_format_Missing_Parameter_po_name'
            Should be set RES
            Should be set REQ EMPTY 
            Should be Equal Full Withdraw black mule ${success}
        ELSE IF    $success == 'Invalid_format_Missing_Parameter_po_surname'
            Should be set RES
            Should be set REQ EMPTY 
            Should be Equal Full Withdraw black mule ${success}
        ELSE IF    $success == 'Invalid_format_Missing_Parameter_po_job_title'
            Should be set RES
            Should be set REQ EMPTY 
            Should be Equal Full Withdraw black mule ${success}
        ELSE IF    $success == 'Invalid_format_Missing_Parameter_po_org'
            Should be set RES
            Should be set REQ EMPTY 
            Should be Equal Full Withdraw black mule ${success}
        ELSE IF    $success == 'Invalid_format_Missing_Parameter_po_tel'
            Should be set RES
            Should be set REQ EMPTY 
            Should be Equal Full Withdraw black mule ${success}
        ELSE IF    $success == 'Invalid_format_Missing_Parameter_po_email'
            Should be set RES
            Should be set REQ EMPTY 
            Should be Equal Full Withdraw black mule ${success}
        ELSE IF    $success == 'Invalid_format_Non_processable_Entity'
            Should be set RES
            Should be set REQ EMPTY 
            Should be Equal Full Withdraw black mule ${success}
        ELSE IF    $success == 'SOME_ITEM_DUPLICATE'
            Should be set RES
            Should be set REQ EMPTY 
            Should be Equal Full Withdraw black mule ${success}
        ELSE IF    $success == 'Invalid_FILE_EXCEED_LIMIT'
            Should be set REQ EMPTY 
            Should be set RES refcode non
            Should be Equal Full Withdraw black mule ${success} none ref code
        ELSE IF    $success == 'Invalid_file_name'
            Should be set REQ EMPTY 
            Should be set RES refcode non
            Should be Equal Full Withdraw black mule ${success} none ref code
        ELSE IF    $success == 'Invalid_record'
            Should be set REQ EMPTY 
            Should be set RES refcode non
            Should be Equal Full Withdraw black mule ${success} none ref code
        ELSE IF    $success == 'invalid_date_no_filename'
            Should be set REQ EMPTY 
            Should be set RES refcode non
            Should be Equal Full Withdraw black mule ${success} none ref code
        ELSE IF    $success == 'duplicate_filename'
            Should be set REQ EMPTY 
            Should be set RES refcode non
            Should be Equal Full Withdraw black mule ${success} none ref code
        ELSE IF    $success == 'invalid_req_format'
            Should be set REQ EMPTY 
            Should be set RES refcode non
            Should be Equal Full Withdraw black mule ${success} none ref code
        ELSE IF    $success == 'INVALID_SIGNATURE'
            Should be set REQ EMPTY 
            Should be set RES refcode non
            Should be Equal Full Withdraw black mule ${success} none ref code
        ELSE IF    $success == 'Invalid_format_Missing_field_uuid'
        # REQ
            ${req_declareTypeCode_list}    Get Value From Json    ${json_list_req}    $[${index}].declare_type_code
            ${req_declareType_list}    Get Value From Json    ${json_list_req}    $[${index}].declare_type
            ${req_muleRefCode_list}    Get Value From Json    ${json_list_req}    $[${index}].mule_ref_code

            ${req_declareUuid}    Set Variable    ${EMPTY}
            ${req_declareTypeCode}    Get From List    ${req_declareTypeCode_list}    0
             ${req_muleRefCode}    Get From List    ${req_muleRefCode_list}    0
            ${req_declareType}    Get From List    ${req_declareType_list}    0

            Set Test Variable    ${req_declareUuid}
            Set Test Variable    ${req_declareTypeCode}
            Set Test Variable    ${req_muleRefCode}
            Set Test Variable    ${req_declareType}
            Should be set RES
        ELSE IF    $success == 'Invalid_Missing_field_de_type_code'
        # REQ
            ${req_declareUuid_list}    Get Value From Json    ${json_list_req}    $[${index}].declare_uuid
            ${req_declareType_list}    Get Value From Json    ${json_list_req}    $[${index}].declare_type
            ${req_muleRefCode_list}    Get Value From Json    ${json_list_req}    $[${index}].mule_ref_code

            ${req_declareUuid}    Get From List    ${req_declareUuid_list}    0
            ${req_declareTypeCode}    Set Variable    ${EMPTY}
            ${req_muleRefCode}    Get From List    ${req_muleRefCode_list}    0
            ${req_declareType}    Get From List    ${req_declareType_list}    0

            Set Test Variable    ${req_declareUuid}
            Set Test Variable    ${req_declareTypeCode}
            Set Test Variable    ${req_muleRefCode}
            Set Test Variable    ${req_declareType}
        # RES
            Should be set RES
        ELSE IF    $success == 'Invalid_Missing_field_de_type'
        # REQ
            ${req_declareUuid_list}    Get Value From Json    ${json_list_req}    $[${index}].declare_uuid
            ${req_muleRefCode_list}    Get Value From Json    ${json_list_req}    $[${index}].mule_ref_code
            ${req_declareTypeCode_list}    Get Value From Json    ${json_list_req}    $[${index}].declare_type_code
            ${req_declareUuid}    Get From List    ${req_declareUuid_list}    0
            ${req_declareTypeCode}    Get From List    ${req_declareTypeCode_list}    0
            ${req_muleRefCode}    Get From List    ${req_muleRefCode_list}    0
            ${req_declareType}    Set Variable    ${EMPTY}

            Set Test Variable    ${req_declareUuid}
            Set Test Variable    ${req_declareTypeCode}
            Set Test Variable    ${req_muleRefCode}
            Set Test Variable    ${req_declareType}
        # RES
            Should be set RES
        ELSE IF    $success == 'Invalid_Missing_field_mule_ref_code'
        # REQ
            ${req_declareUuid_list}    Get Value From Json    ${json_list_req}    $[${index}].declare_uuid
            ${req_declareTypeCode_list}    Get Value From Json    ${json_list_req}    $[${index}].declare_type_code
            ${req_declareType_list}    Get Value From Json    ${json_list_req}    $[${index}].declare_type
            ${req_declareUuid}    Get From List    ${req_declareUuid_list}    0
            ${req_declareTypeCode}    Get From List    ${req_declareTypeCode_list}    0
            ${req_muleRefCode}    Set Variable    ${EMPTY}
            ${req_declareType}    Get From List    ${req_declareType_list}    0

            Set Test Variable    ${req_declareUuid}
            Set Test Variable    ${req_declareTypeCode}
            Set Test Variable    ${req_muleRefCode}
            Set Test Variable    ${req_declareType}
        # RES
            Should be set RES
        ELSE
        # REQ
            ${req_declareUuid_list}    Get Value From Json    ${json_list_req}    $[${index}].declare_uuid
            ${req_declareTypeCode_list}    Get Value From Json    ${json_list_req}    $[${index}].declare_type_code
            ${req_declareType_list}    Get Value From Json    ${json_list_req}    $[${index}].declare_type
            ${req_muleRefCode_list}    Get Value From Json    ${json_list_req}    $[${index}].mule_ref_code

            ${req_declareUuid}    Get From List    ${req_declareUuid_list}    0
            ${req_declareTypeCode}    Get From List    ${req_declareTypeCode_list}    0
            ${req_muleRefCode}    Get From List    ${req_muleRefCode_list}    0
            ${req_declareType}    Get From List    ${req_declareType_list}    0

            Set Test Variable    ${req_declareUuid}
            Set Test Variable    ${req_declareTypeCode}
            Set Test Variable    ${req_muleRefCode}
            Set Test Variable    ${req_declareType}
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
            Set Test Variable    ${res_declareUuid}
            Set Test Variable    ${res_code}
            Set Test Variable    ${res_message}
            Set Test Variable    ${res_declareTypeCode}
            Set Test Variable    ${res_muleRefCode}
            Set Test Variable    ${res_declareType}
            Set Test Variable    ${res_timestamp}
        END
      IF    '${success}' == 'SUCCESS'
    Should be Equal Full Withdraw black mule ${success}
    Should be withdraw black mule status is ${success}
    ELSE IF    '${success}' == 'Invalid_format_declare_uuid'
    Should be Equal Full Withdraw black mule ${success}
    Should Not Be Empty    ${res_timestamp}
    ELSE IF    '${success}' == 'Invalid_format_declare_type_code'
    Should be Equal Full Withdraw black mule ${success}
    ELSE IF    '${success}' == 'Invalid_format_declare_type'
    Should be Equal Full Withdraw black mule ${success}
    ELSE IF    '${success}' == 'Invalid_format_withdraw_date'
    Should be Equal Full Withdraw black mule ${success}
    ELSE IF    '${success}' == 'Invalid_format_declare_reason_code'
    Should be Equal Full Withdraw black mule ${success}
    ELSE IF    '${success}' == 'Invalid_format_declare_reason'
    Should be Equal Full Withdraw black mule ${success}
    ELSE IF    '${success}' == 'Invalid_format_declare_note'
    Should be Equal Full Withdraw black mule ${success}
    ELSE IF    '${success}' == 'Invalid_format_mule_ref_code'
    Should be Equal Full Withdraw black mule ${success}
    ELSE IF    '${success}' == 'Invalid_format_mule_identity_id'
    Should be Equal Full Withdraw black mule ${success}
    ELSE IF    '${success}' == 'Invalid_format_mule_identity_type'
    Should be Equal Full Withdraw black mule ${success}
    ELSE IF    '${success}' == 'Invalid_format_mule_title'
    Should be Equal Full Withdraw black mule ${success}
    ELSE IF    '${success}' == 'Invalid_format_mule_name'
    Should be Equal Full Withdraw black mule ${success}
    ELSE IF    '${success}' == 'Invalid_format_mule_surname'
    Should be Equal Full Withdraw black mule ${success}
    ELSE IF    '${success}' == 'Invalid_format_mule_birth_date'
    Should be Equal Full Withdraw black mule ${success}
    ELSE IF    '${success}' == 'Invalid_format_mule_nationality'
    Should be Equal Full Withdraw black mule ${success}
    ELSE IF    '${success}' == 'Invalid_format_police_case_id'
    Should be Equal Full Withdraw black mule ${success}
    ELSE IF    '${success}' == 'Invalid_format_police_case_type'
    Should be Equal Full Withdraw black mule ${success}
    ELSE IF    '${success}' == 'Invalid_format_police_case_report_date'
    Should be Equal Full Withdraw black mule ${success}
    ELSE IF    '${success}' == 'Invalid_format_mule_account_no'
    Should be Equal Full Withdraw black mule ${success}
    ELSE IF    '${success}' == 'Invalid_format_mule_account_type'
    Should be Equal Full Withdraw black mule ${success}
    ELSE IF    '${success}' == 'Invalid_format_mule_account_bankcode'
    Should be Equal Full Withdraw black mule ${success}
    ELSE IF    '${success}' == 'Invalid_format_mule_account_bankname'
    Should be Equal Full Withdraw black mule ${success}
    ELSE IF    '${success}' == 'Invalid_format_police_rank'
    Should be Equal Full Withdraw black mule ${success}
    ELSE IF    '${success}' == 'Invalid_format_police_name'
    Should be Equal Full Withdraw black mule ${success}
    ELSE IF    '${success}' == 'Invalid_format_police_surname'
    Should be Equal Full Withdraw black mule ${success}
    ELSE IF    '${success}' == 'Invalid_format_police_job_title'
    Should be Equal Full Withdraw black mule ${success}
    ELSE IF    '${success}' == 'Invalid_format_police_org'
    Should be Equal Full Withdraw black mule ${success}
    ELSE IF    '${success}' == 'Invalid_format_police_tel'
    Should be Equal Full Withdraw black mule ${success}
    ELSE IF    '${success}' == 'Invalid_format_Missing_field_uuid'
    Should be Equal Full Withdraw black mule ${success}
    ELSE IF    '${success}' == 'Invalid_Missing_field_de_type_code'
    Should be Equal Full Withdraw black mule ${success}
    ELSE IF    '${success}' == 'Invalid_Missing_field_de_type'
    Should be Equal Full Withdraw black mule ${success}
    ELSE IF    '${success}' == 'Invalid_Missing_field_withdraw_date'
    Should be Equal Full Withdraw black mule ${success}
    ELSE IF    '${success}' == 'Invalid_Missing_field_declare_reason_code'
    Should be Equal Full Withdraw black mule ${success}
    ELSE IF    '${success}' == 'Invalid_Missing_field_declare_reason'
    Should be Equal Full Withdraw black mule ${success}
    ELSE IF    '${success}' == 'Invalid_Missing_field_declare_note'
    Should be Equal Full Withdraw black mule ${success}
    ELSE IF    '${success}' == 'Invalid_Missing_field_mule_ref_code'
    Should be Equal Full Withdraw black mule ${success}
    ELSE IF    '${success}' == 'Invalid_Missing_field_mule_identity_id'
    Should be Equal Full Withdraw black mule ${success}
    ELSE IF    '${success}' == 'Invalid_Missing_field_mule_title'
    Should be Equal Full Withdraw black mule ${success}
    ELSE IF    '${success}' == 'Invalid_Missing_field_mule_name'
    Should be Equal Full Withdraw black mule ${success}
    ELSE IF    '${success}' == 'Invalid_Missing_field_mule_surname'
    Should be Equal Full Withdraw black mule ${success}
    ELSE IF    '${success}' == 'Invalid_Missing_field_mule_birth_date'
    Should be Equal Full Withdraw black mule ${success}
    ELSE IF    '${success}' == 'Invalid_Missing_field_mule_nationality'
    Should be Equal Full Withdraw black mule ${success}
    ELSE IF    '${success}' == 'Invalid_Missing_field_police_case_id'
    Should be Equal Full Withdraw black mule ${success}
    ELSE IF    '${success}' == 'Invalid_Missing_field_police_case_type'
    Should be Equal Full Withdraw black mule ${success}
    ELSE IF    '${success}' == 'Invalid_Missing_field_police_case_report_date'
    Should be Equal Full Withdraw black mule ${success}
    ELSE IF    '${success}' == 'Invalid_Missing_field_mule_account_no'
    Should be Equal Full Withdraw black mule ${success}
    ELSE IF    '${success}' == 'Invalid_Missing_field_mule_account_type'
    Should be Equal Full Withdraw black mule ${success}
    ELSE IF    '${success}' == 'Invalid_Missing_field_mule_account_bankcode'
    Should be Equal Full Withdraw black mule ${success}
    ELSE IF    '${success}' == 'Invalid_Missing_field_mule_account_bankname'
    Should be Equal Full Withdraw black mule ${success}
    ELSE IF    '${success}' == 'Invalid_Missing_field_police_rank'
    Should be Equal Full Withdraw black mule ${success}
    ELSE IF    '${success}' == 'Invalid_Missing_field_police_name'
    Should be Equal Full Withdraw black mule ${success}
    ELSE IF    '${success}' == 'Invalid_Missing_field_police_surname'
    Should be Equal Full Withdraw black mule ${success}
    ELSE IF    '${success}' == 'Invalid_Missing_field_police_job_title'
    Should be Equal Full Withdraw black mule ${success}
    ELSE IF    '${success}' == 'Invalid_Missing_field_police_org'
    Should be Equal Full Withdraw black mule ${success}
    ELSE IF    '${success}' == 'Invalid_Missing_field_police_tel'
    Should be Equal Full Withdraw black mule ${success}
    ELSE IF    '${success}' == 'Invalid_Missing_field_police_email'
    Should be Equal Full Withdraw black mule ${success}
    ELSE IF    '${success}' == 'Invalid_Does_not_match_mule_iden_ID_list'
    Should be Equal Full Withdraw black mule ${success}
    ELSE IF    '${success}' == 'Invalid_declare_type_code'
    Should be Equal Full Withdraw black mule ${success}
    ELSE IF    '${success}' == 'invalida_mule_iden_and_mule_ref_match_sys'
    Should be Equal Full Withdraw black mule ${success}
    ELSE IF    '${success}' == 'invalida_mule_iden_and_mule_ref_dup_same_file'
    Should be Equal Full Withdraw black mule ${success}
    ELSE IF    '${success}' == 'Invalid_value_condition_withdraw_date'
    Should be Equal Full Withdraw black mule ${success}
    ELSE IF    '${success}' == 'Invalid_value_condition_police_case_report_date'
    Should be Equal Full Withdraw black mule ${success}
    ELSE IF    '${success}' == 'Invalid_condition_mule_nationality'
    Should be Equal Full Withdraw black mule ${success}
    ELSE IF    '${success}' == 'Invalid_condition_mule_birth_date'
    Should be Equal Full Withdraw black mule ${success}
    ELSE
    log      no match meeage error
    END
    END
    check query validate file name

check query validate file name
        connect to cfr database
    ${sql}=     Catenate    SELECT * FROM AOC_SFTP_WITHDRAW_MULE_REQUEST_FILE_INFO  aswmrfi
...		 JOIN  AOC_SFTP_WITHDRAW_MULE_REQUEST_FILE_DETAIL aswmrfd ON ASWMRFI.ID = ASWMRFD.FILE_ID 
...		 JOIN AOC_SFTP_WITHDRAW_MULE_RESPONSE_FILE_INFO aswmrfi2 ON ASWMRFI.ID = ASWMRFI2.REQUEST_FILE_ID
...      WHERE ASWMRFI.FILE_NAME ='${Filename_Req_blackmule}.gpg' 
    ${query}=   query_all     ${db_connect}     ${sql}
    ${total_query}=   Get Length   ${query} 
    FOR    ${index}    IN RANGE    0    ${total_query}
    ${result}=   set variable    ${query[${index}]}
    ${DB_REQ_FILE_NAME}=    set variable    ${result}[FILE_NAME]
    ${DB_RES_FILE_NAME}=    set variable    ${result}[RESPONSE_FILE_NAME]
    Should Be Equal As Strings    ${DB_REQ_FILE_NAME}    ${Filename_Req_blackmule}.gpg
    Should Be Equal As Strings    ${DB_RES_FILE_NAME}    ${Filename_Res_blackmule}.gpg
    END
validate format or length ${filed}
    IF    '${filed}' == 'Length_uuid'
    ${length_uuid}=    Get Length    ${uuid}
    Should Be Equal As Numbers    ${length_uuid}    36
    Log    UUID มีความยาว ${length_uuid} ตัวอักษร    
    ELSE IF    '${filed}' == 'Length_declare_reason_code'
    ${length_reason_code}=    Get Length    ${ran_declare_reason_code}
    Should Be Equal As Numbers    ${length_reason_code}    2
    Log    reason code มีความยาว ${length_reason_code} ตัวอักษร    
    ELSE IF    '${filed}' == 'Invalid_uuid'
    ${uuid}    Set Variable    '38fde238-๓฿๒@-47e2-bd3a-80b27781641f'
    Set Test Variable    ${uuid}
    ELSE IF    '${filed}' == 'Invalid_Length_uuid'
    ${uuid}    Set Variable    '${uuid}1'
    Set Test Variable    ${uuid}
    ELSE IF    '${filed}' == 'Invalid_declare_type_code'
    ${de_type_code}    Set Variable    'A'
    Set Test Variable    ${de_type_code}
    ELSE IF    '${filed}' == 'Invalid_Length_declare_type_code'
    ${de_type_code}    Set Variable    '222'
    Set Test Variable    ${de_type_code}
    ELSE IF    '${filed}' == 'Invalid_declare_type'
    ${de_type}    Set Variable    '||'
    Set Test Variable    ${de_type}
    ELSE IF    '${filed}' == 'Invalid_Length_declare_type'
    ${de_type}    Set Variable    'เทสปลดม้าเทาเข้มรายบุคคลเทสปลดม้าเทาเข้มราเทสปลดไๆๆ'
    Set Test Variable    ${de_type}
    ELSE IF    '${filed}' == 'Valid_withdraw_date_being'
    # ${CREATE_DATETIME_THAI}=    Evaluate    '2500-' + datetime.datetime.now().strftime('%m-%d')    modules=datetime
    ${CREATE_DATETIME_THAI}    Set Variable    2500-03-06
    Set Test Variable    ${CREATE_DATETIME_THAI}
    ELSE IF    '${filed}' == 'Invalid_withdraw_date'
    ${CREATE_DATETIME_THAI}    Set Variable    25671120
    Set Test Variable    ${CREATE_DATETIME_THAI}
    ELSE IF    '${filed}' == 'Invalid_Length_withdraw_date'
    ${CREATE_DATETIME_THAI}    Set Variable    2567-11-200
    ${length_datetime}    Get Length    ${CREATE_DATETIME_THAI}
    Log    datetime มีความยาว ${length_datetime} ตัวอักษร    
    Set Test Variable    ${CREATE_DATETIME_THAI}
    ELSE IF    '${filed}' == 'Invalid_Appendix_withdraw_date'
    ${CREATE_DATETIME_THAI}    Set Variable    Test-กข-๒%
    Set Test Variable    ${CREATE_DATETIME_THAI}
    ELSE IF    '${filed}' == 'Invalid_Date_withdraw_date'
    ${CREATE_DATETIME_THAI}=    Evaluate    datetime.datetime.now().strftime('%y-%m-' + '32')    modules=datetime
    Set Test Variable    ${CREATE_DATETIME_THAI}
    ELSE IF    '${filed}' == 'Invalid_Month_withdraw_date'
    ${CREATE_DATETIME_THAI}=    Evaluate    datetime.datetime.now().strftime('%y-' + '13' + '-%d')    modules=datetime
    Set Test Variable    ${CREATE_DATETIME_THAI}
    ELSE IF    '${filed}' == 'Invalid_declare_reason_code'
    ${ran_declare_reason_code}    Set Variable    ทส
    Set Test Variable    ${ran_declare_reason_code}
    ELSE IF    '${filed}' == 'Invalid_Length_declare_reason_code'
    ${ran_declare_reason_code}    Set Variable    002
    ${length_de_reason_code}    Get Length    ${ran_declare_reason_code}
    Should Be Equal As Numbers    ${length_de_reason_code}    3
    Set Test Variable    ${ran_declare_reason_code}
    ELSE IF    '${filed}' == 'Invalid_declare_reason'
    ${ran_declare_reason}    Set Variable    |||
    Set Test Variable    ${ran_declare_reason}
    ELSE IF    '${filed}' == 'Invalid_Length_declare_reason'
    ${ran_declare_reason}    Set Variable    ทดสอบTeadxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
    ${length_reason}    Get Length    ${ran_declare_reason}
    Should Be Equal As Numbers    ${length_reason}    257
    Set Test Variable    ${ran_declare_reason}
    ELSE IF    '${filed}' == 'Valida_Length_declare_note'
    ${de_note}    Set Variable    ห่กดหสรด้หสดห้ดสหด้หสเรีเนสไำีดหสดีหฟนกหดsjfosjfsgisdjasfiuahlfauflhasifhalifsa2242435ห่กดหสรด้หสดห้ดสหด้หสเรีเนสไำีดหสดีหฟนกหดsjfosjfsgisdjasfiuahlfauflhasifhalifsa2242435ห่กดหสรด้หสดห้ดสหด้หสเรีเนสไำีดหสดีหฟนกหดsjfosjfsgisdjasfiuahlfauflhasifhalifsa2242435ห่กดหสรด้หสดห้ดสหด้หสเรีเนสไำีดหสดีหฟนกหดsjfosjfsgisdjasfiuahlfauflhasifhalifsa2242435ห่กดหสรด้หสดห้ดสหด้หสเรีเนสไำีดหสดีหฟนกหดsjfosjfsgisdjasfiuahlfauflhasifhalifsa2242435ห่กดหสรด้หสดห้ดสหด้หสเรีเนสไำีดหสดีหฟนกหดsjfosjfsgisdjasfiuahlfauflhasifhalifsa2242435ห่กดหสรด้หสดห้ดสหด้หสเรีเนสไำีดหสดีหฟนกหดsjfosjfsgisdjasfiuahlfauflhasifhalifsa2242435ห่กดหสรด้หสดห้ดสหด้หสเรีเนสไำีดหสดีหฟนกหดsjfosjfsgisdjasfiuahlfauflhasifhalifsa2242435ห่กดหสรด้หสดห้ดสหด้หสเรีเนสไำีดหสดีหฟนกหดsjfosjfsgisdjasfiuahlfauflhasifhalifsa2242435ห่กดหสรด้หสดห้ดสหด้หสเรีเนสไำีดหสดีหฟนกหดsjfosjfsgisdjasfiuahlfauflhasifhalifsa2242435ห่กดหสรด้หสดห้ดสหด้หสเรีเนสไำีดหสดีหฟนกหดsjfosjfsgisdjasfiuahlfauflhasifhalifsa2242435ห่กดหสรด้หสดห้ดสหด้หสเรีเนสไำีดหสดีหฟนกหดsjfosjfsgisdj
    ${length_note}    Get Length    ${de_note}
    Should Be Equal As Numbers    ${length_note}    1000
    Set Test Variable    ${de_note}
    ELSE IF    '${filed}' == 'Invalida_declare_note'
    ${de_note}    Set Variable    ห่กดหสaรด้หสดห้ดสหด้หสเรีเนสไำีดหสดีหฟนกหดsjfosjfsgisdjasfiuahlfauflhasifhalifsa2242435ห่กดหสรด้หสดห้ดสหด้หสเรีเนสไำีดหสดีหฟนกหดsjfosjfsgisdjasfiuahlfauflhasifhalifsa2242435ห่กดหสรด้หสดห้ดสหด้หสเรีเนสไำีดหสดีหฟนกหดsjfosjfsgisdjasfiuahlfauflhasifhalifsa2242435ห่กดหสรด้หสดห้ดสหด้หสเรีเนสไำีดหสดีหฟนกหดsjfosjfsgisdjasfiuahlfauflhasifhalifsa2242435ห่กดหสรด้หสดห้ดสหด้หสเรีเนสไำีดหสดีหฟนกหดsjfosjfsgisdjasfiuahlfauflhasifhalifsa2242435ห่กดหสรด้หสดห้ดสหด้หสเรีเนสไำีดหสดีหฟนกหดsjfosjfsgisdjasfiuahlfauflhasifhalifsa2242435ห่กดหสรด้หสดห้ดสหด้หสเรีเนสไำีดหสดีหฟนกหดsjfosjfsgisdjasfiuahlfauflhasifhalifsa2242435ห่กดหสรด้หสดห้ดสหด้หสเรีเนสไำีดหสดีหฟนกหดsjfosjfsgisdjasfiuahlfauflhasifhalifsa2242435ห่กดหสรด้หสดห้ดสหด้หสเรีเนสไำีดหสดีหฟนกหดsjfosjfsgisdjasfiuahlfauflhasifhalifsa2242435ห่กดหสรด้หสดห้ดสหด้หสเรีเนสไำีดหสดีหฟนกหดsjfosjfsgisdjasfiuahlfauflhasifhalifsa2242435ห่กดหสรด้หสดห้ดสหด้หสเรีเนสไำีดหสดีหฟนกหดsjfosjfsgisdjasfiuahlfauflhasifhalifsa2242435ห่กดหสรด้หสดห้ดสหด้หสเรีเนสไำีดหสดีหฟนกหดsjfosjfsgisdj
    Set Test Variable    ${de_note}
    ELSE IF    '${filed}' == 'Invalid_declare_note'
    ${de_note}    Set Variable    |||
    Set Test Variable    ${de_note}
    ELSE IF    '${filed}' == 'Valid_Length_mule_ref_code'
    ${length_ref}    Get Length    ${REF_CODE}   
    Should Be Equal As Numbers    ${length_ref}    10
    Set Test Variable    ${REF_CODE}
    ELSE IF    '${filed}' == 'Invalida_Length_mule_ref_code'
    ${REF_CODE}    Set Variable    ${REF_CODE}9
    ${length_ref}    Get Length    ${REF_CODE}
    Should Be Equal As Numbers    ${length_ref}    11
    Set Test Variable    ${REF_CODE}
    ELSE IF    '${filed}' == 'Invalida_mule_ref_code'
    ${REF_CODE}    Set Variable    eriทดสอบ!@
    Set Test Variable    ${REF_CODE}
    ELSE IF    '${filed}' == 'Valid_Length_mule_identity_id'
    ${length_iden_id}=    Get Length    ${PERSONAL_ID}
    Should Be Equal As Numbers    ${length_iden_id}    35
    Log    Identity ID มีความยาว ${length_iden_id} ตัวอักษร    
    Set Test Variable    ${PERSONAL_ID}
    ELSE IF    '${filed}' == 'Valid_20cha_mule_identity_id'
    ${length_iden_id}=    Get Length    ${PERSONAL_ID}
    Should Be Equal As Numbers    ${length_iden_id}    20
    Log    Identity ID มีความยาว ${length_iden_id} ตัวอักษร    
    Set Test Variable    ${PERSONAL_ID}
    ELSE IF    '${filed}' == 'Invalid_mule_identity_id'
    ${PERSONAL_ID}    Set Variable    |||
    Set Test Variable    ${PERSONAL_ID}
    ELSE IF    '${filed}' == 'Invalid_mule_identity_id_and_type_must_2'
    ${PERSONAL_ID}    Set Variable    ||||||||||||||||||
    ${iden_type}    Set Variable    2
    Set Test Variable    ${PERSONAL_ID}
    Set Test Variable    ${iden_type}
    ELSE IF    '${filed}' == 'Invalid_mule_identity_id_and_type_must_3'
    ${PERSONAL_ID}    Set Variable    평 안 하 다
    ${iden_type}    Set Variable    3
    Set Test Variable    ${PERSONAL_ID}
    Set Test Variable    ${iden_type}
    ELSE IF    '${filed}' == 'Invalid_mule_identity_id_and_ref_code_not_match'
    ${REF_CODE}    Set Variable    VW38483474
    Set Test Variable    ${REF_CODE}
    ELSE IF    '${filed}' == 'Invalid_de_reason_code_and_de_reason_not_match'
    ${REF_CODE}    Set Variable    KK38483474
    Set Test Variable    ${REF_CODE}
    ELSE IF    '${filed}' == 'Invalid_Length_mule_identity_id'
    ${PERSONAL_ID}    Set Variable    142983472042422492420492424209499342
    ${length_iden}    Get Length    ${PERSONAL_ID}
    Should Be Equal As Numbers    ${length_iden}    36
    Set Test Variable    ${PERSONAL_ID}
    ELSE IF    '${filed}' == 'Invalid_mule_identity_type'
    ${iden_type}    Set Variable    T
    Set Test Variable    ${iden_type}
    ELSE IF    '${filed}' == 'Valid_mule_identity_type_must_2'
    ${iden_type}    Set Variable    2
    Set Test Variable    ${iden_type}
    ELSE IF    '${filed}' == 'Valid_mule_identity_type_must_3'
    ${iden_type}    Set Variable    3
    Set Test Variable    ${iden_type}
    ELSE IF    '${filed}' == 'Invalid_Length_mule_identity_type'
    ${iden_type}    Set Variable    111111111111111111111
    Set Test Variable    ${iden_type}
    ELSE IF    '${filed}' == 'Valid_mule_title'
    ${TITLE}    Set Variable    djaoifjafoiaหกดห่นดรหด่หวดห่ดวฟกฟดนรห่ดวฟ123455678
    ${length_title}    Get Length    ${TITLE}
    Should Be Equal As Numbers    ${length_title}    50
    Log    Title มีความยาว ${length_title} ตัวอักษร   
    Set Test Variable    ${TITLE}
    ELSE IF    '${filed}' == 'Invalid_mule_title'
    ${TITLE}    Set Variable    ||||
    Set Test Variable    ${TITLE}
    ELSE IF    '${filed}' == 'Invalid_Length_mule_title'
    ${TITLE}    Set Variable    djaoifjafoiaหกดห่นดรหด่หวดห่ดวฟกฟดนรห่ดวฟ1234556789
    Set Test Variable    ${TITLE}
    ELSE IF    '${filed}' == 'Valid_Length_mule_name'
    ${FIRST_NAME}    Set Variable    djaoifjafoiaหกดห่นดรหด่หวดห่ดวฟกฟดนรห่ดวฟ1234556789djaoifjafoiaหกดห่นดรหด่หวดห่ดวฟกฟดนรห่ดวฟ1234556789djaoifjafoiaหกดห่นดรหด่หวดห่ดวฟกฟดนรห่ดวฟ1234556789djaoifjafoiaหกดห่นดรหด่หวดห่ดวฟกฟดนรห่ดวฟ1234556789djaoifjafoiaหกดห่นดรหด่หวดห่ดวฟกฟดนรห่ดวฟ12345567890
    ${length_name}    Get Length    ${FIRST_NAME}
    Should Be Equal As Numbers    ${length_name}    256
    Log    ชื่อ มีความยาว ${length_name} ตัวอักษร   
    Set Test Variable    ${FIRST_NAME}
    ELSE IF    '${filed}' == 'Invalid_mule_name'
    ${FIRST_NAME}    Set Variable    ||||
    Set Test Variable    ${FIRST_NAME}
    ELSE IF    '${filed}' == 'Invalid_Length_mule_name'
    ${FIRST_NAME}    Set Variable    djaoifjafoiaหกดห่นดรหด่หวดห่ดวฟกฟดนรห่ดวฟ1234556789djaoifjafoiaหกดห่นดรหด่หวดห่ดวฟกฟดนรห่ดวฟ1234556789djaoifjafoiaหกดห่นดรหด่หวดห่ดวฟกฟดนรห่ดวฟ1234556789djaoifjafoiaหกดห่นดรหด่หวดห่ดวฟกฟดนรห่ดวฟ1234556789djaoifjafoiaหกดห่นดรหด่หวดห่ดวฟกฟดนรห่ดวฟ12345567890s 
    Set Test Variable    ${FIRST_NAME}
    ELSE IF    '${filed}' == 'Valid_Length_mule_surname'
    ${LAST_NAME}    Set Variable    djaoifjafoiaหกดห่นดรหด่หวดห่ดวฟกฟดนรห่ดวฟ1234556789djaoifjafoiaหกดห่นดรหด่หวดห่ดวฟกฟดนรห่ดวฟ1234556789djaoifjafoiaหกดห่นดรหด่หวดห่ดวฟกฟดนรห่ดวฟ1234556789djaoifjafoiaหกดห่นดรหด่หวดห่ดวฟกฟดนรห่ดวฟ1234556789djaoifjafoiaหกดห่นดรหด่หวดห่ดวฟกฟดนรห่ดวฟ12345567890
    ${length_lastname}    Get Length    ${LAST_NAME}
    Should Be Equal As Numbers    ${length_lastname}    256
    Log    ชื่อ มีความยาว ${length_lastname} ตัวอักษร   
    Set Test Variable    ${LAST_NAME}
    ELSE IF    '${filed}' == 'Invalid_mule_surname'
    ${LAST_NAME}    Set Variable    ||||
    Set Test Variable    ${LAST_NAME}
    ELSE IF    '${filed}' == 'Invalid_Length_mule_surname'
    ${LAST_NAME}    Set Variable    |djaoifjafoiaหกดห่นดรหด่หวดห่ดวฟกฟดนรห่ดวฟ1234556789djaoifjafoiaหกดห่นดรหด่หวดห่ดวฟกฟดนรห่ดวฟ1234556789djaoifjafoiaหกดห่นดรหด่หวดห่ดวฟกฟดนรห่ดวฟ1234556789djaoifjafoiaหกดห่นดรหด่หวดห่ดวฟกฟดนรห่ดวฟ1234556789djaoifjafoiaหกดห่นดรหด่หวดห่ดวฟกฟดนรห่ดวฟ12345567890
    Set Test Variable    ${LAST_NAME}
    ELSE IF    '${filed}' == 'Valid_mule_birth_date'
    # แปลง str แปลง %y replace - year
    ${BIRTH_DATE_THAI}=    Evaluate    datetime.datetime.strptime("${BIRTH_DATE_THAI}", "%Y-%m-%d").replace(year=datetime.datetime.strptime("${BIRTH_DATE_THAI}", "%Y-%m-%d").year - 543).date()    modules=datetime
    Set Test Variable    ${BIRTH_DATE_THAI}
    ELSE IF    '${filed}' == 'Invalid_mule_birth_date'
    ${BIRTH_DATE_THAI}=    Evaluate    datetime.datetime.strptime("${BIRTH_DATE_THAI}", "%Y-%m-%d").strftime("%Y%m%d")    modules=datetime
    Set Test Variable    ${BIRTH_DATE_THAI}
    ELSE IF    '${filed}' == 'Invalid_string_mule_birth_date'
    ${BIRTH_DATE_THAI}    Set Variable    Test-ทส-TS
    Set Test Variable    ${BIRTH_DATE_THAI}
    ELSE IF    '${filed}' == 'Invalid_day_mule_birth_date'
    ${BIRTH_DATE_THAI}=    Evaluate    datetime.datetime.now().strftime('%Y-%m-' + '32')    modules=datetime
    Set Test Variable    ${BIRTH_DATE_THAI}
    ELSE IF    '${filed}' == 'Invalid_month_mule_birth_date'
    ${BIRTH_DATE_THAI}=    Evaluate    datetime.datetime.now().strftime('%Y-13-' + '%d')    modules=datetime
    Set Test Variable    ${BIRTH_DATE_THAI}
    ELSE IF    '${filed}' == 'Invalid_Length_mule_birth_date'
    ${BIRTH_DATE_THAI}=    Evaluate    datetime.datetime.now().strftime('%Y-%m-%d2')    modules=datetime
    Set Test Variable    ${BIRTH_DATE_THAI}
    ELSE IF    '${filed}' == 'Valid_Length_mule_nationality'
    ${NATIONALITY}=    Set Variable    TH
    ${length_nation}    Get Length    ${NATIONALITY}
    Should Be Equal As Numbers    ${length_nation}    2
    Log    ชื่อ มีความยาว ${length_nation} ตัวอักษร  
    Set Test Variable    ${NATIONALITY}
    ELSE IF    '${filed}' == 'Invalid_mule_nationality'
    ${NATIONALITY}=    Set Variable    th
    Set Test Variable    ${NATIONALITY}
    ELSE IF    '${filed}' == 'Invalid_Length_mule_nationality'
    ${NATIONALITY}=    Set Variable    TH1
    Set Test Variable    ${NATIONALITY}
    ELSE IF    '${filed}' == 'Valid_Length_police_case_id'
    ${po_case_id}=    Set Variable    djaoifjafoiaหกนรห่ดวฟ123455678
    ${length_po_id}    Get Length    ${po_case_id}
    Should Be Equal As Numbers    ${length_po_id}    30
    Log     มีความยาว ${length_po_id} ตัวอักษร  
    Set Test Variable    ${po_case_id}
    ELSE IF    '${filed}' == 'Invalid_Length_police_case_id'
    ${po_case_id}=    Set Variable    djaoifjafoiaหกนรห่ดวฟ123455678A
    ${length_po_id}    Get Length    ${po_case_id}
    Log     มีความยาว ${length_po_id} ตัวอักษร  
    Set Test Variable    ${po_case_id}
    ELSE IF    '${filed}' == 'Invalid_police_case_id'
    ${po_case_id}=    Set Variable    ||||
    Set Test Variable    ${po_case_id}
    ELSE IF    '${filed}' == 'Valid__Length_police_case_type'
    ${po_case_type}=    Set Variable    33
    ${length_po_type}    Get Length    ${po_case_type}
    Should Be Equal As Numbers    ${length_po_type}    2
    Log     มีความยาว ${length_po_type} ตัวอักษร  
    Set Test Variable    ${po_case_type}
    ELSE IF    '${filed}' == 'Invalid_Length_police_case_type'
    ${po_case_type}=    Set Variable    333
    ${length_po_type}    Get Length    ${po_case_type}
    Should Be Equal As Numbers    ${length_po_type}    3
    Log     มีความยาว ${length_po_type} ตัวอักษร  
    Set Test Variable    ${po_case_type}
    ELSE IF    '${filed}' == 'Invalid_police_case_type'
    ${po_case_type}=    Set Variable    Ts
    Set Test Variable    ${po_case_type}
    ELSE IF    '${filed}' == 'Valid__Length_police_case_report_date'
    ${po_case_rp_date}=    Set Variable    2500-01-01
    ${length_po_case_rp_date}    Get Length    ${po_case_rp_date}
    Should Be Equal As Numbers    ${length_po_case_rp_date}    10
    Log     มีความยาว ${length_po_case_rp_date} ตัวอักษร  
    Set Test Variable    ${po_case_rp_date}
    ELSE IF    '${filed}' == 'Invalid_police_case_report_date'
    ${po_case_rp_date}=    Set Variable    25670101
    Set Test Variable    ${po_case_rp_date}
    ELSE IF    '${filed}' == 'Invalid_Character_police_case_report_date'
    ${po_case_rp_date}=    Set Variable    Test-$%-ทส
    Set Test Variable    ${po_case_rp_date}
    ELSE IF    '${filed}' == 'Invalid_Day_police_case_report_date'
    ${po_case_rp_date}=    Set Variable    2500-01-32
    Set Test Variable    ${po_case_rp_date}
    ELSE IF    '${filed}' == 'Invalid_Month_police_case_report_date'
    ${po_case_rp_date}=    Set Variable    2500-13-02
    Set Test Variable    ${po_case_rp_date}
    ELSE IF    '${filed}' == 'Invalid_Length_police_case_report_date'
    ${po_case_rp_date}=    Set Variable    2500-13-021
    ${length_po_case_rp_date}    Get Length    ${po_case_rp_date}
    Should Be Equal As Numbers    ${length_po_case_rp_date}    11
    Log     มีความยาว ${length_po_case_rp_date} ตัวอักษร  
    Set Test Variable    ${po_case_rp_date}
    ELSE IF    '${filed}' == 'Valid__Length_mule_account_no'
    ${ACCOUNT_NUMBER}=    Set Variable    10111033464343425232352525253535355
    ${length_acc_number}    Get Length    ${ACCOUNT_NUMBER}
    Should Be Equal As Numbers    ${length_acc_number}    35
    Log     มีความยาว ${length_acc_number} ตัวอักษร  
    Set Test Variable    ${ACCOUNT_NUMBER}
    ELSE IF    '${filed}' == 'Invalid_mule_account_no'
    ${ACCOUNT_NUMBER}=    Set Variable    TjsadjaoUskdก่ดนรห่ดหนด่หหกห
    Set Test Variable    ${ACCOUNT_NUMBER}
    ELSE IF    '${filed}' == 'Invalid_Length_mule_account_no'
    ${ACCOUNT_NUMBER}=    Set Variable    101110334643434252323525252535353556
    ${length_acc_number}    Get Length    ${ACCOUNT_NUMBER}
    Should Be Equal As Numbers    ${length_acc_number}    36
    Set Test Variable    ${ACCOUNT_NUMBER}
    ELSE IF    '${filed}' == 'Valid_Length_mule_account_type'
    ${ACCOUNT_TYPE}=    Set Variable    TjsadjaoUMO344959505050669606060664
    ${length_acc_type}    Get Length    ${ACCOUNT_TYPE}
    Should Be Equal As Numbers    ${length_acc_type}    35
    Set Test Variable    ${ACCOUNT_TYPE}
    ELSE IF    '${filed}' == 'Invalid_mule_account_type'
    ${ACCOUNT_TYPE}=    Set Variable    เทส๑$%^&*#$^&
    Set Test Variable    ${ACCOUNT_TYPE}
    ELSE IF    '${filed}' == 'Invalid_Length_mule_account_type'
    ${ACCOUNT_TYPE}=    Set Variable    TjsadjaoUMO3449595050506696060606645
    ${length_acc_type}    Get Length    ${ACCOUNT_TYPE}
    Should Be Equal As Numbers    ${length_acc_type}    36
    Set Test Variable    ${ACCOUNT_TYPE}
    ELSE IF    '${filed}' == 'Valid_Length_mule_account_bankcode'
    ${BANK_CODE}=    Set Variable    004
    ${length_bankcode}    Get Length    ${BANK_CODE}
    Should Be Equal As Numbers    ${length_bankcode}    3
    Set Test Variable    ${BANK_CODE}
    ELSE IF    '${filed}' == 'Invalid_mule_account_bankcode'
    ${BANK_CODE}=    Set Variable    กขT
    Set Test Variable    ${BANK_CODE}
    ELSE IF    '${filed}' == 'Invalid_Length_mule_account_bankcode'
    ${BANK_CODE}=    Set Variable    TjsadjaoUMO3sds4495950606645seifjsoifiiaodjaidjliadakdaflsafhisfhslufshfliusfhsuาก่รดห่ดหกทดสอบTeadjsfoisjfsjosjfsojfsaojfafjaojfajdaaiojdaoj
    ${length_bankcode}    Get Length    ${BANK_CODE}
    Should Be Equal As Numbers    ${length_bankcode}    141
    Set Test Variable    ${BANK_CODE}
    ELSE IF    '${filed}' == 'Valid_Length_mule_account_bankname'
    ${BANK_NAME}=    Set Variable    TjsadjaoUMO3449595050506696060606645seifjsoifiiaodjaidjliadakdaflsafhisfhslufshfliusfhsuาก่รดห่ดหกร้อหนอ้หออก่ดหดำ้หรีด้หรด้หาีด้หด่รหี่ดหรห
    ${length_bankcode}    Get Length    ${BANK_NAME}
    Should Be Equal As Numbers    ${length_bankcode}    140
    Set Test Variable    ${BANK_NAME}
    ELSE IF    '${filed}' == 'Invalid_Length_mule_account_bankname'
    ${BANK_NAME}=    Set Variable    TjsadjaoUMO3449595050506696060606A645seifjsoifiiaodjaidjliadakdaflsafhisfhslufshfliusfhsuาก่รดห่ดหกร้อหนอ้หออก่ดหดำ้หรีด้หรด้หาีด้หด่รหี่ดหรห
    ${length_bankcode}    Get Length    ${BANK_NAME}
    Should Be Equal As Numbers    ${length_bankcode}    141
    Set Test Variable    ${BANK_NAME}
    ELSE IF    '${filed}' == 'Invalid_mule_account_bankname'
    ${BANK_NAME}=    Set Variable    ||||
    Set Test Variable    ${BANK_NAME}
    ELSE IF    '${filed}' == 'Valid_Length_police_rank'
    ${po_rank}=    Set Variable    TjsadjaoUMO344959505msof่ห่ดกหร่ดหหา่าห่าผหฯฟไกฟดำ
    ${length_po_rank}    Get Length    ${po_rank}
    Should Be Equal As Numbers    ${length_po_rank}    50
    Set Test Variable    ${po_rank}
    ELSE IF    '${filed}' == 'Invalid_Length_police_rank'
    ${po_rank}=    Set Variable    TjsadjaoUMO344959S505msof่ห่ดกหร่ดหหา่าห่าผหฯฟไกฟดำ
    ${length_po_rank}    Get Length    ${po_rank}
    Should Be Equal As Numbers    ${length_po_rank}    51
    Set Test Variable    ${po_rank}
    ELSE IF    '${filed}' == 'Invalid_police_rank'
    ${po_rank}=    Set Variable    |||
    Set Test Variable    ${po_rank}
    ELSE IF    '${filed}' == 'Valid_Length_police_name'
    ${po_name}=    Set Variable    kdfspofkjsoijgากยนด่หยด่หนดฟดาฟบดาฟหดฟยเวหย่ดหหรนด้หร้เหนรด้นหด้ฟนดฟ้แรผแJIIJNJDIMDKDIMKDKJFNJFJNDJ1
    ${length_po_name}    Get Length    ${po_name}
    Should Be Equal As Numbers    ${length_po_name}    100
    Set Test Variable    ${po_name}
    ELSE IF    '${filed}' == 'Invalid_Length_police_name'
    ${po_name}=    Set Variable    kdfspofkjsoijgากยนด่หยSด่หนดฟดาฟบดาฟหดฟยเวหย่ดหหรนด้หร้เหนรด้นหด้ฟนดฟ้แรผแJIIJNJDIMDKDIMKDKJFNJFJNDJ1
    ${length_po_name}    Get Length    ${po_name}
    Should Be Equal As Numbers    ${length_po_name}    101
    Set Test Variable    ${po_name}
    ELSE IF    '${filed}' == 'Invalid_police_name'
    ${po_name}=    Set Variable    |||||||
    Set Test Variable    ${po_name}
    ELSE IF    '${filed}' == 'Valid_Length_police_surname'
    ${po_surname}=    Set Variable    kdfspofkjsoijgากยนด่หยด่หนดฟดาฟบดาฟหดฟยเวหย่ดหหรนด้หร้เหนรด้นหด้ฟนดฟ้แรผแJIIJNJDIMDKDIMKDKJFNJFJNDJ1
    ${length_po_surname}    Get Length    ${po_surname}
    Should Be Equal As Numbers    ${length_po_surname}    100
    Set Test Variable    ${po_surname}
    ELSE IF    '${filed}' == 'Invalid_Length_police_surname'
    ${po_surname}=    Set Variable    kdfspofkjsoijgากยนด่หยด่หSนดฟดาฟบดาฟหดฟยเวหย่ดหหรนด้หร้เหนรด้นหด้ฟนดฟ้แรผแJIIJNJDIMDKDIMKDKJFNJFJNDJ1
    ${length_po_surname}    Get Length    ${po_surname}
    Should Be Equal As Numbers    ${length_po_surname}    101
    Set Test Variable    ${po_surname}
    ELSE IF    '${filed}' == 'Invalid_police_surname'
    ${po_surname}=    Set Variable    ||||||||
    Set Test Variable    ${po_surname}
    ELSE IF    '${filed}' == 'Valid_Length_police_job_title'
    ${po_job_title}=    Set Variable    kdfspofkjsoijgากยนด่หยด่หนดฟดาฟบดาฟหดฟยเวหย่ดหหรนด้หร้เหนรด้นหด้ฟนดฟ้แรผแJIIJNJDIMDKDIMKDKJFNJFJNDJ1
    ${length_po_job_title}    Get Length    ${po_job_title}
    Should Be Equal As Numbers    ${length_po_job_title}    100
    Set Test Variable    ${po_job_title}
    ELSE IF    '${filed}' == 'Invalid_Length_police_job_title'
    ${po_job_title}=    Set Variable    kdfspofkjsoijgาSกยนด่หยด่หนดฟดาฟบดาฟหดฟยเวหย่ดหหรนด้หร้เหนรด้นหด้ฟนดฟ้แรผแJIIJNJDIMDKDIMKDKJFNJFJNDJ1
    ${length_po_job_title}    Get Length    ${po_job_title}
    Should Be Equal As Numbers    ${length_po_job_title}    101
    Set Test Variable    ${po_job_title}
    ELSE IF    '${filed}' == 'Invalid_police_job_title'
    ${po_job_title}=    Set Variable    |||||||
    Set Test Variable    ${po_job_title}
    ELSE IF    '${filed}' == 'Valid_Length_police_org'
    ${po_org}=    Set Variable    FNJFJNDJ12kdfspofkjsoijgากยนด่หยด่กไพไพไหนดฟดาฟบดาฟหดฟยเวหย่ดหหรนด้หร้เหนรด้นหด้ฟนดฟ้แรผแJIIJNJDIMDKนดฟดาฟบดาฟหดฟยเวหย่ำไไดหหรนด้หนดฟ้แรผแJIIJNJFNJFJNDJ1ToUMO3ดสTt๒.~!@#$%^&*'_-_+ =-@-$%:;?.><,1234*&^
    ${length_po_org}    Get Length    ${po_org}
    Should Be Equal As Numbers    ${length_po_org}    200
    Set Test Variable    ${po_org}
    ELSE IF    '${filed}' == 'Invalid_Length_police_org'
    ${po_org}=    Set Variable    FNJFJNDJS12kdfspofkjsoijgากยนด่หยด่กไพไพไหนดฟดาฟบดาฟหดฟยเวหย่ดหหรนด้หร้เหนรด้นหด้ฟนดฟ้แรผแJIIJNJDIMDKนดฟดาฟบดาฟหดฟยเวหย่ำไไดหหรนด้หนดฟ้แรผแJIIJNJFNJFJNDJ1ToUMO3ดสTt๒.~!@#$%^&*'_-_+ =-@-$%:;?.><,1234*&^
    ${length_po_org}    Get Length    ${po_org}
    Should Be Equal As Numbers    ${length_po_org}    201
    Set Test Variable    ${po_org}
    ELSE IF    '${filed}' == 'Invalid_police_org'
    ${po_org}=    Set Variable    |||||||
    Set Test Variable    ${po_org}
    ELSE IF    '${filed}' == 'Valid_Length_police_tel'
    ${po_tel}=    Set Variable    0888888888,099999999
    ${length_po_tel}    Get Length    ${po_tel}
    Should Be Equal As Numbers    ${length_po_tel}    20
    Set Test Variable    ${po_tel}
    ELSE IF    '${filed}' == 'Invalid_police_tel'
    ${po_tel}=    Set Variable    |||||
    Set Test Variable    ${po_tel}
    ELSE IF    '${filed}' == 'Invalid_Length_police_tel'
    ${po_tel}=    Set Variable    0888888888,0999999999
    ${length_po_tel}    Get Length    ${po_tel}
    Should Be Equal As Numbers    ${length_po_tel}    21
    Set Test Variable    ${po_tel}
    ELSE IF    '${filed}' == 'Valid_Length_police_email'
    ${po_email}=    Set Variable    umaporn.artjdo_ifjso-Tdjsofijs932sdjsda@sfrd.co.th
    ${length_po_email}    Get Length    ${po_email}
    Should Be Equal As Numbers    ${length_po_email}    50
    Set Test Variable    ${po_email}
    ELSE IF    '${filed}' == 'Invalid_police_email'
    ${po_email}=    Set Variable    umaporn.artjdoifjsoTdjsofijsจต932sdjsda@sfrd.co.th
    Set Test Variable    ${po_email}
    ELSE IF    '${filed}' == 'Invalid_Length_police_email'
    ${po_email}=    Set Variable    Aumaporn.artjdo_ifjso-Tdjsofijs932sdjsda@sfrd.co.th
    ${length_po_email}    Get Length    ${po_email}
    Should Be Equal As Numbers    ${length_po_email}    51
    Set Test Variable    ${po_email}
    ELSE IF    '${filed}' == 'Invalid_Missing_field_uuid'
    ${uuid}=    Set Variable    ${EMPTY}
    Set Test Variable    ${uuid}
    ELSE IF    '${filed}' == 'Invalid_Missing_field_de_type_code'
    ${de_type_code}=    Set Variable    ${EMPTY}
    Set Test Variable    ${de_type_code}
    ELSE IF    '${filed}' == 'Invalid_Missing_field_de_type'
    ${de_type}=    Set Variable    ${EMPTY}
    Set Test Variable    ${de_type}
    ELSE IF    '${filed}' == 'Invalid_Missing_field_withdraw_date'
    ${CREATE_DATETIME_THAI}=    Set Variable    ${EMPTY}
    Set Test Variable    ${CREATE_DATETIME_THAI}
    ELSE IF    '${filed}' == 'Invalid_Missing_field_declare_reason_code'
    ${ran_declare_reason_code}=    Set Variable    ${EMPTY}
    Set Test Variable    ${ran_declare_reason_code}
    ELSE IF    '${filed}' == 'Invalid_Missing_field_declare_reason'
    ${ran_declare_reason}=    Set Variable    ${EMPTY}
    Set Test Variable    ${ran_declare_reason}
    ELSE IF    '${filed}' == 'Invalid_Missing_field_declare_note'
    ${de_note}=    Set Variable    ${EMPTY}
    Set Test Variable    ${de_note}
    ELSE IF    '${filed}' == 'Invalid_Missing_field_mule_ref_code'
    ${REF_CODE}=    Set Variable    ${EMPTY}
    Set Test Variable    ${REF_CODE}
    ELSE IF    '${filed}' == 'Invalid_Missing_field_mule_identity_id'
    ${PERSONAL_ID}=    Set Variable    ${EMPTY}
    Set Test Variable    ${PERSONAL_ID}
    ELSE IF    '${filed}' == 'Invalid_Missing_field_mule_identity_type'
    ${iden_type}=    Set Variable    ${EMPTY}
    Set Test Variable    ${iden_type}
    ELSE IF    '${filed}' == 'Invalid_Missing_field_mule_title'
    ${TITLE}=    Set Variable    ${EMPTY}
    Set Test Variable    ${TITLE}
    ELSE IF    '${filed}' == 'Invalid_Missing_field_mule_name'
    ${FIRST_NAME}=    Set Variable    ${EMPTY}
    Set Test Variable    ${FIRST_NAME}
    ELSE IF    '${filed}' == 'Invalid_Missing_field_mule_surname'
    ${LAST_NAME}=    Set Variable    ${EMPTY}
    Set Test Variable    ${LAST_NAME}
    ELSE IF    '${filed}' == 'Invalid_Missing_field_mule_birth_date'
    ${BIRTH_DATE_THAI}=    Set Variable    ${EMPTY}
    Set Test Variable    ${BIRTH_DATE_THAI}
    ELSE IF    '${filed}' == 'Invalid_Missing_field_mule_nationality'
    ${NATIONALITY}=    Set Variable    ${EMPTY}
    Set Test Variable    ${NATIONALITY}
    ELSE IF    '${filed}' == 'Invalid_Missing_field_police_case_id'
    ${po_case_id}=    Set Variable    ${EMPTY}
    Set Test Variable    ${po_case_id}
    ELSE IF    '${filed}' == 'Invalid_Missing_field_police_case_type'
    ${po_case_type}=    Set Variable    ${EMPTY}
    Set Test Variable    ${po_case_type}
    ELSE IF    '${filed}' == 'Invalid_Missing_field_police_case_report_date'
    ${po_case_rp_date}=    Set Variable    ${EMPTY}
    Set Test Variable    ${po_case_rp_date}
    ELSE IF    '${filed}' == 'Invalid_Missing_field_mule_account_no'
    ${ACCOUNT_NUMBER}=    Set Variable    ${EMPTY}
    Set Test Variable    ${ACCOUNT_NUMBER}
    ELSE IF    '${filed}' == 'Invalid_Missing_field_mule_account_type'
    ${ACCOUNT_TYPE}=    Set Variable    ${EMPTY}
    Set Test Variable    ${ACCOUNT_TYPE}
    ELSE IF    '${filed}' == 'Invalid_Missing_field_mule_account_bankcode'
    ${BANK_CODE}=    Set Variable    ${EMPTY}
    Set Test Variable    ${BANK_CODE}
    ELSE IF    '${filed}' == 'Invalid_Missing_field_mule_account_bankname'
    ${BANK_NAME}=    Set Variable    ${EMPTY}
    Set Test Variable    ${BANK_NAME}
    ELSE IF    '${filed}' == 'Invalid_Missing_field_police_rank'
    ${po_rank}=    Set Variable    ${EMPTY}
    Set Test Variable    ${po_rank}
    ELSE IF    '${filed}' == 'Invalid_Missing_field_police_name'
    ${po_name}=    Set Variable    ${EMPTY}
    Set Test Variable    ${po_name}
    ELSE IF    '${filed}' == 'Invalid_Missing_field_police_surname'
    ${po_surname}=    Set Variable    ${EMPTY}
    Set Test Variable    ${po_surname}
    ELSE IF    '${filed}' == 'Invalid_Missing_field_police_job_title'
    ${po_job_title}=    Set Variable    ${EMPTY}
    Set Test Variable    ${po_job_title}
    ELSE IF    '${filed}' == 'Invalid_Missing_field_police_org'
    ${po_org}=    Set Variable    ${EMPTY}
    Set Test Variable    ${po_org}
    ELSE IF    '${filed}' == 'Invalid_Missing_field_police_tel'
    ${po_tel}=    Set Variable    ${EMPTY}
    Set Test Variable    ${po_tel}
    ELSE IF    '${filed}' == 'Invalid_Missing_field_police_email'
    ${po_email}=    Set Variable    ${EMPTY}
    Set Test Variable    ${po_email}
    ELSE IF    '${filed}' == 'Valid_field_de_type_code_must_be_1'
    ${de_type_code}=    Set Variable    1
    Should Be Equal As Numbers    ${de_type_code}    1
    Set Test Variable    ${de_type_code}
    ELSE IF    '${filed}' == 'Invalid_field_de_type_code_not_must_be_1'
    ${de_type_code}=    Set Variable    5
    Should Be Equal As Numbers    ${de_type_code}    5
    Set Test Variable    ${de_type_code}
    ELSE IF    '${filed}' == 'Invalid_field_does_not_sys'
    ${PERSONAL_ID}=    Set Variable    7229594553800
    ${REF_CODE}=    Set Variable    VW89439588
    Set Test Variable    ${PERSONAL_ID}
    Set Test Variable    ${REF_CODE}
    ELSE IF    '${filed}' == 'Invalid_field_ref_code_exact'
    ${REF_CODE}=    Set Variable    WAU18XAO05
    Set Test Variable    ${REF_CODE}
    ELSE IF    '${filed}' == 'Invalid_card_id_not_logis'
    ${PERSONAL_ID}=    Set Variable    2772118293172
    Set Test Variable    ${PERSONAL_ID}
    ELSE IF    '${filed}' == 'Invalid_withdraw_date_current_date_up1'
    ${CREATE_DATETIME_THAI}=    Evaluate    (datetime.datetime.now() + datetime.timedelta(days=1)).strftime('%Y-%m-%d')    modules=datetime
    Set Test Variable    ${CREATE_DATETIME_THAI}
    ELSE IF    '${filed}' == 'Invalid_withdraw_date_current_date_year_2499'
    ${po_case_rp_date}=    Evaluate    datetime.datetime.now().strftime('2499'+'-%m-%d')    modules=datetime
    Set Test Variable    ${po_case_rp_date}
    ELSE IF    '${filed}' == 'Invalid_po_case_id_preceded_LWTC_not_match'
    ${po_case_id}=    Set Variable    R256710300002
    Set Test Variable    ${po_case_id}
    ELSE IF    '${filed}' == 'Valid_po_case_id_preceded_LWTC'
    Run Keyword If  ${index} == 0  Set Test Variable  ${po_case_id}     L256710300002
    Run Keyword If  ${index} == 1  Set Test Variable  ${po_case_id}     W256710300002
    Run Keyword If  ${index} == 2  Set Test Variable  ${po_case_id}     T256710300002
    Run Keyword If  ${index} == 3  Set Test Variable  ${po_case_id}     C256710300002
    Set Test Variable    ${po_case_id}
    ELSE IF    '${filed}' == 'Valid_mule_nationality'
    Should Be Equal    ${NATIONALITY}    GB
    ELSE IF    '${filed}' == 'Invlid_mule_nationality'
    ${NATIONALITY}    Set Variable    EZ
    Should Be Equal    ${NATIONALITY}    EZ
    Set Test Variable    ${NATIONALITY}
    ELSE IF    '${filed}' == 'Invlid_mule_birth_date'
    ${BIRTH_DATE_THAI}=    Evaluate    (datetime.datetime.now().year + 544).__str__() + '-' + datetime.datetime.now().strftime('%m-%d')    modules=datetime
    Set Test Variable    ${BIRTH_DATE_THAI}
    ELSE IF    '${filed}' == 'Invlid_withdraw_date'
    ${CREATE_DATETIME_THAI}=    Evaluate    (datetime.datetime.now().year + 544).__str__() + '-' + datetime.datetime.now().strftime('%m-%d')    modules=datetime
    Set Test Variable    ${CREATE_DATETIME_THAI}
    ELSE
    log       not match any keyword
    END

Should be withdraw black mule status is ${success}
     Connect To CFR Database
        ${sql}=    Catenate
        ...    select *
        ...    from AOC_BLACK_MULE_PERSON PS
        ...     join AOC_BLACK_MULE_ACCOUNT AC on PS.ID = AC.BLACK_MULE_PERSON_ID
        ...     join AOC_BLACK_MULE_CASE CAE on AC.ID = CAE.BLACK_MULE_ACCOUNT_ID
        ...     JOIN AOC_WITHDRAW_MULE_REPO repo on PS.CARD_ID = repo.MULE_IDENTITY_ID
        ...     JOIN AOC_SFTP_WITHDRAW_MULE_REQUEST_FILE_DETAIL aswmrfd ON repo.FILE_DETAIL_ID = ASWMRFD.ID 
		...     JOIN AOC_SFTP_WITHDRAW_MULE_REQUEST_FILE_INFO aswmrfi ON ASWMRFI.ID = ASWMRFD.FILE_ID 
		...     WHERE PS.STATUS = 'INACTIVE' AND aswmrfi.FILE_NAME = '${Filename_Req_blackmule}.gpg'
        ${query}=    Query All    ${db_connect}    ${sql}
        ${length_query}    Get Length    ${query}
        FOR     ${index}    IN RANGE    0    ${length_query}
            ${result}=   set variable    ${query[${index}]}
            ${DB_Status}=    set variable    ${result}[STATUS]
            Should Be Equal As Strings    ${DB_Status}    ${WithDrawBlackMule.${success}.status}
        END
Copy file and input data ${data}
    ${prepara_filename}     Set Variable    CFR_WithdrawBlackMule_${data}.json
    Copy File    ${CURDIR}/../keywords/object5000/${prepara_filename}    ${CURDIR}/../keywords/Data/${directory}.json

PreparaData brown mule ${data}
    connect to cfr database horse
        ${sql}=    Catenate
        ...    select *
        ...    from BROWN_MULE_PERSON 
        ...    FETCH FIRST ${data} ROWS ONLY
        ${query}=    Query All    ${db_connect}    ${sql}
        ${length_query}    Get Length    ${query}
        FOR     ${index}    IN RANGE    0    ${length_query}
            ${result}=   set variable    ${query[${index}]}
            ${PERSONAL}=    set variable    ${result}[PERSONAL_ID]
            ${REF_CODE}=    set variable    ${result}[REF_CODE]
            ${PERSONAL_ID}=    decrypt cfr string '${PERSONAL}'
            set test variable    ${PERSONAL_ID}
            set test variable    ${REF_CODE}
        END

PreparaData White mule rule ${data}
     Connect To CFR Database
        ${sql}=    Catenate    
        ...    select PERSONAL_ID,
        ...           ACCOUNT_NUMBER,
        ...           BANK_CODE,
        ...           REF_CODE,
        ...           MAX(RULE_MAXX) as RULE_MAX
        ...    from (select FA.PERSONAL_ID, MULE.REF_CODE, FA.ACCOUNT_NUMBER, BANK_CODE, MIN(RULE_ID) as RULE_MAXX
        ...      from FRAUD_PERSON FP
        ...                   join FRAUD_ACCOUNT FA on FP.PERSONAL_ID = FA.PERSONAL_ID
        ...                   join FRAUD_ACCOUNT_APPLY_FRAUD_RULE FAAFR on FA.ID = FAAFR.ACCOUNT_ID
        ...                   LEFT JOIN FRAUD_REF_CODE_MULE MULE ON FP.PERSONAL_ID = MULE.PERSONAL_ID
        ...                   LEFT JOIN AOC_BLACK_MULE_PERSON MPS on FP.PERSONAL_ID = MPS.CARD_ID
        ...           where FP.FRAUD_LEVEL is null
        ...            and FA.IS_ACTIVE = '5'
        ...            and MPS.ID is null
        ...            and MULE.REF_CODE is not null
        ...          group by ACCOUNT_NUMBER, FA.PERSONAL_ID, BANK_CODE, MULE.REF_CODE)
        ...    where RULE_MAXX = '1'
        ...    GROUP BY PERSONAL_ID, ACCOUNT_NUMBER, BANK_CODE, REF_CODE
        ...    FETCH FIRST ${data} ROWS ONLY
        ${query}=    Query All    ${db_connect}    ${sql}
        ${length_query}    Get Length    ${query}
        FOR     ${index}    IN RANGE    0    ${length_query}
            ${result}=   set variable    ${query[${index}]}
            ${PERSONAL}=    set variable    ${result}[PERSONAL_ID]
            ${REF_CODE}=    set variable    ${result}[REF_CODE]
            ${PERSONAL_ID}=    decrypt cfr string '${PERSONAL}'
            set test variable    ${PERSONAL_ID}
            set test variable    ${REF_CODE}
        END

PreparaData Black mule withdraw again ${data}
     Connect To CFR Database
        ${sql}=    Catenate
        ...    select *
        ...    from AOC_BLACK_MULE_PERSON PS
        ...     join AOC_BLACK_MULE_ACCOUNT AC on PS.ID = AC.BLACK_MULE_PERSON_ID
        ...     join AOC_BLACK_MULE_CASE CAE on AC.ID = CAE.BLACK_MULE_ACCOUNT_ID
        ...     LEFT JOIN AOC_WITHDRAW_MULE_REPO repo on PS.WITHDRAW_MULE_REPO_ID = repo.ID
        ...     LEFT JOIN FRAUD_PERSON FPS on PS.CARD_ID = FPS.PERSONAL_ID
        ...        where NOTE = 'AUTODATA'
        ...        AND STATUS = 'INACTIVE'
        ...        and FRAUD_LEVEL is null
        ...    FETCH FIRST ${data} ROWS ONLY
        ${query}=    Query All    ${db_connect}    ${sql}
        ${length_query}    Get Length    ${query}
        FOR     ${index}    IN RANGE    0    ${length_query}
            ${result}=   set variable    ${query[${index}]}
            ${PERSONAL}=    set variable    ${result}[CARD_ID]
            ${REF_CODE}=    set variable    ${result}[REF_CODE]
            ${PERSONAL_ID}=    decrypt cfr string '${PERSONAL}'
            set test variable    ${PERSONAL_ID}
            set test variable    ${REF_CODE}
        END

PreparaData mule rule 1 ${data}
     Connect To CFR Database
        ${sql}=    Catenate    
        ...    select PERSONAL_ID,
        ...           ACCOUNT_NUMBER,
        ...           BANK_CODE,
        ...           REF_CODE,
        ...           MAX(RULE_MAXX) as RULE_MAX
        ...    from (select FA.PERSONAL_ID, MULE.REF_CODE, FA.ACCOUNT_NUMBER, BANK_CODE, MIN(RULE_ID) as RULE_MAXX
        ...      from FRAUD_PERSON FP
        ...                   join FRAUD_ACCOUNT FA on FP.PERSONAL_ID = FA.PERSONAL_ID
        ...                   join FRAUD_ACCOUNT_APPLY_FRAUD_RULE FAAFR on FA.ID = FAAFR.ACCOUNT_ID
        ...                   LEFT JOIN FRAUD_REF_CODE_MULE MULE ON FP.PERSONAL_ID = MULE.PERSONAL_ID
        ...                   LEFT JOIN AOC_BLACK_MULE_PERSON MPS on FP.PERSONAL_ID = MPS.CARD_ID
        ...           where FP.FRAUD_LEVEL = '2'
        ...            and FA.IS_ACTIVE = '1'
        ...            and MPS.ID is null
        ...            and MULE.REF_CODE is not null
        ...          group by ACCOUNT_NUMBER, FA.PERSONAL_ID, BANK_CODE, MULE.REF_CODE)
        ...    where RULE_MAXX = '1'
        ...    GROUP BY PERSONAL_ID, ACCOUNT_NUMBER, BANK_CODE, REF_CODE
        ...    FETCH FIRST ${data} ROWS ONLY
        ${query}=    Query All    ${db_connect}    ${sql}
        ${length_query}    Get Length    ${query}
        FOR     ${index}    IN RANGE    0    ${length_query}
            ${result}=   set variable    ${query[${index}]}
            ${PERSONAL}=    set variable    ${result}[PERSONAL_ID]
            ${REF_CODE}=    set variable    ${result}[REF_CODE]
            ${PERSONAL_ID}=    decrypt cfr string '${PERSONAL}'
            set test variable    ${PERSONAL_ID}
            set test variable    ${REF_CODE}
        END

PreparaData mule rule 2 ${data}
     Connect To CFR Database
        ${sql}=    Catenate    
        ...    select PERSONAL_ID,
        ...           ACCOUNT_NUMBER,
        ...           BANK_CODE,
        ...           REF_CODE,
        ...           MAX(RULE_MAXX) as RULE_MAX
        ...    from (select FA.PERSONAL_ID, MULE.REF_CODE, FA.ACCOUNT_NUMBER, BANK_CODE, MIN(RULE_ID) as RULE_MAXX
        ...      from FRAUD_PERSON FP
        ...                   join FRAUD_ACCOUNT FA on FP.PERSONAL_ID = FA.PERSONAL_ID
        ...                   join FRAUD_ACCOUNT_APPLY_FRAUD_RULE FAAFR on FA.ID = FAAFR.ACCOUNT_ID
        ...                   LEFT JOIN FRAUD_REF_CODE_MULE MULE ON FP.PERSONAL_ID = MULE.PERSONAL_ID
        ...                   LEFT JOIN AOC_BLACK_MULE_PERSON MPS on FP.PERSONAL_ID = MPS.CARD_ID
        ...           where FP.FRAUD_LEVEL = '2'
        ...            and FA.IS_ACTIVE = '1'
        ...            and MPS.ID is null
        ...            and MULE.REF_CODE is not null
        ...          group by ACCOUNT_NUMBER, FA.PERSONAL_ID, BANK_CODE, MULE.REF_CODE)
        ...    where RULE_MAXX = '2'
        ...    GROUP BY PERSONAL_ID, ACCOUNT_NUMBER, BANK_CODE, REF_CODE
        ...    FETCH FIRST ${data} ROWS ONLY
        ${query}=    Query All    ${db_connect}    ${sql}
        ${length_query}    Get Length    ${query}
        FOR     ${index}    IN RANGE    0    ${length_query}
            ${result}=   set variable    ${query[${index}]}
            ${PERSONAL}=    set variable    ${result}[PERSONAL_ID]
            ${REF_CODE}=    set variable    ${result}[REF_CODE]
            ${PERSONAL_ID}=    decrypt cfr string '${PERSONAL}'
            set test variable    ${PERSONAL_ID}
            set test variable    ${REF_CODE}
        END
