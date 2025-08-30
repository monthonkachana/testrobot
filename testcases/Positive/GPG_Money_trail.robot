*** Settings ***
Resource  ../../resources/imports.robot

*** Test Cases ***
TC001_000_000 Warrant-H SP
    [Tags]   not_ready
    [Documentation]     bankcaseid is not bound to warrant_id
    Set Test Variable    ${row_number}   0
    FOR  ${index}   IN RANGE   0    ${totalrun}
    Given create File Name Money Trail
    WHEN Create Money Trail FILE CSV
    THEN Get Data Master case id ${row_number} and end row 500 
    WHEN Encrypt File GPG To NITMX ${FileName_Warrant}
    ${row_number}=  Evaluate   ${row_number}+500
    log to console    ${row_number}
    when login to sftp server and Put file by MTR_max
    END

TC002_000_000 Warrant-H SP
    [Tags]   not_ready
    [Documentation]     bankcaseid is not bound to warrant_id
    Set Test Variable    ${row_number}   0
    FOR  ${index}   IN RANGE   0    ${totalrun}
    Given create File Name Money Trail
    WHEN Create Money Trail FILE CSV
    THEN Get Data Master case id ${row_number} and end row ${numberRuning} 
    WHEN Encrypt File GPG To NITMX ${FileName_Warrant}
    ${row_number}=  Evaluate   ${row_number}+${numberRuning}
    log to console    ${row_number}
    when login to sftp server and Put file by MTR_Rawfile
    END


TC001_001
    [Documentation]     Validate Format file name (csv) - (MTR_REQ)
    ...                 > กรณีระบุชื่อไฟล์ตรงตาม Format (Success)
    Given create File Name Money Trail max
    WHEN Create Money Trail FILE CSV max
    THEN Get Data Master case id 7 max
    WHEN Encrypt File GPG To NITMX ${Request_MTR}
    when login to sftp server and Put file by MTR_max
    WHEN Call API Sending file MTRonetime from aoc to ITMX max
    THEN Get File GPG From ITMX for MTRonetime max
    WHEN Get Data TicketID max
    WHEN Check Response Code Success GPG FILE MTRonetime max
    THEN Check DB MTR Onetime max
    THEN Check DB REQ and RES MTR Onetime File To Deleted max

TC001_002
    [Documentation]     Validate CSV Header Request file
    ...                 > For CSV file format, at the first line must be contain header line which sequence by fields name with Delimiter Character “;”
    ...                 > กรณีระบุ Header ตรงตาม Format (Success)
    Given create File Name Money Trail max
    WHEN Create Money Trail FILE CSV max
    THEN Get Data Master case id 1 max
    WHEN Encrypt File GPG To NITMX ${Request_MTR}
    when login to sftp server and Put file by MTR_max
    WHEN Call API Sending file MTRonetime from aoc to ITMX max
    THEN Get File GPG From ITMX for MTRonetime max
    WHEN Get Data TicketID max
    WHEN Validate Header File REQ CSV MTR One time max
    WHEN Check Response Code Success GPG FILE MTRonetime max
    THEN Check DB MTR Onetime max
    THEN Check DB REQ and RES MTR Onetime File To Deleted max
    
TC001_003
    [Documentation]     Validate CSV Header Request file
    ...                 > For CSV file format, at the first line must be contain header line which sequence by fields name with Delimiter Character “;”
    ...                 > กรณีระบุ data fields ตรงตาม Format (Success)
    Given create File Name Money Trail max
    WHEN Create Money Trail FILE CSV max
    THEN Get Data Master case id 7 max
    WHEN Encrypt File GPG To NITMX ${Request_MTR}
    when login to sftp server and Put file by MTR_max
    WHEN Call API Sending file MTRonetime from aoc to ITMX max
    THEN Get File GPG From ITMX for MTRonetime max
    WHEN Get Data TicketID max
    WHEN Validate Header File REQ CSV MTR One time max
    WHEN Check Response Code Success GPG FILE MTRonetime max
    THEN Check DB MTR Onetime max
    THEN Check DB REQ and RES MTR Onetime File To Deleted max

TC001_004
    [Documentation]     Validate CSV Header Request file
    ...                 validation Response SUCCESS
    ...                 - code “0000”
    ...                 - message “SUCCESS”
    Given create File Name Money Trail max
    WHEN Create Money Trail FILE CSV max
    THEN Get Data Master case id 7 max
    WHEN Encrypt File GPG To NITMX ${Request_MTR}
    when login to sftp server and Put file by MTR_max
    WHEN Call API Sending file MTRonetime from aoc to ITMX max
    THEN Get File GPG From ITMX for MTRonetime max
    WHEN Get Data TicketID max
    WHEN Validate Header File REQ CSV MTR One time max
    WHEN Check Response Code Success GPG FILE MTRonetime max
    THEN Check DB MTR Onetime max
    THEN Check DB REQ and RES MTR Onetime File To Deleted max

TC002_001
    [Documentation]     Validate Format file name (csv) - (MTR_RES) > Success 
    Given create File Name Money Trail max
    WHEN Create Money Trail FILE CSV max
    THEN Get Data Master case id 8 max
    WHEN Encrypt File GPG To NITMX ${Request_MTR}
    when login to sftp server and Put file by MTR_max
    WHEN Call API Sending file MTRonetime from aoc to ITMX max
    THEN Get File GPG From ITMX for MTRonetime max
    WHEN Get Data TicketID max
    WHEN Check Response Code Success GPG FILE MTRonetime max
    THEN Check DB MTR Onetime max
    THEN Check DB REQ and RES MTR Onetime File To Deleted max

TC002_002
    [Documentation]     Validate CSV Header Response file
    ...                > For CSV file format, at the first line must be contain header line which sequence by 
    ...                  fields name with Delimiter Character “;” 
    Given create File Name Money Trail max
    WHEN Create Money Trail FILE CSV max
    THEN Get Data Master case id 8 max
    WHEN Encrypt File GPG To NITMX ${Request_MTR}
    when login to sftp server and Put file by MTR_max
    WHEN Call API Sending file MTRonetime from aoc to ITMX max
    THEN Get File GPG From ITMX for MTRonetime max
    WHEN Get Data TicketID max
    WHEN Validate Header File RES CSV MTR One time max
    WHEN Check Response Code Success GPG FILE MTRonetime max
    THEN Check DB MTR Onetime max
    THEN Check DB REQ and RES MTR Onetime File To Deleted max

TC002_003
    [Documentation]     Validate CSV Content data description
    ...                 > money trail Report Response data fields 
    Given create File Name Money Trail max
    WHEN Create Money Trail FILE CSV max
    THEN Get Data Master case id 8 max
    WHEN Encrypt File GPG To NITMX ${Request_MTR}
    when login to sftp server and Put file by MTR_max
    WHEN Call API Sending file MTRonetime from aoc to ITMX max
    THEN Get File GPG From ITMX for MTRonetime max
    WHEN Get Data TicketID max
    WHEN Check Response Code Success GPG FILE MTRonetime max
    THEN Check DB MTR Onetime max
    THEN Check DB REQ and RES MTR Onetime File To Deleted max

TC002_004
    [Documentation]     Validate CSV Tail data description
    ...                 > For data integrity checking purpose, all report generated by CFR system will be added 
    ...    one tailing lines that compose of these fields which first line must be sequenced by fields name with 
    ...    Delimiter Character “|”
    Given create File Name Money Trail max
    WHEN Create Money Trail FILE CSV max
    THEN Get Data Master case id 8 max
    WHEN Encrypt File GPG To NITMX ${Request_MTR}
    when login to sftp server and Put file by MTR_max
    WHEN Call API Sending file MTRonetime from aoc to ITMX max
    THEN Get File GPG From ITMX for MTRonetime max
    WHEN Get Data TicketID max
    WHEN Validate File RES CSV Tail Data
    WHEN Check Response Code Success GPG FILE MTRonetime max
    THEN Check DB MTR Onetime max
    THEN Check DB REQ and RES MTR Onetime File To Deleted max

TC003_001
    [Documentation]     Validate Format file Name (csv) - (ReportPolice)  > Success 
    Given create File Name Money Trail max
    WHEN Create Money Trail FILE CSV max
    THEN Get Data Master case id 1 max
    WHEN Encrypt File GPG To NITMX ${Request_MTR}
    when login to sftp server and Put file by MTR_max
    WHEN Call API Sending file MTRonetime from aoc to ITMX max
    WHEN Get Data TicketID max
    THEN Get File GPG From ITMX for MTRonetime And File Report Police max
    WHEN Check Response Code Success GPG FILE MTRonetime Report Police max
    THEN Check DB MTR Onetime max
    THEN Check DB REQ and RES MTR Onetime File To Deleted max

TC003_002
    [Documentation]     Validate CSV Header Report file
    ...                 > For CSV file format, at the first line must be contain header line which sequence by 
    ...                   fields name with Delimiter Character “;”
    Given create File Name Money Trail max
    WHEN Create Money Trail FILE CSV max
    THEN Get Data Master case id 1 max
    WHEN Encrypt File GPG To NITMX ${Request_MTR}
    when login to sftp server and Put file by MTR_max
    WHEN Call API Sending file MTRonetime from aoc to ITMX max
    WHEN Get Data TicketID max
    THEN Get File GPG From ITMX for MTRonetime And File Report Police max
    THEN Valid Header RES CSV File Report Police max
    WHEN Check Response Code Success GPG FILE MTRonetime Report Police max
    THEN Check DB MTR Onetime max
    THEN Check DB REQ and RES MTR Onetime File To Deleted max

TC003_003
    [Documentation]     Validate CSV data fields Report file
    ...                 > Police Report (Money trail report for police) data fields
    Given create File Name Money Trail max
    WHEN Create Money Trail FILE CSV max
    THEN Get Data Master case id 1 max
    WHEN Encrypt File GPG To NITMX ${Request_MTR}
    when login to sftp server and Put file by MTR_max
    WHEN Call API Sending file MTRonetime from aoc to ITMX max
    WHEN Get Data TicketID max
    THEN Get File GPG From ITMX for MTRonetime And File Report Police max
    WHEN Check Response Code Success GPG FILE MTRonetime Report Police max
    THEN Check DB MTR Onetime max
    THEN Check DB REQ and RES MTR Onetime File To Deleted max