*** Settings ***
Resource  ../../resources/imports.robot

*** Test Cases ***

# TC00_being Query clear all in database in table
#     get current datetime
#     Clear All Query date

TC002_001 
    Given create File Name Warrant H and รอบแรก TIME
    WHEN Prepara Data Request CSV is 1 Negatives Test Case warrant_id is id_empty
    WHEN Encrypt File GPG To NITMX ${FileName_Warrant}
    when login to sftp server and Put file by AOC
    WHEN Call API Sending file Warrant H from aoc to ITMX
    THEN Get File GPG From ITMX
    WHEN Check Response code Missing_require_warrant GPG FILE TO ERROR Is ${EMPTY}
    THEN Check DB master case Negative case to None Warrant_ID
    THEN Check DB REQ and RES File To Deleted

TC002_002
    Given create File Name Warrant H and รอบแรก TIME
    WHEN Prepara Data Request CSV is 1 Negatives Test Case warrant_id is | not have 3
    WHEN Encrypt File GPG To NITMX ${FileName_Warrant}
    when login to sftp server and Put file by AOC
    WHEN Call API Sending file Warrant H from aoc to ITMX
    THEN Get File GPG From ITMX
    WHEN Check Response code Invalid_format_warrant GPG FILE TO ERROR Is ${EMPTY}
    THEN Check DB master case Negative case 
    THEN Check DB REQ and RES File To Deleted

TC002_003 
    [Documentation]    defect DF14 ติด query db ที่ยาวเกินไป ดึงไม่ขึ้น
    Given create File Name Warrant H and รอบแรก TIME
    WHEN Prepara Data Request CSV is 1 Negatives Test Case warrant_id is 128digi
    WHEN Encrypt File GPG To NITMX ${FileName_Warrant}
    when login to sftp server and Put file by AOC
    WHEN Call API Sending file Warrant H from aoc to ITMX
    THEN Get File GPG From ITMX
    WHEN Check Response code Invalid_format_warrant GPG FILE TO ERROR Is ${EMPTY}
    THEN Check DB REQ and RES File To Deleted
    # THEN Check DB master case Negative case 
TC003_001  
    Given create File Name Warrant H and รอบแรก TIME
    WHEN Prepara Data Request CSV is 1 Negatives Test Case warrant_type is H invalid format warrant_type is ${EMPTY}
    WHEN Encrypt File GPG To NITMX ${FileName_Warrant}
    when login to sftp server and Put file by AOC
    WHEN Call API Sending file Warrant H from aoc to ITMX
    THEN Get File GPG From ITMX
    WHEN Check Response code Missing_require_warrant GPG FILE TO ERROR Is _type
    THEN Check DB master case Negative case warrant_type to change is None
    THEN Check DB REQ and RES File To Deleted

TC003_002  
    Given create File Name Warrant H and รอบแรก TIME
    WHEN Prepara Data Request CSV is 1 Negatives Test Case warrant_type is H invalid format warrant_type is h
    WHEN Encrypt File GPG To NITMX ${FileName_Warrant}
    when login to sftp server and Put file by AOC
    WHEN Call API Sending file Warrant H from aoc to ITMX
    THEN Get File GPG From ITMX
    WHEN Check Response code Invalid_format_warrant GPG FILE TO ERROR Is _type
    THEN Check DB master case Negative case warrant_type to change
    THEN Check DB REQ and RES File To Deleted

TC003_003  
    Given create File Name Warrant H and รอบแรก TIME
    WHEN Prepara Data Request CSV is 1 Negatives Test Case warrant_type is H invalid format warrant_type is Z
    WHEN Encrypt File GPG To NITMX ${FileName_Warrant}
    when login to sftp server and Put file by AOC
    WHEN Call API Sending file Warrant H from aoc to ITMX
    THEN Get File GPG From ITMX
    WHEN Check Response code Invalid_warrant GPG FILE TO ERROR Is ${EMPTY}
    THEN Check DB master case Negative case warrant_type to change
    THEN Check DB REQ and RES File To Deleted

TC003_004  
    Given create File Name Warrant H and รอบแรก TIME
    WHEN Prepara Data Request CSV is 1 Negatives Test Case warrant_type is H invalid format warrant_type is Q
    WHEN Encrypt File GPG To NITMX ${FileName_Warrant}
    when login to sftp server and Put file by AOC
    WHEN Call API Sending file Warrant H from aoc to ITMX
    THEN Get File GPG From ITMX
    WHEN Check Response code Invalid_warrant GPG FILE TO ERROR Is ${EMPTY}
    THEN Check DB master case Negative case warrant_type to change
    THEN Check DB REQ and RES File To Deleted

TC003_005  
    Given create File Name Warrant H and รอบแรก TIME
    WHEN Prepara Data Request CSV is 1 Negatives Test Case warrant_type is H invalid format warrant_type is R
    WHEN Encrypt File GPG To NITMX ${FileName_Warrant}
    when login to sftp server and Put file by AOC
    WHEN Call API Sending file Warrant H from aoc to ITMX
    THEN Get File GPG From ITMX
    WHEN Check Response code Invalid_warrant GPG FILE TO ERROR Is ${EMPTY}
    THEN Check DB master case Negative case warrant_type to change
    THEN Check DB REQ and RES File To Deleted

TC003_006  
    Given create File Name Warrant H and รอบแรก TIME
    WHEN Prepara Data Request CSV is 1 Negatives Test Case warrant_type is H invalid format warrant_type is T
    WHEN Encrypt File GPG To NITMX ${FileName_Warrant}
    when login to sftp server and Put file by AOC
    WHEN Call API Sending file Warrant H from aoc to ITMX
    THEN Get File GPG From ITMX
    WHEN Check Response code Invalid_value_condition GPG FILE TO ERROR Is _type
    THEN Check DB master case Negative case warrant_type to change
    THEN Check DB REQ and RES File To Deleted

TC003_007  
    [Documentation]    ไม่เช็ค DB warrant_type เก็บได้ 1 char 
    Given create File Name Warrant H and รอบแรก TIME
    WHEN Prepara Data Request CSV is 1 Negatives Test Case warrant_type is H invalid format warrant_type is HH
    WHEN Encrypt File GPG To NITMX ${FileName_Warrant}
    when login to sftp server and Put file by AOC
    WHEN Call API Sending file Warrant H from aoc to ITMX
    THEN Get File GPG From ITMX
    WHEN Check Response code Invalid_format_warrant GPG FILE TO ERROR Is _type
    THEN Check DB REQ and RES File To Deleted
    # THEN Check DB master case Negative case warrant_type to change

TC004_002
    Given create File Name Warrant H and รอบแรก TIME
    WHEN Prepara Data Request CSV is 1 Negatives Test Case Bankcase_id is ${EMPTY}
    WHEN Encrypt File GPG To NITMX ${FileName_Warrant}
    when login to sftp server and Put file by AOC
    WHEN Call API Sending file Warrant H from aoc to ITMX
    THEN Get File GPG From ITMX
    WHEN Check Response code Missing_require_warrant GPG FILE TO ERROR Is _bank
    THEN Check DB master case Negative case to None BankcaseID
    THEN Check DB REQ and RES File To Deleted

TC004_003
    Given create File Name Warrant H and รอบแรก TIME
    WHEN Prepara Data Request CSV is 1 Negatives Test Case Bankcase_id is 20240731KBNK00002
    WHEN Encrypt File GPG To NITMX ${FileName_Warrant}
    when login to sftp server and Put file by AOC
    WHEN Call API Sending file Warrant H from aoc to ITMX
    THEN Get File GPG From ITMX
    WHEN Check Response code bankcase_not_found GPG FILE TO ERROR Is ${EMPTY}
    THEN Check DB master case Negative case 
    THEN Check DB REQ and RES File To Deleted

TC004_004
    [Documentation]    defect DFQ6
    Given create File Name Warrant H and รอบแรก TIME
    WHEN Prepara Data Request CSV is 1 Negatives Test Case Bankcase_id is 25670731kbnk00005
    WHEN Encrypt File GPG To NITMX ${FileName_Warrant}
    when login to sftp server and Put file by AOC
    WHEN Call API Sending file Warrant H from aoc to ITMX
    THEN Get File GPG From ITMX
    WHEN Check Response code bankcase_not_found GPG FILE TO ERROR Is ${EMPTY}
    THEN Check DB master case Negative case 
    THEN Check DB REQ and RES File To Deleted

TC004_005
    [Documentation]    defect DFQ6
    Given create File Name Warrant H and รอบแรก TIME
    WHEN Prepara Data Request CSV is 1 Negatives Test Case Bankcase_id is 25670731ABC00005
    WHEN Encrypt File GPG To NITMX ${FileName_Warrant}
    when login to sftp server and Put file by AOC
    WHEN Call API Sending file Warrant H from aoc to ITMX
    THEN Get File GPG From ITMX
    WHEN Check Response code bankcase_not_found GPG FILE TO ERROR Is ${EMPTY}
    THEN Check DB master case Negative case 
    THEN Check DB REQ and RES File To Deleted

TC004_006
    [Documentation]    defect DFQ6
    Given create File Name Warrant H and รอบแรก TIME
    WHEN Prepara Data Request CSV is 1 Negatives Test Case Bankcase_id is 25670731KBNK0006
    WHEN Encrypt File GPG To NITMX ${FileName_Warrant}
    when login to sftp server and Put file by AOC
    WHEN Call API Sending file Warrant H from aoc to ITMX
    THEN Get File GPG From ITMX
    WHEN Check Response code bankcase_not_found GPG FILE TO ERROR Is ${EMPTY}
    THEN Check DB master case Negative case 
    THEN Check DB REQ and RES File To Deleted

    
TC005_001
    Given create File Name Warrant H and รอบแรก TIME
    WHEN Prepara Data Request CSV is 1 Negatives Test Case warrant_date is 2024-09-05
    WHEN Encrypt File GPG To NITMX ${FileName_Warrant}
    when login to sftp server and Put file by AOC
    WHEN Call API Sending file Warrant H from aoc to ITMX
    THEN Get File GPG From ITMX
    WHEN Check Response code Invalid_value_condition GPG FILE TO ERROR Is _date
    THEN Check DB master case Negative case 
    THEN Check DB REQ and RES File To Deleted

TC005_002
    Given create File Name Warrant H and รอบแรก TIME
    WHEN Prepara Data Request CSV is 1 Negatives Test Case warrant_date is 2567-01-1
    WHEN Encrypt File GPG To NITMX ${FileName_Warrant}
    when login to sftp server and Put file by AOC
    WHEN Call API Sending file Warrant H from aoc to ITMX
    THEN Get File GPG From ITMX
    WHEN Check Response code Invalid_format_warrant GPG FILE TO ERROR Is _date
    THEN Check DB master case Negative case 
    THEN Check DB REQ and RES File To Deleted

TC005_005
    Given create File Name Warrant H and รอบแรก TIME
    WHEN Prepara Data Request CSV is 1 Negatives Test Case warrant_date is ${EMPTY}
    WHEN Encrypt File GPG To NITMX ${FileName_Warrant}
    when login to sftp server and Put file by AOC
    WHEN Call API Sending file Warrant H from aoc to ITMX
    THEN Get File GPG From ITMX
    WHEN Check Response code Missing_require_warrant GPG FILE TO ERROR Is _date
    THEN Check DB master case Negative case 
    THEN Check DB REQ and RES File To Deleted

TC005_006
    Given create File Name Warrant H and รอบแรก TIME
    WHEN Prepara Data Request CSV is 1 Negatives Test Case warrant_date is 0000-00-00
    WHEN Encrypt File GPG To NITMX ${FileName_Warrant}
    when login to sftp server and Put file by AOC
    WHEN Call API Sending file Warrant H from aoc to ITMX
    THEN Get File GPG From ITMX
    WHEN Check Response code Invalid_format_warrant GPG FILE TO ERROR Is _date
    THEN Check DB master case Negative case 
    THEN Check DB REQ and RES File To Deleted

TC005_007
    Given create File Name Warrant H and รอบแรก TIME
    WHEN Prepara Data Request CSV is 1 Negatives Test Case warrant_date is 00000000
    WHEN Encrypt File GPG To NITMX ${FileName_Warrant}
    when login to sftp server and Put file by AOC
    WHEN Call API Sending file Warrant H from aoc to ITMX
    THEN Get File GPG From ITMX
    WHEN Check Response code Invalid_format_warrant GPG FILE TO ERROR Is _date
    THEN Check DB master case Negative case 
    THEN Check DB REQ and RES File To Deleted

TC005_008
    Given create File Name Warrant H and รอบแรก TIME
    WHEN Prepara Data Request CSV is 1 Negatives Test Case warrant_date is 01-01-2567
    WHEN Encrypt File GPG To NITMX ${FileName_Warrant}
    when login to sftp server and Put file by AOC
    WHEN Call API Sending file Warrant H from aoc to ITMX
    THEN Get File GPG From ITMX
    WHEN Check Response code Invalid_format_warrant GPG FILE TO ERROR Is _date
    THEN Check DB master case Negative case 
    THEN Check DB REQ and RES File To Deleted

TC005_009
    Given create File Name Warrant H and รอบแรก TIME
    WHEN Prepara Data Request CSV is 1 Negatives Test Case warrant_date is 2567-01-017
    WHEN Encrypt File GPG To NITMX ${FileName_Warrant}
    when login to sftp server and Put file by AOC
    WHEN Call API Sending file Warrant H from aoc to ITMX
    THEN Get File GPG From ITMX
    WHEN Check Response code Invalid_format_warrant GPG FILE TO ERROR Is _date
    THEN Check DB master case Negative case 
    THEN Check DB REQ and RES File To Deleted

TC005_010
    Given create File Name Warrant H and รอบแรก TIME
    WHEN Prepara Data Request CSV is 1 Negatives Test Case warrant_date is 2567-017-17
    WHEN Encrypt File GPG To NITMX ${FileName_Warrant}
    when login to sftp server and Put file by AOC
    WHEN Call API Sending file Warrant H from aoc to ITMX
    THEN Get File GPG From ITMX
    WHEN Check Response code Invalid_format_warrant GPG FILE TO ERROR Is _date
    THEN Check DB master case Negative case 
    THEN Check DB REQ and RES File To Deleted

TC005_011
    Given create File Name Warrant H and รอบแรก TIME
    WHEN Prepara Data Request CSV is 1 Negatives Test Case warrant_date is 25678-017-17
    WHEN Encrypt File GPG To NITMX ${FileName_Warrant}
    when login to sftp server and Put file by AOC
    WHEN Call API Sending file Warrant H from aoc to ITMX
    THEN Get File GPG From ITMX
    WHEN Check Response code Invalid_format_warrant GPG FILE TO ERROR Is _date
    THEN Check DB master case Negative case 
    THEN Check DB REQ and RES File To Deleted

TC005_012
    Given create File Name Warrant H and รอบแรก TIME
    WHEN Prepara Data Request CSV is 1 Negatives Test Case warrant_date is 2567-13-01
    WHEN Encrypt File GPG To NITMX ${FileName_Warrant}
    when login to sftp server and Put file by AOC
    WHEN Call API Sending file Warrant H from aoc to ITMX
    THEN Get File GPG From ITMX
    WHEN Check Response code Invalid_format_warrant GPG FILE TO ERROR Is _date
    THEN Check DB master case Negative case 
    THEN Check DB REQ and RES File To Deleted

TC005_013
    Given create File Name Warrant H and รอบแรก TIME
    WHEN Prepara Data Request CSV is 1 Negatives Test Case warrant_date is 2567-02-30
    WHEN Encrypt File GPG To NITMX ${FileName_Warrant}
    when login to sftp server and Put file by AOC
    WHEN Call API Sending file Warrant H from aoc to ITMX
    THEN Get File GPG From ITMX
    WHEN Check Response code Invalid_format_warrant GPG FILE TO ERROR Is _date
    THEN Check DB master case Negative case 
    THEN Check DB REQ and RES File To Deleted

TC005_014
    Given create File Name Warrant H and รอบแรก TIME
    WHEN Prepara Data Request CSV is 1 Negatives Test Case warrant_date is 2567/01/30
    WHEN Encrypt File GPG To NITMX ${FileName_Warrant}
    when login to sftp server and Put file by AOC
    WHEN Call API Sending file Warrant H from aoc to ITMX
    THEN Get File GPG From ITMX
    WHEN Check Response code Invalid_format_warrant GPG FILE TO ERROR Is _date
    THEN Check DB master case Negative case 
    THEN Check DB REQ and RES File To Deleted

TC005_015
    Given create File Name Warrant H and รอบแรก TIME
    WHEN Prepara Data Request CSV is 1 Negatives Test Case warrant_date is Null
    WHEN Encrypt File GPG To NITMX ${FileName_Warrant}
    when login to sftp server and Put file by AOC
    WHEN Call API Sending file Warrant H from aoc to ITMX
    THEN Get File GPG From ITMX
    WHEN Check Response code Invalid_format_warrant GPG FILE TO ERROR Is _date
    THEN Check DB master case Negative case 
    THEN Check DB REQ and RES File To Deleted

TC005_016
    Given create File Name Warrant H and รอบแรก TIME
    WHEN Prepara Data Request CSV is 1 Negatives Test Case warrant_date is warrant_dat
    WHEN Encrypt File GPG To NITMX ${FileName_Warrant}
    when login to sftp server and Put file by AOC
    WHEN Call API Sending file Warrant H from aoc to ITMX
    THEN Get File GPG From ITMX
    WHEN Check Response code Invalid_format_warrant GPG FILE TO ERROR Is _date
    THEN Check DB master case Negative case 
    THEN Check DB REQ and RES File To Deleted

TC005_0016
    Given create File Name Warrant H and รอบแรก TIME
    WHEN Prepara Data Request CSV is 1 Negatives Test Case warrant_date is 2499-12-31
    WHEN Encrypt File GPG To NITMX ${FileName_Warrant}
    when login to sftp server and Put file by AOC
    WHEN Call API Sending file Warrant H from aoc to ITMX
    THEN Get File GPG From ITMX
    WHEN Check Response code Invalid_value_condition GPG FILE TO ERROR Is _date
    THEN Check DB master case Negative case 
    THEN Check DB REQ and RES File To Deleted

TC005_019
    Given create File Name Warrant H and รอบแรก TIME
    WHEN Prepara Data Request CSV is 1 Negatives Test Case current date WarrantH Future Date Today + 1
    WHEN Encrypt File GPG To NITMX ${FileName_Warrant}
    when login to sftp server and Put file by AOC
    WHEN Call API Sending file Warrant H from aoc to ITMX
    THEN Get File GPG From ITMX
    WHEN Check Response code Invalid_value_condition GPG FILE TO ERROR Is _date
    THEN Check DB master case Negative case 
    THEN Check DB REQ and RES File To Deleted

TC005_020
    Given create File Name Warrant H and รอบแรก TIME
    WHEN Prepara Data Request CSV is 1 Negatives Test Case warrant_date is 2569-01-01
    WHEN Encrypt File GPG To NITMX ${FileName_Warrant}
    when login to sftp server and Put file by AOC
    WHEN Call API Sending file Warrant H from aoc to ITMX
    THEN Get File GPG From ITMX
    WHEN Check Response code Invalid_value_condition GPG FILE TO ERROR Is _date
    THEN Check DB master case Negative case 
    THEN Check DB REQ and RES File To Deleted
TC006_001
    Given create File Name Warrant H and รอบแรก TIME
    WHEN Prepara Data Request CSV is 1 Negatives Test Case warrant_time is 13:60
    WHEN Encrypt File GPG To NITMX ${FileName_Warrant}
    when login to sftp server and Put file by AOC
    WHEN Call API Sending file Warrant H from aoc to ITMX
    THEN Get File GPG From ITMX
    WHEN Check Response code Invalid_format_warrant GPG FILE TO ERROR Is _time
    THEN Check DB master case Negative case 
    THEN Check DB REQ and RES File To Deleted
TC006_002
    Given create File Name Warrant H and รอบแรก TIME
    WHEN Prepara Data Request CSV is 1 Negatives Test Case warrant_time is 114:35
    WHEN Encrypt File GPG To NITMX ${FileName_Warrant}
    when login to sftp server and Put file by AOC
    WHEN Call API Sending file Warrant H from aoc to ITMX
    THEN Get File GPG From ITMX
    WHEN Check Response code Invalid_format_warrant GPG FILE TO ERROR Is _time
    THEN Check DB master case Negative case 
    THEN Check DB REQ and RES File To Deleted
TC006_004
    Given create File Name Warrant H and รอบแรก TIME
    WHEN Prepara Data Request CSV is 1 Negatives Test Case warrant_time is ${EMPTY}
    WHEN Encrypt File GPG To NITMX ${FileName_Warrant}
    when login to sftp server and Put file by AOC
    WHEN Call API Sending file Warrant H from aoc to ITMX
    THEN Get File GPG From ITMX
    WHEN Check Response code Missing_require_warrant GPG FILE TO ERROR Is _time
    THEN Check DB master case Negative case 
    THEN Check DB REQ and RES File To Deleted
TC006_005
    Given create File Name Warrant H and รอบแรก TIME
    WHEN Prepara Data Request CSV is 1 Negatives Test Case warrant_time is 1549
    WHEN Encrypt File GPG To NITMX ${FileName_Warrant}
    when login to sftp server and Put file by AOC
    WHEN Call API Sending file Warrant H from aoc to ITMX
    THEN Get File GPG From ITMX
    WHEN Check Response code Invalid_format_warrant GPG FILE TO ERROR Is _time
    THEN Check DB master case Negative case 
    THEN Check DB REQ and RES File To Deleted
TC006_006
    Given create File Name Warrant H and รอบแรก TIME
    WHEN Prepara Data Request CSV is 1 Negatives Test Case warrant_time is 15:490
    WHEN Encrypt File GPG To NITMX ${FileName_Warrant}
    when login to sftp server and Put file by AOC
    WHEN Call API Sending file Warrant H from aoc to ITMX
    THEN Get File GPG From ITMX
    WHEN Check Response code Invalid_format_warrant GPG FILE TO ERROR Is _time
    THEN Check DB master case Negative case 
    THEN Check DB REQ and RES File To Deleted
TC006_007
    Given create File Name Warrant H and รอบแรก TIME
    WHEN Prepara Data Request CSV is 1 Negatives Test Case warrant_time is 15.49
    WHEN Encrypt File GPG To NITMX ${FileName_Warrant}
    when login to sftp server and Put file by AOC
    WHEN Call API Sending file Warrant H from aoc to ITMX
    THEN Get File GPG From ITMX
    WHEN Check Response code Invalid_format_warrant GPG FILE TO ERROR Is _time
    THEN Check DB master case Negative case 
    THEN Check DB REQ and RES File To Deleted
TC006_009
    Given create File Name Warrant H and รอบแรก TIME
    WHEN Prepara Data Request CSV is 1 Negatives Test Case warrant_time is 24:00 
    WHEN Encrypt File GPG To NITMX ${FileName_Warrant}
    when login to sftp server and Put file by AOC
    WHEN Call API Sending file Warrant H from aoc to ITMX
    THEN Get File GPG From ITMX
    WHEN Check Response code Invalid_format_warrant GPG FILE TO ERROR Is _time
    THEN Check DB master case Negative case 
    THEN Check DB REQ and RES File To Deleted
TC006_010
    Given create File Name Warrant H and รอบแรก TIME
    WHEN Prepara Data Request CSV is 1 Negatives Test Case warrant_time is Null
    WHEN Encrypt File GPG To NITMX ${FileName_Warrant}
    when login to sftp server and Put file by AOC
    WHEN Call API Sending file Warrant H from aoc to ITMX
    THEN Get File GPG From ITMX
    WHEN Check Response code Invalid_format_warrant GPG FILE TO ERROR Is _time
    THEN Check DB master case Negative case 
    THEN Check DB REQ and RES File To Deleted
TC006_011
    Given create File Name Warrant H and รอบแรก TIME
    WHEN Prepara Data Request CSV is 1 Negatives Test Case warrant_id is H invalid format header warrant_id warrant_type bankcaseid warrant_date warrant_timer
    WHEN Encrypt File GPG To NITMX ${FileName_Warrant}
    when login to sftp server and Put file by AOC
    WHEN Call API Sending file Warrant H from aoc to ITMX
    THEN Get File GPG From ITMX
    WHEN Check Response Code Invalid_Header_csv_file_format GPG FILE TO ERROR Is ${EMPTY} And warrant_id or waarant_type is None
    THEN Check DB REQ and RES File To Deleted
    # THEN Check DB master case Negative case 
TC007_001
    [Documentation]    BankCaseID does not found   (No data on CFR Web portal)
    Given create File Name Warrant H and รอบแรก TIME
    WHEN Prepara Data Request CSV is 1 Negatives Test Case Bankcase_id is 25670731KBNK00143
    WHEN Encrypt File GPG To NITMX ${FileName_Warrant}
    when login to sftp server and Put file by AOC
    WHEN Call API Sending file Warrant H from aoc to ITMX
    THEN Get File GPG From ITMX
    WHEN Check Response code bankcase_not_found GPG FILE TO ERROR Is ${EMPTY}
    THEN Check DB master case Negative case 
    THEN Check DB REQ and RES File To Deleted
TC007_002
    [Documentation]    In case of first digit of warrant_id does not match with warrant_type
    Given create File Name Warrant H and รอบแรก TIME
    WHEN Prepara Data Request CSV is 1 Negatives Test Case warrant_type is H invalid format warrant_type is R
    WHEN Encrypt File GPG To NITMX ${FileName_Warrant}
    when login to sftp server and Put file by AOC
    WHEN Call API Sending file Warrant H from aoc to ITMX
    THEN Get File GPG From ITMX
    WHEN Check Response code Invalid_warrant GPG FILE TO ERROR Is ${EMPTY}
    THEN Check DB master case Negative case
    THEN Check DB REQ and RES File To Deleted
TC007_003
    [Documentation]    warrant_date must be equal or less than system date 
    Given create File Name Warrant H and รอบแรก TIME
    WHEN Prepara Data Request CSV is 1 Negatives Test Case current date WarrantH Future Date Today + 1
    WHEN Encrypt File GPG To NITMX ${FileName_Warrant}
    when login to sftp server and Put file by AOC
    WHEN Call API Sending file Warrant H from aoc to ITMX
    THEN Get File GPG From ITMX
    WHEN Check Response code Invalid_value_condition GPG FILE TO ERROR Is _date
    THEN Check DB master case Negative case 
    THEN Check DB REQ and RES File To Deleted
TC007_004
    [Documentation]    warrant_id  All characters before first “|” must have 1 character at least 
    Given create File Name Warrant H and รอบแรก TIME
    WHEN Prepara Data Request CSV is 1 Negatives Test Case warrant_id is Q
    WHEN Encrypt File GPG To NITMX ${FileName_Warrant}
    when login to sftp server and Put file by AOC
    WHEN Call API Sending file Warrant H from aoc to ITMX
    THEN Get File GPG From ITMX
    WHEN Check Response code Invalid_value_condition GPG FILE TO ERROR Is _id
    THEN Check DB master case Negative case 
    THEN Check DB REQ and RES File To Deleted
TC007_005
    [Documentation]    - bankcaseid has been bound with other warrant_id 25670731KBNK00751
    Given create File Name Warrant H and รอบแรก TIME
    WHEN Prepara Data Request CSV is 1 Negatives Test Case Bankcase_id is 25670731KBNK00751
    WHEN Encrypt File GPG To NITMX ${FileName_Warrant}
    when login to sftp server and Put file by AOC
    WHEN Call API Sending file Warrant H from aoc to ITMX
    THEN Get File GPG From ITMX
    WHEN Check Response code bankcase_bound_warrant_id GPG FILE TO ERROR Is ${EMPTY}
    THEN Check DB master case Negative case 
    THEN Check DB REQ and RES File To Deleted
TC007_006
    [Documentation]   bankcaseid has been bound with other warrant_id 25670731KBNK00706
    Given create File Name Warrant H and รอบแรก TIME
    WHEN Prepara Data Request CSV is 1 Negatives Test Case Bankcase_id is 25670731KBNK00706
    WHEN Encrypt File GPG To NITMX ${FileName_Warrant}
    when login to sftp server and Put file by AOC
    WHEN Call API Sending file Warrant H from aoc to ITMX
    THEN Get File GPG From ITMX
    WHEN Check Response code bankcase_bound_warrant_id GPG FILE TO ERROR Is ${EMPTY}
    THEN Check DB master case Negative case 
    THEN Check DB REQ and RES File To Deleted
TC007_007
    Given create File Name Warrant H and รอบแรก TIME
    WHEN Prepara Data Request CSV is 1 Negatives Test Case warrant_id is missing field is ${EMPTY} ${EMPTY} ${EMPTY} ${EMPTY} ${EMPTY}
    WHEN Encrypt File GPG To NITMX ${FileName_Warrant}
    when login to sftp server and Put file by AOC
    WHEN Call API Sending file Warrant H from aoc to ITMX
    THEN Get File GPG From ITMX
    WHEN Check Response code Missing_require_warrant GPG FILE TO ERROR Is ${EMPTY}
    THEN Check DB REQ and RES File To Deleted
    # THEN Check DB master case Negative case 
TC008_004
    Given create File Name Warrant H and รอบแรก TIME And Fix file name is req REQ and res RES And running_number amoust digit 3
    When Create Warrant H FILE CSV
    THEN Get Data Police Case Number is null 1
    WHEN Encrypt File GPG To NITMX ${FileName_Warrant}
    when login to sftp server and Put file by AOC
    WHEN Call API Sending file Warrant H from aoc to ITMX
    THEN Get File GPG From ITMX
    THEN Check DB REQ and RES File To Deleted
TC008_005
    Given create File Name Warrant H and รอบแรก TIME And Fix file name is req TEST and res TEST_RES And running_number amoust digit 3
    When Create Warrant H FILE CSV
    THEN Get Data Police Case Number is null 1
    WHEN Encrypt File GPG To NITMX ${FileName_Warrant}
    when login to sftp server and Put file by AOC
    WHEN Call API Sending file Warrant H from aoc to ITMX
    THEN Get File GPG From ITMX
    WHEN Check Response Code Invalid_file_name GPG FILE TO ERROR Is ${EMPTY} And warrant_id or waarant_type is None
    THEN Check DB master case Negative case File name RES
    THEN Check DB REQ and RES File To Deleted
TC008_006
    Given create File Name Warrant H and รอบแรก TIME set test datetime is 2567TS20
    When Create Warrant H FILE CSV
    THEN Get Data Police Case Number is null 1
    WHEN Encrypt File GPG To NITMX ${FileName_Warrant}
    when login to sftp server and Put file by AOC
    WHEN Call API Sending file Warrant H from aoc to ITMX
    THEN Get File GPG From ITMX
    WHEN Check Response Code Invalid_file_name GPG FILE TO ERROR Is ${EMPTY} And warrant_id or waarant_type is None
    THEN Check DB master case Negative case File name RES
    THEN Check DB REQ and RES File To Deleted
TC008_007
    Given create File Name Warrant H and รอบแรก TIME Add format name in datetime is test
    When Create Warrant H FILE CSV
    THEN Get Data Police Case Number is null 1
    WHEN Encrypt File GPG To NITMX ${FileName_Warrant}
    when login to sftp server and Put file by AOC
    WHEN Call API Sending file Warrant H from aoc to ITMX
    THEN Get File GPG From ITMX
    WHEN Check Response Code Invalid_file_name GPG FILE TO ERROR Is ${EMPTY} And warrant_id or waarant_type is None
    THEN Check DB master case Negative case File name RES
    THEN Check DB REQ and RES File To Deleted
TC008_008
    Given create File Name Warrant H and รอบเฟล TIME And Fix file name is req REQ and res RES And running_number amoust digit 3
    When Create Warrant H FILE CSV
    THEN Get Data Police Case Number is null 1
    WHEN Encrypt File GPG To NITMX ${FileName_Warrant}
    when login to sftp server and Put file by AOC
    WHEN Call API Sending file Warrant H from aoc to ITMX
    THEN Get File GPG From ITMX
    WHEN Check Response Code Invalid_file_name GPG FILE TO ERROR Is ${EMPTY} And warrant_id or waarant_type is None
    THEN Check DB master case Negative case File name RES
    THEN Check DB REQ and RES File To Deleted
TC008_009
    Given create File Name Warrant H and รอบแรก TIME And Fix file name is req REQ and res RES And running_number amoust digit 2
    When Create Warrant H FILE CSV
    THEN Get Data Police Case Number is null 1
    WHEN Encrypt File GPG To NITMX ${FileName_Warrant}
    when login to sftp server and Put file by AOC
    WHEN Call API Sending file Warrant H from aoc to ITMX
    THEN Get File GPG From ITMX
    WHEN Check Response Code Invalid_file_name GPG FILE TO ERROR Is ${EMPTY} And warrant_id or waarant_type is None
    THEN Check DB master case Negative case File name RES
    THEN Check DB REQ and RES File To Deleted
TC008_010
    Given create File Name Warrant H and รอบแรก TIME And Fix file name is req REQ and res RES And running_number amoust digit 4
    When Create Warrant H FILE CSV
    THEN Get Data Police Case Number is null 1
    WHEN Encrypt File GPG To NITMX ${FileName_Warrant}
    when login to sftp server and Put file by AOC
    WHEN Call API Sending file Warrant H from aoc to ITMX
    THEN Get File GPG From ITMX
    WHEN Check Response Code Invalid_file_name GPG FILE TO ERROR Is ${EMPTY} And warrant_id or waarant_type is None
    THEN Check DB master case Negative case File name RES
    THEN Check DB REQ and RES File To Deleted
TC008_016
    Given create File Name Warrant H and รอบแรก TIME
    WHEN Create Warrant H FILE CSV
    THEN Get Data Police Case Number is null 2 Add mastercase is 25671108UOBT07122
    WHEN Encrypt File GPG To NITMX ${FileName_Warrant}
    when login to sftp server and Put file by AOC
    WHEN Call API Sending file Warrant H from aoc to ITMX
    THEN Get File GPG From ITMX
    WHEN Check Response Code SOME_ITEM_DUPLICATE GPG FILE TO ERROR Is ${EMPTY}
    THEN Check DB master case Negative case File name RES
    THEN Check DB REQ and RES File To Deleted
TC008_017
    # Given create File Name Warrant H and รอบแรก TIME And Fix file name is req REQ and res RES And running_number amoust digit 3
    Given create File Name Warrant H and รอบแรก TIME set test datetime is 25671108
    When Create Warrant H FILE CSV
    THEN Get Data Police Case Number is null 1
    WHEN Encrypt File GPG To NITMX ${FileName_Warrant}
    when login to sftp server and Put file by AOC
    WHEN Call API Sending file Warrant H from aoc to ITMX
    THEN Get File GPG From ITMX
    WHEN Check Response Code invalid_date_no_filename GPG FILE TO ERROR Is ${EMPTY} And warrant_id or waarant_type is None
    THEN Check DB master case Negative case File name RES
    THEN Check DB REQ and RES File To Deleted
# TC008_018
#     Given create File Name Warrant H and รอบแรก TIME For Duolicate file
#     WHEN Create Warrant H FILE CSV
#     THEN Get Data Police Case Number is null 1
#     WHEN Encrypt File GPG To NITMX ${FileName_Warrant}
#     when login to sftp server and Put file by AOC
#     WHEN Call API Sending file Warrant H from aoc to ITMX
#     Given create File Name Warrant H and รอบแรก TIME For Duolicate file
#     WHEN Create Warrant H FILE CSV
#     THEN Get Data Police Case Number is null 1
#     WHEN Encrypt File GPG To NITMX ${FileName_Warrant}
#     when login to sftp server and Put file by AOC
#     WHEN Call API Sending file Warrant H from aoc to ITMX
#     THEN Get File GPG From ITMX For Duplicate
#     WHEN Check Response Code duplicate_filename GPG FILE TO ERROR Is ${EMPTY} And warrant_id or waarant_type is None
#     THEN Check DB master case Negative case File name RES
#     THEN Check DB REQ and RES File To Deleted
TC008_020
    Given create File Name Warrant H and รอบแรก TIME And Fix file name is req REQ and res RES And running_number amoust digit 3
    When Prepara Data Request CSV is 1 Negatives Test Case is Header and Body EMPLY
    WHEN Encrypt File GPG To NITMX ${FileName_Warrant}
    when login to sftp server and Put file by AOC
    WHEN Call API Sending file Warrant H from aoc to ITMX
    THEN Get File GPG From ITMX
    WHEN Check Response Code Invalid_file_structure GPG FILE TO ERROR Is ${EMPTY} And Header and Body is None
    THEN Check DB master case Negative case File name RES
    THEN Check DB REQ and RES File To Deleted
TC008_021
    Given create File Name Warrant H and รอบแรก TIME And Fix file name is req REQ and res RES And running_number amoust digit 3
    When Prepara Data Request CSV is 1 Negatives Test Case Body is Invalid
    WHEN Encrypt File GPG To NITMX ${FileName_Warrant}
    when login to sftp server and Put file by AOC
    WHEN Call API Sending file Warrant H from aoc to ITMX
    THEN Get File GPG From ITMX
    WHEN Check Response Code invalid_file_format GPG FILE TO ERROR Is ${EMPTY} And Header and Body is None
    THEN Check DB master case Negative case File name RES
    THEN Check DB REQ and RES File To Deleted    
TC009_002
    Given create File Name Warrant H and รอบแรก TIME
    WHEN Prepara Data Request CSV is 1 Negatives Test Case warrant_id is H invalid format Character 
    WHEN Encrypt File GPG To NITMX ${FileName_Warrant}
    when login to sftp server and Put file by AOC
    WHEN Call API Sending file Warrant H from aoc to ITMX
    THEN Get File GPG From ITMX
    WHEN Check Response Code Invalid_file_structure GPG FILE TO ERROR Is ${EMPTY} And Header and Body is None
    THEN Check DB master case Negative case File name RES
    THEN Check DB REQ and RES File To Deleted
TC009_003
    Given create File Name Warrant H and รอบแรก TIME
    WHEN Prepara Data Request CSV is 1 Negatives Test Case warrant_id is H invalid format header ${EMPTY} ${EMPTY} ${EMPTY} ${EMPTY} ${EMPTY}
    WHEN Encrypt File GPG To NITMX ${FileName_Warrant}
    when login to sftp server and Put file by AOC
    WHEN Call API Sending file Warrant H from aoc to ITMX
    THEN Get File GPG From ITMX
    WHEN Check Response Code Invalid_Header_csv_file_format GPG FILE TO ERROR Is ${EMPTY} And Header and Body is None
    THEN Check DB master case Negative case File name RES
    THEN Check DB REQ and RES File To Deleted
TC009_004
    Given create File Name Warrant H and รอบแรก TIME
    WHEN Create Warrant H FILE CSV And Header is EMPLY and no file
    WHEN Get Data MASTER_CASE_ID Number is null 1 and Genarate warrant_id is H
    WHEN Encrypt File GPG To NITMX ${FileName_Warrant}
    when login to sftp server and Put file by AOC
    WHEN Call API Sending file Warrant H from aoc to ITMX
    THEN Get File GPG From ITMX
    WHEN Check Response Code Invalid_Header_csv_file_format GPG FILE TO ERROR Is ${EMPTY} And Header and Body is None
    THEN Check DB master case Negative case File name RES
    THEN Check DB REQ and RES File To Deleted
TC009_005
    Given create File Name Warrant H and รอบแรก TIME
    WHEN Prepara Data Request CSV is 1 Negatives Test Case warrant_id is H invalid format Character 
    WHEN Encrypt File GPG To NITMX ${FileName_Warrant}
    when login to sftp server and Put file by AOC
    WHEN Call API Sending file Warrant H from aoc to ITMX
    THEN Get File GPG From ITMX
    WHEN Check Response Code Invalid_file_structure GPG FILE TO ERROR Is ${EMPTY} And Header and Body is None
    THEN Check DB master case Negative case File name RES
    THEN Check DB REQ and RES File To Deleted
TC009_006
    Given create File Name Warrant H and รอบแรก TIME
    WHEN Prepara Data Request CSV is 1 Negatives Test Case warrant_id is H invalid format header Testwarrant_id warrant_type bankcaseid warrant_date warrant_time
    WHEN Encrypt File GPG To NITMX ${FileName_Warrant}
    when login to sftp server and Put file by AOC
    WHEN Call API Sending file Warrant H from aoc to ITMX
    THEN Get File GPG From ITMX
    WHEN Check Response Code Invalid_Header_csv_file_format GPG FILE TO ERROR Is ${EMPTY} And Header and Body is None
    THEN Check DB master case Negative case File name RES
    THEN Check DB REQ and RES File To Deleted
