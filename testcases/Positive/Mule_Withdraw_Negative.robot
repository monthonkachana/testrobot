*** Settings ***
Resource  ../../resources/imports.robot

*** Test Cases ***

TC001_003
    [Tags]    Mandatory
    Given create File Name WithdrawMule
    WHEN Prepare Data TEST And create file 1 Json Valid Format declare_uuid is 38fde238-๓฿๒@-47e2-bd3a-80b27781641f
    WHEN Encrypt File GPG To NITMX JSON ${FileName_Warrant}
    when login to sftp server and Put file by Mule
    WHEN Call API Sending file Mule_Withdraw from aoc to ITMX
    THEN Get File GPG Withdraw From ITMX JSON
    WHEN Check Response Code invalid_declare_uuid GPG FILE with JSON
    THEN Check DB REQ and RES File To Deleted Mule Withdraw
    THEN Check File REQ and RES File Mule Withdraw Negative
TC001_004
    [Tags]    Mandatory
    Given create File Name WithdrawMule
    WHEN Prepare Data TEST And create file 1 Json Valid Format declare_uuid is 38fde238-59f0-47e2-bd3aa-80b27781641f
    WHEN Encrypt File GPG To NITMX JSON ${FileName_Warrant}
    when login to sftp server and Put file by Mule
    WHEN Call API Sending file Mule_Withdraw from aoc to ITMX
    THEN Get File GPG Withdraw From ITMX JSON
    WHEN Check Response Code invalid_declare_uuid GPG FILE with JSON
    THEN Check File REQ and RES File Mule Withdraw Negative
TC001_006
    [Tags]    Mandatory
    Given create File Name WithdrawMule
    WHEN Prepare Data TEST And create file 1 Json Valid Format declare_type_code is A
    WHEN Encrypt File GPG To NITMX JSON ${FileName_Warrant}
    when login to sftp server and Put file by Mule
    WHEN Call API Sending file Mule_Withdraw from aoc to ITMX
    THEN Get File GPG Withdraw From ITMX JSON
    WHEN Check Response Code invalid_declare_type_code GPG FILE with JSON
    THEN Check File REQ and RES File Mule Withdraw Negative
TC001_007
    [Tags]    Mandatory
    Given create File Name WithdrawMule
    WHEN Prepare Data TEST And create file 1 Json Valid Format declare_type_code is 222
    WHEN Encrypt File GPG To NITMX JSON ${FileName_Warrant}
    when login to sftp server and Put file by Mule
    WHEN Call API Sending file Mule_Withdraw from aoc to ITMX
    THEN Get File GPG Withdraw From ITMX JSON
    WHEN Check Response Code invalid_declare_type_code GPG FILE with JSON
    THEN Check File REQ and RES File Mule Withdraw Negative
TC001_009
    [Tags]    Mandatory    appendix_1.7
    Given create File Name WithdrawMule
    WHEN Prepare Data TEST And create file 1 Json Valid Format declare_type is テスト
    WHEN Encrypt File GPG To NITMX JSON ${FileName_Warrant}
    when login to sftp server and Put file by Mule
    WHEN Call API Sending file Mule_Withdraw from aoc to ITMX
    THEN Get File GPG Withdraw From ITMX JSON
    WHEN Check Response Code invalid_declare_type GPG FILE with JSON
    THEN Check File REQ and RES File Mule Withdraw Negative
TC001_010
    [Tags]    Mandatory    appendix_1.7
    Given create File Name WithdrawMule
    WHEN Prepare Data TEST And create file 1 Json Valid Format declare_type is เทสปลดม้าเทาเข้มรายบุคคลเทสปลดม้าเทาเข้มราเทสปลดไๆๆ
    WHEN Encrypt File GPG To NITMX JSON ${FileName_Warrant}
    when login to sftp server and Put file by Mule
    WHEN Call API Sending file Mule_Withdraw from aoc to ITMX
    THEN Get File GPG Withdraw From ITMX JSON
    WHEN Check Response Code invalid_declare_type GPG FILE with JSON
    THEN Check File REQ and RES File Mule Withdraw Negative
TC001_012
    [Tags]    Optional
    Given create File Name WithdrawMule
    WHEN Prepare Data TEST And create file 1 Json Valid Format declare_date is 25671120
    WHEN Encrypt File GPG To NITMX JSON ${FileName_Warrant}
    when login to sftp server and Put file by Mule
    WHEN Call API Sending file Mule_Withdraw from aoc to ITMX
    THEN Get File GPG Withdraw From ITMX JSON
    WHEN Check Response Code invalid_declare_date GPG FILE with JSON
    THEN Check File REQ and RES File Mule Withdraw Negative
TC001_013
    [Tags]    Optional
    Given create File Name WithdrawMule
    WHEN Prepare Data TEST And create file 1 Json Valid Format declare_date is Test-กข-๒%
    WHEN Encrypt File GPG To NITMX JSON ${FileName_Warrant}
    when login to sftp server and Put file by Mule
    WHEN Call API Sending file Mule_Withdraw from aoc to ITMX
    THEN Get File GPG Withdraw From ITMX JSON
    WHEN Check Response Code invalid_declare_date GPG FILE with JSON
    THEN Check File REQ and RES File Mule Withdraw Negative
TC001_014
    [Tags]    Optional
    Given create File Name WithdrawMule
    WHEN Prepare Data TEST And create file 1 Json Valid Format declare_date is 2567-11-32
    WHEN Encrypt File GPG To NITMX JSON ${FileName_Warrant}
    when login to sftp server and Put file by Mule
    WHEN Call API Sending file Mule_Withdraw from aoc to ITMX
    THEN Get File GPG Withdraw From ITMX JSON
    WHEN Check Response Code invalid_declare_date GPG FILE with JSON
    THEN Check File REQ and RES File Mule Withdraw Negative
TC001_015
    [Tags]    Optional
    Given create File Name WithdrawMule
    WHEN Prepare Data TEST And create file 1 Json Valid Format declare_date is 2567-13-20
    WHEN Encrypt File GPG To NITMX JSON ${FileName_Warrant}
    when login to sftp server and Put file by Mule
    WHEN Call API Sending file Mule_Withdraw from aoc to ITMX
    THEN Get File GPG Withdraw From ITMX JSON
    WHEN Check Response Code invalid_declare_date GPG FILE with JSON
    THEN Check File REQ and RES File Mule Withdraw Negative
TC001_016
    [Tags]    Optional
    Given create File Name WithdrawMule
    WHEN Prepare Data TEST And create file 1 Json Valid Format declare_date is 2499-12-20
    WHEN Encrypt File GPG To NITMX JSON ${FileName_Warrant}
    when login to sftp server and Put file by Mule
    WHEN Call API Sending file Mule_Withdraw from aoc to ITMX
    THEN Get File GPG Withdraw From ITMX JSON
    WHEN Check Response Code invalid_condition_declare_date GPG FILE with JSON
    THEN Check File REQ and RES File Mule Withdraw Negative
TC001_017
    [Tags]    Mandatory
    Given create File Name WithdrawMule
    WHEN Prepare Data TEST And create file 1 Json Valid Format declare_date is 2567-11-200
    WHEN Encrypt File GPG To NITMX JSON ${FileName_Warrant}
    when login to sftp server and Put file by Mule
    WHEN Call API Sending file Mule_Withdraw from aoc to ITMX
    THEN Get File GPG Withdraw From ITMX JSON
    WHEN Check Response Code invalid_declare_date GPG FILE with JSON
    THEN Check File REQ and RES File Mule Withdraw Negative
TC001_018
    [Tags]    Optional
    Given create File Name WithdrawMule
    WHEN Prepare Data TEST And create file 1 Json Valid Format declare_reason_code is ทส
    WHEN Encrypt File GPG To NITMX JSON ${FileName_Warrant}
    when login to sftp server and Put file by Mule
    WHEN Call API Sending file Mule_Withdraw from aoc to ITMX
    THEN Get File GPG Withdraw From ITMX JSON
    WHEN Check Response Code invalid_declare_reason_code GPG FILE with JSON
    THEN Check File REQ and RES File Mule Withdraw Negative
TC001_019
    [Tags]    Optional
    Given create File Name WithdrawMule
    WHEN Prepare Data TEST And create file 1 Json Valid Format declare_reason_code is 002
    WHEN Encrypt File GPG To NITMX JSON ${FileName_Warrant}
    when login to sftp server and Put file by Mule
    WHEN Call API Sending file Mule_Withdraw from aoc to ITMX
    THEN Get File GPG Withdraw From ITMX JSON
    WHEN Check Response Code invalid_declare_reason_code GPG FILE with JSON
    THEN Check File REQ and RES File Mule Withdraw Negative
TC001_021
    [Tags]    Optional    appendix_1.7
    Given create File Name WithdrawMule
    WHEN Prepare Data TEST And create file 1 Json Valid Format declare_reason is テスト
    WHEN Encrypt File GPG To NITMX JSON ${FileName_Warrant}
    when login to sftp server and Put file by Mule
    WHEN Call API Sending file Mule_Withdraw from aoc to ITMX
    THEN Get File GPG Withdraw From ITMX JSON
    WHEN Check Response Code invalid_declare_reason GPG FILE with JSON
    THEN Check File REQ and RES File Mule Withdraw Negative
TC001_022
    [Tags]    Optional    appendix_1.7
    Given create File Name WithdrawMule
    WHEN Prepare Data TEST And create file 1 Json Valid Format declare_reason is ทดสอบTeadast๑๒.~!@#$%^&*'()_+ =-][{}:;?.><,1234ทดสอบTeadast๑๒.~!@#$%^&*'()_+ =-][{}:;?.><,1234ทดสอบTeadast๑๒.~!@#$%^&*'()_+ =-][{}:;?.><,1234ทดสอบTeadast๑๒.~!@#$%^&*'()_+ =-][{}:;?.><,1234ทดสอบTeadast๑๒.~!@#$%^&*'()_+ =-][{3}:;?.><,1234ทดสอบTeadast๑๒kd8fjgld9j
    WHEN Encrypt File GPG To NITMX JSON ${FileName_Warrant}
    when login to sftp server and Put file by Mule
    WHEN Call API Sending file Mule_Withdraw from aoc to ITMX
    THEN Get File GPG Withdraw From ITMX JSON
    WHEN Check Response Code invalid_declare_reason GPG FILE with JSON
    THEN Check File REQ and RES File Mule Withdraw Negative
TC001_024
    [Tags]    Optional    appendix_1.7
    Given create File Name WithdrawMule
    WHEN Prepare Data TEST And create file 1 Json Valid Format declare_note is ||||
    WHEN Encrypt File GPG To NITMX JSON ${FileName_Warrant}
    when login to sftp server and Put file by Mule
    WHEN Call API Sending file Mule_Withdraw from aoc to ITMX
    THEN Get File GPG Withdraw From ITMX JSON
    WHEN Check Response Code invalid_declare_note GPG FILE with JSON
    THEN Check File REQ and RES File Mule Withdraw Negative
TC001_025
    [Tags]    Mandatory    appendix_1.7
    Given create File Name WithdrawMule
    WHEN Prepare Data TEST And create file 1 Json Valid Format declare_note is ห่กดหสรด้หสดห้ดสหด้หสเรีเนสไำีดหสดีหฟนกหดsjfosjfsgisdjasfiuahlfauflhasifhalifsa2242435ห่กดหสรด้หสดห้ดสหด้หสเรีเนสไำีดหสดีหฟนกหดsjfosjfsgisdjasfiuahlfauflhasifhalifsa2242435ห่กดหสรด้หสดห้ดสหด้หสเรีเนสไำีดหสดีหฟนกหดsjfosjfsgisdjasfiuahlfauflhasifhalifsa2242435ห่กดหสรด้หสดห้ดสหด้หสเรีเนสไำีดหสดีหฟนกหดsjfosjfsgisdjasfiuahlfauflhasifhalifsa2242435ห่กดหสรด้หสดห้ดสหด้หสเรีเนสไำีดหสดีหฟนกหดsjfosjfsgisdjasfiuahlfauflhasifhalifsa2242435ห่กดหสรด้หสดห้ดสหด้หสเรีเนสไำีดหสดีหฟนกหดsjfosjfsgisdjasfiuahlfauflhasifhalifsa2242435ห่กดหสรด้หสดห้ดสหด้หสเรีเนสไำีดหสดีหฟนกหดsjfosjfsgisdjasfiuahlfauflhasifhalifsa2242435ห่กดหสรด้หสดห้ดสหด้หสเรีเนสไำีดหสดีหฟนกหดsjfosjfsgisdjasfiuahlfauflhasifhalifsa2242435ห่กดหสรด้หสดห้ดสหด้หสเรีเนสไำีดหสดีหฟนกหดsjfosjfsgisdjasfiuahlfauflhasifhalifsa2242435ห่กดหสรด้หสดห้ดสหด้หสเรีเนสไำีดหสดีหฟนกหดsjfosjfsgisdjasfiuahlfauflhasifhalifsa2242435ห่กดหสรด้หสดห้ดสหด้หสเรีเนสไำีดหสดีหฟนกหดsjfosjfsgisdjasfiuahlfauflhasifhalifsa2242435ห่กดหสรด้หสดห้ดสหด้หสเรีเนสไำีดหสดีหฟนกหดsjfosjfsgisdjs
    WHEN Encrypt File GPG To NITMX JSON ${FileName_Warrant}
    when login to sftp server and Put file by Mule
    WHEN Call API Sending file Mule_Withdraw from aoc to ITMX
    THEN Get File GPG Withdraw From ITMX JSON
    WHEN Check Response Code invalid_declare_note GPG FILE with JSON
    THEN Check File REQ and RES File Mule Withdraw Negative
TC001_027
    [Tags]    Optional
    Given create File Name WithdrawMule
    WHEN Prepare Data TEST And create file 1 Json Valid Format fix_mule_ref_code is eriทดสอบ!@
    WHEN Encrypt File GPG To NITMX JSON ${FileName_Warrant}
    when login to sftp server and Put file by Mule
    WHEN Call API Sending file Mule_Withdraw from aoc to ITMX
    THEN Get File GPG Withdraw From ITMX JSON
    WHEN Check Response Code invalid_mule_ref_code GPG FILE with JSON
    THEN Check File REQ and RES File Mule Withdraw Negative
TC001_028
    [Tags]    Mandatory
    Given create File Name WithdrawMule
    WHEN Prepare Data TEST And create file 1 Json Valid Format fix_mule_ref_code is CF000001234
    WHEN Encrypt File GPG To NITMX JSON ${FileName_Warrant}
    when login to sftp server and Put file by Mule
    WHEN Call API Sending file Mule_Withdraw from aoc to ITMX
    THEN Get File GPG Withdraw From ITMX JSON
    WHEN Check Response Code invalid_mule_ref_code GPG FILE with JSON
    THEN Check File REQ and RES File Mule Withdraw Negative
TC001_030
    [Tags]    Optional    appendix_1.7
    Given create File Name WithdrawMule
    WHEN Prepare Data TEST And create file 1 Json Valid Format mule_identity_id is |||雨季の雨のホアヒンビーチで緊急テスト
    WHEN Encrypt File GPG To NITMX JSON ${FileName_Warrant}
    when login to sftp server and Put file by Mule
    WHEN Call API Sending file Mule_Withdraw from aoc to ITMX
    THEN Get File GPG Withdraw From ITMX JSON
    WHEN Check Response Code invalid_mule_identity_id GPG FILE with JSON
    THEN Check File REQ and RES File Mule Withdraw Negative
TC001_031
    [Tags]    Mandatory    appendix_1.7
    Given create File Name WithdrawMule
    WHEN Prepare Data TEST And create file 1 Json Valid Format mule_identity_id is 342983472042422492420492424209499342
    WHEN Encrypt File GPG To NITMX JSON ${FileName_Warrant}
    when login to sftp server and Put file by Mule
    WHEN Call API Sending file Mule_Withdraw from aoc to ITMX
    THEN Get File GPG Withdraw From ITMX JSON
    WHEN Check Response Code invalid_mule_identity_id GPG FILE with JSON
    THEN Check File REQ and RES File Mule Withdraw Negative
TC001_033
    [Tags]    Mandatory
    Given create File Name WithdrawMule
    WHEN Prepare Data TEST And create file 1 Json Valid Format mule_identity_type is T
    WHEN Encrypt File GPG To NITMX JSON ${FileName_Warrant}
    when login to sftp server and Put file by Mule
    WHEN Call API Sending file Mule_Withdraw from aoc to ITMX
    THEN Get File GPG Withdraw From ITMX JSON
    WHEN Check Response Code invalid_mule_identity_type GPG FILE with JSON
    THEN Check File REQ and RES File Mule Withdraw Negative

TC001_034
    [Tags]    Mandatory
    Given create File Name WithdrawMule
    WHEN Prepare Data TEST And create file 1 Json Valid Format mule_identity_type is 111111111111111111111
    WHEN Encrypt File GPG To NITMX JSON ${FileName_Warrant}
    when login to sftp server and Put file by Mule
    WHEN Call API Sending file Mule_Withdraw from aoc to ITMX
    THEN Get File GPG Withdraw From ITMX JSON
    WHEN Check Response Code invalid_mule_identity_type GPG FILE with JSON
    THEN Check File REQ and RES File Mule Withdraw Negative
TC001_036
    [Tags]    Optional    appendix_1.7
    Given create File Name WithdrawMule
    WHEN Prepare Data TEST And create file 1 Json Valid Format mule_title is |||||||||
    WHEN Encrypt File GPG To NITMX JSON ${FileName_Warrant}
    when login to sftp server and Put file by Mule
    WHEN Call API Sending file Mule_Withdraw from aoc to ITMX
    THEN Get File GPG Withdraw From ITMX JSON
    WHEN Check Response Code invalid_mule_title GPG FILE with JSON
    THEN Check File REQ and RES File Mule Withdraw Negative
TC001_037
    [Tags]    Mandatory    appendix_1.7
    Given create File Name WithdrawMule
    WHEN Prepare Data TEST And create file 1 Json Valid Format mule_title is djaoifjafoiaหกดห่นดรหด่หวดห่ดวฟกฟดนรห่ดวฟ1234556789
    WHEN Encrypt File GPG To NITMX JSON ${FileName_Warrant}
    when login to sftp server and Put file by Mule
    WHEN Call API Sending file Mule_Withdraw from aoc to ITMX
    THEN Get File GPG Withdraw From ITMX JSON
    WHEN Check Response Code invalid_mule_title GPG FILE with JSON
    THEN Check File REQ and RES File Mule Withdraw Negative
TC001_039
    [Tags]    Optional    appendix_1.7
    Given create File Name WithdrawMule
    WHEN Prepare Data TEST And create file 1 Json Valid Format mule_name is |||||
    WHEN Encrypt File GPG To NITMX JSON ${FileName_Warrant}
    when login to sftp server and Put file by Mule
    WHEN Call API Sending file Mule_Withdraw from aoc to ITMX
    THEN Get File GPG Withdraw From ITMX JSON
    WHEN Check Response Code invalid_mule_name GPG FILE with JSON
    THEN Check File REQ and RES File Mule Withdraw Negative
TC001_040
    [Tags]    Mandatory    appendix_1.7
    Given create File Name WithdrawMule
    WHEN Prepare Data TEST And create file 1 Json Valid Format mule_name is djaoifjafoiaหกดห่นดรหด่หวดห่ดวฟกฟดนรห่ดวฟ1234556789djaoifjafoiaหกดห่นดรหด่หวดห่ดวฟกฟดนรห่ดวฟ1234556789djaoifjafoiaหกดห่นดรหด่หวดห่ดวฟกฟดนรห่ดวฟ1234556789djaoifjafoiaหกดห่นดรหด่หวดห่ดวฟกฟดนรห่ดวฟ1234556789djaoifjafoiaหกดห่นดรหด่หวดห่ดวฟกฟดนรห่ดวฟ12345567890ค
    WHEN Encrypt File GPG To NITMX JSON ${FileName_Warrant}
    when login to sftp server and Put file by Mule
    WHEN Call API Sending file Mule_Withdraw from aoc to ITMX
    THEN Get File GPG Withdraw From ITMX JSON
    WHEN Check Response Code invalid_format_mule_name GPG FILE with JSON
    THEN Check File REQ and RES File Mule Withdraw Negative
TC001_042
    [Tags]    Optional    appendix_1.7
    Given create File Name WithdrawMule
    WHEN Prepare Data TEST And create file 1 Json Valid Format mule_surename is |||||
    WHEN Encrypt File GPG To NITMX JSON ${FileName_Warrant}
    when login to sftp server and Put file by Mule
    WHEN Call API Sending file Mule_Withdraw from aoc to ITMX
    THEN Get File GPG Withdraw From ITMX JSON
    WHEN Check Response Code invalid_mule_surname GPG FILE with JSON
    THEN Check File REQ and RES File Mule Withdraw Negative
TC001_043
    [Tags]    Optional    appendix_1.7
    Given create File Name WithdrawMule
    WHEN Prepare Data TEST And create file 1 Json Valid Format mule_surename is ทดสอบTeadast๑๒.~!@#$%^&*'()_+ =-][{}:;?.><,1234ทดสอบTeadast๑๒.~!@#$%^&*'()_+ =-][{}:;?.><,1234ทดสอบTeadast๑๒.~!@#$%^&*'()_+ =-][{}:;?.><,1234ทดสอบTeadast๑๒.~!@#$%^&*'()_+ =-][{}:;?.><,1234ทดสอบTeadast๑๒.~!@#$%^&*'()_+ =-][{3}:;?.><,1234ทดสอบTeadast๑๒kd8fjgld9j
    WHEN Encrypt File GPG To NITMX JSON ${FileName_Warrant}
    when login to sftp server and Put file by Mule
    WHEN Call API Sending file Mule_Withdraw from aoc to ITMX
    THEN Get File GPG Withdraw From ITMX JSON
    WHEN Check Response Code invalid_mule_surname GPG FILE with JSON
    THEN Check File REQ and RES File Mule Withdraw Negative
TC001_045
    [Tags]    Optional
    Given create File Name WithdrawMule
    WHEN Prepare Data TEST And create file 1 Json Valid Format mule_birth_date is 25370220
    WHEN Encrypt File GPG To NITMX JSON ${FileName_Warrant}
    when login to sftp server and Put file by Mule
    WHEN Call API Sending file Mule_Withdraw from aoc to ITMX
    THEN Get File GPG Withdraw From ITMX JSON
    WHEN Check Response Code invalid_mule_birth_date GPG FILE with JSON
    THEN Check File REQ and RES File Mule Withdraw Negative
TC001_046
    [Tags]    Mandatory
    Given create File Name WithdrawMule
    WHEN Prepare Data TEST And create file 1 Json Valid Format mule_birth_date is Test-ทส-TS
    WHEN Encrypt File GPG To NITMX JSON ${FileName_Warrant}
    when login to sftp server and Put file by Mule
    WHEN Call API Sending file Mule_Withdraw from aoc to ITMX
    THEN Get File GPG Withdraw From ITMX JSON
    WHEN Check Response Code invalid_format_mule_birth_date GPG FILE with JSON
    THEN Check File REQ and RES File Mule Withdraw Negative
TC001_047
    [Tags]    Optional
    Given create File Name WithdrawMule
    WHEN Prepare Data TEST And create file 1 Json Valid Format mule_birth_date is 2547-03-32
    WHEN Encrypt File GPG To NITMX JSON ${FileName_Warrant}
    when login to sftp server and Put file by Mule
    WHEN Call API Sending file Mule_Withdraw from aoc to ITMX
    THEN Get File GPG Withdraw From ITMX JSON
    WHEN Check Response Code invalid_mule_birth_date GPG FILE with JSON
    THEN Check File REQ and RES File Mule Withdraw Negative
TC001_048
    [Tags]    Optional
    Given create File Name WithdrawMule
    WHEN Prepare Data TEST And create file 1 Json Valid Format mule_birth_date is 2547-13-32
    WHEN Encrypt File GPG To NITMX JSON ${FileName_Warrant}
    when login to sftp server and Put file by Mule
    WHEN Call API Sending file Mule_Withdraw from aoc to ITMX
    THEN Get File GPG Withdraw From ITMX JSON
    WHEN Check Response Code invalid_mule_birth_date GPG FILE with JSON
    THEN Check File REQ and RES File Mule Withdraw Negative
TC001_050
    [Tags]    Optional
    Given create File Name WithdrawMule
    WHEN Prepare Data TEST And create file 1 Json Valid Format mule_birth_date is 2567-11-200
    WHEN Encrypt File GPG To NITMX JSON ${FileName_Warrant}
    when login to sftp server and Put file by Mule
    WHEN Call API Sending file Mule_Withdraw from aoc to ITMX
    THEN Get File GPG Withdraw From ITMX JSON
    WHEN Check Response Code invalid_mule_birth_date GPG FILE with JSON
    THEN Check File REQ and RES File Mule Withdraw Negative
TC001_052
    [Tags]    Optional
    Given create File Name WithdrawMule
    WHEN Prepare Data TEST And create file 1 Json Valid Format mule_nationality is th
    WHEN Encrypt File GPG To NITMX JSON ${FileName_Warrant}
    when login to sftp server and Put file by Mule
    WHEN Call API Sending file Mule_Withdraw from aoc to ITMX
    THEN Get File GPG Withdraw From ITMX JSON
    WHEN Check Response Code invalid_mule_nationality GPG FILE with JSON
    THEN Check File REQ and RES File Mule Withdraw Negative
TC001_053
    [Tags]    Optional
    Given create File Name WithdrawMule
    WHEN Prepare Data TEST And create file 1 Json Valid Format mule_nationality is TH1
    WHEN Encrypt File GPG To NITMX JSON ${FileName_Warrant}
    when login to sftp server and Put file by Mule
    WHEN Call API Sending file Mule_Withdraw from aoc to ITMX
    THEN Get File GPG Withdraw From ITMX JSON
    WHEN Check Response Code invalid_mule_nationality GPG FILE with JSON
    THEN Check File REQ and RES File Mule Withdraw Negative
TC001_055
    [Tags]    Mandatory    appendix_1.7
    Given create File Name WithdrawMule
    WHEN Prepare Data TEST And create file 1 Json Valid Format police_case_id is テスト
    WHEN Encrypt File GPG To NITMX JSON ${FileName_Warrant}
    when login to sftp server and Put file by Mule
    WHEN Call API Sending file Mule_Withdraw from aoc to ITMX
    THEN Get File GPG Withdraw From ITMX JSON
    WHEN Check Response Code invalid_format_police_case_id GPG FILE with JSON
    THEN Check File REQ and RES File Mule Withdraw Negative

TC001_056
    [Tags]    Mandatory    appendix_1.7
    Given create File Name WithdrawMule
    WHEN Prepare Data TEST And create file 1 Json Valid Format police_case_id is C256710300001984209428234323443
    WHEN Encrypt File GPG To NITMX JSON ${FileName_Warrant}
    when login to sftp server and Put file by Mule
    WHEN Call API Sending file Mule_Withdraw from aoc to ITMX
    THEN Get File GPG Withdraw From ITMX JSON
    WHEN Check Response Code invalid_format_police_case_id GPG FILE with JSON
    THEN Check File REQ and RES File Mule Withdraw Negative
TC001_058
    [Tags]    Optional
    Given create File Name WithdrawMule
    WHEN Prepare Data TEST And create file 1 Json Valid Format police_case_type is Ts
    WHEN Encrypt File GPG To NITMX JSON ${FileName_Warrant}
    when login to sftp server and Put file by Mule
    WHEN Call API Sending file Mule_Withdraw from aoc to ITMX
    THEN Get File GPG Withdraw From ITMX JSON
    WHEN Check Response Code invalid_police_case_type GPG FILE with JSON
    THEN Check File REQ and RES File Mule Withdraw Negative
TC001_059
    [Tags]    Optional
    Given create File Name WithdrawMule
    WHEN Prepare Data TEST And create file 1 Json Valid Format police_case_type is 333
    WHEN Encrypt File GPG To NITMX JSON ${FileName_Warrant}
    when login to sftp server and Put file by Mule
    WHEN Call API Sending file Mule_Withdraw from aoc to ITMX
    THEN Get File GPG Withdraw From ITMX JSON
    WHEN Check Response Code invalid_police_case_type GPG FILE with JSON
    THEN Check File REQ and RES File Mule Withdraw Negative
TC001_061
    [Tags]    Optional
    Given create File Name WithdrawMule
    WHEN Prepare Data TEST And create file 1 Json Valid Format police_case_report_date is 25671030
    WHEN Encrypt File GPG To NITMX JSON ${FileName_Warrant}
    when login to sftp server and Put file by Mule
    WHEN Call API Sending file Mule_Withdraw from aoc to ITMX
    THEN Get File GPG Withdraw From ITMX JSON
    WHEN Check Response Code invalid_police_case_report_date GPG FILE with JSON
    THEN Check File REQ and RES File Mule Withdraw Negative
TC001_062
    [Tags]    Mandatory
    Given create File Name WithdrawMule
    WHEN Prepare Data TEST And create file 1 Json Valid Format police_case_report_date is Test-$%-ทส
    WHEN Encrypt File GPG To NITMX JSON ${FileName_Warrant}
    when login to sftp server and Put file by Mule
    WHEN Call API Sending file Mule_Withdraw from aoc to ITMX
    THEN Get File GPG Withdraw From ITMX JSON
    WHEN Check Response Code invalid_format_police_case_report_date GPG FILE with JSON
    THEN Check File REQ and RES File Mule Withdraw Negative
TC001_063
    [Tags]    Optional
    Given create File Name WithdrawMule
    WHEN Prepare Data TEST And create file 1 Json Valid Format police_case_report_date is 2500-10-32
    WHEN Encrypt File GPG To NITMX JSON ${FileName_Warrant}
    when login to sftp server and Put file by Mule
    WHEN Call API Sending file Mule_Withdraw from aoc to ITMX
    THEN Get File GPG Withdraw From ITMX JSON
    WHEN Check Response Code invalid_police_case_report_date GPG FILE with JSON
    THEN Check File REQ and RES File Mule Withdraw Negative
TC001_064
    [Tags]    Optional
    Given create File Name WithdrawMule
    WHEN Prepare Data TEST And create file 1 Json Valid Format police_case_report_date is 2500-13-30
    WHEN Encrypt File GPG To NITMX JSON ${FileName_Warrant}
    when login to sftp server and Put file by Mule
    WHEN Call API Sending file Mule_Withdraw from aoc to ITMX
    THEN Get File GPG Withdraw From ITMX JSON
    WHEN Check Response Code invalid_police_case_report_date GPG FILE with JSON
    THEN Check File REQ and RES File Mule Withdraw Negative
TC001_065
    [Tags]    Mandatory
    Given create File Name WithdrawMule
    WHEN Prepare Data TEST And create file 1 Json Valid Format police_case_report_date is 2444-10-30 
    WHEN Encrypt File GPG To NITMX JSON ${FileName_Warrant}
    when login to sftp server and Put file by Mule
    WHEN Call API Sending file Mule_Withdraw from aoc to ITMX
    THEN Get File GPG Withdraw From ITMX JSON
    WHEN Check Response Code invalid_condition_police_case_report_date GPG FILE with JSON
    THEN Check File REQ and RES File Mule Withdraw Negative
TC001_066
    [Tags]    Mandatory
    Given create File Name WithdrawMule
    WHEN Prepare Data TEST And create file 1 Json Valid Format police_case_report_date is 2567-10-301
    WHEN Encrypt File GPG To NITMX JSON ${FileName_Warrant}
    when login to sftp server and Put file by Mule
    WHEN Call API Sending file Mule_Withdraw from aoc to ITMX
    THEN Get File GPG Withdraw From ITMX JSON
    WHEN Check Response Code invalid_police_case_report_date GPG FILE with JSON
    THEN Check File REQ and RES File Mule Withdraw Negative
TC001_068 
    [Tags]    Mandatory
    Given create File Name WithdrawMule
    WHEN Prepare Data TEST And create file 1 Json Valid Format mule_account_no is TjsadjaoUskdก่ดนรห่ดหนด่หหกห
    WHEN Encrypt File GPG To NITMX JSON ${FileName_Warrant}
    when login to sftp server and Put file by Mule
    WHEN Call API Sending file Mule_Withdraw from aoc to ITMX
    THEN Get File GPG Withdraw From ITMX JSON
    WHEN Check Response Code invalid_format_mule_account_no GPG FILE with JSON
    THEN Check File REQ and RES File Mule Withdraw Negative
TC001_069 
    [Tags]    Optional
    Given create File Name WithdrawMule
    WHEN Prepare Data TEST And create file 1 Json Valid Format mule_account_no is 101110334643434252323525252535353556
    WHEN Encrypt File GPG To NITMX JSON ${FileName_Warrant}
    when login to sftp server and Put file by Mule
    WHEN Call API Sending file Mule_Withdraw from aoc to ITMX
    THEN Get File GPG Withdraw From ITMX JSON
    WHEN Check Response Code invalid_format_mule_account_no GPG FILE with JSON
    THEN Check File REQ and RES File Mule Withdraw Negative
TC001_071
    [Tags]    Optional
    Given create File Name WithdrawMule
    WHEN Prepare Data TEST And create file 1 Json Valid Format mule_account_type is เทส๑$%^&*#$^&
    WHEN Encrypt File GPG To NITMX JSON ${FileName_Warrant}
    when login to sftp server and Put file by Mule
    WHEN Call API Sending file Mule_Withdraw from aoc to ITMX
    THEN Get File GPG Withdraw From ITMX JSON
    WHEN Check Response Code invalid_format_mule_account_type GPG FILE with JSON
    THEN Check File REQ and RES File Mule Withdraw Negative
TC001_072
    [Tags]    Mandatory
    Given create File Name WithdrawMule
    WHEN Prepare Data TEST And create file 1 Json Valid Format mule_account_type is TjsadjaoUMO3449595050506696060606645
    WHEN Encrypt File GPG To NITMX JSON ${FileName_Warrant}
    when login to sftp server and Put file by Mule
    WHEN Call API Sending file Mule_Withdraw from aoc to ITMX
    THEN Get File GPG Withdraw From ITMX JSON
    WHEN Check Response Code invalid_format_mule_account_type GPG FILE with JSON
    THEN Check File REQ and RES File Mule Withdraw Negative
TC001_074
    [Tags]    Optional
    Given create File Name WithdrawMule
    WHEN Prepare Data TEST And create file 1 Json Valid Format mule_account_bankcode is กขTs1
    WHEN Encrypt File GPG To NITMX JSON ${FileName_Warrant}
    when login to sftp server and Put file by Mule
    WHEN Call API Sending file Mule_Withdraw from aoc to ITMX
    THEN Get File GPG Withdraw From ITMX JSON
    WHEN Check Response Code invalid_format_mule_account_bankcode GPG FILE with JSON
    THEN Check File REQ and RES File Mule Withdraw Negative
TC001_075
    [Tags]    Mandatory
    Given create File Name WithdrawMule
    WHEN Prepare Data TEST And create file 1 Json Valid Format mule_account_bankcode is 0044
    WHEN Encrypt File GPG To NITMX JSON ${FileName_Warrant}
    when login to sftp server and Put file by Mule
    WHEN Call API Sending file Mule_Withdraw from aoc to ITMX
    THEN Get File GPG Withdraw From ITMX JSON
    WHEN Check Response Code invalid_format_mule_account_bankcode GPG FILE with JSON
    THEN Check File REQ and RES File Mule Withdraw Negative
TC001_077
    [Tags]    Optional    appendix_1.7
    Given create File Name WithdrawMule
    WHEN Prepare Data TEST And create file 1 Json Valid Format mule_account_bankname is 안녕하세요
    WHEN Encrypt File GPG To NITMX JSON ${FileName_Warrant}
    when login to sftp server and Put file by Mule
    WHEN Call API Sending file Mule_Withdraw from aoc to ITMX
    THEN Get File GPG Withdraw From ITMX JSON
    WHEN Check Response Code invalid_format_mule_account_bankname GPG FILE with JSON
    THEN Check File REQ and RES File Mule Withdraw Negative
TC001_078
    [Tags]    Optional    appendix_1.7
    Given create File Name WithdrawMule
    WHEN Prepare Data TEST And create file 1 Json Valid Format mule_account_bankname is ทดสอบTeadast๑๒.~!@#$%^&*'()_+ =-][{}:;?.><,1234ทดสอบTeadast๑๒.~!@#$%^&*'()_+ =-][{}:;?.><,1234ทดสอบTeadast๑๒.~!@#$%^&*'()_+ =-][{}:;?.><,1234ทดสอบTeadast๑๒.~!@#$%^&*'()_+ =-][{}:;?.><,1234ทดสอบTeadast๑๒.~!@#$%^&*'()_+ =-][{3}:;?.><,1234ทดสอบTeadast๑๒kd8fjgld9j
    WHEN Encrypt File GPG To NITMX JSON ${FileName_Warrant}
    when login to sftp server and Put file by Mule
    WHEN Call API Sending file Mule_Withdraw from aoc to ITMX
    THEN Get File GPG Withdraw From ITMX JSON
    WHEN Check Response Code invalid_format_mule_account_bankname GPG FILE with JSON
    THEN Check File REQ and RES File Mule Withdraw Negative
TC001_080
    [Tags]    Optional    appendix_1.7
    Given create File Name WithdrawMule
    WHEN Prepare Data TEST And create file 1 Json Valid Format police_rank is から来ました
    WHEN Encrypt File GPG To NITMX JSON ${FileName_Warrant}
    when login to sftp server and Put file by Mule
    WHEN Call API Sending file Mule_Withdraw from aoc to ITMX
    THEN Get File GPG Withdraw From ITMX JSON
    WHEN Check Response Code invalid_format_police_rank GPG FILE with JSON
    THEN Check File REQ and RES File Mule Withdraw Negative
TC001_081
    [Tags]    Mandatory
    Given create File Name WithdrawMule
    WHEN Prepare Data TEST And create file 1 Json Valid Format police_rank is TjsadjaoUMO344959505msof่ห่ดกหร่ดหหา่าห่าผหฯฟไกฟดำค
    WHEN Encrypt File GPG To NITMX JSON ${FileName_Warrant}
    when login to sftp server and Put file by Mule
    WHEN Call API Sending file Mule_Withdraw from aoc to ITMX
    THEN Get File GPG Withdraw From ITMX JSON
    WHEN Check Response Code invalid_format_police_rank GPG FILE with JSON
    THEN Check File REQ and RES File Mule Withdraw Negative
TC001_083
    [Tags]    Optional    appendix_1.7
    Given create File Name WithdrawMule
    WHEN Prepare Data TEST And create file 1 Json Valid Format police_name is から来ました
    WHEN Encrypt File GPG To NITMX JSON ${FileName_Warrant}
    when login to sftp server and Put file by Mule
    WHEN Call API Sending file Mule_Withdraw from aoc to ITMX
    THEN Get File GPG Withdraw From ITMX JSON
    WHEN Check Response Code invalid_format_police_name GPG FILE with JSON
    THEN Check File REQ and RES File Mule Withdraw Negative
TC001_084
    [Tags]    Optional    appendix_1.7
    Given create File Name WithdrawMule
    WHEN Prepare Data TEST And create file 1 Json Valid Format police_name is ทดสอบTeadast๑๒.~!@#$%^&*'()_+ =-][{}:;?.><,1234ทดสอบTeadast๑๒.~!@#$%^&*'()_+ =-][{}:;?.><,1234ทดสอบTeadast๑๒.~!@#$%^&*'()_+ =-][{}:;?.><,1234ทดสอบTeadast๑๒.~!@#$%^&*'()_+ =-][{}:;?.><,1234ทดสอบTeadast๑๒.~!@#$%^&*'()_+ =-][{3}:;?.><,1234ทดสอบTeadast๑๒kd8fjgld9j
    WHEN Encrypt File GPG To NITMX JSON ${FileName_Warrant}
    when login to sftp server and Put file by Mule
    WHEN Call API Sending file Mule_Withdraw from aoc to ITMX
    THEN Get File GPG Withdraw From ITMX JSON
    WHEN Check Response Code invalid_format_police_name GPG FILE with JSON
    THEN Check File REQ and RES File Mule Withdraw Negative
TC001_086
    [Tags]    Optional    appendix_1.7
    Given create File Name WithdrawMule
    WHEN Prepare Data TEST And create file 1 Json Valid Format police_surname is から来ましたから来ましたから来ましたから来ましたから来ましたから来ましたから来ましたから来ましたから来ましたから来ましたから来ましたから来ましたから来ましたから来ましたから来ましたから来ましたから来ま
    WHEN Encrypt File GPG To NITMX JSON ${FileName_Warrant}
    when login to sftp server and Put file by Mule
    WHEN Call API Sending file Mule_Withdraw from aoc to ITMX
    THEN Get File GPG Withdraw From ITMX JSON
    WHEN Check Response Code invalid_format_police_surname GPG FILE with JSON
    THEN Check File REQ and RES File Mule Withdraw Negative
TC001_087
    [Tags]    Optional    appendix_1.7
    Given create File Name WithdrawMule
    WHEN Prepare Data TEST And create file 1 Json Valid Format police_surname is ทดสอบTeadast๑๒.~!@#$%^&*'()_+ =-][{}:;?.><,1234ทดสอบTeadast๑๒.~!@#$%^&*'()_+ =-][{}:;?.><,1234ทดสอบTeadast๑๒.~!@#$%^&*'()_+ =-][{}:;?.><,1234ทดสอบTeadast๑๒.~!@#$%^&*'()_+ =-][{}:;?.><,1234ทดสอบTeadast๑๒.~!@#$%^&*'()_+ =-][{3}:;?.><,1234ทดสอบTeadast๑๒kd8fjgld9j
    WHEN Encrypt File GPG To NITMX JSON ${FileName_Warrant}
    when login to sftp server and Put file by Mule
    WHEN Call API Sending file Mule_Withdraw from aoc to ITMX
    THEN Get File GPG Withdraw From ITMX JSON
    WHEN Check Response Code invalid_format_police_surname GPG FILE with JSON
    THEN Check File REQ and RES File Mule Withdraw Negative
TC001_089
    [Tags]    Optional    appendix_1.7
    Given create File Name WithdrawMule
    WHEN Prepare Data TEST And create file 1 Json Valid Format police_job_title is から来ましたから来ましたから来ましたから来ましたから来ましたから来ましたから来ましたから来ましたから来ましたから来ましたから来ましたから来ましたから来ましたから来ましたから来ましたから来ましたから来ま
    WHEN Encrypt File GPG To NITMX JSON ${FileName_Warrant}
    when login to sftp server and Put file by Mule
    WHEN Call API Sending file Mule_Withdraw from aoc to ITMX
    THEN Get File GPG Withdraw From ITMX JSON
    WHEN Check Response Code invalid_format_police_job_title GPG FILE with JSON
    THEN Check File REQ and RES File Mule Withdraw Negative
TC001_090
    [Tags]    Mandatory    appendix_1.7
    Given create File Name WithdrawMule
    WHEN Prepare Data TEST And create file 1 Json Valid Format police_job_title is kdfspofkjsoijgากยนด่หยด่หนดฟดาฟบดาฟหดฟยเวหย่ดหหรนด้หร้เหนรด้นหด้ฟนดฟ้แรผแJIIJNJDIMDKDIMKDKJFNJFJNDJ12
    WHEN Encrypt File GPG To NITMX JSON ${FileName_Warrant}
    when login to sftp server and Put file by Mule
    WHEN Call API Sending file Mule_Withdraw from aoc to ITMX
    THEN Get File GPG Withdraw From ITMX JSON
    WHEN Check Response Code invalid_format_police_job_title GPG FILE with JSON
    THEN Check File REQ and RES File Mule Withdraw Negative
TC001_092
    [Tags]    Optional    appendix_1.7
    Given create File Name WithdrawMule
    WHEN Prepare Data TEST And create file 1 Json Valid Format police_org is ||||||
    WHEN Encrypt File GPG To NITMX JSON ${FileName_Warrant}
    when login to sftp server and Put file by Mule
    WHEN Call API Sending file Mule_Withdraw from aoc to ITMX
    THEN Get File GPG Withdraw From ITMX JSON
    WHEN Check Response Code invalid_format_police_org GPG FILE with JSON
    THEN Check File REQ and RES File Mule Withdraw Negative
TC001_093
    [Tags]    Mandatory    appendix_1.7
    Given create File Name WithdrawMule
    WHEN Prepare Data TEST And create file 1 Json Valid Format police_job_title is kdfspofkjsoijgากยนด่หยด่หนดฟดาฟบดาฟหดฟยเวหย่ดหหรนด้หร้เหนรด้นหด้ฟนดฟ้แรผแJIIJNJDIMDKDIMKDKJFNJFJNDJ12
    WHEN Encrypt File GPG To NITMX JSON ${FileName_Warrant}
    when login to sftp server and Put file by Mule
    WHEN Call API Sending file Mule_Withdraw from aoc to ITMX
    THEN Get File GPG Withdraw From ITMX JSON
    WHEN Check Response Code invalid_format_police_job_title GPG FILE with JSON
    THEN Check File REQ and RES File Mule Withdraw Negative
TC001_095
    [Tags]    Optional    appendix_1.7
    Given create File Name WithdrawMule
    WHEN Prepare Data TEST And create file 1 Json Valid Format police_tel is 안녕하세요
    WHEN Encrypt File GPG To NITMX JSON ${FileName_Warrant}
    when login to sftp server and Put file by Mule
    WHEN Call API Sending file Mule_Withdraw from aoc to ITMX
    THEN Get File GPG Withdraw From ITMX JSON
    WHEN Check Response Code invalid_format_police_tel GPG FILE with JSON
    THEN Check File REQ and RES File Mule Withdraw Negative
TC001_096
    [Tags]    Optional    appendix_1.7
    Given create File Name WithdrawMule
    WHEN Prepare Data TEST And create file 1 Json Valid Format police_tel is ทด@#$%^&*อบTest๒\'.~!
    WHEN Encrypt File GPG To NITMX JSON ${FileName_Warrant}
    when login to sftp server and Put file by Mule
    WHEN Call API Sending file Mule_Withdraw from aoc to ITMX
    THEN Get File GPG Withdraw From ITMX JSON
    WHEN Check Response Code invalid_format_police_tel GPG FILE with JSON
    THEN Check File REQ and RES File Mule Withdraw Negative
TC001_098
    [Tags]    Optional
    Given create File Name WithdrawMule
    WHEN Prepare Data TEST And create file 1 Json Valid Format police_email is umaporn.artjdoifjsoTdjsofijsจต932sdjsda@sfrd.co.th
    WHEN Encrypt File GPG To NITMX JSON ${FileName_Warrant}
    when login to sftp server and Put file by Mule
    WHEN Call API Sending file Mule_Withdraw from aoc to ITMX
    THEN Get File GPG Withdraw From ITMX JSON
    WHEN Check Response Code invalid_format_police_email GPG FILE with JSON
    THEN Check File REQ and RES File Mule Withdraw Negative
TC001_099
    [Tags]    Mandatory
    Given create File Name WithdrawMule
    WHEN Prepare Data TEST And create file 1 Json Valid Format police_email is umaporn.artjdo_ifjso-Tdjsdofijs932sdjsda@sfrd.co.th
    WHEN Encrypt File GPG To NITMX JSON ${FileName_Warrant}
    when login to sftp server and Put file by Mule
    WHEN Call API Sending file Mule_Withdraw from aoc to ITMX
    THEN Get File GPG Withdraw From ITMX JSON
    WHEN Check Response Code invalid_format_police_email GPG FILE with JSON
    THEN Check File REQ and RES File Mule Withdraw Negative
TC002_001
    [Tags]    Mandatory
    Given create File Name WithdrawMule
    WHEN Prepare Data TEST And create file 1 Json Missing required field missing_field_declare_uuid
    WHEN Encrypt File GPG To NITMX JSON ${FileName_Warrant}
    when login to sftp server and Put file by Mule
    WHEN Call API Sending file Mule_Withdraw from aoc to ITMX
    THEN Get File GPG Withdraw From ITMX JSON
    WHEN Check Response Code missing_declare_uuid GPG FILE with JSON For Missing Field
    THEN Check File REQ and RES File Mule Withdraw Negative
TC002_002
    [Tags]    Mandatory
    Given create File Name WithdrawMule
    WHEN Prepare Data TEST And create file 1 Json Missing required field missing_field_declare_type_code
    WHEN Encrypt File GPG To NITMX JSON ${FileName_Warrant}
    when login to sftp server and Put file by Mule
    WHEN Call API Sending file Mule_Withdraw from aoc to ITMX
    THEN Get File GPG Withdraw From ITMX JSON
    WHEN Check Response Code missing_declare_type_code GPG FILE with JSON For Missing Field 
    THEN Check File REQ and RES File Mule Withdraw Negative
TC002_003
    [Tags]    Mandatory
    Given create File Name WithdrawMule
    WHEN Prepare Data TEST And create file 1 Json Missing required field missing_field_declare_type
    WHEN Encrypt File GPG To NITMX JSON ${FileName_Warrant}
    when login to sftp server and Put file by Mule
    WHEN Call API Sending file Mule_Withdraw from aoc to ITMX
    THEN Get File GPG Withdraw From ITMX JSON
    WHEN Check Response Code missing_declare_type GPG FILE with JSON For Missing Field 
    THEN Check File REQ and RES File Mule Withdraw Negative
TC002_004
    [Tags]    Mandatory
    Given create File Name WithdrawMule
    WHEN Prepare Data TEST And create file 1 Json Missing required field missing_field_declare_date
    WHEN Encrypt File GPG To NITMX JSON ${FileName_Warrant}
    when login to sftp server and Put file by Mule
    WHEN Call API Sending file Mule_Withdraw from aoc to ITMX
    THEN Get File GPG Withdraw From ITMX JSON
    WHEN Check Response Code missing_declare_date GPG FILE with JSON
    THEN Check File REQ and RES File Mule Withdraw Negative
TC002_005
    [Tags]    Mandatory
    Given create File Name WithdrawMule
    WHEN Prepare Data TEST And create file 1 Json Missing required field missing_field_declare_reason_code
    WHEN Encrypt File GPG To NITMX JSON ${FileName_Warrant}
    when login to sftp server and Put file by Mule
    WHEN Call API Sending file Mule_Withdraw from aoc to ITMX
    THEN Get File GPG Withdraw From ITMX JSON
    WHEN Check Response Code missing_declare_reason_code_value GPG FILE with JSON
    THEN Check File REQ and RES File Mule Withdraw Negative
TC002_006
    [Tags]    Mandatory
    Given create File Name WithdrawMule
    WHEN Prepare Data TEST And create file 1 Json Missing required field missing_field_declare_reason
    WHEN Encrypt File GPG To NITMX JSON ${FileName_Warrant}
    when login to sftp server and Put file by Mule
    WHEN Call API Sending file Mule_Withdraw from aoc to ITMX
    THEN Get File GPG Withdraw From ITMX JSON
    WHEN Check Response Code missing_declare_reason_value GPG FILE with JSON
    THEN Check File REQ and RES File Mule Withdraw Negative
TC002_007
    [Tags]    Mandatory
    Given create File Name WithdrawMule
    WHEN Prepare Data TEST And create file 1 Json Missing required field missing_field_declare_note
    WHEN Encrypt File GPG To NITMX JSON ${FileName_Warrant}
    when login to sftp server and Put file by Mule
    WHEN Call API Sending file Mule_Withdraw from aoc to ITMX
    THEN Get File GPG Withdraw From ITMX JSON
    WHEN Check Response Code missing_declare_note_value GPG FILE with JSON
    THEN Check File REQ and RES File Mule Withdraw Negative
TC002_008
    [Tags]    Mandatory
    Given create File Name WithdrawMule
    WHEN Prepare Data TEST And create file 1 Json Missing required field missing_field_mule_ref_code
    WHEN Encrypt File GPG To NITMX JSON ${FileName_Warrant}
    when login to sftp server and Put file by Mule
    WHEN Call API Sending file Mule_Withdraw from aoc to ITMX
    THEN Get File GPG Withdraw From ITMX JSON
    WHEN Check Response Code missing_mule_ref_code_value GPG FILE with JSON
    THEN Check File REQ and RES File Mule Withdraw Negative
TC002_009
    [Tags]    Mandatory
    Given create File Name WithdrawMule
    WHEN Prepare Data TEST And create file 1 Json Missing required field missing_field_mule_identity_id
    WHEN Encrypt File GPG To NITMX JSON ${FileName_Warrant}
    when login to sftp server and Put file by Mule
    WHEN Call API Sending file Mule_Withdraw from aoc to ITMX
    THEN Get File GPG Withdraw From ITMX JSON
    WHEN Check Response Code missing_mule_identity_id_value GPG FILE with JSON
    THEN Check File REQ and RES File Mule Withdraw Negative
TC002_010
    [Tags]    Mandatory
    Given create File Name WithdrawMule
    WHEN Prepare Data TEST And create file 1 Json Missing required field missing_field_mule_identity_type
    WHEN Encrypt File GPG To NITMX JSON ${FileName_Warrant}
    when login to sftp server and Put file by Mule
    WHEN Call API Sending file Mule_Withdraw from aoc to ITMX
    THEN Get File GPG Withdraw From ITMX JSON
    WHEN Check Response Code missing_mule_identity_type_value GPG FILE with JSON
    THEN Check File REQ and RES File Mule Withdraw Negative
TC002_011
    [Tags]    Mandatory
    Given create File Name WithdrawMule
    WHEN Prepare Data TEST And create file 1 Json Missing required field missing_field_mule_title
    WHEN Encrypt File GPG To NITMX JSON ${FileName_Warrant}
    when login to sftp server and Put file by Mule
    WHEN Call API Sending file Mule_Withdraw from aoc to ITMX
    THEN Get File GPG Withdraw From ITMX JSON
    WHEN Check Response Code missing_mule_title GPG FILE with JSON
    THEN Check File REQ and RES File Mule Withdraw Negative
TC002_012
    [Tags]    Mandatory
    Given create File Name WithdrawMule
    WHEN Prepare Data TEST And create file 1 Json Missing required field missing_field_mule_name
    WHEN Encrypt File GPG To NITMX JSON ${FileName_Warrant}
    when login to sftp server and Put file by Mule
    WHEN Call API Sending file Mule_Withdraw from aoc to ITMX
    THEN Get File GPG Withdraw From ITMX JSON
    WHEN Check Response Code missing_mule_name_value GPG FILE with JSON
    THEN Check File REQ and RES File Mule Withdraw Negative
TC002_013
    [Tags]    Mandatory
    Given create File Name WithdrawMule
    WHEN Prepare Data TEST And create file 1 Json Missing required field missing_field_mule_surnname
    WHEN Encrypt File GPG To NITMX JSON ${FileName_Warrant}
    when login to sftp server and Put file by Mule
    WHEN Call API Sending file Mule_Withdraw from aoc to ITMX
    THEN Get File GPG Withdraw From ITMX JSON
    WHEN Check Response Code Success GPG FILE with JSON
    THEN Check File REQ and RES File Mule Withdraw Positive
TC002_014
    [Tags]    Mandatory
    Given create File Name WithdrawMule
    WHEN Prepare Data TEST And create file 1 Json Missing required field missing_field_mule_birth_date
    WHEN Encrypt File GPG To NITMX JSON ${FileName_Warrant}
    when login to sftp server and Put file by Mule
    WHEN Call API Sending file Mule_Withdraw from aoc to ITMX
    THEN Get File GPG Withdraw From ITMX JSON
    WHEN Check Response Code missing_mule_birth_date GPG FILE with JSON
    THEN Check File REQ and RES File Mule Withdraw Negative
TC002_015
    [Tags]    Mandatory
    Given create File Name WithdrawMule
    WHEN Prepare Data TEST And create file 1 Json Missing required field missing_field_mule_nationality
    WHEN Encrypt File GPG To NITMX JSON ${FileName_Warrant}
    when login to sftp server and Put file by Mule
    WHEN Call API Sending file Mule_Withdraw from aoc to ITMX
    THEN Get File GPG Withdraw From ITMX JSON
    WHEN Check Response Code missing_mule_nationality_value GPG FILE with JSON
    THEN Check File REQ and RES File Mule Withdraw Negative
TC002_016
    [Tags]    Mandatory
    Given create File Name WithdrawMule
    WHEN Prepare Data TEST And create file 1 Json Missing required field missing_field_police_case_id
    WHEN Encrypt File GPG To NITMX JSON ${FileName_Warrant}
    when login to sftp server and Put file by Mule
    WHEN Call API Sending file Mule_Withdraw from aoc to ITMX
    THEN Get File GPG Withdraw From ITMX JSON
    WHEN Check Response Code missing_police_case_id GPG FILE with JSON
    THEN Check File REQ and RES File Mule Withdraw Negative
TC002_017
    [Tags]    Mandatory
    Given create File Name WithdrawMule
    WHEN Prepare Data TEST And create file 1 Json Missing required field missing_field_police_case_id
    WHEN Encrypt File GPG To NITMX JSON ${FileName_Warrant}
    when login to sftp server and Put file by Mule
    WHEN Call API Sending file Mule_Withdraw from aoc to ITMX
    THEN Get File GPG Withdraw From ITMX JSON
    WHEN Check Response Code missing_police_case_id GPG FILE with JSON
    THEN Check File REQ and RES File Mule Withdraw Negative
TC002_018
    [Tags]    Mandatory
    Given create File Name WithdrawMule
    WHEN Prepare Data TEST And create file 1 Json Missing required field missing_field_police_case_report_date
    WHEN Encrypt File GPG To NITMX JSON ${FileName_Warrant}
    when login to sftp server and Put file by Mule
    WHEN Call API Sending file Mule_Withdraw from aoc to ITMX
    THEN Get File GPG Withdraw From ITMX JSON
    WHEN Check Response Code missing_police_case_report_date GPG FILE with JSON
    THEN Check File REQ and RES File Mule Withdraw Negative
TC002_019
    [Tags]    Mandatory
    Given create File Name WithdrawMule
    WHEN Prepare Data TEST And create file 1 Json Missing required field missing_field_mule_account_no
    WHEN Encrypt File GPG To NITMX JSON ${FileName_Warrant}
    when login to sftp server and Put file by Mule
    WHEN Call API Sending file Mule_Withdraw from aoc to ITMX
    THEN Get File GPG Withdraw From ITMX JSON
    WHEN Check Response Code missing_mule_account_no_value GPG FILE with JSON
    THEN Check File REQ and RES File Mule Withdraw Negative
TC002_020
    [Tags]    Mandatory
    Given create File Name WithdrawMule
    WHEN Prepare Data TEST And create file 1 Json Missing required field missing_field_mule_account_type
    WHEN Encrypt File GPG To NITMX JSON ${FileName_Warrant}
    when login to sftp server and Put file by Mule
    WHEN Call API Sending file Mule_Withdraw from aoc to ITMX
    THEN Get File GPG Withdraw From ITMX JSON
    WHEN Check Response Code missing_mule_account_type_value GPG FILE with JSON
    THEN Check File REQ and RES File Mule Withdraw Negative
TC002_021
    [Tags]    Mandatory
    Given create File Name WithdrawMule
    WHEN Prepare Data TEST And create file 1 Json Missing required field is_missing_field_mule_account_bank
    WHEN Encrypt File GPG To NITMX JSON ${FileName_Warrant}
    when login to sftp server and Put file by Mule
    WHEN Call API Sending file Mule_Withdraw from aoc to ITMX
    THEN Get File GPG Withdraw From ITMX JSON
    WHEN Check Response Code missing_mule_account_bank GPG FILE with JSON
    # THEN Check File REQ and RES File Mule Withdraw Negative
TC002_022
    [Tags]    Mandatory
    Given create File Name WithdrawMule
    WHEN Prepare Data TEST And create file Json no vaule mule_acc_bankname
    WHEN Encrypt File GPG To NITMX JSON ${FileName_Warrant}
    when login to sftp server and Put file by Mule
    WHEN Call API Sending file Mule_Withdraw from aoc to ITMX
    THEN Get File GPG Withdraw From ITMX JSON
    WHEN Check Response Code missing_mule_account_bankname_value GPG FILE with JSON
    THEN Check File REQ and RES File Mule Withdraw Negative
TC002_023
    [Tags]    Mandatory
    Given create File Name WithdrawMule
    WHEN Prepare Data TEST And create file 1 Json Missing required field missing_field_police_rank
    WHEN Encrypt File GPG To NITMX JSON ${FileName_Warrant}
    when login to sftp server and Put file by Mule
    WHEN Call API Sending file Mule_Withdraw from aoc to ITMX
    THEN Get File GPG Withdraw From ITMX JSON
    WHEN Check Response Code missing_police_rank_value GPG FILE with JSON
    THEN Check File REQ and RES File Mule Withdraw Negative
TC002_024
    [Tags]    Mandatory
    Given create File Name WithdrawMule
    WHEN Prepare Data TEST And create file 1 Json Missing required field missing_field_police_name
    WHEN Encrypt File GPG To NITMX JSON ${FileName_Warrant}
    when login to sftp server and Put file by Mule
    WHEN Call API Sending file Mule_Withdraw from aoc to ITMX
    THEN Get File GPG Withdraw From ITMX JSON
    WHEN Check Response Code missing_police_name_value GPG FILE with JSON
    THEN Check File REQ and RES File Mule Withdraw Negative
TC002_025
    [Tags]    Mandatory
    Given create File Name WithdrawMule
    WHEN Prepare Data TEST And create file 1 Json Missing required field missing_field_police_surname
    WHEN Encrypt File GPG To NITMX JSON ${FileName_Warrant}
    when login to sftp server and Put file by Mule
    WHEN Call API Sending file Mule_Withdraw from aoc to ITMX
    THEN Get File GPG Withdraw From ITMX JSON
    WHEN Check Response Code missing_police_surname_value GPG FILE with JSON
    THEN Check File REQ and RES File Mule Withdraw Negative
TC002_026
    [Tags]    Mandatory
    Given create File Name WithdrawMule
    WHEN Prepare Data TEST And create file 1 Json Missing required field missing_field_police_job_title
    WHEN Encrypt File GPG To NITMX JSON ${FileName_Warrant}
    when login to sftp server and Put file by Mule
    WHEN Call API Sending file Mule_Withdraw from aoc to ITMX
    THEN Get File GPG Withdraw From ITMX JSON
    WHEN Check Response Code missing_police_job_title_value GPG FILE with JSON
    THEN Check File REQ and RES File Mule Withdraw Negative
TC002_027
    [Tags]    Mandatory
    Given create File Name WithdrawMule
    WHEN Prepare Data TEST And create file 1 Json Missing required field missing_field_police_org
    WHEN Encrypt File GPG To NITMX JSON ${FileName_Warrant}
    when login to sftp server and Put file by Mule
    WHEN Call API Sending file Mule_Withdraw from aoc to ITMX
    THEN Get File GPG Withdraw From ITMX JSON
    WHEN Check Response Code missing_police_org_value GPG FILE with JSON
    THEN Check File REQ and RES File Mule Withdraw Negative
TC002_028
    [Tags]    Mandatory
    Given create File Name WithdrawMule
    WHEN Prepare Data TEST And create file 1 Json Missing required field missing_field_police_tel
    WHEN Encrypt File GPG To NITMX JSON ${FileName_Warrant}
    when login to sftp server and Put file by Mule
    WHEN Call API Sending file Mule_Withdraw from aoc to ITMX
    THEN Get File GPG Withdraw From ITMX JSON
    WHEN Check Response Code missing_police_tel_value GPG FILE with JSON
    THEN Check File REQ and RES File Mule Withdraw Negative
TC002_029
    [Tags]    Mandatory
    Given create File Name WithdrawMule
    WHEN Prepare Data TEST And create file 1 Json Missing required field missing_field_police_email
    WHEN Encrypt File GPG To NITMX JSON ${FileName_Warrant}
    when login to sftp server and Put file by Mule
    WHEN Call API Sending file Mule_Withdraw from aoc to ITMX
    THEN Get File GPG Withdraw From ITMX JSON
    WHEN Check Response Code missing_police_email_value GPG FILE with JSON
    THEN Check File REQ and RES File Mule Withdraw Negative
TC002_030
    [Tags]    Mandatory
    Given create File Name WithdrawMule
    WHEN Prepare Data TEST And create file 1 Json Missing required field missing_field_police_email
    WHEN Encrypt File GPG To NITMX JSON ${FileName_Warrant}
    when login to sftp server and Put file by Mule
    WHEN Call API Sending file Mule_Withdraw from aoc to ITMX
    THEN Get File GPG Withdraw From ITMX JSON
    WHEN Check Response Code missing_police_email_value GPG FILE with JSON
    THEN Check File REQ and RES File Mule Withdraw Negative
TC003_002
    [Tags]    Mandatory
    Given create File Name WithdrawMule
    WHEN Prepare Data TEST And create file 1 Json Valid Format declare_type_code is 3
    WHEN Encrypt File GPG To NITMX JSON ${FileName_Warrant}
    when login to sftp server and Put file by Mule
    WHEN Call API Sending file Mule_Withdraw from aoc to ITMX
    THEN Get File GPG Withdraw From ITMX JSON
    WHEN Check Response Code invalid_declare_type_code_6701 GPG FILE with JSON
    THEN Check File REQ and RES File Mule Withdraw Negative
TC003_004
    [Tags]    Mandatory
    Given create File Name WithdrawMule
    WHEN Prepare Data TEST And create file 1 Json Valid Condition declare_date is More is 1 days
    WHEN Encrypt File GPG To NITMX JSON ${FileName_Warrant}
    when login to sftp server and Put file by Mule
    WHEN Call API Sending file Mule_Withdraw from aoc to ITMX
    THEN Get File GPG Withdraw From ITMX JSON
    WHEN Check Response Code invalid_condition_declare_date GPG FILE with JSON
    THEN Check File REQ and RES File Mule Withdraw Negative
TC003_006
    [Tags]    Mandatory
    Given create File Name WithdrawMule
    WHEN Prepare Data TEST And create file 1 Json Valid Format mule_identity_id is 4019241170699
    WHEN Encrypt File GPG To NITMX JSON ${FileName_Warrant}
    when login to sftp server and Put file by Mule
    WHEN Call API Sending file Mule_Withdraw from aoc to ITMX
    THEN Get File GPG Withdraw From ITMX JSON
    WHEN Check Response Code invalida_mule_iden_not_match_sys GPG FILE with JSON
    THEN Check File REQ and RES File Mule Withdraw Negative
TC003_008 
    [Tags]    Mandatory
    Given create File Name WithdrawMule
    WHEN Prepare Data TEST And create file 1 Json Valid Format fix_mule_ref_code is CF00000359
    WHEN Encrypt File GPG To NITMX JSON ${FileName_Warrant}
    when login to sftp server and Put file by Mule
    WHEN Call API Sending file Mule_Withdraw from aoc to ITMX
    THEN Get File GPG Withdraw From ITMX JSON
    WHEN Check Response Code invalida_mule_iden_and_mule_ref_match_sys GPG FILE with JSON
    THEN Check File REQ and RES File Mule Withdraw Negative
TC003_009
    [Tags]    Mandatory
    Given create File Name WithdrawMule
    WHEN Generate fILE JSON Loop amount is 3 file
    WHEN Encrypt File GPG To NITMX JSON ${FileName_Warrant}
    when login to sftp server and Put file by Mule
    WHEN Call API Sending file Mule_Withdraw from aoc to ITMX
    THEN Get File GPG Withdraw From ITMX JSON
    WHEN Check Response Code duplicate_within_the_same_file GPG FILE with JSON
    THEN Check File REQ and RES File Mule Withdraw Negative
TC003_010
    [Tags]    Mandatory
    Given create File Name WithdrawMule
    # WHEN Prepare Data TEST And create file Json amount is 2
    WHEN Generate fILE JSON Loop amount is 2 file
    WHEN Encrypt File GPG To NITMX JSON ${FileName_Warrant}
    when login to sftp server and Put file by Mule
    WHEN Call API Sending file Mule_Withdraw from aoc to ITMX
    THEN Get File GPG Withdraw From ITMX JSON
    WHEN Check Response Code duplicate_within_the_same_file GPG FILE with JSON
    THEN Check File REQ and RES File Mule Withdraw Negative
TC003_015
    [Tags]    Mandatory
    Given create File Name WithdrawMule
    WHEN Prepare Data TEST And create file 1 Json Valid Format mule_identity_id is 342983472042422492420492424209499342
    WHEN Encrypt File GPG To NITMX JSON ${FileName_Warrant}
    when login to sftp server and Put file by Mule
    WHEN Call API Sending file Mule_Withdraw from aoc to ITMX
    THEN Get File GPG Withdraw From ITMX JSON
    WHEN Check Response Code invalid_mule_identity_id GPG FILE with JSON
    THEN Check File REQ and RES File Mule Withdraw Negative
# TC003_016
#     [Tags]    Optional
#     Given create File Name WithdrawMule
#     WHEN Prepare Data TEST And create file 1 Json Valid Format mule_identity_id is 3848472424240
#     WHEN Encrypt File GPG To NITMX JSON ${FileName_Warrant}
#     when login to sftp server and Put file by Mule
#     WHEN Call API Sending file Mule_Withdraw from aoc to ITMX
#     THEN Get File GPG Withdraw From ITMX JSON
#     WHEN Check Response Code invalid_mule_identity_id GPG FILE with JSON
TC003_018
    [Tags]    Mandatory
    Given create File Name WithdrawMule
    WHEN Prepare Data TEST And create file 1 Json Valid Format mule_identity_id is 평 안 하 다
    WHEN Encrypt File GPG To NITMX JSON ${FileName_Warrant}
    when login to sftp server and Put file by Mule
    WHEN Call API Sending file Mule_Withdraw from aoc to ITMX
    THEN Get File GPG Withdraw From ITMX JSON
    WHEN Check Response Code invalid_mule_identity_id GPG FILE with JSON
    THEN Check File REQ and RES File Mule Withdraw Negative
TC003_023
    [Tags]    Mandatory
    Given create File Name WithdrawMule
    WHEN Prepare Data TEST And create file 1 Json Valid Format declare_type_code is 2 and declare_type is ปลดม้าเทาเข้มรายบัญชี
    WHEN Encrypt File GPG To NITMX JSON ${FileName_Warrant}
    when login to sftp server and Put file by Mule
    WHEN Call API Sending file Mule_Withdraw from aoc to ITMX
    THEN Get File GPG Withdraw From ITMX JSON
    WHEN Check Response Code invalid_condition_declare_type GPG FILE with JSON
    THEN Check File REQ and RES File Mule Withdraw Negative
TC003_025
    [Tags]    Mandatory
    Given create File Name WithdrawMule
    WHEN Prepare Data TEST And create file 1 Json Valid Format declare_reason_code is 99
    WHEN Encrypt File GPG To NITMX JSON ${FileName_Warrant}
    when login to sftp server and Put file by Mule
    WHEN Call API Sending file Mule_Withdraw from aoc to ITMX
    THEN Get File GPG Withdraw From ITMX JSON
    WHEN Check Response Code invalid_condition_declare_reason GPG FILE with JSON
    THEN Check File REQ and RES File Mule Withdraw Negative
TC003_027
    [Tags]    Mandatory
    Given create File Name WithdrawMule
    WHEN Prepare Data TEST And create file 1 Json Valid Format police_case_id is R25671030000198420942823432344
    WHEN Encrypt File GPG To NITMX JSON ${FileName_Warrant}
    when login to sftp server and Put file by Mule
    WHEN Call API Sending file Mule_Withdraw from aoc to ITMX
    THEN Get File GPG Withdraw From ITMX JSON
    WHEN Check Response Code Success GPG FILE with JSON
    THEN Check File REQ and RES File Mule Withdraw Positive
TC003_030
    [Tags]    Mandatory
    Given create File Name WithdrawMule
    WHEN Prepare Data TEST And create file 1 Json Missing required field missing_mule_surnname
    WHEN Encrypt File GPG To NITMX JSON ${FileName_Warrant}
    when login to sftp server and Put file by Mule
    WHEN Call API Sending file Mule_Withdraw from aoc to ITMX
    THEN Get File GPG Withdraw From ITMX JSON
    WHEN Check Response Code missing_mule_surnname GPG FILE with JSON
    THEN Check File REQ and RES File Mule Withdraw Negative
TC003_033
    [Tags]    Mandatory
    Given create File Name WithdrawMule
    WHEN Prepare Data TEST And create file 1 Json Valid Format mule_nationality is EZ
    WHEN Encrypt File GPG To NITMX JSON ${FileName_Warrant}
    when login to sftp server and Put file by Mule
    WHEN Call API Sending file Mule_Withdraw from aoc to ITMX
    THEN Get File GPG Withdraw From ITMX JSON
    WHEN Check Response Code invalid_condition_mule_nationality GPG FILE with JSON
    THEN Check File REQ and RES File Mule Withdraw Negative
TC004_001
    [Tags]    Mandatory
    Given create File Name WithdrawMule
    WHEN Prepare Data TEST And create file 1 Json Missing required field missing_declare_uuid
    WHEN Encrypt File GPG To NITMX JSON ${FileName_Warrant}
    when login to sftp server and Put file by Mule
    WHEN Call API Sending file Mule_Withdraw from aoc to ITMX
    THEN Get File GPG Withdraw From ITMX JSON
    WHEN Check Response Code missing_declare_type_code GPG FILE with JSON In Missing field is "missing_declare_uuid"
    THEN Check File REQ and RES File Mule Withdraw Negative
TC004_002
    [Tags]    Mandatory
    Given create File Name WithdrawMule
    WHEN Prepare Data TEST And create file 1 Json Missing required field missing_declare_type_code
    WHEN Encrypt File GPG To NITMX JSON ${FileName_Warrant}
    when login to sftp server and Put file by Mule
    WHEN Call API Sending file Mule_Withdraw from aoc to ITMX
    THEN Get File GPG Withdraw From ITMX JSON
    WHEN Check Response Code missing_declare_type_code GPG FILE with JSON In Missing field is "missing_declare_type_code"
    THEN Check File REQ and RES File Mule Withdraw Negative
TC004_003
    [Tags]    Mandatory
    Given create File Name WithdrawMule
    WHEN Prepare Data TEST And create file 1 Json Missing required field missing_declare_type
    WHEN Encrypt File GPG To NITMX JSON ${FileName_Warrant}
    when login to sftp server and Put file by Mule
    WHEN Call API Sending file Mule_Withdraw from aoc to ITMX
    THEN Get File GPG Withdraw From ITMX JSON
    WHEN Check Response Code missing_declare_type GPG FILE with JSON In Missing field is "missing_declare_type"
    THEN Check File REQ and RES File Mule Withdraw Negative
TC004_004
    [Tags]    Mandatory
    Given create File Name WithdrawMule
    WHEN Prepare Data TEST And create file 1 Json Missing required field missing_mule_ref_code
    WHEN Encrypt File GPG To NITMX JSON ${FileName_Warrant}
    when login to sftp server and Put file by Mule
    WHEN Call API Sending file Mule_Withdraw from aoc to ITMX
    THEN Get File GPG Withdraw From ITMX JSON
    WHEN Check Response Code missing_declare_type GPG FILE with JSON In Missing field is "missing_mule_ref_code"
    THEN Check File REQ and RES File Mule Withdraw Negative
TC004_005
    [Tags]    Mandatory
    Given create File Name WithdrawMule
    WHEN Prepare Data TEST And create file 1 Json Missing required field missing_declare_reason_code
    WHEN Encrypt File GPG To NITMX JSON ${FileName_Warrant}
    when login to sftp server and Put file by Mule
    WHEN Call API Sending file Mule_Withdraw from aoc to ITMX
    THEN Get File GPG Withdraw From ITMX JSON
    WHEN Check Response Code missing_declare_reason_code GPG FILE with JSON
    THEN Check File REQ and RES File Mule Withdraw Negative
TC004_006
    [Tags]    Mandatory
    Given create File Name WithdrawMule
    WHEN Prepare Data TEST And create file 1 Json Missing required field missing_declare_reason
    WHEN Encrypt File GPG To NITMX JSON ${FileName_Warrant}
    when login to sftp server and Put file by Mule
    WHEN Call API Sending file Mule_Withdraw from aoc to ITMX
    THEN Get File GPG Withdraw From ITMX JSON
    WHEN Check Response Code missing_declare_reason GPG FILE with JSON
    THEN Check File REQ and RES File Mule Withdraw Negative
TC004_007
    [Tags]    Mandatory
    Given create File Name WithdrawMule
    WHEN Prepare Data TEST And create file 1 Json Missing required field missing_declare_note
    WHEN Encrypt File GPG To NITMX JSON ${FileName_Warrant}
    when login to sftp server and Put file by Mule
    WHEN Call API Sending file Mule_Withdraw from aoc to ITMX
    THEN Get File GPG Withdraw From ITMX JSON
    WHEN Check Response Code missing_declare_note GPG FILE with JSON
    THEN Check File REQ and RES File Mule Withdraw Negative
TC004_008
    [Tags]    Mandatory
    Given create File Name WithdrawMule
    WHEN Prepare Data TEST And create file 1 Json Missing required field missing_mule_ref_code
    WHEN Encrypt File GPG To NITMX JSON ${FileName_Warrant}
    when login to sftp server and Put file by Mule
    WHEN Call API Sending file Mule_Withdraw from aoc to ITMX
    THEN Get File GPG Withdraw From ITMX JSON
    WHEN Check Response Code missing_declare_type GPG FILE with JSON In Missing field is "missing_mule_ref_code"
    THEN Check File REQ and RES File Mule Withdraw Negative
TC004_009
    [Tags]    Mandatory
    Given create File Name WithdrawMule
    WHEN Prepare Data TEST And create file 1 Json Missing required field missing_mule_identity_id
    WHEN Encrypt File GPG To NITMX JSON ${FileName_Warrant}
    when login to sftp server and Put file by Mule
    WHEN Call API Sending file Mule_Withdraw from aoc to ITMX
    THEN Get File GPG Withdraw From ITMX JSON
    WHEN Check Response Code missing_mule_identity_id GPG FILE with JSON
    THEN Check File REQ and RES File Mule Withdraw Negative
TC004_010
    [Tags]    Mandatory
    Given create File Name WithdrawMule
    WHEN Prepare Data TEST And create file 1 Json Missing required field missing_mule_identity_type
    WHEN Encrypt File GPG To NITMX JSON ${FileName_Warrant}
    when login to sftp server and Put file by Mule
    WHEN Call API Sending file Mule_Withdraw from aoc to ITMX
    THEN Get File GPG Withdraw From ITMX JSON
    WHEN Check Response Code missing_mule_identity_type GPG FILE with JSON
    THEN Check File REQ and RES File Mule Withdraw Negative
TC004_012
    [Tags]    Mandatory
    Given create File Name WithdrawMule
    WHEN Prepare Data TEST And create file 1 Json Missing required field missing_mule_name
    WHEN Encrypt File GPG To NITMX JSON ${FileName_Warrant}
    when login to sftp server and Put file by Mule
    WHEN Call API Sending file Mule_Withdraw from aoc to ITMX
    THEN Get File GPG Withdraw From ITMX JSON
    WHEN Check Response Code missing_mule_name GPG FILE with JSON
    THEN Check File REQ and RES File Mule Withdraw Negative
TC004_013
    [Tags]    Mandatory
    Given create File Name WithdrawMule
    WHEN Prepare Data TEST And create file 1 Json Missing required field missing_mule_surnname
    WHEN Encrypt File GPG To NITMX JSON ${FileName_Warrant}
    when login to sftp server and Put file by Mule
    WHEN Call API Sending file Mule_Withdraw from aoc to ITMX
    THEN Get File GPG Withdraw From ITMX JSON
    WHEN Check Response Code missing_mule_surnname GPG FILE with JSON
    THEN Check File REQ and RES File Mule Withdraw Negative
TC004_014
    [Tags]    Mandatory
    Given create File Name WithdrawMule
    WHEN Prepare Data TEST And create file 1 Json Missing required field missing_mule_birth_date
    WHEN Encrypt File GPG To NITMX JSON ${FileName_Warrant}
    when login to sftp server and Put file by Mule
    WHEN Call API Sending file Mule_Withdraw from aoc to ITMX
    THEN Get File GPG Withdraw From ITMX JSON
    WHEN Check Response Code Success GPG FILE with JSON
    THEN Check File REQ and RES File Mule Withdraw Positive
TC004_015
    [Tags]    Mandatory
    Given create File Name WithdrawMule
    WHEN Prepare Data TEST And create file 1 Json Missing required field missing_mule_nationality
    WHEN Encrypt File GPG To NITMX JSON ${FileName_Warrant}
    when login to sftp server and Put file by Mule
    WHEN Call API Sending file Mule_Withdraw from aoc to ITMX
    THEN Get File GPG Withdraw From ITMX JSON
    WHEN Check Response Code missing_mule_nationality GPG FILE with JSON
    THEN Check File REQ and RES File Mule Withdraw Negative
TC004_016
    [Tags]    Mandatory
    Given create File Name WithdrawMule
    WHEN Prepare Data TEST And create file 1 Json Missing required field missing_police_case_id
    WHEN Encrypt File GPG To NITMX JSON ${FileName_Warrant}
    when login to sftp server and Put file by Mule
    WHEN Call API Sending file Mule_Withdraw from aoc to ITMX
    THEN Get File GPG Withdraw From ITMX JSON
    WHEN Check Response Code missing_police_case_id GPG FILE with JSON
    THEN Check File REQ and RES File Mule Withdraw Negative
TC004_017
    [Tags]    Mandatory
    Given create File Name WithdrawMule
    WHEN Prepare Data TEST And create file 1 Json Missing required field missing_police_case_type
    WHEN Encrypt File GPG To NITMX JSON ${FileName_Warrant}
    when login to sftp server and Put file by Mule
    WHEN Call API Sending file Mule_Withdraw from aoc to ITMX
    THEN Get File GPG Withdraw From ITMX JSON
    WHEN Check Response Code missing_police_case_type GPG FILE with JSON
    THEN Check File REQ and RES File Mule Withdraw Negative
TC004_018
    [Tags]    Mandatory
    Given create File Name WithdrawMule
    WHEN Prepare Data TEST And create file 1 Json Missing required field missing_police_case_report_date
    WHEN Encrypt File GPG To NITMX JSON ${FileName_Warrant}
    when login to sftp server and Put file by Mule
    WHEN Call API Sending file Mule_Withdraw from aoc to ITMX
    THEN Get File GPG Withdraw From ITMX JSON
    WHEN Check Response Code missing_police_case_report_date GPG FILE with JSON
    THEN Check File REQ and RES File Mule Withdraw Negative
TC004_019
    [Tags]    Mandatory
    Given create File Name WithdrawMule
    WHEN Prepare Data TEST And create file 1 Json Missing required field missing_mule_account_no
    WHEN Encrypt File GPG To NITMX JSON ${FileName_Warrant}
    when login to sftp server and Put file by Mule
    WHEN Call API Sending file Mule_Withdraw from aoc to ITMX
    THEN Get File GPG Withdraw From ITMX JSON
    WHEN Check Response Code missing_mule_account_no GPG FILE with JSON
    THEN Check File REQ and RES File Mule Withdraw Negative
TC004_020
    [Tags]    Mandatory
    Given create File Name WithdrawMule
    WHEN Prepare Data TEST And create file 1 Json Missing required field missing_mule_account_type
    WHEN Encrypt File GPG To NITMX JSON ${FileName_Warrant}
    when login to sftp server and Put file by Mule
    WHEN Call API Sending file Mule_Withdraw from aoc to ITMX
    THEN Get File GPG Withdraw From ITMX JSON
    WHEN Check Response Code missing_mule_account_type GPG FILE with JSON
    THEN Check File REQ and RES File Mule Withdraw Negative
TC004_021
    [Tags]    Mandatory
    Given create File Name WithdrawMule
    WHEN Prepare Data TEST And create file 1 Json Missing required field is_missing_mule_account_bank
    WHEN Encrypt File GPG To NITMX JSON ${FileName_Warrant}
    when login to sftp server and Put file by Mule
    WHEN Call API Sending file Mule_Withdraw from aoc to ITMX
    THEN Get File GPG Withdraw From ITMX JSON
    WHEN Check Response Code is_missing_mule_account_bank GPG FILE with JSON
    THEN Check File REQ and RES File Mule Withdraw Negative
TC004_022
    [Tags]    Mandatory
    Given create File Name WithdrawMule
    WHEN Prepare Data TEST And create file Json no parameter mule_acc_bankname
    WHEN Encrypt File GPG To NITMX JSON ${FileName_Warrant}
    when login to sftp server and Put file by Mule
    WHEN Call API Sending file Mule_Withdraw from aoc to ITMX
    THEN Get File GPG Withdraw From ITMX JSON
    WHEN Check Response Code missing_mule_account_bankname GPG FILE with JSON
    THEN Check File REQ and RES File Mule Withdraw Negative
TC004_023
    [Tags]    Mandatory
    Given create File Name WithdrawMule
    WHEN Prepare Data TEST And create file 1 Json Missing required field missing_police_rank
    WHEN Encrypt File GPG To NITMX JSON ${FileName_Warrant}
    when login to sftp server and Put file by Mule
    WHEN Call API Sending file Mule_Withdraw from aoc to ITMX
    THEN Get File GPG Withdraw From ITMX JSON
    WHEN Check Response Code missing_police_rank GPG FILE with JSON
    THEN Check File REQ and RES File Mule Withdraw Negative
TC004_024
    [Tags]    Mandatory
    Given create File Name WithdrawMule
    WHEN Prepare Data TEST And create file 1 Json Missing required field missing_police_name
    WHEN Encrypt File GPG To NITMX JSON ${FileName_Warrant}
    when login to sftp server and Put file by Mule
    WHEN Call API Sending file Mule_Withdraw from aoc to ITMX
    THEN Get File GPG Withdraw From ITMX JSON
    WHEN Check Response Code missing_police_name GPG FILE with JSON
    THEN Check File REQ and RES File Mule Withdraw Negative
TC004_025
    [Tags]    Mandatory
    Given create File Name WithdrawMule
    WHEN Prepare Data TEST And create file 1 Json Missing required field missing_police_surname
    WHEN Encrypt File GPG To NITMX JSON ${FileName_Warrant}
    when login to sftp server and Put file by Mule
    WHEN Call API Sending file Mule_Withdraw from aoc to ITMX
    THEN Get File GPG Withdraw From ITMX JSON
    WHEN Check Response Code missing_police_surname GPG FILE with JSON
    THEN Check File REQ and RES File Mule Withdraw Negative
TC004_026
    [Tags]    Mandatory
    Given create File Name WithdrawMule
    WHEN Prepare Data TEST And create file 1 Json Missing required field missing_police_job_title
    WHEN Encrypt File GPG To NITMX JSON ${FileName_Warrant}
    when login to sftp server and Put file by Mule
    WHEN Call API Sending file Mule_Withdraw from aoc to ITMX
    THEN Get File GPG Withdraw From ITMX JSON
    WHEN Check Response Code missing_police_job_title GPG FILE with JSON
    THEN Check File REQ and RES File Mule Withdraw Negative
TC004_027
    [Tags]    Mandatory
    Given create File Name WithdrawMule
    WHEN Prepare Data TEST And create file 1 Json Missing required field missing_police_org
    WHEN Encrypt File GPG To NITMX JSON ${FileName_Warrant}
    when login to sftp server and Put file by Mule
    WHEN Call API Sending file Mule_Withdraw from aoc to ITMX
    THEN Get File GPG Withdraw From ITMX JSON
    WHEN Check Response Code missing_police_org GPG FILE with JSON
    THEN Check File REQ and RES File Mule Withdraw Negative
TC004_028
    [Tags]    Mandatory
    Given create File Name WithdrawMule
    WHEN Prepare Data TEST And create file 1 Json Missing required field missing_police_tel
    WHEN Encrypt File GPG To NITMX JSON ${FileName_Warrant}
    when login to sftp server and Put file by Mule
    WHEN Call API Sending file Mule_Withdraw from aoc to ITMX
    THEN Get File GPG Withdraw From ITMX JSON
    WHEN Check Response Code missing_police_tel GPG FILE with JSON
    THEN Check File REQ and RES File Mule Withdraw Negative
TC004_029
    [Tags]    Mandatory
    Given create File Name WithdrawMule
    WHEN Prepare Data TEST And create file 1 Json Missing required field missing_police_email
    WHEN Encrypt File GPG To NITMX JSON ${FileName_Warrant}
    when login to sftp server and Put file by Mule
    WHEN Call API Sending file Mule_Withdraw from aoc to ITMX
    THEN Get File GPG Withdraw From ITMX JSON
    WHEN Check Response Code missing_police_email GPG FILE with JSON
    THEN Check File REQ and RES File Mule Withdraw Negative
TC005_003
    [Tags]    Mandatory
    Given create File Name WithdrawMule validate file name is TEST and runing number is 3 and validate format REQ and RES
    WHEN Prepare Data TEST And create file Json
    WHEN Encrypt File GPG To NITMX JSON ${FileName_Warrant}
    when login to sftp server and Put file by Mule
    WHEN Call API Sending file Mule_Withdraw from aoc to ITMX
    THEN Get File GPG Withdraw From ITMX JSON
    WHEN Check Response Code invalid_file_name_format GPG FILE with JSON For Missing Field
    THEN Remove file Json WithDraw SSH
    THEN Deleted file
    # THEN Check File REQ and RES File Mule Withdraw Negative
TC005_004
    [Tags]    Optional
    Given create File Name WithdrawMule validate file name is ทดสอบค่ะ!+@&% and runing number is 3 and validate format REQ and RES
    WHEN Prepare Data TEST And create file Json
    WHEN Encrypt File GPG To NITMX JSON ${FileName_Warrant}
    when login to sftp server and Put file by Mule
    WHEN Call API Sending file Mule_Withdraw from aoc to ITMX
    THEN Get File GPG Withdraw From ITMX JSON
    WHEN Check Response Code invalid_file_name_format GPG FILE with JSON For Missing Field
    THEN Remove file Json WithDraw SSH
    THEN Deleted file    
    # THEN Check File REQ and RES File Mule Withdraw Negative
TC005_006
    [Tags]    Mandatory
    Given create File Name WithdrawMule
    WHEN Prepare Data TEST And create file Json
    WHEN Encrypt File GPG To NITMX JSON ${FileName_Warrant} validate file name extenstion is json and validate file name uppercase gpg is GPG
    when login to sftp server and Put file by Mule
    WHEN Call API Sending file Mule_Withdraw from aoc to ITMX
TC005_007
    [Tags]    Mandatory
    Given create File Name WithdrawMule validate file name is CFR_WithdrawMule and runing number is 3 and validate format TEST and TEST
    WHEN Prepare Data TEST And create file Json
    WHEN Encrypt File GPG To NITMX JSON ${FileName_Warrant}
    when login to sftp server and Put file by Mule
    WHEN Call API Sending file Mule_Withdraw from aoc to ITMX
    THEN Get File GPG Withdraw From ITMX JSON fix surefile
    WHEN Check Response Code invalid_file_name_format GPG FILE with JSON For Missing Field
    THEN Remove file Json WithDraw SSH
    THEN Deleted file
TC005_008
    [Tags]    Mandatory
    Given create File Name WithdrawMule validate filenamedatetime is 2567TS20
    WHEN Prepare Data TEST And create file Json
    WHEN Encrypt File GPG To NITMX JSON ${FileName_Warrant}
    when login to sftp server and Put file by Mule
    WHEN Call API Sending file Mule_Withdraw from aoc to ITMX
    THEN Get File GPG Withdraw From ITMX JSON
    WHEN Check Response Code invalid_file_name_format GPG FILE with JSON For Missing Field
    THEN Remove file Json WithDraw SSH
    THEN Deleted file
    # THEN Check File REQ and RES File Mule Withdraw Negative
TC005_009
    [Tags]    Optional
    Given create File Name WithdrawMule validate filenamedatetime is 256709เทส
    WHEN Prepare Data TEST And create file Json
    WHEN Encrypt File GPG To NITMX JSON ${FileName_Warrant}
    when login to sftp server and Put file by Mule
    WHEN Call API Sending file Mule_Withdraw from aoc to ITMX
    THEN Get File GPG Withdraw From ITMX JSON
    WHEN Check Response Code invalid_file_name_format GPG FILE with JSON For Missing Field
    THEN Remove file Json WithDraw SSH
    THEN Deleted file
    # THEN Check File REQ and RES File Mule Withdraw Negative

TC005_010
    [Tags]    Optional
    Given create File Name WithdrawMule validate file name is CFR_WithdrawMule and runing number is 2 and validate format REQ and RES
    WHEN Prepare Data TEST And create file Json
    WHEN Encrypt File GPG To NITMX JSON ${FileName_Warrant}
    when login to sftp server and Put file by Mule
    WHEN Call API Sending file Mule_Withdraw from aoc to ITMX
    THEN Get File GPG Withdraw From ITMX JSON
    WHEN Check Response Code invalid_file_name_format GPG FILE with JSON For Missing Field
    THEN Remove file Json WithDraw SSH
    THEN Deleted file
    # THEN Check File REQ and RES File Mule Withdraw Negative
TC005_011
    [Tags]    Mandatory
    Given create File Name WithdrawMule validate file name is CFR_WithdrawMule and runing number is 4 and validate format REQ and RES
    WHEN Prepare Data TEST And create file Json
    WHEN Encrypt File GPG To NITMX JSON ${FileName_Warrant}
    when login to sftp server and Put file by Mule
    WHEN Call API Sending file Mule_Withdraw from aoc to ITMX
    THEN Get File GPG Withdraw From ITMX JSON
    WHEN Check Response Code invalid_file_name_format GPG FILE with JSON For Missing Field
    THEN Remove file Json WithDraw SSH
    THEN Deleted file
    # THEN Check File REQ and RES File Mule Withdraw Negative

TC005_012
    [Tags]    Mandatory
    Given create File Name WithdrawMule
    WHEN Prepare Data TEST And create file Json and fix file name to create is txt
    WHEN Encrypt File GPG To NITMX JSON ${FileName_Warrant} validate file name extenstion is txt and validate file name uppercase gpg is gpg
    when login to sftp server and Put file by Mule
    WHEN Call API Sending file Mule_Withdraw from aoc to ITMX
    THEN Get File GPG Withdraw From ITMX JSON
    WHEN Check Response Code Success GPG FILE with JSON For Missing Field
    THEN Check File REQ and RES File Mule Withdraw Positive
# TC005_013
#     [Tags]    Optional
#     Given create File Name WithdrawMule
#     WHEN Prepare Data TEST And create file Json amount is query done 2
#     WHEN Encrypt File GPG To NITMX JSON ${FileName_Warrant}
#     when login to sftp server and Put file by Mule
#     WHEN Call API Sending file Mule_Withdraw from aoc to ITMX
#     THEN Get File GPG Withdraw From ITMX JSON
#     WHEN Check Response Code Success GPG FILE with JSON
#     THEN Remove file Json WithDraw SSH
#     THEN Deleted file
#     # THEN Check File REQ and RES File Mule Withdraw Positive
# TC005_016
#     [Tags]    Optional
#     Given create File Name WithdrawMule
#     WHEN Prepare Data TEST And create file Json amount is query done 2
#     WHEN Encrypt File GPG To NITMX JSON ${FileName_Warrant}
#     when login to sftp server and Put file by Mule
#     WHEN Call API Sending file Mule_Withdraw from aoc to ITMX
#     THEN Get File GPG Withdraw From ITMX JSON
#     WHEN Check Response Code Success GPG FILE with JSON
#     THEN Remove file Json WithDraw SSH
#     THEN Deleted file
    # THEN Check File REQ and RES File Mule Withdraw Positive
    
# TC005_014
#     WHEN Set Test Variable    ${FileName_Warrant}    CFR_WithdrawMule_25671209_099
#     WHEN Encrypt File GPG To NITMX JSON ${FileName_Warrant} for file name
#     when login to sftp server and Put file by Mule_for_file_name
#     WHEN Call API Sending file Mule_Withdraw from aoc to ITMX
#     THEN Get File GPG Withdraw From ITMX JSON for file name
#     WHEN Check Response Code Success GPG FILE with JSON
# TC005_015
#     WHEN Set Test Variable    ${FileName_Warrant}    CFR_WithdrawMule_25671209_099
#     WHEN Encrypt File GPG To NITMX JSON ${FileName_Warrant} for file name
#     when login to sftp server and Put file by Mule_for_file_name
#     WHEN Call API Sending file Mule_Withdraw from aoc to ITMX
#     THEN Get File GPG Withdraw From ITMX JSON for file name
#     WHEN Check Response Code Success GPG FILE with JSON

TC005_017
    [Tags]    Mandatory
    Given create File Name WithdrawMule validate filenamedatetime is 20241113
    WHEN Prepare Data TEST And create file Json
    WHEN Encrypt File GPG To NITMX JSON ${FileName_Warrant}
    when login to sftp server and Put file by Mule
    WHEN Call API Sending file Mule_Withdraw from aoc to ITMX
    THEN Get File GPG Withdraw From ITMX JSON
    WHEN Check Response Code invalid_date_no_filename_withdraw GPG FILE with JSON For Missing Field
    THEN Remove file Json WithDraw SSH
    THEN Deleted file
    # THEN Check File REQ and RES File Mule Withdraw Negative

# TC005_018
#     [Tags]    Mandatory
#     Given create File Name WithdrawMule Duplicate file 
#     WHEN Prepare Data TEST And create file Json
#     WHEN Encrypt File GPG To NITMX JSON ${FileName_Warrant}
#     when login to sftp server and Put file by Mule
#     WHEN Call API Sending file Mule_Withdraw from aoc to ITMX
#     # THEN Get File GPG Withdraw From ITMX JSON
#     WHEN Prepare Data TEST And create file Json
#     WHEN Encrypt File GPG To NITMX JSON ${FileName_Warrant}
#     when login to sftp server and Put file by Mule
#     WHEN Call API Sending file Mule_Withdraw from aoc to ITMX
#     THEN Get File GPG Withdraw From ITMX JSON For Duplicate
#     WHEN Check Response code Success GPG FILE
#     THEN Check File REQ and RES File Mule Withdraw Negative

TC005_019
    [Tags]    Mandatory
    Given create File Name WithdrawMule
    WHEN Prepare Data TEST And create file Json no body
    WHEN Encrypt File GPG To NITMX JSON ${FileName_Warrant}
    when login to sftp server and Put file by Mule
    WHEN Call API Sending file Mule_Withdraw from aoc to ITMX
    THEN Get File GPG Withdraw From ITMX JSON
    WHEN Check Response Code invalid_sys_transaction GPG FILE with JSON For Missing Field
    THEN Remove file Json WithDraw SSH
    THEN Deleted file
    # THEN Check File REQ and RES File Mule Withdraw Negative
# TC005_020
#     [Tags]    Optional
#     Given create File Name WithdrawMule
#     WHEN Prepare Data TEST And create file Json
#     WHEN Encrypt File GPG To NITMX JSON ${FileName_Warrant} and validate signature value key private-key-002t and secret_key is secret_key
#     when login to sftp server and Put file by Mule
#     WHEN Call API Sending file Mule_Withdraw from aoc to ITMX
#     THEN Get File GPG Withdraw From ITMX JSON
    # WHEN Check Response Code UNABLE_TO_DECRYPT_OR_UNIDENTITY_SENDER_OF_FILE GPG FILE with JSON For Missing Field
    # THEN Check File REQ and RES File Mule Withdraw Negative
TC005_021
    [Tags]    Optional
    Given create File Name WithdrawMule
    WHEN Prepare Data TEST And create file Json
    WHEN Encrypt File GPG To NITMX JSON ${FileName_Warrant} and validate signature value key QA_AOC and secret_key is secret_key_qa
    when login to sftp server and Put file by Mule
    WHEN Call API Sending file Mule_Withdraw from aoc to ITMX
    THEN Get File GPG Withdraw From ITMX JSON
    WHEN Check Response Code UNABLE_TO_DECRYPT_OR_UNIDENTITY_SENDER_OF_FILE GPG FILE with JSON For Missing Field
    THEN Remove file Json WithDraw SSH
    THEN Deleted file
    # THEN Check File REQ and RES File Mule Withdraw Negative
TC005_022
    [Tags]    Mandatory
    Given create File Name WithdrawMule validate filenamedatetime is 20241113
    WHEN Prepare Data TEST And create file Json
    WHEN Encrypt File GPG To NITMX JSON ${FileName_Warrant}
    when login to sftp server and Put file by Mule
    WHEN Call API Sending file Mule_Withdraw from aoc to ITMX
    THEN Get File GPG Withdraw From ITMX JSON
    WHEN Check Response Code invalid_date_no_filename_withdraw GPG FILE with JSON For Missing Field
    THEN Remove file Json WithDraw SSH
    THEN Deleted file
    # THEN Check File REQ and RES File Mule Withdraw Negative
TC005_023
    [Tags]    Optional
    Given create File Name WithdrawMule validate filenamedatetime is 25671313
    WHEN Prepare Data TEST And create file Json
    WHEN Encrypt File GPG To NITMX JSON ${FileName_Warrant}
    when login to sftp server and Put file by Mule
    WHEN Call API Sending file Mule_Withdraw from aoc to ITMX
    THEN Get File GPG Withdraw From ITMX JSON
    WHEN Check Response Code invalid_date_no_filename_withdraw GPG FILE with JSON For Missing Field
    THEN Remove file Json WithDraw SSH
    THEN Deleted file
    # THEN Check File REQ and RES File Mule Withdraw Negative
TC005_024
    [Tags]    Optional
    Given create File Name WithdrawMule validate filenamedatetime is 25671135
    WHEN Prepare Data TEST And create file Json
    WHEN Encrypt File GPG To NITMX JSON ${FileName_Warrant}
    when login to sftp server and Put file by Mule
    WHEN Call API Sending file Mule_Withdraw from aoc to ITMX
    THEN Get File GPG Withdraw From ITMX JSON
    WHEN Check Response Code invalid_date_no_filename_withdraw GPG FILE with JSON For Missing Field
    THEN Remove file Json WithDraw SSH
    THEN Deleted file
    # THEN Check File REQ and RES File Mule Withdraw Negative

TC005_025
    [Tags]    Mandatory
    Given create File Name WithdrawMule
    # WHEN Prepare Data TEST And create file Json amount is 2
    # WHEN Generate fILE JSON Loop amount is 2 file
    WHEN Prepare Data TEST For some item dupicate
    WHEN Encrypt File GPG To NITMX JSON ${FileName_Warrant}
    when login to sftp server and Put file by Mule
    WHEN Call API Sending file Mule_Withdraw from aoc to ITMX
    THEN Get File GPG Withdraw From ITMX JSON
    WHEN Check Response Code SOME_ITEM_DUPLICATE_Withdraw GPG FILE with JSON
    THEN Check File REQ and RES File Mule Withdraw Negative
