*** Settings ***
Resource  ../../resources/imports.robot

*** Test Cases ***

Clear DB
    [Tags]    noread
    [Documentation]    for deleted db alot
    ${Filename_Req_blackmule}    Set Variable    CFR_RegistryBlackMule_25680403_013_REQ
    Set Test Variable     ${Filename_Req_blackmule}
   Given Deleted DB

TC00 Set Runing Numbber
    ${run}    Set Variable    001
    Set Global Variable    ${running_number}    ${run}

TC001_001 Validate Condition - Code 0000 Success - Valid Condition - Mininum All Fields
    [Documentation]    Test Case Registry Black Mule
#    Given create File Name black mule
   Given Chose to create file name black mule step_runing_number
    Then Create black mule file csv
    Then PreparaData black mule is 10 Data And Genarate all type of black mule is all_filed
    WHEN Encrypt File GPG To NITMX TH ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Black_mule
    WHEN Call API Sending file black mule from aoc to ITMX
    Then Get File black mule GPG From ITMX
    Then Check Response Code Black Mule REQ And RES
    Then Deleted File all
    
TC001_002 Validate Condition - Code 0000 Success - Valid Condition - Maxinum All Fields
    [Documentation]    Test Case Registry Black Mule
#    Given create File Name black mule
   Given Chose to create file name black mule step_runing_number
    Then Create black mule file csv
    Then PreparaData black mule is 18 Data And Genarate all type of black mule is Maxinum
    WHEN Encrypt File GPG To NITMX TH ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Black_mule
    WHEN Call API Sending file black mule from aoc to ITMX
    Then Get File black mule GPG From ITMX
    Then Check Response Code Black Mule REQ And RES
    Then Deleted File all
    
TC001_003 Validate Condition - Code 0000 Success - Input data mandatory All Fields - Empty data Optional All Fields 
    [Documentation]    Test Case Registry Black Mule
#    Given create File Name black mule
   Given Chose to create file name black mule step_runing_number
    Then Create black mule file csv
    Then PreparaData black mule is 2 Data And Genarate all type of black mule is eng
    WHEN Encrypt File GPG To NITMX TH ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Black_mule
    WHEN Call API Sending file black mule from aoc to ITMX
    Then Get File black mule GPG From ITMX
    Then Check Response Code Black Mule REQ And RES
    Then Deleted File all

TC001_079 Validate Condition - Code 0000 Success - Multiple personal data elements are associated with a single card ID. (Personal Id เดิมมีการ Update ข้อมูลเข้ามา) - title : นาย > ผู้ต้องหา
    [Documentation]    Test Case Registry Black Mule
#    Given create File Name black mule
   Given Chose to create file name black mule step_runing_number
    Then Create black mule file csv
    Then PreparaData black mule is 1 Data And Genarate all type of black mule is all_filed
    WHEN Encrypt File GPG To NITMX TH ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Black_mule
    WHEN Call API Sending file black mule from aoc to ITMX
   Given create File Name black mule
    Then Create and update parameter is title black mule file csv
    WHEN Encrypt File GPG To NITMX TH ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Black_mule
    WHEN Call API Sending file black mule from aoc to ITMX
    Then Get File black mule GPG From ITMX
    Then Check Response Code Black Mule REQ And RES
    Then Deleted File all not deleted DB

TC001_080 Validate Condition - Code 0000 Success - Multiple personal data elements are associated with a single card ID. (Personal Id เดิมมีการ Update ข้อมูลเข้ามา) - name : ณัฏฐพล > มหาศาล
    [Documentation]    Test Case Registry Black Mule
#    Given create File Name black mule
   Given Chose to create file name black mule step_runing_number
    Then Create black mule file csv
    Then PreparaData black mule is 1 Data And Genarate all type of black mule is all_filed
    WHEN Encrypt File GPG To NITMX TH ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Black_mule
    WHEN Call API Sending file black mule from aoc to ITMX
   Given create File Name black mule
    Then Create and update parameter is name black mule file csv
    WHEN Encrypt File GPG To NITMX TH ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Black_mule
    WHEN Call API Sending file black mule from aoc to ITMX
    Then Get File black mule GPG From ITMX
    Then Check Response Code Black Mule REQ And RES
    Then Deleted File all not deleted DB

TC001_081 Validate Condition - Code 0000 Success - Multiple personal data elements are associated with a single card ID. (Personal Id เดิมมีการ Update ข้อมูลเข้ามา) - minname : อิ่ม > กลาง1
    [Documentation]    Test Case Registry Black Mule
#    Given create File Name black mule
   Given Chose to create file name black mule step_runing_number
    Then Create black mule file csv
    Then PreparaData black mule is 1 Data And Genarate all type of black mule is all_filed
    WHEN Encrypt File GPG To NITMX TH ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Black_mule
    WHEN Call API Sending file black mule from aoc to ITMX
   Given create File Name black mule
    Then Create and update parameter is minname black mule file csv
    WHEN Encrypt File GPG To NITMX TH ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Black_mule
    WHEN Call API Sending file black mule from aoc to ITMX
    Then Get File black mule GPG From ITMX
    Then Check Response Code Black Mule REQ And RES
    Then Deleted File all not deleted DB

TC001_082 Validate Condition - Code 0000 Success - Multiple personal data elements are associated with a single card ID. (Personal Id เดิมมีการ Update ข้อมูลเข้ามา) - surname : โพธิ์สำราญ > สุดยอด
    [Documentation]    Test Case Registry Black Mule
#    Given create File Name black mule
   Given Chose to create file name black mule step_runing_number
    Then Create black mule file csv
    Then PreparaData black mule is 1 Data And Genarate all type of black mule is all_filed
    WHEN Encrypt File GPG To NITMX TH ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Black_mule
    WHEN Call API Sending file black mule from aoc to ITMX
   Given create File Name black mule
    Then Create and update parameter is surname black mule file csv
    WHEN Encrypt File GPG To NITMX TH ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Black_mule
    WHEN Call API Sending file black mule from aoc to ITMX
    Then Get File black mule GPG From ITMX
    Then Check Response Code Black Mule REQ And RES
    Then Deleted File all not deleted DB

TC001_083 Validate Condition - Code 0000 Success - Multiple personal data elements are associated with a single card ID. (Personal Id เดิมมีการ Update ข้อมูลเข้ามา) - eng_name : Nantiporn > Putongha
    [Documentation]    Test Case Registry Black Mule
#    Given create File Name black mule
   Given Chose to create file name black mule step_runing_number
    Then Create black mule file csv
    Then PreparaData black mule is 1 Data And Genarate all type of black mule is all_filed
    WHEN Encrypt File GPG To NITMX TH ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Black_mule
    WHEN Call API Sending file black mule from aoc to ITMX
   Given create File Name black mule
    Then Create and update parameter is eng_name black mule file csv
    WHEN Encrypt File GPG To NITMX TH ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Black_mule
    WHEN Call API Sending file black mule from aoc to ITMX
    Then Get File black mule GPG From ITMX
    Then Check Response Code Black Mule REQ And RES
    Then Deleted File all not deleted DB

TC001_084 Validate Condition - Code 0000 Success - Multiple personal data elements are associated with a single card ID. (Personal Id เดิมมีการ Update ข้อมูลเข้ามา) - eng_midname : Donut > Name Klang
    [Documentation]    Test Case Registry Black Mule
#    Given create File Name black mule
   Given Chose to create file name black mule step_runing_number
    Then Create black mule file csv
    Then PreparaData black mule is 1 Data And Genarate all type of black mule is all_filed
    WHEN Encrypt File GPG To NITMX TH ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Black_mule
    WHEN Call API Sending file black mule from aoc to ITMX
   Given create File Name black mule
    Then Create and update parameter is eng_midname black mule file csv
    WHEN Encrypt File GPG To NITMX TH ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Black_mule
    WHEN Call API Sending file black mule from aoc to ITMX
    Then Get File black mule GPG From ITMX
    Then Check Response Code Black Mule REQ And RES
    Then Deleted File all not deleted DB

TC001_085 Validate Condition - Code 0000 Success - Multiple personal data elements are associated with a single card ID. (Personal Id เดิมมีการ Update ข้อมูลเข้ามา) - eng_surname : Sanwong > Sudyod
    [Documentation]    Test Case Registry Black Mule
#    Given create File Name black mule
   Given Chose to create file name black mule step_runing_number
    Then Create black mule file csv
    Then PreparaData black mule is 1 Data And Genarate all type of black mule is all_filed
    WHEN Encrypt File GPG To NITMX TH ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Black_mule
    WHEN Call API Sending file black mule from aoc to ITMX
   Given create File Name black mule
    Then Create and update parameter is eng_surname black mule file csv
    WHEN Encrypt File GPG To NITMX TH ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Black_mule
    WHEN Call API Sending file black mule from aoc to ITMX
    Then Get File black mule GPG From ITMX
    Then Check Response Code Black Mule REQ And RES
    Then Deleted File all not deleted DB

TC001_086 Validate Condition - Code 0000 Success - Multiple personal data elements are associated with a single card ID. (Personal Id เดิมมีการ Update ข้อมูลเข้ามา) - birth_date : 1996-02-20 > 1999-02-05
    [Documentation]    Test Case Registry Black Mule
#    Given create File Name black mule
   Given Chose to create file name black mule step_runing_number
    Then Create black mule file csv
    Then PreparaData black mule is 1 Data And Genarate all type of black mule is all_filed
    WHEN Encrypt File GPG To NITMX TH ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Black_mule
    WHEN Call API Sending file black mule from aoc to ITMX
   Given create File Name black mule
    Then Create and update parameter is birth_date black mule file csv
    WHEN Encrypt File GPG To NITMX TH ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Black_mule
    WHEN Call API Sending file black mule from aoc to ITMX
    Then Get File black mule GPG From ITMX
    Then Check Response Code Black Mule REQ And RES
    Then Deleted File all not deleted DB

TC001_087 Validate Condition - Code 0000 Success - Multiple personal data elements are associated with a single card ID. (Personal Id เดิมมีการ Update ข้อมูลเข้ามา) - nationality : TH > CG
    [Documentation]    Test Case Registry Black Mule
#    Given create File Name black mule
   Given Chose to create file name black mule step_runing_number
    Then Create black mule file csv
    Then PreparaData black mule is 1 Data And Genarate all type of black mule is all_filed
    WHEN Encrypt File GPG To NITMX TH ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Black_mule
    WHEN Call API Sending file black mule from aoc to ITMX
   Given create File Name black mule
    Then Create and update parameter is nationality black mule file csv
    WHEN Encrypt File GPG To NITMX TH ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Black_mule
    WHEN Call API Sending file black mule from aoc to ITMX
    Then Get File black mule GPG From ITMX
    Then Check Response Code Black Mule REQ And RES
    Then Deleted File all not deleted DB

TC001_098 Validate Condition - Code 0000 Success - ระบุ Field : eng_surname - entity_type = ENTITY - id_type = COMPANY ID - Code 0000 Success 
#    Given create File Name black mule
   Given Chose to create file name black mule step_runing_number
    Then Create black mule file csv
    Then PreparaData black mule is 1 Data And Genarate all type of black mule is invali_condition_entity_type_company_v4
    WHEN Encrypt File GPG To NITMX TH ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Black_mule
    WHEN Call API Sending file black mule from aoc to ITMX
    Then Get File black mule GPG From ITMX
    Then Check Response Code Black Mule REQ And RES
    Then Deleted File all

TC001_124 Validate Response Success - Code 0000 valid format - Valid Format : card_id กรณีบุคคลธรรมดา (ตัวเลข 13 digit ถูก Logic คิดเลขบัตร ) - (10) card_id = 13 digit 3105829524108
#    Given create File Name black mule
   Given Chose to create file name black mule step_runing_number
    Then Create black mule file csv
    Then PreparaData black mule is 5 Data And Genarate all type of black mule is data
    WHEN Encrypt File GPG To NITMX TH ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Black_mule
    WHEN Call API Sending file black mule from aoc to ITMX
    Then Get File black mule GPG From ITMX
    Then Check Response Code Black Mule REQ And RES
    Then Deleted File all

TC001_125 Validate Response Success - Code 0000 valid format - Valid Format : card_id กรณีนิติบุคคล(ตัวเลข 18-35 digit ) - (10) card_id = 18-35 digit ( 18 digit) .~!@#$"%^&*()_+=-\][{}:;/?.><,'"123 (35 digit)
#    Given create File Name black mule
   Given Chose to create file name black mule step_runing_number
    Then Create black mule file csv
    Then PreparaData black mule is 3 Data And Genarate all type of black mule is invali_condition_entity_type_company_character
    WHEN Encrypt File GPG To NITMX TH ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Black_mule
    WHEN Call API Sending file black mule from aoc to ITMX
    Then Get File black mule GPG From ITMX
    Then Check Response Code Black Mule REQ And RES
    Then Deleted File all
    
TC001_126 Validate Response Success - Code 0000 valid format - Valid Format : card_id กรณีชาวต่างชาติ (ตัวเลข 1-35 digit ) - (10) card_id = 1-35 digit 3 (1 digit) .~!@#$"%^&*()_+=-\][{}:;/?.><,'"๖k9 ( 35 digit)
#    Given create File Name black mule
   Given Chose to create file name black mule step_runing_number
    Then Create black mule file csv
    Then PreparaData black mule is 3 Data And Genarate all type of black mule is invali_condition_entity_type_national_character
    WHEN Encrypt File GPG To NITMX TH ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Black_mule
    WHEN Call API Sending file black mule from aoc to ITMX
    Then Get File black mule GPG From ITMX
    Then Check Response Code Black Mule REQ And RES
    Then Deleted File all
