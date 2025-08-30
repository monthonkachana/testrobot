*** Settings ***
Resource  ../../resources/imports.robot

*** Test Cases ***

# TC11_test file json
#     Given create File Name WithdrawMule
#     WHEN Prepare Data TEST And create file Json
#     WHEN Encrypt File GPG To NITMX JSON ${FileName_Warrant}
#     when login to sftp server and Put file by AOC
#     WHEN Call API Sending file Warrant H from aoc to ITMX
#     THEN Get File GPG From ITMX JSON
#     WHEN Check Response code Success GPG FILE
#     THEN Check DB warrant H
#     THEN Check DB REQ and RES File To Deleted
# TC11_1 test prepara data alot 
#     Given create File Name WithdrawMule
#     WHEN Prepare Data TEST And create file Json amount is query done 3
#     WHEN Encrypt File GPG To NITMX JSON ${FileName_Warrant}
#     when login to sftp server and Put file by Mule
#     WHEN Call API Sending file Mule_Withdraw from aoc to ITMX
#     THEN Get File GPG Withdraw From ITMX JSON
#     WHEN Check Response Code Success GPG FILE with JSON
#     # THEN Check File REQ and RES File Mule Withdraw Positive

TC001_001
    [Tags]    Mandatory 
    Given create File Name WithdrawMule
    WHEN Prepare Data TEST And create file Json
    WHEN Encrypt File GPG To NITMX JSON ${FileName_Warrant}
    when login to sftp server and Put file by Mule
    WHEN Call API Sending file Mule_Withdraw from aoc to ITMX
    THEN Get File GPG Withdraw From ITMX JSON
    WHEN Check Response Code Success GPG FILE with JSON
    THEN Check File REQ and RES File Mule Withdraw Positive
TC001_002
    [Tags]    Mandatory   
    Given create File Name WithdrawMule
    WHEN Prepare Data TEST And create file 1 Json Valid Format declare_uuid is 38fde238-59f0-47e2-bd3a-80b27781641f
    WHEN Encrypt File GPG To NITMX JSON ${FileName_Warrant}
    when login to sftp server and Put file by Mule
    WHEN Call API Sending file Mule_Withdraw from aoc to ITMX
    THEN Get File GPG Withdraw From ITMX JSON
    WHEN Check Response Code Success GPG FILE with JSON
    THEN Check File REQ and RES File Mule Withdraw Positive

TC001_005
    [Tags]    Mandatory
    Given create File Name WithdrawMule
    WHEN Prepare Data TEST And create file Json
    WHEN Encrypt File GPG To NITMX JSON ${FileName_Warrant}
    when login to sftp server and Put file by Mule
    WHEN Call API Sending file Mule_Withdraw from aoc to ITMX
    THEN Get File GPG Withdraw From ITMX JSON
    WHEN Check Response Code Success GPG FILE with JSON
    THEN Check File REQ and RES File Mule Withdraw Positive

TC001_008
    [Tags]    Mandatory    appendix_1.7
    Given create File Name WithdrawMule
    WHEN Prepare Data TEST And create file 1 Json Valid Format declare_type is ปลดม้าเทาเข้มรายบุคคล
    WHEN Encrypt File GPG To NITMX JSON ${FileName_Warrant}
    when login to sftp server and Put file by Mule
    WHEN Call API Sending file Mule_Withdraw from aoc to ITMX
    THEN Get File GPG Withdraw From ITMX JSON
    WHEN Check Response Code Success GPG FILE with JSON
    THEN Check File REQ and RES File Mule Withdraw Positive
TC001_011
    [Tags]     Optional
    Given create File Name WithdrawMule
    WHEN Prepare Data TEST And create file 1 Json Valid Format declare_date is 2500-11-20
    WHEN Encrypt File GPG To NITMX JSON ${FileName_Warrant}
    when login to sftp server and Put file by Mule
    WHEN Call API Sending file Mule_Withdraw from aoc to ITMX
    THEN Get File GPG Withdraw From ITMX JSON
    WHEN Check Response Code Success GPG FILE with JSON
    THEN Check File REQ and RES File Mule Withdraw Positive

TC001_020
    [Tags]    Mandatory    appendix_1.7
    Given create File Name WithdrawMule
    WHEN Prepare Data TEST And create file Json
    WHEN Encrypt File GPG To NITMX JSON ${FileName_Warrant}
    when login to sftp server and Put file by Mule
    WHEN Call API Sending file Mule_Withdraw from aoc to ITMX
    THEN Get File GPG Withdraw From ITMX JSON
    WHEN Check Response Code Success GPG FILE with JSON
    THEN Check File REQ and RES File Mule Withdraw Positive
TC001_023
    [Tags]    Mandatory    appendix_1.7
    Given create File Name WithdrawMule
    WHEN Prepare Data TEST And create file 1 Json Valid Format declare_note is ห่กดหสรด้หสดห้ดสหด้หสเรีเนสไำีดหสดีหฟนกหดsjfosjfsgisdjasfiuahlfauflhasifhalifsa2242435ห่กดหสรด้หสดห้ดสหด้หสเรีเนสไำีดหสดีหฟนกหดsjfosjfsgisdjasfiuahlfauflhasifhalifsa2242435ห่กดหสรด้หสดห้ดสหด้หสเรีเนสไำีดหสดีหฟนกหดsjfosjfsgisdjasfiuahlfauflhasifhalifsa2242435ห่กดหสรด้หสดห้ดสหด้หสเรีเนสไำีดหสดีหฟนกหดsjfosjfsgisdjasfiuahlfauflhasifhalifsa2242435ห่กดหสรด้หสดห้ดสหด้หสเรีเนสไำีดหสดีหฟนกหดsjfosjfsgisdjasfiuahlfauflhasifhalifsa2242435ห่กดหสรด้หสดห้ดสหด้หสเรีเนสไำีดหสดีหฟนกหดsjfosjfsgisdjasfiuahlfauflhasifhalifsa2242435ห่กดหสรด้หสดห้ดสหด้หสเรีเนสไำีดหสดีหฟนกหดsjfosjfsgisdjasfiuahlfauflhasifhalifsa2242435ห่กดหสรด้หสดห้ดสหด้หสเรีเนสไำีดหสดีหฟนกหดsjfosjfsgisdjasfiuahlfauflhasifhalifsa2242435ห่กดหสรด้หสดห้ดสหด้หสเรีเนสไำีดหสดีหฟนกหดsjfosjfsgisdjasfiuahlfauflhasifhalifsa2242435ห่กดหสรด้หสดห้ดสหด้หสเรีเนสไำีดหสดีหฟนกหดsjfosjfsgisdjasfiuahlfauflhasifhalifsa2242435ห่กดหสรด้หสดห้ดสหด้หสเรีเนสไำีดหสดีหฟนกหดsjfosjfsgisdjasfiuahlfauflhasifhalifsa2242435ห่กดหสรด้หสดห้ดสหด้หสเรีเนสไำีดหสดีหฟนกหดsjfosjfsgisdj
    WHEN Encrypt File GPG To NITMX JSON ${FileName_Warrant}
    when login to sftp server and Put file by Mule
    WHEN Call API Sending file Mule_Withdraw from aoc to ITMX
    THEN Get File GPG Withdraw From ITMX JSON
    WHEN Check Response Code Success GPG FILE with JSON
    THEN Check File REQ and RES File Mule Withdraw Positive
TC001_026
    [Tags]    Mandatory
    Given create File Name WithdrawMule
    WHEN Prepare Data TEST And create file 1 Json Valid Format mule_ref_code is CF00000097
    WHEN Encrypt File GPG To NITMX JSON ${FileName_Warrant}
    when login to sftp server and Put file by Mule
    WHEN Call API Sending file Mule_Withdraw from aoc to ITMX
    THEN Get File GPG Withdraw From ITMX JSON
    WHEN Check Response Code Success GPG FILE with JSON
    THEN Check File REQ and RES File Mule Withdraw Positive
TC001_029
    [Tags]    Mandatory    appendix_1.7
    Given create File Name WithdrawMule
    WHEN Prepare Data TEST And create file Json
    # WHEN Prepare Data TEST And create file 1 Json Valid Format mule_identity_id is 4992684489429
    WHEN Encrypt File GPG To NITMX JSON ${FileName_Warrant}
    when login to sftp server and Put file by Mule
    WHEN Call API Sending file Mule_Withdraw from aoc to ITMX
    THEN Get File GPG Withdraw From ITMX JSON
    WHEN Check Response Code Success GPG FILE with JSON
    THEN Check File REQ and RES File Mule Withdraw Positive
TC001_032
    [Tags]    Mandatory
    Given create File Name WithdrawMule
    WHEN Prepare Data TEST And create file 1 Json Valid Format mule_identity_type is 11111111111111111111
    WHEN Encrypt File GPG To NITMX JSON ${FileName_Warrant}
    when login to sftp server and Put file by Mule
    WHEN Call API Sending file Mule_Withdraw from aoc to ITMX
    THEN Get File GPG Withdraw From ITMX JSON
    WHEN Check Response Code Success GPG FILE with JSON
    THEN Check File REQ and RES File Mule Withdraw Positive
TC001_035
    [Tags]    Mandatory    appendix_1.7
    Given create File Name WithdrawMule
    WHEN Prepare Data TEST And create file 1 Json Valid Format mule_title is djaoifjafoiaหกดห่นดรหด่หวดห่ดวฟกฟดนรห่ดวฟ123455678
    WHEN Encrypt File GPG To NITMX JSON ${FileName_Warrant}
    when login to sftp server and Put file by Mule
    WHEN Call API Sending file Mule_Withdraw from aoc to ITMX
    THEN Get File GPG Withdraw From ITMX JSON
    WHEN Check Response Code Success GPG FILE with JSON
    THEN Check File REQ and RES File Mule Withdraw Positive
TC001_038
    [Tags]    Mandatory    appendix_1.7
    Given create File Name WithdrawMule
    WHEN Prepare Data TEST And create file 1 Json Valid Format mule_name is djaoifjafoiaหกดห่นดรหด่หวดห่ดวฟกฟดนรห่ดวฟ1234556789djaoifjafoiaหกดห่นดรหด่หวดห่ดวฟกฟดนรห่ดวฟ1234556789djaoifjafoiaหกดห่นดรหด่หวดห่ดวฟกฟดนรห่ดวฟ1234556789djaoifjafoiaหกดห่นดรหด่หวดห่ดวฟกฟดนรห่ดวฟ1234556789djaoifjafoiaหกดห่นดรหด่หวดห่ดวฟกฟดนรห่ดวฟ12345567890
    WHEN Encrypt File GPG To NITMX JSON ${FileName_Warrant}
    when login to sftp server and Put file by Mule
    WHEN Call API Sending file Mule_Withdraw from aoc to ITMX
    THEN Get File GPG Withdraw From ITMX JSON
    WHEN Check Response Code Success GPG FILE with JSON
    THEN Check File REQ and RES File Mule Withdraw Positive
TC001_041
    [Tags]    Mandatory    appendix_1.7
    Given create File Name WithdrawMule
    WHEN Prepare Data TEST And create file 1 Json Valid Format mule_surename is djaoifjafoiaหกดห่นดรหด่หวดห่ดวฟกฟดนรห่ดวฟ1234556789djaoifjafoiaหกดห่นดรหด่หวดห่ดวฟกฟดนรห่ดวฟ1234556789djaoifjafoiaหกดห่นดรหด่หวดห่ดวฟกฟดนรห่ดวฟ1234556789djaoifjafoiaหกดห่นดรหด่หวดห่ดวฟกฟดนรห่ดวฟ1234556789djaoifjafoiaหกดห่นดรหด่หวดห่ดวฟกฟดนรห่ดวฟ12345567890
    WHEN Encrypt File GPG To NITMX JSON ${FileName_Warrant}
    when login to sftp server and Put file by Mule
    WHEN Call API Sending file Mule_Withdraw from aoc to ITMX
    THEN Get File GPG Withdraw From ITMX JSON
    WHEN Check Response Code Success GPG FILE with JSON
    THEN Check File REQ and RES File Mule Withdraw Positive
TC001_044 
    [Tags]    Mandatory
    Given create File Name WithdrawMule
    WHEN Prepare Data TEST And create file 1 Json Valid Format mule_birth_date is 2547-02-20
    WHEN Encrypt File GPG To NITMX JSON ${FileName_Warrant}
    when login to sftp server and Put file by Mule
    WHEN Call API Sending file Mule_Withdraw from aoc to ITMX
    THEN Get File GPG Withdraw From ITMX JSON
    WHEN Check Response Code Success GPG FILE with JSON
    THEN Check File REQ and RES File Mule Withdraw Positive
TC001_049
    [Tags]    Optional
    Given create File Name WithdrawMule
    WHEN Prepare Data TEST And create file 1 Json Valid Format mule_birth_date is 2024-12-20
    WHEN Encrypt File GPG To NITMX JSON ${FileName_Warrant}
    when login to sftp server and Put file by Mule
    WHEN Call API Sending file Mule_Withdraw from aoc to ITMX
    THEN Get File GPG Withdraw From ITMX JSON
    WHEN Check Response Code Success GPG FILE with JSON
    THEN Check File REQ and RES File Mule Withdraw Positive

TC001_051
    [Tags]    Mandatory
    Given create File Name WithdrawMule
    WHEN Prepare Data TEST And create file 1 Json Valid Format mule_nationality is TH
    WHEN Encrypt File GPG To NITMX JSON ${FileName_Warrant}
    when login to sftp server and Put file by Mule
    WHEN Call API Sending file Mule_Withdraw from aoc to ITMX
    THEN Get File GPG Withdraw From ITMX JSON
    WHEN Check Response Code Success GPG FILE with JSON
    THEN Check File REQ and RES File Mule Withdraw Positive
TC001_054
    [Tags]    Mandatory
    Given create File Name WithdrawMule
    WHEN Prepare Data TEST And create file 1 Json Valid Format police_case_id is djaoifjafoiaหกนรห่ดวฟ123455678
    WHEN Encrypt File GPG To NITMX JSON ${FileName_Warrant}
    when login to sftp server and Put file by Mule
    WHEN Call API Sending file Mule_Withdraw from aoc to ITMX
    THEN Get File GPG Withdraw From ITMX JSON
    WHEN Check Response Code Success GPG FILE with JSON
    THEN Check File REQ and RES File Mule Withdraw Positive

TC001_057
    [Tags]    Mandatory
    Given create File Name WithdrawMule
    WHEN Prepare Data TEST And create file 1 Json Valid Format police_case_type is 33
    WHEN Encrypt File GPG To NITMX JSON ${FileName_Warrant}
    when login to sftp server and Put file by Mule
    WHEN Call API Sending file Mule_Withdraw from aoc to ITMX
    THEN Get File GPG Withdraw From ITMX JSON
    WHEN Check Response Code Success GPG FILE with JSON
    THEN Check File REQ and RES File Mule Withdraw Positive

TC001_060
    [Tags]    Mandatory
    Given create File Name WithdrawMule
    WHEN Prepare Data TEST And create file 1 Json Valid Format police_case_report_date is 2500-10-30 
    WHEN Encrypt File GPG To NITMX JSON ${FileName_Warrant}
    when login to sftp server and Put file by Mule
    WHEN Call API Sending file Mule_Withdraw from aoc to ITMX
    THEN Get File GPG Withdraw From ITMX JSON
    WHEN Check Response Code Success GPG FILE with JSON
    THEN Check File REQ and RES File Mule Withdraw Positive

TC001_067
    [Tags]    Mandatory
    Given create File Name WithdrawMule
    WHEN Prepare Data TEST And create file 1 Json Valid Format mule_account_no is 10111033464343425232352525253535355 
    WHEN Encrypt File GPG To NITMX JSON ${FileName_Warrant}
    when login to sftp server and Put file by Mule
    WHEN Call API Sending file Mule_Withdraw from aoc to ITMX
    THEN Get File GPG Withdraw From ITMX JSON
    WHEN Check Response Code Success GPG FILE with JSON
    THEN Check File REQ and RES File Mule Withdraw Positive

TC001_070 
    [Tags]    Mandatory
    Given create File Name WithdrawMule
    WHEN Prepare Data TEST And create file 1 Json Valid Format mule_account_type is TjsadjaoUMO344959505050669606060664 
    WHEN Encrypt File GPG To NITMX JSON ${FileName_Warrant}
    when login to sftp server and Put file by Mule
    WHEN Call API Sending file Mule_Withdraw from aoc to ITMX
    THEN Get File GPG Withdraw From ITMX JSON
    WHEN Check Response Code Success GPG FILE with JSON
    THEN Check File REQ and RES File Mule Withdraw Positive

TC001_073 
    [Tags]    Mandatory
    Given create File Name WithdrawMule
    WHEN Prepare Data TEST And create file 1 Json Valid Format mule_account_bankcode is 004 
    WHEN Encrypt File GPG To NITMX JSON ${FileName_Warrant}
    when login to sftp server and Put file by Mule
    WHEN Call API Sending file Mule_Withdraw from aoc to ITMX
    THEN Get File GPG Withdraw From ITMX JSON
    WHEN Check Response Code Success GPG FILE with JSON
    THEN Check File REQ and RES File Mule Withdraw Positive
TC001_076
    [Tags]    Mandatory    appendix_1.7
    Given create File Name WithdrawMule
    WHEN Prepare Data TEST And create file 1 Json Valid Format mule_account_bankname is TjsadjaoUMO3449595050506696060606645seifjsoifiiaodjaidjliadakdaflsafhisfhslufshfliusfhsuาก่รดห่ดหกร้อหนอ้หออก่ดหดำ้หรีด้หรด้หาีด้หด่รหี่ดหรห
    WHEN Encrypt File GPG To NITMX JSON ${FileName_Warrant}
    when login to sftp server and Put file by Mule
    WHEN Call API Sending file Mule_Withdraw from aoc to ITMX
    THEN Get File GPG Withdraw From ITMX JSON
    WHEN Check Response Code Success GPG FILE with JSON
    THEN Check File REQ and RES File Mule Withdraw Positive
TC001_079
    [Tags]    Mandatory    appendix_1.7
    Given create File Name WithdrawMule
    WHEN Prepare Data TEST And create file 1 Json Valid Format police_rank is TjsadjaoUMO344959505050669606060664 
    WHEN Encrypt File GPG To NITMX JSON ${FileName_Warrant}
    when login to sftp server and Put file by Mule
    WHEN Call API Sending file Mule_Withdraw from aoc to ITMX
    THEN Get File GPG Withdraw From ITMX JSON
    WHEN Check Response Code Success GPG FILE with JSON
    THEN Check File REQ and RES File Mule Withdraw Positive

TC001_082 
    [Tags]    Mandatory    appendix_1.7
    Given create File Name WithdrawMule
    WHEN Prepare Data TEST And create file 1 Json Valid Format police_name is kdfspofkjsoijgากยนด่หยด่หนดฟดาฟบดาฟหดฟยเวหย่ดหหรนด้หร้เหนรด้นหด้ฟนดฟ้แรผแJIIJNJDIMDKDIMKDKJFNJFJNDJ1 
    WHEN Encrypt File GPG To NITMX JSON ${FileName_Warrant}
    when login to sftp server and Put file by Mule
    WHEN Call API Sending file Mule_Withdraw from aoc to ITMX
    THEN Get File GPG Withdraw From ITMX JSON
    WHEN Check Response Code Success GPG FILE with JSON
    THEN Check File REQ and RES File Mule Withdraw Positive

TC001_085 
    [Tags]    Mandatory    appendix_1.7
    Given create File Name WithdrawMule
    WHEN Prepare Data TEST And create file 1 Json Valid Format police_surename is kdfspofkjsoijgากยนด่หยด่หนดฟดาฟบดาฟหดฟยเวหย่ดหหรนด้หร้เหนรด้นหด้ฟนดฟ้แรผแJIIJNJDIMDKDIMKDKJFNJFJNDJ1 
    WHEN Encrypt File GPG To NITMX JSON ${FileName_Warrant}
    when login to sftp server and Put file by Mule
    WHEN Call API Sending file Mule_Withdraw from aoc to ITMX
    THEN Get File GPG Withdraw From ITMX JSON
    WHEN Check Response Code Success GPG FILE with JSON
    THEN Check File REQ and RES File Mule Withdraw Positive

TC001_088
    [Tags]    Mandatory    appendix_1.7
    Given create File Name WithdrawMule
    WHEN Prepare Data TEST And create file 1 Json Valid Format police_job_title is kdfspofkjsoijgากยนด่หยด่หนดฟดาฟบดาฟหดฟยเวหย่ดหหรนด้หร้เหนรด้นหด้ฟนดฟ้แรผแJIIJNJDIMDKDIMKDKJFNJFJNDJ1 
    WHEN Encrypt File GPG To NITMX JSON ${FileName_Warrant}
    when login to sftp server and Put file by Mule
    WHEN Call API Sending file Mule_Withdraw from aoc to ITMX
    THEN Get File GPG Withdraw From ITMX JSON
    WHEN Check Response Code Success GPG FILE with JSON
    THEN Check File REQ and RES File Mule Withdraw Positive

TC001_091
    [Tags]    Mandatory    appendix_1.7
    Given create File Name WithdrawMule
    WHEN Prepare Data TEST And create file 1 Json Valid Format police_org is kdfspofkjsoijgากยนด่หยด่หนดฟดาฟบดาฟหดฟยเวหย่ดหหรนด้หร้เหนรด้นหด้ฟนดฟ้แรผแJIIJNJDIMDKDIMKDKJFNJFJNDJ12kdfspofkjsoijgากยนด่หยด่หนดฟดาฟบดาฟหดฟยเวหย่ดหหรนด้หร้เหนรด้นหด้ฟนดฟ้แรผแJIIJNJDIMDKDIMKDKJFNJFJNDJ 
    WHEN Encrypt File GPG To NITMX JSON ${FileName_Warrant}
    when login to sftp server and Put file by Mule
    WHEN Call API Sending file Mule_Withdraw from aoc to ITMX
    THEN Get File GPG Withdraw From ITMX JSON
    WHEN Check Response Code Success GPG FILE with JSON
    THEN Check File REQ and RES File Mule Withdraw Positive
TC001_094
    [Tags]    Optional    appendix_1.7
    Given create File Name WithdrawMule
    WHEN Prepare Data TEST And create file 1 Json Valid Format police_tel is 099999999 
    WHEN Encrypt File GPG To NITMX JSON ${FileName_Warrant}
    when login to sftp server and Put file by Mule
    WHEN Call API Sending file Mule_Withdraw from aoc to ITMX
    THEN Get File GPG Withdraw From ITMX JSON
    WHEN Check Response Code Success GPG FILE with JSON
    THEN Check File REQ and RES File Mule Withdraw Positive
TC001_097
    [Tags]    Mandatory
    Given create File Name WithdrawMule
    WHEN Prepare Data TEST And create file 1 Json Valid Format police_email is umaporn.artjdo_ifjso-Tdjsofijs932sdjsda@sfrd.co.th 
    WHEN Encrypt File GPG To NITMX JSON ${FileName_Warrant}
    when login to sftp server and Put file by Mule
    WHEN Call API Sending file Mule_Withdraw from aoc to ITMX
    THEN Get File GPG Withdraw From ITMX JSON
    WHEN Check Response Code Success GPG FILE with JSON
    THEN Check File REQ and RES File Mule Withdraw Positive

TC001_100
    [Tags]    Mandatory
    Given create File Name WithdrawMule
    WHEN Prepare Data TEST And create file 1 Json Valid Format declare_reason_code is 02
    WHEN Encrypt File GPG To NITMX JSON ${FileName_Warrant}
    when login to sftp server and Put file by Mule
    WHEN Call API Sending file Mule_Withdraw from aoc to ITMX
    THEN Get File GPG Withdraw From ITMX JSON
    WHEN Check Response Code Success GPG FILE with JSON
    THEN Check File REQ and RES File Mule Withdraw Positive

TC003_001
    [Tags]    Mandatory
    Given create File Name WithdrawMule
    WHEN Prepare Data TEST And create file Json
    WHEN Encrypt File GPG To NITMX JSON ${FileName_Warrant}
    when login to sftp server and Put file by Mule
    WHEN Call API Sending file Mule_Withdraw from aoc to ITMX
    THEN Get File GPG Withdraw From ITMX JSON
    WHEN Check Response Code Success GPG FILE with JSON
    THEN Check File REQ and RES File Mule Withdraw Positive
TC003_003
    [Tags]    Mandatory
    Given create File Name WithdrawMule
    WHEN Prepare Data TEST And create file 1 Json Valid Condition declare_date is Less is 1 days
    WHEN Encrypt File GPG To NITMX JSON ${FileName_Warrant}
    when login to sftp server and Put file by Mule
    WHEN Call API Sending file Mule_Withdraw from aoc to ITMX
    THEN Get File GPG Withdraw From ITMX JSON
    WHEN Check Response Code Success GPG FILE with JSON
    THEN Check File REQ and RES File Mule Withdraw Positive

TC003_005
    [Tags]    Mandatory
    Given create File Name WithdrawMule
    WHEN Prepare Data TEST And create file Json
    WHEN Encrypt File GPG To NITMX JSON ${FileName_Warrant}
    when login to sftp server and Put file by Mule
    WHEN Call API Sending file Mule_Withdraw from aoc to ITMX
    THEN Get File GPG Withdraw From ITMX JSON
    WHEN Check Response Code Success GPG FILE with JSON
    THEN Check File REQ and RES File Mule Withdraw Positive
TC003_007
    [Tags]    Mandatory
    Given create File Name WithdrawMule
    WHEN Prepare Data TEST And create file Json
    WHEN Encrypt File GPG To NITMX JSON ${FileName_Warrant}
    when login to sftp server and Put file by Mule
    WHEN Call API Sending file Mule_Withdraw from aoc to ITMX
    THEN Get File GPG Withdraw From ITMX JSON
    WHEN Check Response Code Success GPG FILE with JSON
    THEN Check File REQ and RES File Mule Withdraw Positive
TC003_011
    [Tags]    Mandatory
    Given create File Name WithdrawMule
    WHEN Prepare Data TEST And create file Json
    WHEN Encrypt File GPG To NITMX JSON ${FileName_Warrant}
    when login to sftp server and Put file by Mule
    WHEN Call API Sending file Mule_Withdraw from aoc to ITMX
    THEN Get File GPG Withdraw From ITMX JSON
    WHEN Check Response Code Success GPG FILE with JSON
    THEN Check File REQ and RES File Mule Withdraw Positive
TC003_013
    [Tags]    Mandatory
    Given create File Name WithdrawMule
    WHEN Prepare Data TEST And create file Json Valid Format mule_identity_id is 35digis and mule_identity_type is 3
    WHEN Encrypt File GPG To NITMX JSON ${FileName_Warrant}
    when login to sftp server and Put file by Mule
    WHEN Call API Sending file Mule_Withdraw from aoc to ITMX
    THEN Get File GPG Withdraw From ITMX JSON
    WHEN Check Response Code Success GPG FILE with JSON
    THEN Check File REQ and RES File Mule Withdraw Positive
TC003_022
    [Tags]    Mandatory
    Given create File Name WithdrawMule
    WHEN Prepare Data TEST And create file Json
    WHEN Encrypt File GPG To NITMX JSON ${FileName_Warrant}
    when login to sftp server and Put file by Mule
    WHEN Call API Sending file Mule_Withdraw from aoc to ITMX
    THEN Get File GPG Withdraw From ITMX JSON
    WHEN Check Response Code Success GPG FILE with JSON
    THEN Check File REQ and RES File Mule Withdraw Positive
TC003_024
    [Tags]    Mandatory
    Given create File Name WithdrawMule
    WHEN Prepare Data TEST And create file Json
    WHEN Encrypt File GPG To NITMX JSON ${FileName_Warrant}
    when login to sftp server and Put file by Mule
    WHEN Call API Sending file Mule_Withdraw from aoc to ITMX
    THEN Get File GPG Withdraw From ITMX JSON
    WHEN Check Response Code Success GPG FILE with JSON
    THEN Check File REQ and RES File Mule Withdraw Positive
TC003_026
    [Tags]    Mandatory
    Given create File Name WithdrawMule
    WHEN Prepare Data TEST And create file 1 Json Valid Format police_case_id is L256710300002
    WHEN Encrypt File GPG To NITMX JSON ${FileName_Warrant}
    when login to sftp server and Put file by Mule
    WHEN Call API Sending file Mule_Withdraw from aoc to ITMX
    THEN Get File GPG Withdraw From ITMX JSON
    WHEN Check Response Code Success GPG FILE with JSON
    THEN Check File REQ and RES File Mule Withdraw Positive
TC003_028
    [Tags]    Mandatory
    Given create File Name WithdrawMule
    WHEN Prepare Data TEST And create file 1 Json Missing required field missing_mule_title
    WHEN Encrypt File GPG To NITMX JSON ${FileName_Warrant}
    when login to sftp server and Put file by Mule
    WHEN Call API Sending file Mule_Withdraw from aoc to ITMX
    THEN Get File GPG Withdraw From ITMX JSON
    WHEN Check Response Code Success GPG FILE with JSON
    THEN Check File REQ and RES File Mule Withdraw Positive
TC003_029
    [Tags]    Mandatory
    Given create File Name WithdrawMule
    WHEN Prepare Data TEST And create file 1 Json Valid Format mule_title is null
    WHEN Encrypt File GPG To NITMX JSON ${FileName_Warrant}
    when login to sftp server and Put file by Mule
    WHEN Call API Sending file Mule_Withdraw from aoc to ITMX
    THEN Get File GPG Withdraw From ITMX JSON
    WHEN Check Response Code Success GPG FILE with JSON
    THEN Check File REQ and RES File Mule Withdraw Positive
TC004_011
    [Tags]    Mandatory
    Given create File Name WithdrawMule
    WHEN Prepare Data TEST And create file 1 Json Missing required field missing_mule_title
    WHEN Encrypt File GPG To NITMX JSON ${FileName_Warrant}
    when login to sftp server and Put file by Mule
    WHEN Call API Sending file Mule_Withdraw from aoc to ITMX
    THEN Get File GPG Withdraw From ITMX JSON
    WHEN Check Response Code Success GPG FILE with JSON
    THEN Check File REQ and RES File Mule Withdraw Positive
TC005_001
    [Tags]    Mandatory
    Given create File Name WithdrawMule
    WHEN Prepare Data TEST And create file Json
    WHEN Encrypt File GPG To NITMX JSON ${FileName_Warrant}
    when login to sftp server and Put file by Mule
    WHEN Call API Sending file Mule_Withdraw from aoc to ITMX
    THEN Get File GPG Withdraw From ITMX JSON
    WHEN Check Response Code Success GPG FILE with JSON
    THEN Check File REQ and RES File Mule Withdraw Positive

TC005_002
    [Tags]    Mandatory
    Given create File Name WithdrawMule
    WHEN Prepare Data TEST And create file Json
    WHEN Encrypt File GPG To NITMX JSON ${FileName_Warrant}
    when login to sftp server and Put file by Mule
    WHEN Call API Sending file Mule_Withdraw from aoc to ITMX
    THEN Get File GPG Withdraw From ITMX JSON
    WHEN Check Response Code Success GPG FILE with JSON
    THEN Check File REQ and RES File Mule Withdraw Positive

TC005_005
    [Tags]    Mandatory
    Given create File Name WithdrawMule
    WHEN Prepare Data TEST And create file Json and fix file name to create is JSON
    WHEN Encrypt File GPG To NITMX JSON ${FileName_Warrant} validate file name extenstion is JSON and validate file name uppercase gpg is gpg
    when login to sftp server and Put file by Mule
    WHEN Call API Sending file Mule_Withdraw from aoc to ITMX
    THEN Get File GPG Withdraw From ITMX JSON
    WHEN Check Response Code Success GPG FILE with JSON
    THEN Check File REQ and RES File Mule Withdraw Positive


