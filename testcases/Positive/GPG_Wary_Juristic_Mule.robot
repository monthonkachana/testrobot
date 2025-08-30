*** Settings ***
Resource  ../../resources/imports.robot

*** Test Cases ***

TC001_001 test
    [Documentation]     bankcaseid is not bound to warrant_id
    Given create File Name Wary Juristic
    WHEN Create Wary juristic csv
    THEN Get Data to file csv wary juristic 10
    AND Zip CSV File
    WHEN Encrypt File GPG To NITMX WARY
    when login to sftp server and Put file by Juristic
    WHEN Call API Sending file wary juristic from aoc to ITMX
    # THEN Get File GPG From ITMX
    # WHEN Check Response code Invalid_file_structure GPG FILE
    # THEN Check DB warrant H
    # THEN Check DB REQ and RES File To Deleted