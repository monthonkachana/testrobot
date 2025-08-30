*** Settings ***
Resource  ../../resources/imports.robot

*** Test Cases ***

TC001_005
    [Tags]   ready
    [Documentation]    Validate Money trail report request condition validation Response Fail code "6600" message “Invalid Request. BankCaseID does not found”
    Given Create file name money trail report
    WHEN Create money trail file CSV trail report invalid header csv file format
    THEN Get data master bankcase id does not found
    WHEN Encrypt file GPG name to nitmx ${Request_MTR}
    WHEN login to sftp server and Put file by MRT_ADHOC
    WHEN Call API Sending file Money trail from aoc to ITMX MTR
    THEN Get file GPG from ITMX for Money trail report
    WHEN Check response code BankCaseID_does_not_found GPG file money trail report
    THEN Check DB MTR Onetime max
    THEN Check DB REQ and RES MTR Onetime File To Deleted max

TC001_006
    [Tags]   ready
    [Documentation]     Validate Money trail report request condition validation Response Fail code "6609" message “Some records are duplicate within the same file”
    Given Create file name money trail report
    WHEN Create money trail file CSV trail report request no semicolon
    THEN Get data master bank case id 2 Duplicates
    WHEN Encrypt file GPG name to nitmx ${Request_MTR}
    WHEN login to sftp server and Put file by MRT_ADHOC
    WHEN Call API Sending file Money trail from aoc to ITMX MTR
    THEN Get file GPG from ITMX for Money trail report
    WHEN Check response code Some records are duplicate within the same file GPG file money trail report 1
    THEN Check db mtr onetime 2
    THEN Check db req and res mrt onetime file to deleted

TC001_008
    [Tags]   ready
    [Documentation]    Validate Response Fail Code "6100" Message "INVALID_HEADER_CSV_FILE_FORMAT"
    Given Create file name money trail report
    WHEN Create money trail file CSV trail name bankcase
    THEN Get data master bank case id 7
    WHEN Encrypt file GPG name to nitmx ${Request_MTR}
    WHEN login to sftp server and Put file by MRT_ADHOC
    WHEN Call API Sending file Money trail from aoc to ITMX MTR
    THEN Get file GPG from ITMX for Money trail report
    WHEN Check response code Invalid_Header_csv_file_format GPG file money trail report code 1
    THEN Check db mtr onetime 2
    THEN Check db req and res mrt onetime file to deleted 
    
TC001_010
    [Tags]   ready
    [Documentation]    Validate Response Fail Code "6103" Message "INVALID_FILE_NAME_FORMAT"
    Given Create file name money trail report invalid file name format
    WHEN Create money trail file CSV trail report request no semicolon
    THEN Get data master bank case id 7
    WHEN Encrypt file GPG name to nitmx ${Request_MTR}
    WHEN login to sftp server and Put file by MRT_ADHOC
    WHEN Call API Sending file Money trail from aoc to ITMX MTR
    THEN Get file GPG from ITMX for Money trail report
    WHEN Check response code Invalid_file_name GPG file money trail report code 1
    THEN Check db mtr onetime 2
    THEN Check db req and res mrt onetime file to deleted 

TC001_011
    [Tags]   ready
    [Documentation]    Response Fail Code "6103" Message "INVALID_FILE_NAME_FORMAT"
    Given Create file name money trail report invalid file name format RED
    WHEN Create money trail file CSV trail report request no semicolon
    THEN Get data master bank case id 7
    WHEN Encrypt file GPG name to nitmx ${Request_MTR}
    WHEN login to sftp server and Put file by MRT_ADHOC
    WHEN Call API Sending file Money trail from aoc to ITMX MTR RED
    THEN Get file GPG from ITMX for Money trail report red
    WHEN Check response code Invalid_file_name GPG file money trail report code 1
    THEN Check db mtr onetime 2
    THEN Check db req and res mrt onetime file to deleted red

TC001_013
    [Tags]   ready
    [Documentation]    Validate Response Fail Code "6105" Message "INVALID_FILE_STRUCTURE"
    Given Create file name money trail report
    WHEN Create money trail file CSV trail report invalid file name format xlsx
    THEN Get data master bank case id 1 xlsx
    WHEN Encrypt file GPG name to nitmx ${Request_MTR} xlsx
    WHEN login to sftp server and Put file by MRT_ADHOC
    WHEN Call API Sending file Money trail from aoc to ITMX MTR
    THEN Get file GPG from ITMX for Money trail report xlsx
    WHEN Check response code Invalid_file_structure GPG file money trail report code 1
    THEN Check db mtr onetime 2
    THEN Check db req and res mrt onetime file to deleted xlsx

TC001_014
    [Tags]   ready
    [Documentation]     Validate Response Fail Code "6106" Message "RECORD_EXCEED_LIMIT"
    Given Create file name money trail report
    WHEN Create money trail file CSV trail report invalid header csv file format
    THEN Get data master bank case id 1000
    WHEN Encrypt file GPG name to nitmx ${Request_MTR}
    WHEN login to sftp server and Put file by MRT_ADHOC
    WHEN Call API Sending file Money trail from aoc to ITMX MTR
    THEN Get file GPG from ITMX for Money trail report 1000 Record
    WHEN Check response code Recodr_exceed_limit GPG file money trail report code 1
    THEN Check db mtr onetime 2
    THEN Check db req and res mrt onetime file to deleted

# ยังไม่เสร้จ lines 2199971
# TC001_015
#     [Tags]   not_ready
#     [Documentation]     Validate Response Fail Code "6107" Message "FILE_EXCEED_LIMIT"
#     Given Create file name money trail report
#     WHEN Create money trail file CSV trail report invalid header csv file format
#     THEN Get data master bank case id 2199971
#     WHEN Encrypt file GPG name to nitmx ${Request_MTR}
#     WHEN login to sftp server and Put file by MRT_ADHOC
#     WHEN Call API Sending file Money trail from aoc to ITMX MTR
#     THEN Get file GPG from ITMX for Money trail report 1000 Record
#     WHEN Check response code Recodr_exceed_limit GPG file money trail report

TC001_018
    [Tags]   ready
    [Documentation]     Validate Response Fail Code "6110" Message "DUPLICATE_FILENAME"
    Given Create file name money trail report
    WHEN Create money trail file CSV trail report invalid header csv file format
    THEN Get data master bank case id 1
    WHEN Encrypt file GPG name to nitmx ${Request_MTR}
    WHEN login to sftp server and Put file by MRT_ADHOC
    WHEN Call API Sending file Money trail from aoc to ITMX MTR
    THEN Get file GPG from ITMX for Money trail report
     WHEN Encrypt file GPG name to nitmx ${Request_MTR}
    WHEN login to sftp server and Put file by MRT_ADHOC
    WHEN Call API Sending file Money trail from aoc to ITMX MTR
    THEN Get file GPG from ITMX for Money trail report
    WHEN Check response code duplicate_filename GPG file money trail report 1
    THEN Check db mtr onetime 2
    THEN Check db req and res mrt onetime file to deleted duplicate filename

TC001_020
    [Tags]   ready
    [Documentation]     Validate Response Fail Code "6112" Message "INVALID_FILE_FORMAT"
    Given Create file name money trail report
    WHEN Create money trail file CSV trail report invalid header csv file format
    THEN Get data master bank case id 1 semicolon
    WHEN Encrypt file GPG name to nitmx ${Request_MTR}
    WHEN login to sftp server and Put file by MRT_ADHOC
    WHEN Call API Sending file Money trail from aoc to ITMX MTR
    THEN Get file GPG from ITMX for Money trail report
    WHEN Check response code invalid_file_format GPG file money trail report code 1
    THEN Check db mtr onetime 2
    THEN Check db req and res mrt onetime file to deleted

TC001_021
    [Tags]   ready
    [Documentation]     Validate Response Fail Code "6113" Message "SYSTEM_REQUIRED_AT_LEAST_ONE_TRANSACTION"
    Given Create file name money trail report
    WHEN Create money trail file CSV trail report invalid header csv file format
    THEN Get data master bank case id 0
    WHEN Encrypt file GPG name to nitmx ${Request_MTR}
    WHEN login to sftp server and Put file by MRT_ADHOC
    WHEN Call API Sending file Money trail from aoc to ITMX MTR
    THEN Get file GPG from ITMX for Money trail report
    WHEN Check response code system_req_transaction GPG file money trail report code 1
    THEN Check db mtr onetime 2
    THEN Check db req and res mrt onetime file to deleted 2

# TC001_025
#     [Tags]   ready
#     [Documentation]     Validate Response Fail Code "6300" Message "INVALID_SIGNATURE"
#     Given Create file name money trail report
#     WHEN Create money trail file CSV trail report invalid header csv file format
#     THEN Get data master bank case id 1
#     WHEN Encrypt file GPG name to nitmx ${Request_MTR} and validate signature value key private
#     WHEN login to sftp server and Put file by MRT_ADHOC
#     WHEN Call API Sending file Money trail from aoc to ITMX MTR
#     THEN Get file GPG from ITMX for Money trail report
#     WHEN Check response code Invalid_signature GPG file money trail report 1
#     THEN Check db mtr onetime 2
#     THEN Check db req and res mrt onetime file to deleted

# TC001_026
#     [Tags]   ready
#     [Documentation]     Validate Response Fail Code "6400" Message "UNABLE_TO_DECRYPT_OR_UNIDENTITY_SENDER_OF_FILE"
#     Given Create file name money trail report
#     WHEN Create money trail file CSV trail report invalid header csv file format
#     THEN Get data master bank case id 1
#     WHEN Encrypt file GPG name to nitmx ${Request_MTR} and validate signature value key private
#     WHEN login to sftp server and Put file by MRT_ADHOC
#     WHEN Call API Sending file Money trail from aoc to ITMX MTR
#     THEN Get file GPG from ITMX for Money trail report
#     WHEN Check response code system_decrypt_unidentity GPG file money trail report 1
#     THEN Check db mtr onetime 2
#     THEN Check db req and res mrt onetime file to deleted

TC001_028
    [Tags]   ready
    [Documentation]     Validate Response Fail Code "6100" Message "INVALID_HEADER_CSV_FILE_FORMAT"
    Given Create file name money trail report
    WHEN Create money trail file CSV trail report no bankcaseid
    THEN Get data master bank case id 0
    WHEN Encrypt file GPG name to nitmx ${Request_MTR}
    WHEN login to sftp server and Put file by MRT_ADHOC
    WHEN Call API Sending file Money trail from aoc to ITMX MTR
    THEN Get file GPG from ITMX for Money trail report
    WHEN Check response code Invalid_Header_csv_file_format GPG file money trail report 1
    THEN Check db mtr onetime 2
    THEN Check db req and res mrt onetime file to deleted 2

TC001_029
    [Tags]   ready
    [Documentation]     Validate Response Fail Code 6606 Message "Invalid format: bankcaseid"
    Given Create file name money trail report
    WHEN Create money trail file CSV trail report invalid header csv file format
    THEN Get data master bank case id 2 invalid format bankcaseid
    WHEN Encrypt file GPG name to nitmx ${Request_MTR}
    WHEN login to sftp server and Put file by MRT_ADHOC
    WHEN Call API Sending file Money trail from aoc to ITMX MTR
    THEN Get file GPG from ITMX for Money trail report
    WHEN Check response code Invalid_format_BankCaseID GPG file money trail report 1
    THEN Check db mtr onetime 2
    THEN Check db req and res mrt onetime file to deleted

TC001_030
    [Tags]   ready
    [Documentation]     alidate Response Fail Code "6613" Message "SFTP_TIMEOUT_ERROR"
    Given Create file name money trail report
    WHEN Create money trail file CSV trail report invalid header csv file format
    THEN Get data master bank case id 2 missing required field bankcaseid
    WHEN Encrypt file GPG name to nitmx ${Request_MTR}
    WHEN login to sftp server and Put file by MRT_ADHOC
    WHEN Call API Sending file Money trail from aoc to ITMX MTR
    THEN Get file GPG from ITMX for Money trail report
    WHEN Check response code Missing_require_field_bankcaseid GPG file money trail report 1
    THEN Check db mtr onetime 2
    THEN Check db req and res mrt onetime file to deleted