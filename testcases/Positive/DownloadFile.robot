*** Settings ***
Resource  ../../resources/imports.robot
*** Variables ***
@{NAMES}    John    Alice    Bob    Charlie    David    Emma    Frank    Grace    Mac    Mon  
...    Ko    Pop    Hey    Sam    Lily    Jack    Mia    Tom    Lucy    Max  
...    Sarah    Henry    Olivia    Leo    Ava    Daniel    Sophie    Chris    Ellie    Ben  
...    Zoe    Alex    Kate    James    Emily    Ryan    Anna    Oliver    Sophia    Noah  
...    Jessica    Ethan    Isabella    Lucas    Chloe    Adam    Megan    Nathan    Ruby    Dylan  
@{LASTNAME}    Smith    Johnson    Brown    Taylor    Anderson    Thomas    Jackson    White    Harris    Martin  
...    Thompson    Garcia    Martinez    Robinson    Clark    Rodriguez    Lewis    Lee    Walker    Hall  
...    Allen    Young    King    Wright    Scott    Green    Adams    Baker    Nelson    Carter  
...    Mitchell    Perez    Roberts    Turner    Phillips    Campbell    Parker    Evans    Edwards    Collins  
...    Stewart    Sanchez    Morris    Rogers    Reed    Cook    Morgan    Bell    Murphy    Bailey  


*** Test Cases ***

test
    read file blob
    api filetobase64
    api uploadfile
    # api upload confirm need fileid

Sead dark brown mule round before 11:00
    [Tags]    11:00
    Genarate file upload dark brown mule is 11
    api filetobase64 xlsx
    api uploadfile
    api uploadfile confirm
Sead dark brown mule round before 15:00
    [Tags]    15:00
    Genarate file upload dark brown mule is 15
    api filetobase64 xlsx
    api uploadfile
    api uploadfile confirm
Sead dark brown mule round before 19:00
    [Tags]    19:00
    Genarate file upload dark brown mule is 19
    api filetobase64 xlsx
    api uploadfile
    api uploadfile confirm
Sead dark brown mule round before 09:00 for CXL
    [Tags]    09:00
    Genarate file upload dark brown mule is 09 for CXL
    api filetobase64 xlsx for loop CXL
    api uploadfile for loop CXL
    api uploadfile confirm for loop CXL
clear DB to night 
    [Tags]    Clear
    get current datetime dark brown mule max
    check DB status detail is REJECT_ALL before Clear
    clear DB for loop
    # clear DB 
clear DB to night CXL
    [Tags]    ClearCXL
    get current datetime dark brown mule max
    clear DB for loop CXL
    # clear DB CXL and NEW

*** Keywords ***

read file blob
       connect to cfr database horse
       ${sql}=   catenate      SELECT FILE_CONTENT FROM BROWN_MULE_UPLOAD_FILE_INFO bmufi 
        ...                    ORDER BY UPLOAD_DATETIME DESC
        ...                    FETCH FIRST 1 ROW ONLY
        ${query}=   query_all     ${db_connect}     ${sql}     # query
        ${result}=   set variable    ${query[0]}
        ${DB_REPORT}=    set variable    ${result}[FILE_CONTENT]
        # log     read file frist  ${DB_REPORT.read()}
        ${is_lob}    Evaluate    isinstance($DB_REPORT, cx_Oracle.LOB)    modules=cx_Oracle
        log     ${is_lob}
            ${file_data}=    Run Keyword If    ${is_lob} == True  
        ...    Evaluate    $DB_REPORT.read()    modules=cx_Oracle
        ...    ELSE  
        ...    Set Variable    ${DB_REPORT}
        Create Binary File   ${CURDIR}/../../keywords/Data/fileblob.json    ${file_data}
        Log To Console    ${file_data}
        # ${file_data_patj}    Get Binary File    ${CURDIR}/../../keywords/Data/fileblob.csv
        # log     ${file_data_patj}
api filetobase64
    ${API_URL}=   Set Variable     ${Host_GET}
    ${user-id-api}=   Set Variable     002cfr
    ${FILE_PATH}=   Set Variable     ${CURDIR}/../../keywords/Data/fileblob.json
    Set Test Variable    ${user-id-api}
    ${HEADERS}=   Create Dictionary   
    ...    Accept=*/*
    ...    X-Institution-Id=002
    ...    X-Roles=xxx
    ...    X-User-Id=xxx
    # ...    Content-Type=multipart/form-data
    ${file_content}=   Get Binary File   ${FILE_PATH}
    ${file_tuple}=   Create List   test.csv   ${file_content}   application/octet-stream
    # ชื่อไฟล์ set นี้ test.xlsx
    ${files}=   Create Dictionary   inputFileName=test.xlsx   inputFileContent=${file_tuple}
    Create Session  Brownmulefiletobase64  ${API_URL}     headers=${HEADERS}
    ${response}=    POST On Session   Brownmulefiletobase64  ${path.Brownmulefiletobase64}  files=${files}  expected_status=any
    Set Test Variable   ${data_filebase64}     ${response}
    Log    ${response.status_code}
    Log    ${response.json()}
    Log    ${response.json()}[fileName]
    Log    ${response.json()}[fileContent]
api filetobase64 xlsx
    ${API_URL}=   Set Variable     ${Host_GET}
    ${user-id-api}=   Set Variable     002cfr
    ${FILE_PATH}=   Set Variable     ${CURDIR}/../../keywords/Download/${filename}.xlsx
    Set Test Variable    ${user-id-api}
    ${HEADERS}=   Create Dictionary   
    ...    Accept=*/*
    ...    X-Institution-Id=002
    ...    X-Roles=xxx
    ...    X-User-Id=xxx
    # ...    Content-Type=multipart/form-data
    ${file_content}=   Get Binary File   ${FILE_PATH}
    log      ${file_content}
    ${file_tuple}=   Create List   ${filename}.xlsx   ${file_content}   application/octet-stream
    # ชื่อไฟล์ set นี้ test.xlsx
    ${files}=   Create Dictionary   inputFileName=${filename}.xlsx   inputFileContent=${file_tuple}
    Create Session  Brownmulefiletobase64  ${API_URL}     headers=${HEADERS}
    ${response}=    POST On Session   Brownmulefiletobase64  ${path.Brownmulefiletobase64}  files=${files}  expected_status=any
    Set Test Variable   ${data_filebase64}     ${response}
    Log    ${response.status_code}
    Log    ${response.json()}
    Log    ${response.json()}[fileName]
    Log    ${response.json()}[fileContent]
api filetobase64 xlsx for loop CXL
    ${list_data_filebase64}    Create List
    FOR  ${i}  IN RANGE  ${legth_query}
    log    ${list_file}[${i}]
    ${API_URL}=   Set Variable     ${Host_GET}
    ${user-id-api}=   Set Variable     002cfr
    ${FILE_PATH}=   Set Variable     ${CURDIR}/../../keywords/Download/${list_file}[${i}]
    Set Test Variable    ${user-id-api}
    ${HEADERS}=   Create Dictionary   
    ...    Accept=*/*
    ...    X-Institution-Id=002
    ...    X-Roles=xxx
    ...    X-User-Id=xxx
    # ...    Content-Type=multipart/form-data
    ${file_content}=   Get Binary File   ${FILE_PATH}
    log      ${file_content}
    ${file_tuple}=   Create List   ${list_file}[${i}]   ${file_content}   application/octet-stream
    # ชื่อไฟล์ set นี้ test.xlsx
    ${files}=   Create Dictionary   inputFileName=${list_file}[${i}]   inputFileContent=${file_tuple}
    Create Session  Brownmulefiletobase64  ${API_URL}     headers=${HEADERS}
    ${response}=    POST On Session   Brownmulefiletobase64  ${path.Brownmulefiletobase64}  files=${files}  expected_status=any
    Append To List    ${list_data_filebase64}    ${response.json()}
    # Set Test Variable   ${data_filebase64}     ${response}
    Log    ${response.status_code}
    Log    ${response.json()}
    Log    ${response.json()}[fileName]
    Log    ${response.json()}[fileContent]
    END
    Set Test Variable    ${list_data_filebase64}
api filetobase64 xlsx CXL
    ${API_URL}=   Set Variable     ${Host_GET}
    ${user-id-api}=   Set Variable     002cfr
    ${FILE_PATH}=   Set Variable     ${CURDIR}/../../keywords/Download/${filename_CXL}.xlsx
    Set Test Variable    ${user-id-api}
    ${HEADERS}=   Create Dictionary   
    ...    Accept=*/*
    ...    X-Institution-Id=002
    ...    X-Roles=xxx
    ...    X-User-Id=xxx
    # ...    Content-Type=multipart/form-data
    ${file_content}=   Get Binary File   ${FILE_PATH}
    log      ${file_content}
    ${file_tuple}=   Create List   ${filename_CXL}.xlsx   ${file_content}   application/octet-stream
    # ชื่อไฟล์ set นี้ test.xlsx
    ${files}=   Create Dictionary   inputFileName=${filename_CXL}.xlsx   inputFileContent=${file_tuple}
    Create Session  Brownmulefiletobase64  ${API_URL}     headers=${HEADERS}
    ${response}=    POST On Session   Brownmulefiletobase64  ${path.Brownmulefiletobase64}  files=${files}  expected_status=any
    Set Test Variable   ${data_filebase64}     ${response}
    Log    ${response.status_code}
    Log    ${response.json()}
    Log    ${response.json()}[fileName]
    Log    ${response.json()}[fileContent]
api uploadfile
    ${API_URL}=   Set Variable     ${Host_GET}
    ${HEADERS}=   Create Dictionary
    ...    Accept=*/*
    ...    X-Institution-Id=002
    ...    X-Roles=xxx
    ...    X-User-Id=xxx
    ...    Content-Type=application/json
    ${payload}=   Create Dictionary
    ...    fileName=${data_filebase64.json()}[fileName]
    ...    fileContent=${data_filebase64.json()}[fileContent]

    Create Session  BrownmuleUploadFile  ${API_URL}  headers=${HEADERS}
    ${response}=    POST On Session   BrownmuleUploadFile  
    ...    /fraud-brown-mule/upload-file  
    ...    json=${payload}  
    ...    expected_status=any
    Log    ${response.status_code}
    Log    ${response.json()}
    ${fileId}    Get From Dictionary    ${response.json()}    fileId
    Set Test Variable    ${fileId}
    Log    File ID: ${fileId}
api uploadfile for loop CXL
    ${list_data_uploadfile}    Create List
    FOR  ${i}  IN RANGE  ${legth_query}
    log    ${list_data_filebase64}[${i}]
    ${res}    Set Variable    ${list_data_filebase64}[${i}]
    log    ${res}[fileName]
    log    ${res}[fileContent]
    ${API_URL}=   Set Variable     ${Host_GET}
    ${HEADERS}=   Create Dictionary
    ...    Accept=*/*
    ...    X-Institution-Id=002
    ...    X-Roles=xxx
    ...    X-User-Id=xxx
    ...    Content-Type=application/json
    ${payload}=   Create Dictionary
    ...    fileName=${res}[fileName]
    ...    fileContent=${res}[fileContent]

    Create Session  BrownmuleUploadFile  ${API_URL}  headers=${HEADERS}
    ${response}=    POST On Session   BrownmuleUploadFile  
    ...    /fraud-brown-mule/upload-file  
    ...    json=${payload}  
    ...    expected_status=any
    Log    ${response.status_code}
    Log    ${response.json()}
    Append To List    ${list_data_uploadfile}    ${response.json()}
    Set Test Variable    ${list_data_uploadfile}
    ${fileId}    Get From Dictionary    ${response.json()}    fileId
    Set Test Variable    ${fileId}
    Log    File ID: ${fileId}
    END
api uploadfile confirm for loop CXL
    FOR  ${i}  IN RANGE  ${legth_query}
    log    ${list_data_uploadfile}[${i}]
    ${res}    Set Variable    ${list_data_uploadfile}[${i}]
    ${API_URL}=   Set Variable     ${Host_GET}
    ${HEADERS}=   Create Dictionary
    ...    Accept=*/*
    ...    X-Institution-Id=002
    ...    X-Roles=xxx
    ...    X-User-Id=xxx
    ...    Content-Type=application/json
    ${payload}=   Create Dictionary
    ...    id=${res}[fileId]
    Create Session  BrownmuleUploadFileToconfirm  ${API_URL}  headers=${HEADERS}
    ${response}=    POST On Session   BrownmuleUploadFileToconfirm  
    ...    /fraud-brown-mule/upload-file/confirm
    ...    json=${payload}  
    ...    expected_status=any
    Log    ${response.status_code}
    Log    ${response.json()}
    Should Be Equal As Integers    ${response.status_code}    200
    END
api uploadfile confirm
    ${API_URL}=   Set Variable     ${Host_GET}
    ${HEADERS}=   Create Dictionary
    ...    Accept=*/*
    ...    X-Institution-Id=002
    ...    X-Roles=xxx
    ...    X-User-Id=xxx
    ...    Content-Type=application/json
    ${payload}=   Create Dictionary
    ...    id=${fileId}
    Create Session  BrownmuleUploadFileToconfirm  ${API_URL}  headers=${HEADERS}
    ${response}=    POST On Session   BrownmuleUploadFileToconfirm  
    ...    /fraud-brown-mule/upload-file/confirm
    ...    json=${payload}  
    ...    expected_status=any
    Log    ${response.status_code}
    Log    ${response.json()}
    Should Be Equal As Integers    ${response.status_code}    200
Set Running Number Based On Date ${date}
    ${runingnumber}    Set Variable    0
    Run Keyword If  '${date}' == '09'  Set Test Variable  ${runingnumber}  009
    Run Keyword If  '${date}' == '11'  Set Test Variable  ${runingnumber}  111
    Run Keyword If  '${date}' == '15'  Set Test Variable  ${runingnumber}  115
    Run Keyword If  '${date}' == '19'  Set Test Variable  ${runingnumber}  119
Genarate file upload dark brown mule is ${date}
    get current datetime dark brown mule max
    Set Running Number Based On Date ${date}
    ${prepara_filename}     Set Variable    BrownMule_Registry_V1.0_002_NEW_${date}o'clock
    ${filename}     Set Variable    BrownMule_Registry_V1.0_002_NEW_${filenameDATE_YMD_THAI}_${runingnumber}
    ${random_personalID}    random_number_warrant    13
    ${random_banknumber}    random_number_warrant    10
    ${random_name}    Evaluate    random.choice(${NAMES})
    ${random_last_name}    Evaluate    random.choice(${LASTNAME})
    Set Test Variable    ${filename}
    #custom
    # ${w}    openpyxl.Load Workbook    filename=${prepara_filename}.xlsx
    # log     ${w}
    # ${q}    Update Excel Cell    file_path=${prepara_filename}.xlsx    row=3    col=12    value=${random_name}
    # log     ${q}
    #lib
    # Open Excel Document      filename=${CURDIR}/../../keywords/PreparaData/${prepara_filename}.xlsx   doc_id=docname1
    # Write Excel Cell	3  11    ${random_personalID}    
    # Write Excel Cell	3  12    ${random_name}    
    # Write Excel Cell	3  13    ${random_last_name}    
    # Write Excel Cell	3  18    ${random_banknumber}
    # Save Excel Document      filename=${CURDIR}/../../keywords/Download/${filename}.xlsx
    # Close Current Excel Document
    # Close All Excel Documents
    #copy to deleted frist fix accountbank
    Copy File    ${CURDIR}/../../keywords/PreparaData/${prepara_filename}.xlsx    ${CURDIR}/../../keywords/Download/${filename}.xlsx
Genarate file upload dark brown mule is ${date} for CXL
    get current datetime dark brown mule max
    connect to cfr database horse
    ${list_file}    Create List
    ${sql_files} =    Evaluate    ', '.join(["'{}'".format(f) for f in ['BrownMule_Registry_V1.0_002_NEW_${filenameDATE_YMD_THAI}_115.xlsx', 'BrownMule_Registry_V1.0_002_NEW_${filenameDATE_YMD_THAI}_111.xlsx', 'BrownMule_Registry_V1.0_002_NEW_${filenameDATE_YMD_THAI}_119.xlsx']])
    ${sql} =    Set Variable    SELECT * FROM BROWN_MULE_UPLOAD_FILE_INFO bmufi WHERE FILE_NAME IN (${sql_files})
    ${query}=   query_all     ${db_connect}     ${sql}     # query
    ${legth_query}    Get Length    ${query}
    Set Test Variable    ${legth_query}
    FOR  ${i}  IN RANGE   ${legth_query}
    ${result}=   set variable    ${query[${i}]}
    ${ID_INFO}=    set variable    ${result}[FILE_NAME]
    ${replace_name}=    Replace String    ${ID_INFO}    _NEW_    _CXL_
    ${matches}=    Get Regexp Matches    ${replace_name}    _(\\d{3})\\.xlsx$
    ${date}=       Set Variable    ${matches[0]}
    ${prepara_filename_CXL}     Set Variable    BrownMule_Registry_V1.0_002_CXL${date}
    ${filename_CXL}     Set Variable    ${replace_name}
    Append To List         ${list_file}       ${filename_CXL}
    Copy File    ${CURDIR}/../../keywords/PreparaData/${prepara_filename_CXL}    ${CURDIR}/../../keywords/Download/${filename_CXL}
    END
    Set Test Variable    ${list_file}
clear DB 
        connect to cfr database horse
        ${sql_files} =    Evaluate    ', '.join(["'{}'".format(f) for f in ['BrownMule_Registry_V1.0_002_NEW_${filenameDATE_YMD_THAI}_115.xlsx', 'BrownMule_Registry_V1.0_002_NEW_${filenameDATE_YMD_THAI}_111.xlsx', 'BrownMule_Registry_V1.0_002_NEW_${filenameDATE_YMD_THAI}_119.xlsx']])
        ${sql} =    Set Variable    SELECT * FROM BROWN_MULE_UPLOAD_FILE_INFO bmufi WHERE FILE_NAME IN (${sql_files})
        ${query}=   query_all     ${db_connect}     ${sql}     # query
        ${result}=   set variable    ${query[0]}
        ${result1}=   set variable    ${query[1]}
        ${result2}=   set variable    ${query[2]}
        ${ID_INFO}=    set variable    ${result}[ID]
        ${ID_INFO2}=    set variable    ${result1}[ID]
        ${ID_INFO3}=    set variable    ${result2}[ID]
        ${sql_files_detail} =    Evaluate    ', '.join(["'{}'".format(f) for f in ['${ID_INFO}', '${ID_INFO2}', '${ID_INFO3}']])
        ${sql} =    Set Variable    SELECT * FROM BROWN_MULE_UPLOAD_FILE_DETAIL bmufi WHERE FILE_INFO_ID IN (${sql_files_detail})
        ${query_detail}=   query_all     ${db_connect}     ${sql}     # query
        ${result_detail}=   set variable    ${query_detail[0]}
        ${result_detail1}=   set variable    ${query_detail[1]}
        ${result_detail2}=   set variable    ${query_detail[2]}
        ${ID_DETAIL}=    set variable    ${result_detail}[DETAIL_ID]
        ${ID_DETAIL2}=    set variable    ${result_detail1}[DETAIL_ID]
        ${ID_DETAIL3}=    set variable    ${result_detail2}[DETAIL_ID]
        ${sql_files_deleted_repo} =    Evaluate    ', '.join(["'{}'".format(f) for f in ['${ID_DETAIL}', '${ID_DETAIL2}', '${ID_DETAIL3}']])
        ${sql} =    Set Variable    DELETE FROM BROWN_MULE_REPO bmufi WHERE CREATE_FILE_DETAIL_ID IN (${sql_files_deleted_repo})
        ${query}=   update     ${db_connect}     ${sql}     # query
        ${sql} =    Set Variable    DELETE FROM BROWN_MULE_UPLOAD_FILE_DETAIL bmufi WHERE FILE_INFO_ID IN (${sql_files_detail})
        ${query}=   update     ${db_connect}     ${sql}     # query
        ${sql} =    Set Variable    DELETE FROM BROWN_MULE_UPLOAD_FILE_INFO bmufi WHERE FILE_NAME IN (${sql_files})
        ${query}=   update     ${db_connect}     ${sql}     # query
clear DB CXL and NEW
        connect to cfr database horse
        ${sql_files} =    Evaluate    ', '.join(["'{}'".format(f) for f in ['BrownMule_Registry_V1.0_002_NEW_${filenameDATE_YMD_THAI}_009.xlsx', 'BrownMule_Registry_V1.0_002_CXL_${filenameDATE_YMD_THAI}_009.xlsx']])
        ${sql} =    Set Variable    SELECT * FROM BROWN_MULE_UPLOAD_FILE_INFO bmufi WHERE FILE_NAME IN (${sql_files})
        ${query}=   query_all     ${db_connect}     ${sql}     # query
        ${result}=   set variable    ${query[0]}
        ${result1}=   set variable    ${query[1]}
        ${ID_INFO}=    set variable    ${result}[ID]
        ${ID_INFO2}=    set variable    ${result1}[ID]
        ${sql_files_detail} =    Evaluate    ', '.join(["'{}'".format(f) for f in ['${ID_INFO}', '${ID_INFO2}']])
        ${sql} =    Set Variable    SELECT * FROM BROWN_MULE_UPLOAD_FILE_DETAIL bmufi WHERE FILE_INFO_ID IN (${sql_files_detail})
        ${query_detail}=   query_all     ${db_connect}     ${sql}     # query
        ${result_detail}=   set variable    ${query_detail[0]}
        ${result_detail1}=   set variable    ${query_detail[1]}
        ${ID_DETAIL}=    set variable    ${result_detail}[DETAIL_ID]
        ${ID_DETAIL2}=    set variable    ${result_detail1}[DETAIL_ID]
        ${sql_files_deleted_repo} =    Evaluate    ', '.join(["'{}'".format(f) for f in ['${ID_DETAIL}', '${ID_DETAIL2}']])
        ${sql} =    Set Variable    DELETE FROM BROWN_MULE_REPO bmufi WHERE CREATE_FILE_DETAIL_ID IN (${sql_files_deleted_repo})
        ${query}=   update     ${db_connect}     ${sql}     # query
        ${sql} =    Set Variable    DELETE FROM BROWN_MULE_UPLOAD_FILE_DETAIL bmufi WHERE FILE_INFO_ID IN (${sql_files_detail})
        ${query}=   update     ${db_connect}     ${sql}     # query
        ${sql} =    Set Variable    DELETE FROM BROWN_MULE_UPLOAD_FILE_INFO bmufi WHERE FILE_NAME IN (${sql_files})
        ${query}=   update     ${db_connect}     ${sql}     # query

check DB status detail is ${status} before Clear 
        connect to cfr database horse
        # ${filenameDATE_YMD_THAI_V1}    Set Variable    ${filenameDATE_YMD_THAI_V1}%
        ${filenameDATE_YMD_THAI_V1}    Set Variable    ${thai_year}-__-__%
        ${sql} =    catenate    SELECT COUNT(*) FROM BROWN_MULE_UPLOAD_FILE_INFO bmufi WHERE STATUS_DETAIL = 'REJECT_ALL' AND ( FILE_NAME LIKE 'BrownMule_Registry_V1.0_002_NEW_${filenameDATE_YMD_THAI_V1}_111.xlsx' OR FILE_NAME LIKE 'BrownMule_Registry_V1.0_002_NEW_${filenameDATE_YMD_THAI_V1}_115.xlsx' OR FILE_NAME LIKE 'BrownMule_Registry_V1.0_002_${filenameDATE_YMD_THAI_V1}_119.xlsx' OR FILE_NAME LIKE 'BrownMule_Registry_V1.0_002_${filenameDATE_YMD_THAI_V1}_009.xlsx')
        # ${sql_detail} =    catenate    SELECT * FROM BROWN_MULE_UPLOAD_FILE_INFO bmufi WHERE STATUS_DETAIL = 'REJECT_ALL' AND ( FILE_NAME LIKE 'BrownMule_Registry_V1.0_002_NEW_2568-04-%_111.xlsx' OR FILE_NAME LIKE 'BrownMule_Registry_V1.0_002_NEW_2568-04-%_115.xlsx' OR FILE_NAME LIKE 'BrownMule_Registry_V1.0_002_NEW_2568-04-%_119.xlsx' OR FILE_NAME LIKE 'BrownMule_Registry_V1.0_002_NEW_2568-04-%_009.xlsx')
        ${query}=   query_all     ${db_connect}     ${sql}     # query
        # ${query_detail}=   query_all     ${db_connect}     ${sql_detail}     # query
    ${result_dict} =    Get From List    ${query}    0
    ${file_count} =    Get From Dictionary    ${result_dict}    COUNT(*)
    Set Test Variable    ${file_count}
    Log    File count: ${file_count}
    # FOR     ${index}     IN RANGE    ${file_count}
        IF   ${file_count} > 0
        ${sql} =    catenate    DELETE FROM BROWN_MULE_UPLOAD_FILE_INFO bmufi WHERE STATUS_DETAIL = '${status}' AND ( FILE_NAME LIKE 'BrownMule_Registry_V1.0_002_NEW_2568-04-%_111.xlsx' OR FILE_NAME LIKE 'BrownMule_Registry_V1.0_002_NEW_2568-04-%_115.xlsx' OR FILE_NAME LIKE 'BrownMule_Registry_V1.0_002_NEW_2568-04-%_119.xlsx' OR FILE_NAME LIKE 'BrownMule_Registry_V1.0_002_NEW_2568-04-%_009.xlsx')
        ${query}=   update     ${db_connect}     ${sql}     # query
        # ${result}=   set variable    ${query_detail[${index}]}
        # ${ID_INFO}=    set variable    ${result}[ID]
        ELSE
        log   error
        END    
    # END  

clear DB for loop
    connect to cfr database horse
    ${filenameDATE_YMD_THAI_V1}    Set Variable    ${thai_year}-__-__%
    ${sql} =    catenate    SELECT * FROM BROWN_MULE_UPLOAD_FILE_INFO bmufi WHERE STATUS_DETAIL = 'SUCCESS' AND ( FILE_NAME LIKE 'BrownMule_Registry_V1.0_002_NEW_${filenameDATE_YMD_THAI_V1}_111.xlsx' OR FILE_NAME LIKE 'BrownMule_Registry_V1.0_002_NEW_${filenameDATE_YMD_THAI_V1}_115.xlsx' OR FILE_NAME LIKE 'BrownMule_Registry_V1.0_002_NEW_${filenameDATE_YMD_THAI_V1}_119.xlsx' OR FILE_NAME LIKE 'BrownMule_Registry_V1.0_002_${filenameDATE_YMD_THAI_V1}_009.xlsx')
    # @{FILE_NAMES}    Set Variable       BrownMule_Registry_V1.0_002_NEW_${filenameDATE_YMD_THAI_V1}_115.xlsx    BrownMule_Registry_V1.0_002_NEW_${filenameDATE_YMD_THAI_V1}_111.xlsx    BrownMule_Registry_V1.0_002_NEW_${filenameDATE_YMD_THAI_V1}_119.xlsx
    # ${sql_files}=    Evaluate    ', '.join(["'{}'".format(f) for f in ${FILE_NAMES}])
    # ${sql}=    Set Variable    SELECT * FROM BROWN_MULE_UPLOAD_FILE_INFO WHERE FILE_NAME IN (${sql_files})
    ${query}=    Query All    ${db_connect}    ${sql}
    Log To Console    ${sql}
    ${num_files}=    Get Length    ${query}
    FOR    ${index}    IN RANGE    ${num_files}
        ${result}=    Set Variable    ${query[${index}]}
        ${id_info}=    Set Variable    ${result}[ID]
        ${sql}=    Set Variable    SELECT * FROM BROWN_MULE_UPLOAD_FILE_DETAIL WHERE FILE_INFO_ID = '${id_info}'
        ${detail_query}=    Query All    ${db_connect}    ${sql}
        FOR    ${detail}    IN    @{detail_query}
            ${id_detail}=    Set Variable    ${detail}[DETAIL_ID]
            ${sql}=    Set Variable    DELETE FROM BROWN_MULE_REPO WHERE CREATE_FILE_DETAIL_ID = '${id_detail}'
            Update    ${db_connect}    ${sql}
            ${sql}=    Set Variable    DELETE FROM BROWN_MULE_UPLOAD_FILE_DETAIL WHERE DETAIL_ID = '${id_detail}'
            Update    ${db_connect}    ${sql}
        ${sql}=    Set Variable    DELETE FROM BROWN_MULE_UPLOAD_FILE_INFO WHERE ID = '${id_info}'
        Update    ${db_connect}    ${sql}
        END
    END

clear DB for loop CXL
    connect to cfr database horse
    ${filenameDATE_YMD_THAI_V1}    Set Variable    ${thai_year}-__-__%
    ${sql} =    catenate    SELECT * FROM BROWN_MULE_UPLOAD_FILE_INFO bmufi WHERE    FILE_NAME LIKE 'BrownMule_Registry_V1.0_002_CXL_${filenameDATE_YMD_THAI_V1}_111.xlsx' OR FILE_NAME LIKE 'BrownMule_Registry_V1.0_002_CXL_${filenameDATE_YMD_THAI_V1}_115.xlsx' OR FILE_NAME LIKE 'BrownMule_Registry_V1.0_002_CXL_${filenameDATE_YMD_THAI_V1}_119.xlsx'
    # @{FILE_NAMES}    Set Variable    BrownMule_Registry_V1.0_002_CXL_${filenameDATE_YMD_THAI_V1}_111.xlsx    BrownMule_Registry_V1.0_002_CXL_${filenameDATE_YMD_THAI_V1}_115.xlsx    BrownMule_Registry_V1.0_002_CXL_${filenameDATE_YMD_THAI_V1}_119.xlsx
    # ${sql_files}=    Evaluate    ', '.join(["'{}'".format(f) for f in ${FILE_NAMES}])
    # ${sql}=    Set Variable    SELECT * FROM BROWN_MULE_UPLOAD_FILE_INFO WHERE FILE_NAME IN (${sql_files})
    ${query}=    Query All    ${db_connect}    ${sql}
    ${num_files}=    Get Length    ${query}
    FOR    ${index}    IN RANGE    ${num_files}
        ${result}=    Set Variable    ${query[${index}]}
        ${id_info}=    Set Variable    ${result}[ID]
        ${sql}=    Set Variable    SELECT * FROM BROWN_MULE_UPLOAD_FILE_DETAIL WHERE FILE_INFO_ID = '${id_info}'
        ${detail_query}=    Query All    ${db_connect}    ${sql}
        FOR    ${detail}    IN    @{detail_query}
            ${id_detail}=    Set Variable    ${detail}[DETAIL_ID]
            ${sql}=    Set Variable    DELETE FROM BROWN_MULE_REPO WHERE CREATE_FILE_DETAIL_ID = '${id_detail}'
            Update    ${db_connect}    ${sql}
            ${sql}=    Set Variable    DELETE FROM BROWN_MULE_UPLOAD_FILE_DETAIL WHERE DETAIL_ID = '${id_detail}'
            Update    ${db_connect}    ${sql}
        ${sql}=    Set Variable    DELETE FROM BROWN_MULE_UPLOAD_FILE_INFO WHERE ID = '${id_info}'
        Update    ${db_connect}    ${sql}
        END
    END