*** Settings ***
Resource  ../../resources/imports.robot

*** Test Cases ***
# TC001_000_003 Encrypt File
#     Given create File Name Warrant H and รอบแรก TIME
#     WHEN Create Warrant H FILE CSV
#     THEN Get Data Police Case Number is null 5
#     WHEN Encrypt File GPG To NITMX ${FileName_Warrant}
#     when login to sftp server and Put file by AOC
#     WHEN Call API Sending file Warrant H from aoc to ITMX
#     THEN Get File GPG From ITMX
#     WHEN Check Response code Success GPG FILE
#     THEN Check DB warrant H
# TC001_000_004 Encrypt File
#     Given Decrypt File GPG NITMX and CFR_Warrant_H_25671105_0800_401_REQ
TC00_being Query clear all in database in table
    get current datetime
    Clear All Query date
TC001_001
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
    Given create File Name Warrant H and รอบสอง TIME
    WHEN Prepara Data Request CSV is 1 Negatives Test Case warrant_date is 2500-01-01
    WHEN Encrypt File GPG To NITMX ${FileName_Warrant}
    when login to sftp server and Put file by AOC
    WHEN Call API Sending file Warrant H from aoc to ITMX
    THEN Get File GPG From ITMX
    WHEN Check Response code Success GPG FILE
    THEN Check DB warrant H
    THEN Check DB REQ and RES File To Deleted
TC005_018
    Given create File Name Warrant H and รอบแรก TIME
    WHEN Prepara Data Request CSV is 1 Negatives Test Case warrant_date is 2501-01-01
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