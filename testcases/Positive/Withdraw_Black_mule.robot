*** Settings ***
Resource  ../../resources/imports.robot

*** Test Cases ***

PreparaDataAuto
    [Tags]    PreparaDataAuto
   Given Chose to create file name black mule step_runing_number
    Then Create black mule file csv
    Then PreparaData black mule is 100 Data And Genarate all type of black mule is input data note AUTO
    # Then PreparaData black mule is 1 Data And Genarate all type of black mule is input data note AUTO Company
   # -------------  note = AUTODATADATE1957  --------------------------- for aml_report_date is 1957-01-25
    # Then PreparaData black mule is 10 Data And Genarate all type of black mule is input data note AUTO and report date for 1957-01-25
   # -------------  note = AUTO35 , AUTO20 , AUTO25 --------------------------- for mule_identity_id 35 charator
    # Then PreparaData black mule is 10 Data And Genarate all type of black mule is input data personalID 35 charator
    # Then PreparaData black mule is 10 Data And Genarate all type of black mule is input data personalID 20 charator
    # Then PreparaData black mule is 10 Data And Genarate all type of black mule is input data personalID 25 charator
    # Then PreparaData black mule is 10 Data And Genarate all type of black mule is input data personalID 18 charator
    WHEN Encrypt File GPG To NITMX TH ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Black_mule
    WHEN Call API Sending file black mule from aoc to ITMX
    Then Get File black mule GPG From ITMX
    Then Check Response Code Black Mule REQ And RES
    # Then Deleted File all

CheckPerformanceTest
   Given Chose to create file name black mule run number 400 - 600
    Then PreparaData black mule is 5000 Data And Genarate all type of black mule
    WHEN Encrypt File GPG To NITMX JSON ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Withdraw_Black_mule
    WHEN Call API Sending file withdraw black mule from aoc to ITMX
    Then Get File withdraw black mule GPG From ITMX
    Then Check Response Code WIthdraw Black Mule REQ And RES is SUCCESS
    Then Deleted File all withdraw

TC001_001 Validate Condition - Code 0000 Success - Valid Condition - Mininum All Fields
   Given Chose to create file name black mule run number 400 - 600
    Then PreparaData black mule is 1 Data And Genarate all type of black mule
    WHEN Encrypt File GPG To NITMX JSON ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Withdraw_Black_mule
    WHEN Call API Sending file withdraw black mule from aoc to ITMX
    Then Get File withdraw black mule GPG From ITMX
    Then Check Response Code WIthdraw Black Mule REQ And RES is SUCCESS
    Then Deleted File all withdraw

TC001_002 Validate Format/Length - Code 0000 - Field declare_uuid - valid Format (Length 36) (Appendix 1.10)
   Given Chose to create file name black mule run number 400 - 600
    Then PreparaData black mule is 1 Data And Genarate all type of black mule and validate format or length is Length_uuid
    WHEN Encrypt File GPG To NITMX JSON ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Withdraw_Black_mule
    WHEN Call API Sending file withdraw black mule from aoc to ITMX
    Then Get File withdraw black mule GPG From ITMX
    Then Check Response Code WIthdraw Black Mule REQ And RES is SUCCESS
    Then Deleted File all withdraw

TC001_005 Validate Format/Length - Code 0000 - Field declare_type_code - 1 valid Format (Length 2)(Appendix 1.3.3) 
   Given Chose to create file name black mule run number 400 - 600
    Then PreparaData black mule is 1 Data And Genarate all type of black mule
    WHEN Encrypt File GPG To NITMX JSON ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Withdraw_Black_mule
    WHEN Call API Sending file withdraw black mule from aoc to ITMX
    Then Get File withdraw black mule GPG From ITMX
    Then Check Response Code WIthdraw Black Mule REQ And RES is SUCCESS
    Then Deleted File all withdraw

TC001_008 Validate Format/Length - Code 0000 - Field : declare_type - Valid Format (Length 50) (Appendix 1.7) ปลดม้าดำรายบุคคล
   Given Chose to create file name black mule run number 400 - 600
    Then PreparaData black mule is 1 Data And Genarate all type of black mule
    WHEN Encrypt File GPG To NITMX JSON ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Withdraw_Black_mule
    WHEN Call API Sending file withdraw black mule from aoc to ITMX
    Then Get File withdraw black mule GPG From ITMX
    Then Check Response Code WIthdraw Black Mule REQ And RES is SUCCESS
    Then Deleted File all withdraw

TC001_011 Validate Format/Length - Code 0000 - Field : withdraw_date - Valid Format (Length 10) (Appendix 1.3.12) พ.ศ.2500-ปัจจับัน 2500-11-20
   [Documentation]    aml_report_date <= current_date withdraw_date > aml_report_date และ <= current_date เคสนี้ต้อง preparaData 1957-01-25 and query ORDER BY BLACK_MULE_DATE ASC 
   Given Chose to create file name black mule run number 400 - 600
    Then PreparaData black mule is 1 Data And Genarate all type of black mule and validate format or length is Valid_withdraw_date_being and query for black mule date ASC
    WHEN Encrypt File GPG To NITMX JSON ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Withdraw_Black_mule
    WHEN Call API Sending file withdraw black mule from aoc to ITMX
    Then Get File withdraw black mule GPG From ITMX
    Then Check Response Code WIthdraw Black Mule REQ And RES is SUCCESS
    Then Deleted File all withdraw

TC001_017 Validate Format/Length - Code 0000 - Field : declare_reason_code - Valid Format (Length 2) (Appendix 1.3.3) 01 = ชดใช้ค่าเสียหายแล้ว 02 = คดีสิ้นสุด 03 = เป็นบัญชีอื่น ที่ไม่เกี่ยวข้องกับคดี 07 = ผู้เสียหายแจ้งข้อมูลผิดพลาด 08 = เจ้าหน้าที่บันทึกข้อมูลผิดพลาด 99 = อื่นๆ
   Given Chose to create file name black mule run number 400 - 600
    Then PreparaData black mule is 1 Data And Genarate all type of black mule and validate format or length is Length_declare_reason_code
    WHEN Encrypt File GPG To NITMX JSON ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Withdraw_Black_mule
    WHEN Call API Sending file withdraw black mule from aoc to ITMX
    Then Get File withdraw black mule GPG From ITMX
    Then Check Response Code WIthdraw Black Mule REQ And RES is SUCCESS
    Then Deleted File all withdraw

TC001_022 Validate Format/Length - Code 0000 - Field : declare_note -Valid Format (Length 1000) (Appendix 1.7)
   Given Chose to create file name black mule run number 400 - 600
    Then PreparaData black mule is 1 Data And Genarate all type of black mule and validate format or length is Valida_Length_declare_note
    WHEN Encrypt File GPG To NITMX JSON ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Withdraw_Black_mule
    WHEN Call API Sending file withdraw black mule from aoc to ITMX
    Then Get File withdraw black mule GPG From ITMX
    Then Check Response Code WIthdraw Black Mule REQ And RES is SUCCESS
    Then Deleted File all withdraw

TC001_025 Validate Format/Length - Code 0000 - Field : mule_ref_code - Valid Format (Length 10 digit) (Appendix 1.3.1)  
   Given Chose to create file name black mule run number 400 - 600
    Then PreparaData black mule is 1 Data And Genarate all type of black mule and validate format or length is Valid_Length_mule_ref_code
    WHEN Encrypt File GPG To NITMX JSON ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Withdraw_Black_mule
    WHEN Call API Sending file withdraw black mule from aoc to ITMX
    Then Get File withdraw black mule GPG From ITMX
    Then Check Response Code WIthdraw Black Mule REQ And RES is SUCCESS
    Then Deleted File all withdraw

TC001_028 Validate Format/Length - Code 0000 - Field : mule_identity_id - Valid Format (Length 35) (Appendix 1.7) 
   Given Chose to create file name black mule run number 400 - 600
    Then PreparaData black mule is 1 Data And Genarate all type of black mule for Identity ID is 35 ID and validate format or length is Valid_Length_mule_identity_id
    WHEN Encrypt File GPG To NITMX JSON ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Withdraw_Black_mule
    WHEN Call API Sending file withdraw black mule from aoc to ITMX
    Then Get File withdraw black mule GPG From ITMX
    Then Check Response Code WIthdraw Black Mule REQ And RES is SUCCESS
    Then Deleted File all withdraw

TC001_031 Validate Format/Length - Code 0000 - Field : mule_identity_type - Valid Format (Length 20) (Appendix 1.3.3)
   Given Chose to create file name black mule run number 400 - 600
    Then PreparaData black mule is 1 Data And Genarate all type of black mule for Identity ID is 20 ID and validate format or length is Valid_20cha_mule_identity_id
    WHEN Encrypt File GPG To NITMX JSON ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Withdraw_Black_mule
    WHEN Call API Sending file withdraw black mule from aoc to ITMX
    Then Get File withdraw black mule GPG From ITMX
    Then Check Response Code WIthdraw Black Mule REQ And RES is SUCCESS
    Then Deleted File all withdraw

TC001_034 Validate Format/Length - Code 0000 - Field : mule_title - Valid Format (Length 50) (Appendix 1.7) djaoifjafoiaหกดห่นดรหด่หวดห่ดวฟกฟดนรห่ดวฟ123455678 
   Given Chose to create file name black mule run number 400 - 600
    Then PreparaData black mule is 1 Data And Genarate all type of black mule and validate format or length is Valid_mule_title
    WHEN Encrypt File GPG To NITMX JSON ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Withdraw_Black_mule
    WHEN Call API Sending file withdraw black mule from aoc to ITMX
    Then Get File withdraw black mule GPG From ITMX
    Then Check Response Code WIthdraw Black Mule REQ And RES is SUCCESS
    Then Deleted File all withdraw

TC001_037 Validate Format/Length - Code 0000 - Field : mule_name - Valid Format (Length 256) (Appendix 1.7)
   Given Chose to create file name black mule run number 400 - 600
    Then PreparaData black mule is 1 Data And Genarate all type of black mule and validate format or length is Valid_Length_mule_name
    WHEN Encrypt File GPG To NITMX JSON ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Withdraw_Black_mule
    WHEN Call API Sending file withdraw black mule from aoc to ITMX
    Then Get File withdraw black mule GPG From ITMX
    Then Check Response Code WIthdraw Black Mule REQ And RES is SUCCESS
    Then Deleted File all withdraw

TC001_040 Validate Format/Length - Code 0000 - Field : mule_surname - Valid Format (Length 256) (Appendix 1.7)
   Given Chose to create file name black mule run number 400 - 600
    Then PreparaData black mule is 1 Data And Genarate all type of black mule and validate format or length is Valid_Length_mule_surname
    WHEN Encrypt File GPG To NITMX JSON ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Withdraw_Black_mule
    WHEN Call API Sending file withdraw black mule from aoc to ITMX
    Then Get File withdraw black mule GPG From ITMX
    Then Check Response Code WIthdraw Black Mule REQ And RES is SUCCESS
    Then Deleted File all withdraw

TC001_043 Validate Format/Length - Code 0000 - Field : mule_birth_date - Valid Format (Length 10) (Appendix 1.3.12)
   Given Chose to create file name black mule run number 400 - 600
    Then PreparaData black mule is 1 Data And Genarate all type of black mule and validate format or length is Valid_mule_birth_date
    WHEN Encrypt File GPG To NITMX JSON ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Withdraw_Black_mule
    WHEN Call API Sending file withdraw black mule from aoc to ITMX
    Then Get File withdraw black mule GPG From ITMX
    Then Check Response Code WIthdraw Black Mule REQ And RES is SUCCESS
    Then Deleted File all withdraw

TC001_049 Validate Format/Length - Code 0000 - Field : mule_nationality - Valid Format (Length 2) (Appendix 1.3.1) TH
   Given Chose to create file name black mule run number 400 - 600
    Then PreparaData black mule is 1 Data And Genarate all type of black mule and validate format or length is Valid_Length_mule_nationality
    WHEN Encrypt File GPG To NITMX JSON ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Withdraw_Black_mule
    WHEN Call API Sending file withdraw black mule from aoc to ITMX
    Then Get File withdraw black mule GPG From ITMX
    Then Check Response Code WIthdraw Black Mule REQ And RES is SUCCESS
    Then Deleted File all withdraw

TC001_052 Validate Format/Length - Code 0000 - Field :police_case_id - Valid Format (Length 30) (Appendix 1.7) djaoifjafoiaหกนรห่ดวฟ123455678
   Given Chose to create file name black mule run number 400 - 600
    Then PreparaData black mule is 1 Data And Genarate all type of black mule and validate format or length is Valid_Length_police_case_id
    WHEN Encrypt File GPG To NITMX JSON ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Withdraw_Black_mule
    WHEN Call API Sending file withdraw black mule from aoc to ITMX
    Then Get File withdraw black mule GPG From ITMX
    Then Check Response Code WIthdraw Black Mule REQ And RES is SUCCESS
    Then Deleted File all withdraw

TC001_055 Validate Format/Length - Code 0000 - Field :police_case_type - Valid Format (Length 2) (Appendix 1.3.3) 33
   Given Chose to create file name black mule run number 400 - 600
    Then PreparaData black mule is 1 Data And Genarate all type of black mule and validate format or length is Valid__Length_police_case_type
    WHEN Encrypt File GPG To NITMX JSON ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Withdraw_Black_mule
    WHEN Call API Sending file withdraw black mule from aoc to ITMX
    Then Get File withdraw black mule GPG From ITMX
    Then Check Response Code WIthdraw Black Mule REQ And RES is SUCCESS
    Then Deleted File all withdraw

TC001_058 Validate Format/Length - Code 0000 - Field :police_case_report_date - Valid Format (Length 10) (Appendix 1.3.12)ต้องเป็น พ.ศ.2500-ปัจจุบัน 2567-10-30 หรือ 2500-01-01
   Given Chose to create file name black mule run number 400 - 600
    Then PreparaData black mule is 1 Data And Genarate all type of black mule and validate format or length is Valid__Length_police_case_report_date
    WHEN Encrypt File GPG To NITMX JSON ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Withdraw_Black_mule
    WHEN Call API Sending file withdraw black mule from aoc to ITMX
    Then Get File withdraw black mule GPG From ITMX
    Then Check Response Code WIthdraw Black Mule REQ And RES is SUCCESS
    Then Deleted File all withdraw

TC001_064 Validate Format/Length - Code 0000 - Field :mule_account_no - Valid Format (Length 35) (Appendix 1.3.3) 10111033464343425232352525253535355
   Given Chose to create file name black mule run number 400 - 600
    Then PreparaData black mule is 1 Data And Genarate all type of black mule and validate format or length is Valid__Length_mule_account_no
    WHEN Encrypt File GPG To NITMX JSON ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Withdraw_Black_mule
    WHEN Call API Sending file withdraw black mule from aoc to ITMX
    Then Get File withdraw black mule GPG From ITMX
    Then Check Response Code WIthdraw Black Mule REQ And RES is SUCCESS
    Then Deleted File all withdraw

TC001_067 Validate Format/Length - Code 0000 - Field :mule_account_type - Valid Format (Length 35) (Appendix 1.3.2) TjsadjaoUMO344959505050669606060664
   Given Chose to create file name black mule run number 400 - 600
    Then PreparaData black mule is 1 Data And Genarate all type of black mule and validate format or length is Valid_Length_mule_account_type
    WHEN Encrypt File GPG To NITMX JSON ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Withdraw_Black_mule
    WHEN Call API Sending file withdraw black mule from aoc to ITMX
    Then Get File withdraw black mule GPG From ITMX
    Then Check Response Code WIthdraw Black Mule REQ And RES is SUCCESS
    Then Deleted File all withdraw

TC001_070 Validate Format/Length - Code 0000 - Field :mule_account_bankcode - Valid Format (Length 3) (Appendix 1.3.3) 004 หรือ 567
   Given Chose to create file name black mule run number 400 - 600
    Then PreparaData black mule is 1 Data And Genarate all type of black mule and validate format or length is Valid_Length_mule_account_bankcode
    WHEN Encrypt File GPG To NITMX JSON ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Withdraw_Black_mule
    WHEN Call API Sending file withdraw black mule from aoc to ITMX
    Then Get File withdraw black mule GPG From ITMX
    Then Check Response Code WIthdraw Black Mule REQ And RES is SUCCESS
    Then Deleted File all withdraw

TC001_073 Validate Format/Length - Code 0000 - Field :mule_account_bankname - Valid Format (Length 140) (Appendix 1.7) TjsadjaoUMO3449595050506696060606645seifjsoifiiaodjaidjliadakdaflsafhisfhslufshfliusfhsuาก่รดห่ดหกร้อหนอ้หออก่ดหดำ้หรีด้หรด้หาีด้หด่รหี่ดหรห
   Given Chose to create file name black mule run number 400 - 600
    Then PreparaData black mule is 1 Data And Genarate all type of black mule and validate format or length is Valid_Length_mule_account_bankname
    WHEN Encrypt File GPG To NITMX JSON ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Withdraw_Black_mule
    WHEN Call API Sending file withdraw black mule from aoc to ITMX
    Then Get File withdraw black mule GPG From ITMX
    Then Check Response Code WIthdraw Black Mule REQ And RES is SUCCESS
    Then Deleted File all withdraw

TC001_076 Validate Format/Length - Code 0000 - Field :police_rank - Valid Format (Length 50) (Appendix 1.7) TjsadjaoUMO344959505msof่ห่ดกหร่ดหหา่าห่าผหฯฟไกฟดำ    
   Given Chose to create file name black mule run number 400 - 600
    Then PreparaData black mule is 1 Data And Genarate all type of black mule and validate format or length is Valid_Length_police_rank
    WHEN Encrypt File GPG To NITMX JSON ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Withdraw_Black_mule
    WHEN Call API Sending file withdraw black mule from aoc to ITMX
    Then Get File withdraw black mule GPG From ITMX
    Then Check Response Code WIthdraw Black Mule REQ And RES is SUCCESS
    Then Deleted File all withdraw

TC001_079 Validate Format/Length - Code 0000 - Field :police_name - Valid Format (Length 100) (Appendix 1.7) kdfspofkjsoijgากยนด่หยด่หนดฟดาฟบดาฟหดฟยเวหย่ดหหรนด้หร้เหนรด้นหด้ฟนดฟ้แรผแJIIJNJDIMDKDIMKDKJFNJFJNDJ1
   Given Chose to create file name black mule run number 400 - 600
    Then PreparaData black mule is 1 Data And Genarate all type of black mule and validate format or length is Valid_Length_police_name
    WHEN Encrypt File GPG To NITMX JSON ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Withdraw_Black_mule
    WHEN Call API Sending file withdraw black mule from aoc to ITMX
    Then Get File withdraw black mule GPG From ITMX
    Then Check Response Code WIthdraw Black Mule REQ And RES is SUCCESS
    Then Deleted File all withdraw

TC001_082 Validate Format/Length - Code 0000 - Field :police_surname - Valid Format (Length 100) (Appendix 1.7) kdfspofkjsoijgากยนด่หยด่หนดฟดาฟบดาฟหดฟยเวหย่ดหหรนด้หร้เหนรด้นหด้ฟนดฟ้แรผแJIIJNJDIMDKDIMKDKJFNJFJNDJ1
   Given Chose to create file name black mule run number 400 - 600
    Then PreparaData black mule is 1 Data And Genarate all type of black mule and validate format or length is Valid_Length_police_surname
    WHEN Encrypt File GPG To NITMX JSON ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Withdraw_Black_mule
    WHEN Call API Sending file withdraw black mule from aoc to ITMX
    Then Get File withdraw black mule GPG From ITMX
    Then Check Response Code WIthdraw Black Mule REQ And RES is SUCCESS
    Then Deleted File all withdraw

TC001_085 Validate Format/Length - Code 0000 - Field :police_job_title - Valid Format (Length 100) (Appendix 1.7) kdfspofkjsoijgากยนด่หยด่หนดฟดาฟบดาฟหดฟยเวหย่ดหหรนด้หร้เหนรด้นหด้ฟนดฟ้แรผแJIIJNJDIMDKDIMKDKJFNJFJNDJ1
   Given Chose to create file name black mule run number 400 - 600
    Then PreparaData black mule is 1 Data And Genarate all type of black mule and validate format or length is Valid_Length_police_job_title
    WHEN Encrypt File GPG To NITMX JSON ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Withdraw_Black_mule
    WHEN Call API Sending file withdraw black mule from aoc to ITMX
    Then Get File withdraw black mule GPG From ITMX
    Then Check Response Code WIthdraw Black Mule REQ And RES is SUCCESS
    Then Deleted File all withdraw

TC001_088 Validate Format/Length - Code 0000 - Field :police_org - Valid Format (Length 200) (Appendix 1.7)
   Given Chose to create file name black mule run number 400 - 600
    Then PreparaData black mule is 1 Data And Genarate all type of black mule and validate format or length is Valid_Length_police_org
    WHEN Encrypt File GPG To NITMX JSON ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Withdraw_Black_mule
    WHEN Call API Sending file withdraw black mule from aoc to ITMX
    Then Get File withdraw black mule GPG From ITMX
    Then Check Response Code WIthdraw Black Mule REQ And RES is SUCCESS
    Then Deleted File all withdraw

TC001_091 Validate Format/Length - Code 0000 - Field :police_tel - Valid Format (Length 20) (Appendix 1.7) 0888888888,099999999
   Given Chose to create file name black mule run number 400 - 600
    Then PreparaData black mule is 1 Data And Genarate all type of black mule and validate format or length is Valid_Length_police_tel
    WHEN Encrypt File GPG To NITMX JSON ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Withdraw_Black_mule
    WHEN Call API Sending file withdraw black mule from aoc to ITMX
    Then Get File withdraw black mule GPG From ITMX
    Then Check Response Code WIthdraw Black Mule REQ And RES is SUCCESS
    Then Deleted File all withdraw

TC001_094 Validate Format/Length - Code 0000 - Field :police_email - Valid Format (Length 50) (Appendix 1.5) umaporn.artjdo_ifjso-Tdjsofijs932sdjsda@sfrd.co.th
   Given Chose to create file name black mule run number 400 - 600
    Then PreparaData black mule is 1 Data And Genarate all type of black mule and validate format or length is Valid_Length_police_email
    WHEN Encrypt File GPG To NITMX JSON ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Withdraw_Black_mule
    WHEN Call API Sending file withdraw black mule from aoc to ITMX
    Then Get File withdraw black mule GPG From ITMX
    Then Check Response Code WIthdraw Black Mule REQ And RES is SUCCESS
    Then Deleted File all withdraw

TC003_011 Validate Missing Parameter field - Code 7105 - Missing Parameter Field : mule_title
   Given Chose to create file name black mule run number 400 - 600
    Then PreparaData black mule is 1 Data And Genarate all type of black mule and missing parameter field is Valid_Missing_Parameter_field_mule_title
    WHEN Encrypt File GPG To NITMX JSON ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Withdraw_Black_mule
    WHEN Call API Sending file withdraw black mule from aoc to ITMX
    Then Get File withdraw black mule GPG From ITMX
    Then Check Response Code WIthdraw Black Mule REQ And RES is SUCCESS
    Then Deleted File all withdraw

TC003_014 Validate Missing Parameter field - Code 7105 - Missing Parameter Field : mule_birth_date
   Given Chose to create file name black mule run number 400 - 600
    Then PreparaData black mule is 1 Data And Genarate all type of black mule and missing parameter field is Valid_Missing_Parameter_field_mule_birth_date
    WHEN Encrypt File GPG To NITMX JSON ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Withdraw_Black_mule
    WHEN Call API Sending file withdraw black mule from aoc to ITMX
    Then Get File withdraw black mule GPG From ITMX
    Then Check Response Code WIthdraw Black Mule REQ And RES is SUCCESS
    Then Deleted File all withdraw

TC003_030 Validate Condition Optional field - Code 0000 - mule_title = null - mule_birth_date = null
   Given Chose to create file name black mule run number 400 - 600
    Then PreparaData black mule is 1 Data And Genarate all type of black mule and missing parameter field is Valid_Parameter_field_mule_tilte_and_birthdate_null
    WHEN Encrypt File GPG To NITMX JSON ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Withdraw_Black_mule
    WHEN Call API Sending file withdraw black mule from aoc to ITMX
    Then Get File withdraw black mule GPG From ITMX
    Then Check Response Code WIthdraw Black Mule REQ And RES is SUCCESS
    Then Deleted File all withdraw

TC004_001 Validate Condition field - Code 0000 - field : declare_type_code - field declare_type : ปลดม้าดำรายบุคคล - Valid Condition : declare_type_code must be “1” (base on current version) 
   Given Chose to create file name black mule run number 400 - 600
    Then PreparaData black mule is 1 Data And Genarate all type of black mule and validate format or length is Valid_field_de_type_code_must_be_1
    WHEN Encrypt File GPG To NITMX JSON ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Withdraw_Black_mule
    WHEN Call API Sending file withdraw black mule from aoc to ITMX
    Then Get File withdraw black mule GPG From ITMX
    Then Check Response Code WIthdraw Black Mule REQ And RES is SUCCESS
    Then Deleted File all withdraw

TC004_003 Validate Condition field - Code 0000 - field : mule_Identity_id - Valid Condition : mule_Identity_id does match in the CFR mule list - เป็น ม้าดำ 
   Given Chose to create file name black mule run number 400 - 600
    Then PreparaData black mule is 1 Data And Genarate all type of black mule
    WHEN Encrypt File GPG To NITMX JSON ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Withdraw_Black_mule
    WHEN Call API Sending file withdraw black mule from aoc to ITMX
    Then Get File withdraw black mule GPG From ITMX
    Then Check Response Code WIthdraw Black Mule REQ And RES is SUCCESS
    Then Deleted File all withdraw

TC004_010 Validate Condition fiel - Code 0000 - field : mule_identity_id , mule_ref_code - Valid Condition
   Given Chose to create file name black mule run number 400 - 600
    Then PreparaData black mule is 1 Data And Genarate all type of black mule
    WHEN Encrypt File GPG To NITMX JSON ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Withdraw_Black_mule
    WHEN Call API Sending file withdraw black mule from aoc to ITMX
    Then Get File withdraw black mule GPG From ITMX
    Then Check Response Code WIthdraw Black Mule REQ And RES is SUCCESS
    Then Deleted File all withdraw

TC004_012 Validate Condition field - Code 0000 - field : mule_ref_code, declare_type - Valid Condition :mule_ref_code, declare_type are duplicate within the same file
   Given Chose to create file name black mule run number 400 - 600
    Then PreparaData black mule is 2 Data And Genarate all type of black mule
    WHEN Encrypt File GPG To NITMX JSON ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Withdraw_Black_mule
    WHEN Call API Sending file withdraw black mule from aoc to ITMX
    Then Get File withdraw black mule GPG From ITMX
    Then Check Response Code WIthdraw Black Mule REQ And RES is SUCCESS
    Then Deleted File all withdraw

TC004_014 Validate Condition field - Code 0000 - field : mule_identity_id, mule_identity_type - valid Condition mule_identity_id : (13digits) mule_identity_type : 1 If mule_identity_type 1 = บุคคลธรรมดา คนไทย, บุคคลธรรมดา 
   Given Chose to create file name black mule run number 400 - 600
    Then PreparaData black mule is 1 Data And Genarate all type of black mule
    WHEN Encrypt File GPG To NITMX JSON ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Withdraw_Black_mule
    WHEN Call API Sending file withdraw black mule from aoc to ITMX
    Then Get File withdraw black mule GPG From ITMX
    Then Check Response Code WIthdraw Black Mule REQ And RES is SUCCESS
    Then Deleted File all withdraw

TC004_015 Validate Condition field - Code 0000 - field : mule_identity_id, mule_identity_type - valid Condition mule_identity_id : (25digits) mule_identity_type : 2 = นิติบุคคล 
   Given Chose to create file name black mule run number 400 - 600
    Then PreparaData black mule is 1 Data And Genarate all type of black mule for Identity ID is 25 ID and validate format or length is Valid_mule_identity_type_must_2
    WHEN Encrypt File GPG To NITMX JSON ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Withdraw_Black_mule
    WHEN Call API Sending file withdraw black mule from aoc to ITMX
    Then Get File withdraw black mule GPG From ITMX
    Then Check Response Code WIthdraw Black Mule REQ And RES is SUCCESS
    Then Deleted File all withdraw

TC004_016 Validate Condition field - Code 0000 - field : mule_identity_id, mule_identity_type - valid Condition mule_identity_id : (35digits) mule_identity_type : 3 = บุคคลธรรมดา ต่างชาติ
   Given Chose to create file name black mule run number 400 - 600
    Then PreparaData black mule is 1 Data And Genarate all type of black mule for Identity ID is 35 ID and validate format or length is Valid_mule_identity_type_must_3
    WHEN Encrypt File GPG To NITMX JSON ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Withdraw_Black_mule
    WHEN Call API Sending file withdraw black mule from aoc to ITMX
    Then Get File withdraw black mule GPG From ITMX
    Then Check Response Code WIthdraw Black Mule REQ And RES is SUCCESS
    Then Deleted File all withdraw

TC004_017 Validate Condition field - Code 0000 - field : mule_identity_id, mule_identity_type - valid Condition mule_identity_id : (18digits) mule_identity_type : 1
   Given Chose to create file name black mule run number 400 - 600
    Then PreparaData black mule is 1 Data And Genarate all type of black mule for Identity ID is 18 ID and validate format or length is Valid_mule_identity_type_must_1
    WHEN Encrypt File GPG To NITMX JSON ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Withdraw_Black_mule
    WHEN Call API Sending file withdraw black mule from aoc to ITMX
    Then Get File withdraw black mule GPG From ITMX
    Then Check Response Code WIthdraw Black Mule REQ And RES is SUCCESS
    Then Deleted File all withdraw

TC004_021 Validate Condition field - Code 0000 - field : mule_ref_code,mule_identity_id - Valid Condition : mule_ref_code,mule_identity_id must be match 
   Given Chose to create file name black mule run number 400 - 600
    Then PreparaData black mule is 1 Data And Genarate all type of black mule
    WHEN Encrypt File GPG To NITMX JSON ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Withdraw_Black_mule
    WHEN Call API Sending file withdraw black mule from aoc to ITMX
    Then Get File withdraw black mule GPG From ITMX
    Then Check Response Code WIthdraw Black Mule REQ And RES is SUCCESS
    Then Deleted File all withdraw

TC004_023 Validate Condition field - Code 0000 - field : mule_ref_code,mule_identity_id - Valid Condition : declare_reason_code,declare_reason must be match 
   Given Chose to create file name black mule run number 400 - 600
    Then PreparaData black mule is 1 Data And Genarate all type of black mule
    WHEN Encrypt File GPG To NITMX JSON ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Withdraw_Black_mule
    WHEN Call API Sending file withdraw black mule from aoc to ITMX
    Then Get File withdraw black mule GPG From ITMX
    Then Check Response Code WIthdraw Black Mule REQ And RES is SUCCESS
    Then Deleted File all withdraw

TC004_025 Validate Condition field - Code 0000 - field : mule_ref_code,mule_identity_id - Valid Condition : withdraw_date is less than or equal to the current date. (พ.ศ.2500-ปัจจุบัน) 
   Given Chose to create file name black mule run number 400 - 600
    Then PreparaData black mule is 1 Data And Genarate all type of black mule
    WHEN Encrypt File GPG To NITMX JSON ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Withdraw_Black_mule
    WHEN Call API Sending file withdraw black mule from aoc to ITMX
    Then Get File withdraw black mule GPG From ITMX
    Then Check Response Code WIthdraw Black Mule REQ And RES is SUCCESS
    Then Deleted File all withdraw

TC004_027 Validate Condition field - Code 0000 - field : police_case_report_date - Valid Condition : Between B.E. 2500 - current date
   Given Chose to create file name black mule run number 400 - 600
    Then PreparaData black mule is 1 Data And Genarate all type of black mule
    WHEN Encrypt File GPG To NITMX JSON ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Withdraw_Black_mule
    WHEN Call API Sending file withdraw black mule from aoc to ITMX
    Then Get File withdraw black mule GPG From ITMX
    Then Check Response Code WIthdraw Black Mule REQ And RES is SUCCESS
    Then Deleted File all withdraw

TC004_029 Validate Condition field - Code 0000 - field : Police_Case_ID - Valid Condition : Police_Case_ID must be preceded by L , W, T , C L256710300002
    [Documentation]    X000000000  
...    โดย X คือ 
...    L - Online ผู้แจ้งลงข้อมูลเองใน Thai police online   
...    W - Walk in พนักงานสอบสวน แอดมินลงข้อมูล  
...    T - Tel จาก 1441 
...    C - ผู้เสียหายไปพบพนักงานสอบสวน แต่พนักงานสอบสวนไม่ลงข้อมูลให้ แต่เป็นผู้แจ้งลงข้อมูลเอง 
   Given Chose to create file name black mule run number 400 - 600
    Then PreparaData black mule is 4 Data And Genarate all type of black mule and fix field is Valid_po_case_id_preceded_LWTC
    WHEN Encrypt File GPG To NITMX JSON ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Withdraw_Black_mule
    WHEN Call API Sending file withdraw black mule from aoc to ITMX
    Then Get File withdraw black mule GPG From ITMX
    Then Check Response Code WIthdraw Black Mule REQ And RES is SUCCESS
    Then Deleted File all withdraw

TC004_030 Validate Condition field - Code 0000 - field : Police_Case_ID - Invalid Condition : Police_Case_ID does not be preceded by L , W, T , C - R256710300002
    [Documentation]    X000000000  
...    อ้างอิงจากปลดม้าเทา 
...    เนื่องด้วย Business Logic ที่เชื่อถือข้อมูลที่มาจากตำรวจ (AOC/CCIB) เสมอ ไม่มีการ Validate Format ของ Police Case Id ขอเพียงว่าค่าที่กรอกมาตรงกับ Character Support เท่านั้นครับ
...    **    Confirm จากพี่โต๋ Solar ครับ 
...    ไม่ต้อง validate ครับ เป็น free text ได้เลย เพราะเป็น data ตำรวจที่ต้องเชื่อเสมอ และไม่ได้เอาไป check existing ข้างในระบบ CFR
...    **
   Given Chose to create file name black mule run number 400 - 600
    Then PreparaData black mule is 1 Data And Genarate all type of black mule and fix field is Invalid_po_case_id_preceded_LWTC_not_match
    WHEN Encrypt File GPG To NITMX JSON ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Withdraw_Black_mule
    WHEN Call API Sending file withdraw black mule from aoc to ITMX
    Then Get File withdraw black mule GPG From ITMX
    Then Check Response Code WIthdraw Black Mule REQ And RES is SUCCESS
    Then Deleted File all withdraw

TC004_031 Validate Condition field - Code 0000 - field : mule_nationality - Valid Condition : ระบุตัวย่อประเทศที่มีอยู่จริง
   Given Chose to create file name black mule run number 400 - 600
    Then PreparaData black mule is 1 Data And Genarate all type of black mule for Identity ID is 35 ID and validate format or length is Valid_mule_nationality
    WHEN Encrypt File GPG To NITMX JSON ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Withdraw_Black_mule
    WHEN Call API Sending file withdraw black mule from aoc to ITMX
    Then Get File withdraw black mule GPG From ITMX
    Then Check Response Code WIthdraw Black Mule REQ And RES is SUCCESS
    Then Deleted File all withdraw

TC004_033 Validate Condition field - Code 0000 - field : mule_birth_date - Valid Condition : Does not later than the current date (B.E.) 2000-05-06
   Given Chose to create file name black mule run number 400 - 600
    Then PreparaData black mule is 1 Data And Genarate all type of black mule for Identity ID is 35 ID and validate format or length is Valid_mule_nationality
    WHEN Encrypt File GPG To NITMX JSON ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Withdraw_Black_mule
    WHEN Call API Sending file withdraw black mule from aoc to ITMX
    Then Get File withdraw black mule GPG From ITMX
    Then Check Response Code WIthdraw Black Mule REQ And RES is SUCCESS
    Then Deleted File all withdraw

TC004_035 Validate Condition field - Code 7107 - field : withdraw_date - Valid Condition : วันปลดมำทำ (withdraw_date ) ต้องมากกว่าวันประกาศม้าดำ (aml_report_date)
   [Documentation]  example :  withdraw_date  : 2500-01-26  >  aml_report_date : 2500-01-25 
   Given Chose to create file name black mule run number 400 - 600
    Then PreparaData black mule is 1 Data And Genarate all type of black mule and validate format or length is Valid_withdraw_date_being and query for black mule date ASC
    WHEN Encrypt File GPG To NITMX JSON ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Withdraw_Black_mule
    WHEN Call API Sending file withdraw black mule from aoc to ITMX
    Then Get File withdraw black mule GPG From ITMX
    Then Check Response Code WIthdraw Black Mule REQ And RES is SUCCESS
    Then Deleted File all withdraw

TC005_001 Validate File Format /File name - Withdraw Black Mule Request file - Valid File Format /File name
   Given Chose to create file name black mule run number 400 - 600
    Then PreparaData black mule is 1 Data And Genarate all type of black mule
    WHEN Encrypt File GPG To NITMX JSON ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Withdraw_Black_mule
    WHEN Call API Sending file withdraw black mule from aoc to ITMX
    Then Get File withdraw black mule GPG From ITMX
    Then Check Response Code WIthdraw Black Mule REQ And RES is SUCCESS
    Then Deleted File all withdraw

TC005_002 Validate File Format /File name - Withdraw Black Mule Request file - Validate Format file name Response file - Validate Format Response file
   Given Chose to create file name black mule run number 400 - 600
    Then PreparaData black mule is 1 Data And Genarate all type of black mule
    WHEN Encrypt File GPG To NITMX JSON ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Withdraw_Black_mule
    WHEN Call API Sending file withdraw black mule from aoc to ITMX
    Then Get File withdraw black mule GPG From ITMX
    Then Check Response Code WIthdraw Black Mule REQ And RES is SUCCESS
    Then Deleted File all withdraw

TC005_005 Validate File Format /File name - Withdraw Black Mule Request file - valid Format file name : file name extension uppercase (่json file)
   Given Chose to create file name black mule run number 400 - 600
    Then PreparaData black mule is 1 Data And Genarate all type of black mule
    Remove File    ${CURDIR}../../../keywords/Data/${directory}.json
    Create File    ${CURDIR}../../../keywords/Data/${directory}.JSON    ${cleaned_data}
    WHEN Encrypt File GPG To NITMX TH ${Filename_Req_blackmule} in file is JSON
    WHEN login to sftp server and Put file by Withdraw_Black_mule
    WHEN Call API Sending file withdraw black mule from aoc to ITMX
    Then Get File withdraw black mule GPG From ITMX
    Then Check Response Code WIthdraw Black Mule REQ And RES is SUCCESS
    Then Deleted File all withdraw

TC005_013 Validate File Format /File name - Withdraw Black Mule Request file - Number of records limits (่json file) - ข้อมูล Transaction <= 5000 (declare_uuid)
   Given Chose to create file name black mule run number 400 - 600
    Then PreparaData black mule is 100 Data And Genarate all type of black mule
    WHEN Encrypt File GPG To NITMX JSON ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Withdraw_Black_mule
    WHEN Call API Sending file withdraw black mule from aoc to ITMX
    Then Get File withdraw black mule GPG From ITMX
    Then Check Response Code WIthdraw Black Mule REQ And RES is SUCCESS
    Then Deleted File all withdraw

TC005_016 Validate File Format File name - Withdraw Black Mule Request file - Invalid Format file name : - Maximum file size (MB) (.gpg) - xx.gpg file <= 10 MB - Error Code: "0000" - Message: "SUCCESS" 9.99MB
   Given Chose to create file name black mule run number 400 - 600
    Then PreparaData black mule is 100 Data And Genarate all type of black mule
    WHEN Encrypt File GPG To NITMX JSON ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Withdraw_Black_mule
    WHEN Call API Sending file withdraw black mule from aoc to ITMX
    Then Get File withdraw black mule GPG From ITMX
    Then Check Response Code WIthdraw Black Mule REQ And RES is SUCCESS
    Then Deleted File all withdraw