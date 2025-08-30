*** Settings ***
Resource  ../../resources/imports.robot

*** Test Cases ***
TC1_000_000 Warrant-H SP
    [Tags]   not_ready
    [Documentation]     bankcaseid is not bound to warrant_id
    Given create File Name Warrant H and รอบแรก TIME
    WHEN Create Warrant H FILE CSV
    THEN Get Data PoliceCaseNumber is null 0 and ${mastercase}
    WHEN Encrypt File GPG To NITMX ${FileName_Warrant}
    when login to sftp server and Put file by AOC
    WHEN Call API Sending file Warrant H from aoc to ITMX
    THEN Get File GPG From ITMX
    WHEN Check Response code Success GPG FILE
    # # THEN Check DB warrant H
    # THEN Check DB REQ and RES File To Deleted


TC2_000_000 Warrant-H SP
    [Tags]   not_ready
    [Documentation]     bankcaseid is not bound to warrant_id
    Given create File Name Warrant H and รอบแรก TIME
    WHEN Create Warrant H FILE CSV
    THEN SP Get Data PoliceCaseNumber is null 0 and ${mastercase}
    WHEN Encrypt File GPG To NITMX ${FileName_Warrant}
    when login to sftp server and Put file by AOC
    WHEN Call API Sending file Warrant H from aoc to ITMX
    THEN Get File GPG From ITMX
    WHEN Check Response code Success GPG FILE


# TC002_000_000 Warrant-H SP
#     [Tags]   not_ready
#     [Documentation]     bankcaseid is not bound to warrant_id
#     when login to sftp server and Put file by AOC_SP
#     THEN Get File GPG From ITMX Suspicious

# TC00_being Query clear all in database in table
#     get current datetime
#     Clear All Query date

TC1_111 LoadTest File
    [Documentation]     bankcaseid is not bound to warrant_id
    [Tags]    Reloop2  not_ready
    Set Test Variable   ${Start_num}  0
    # FOR  ${index}   IN RANGE   1    ${totalrun}
    Given create File Name Warrant H and รอบแรก TIME
    WHEN Create Warrant H FILE CSV
    THEN Get Data Police Case 002 Number is null 5000 and บุคคลธรรมดา
    WHEN Encrypt File GPG To NITMX ${FileName_Warrant}
    # when login to sftp server and Put file by AOC
    # WHEN Call API Sending file Warrant H from aoc to ITMX
    # THEN Get File GPG From ITMX
    # WHEN Check Response code Success GPG FILE

#     Given create File Name Warrant H and รอบแรก TIME
#     WHEN Create Warrant H FILE CSV
#     THEN Get Data Police Case 004 Number is null 100 and บุคคลธรรมดา
#     WHEN Encrypt File GPG To NITMX ${FileName_Warrant}
#     when login to sftp server and Put file by AOC
#     WHEN Call API Sending file Warrant H from aoc to ITMX
#     THEN Get File GPG From ITMX
#     WHEN Check Response code Success GPG FILE

#     Given create File Name Warrant H and รอบแรก TIME
#     WHEN Create Warrant H FILE CSV
#     THEN Get Data Police Case 006 Number is null 100 and บุคคลธรรมดา
#     WHEN Encrypt File GPG To NITMX ${FileName_Warrant}
#     when login to sftp server and Put file by AOC
#     WHEN Call API Sending file Warrant H from aoc to ITMX
#     THEN Get File GPG From ITMX
#     WHEN Check Response code Success GPG FILE

#     Given create File Name Warrant H and รอบแรก TIME
#     WHEN Create Warrant H FILE CSV
#     THEN Get Data Police Case 011 Number is null 100 and บุคคลธรรมดา
#     WHEN Encrypt File GPG To NITMX ${FileName_Warrant}
#     when login to sftp server and Put file by AOC
#     WHEN Call API Sending file Warrant H from aoc to ITMX
#     THEN Get File GPG From ITMX
#     WHEN Check Response code Success GPG FILE

#     Given create File Name Warrant H and รอบแรก TIME
#     WHEN Create Warrant H FILE CSV
#     THEN Get Data Police Case 014 Number is null 100 and บุคคลธรรมดา
#     WHEN Encrypt File GPG To NITMX ${FileName_Warrant}
#     when login to sftp server and Put file by AOC
#     WHEN Call API Sending file Warrant H from aoc to ITMX
#     THEN Get File GPG From ITMX
#     WHEN Check Response code Success GPG FILE

#     Given create File Name Warrant H and รอบแรก TIME
#     WHEN Create Warrant H FILE CSV
#     THEN Get Data Police Case 022 Number is null 100 and บุคคลธรรมดา
#     WHEN Encrypt File GPG To NITMX ${FileName_Warrant}
#     when login to sftp server and Put file by AOC
#     WHEN Call API Sending file Warrant H from aoc to ITMX
#     THEN Get File GPG From ITMX
#     WHEN Check Response code Success GPG FILE


#     Given create File Name Warrant H and รอบแรก TIME
#     WHEN Create Warrant H FILE CSV
#     THEN Get Data Police Case 025 Number is null 100 and บุคคลธรรมดา
#     WHEN Encrypt File GPG To NITMX ${FileName_Warrant}
#     when login to sftp server and Put file by AOC
#     WHEN Call API Sending file Warrant H from aoc to ITMX
#     THEN Get File GPG From ITMX
#     WHEN Check Response code Success GPG FILE

#     Given create File Name Warrant H and รอบแรก TIME
#     WHEN Create Warrant H FILE CSV
#     THEN Get Data Police Case 002 Number is null 100 and ชาวต่างชาติ
#     WHEN Encrypt File GPG To NITMX ${FileName_Warrant}
#     when login to sftp server and Put file by AOC
#     WHEN Call API Sending file Warrant H from aoc to ITMX
#     THEN Get File GPG From ITMX
#     WHEN Check Response code Success GPG FILE

#     Given create File Name Warrant H and รอบแรก TIME
#     WHEN Create Warrant H FILE CSV
#     THEN Get Data Police Case 004 Number is null 100 and ชาวต่างชาติ
#     WHEN Encrypt File GPG To NITMX ${FileName_Warrant}
#     when login to sftp server and Put file by AOC
#     WHEN Call API Sending file Warrant H from aoc to ITMX
#     THEN Get File GPG From ITMX
#     WHEN Check Response code Success GPG FILE

#     Given create File Name Warrant H and รอบแรก TIME
#     WHEN Create Warrant H FILE CSV
#     THEN Get Data Police Case 006 Number is null 100 and ชาวต่างชาติ
#     WHEN Encrypt File GPG To NITMX ${FileName_Warrant}
#     when login to sftp server and Put file by AOC
#     WHEN Call API Sending file Warrant H from aoc to ITMX
#     THEN Get File GPG From ITMX
#     WHEN Check Response code Success GPG FILE

#     Given create File Name Warrant H and รอบแรก TIME
#     WHEN Create Warrant H FILE CSV
#     THEN Get Data Police Case 011 Number is null 100 and ชาวต่างชาติ
#     WHEN Encrypt File GPG To NITMX ${FileName_Warrant}
#     when login to sftp server and Put file by AOC
#     WHEN Call API Sending file Warrant H from aoc to ITMX
#     THEN Get File GPG From ITMX
#     WHEN Check Response code Success GPG FILE

#     Given create File Name Warrant H and รอบแรก TIME
#     WHEN Create Warrant H FILE CSV
#     THEN Get Data Police Case 014 Number is null 100 and ชาวต่างชาติ
#     WHEN Encrypt File GPG To NITMX ${FileName_Warrant}
#     when login to sftp server and Put file by AOC
#     WHEN Call API Sending file Warrant H from aoc to ITMX
#     THEN Get File GPG From ITMX
#     WHEN Check Response code Success GPG FILE

#     Given create File Name Warrant H and รอบแรก TIME
#     WHEN Create Warrant H FILE CSV
#     THEN Get Data Police Case 022 Number is null 100 and ชาวต่างชาติ
#     WHEN Encrypt File GPG To NITMX ${FileName_Warrant}
#     when login to sftp server and Put file by AOC
#     WHEN Call API Sending file Warrant H from aoc to ITMX
#     THEN Get File GPG From ITMX
#     WHEN Check Response code Success GPG FILE


#     Given create File Name Warrant H and รอบแรก TIME
#     WHEN Create Warrant H FILE CSV
#     THEN Get Data Police Case 025 Number is null 100 and ชาวต่างชาติ
#     WHEN Encrypt File GPG To NITMX ${FileName_Warrant}
#     when login to sftp server and Put file by AOC
#     WHEN Call API Sending file Warrant H from aoc to ITMX
#     THEN Get File GPG From ITMX
#     WHEN Check Response code Success GPG FILE
#         Set Test Variable  ${index}
#     END

# TC001_111 LoadTest File
#     [Documentation]     bankcaseid is not bound to warrant_id
#     # [Tags]    Reloop
#     Set Test Variable   ${Start_num}  0
#     FOR  ${index}   IN RANGE   1    ${totalrun}
#     Given create File Name Warrant H and รอบแรก TIME
#     WHEN Create Warrant H FILE CSV
#     THEN Get Data Police Case Number is null 1000 and ชาวต่างชาติ
#     WHEN Encrypt File GPG To NITMX ${FileName_Warrant}
#     when login to sftp server and Put file by AOC
#         # Set Test Variable  ${index}
#     # ${Start_num}=    Evaluate  ${Start_num}+10
#     # END
#     WHEN Call API Sending file Warrant H from aoc to ITMX
#     THEN Get File GPG From ITMX
#     WHEN Check Response code Success GPG FILE
#     # THEN Check DB warrant H
#     # THEN Check DB REQ and RES File To Deleted
#         Set Test Variable  ${index}
#     END



TC001_001
    [Documentation]     bankcaseid is not bound to warrant_id
    Given create File Name Warrant H and รอบแรก TIME
    WHEN Create Warrant H FILE CSV
    THEN Get Data Police Case Number is null 1
    # THEN Get Data Police Case ${BANKCODE} Number is null ${row_number} and ${personal_type}
    WHEN Encrypt File GPG To NITMX ${FileName_Warrant}
    when login to sftp server and Put file by AOC
    WHEN Call API Sending file Warrant H from aoc to ITMX
    THEN Get File GPG From ITMX
    WHEN Check Response code Success GPG FILE
    THEN Check DB warrant H
    THEN Check DB REQ and RES File To Deleted

TC001_002
    [Documentation]  2req_file   warrant_id has been bound with other bankcaseid 
    Given create File Name Warrant H and รอบแรก TIME
    WHEN Create Warrant H FILE CSV
    THEN Get Data Police Case Number is null 1
    THEN Prepara Data Request CSV is 1 Negatives Test Case Bankcase_id is 25671010KBNK00102
    Set Test Variable    ${warrant_id_old}    ${warrant_id}    
    WHEN Encrypt File GPG To NITMX ${FileName_Warrant}
    when login to sftp server and Put file by AOC
    WHEN Call API Sending file Warrant H from aoc to ITMX
    Then Check file Request No.1
    Given create File Name Warrant H and รอบแรก TIME
    WHEN Create Warrant H FILE CSV
    THEN Get Data Police Case Number is null 1
    THEN Prepara Data Request CSV is 1 Negatives Test Case Bankcase_id is 25671010KBNK00122 and set warrant_id old to request file No.2 
    WHEN Encrypt File GPG To NITMX ${FileName_Warrant}
    when login to sftp server and Put file by AOC
    WHEN Call API Sending file Warrant H from aoc to ITMX
    THEN Get File GPG From ITMX
    WHEN Check Response code Success GPG FILE
    THEN Check DB warrant H
    THEN Check DB REQ and RES File To Deleted

TC005_003
    [Documentation]     bankcaseid is not bound to warrant_id
    Given create File Name Warrant H and รอบแรก TIME
    WHEN Create Warrant H FILE CSV
    THEN Get Data Police Case Number is null 1
    WHEN Encrypt File GPG To NITMX ${FileName_Warrant}
    when login to sftp server and Put file by AOC
    WHEN Call API Sending file Warrant H from aoc to ITMX
    THEN Get File GPG From ITMX
    WHEN Check Response code Success GPG FILE
    THEN Check DB warrant H
    THEN Check DB REQ and RES File To Deleted
TC005_017
    [Tags]  Retest
    Given create File Name Warrant H and รอบสอง TIME
    WHEN get current datetime negative
    WHEN Prepara Data Request CSV is 1 Negatives Test Case warrant_date is ${NDateTime}
    WHEN Encrypt File GPG To NITMX ${FileName_Warrant}
    when login to sftp server and Put file by AOC
    WHEN Call API Sending file Warrant H from aoc to ITMX
    THEN Get File GPG From ITMX
    WHEN Check Response code Success GPG FILE
    THEN Check DB warrant H
    THEN Check DB REQ and RES File To Deleted
TC005_018
    [Tags]  Retest
    Given create File Name Warrant H and รอบแรก TIME
    WHEN get current datetime negative
    WHEN Prepara Data Request CSV is 1 Negatives Test Case warrant_date is ${NDateTime}
    WHEN Encrypt File GPG To NITMX ${FileName_Warrant}
    when login to sftp server and Put file by AOC
    WHEN Call API Sending file Warrant H from aoc to ITMX
    THEN Get File GPG From ITMX
    WHEN Check Response code Success GPG FILE
    THEN Check DB warrant H
    THEN Check DB REQ and RES File To Deleted
TC006_003
    Given create File Name Warrant H and รอบแรก TIME
    WHEN Prepara Data Request CSV is 1 Negatives Test Case warrant_time is 15:00
    WHEN Encrypt File GPG To NITMX ${FileName_Warrant}
    when login to sftp server and Put file by AOC
    WHEN Call API Sending file Warrant H from aoc to ITMX
    THEN Get File GPG From ITMX
    WHEN Check Response code Success GPG FILE
    THEN Check DB warrant H
    THEN Check DB REQ and RES File To Deleted
TC006_008
    Given create File Name Warrant H and รอบแรก TIME
    WHEN Prepara Data Request CSV is 1 Negatives Test Case warrant_time is 23:59
    WHEN Encrypt File GPG To NITMX ${FileName_Warrant}
    when login to sftp server and Put file by AOC
    WHEN Call API Sending file Warrant H from aoc to ITMX
    THEN Get File GPG From ITMX
    WHEN Check Response code Success GPG FILE
    THEN Check DB warrant H
    THEN Check DB REQ and RES File To Deleted
TC008_001
    Given create File Name Warrant H and รอบแรก TIME
    WHEN Create Warrant H FILE CSV
    THEN Get Data Police Case Number is null 1
    WHEN Encrypt File GPG To NITMX ${FileName_Warrant}
    when login to sftp server and Put file by AOC
    WHEN Call API Sending file Warrant H from aoc to ITMX
    THEN Get File GPG From ITMX
    WHEN Check Response code Success GPG FILE
    THEN Check DB warrant H
    THEN Check DB master case File name REQ
    THEN Check DB REQ and RES File To Deleted
TC008_011
    [Documentation]    Valid file Name (GPG) 
    Given create File Name Warrant H and รอบแรก TIME
    WHEN Create Warrant H FILE CSV
    THEN Get Data Police Case Number is null 1
    WHEN Encrypt File GPG To NITMX ${FileName_Warrant}
    when login to sftp server and Put file by AOC
    WHEN Call API Sending file Warrant H from aoc to ITMX
    THEN Get File GPG From ITMX
    WHEN Check Response code Success GPG FILE
    THEN Check DB warrant H
    THEN Check DB master case File name REQ
    THEN Check DB master case File name RES
    THEN Check DB REQ and RES File To Deleted
TC008_012
    [Documentation]    Validate format  Response file
    Given create File Name Warrant H and รอบแรก TIME
    WHEN Create Warrant H FILE CSV
    THEN Get Data Police Case Number is null 1
    WHEN Encrypt File GPG To NITMX ${FileName_Warrant}
    when login to sftp server and Put file by AOC
    WHEN Call API Sending file Warrant H from aoc to ITMX
    THEN Get File GPG From ITMX
    WHEN Check Response code Success GPG FILE
    THEN Check DB warrant H
    THEN Check DB master case File name REQ
    THEN Check DB master case File name RES
    THEN Check DB REQ and RES File To Deleted
TC009_001
    [Documentation]    valid header line which sequence by fields name with Delimiter Character “ ; ” 
    Given create File Name Warrant H and รอบแรก TIME
    WHEN Create Warrant H FILE CSV
    THEN Get Data Police Case Number is null 1
    WHEN Encrypt File GPG To NITMX ${FileName_Warrant}
    when login to sftp server and Put file by AOC
    WHEN Call API Sending file Warrant H from aoc to ITMX
    THEN Get File GPG From ITMX
    WHEN Check Response code Success GPG FILE
    THEN Check DB warrant H
    THEN Check DB REQ and RES File To Deleted