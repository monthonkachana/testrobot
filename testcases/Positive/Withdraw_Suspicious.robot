*** Settings ***
Resource  ../../resources/imports.robot

*** Test Cases ***
# TC001_000_000 Warrant-H SP
#     [Tags]   not_ready
#     [Documentation]     bankcaseid is not bound to warrant_id
#     Set Test Variable    ${row_number}   0
#     FOR  ${index}   IN RANGE   0    ${totalrun}
#     Given create File Name Money Trail
#     WHEN Create Money Trail FILE CSV
#     THEN Get Data Master case id 100000
#     WHEN Encrypt File GPG To NITMX ${FileName_Warrant}
#     ${row_number}=  Evaluate   ${row_number}+500
#     log to console    ${row_number}
#     when login to sftp server and Put file by MTR_max
#     END


TC001_001 Validate Check file name
    [Documentation]     Validate Format file name (csv) - (MTR_REQ)
    ...                 > กรณีระบุชื่อไฟล์ตรงตาม Format (Success)
    Given create File Name withdraw mule to MBs 0
    THEN Get File GPG From ITMX for MBs 002
    AND Call API Download Withdraw suspicious report 002
    AND Extract ZIP FileName Withdraw mule
    and Validate Check file name Report Withdraw suspicious report
    and Delete File gpg and csv