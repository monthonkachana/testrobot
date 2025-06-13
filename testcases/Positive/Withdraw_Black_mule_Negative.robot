*** Settings ***
Resource  ../../resources/imports.robot

*** Test Cases ***


TC001_003 Validate Format/Length - Code 7106 - Field : declare_uuid - Invalid Format (Length 36)(Appendix 1.10) 38fde238-๓฿๒@-47e2-bd3a-80b27781641f
   Given Chose to create file name black mule run number 400 - 600
    Then PreparaData black mule is 1 Data And Genarate all type of black mule and validate format or length is Invalid_uuid
    WHEN Encrypt File GPG To NITMX JSON ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Withdraw_Black_mule
    WHEN Call API Sending file withdraw black mule from aoc to ITMX
    Then Get File withdraw black mule GPG From ITMX
    Then Check Response Code WIthdraw Black Mule REQ And RES is Invalid_format_declare_uuid
    Then Deleted File all withdraw

TC001_004 Validate Format/Length - Code 7106 - Field : declare_uuid - Invalid (Length 37)
   Given Chose to create file name black mule run number 400 - 600
    Then PreparaData black mule is 1 Data And Genarate all type of black mule and validate format or length is Invalid_Length_uuid
    WHEN Encrypt File GPG To NITMX JSON ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Withdraw_Black_mule
    WHEN Call API Sending file withdraw black mule from aoc to ITMX
    Then Get File withdraw black mule GPG From ITMX
    Then Check Response Code WIthdraw Black Mule REQ And RES is Invalid_format_declare_uuid
    Then Deleted File all withdraw

TC001_006 Validate Format/Length - Code 7106 - Field : declare_type_code - Invalid Format (Appendix 1.3.3) A
   Given Chose to create file name black mule run number 400 - 600
    Then PreparaData black mule is 1 Data And Genarate all type of black mule and validate format or length is Invalid_declare_type_code
    WHEN Encrypt File GPG To NITMX JSON ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Withdraw_Black_mule
    WHEN Call API Sending file withdraw black mule from aoc to ITMX
    Then Get File withdraw black mule GPG From ITMX
    Then Check Response Code WIthdraw Black Mule REQ And RES is Invalid_format_declare_type_code
    Then Deleted File all withdraw

TC001_007 Validate Format/Length - Code 7106 - Field : declare_type_code - Invalid Length 3 digits (Appendix 1.3.3) 222
   Given Chose to create file name black mule run number 400 - 600
    Then PreparaData black mule is 1 Data And Genarate all type of black mule and validate format or length is Invalid_Length_declare_type_code
    WHEN Encrypt File GPG To NITMX JSON ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Withdraw_Black_mule
    WHEN Call API Sending file withdraw black mule from aoc to ITMX
    Then Get File withdraw black mule GPG From ITMX
    Then Check Response Code WIthdraw Black Mule REQ And RES is Invalid_format_declare_type_code
    Then Deleted File all withdraw

TC001_009 Validate Format/Length - Code 7106 - Field : declare_type - Invalid Format (Appendix 1.7) ||
   Given Chose to create file name black mule run number 400 - 600
    Then PreparaData black mule is 1 Data And Genarate all type of black mule and validate format or length is Invalid_declare_type
    WHEN Encrypt File GPG To NITMX JSON ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Withdraw_Black_mule
    WHEN Call API Sending file withdraw black mule from aoc to ITMX
    Then Get File withdraw black mule GPG From ITMX
    Then Check Response Code WIthdraw Black Mule REQ And RES is Invalid_format_declare_type
    Then Deleted File all withdraw

TC001_010 Validate Format/Length - Code 7106 - Field : declare_type - Invalid Format (Appendix 1.7) เทสปลดม้าเทาเข้มรายบุคคลเทสปลดม้าเทาเข้มราเทสปลดไๆๆ
   Given Chose to create file name black mule run number 400 - 600
    Then PreparaData black mule is 1 Data And Genarate all type of black mule and validate format or length is Invalid_Length_declare_type
    WHEN Encrypt File GPG To NITMX JSON ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Withdraw_Black_mule
    WHEN Call API Sending file withdraw black mule from aoc to ITMX
    Then Get File withdraw black mule GPG From ITMX
    Then Check Response Code WIthdraw Black Mule REQ And RES is Invalid_format_declare_type
    Then Deleted File all withdraw

TC001_012 Validate Format/Length - Code 7106 - Field : withdraw_date - Invalid Format (Appendix 1.3.12) 25671120
   Given Chose to create file name black mule run number 400 - 600
    Then PreparaData black mule is 1 Data And Genarate all type of black mule and validate format or length is Invalid_withdraw_date
    WHEN Encrypt File GPG To NITMX JSON ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Withdraw_Black_mule
    WHEN Call API Sending file withdraw black mule from aoc to ITMX
    Then Get File withdraw black mule GPG From ITMX
    Then Check Response Code WIthdraw Black Mule REQ And RES is Invalid_format_withdraw_date
    Then Deleted File all withdraw

TC001_013 Validate Format/Length - Code 7106 - Field : withdraw_date - Invalid Format (Appendix 1.3.12) Test-กข-๒%
   Given Chose to create file name black mule run number 400 - 600
    Then PreparaData black mule is 1 Data And Genarate all type of black mule and validate format or length is Invalid_Appendix_withdraw_date
    WHEN Encrypt File GPG To NITMX JSON ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Withdraw_Black_mule
    WHEN Call API Sending file withdraw black mule from aoc to ITMX
    Then Get File withdraw black mule GPG From ITMX
    Then Check Response Code WIthdraw Black Mule REQ And RES is Invalid_format_withdraw_date
    Then Deleted File all withdraw

TC001_014 Validate Format/Length - Code 7106 - Field : withdraw_date - Invalid Format Date (Appendix 1.3.12) 2567-11-32
   Given Chose to create file name black mule run number 400 - 600
    Then PreparaData black mule is 1 Data And Genarate all type of black mule and validate format or length is Invalid_Date_withdraw_date
    WHEN Encrypt File GPG To NITMX JSON ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Withdraw_Black_mule
    WHEN Call API Sending file withdraw black mule from aoc to ITMX
    Then Get File withdraw black mule GPG From ITMX
    Then Check Response Code WIthdraw Black Mule REQ And RES is Invalid_format_withdraw_date
    Then Deleted File all withdraw

TC001_015 Validate Format/Length - Code 7106 - Field : withdraw_date - Invalid Format Month (Appendix 1.3.12) 2567-13-31
   Given Chose to create file name black mule run number 400 - 600
    Then PreparaData black mule is 1 Data And Genarate all type of black mule and validate format or length is Invalid_Month_withdraw_date
    WHEN Encrypt File GPG To NITMX JSON ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Withdraw_Black_mule
    WHEN Call API Sending file withdraw black mule from aoc to ITMX
    Then Get File withdraw black mule GPG From ITMX
    Then Check Response Code WIthdraw Black Mule REQ And RES is Invalid_format_withdraw_date
    Then Deleted File all withdraw

TC001_016 Validate Format/Length - Code 7106 - Field : withdraw_date - Invalid Length 11 digit (Appendix 1.3.12) 2567-11-200
   Given Chose to create file name black mule run number 400 - 600
    Then PreparaData black mule is 1 Data And Genarate all type of black mule and validate format or length is Invalid_Length_withdraw_date
    WHEN Encrypt File GPG To NITMX JSON ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Withdraw_Black_mule
    WHEN Call API Sending file withdraw black mule from aoc to ITMX
    Then Get File withdraw black mule GPG From ITMX
    Then Check Response Code WIthdraw Black Mule REQ And RES is Invalid_format_withdraw_date
    Then Deleted File all withdraw

TC001_018 Validate Format/Length - Code 7106 - Field : declare_reason_code - Invalid Format (Length 2)(Appendix 1.3.3) ทส
   Given Chose to create file name black mule run number 400 - 600
    Then PreparaData black mule is 1 Data And Genarate all type of black mule and validate format or length is Invalid_declare_reason_code
    WHEN Encrypt File GPG To NITMX JSON ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Withdraw_Black_mule
    WHEN Call API Sending file withdraw black mule from aoc to ITMX
    Then Get File withdraw black mule GPG From ITMX
    Then Check Response Code WIthdraw Black Mule REQ And RES is Invalid_format_declare_reason_code
    Then Deleted File all withdraw

TC001_019 Validate Format/Length - Code 7106 - Field : declare_reason_code - Invalid Length 3 digits (Appendix 1.3.3) 002
   Given Chose to create file name black mule run number 400 - 600
    Then PreparaData black mule is 1 Data And Genarate all type of black mule and validate format or length is Invalid_Length_declare_reason_code
    WHEN Encrypt File GPG To NITMX JSON ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Withdraw_Black_mule
    WHEN Call API Sending file withdraw black mule from aoc to ITMX
    Then Get File withdraw black mule GPG From ITMX
    Then Check Response Code WIthdraw Black Mule REQ And RES is Invalid_format_declare_reason_code
    Then Deleted File all withdraw

TC001_020 Validate Format/Length - Code 7106 - Field : declare_reason - Invalid Format (Appendix 1.7) |||
   Given Chose to create file name black mule run number 400 - 600
    Then PreparaData black mule is 1 Data And Genarate all type of black mule and validate format or length is Invalid_declare_reason
    WHEN Encrypt File GPG To NITMX JSON ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Withdraw_Black_mule
    WHEN Call API Sending file withdraw black mule from aoc to ITMX
    Then Get File withdraw black mule GPG From ITMX
    Then Check Response Code WIthdraw Black Mule REQ And RES is Invalid_format_declare_reason
    Then Deleted File all withdraw

TC001_021 Validate Format/Length - Code 7106 - Field : declare_reason - Invalid Length 257 ตัวอักษร (Appendix 1.7)
   Given Chose to create file name black mule run number 400 - 600
    Then PreparaData black mule is 1 Data And Genarate all type of black mule and validate format or length is Invalid_Length_declare_reason
    WHEN Encrypt File GPG To NITMX JSON ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Withdraw_Black_mule
    WHEN Call API Sending file withdraw black mule from aoc to ITMX
    Then Get File withdraw black mule GPG From ITMX
    Then Check Response Code WIthdraw Black Mule REQ And RES is Invalid_format_declare_reason
    Then Deleted File all withdraw

TC001_023 Validate Format/Length - Code 7106 - Field : declare_note - Invalid Format (Appendix 1.7) ||||
   Given Chose to create file name black mule run number 400 - 600
    Then PreparaData black mule is 1 Data And Genarate all type of black mule and validate format or length is Invalid_declare_note
    WHEN Encrypt File GPG To NITMX JSON ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Withdraw_Black_mule
    WHEN Call API Sending file withdraw black mule from aoc to ITMX
    Then Get File withdraw black mule GPG From ITMX
    Then Check Response Code WIthdraw Black Mule REQ And RES is Invalid_format_declare_note
    Then Deleted File all withdraw

TC001_024 Validate Format/Length - Code 7106 - Field : declare_note - Inalid Length 1001 ตัวอักษร (Appendix 1.7)
   Given Chose to create file name black mule run number 400 - 600
    Then PreparaData black mule is 1 Data And Genarate all type of black mule and validate format or length is Invalida_declare_note
    WHEN Encrypt File GPG To NITMX JSON ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Withdraw_Black_mule
    WHEN Call API Sending file withdraw black mule from aoc to ITMX
    Then Get File withdraw black mule GPG From ITMX
    Then Check Response Code WIthdraw Black Mule REQ And RES is Invalid_format_declare_note
    Then Deleted File all withdraw

TC001_026 Validate Format/Length - Code 7106 - Field : mule_ref_code - Invlid Format (Length 10 digit) (Appendix 1.3.1) eriทดสอบ!@
   Given Chose to create file name black mule run number 400 - 600
    Then PreparaData black mule is 1 Data And Genarate all type of black mule and validate format or length is Invalida_mule_ref_code
    WHEN Encrypt File GPG To NITMX JSON ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Withdraw_Black_mule
    WHEN Call API Sending file withdraw black mule from aoc to ITMX
    Then Get File withdraw black mule GPG From ITMX
    Then Check Response Code WIthdraw Black Mule REQ And RES is Invalid_format_mule_ref_code
    Then Deleted File all withdraw

TC001_027 Validate Format/Length - Code 7106 - Field : mule_ref_code - Invalid Length (Length 11 digit) (Appendix 1.3.1) VW399128578
   Given Chose to create file name black mule run number 400 - 600
    Then PreparaData black mule is 1 Data And Genarate all type of black mule and validate format or length is Invalida_Length_mule_ref_code
    WHEN Encrypt File GPG To NITMX JSON ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Withdraw_Black_mule
    WHEN Call API Sending file withdraw black mule from aoc to ITMX
    Then Get File withdraw black mule GPG From ITMX
    Then Check Response Code WIthdraw Black Mule REQ And RES is Invalid_format_mule_ref_code
    Then Deleted File all withdraw

TC001_029 Validate Format/Length - Code 7106 - Field : mule_identity_id - Inalid Format (Length 35) (Appendix 1.7) ||| 
   Given Chose to create file name black mule run number 400 - 600
    Then PreparaData black mule is 1 Data And Genarate all type of black mule and validate format or length is Invalid_mule_identity_id
    WHEN Encrypt File GPG To NITMX JSON ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Withdraw_Black_mule
    WHEN Call API Sending file withdraw black mule from aoc to ITMX
    Then Get File withdraw black mule GPG From ITMX
    Then Check Response Code WIthdraw Black Mule REQ And RES is Invalid_format_mule_identity_id
    Then Deleted File all withdraw

TC001_030 Validate Format/Length - Code 7106 - Field : mule_identity_id - Invalid Format (Length 36) (Appendix 1.7)
   Given Chose to create file name black mule run number 400 - 600
    Then PreparaData black mule is 1 Data And Genarate all type of black mule and validate format or length is Invalid_Length_mule_identity_id
    WHEN Encrypt File GPG To NITMX JSON ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Withdraw_Black_mule
    WHEN Call API Sending file withdraw black mule from aoc to ITMX
    Then Get File withdraw black mule GPG From ITMX
    Then Check Response Code WIthdraw Black Mule REQ And RES is Invalid_format_mule_identity_id
    Then Deleted File all withdraw

TC001_032 Validate Format/Length - Code 7106 - Field : mule_identity_type - Invalid Format(Appendix 1.3.3) T
   Given Chose to create file name black mule run number 400 - 600
    Then PreparaData black mule is 1 Data And Genarate all type of black mule and validate format or length is Invalid_mule_identity_type
    WHEN Encrypt File GPG To NITMX JSON ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Withdraw_Black_mule
    WHEN Call API Sending file withdraw black mule from aoc to ITMX
    Then Get File withdraw black mule GPG From ITMX
    Then Check Response Code WIthdraw Black Mule REQ And RES is Invalid_format_mule_identity_type
    Then Deleted File all withdraw

TC001_033 Validate Format/Length - Code 7106 - Field : mule_identity_type - Invalid Length (Length 21) (Appendix 1.3.3) 111111111111111111111
   Given Chose to create file name black mule run number 400 - 600
    Then PreparaData black mule is 1 Data And Genarate all type of black mule and validate format or length is Invalid_Length_mule_identity_type
    WHEN Encrypt File GPG To NITMX JSON ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Withdraw_Black_mule
    WHEN Call API Sending file withdraw black mule from aoc to ITMX
    Then Get File withdraw black mule GPG From ITMX
    Then Check Response Code WIthdraw Black Mule REQ And RES is Invalid_format_mule_identity_type
    Then Deleted File all withdraw

TC001_035 Validate Format/Length - Code 7106 - Field : mule_title - Invalid Format (Length 50) (Appendix 1.7) |||||||||
   Given Chose to create file name black mule run number 400 - 600
    Then PreparaData black mule is 1 Data And Genarate all type of black mule and validate format or length is Invalid_mule_title
    WHEN Encrypt File GPG To NITMX JSON ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Withdraw_Black_mule
    WHEN Call API Sending file withdraw black mule from aoc to ITMX
    Then Get File withdraw black mule GPG From ITMX
    Then Check Response Code WIthdraw Black Mule REQ And RES is Invalid_format_mule_title
    Then Deleted File all withdraw

TC001_036 Validate Format/Length - Code 7106 - Field : mule_title - Invalid Format (Length 51) (Appendix 1.7) djaoifjafoiaหกดห่นดรหด่หวดห่ดวฟกฟดนรห่ดวฟ1234556789
   Given Chose to create file name black mule run number 400 - 600
    Then PreparaData black mule is 1 Data And Genarate all type of black mule and validate format or length is Invalid_Length_mule_title
    WHEN Encrypt File GPG To NITMX JSON ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Withdraw_Black_mule
    WHEN Call API Sending file withdraw black mule from aoc to ITMX
    Then Get File withdraw black mule GPG From ITMX
    Then Check Response Code WIthdraw Black Mule REQ And RES is Invalid_format_mule_title
    Then Deleted File all withdraw

TC001_038 Validate Format/Length - Code 7106 - Field : mule_name - Invalid Format (Length 256) (Appendix 1.7) ||||
   Given Chose to create file name black mule run number 400 - 600
    Then PreparaData black mule is 1 Data And Genarate all type of black mule and validate format or length is Invalid_mule_name
    WHEN Encrypt File GPG To NITMX JSON ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Withdraw_Black_mule
    WHEN Call API Sending file withdraw black mule from aoc to ITMX
    Then Get File withdraw black mule GPG From ITMX
    Then Check Response Code WIthdraw Black Mule REQ And RES is Invalid_format_mule_name
    Then Deleted File all withdraw

TC001_039 Validate Format/Length - Code 7106 - Field : mule_name - Invalid Length (Length 257) (Appendix 1.7)
   Given Chose to create file name black mule run number 400 - 600
    Then PreparaData black mule is 1 Data And Genarate all type of black mule and validate format or length is Invalid_Length_mule_name
    WHEN Encrypt File GPG To NITMX JSON ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Withdraw_Black_mule
    WHEN Call API Sending file withdraw black mule from aoc to ITMX
    Then Get File withdraw black mule GPG From ITMX
    Then Check Response Code WIthdraw Black Mule REQ And RES is Invalid_format_mule_name
    Then Deleted File all withdraw

TC001_041 Validate Format/Length - Code 7106 - Field : mule_surname - Invalid Format (Length 256) (Appendix 1.7) ||||
   Given Chose to create file name black mule run number 400 - 600
    Then PreparaData black mule is 1 Data And Genarate all type of black mule and validate format or length is Invalid_mule_surname
    WHEN Encrypt File GPG To NITMX JSON ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Withdraw_Black_mule
    WHEN Call API Sending file withdraw black mule from aoc to ITMX
    Then Get File withdraw black mule GPG From ITMX
    Then Check Response Code WIthdraw Black Mule REQ And RES is Invalid_format_mule_surname
    Then Deleted File all withdraw

TC001_042 Validate Format/Length - Code 7106 - Field : mule_surname - Invalid Length (Length 257) (Appendix 1.7)
   Given Chose to create file name black mule run number 400 - 600
    Then PreparaData black mule is 1 Data And Genarate all type of black mule and validate format or length is Invalid_Length_mule_surname
    WHEN Encrypt File GPG To NITMX JSON ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Withdraw_Black_mule
    WHEN Call API Sending file withdraw black mule from aoc to ITMX
    Then Get File withdraw black mule GPG From ITMX
    Then Check Response Code WIthdraw Black Mule REQ And RES is Invalid_format_mule_surname
    Then Deleted File all withdraw

TC001_044 Validate Format/Length - Code 7106 - Field : mule_birth_date - Invalid Format (Length 10) (Appendix 1.3.12) 25470220 
   Given Chose to create file name black mule run number 400 - 600
    Then PreparaData black mule is 1 Data And Genarate all type of black mule and validate format or length is Invalid_mule_birth_date
    WHEN Encrypt File GPG To NITMX JSON ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Withdraw_Black_mule
    WHEN Call API Sending file withdraw black mule from aoc to ITMX
    Then Get File withdraw black mule GPG From ITMX
    Then Check Response Code WIthdraw Black Mule REQ And RES is Invalid_format_mule_birth_date
    Then Deleted File all withdraw

TC001_045 Validate Format/Length - Code 7106 - Field : mule_birth_date - Invalid Format (Length 10) (Appendix 1.3.12) Test-ทส-TS
   Given Chose to create file name black mule run number 400 - 600
    Then PreparaData black mule is 1 Data And Genarate all type of black mule and validate format or length is Invalid_string_mule_birth_date
    WHEN Encrypt File GPG To NITMX JSON ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Withdraw_Black_mule
    WHEN Call API Sending file withdraw black mule from aoc to ITMX
    Then Get File withdraw black mule GPG From ITMX
    Then Check Response Code WIthdraw Black Mule REQ And RES is Invalid_format_mule_birth_date
    Then Deleted File all withdraw

TC001_046 Validate Format/Length - Code 7106 - Field : mule_birth_date - Invalid Format (Length 10) (Appendix 1.3.12) day
   Given Chose to create file name black mule run number 400 - 600
    Then PreparaData black mule is 1 Data And Genarate all type of black mule and validate format or length is Invalid_day_mule_birth_date
    WHEN Encrypt File GPG To NITMX JSON ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Withdraw_Black_mule
    WHEN Call API Sending file withdraw black mule from aoc to ITMX
    Then Get File withdraw black mule GPG From ITMX
    Then Check Response Code WIthdraw Black Mule REQ And RES is Invalid_format_mule_birth_date
    Then Deleted File all withdraw

TC001_047 Validate Format/Length - Code 7106 - Field : mule_birth_date - Invalid Format (Length 10) (Appendix 1.3.12) month
   Given Chose to create file name black mule run number 400 - 600
    Then PreparaData black mule is 1 Data And Genarate all type of black mule and validate format or length is Invalid_month_mule_birth_date
    WHEN Encrypt File GPG To NITMX JSON ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Withdraw_Black_mule
    WHEN Call API Sending file withdraw black mule from aoc to ITMX
    Then Get File withdraw black mule GPG From ITMX
    Then Check Response Code WIthdraw Black Mule REQ And RES is Invalid_format_mule_birth_date
    Then Deleted File all withdraw

TC001_048 Validate Format/Length - Code 7106 - Field : mule_birth_date - Invalid Length (Length 10) (Appendix 1.3.12) month
   Given Chose to create file name black mule run number 400 - 600
    Then PreparaData black mule is 1 Data And Genarate all type of black mule and validate format or length is Invalid_Length_mule_birth_date
    WHEN Encrypt File GPG To NITMX JSON ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Withdraw_Black_mule
    WHEN Call API Sending file withdraw black mule from aoc to ITMX
    Then Get File withdraw black mule GPG From ITMX
    Then Check Response Code WIthdraw Black Mule REQ And RES is Invalid_format_mule_birth_date
    Then Deleted File all withdraw

TC001_050 Validate Format/Length - Code 7106 - Field : mule_nationality - Invalid Format (Length 2) (Appendix 1.3.1) th
   Given Chose to create file name black mule run number 400 - 600
    Then PreparaData black mule is 1 Data And Genarate all type of black mule and validate format or length is Invalid_mule_nationality
    WHEN Encrypt File GPG To NITMX JSON ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Withdraw_Black_mule
    WHEN Call API Sending file withdraw black mule from aoc to ITMX
    Then Get File withdraw black mule GPG From ITMX
    Then Check Response Code WIthdraw Black Mule REQ And RES is Invalid_format_mule_nationality
    Then Deleted File all withdraw

TC001_051 Validate Format/Length - Code 7106 - Field : mule_nationality - Invalid Length (Length 3) (Appendix 1.3.1) TH1
   Given Chose to create file name black mule run number 400 - 600
    Then PreparaData black mule is 1 Data And Genarate all type of black mule and validate format or length is Invalid_Length_mule_nationality
    WHEN Encrypt File GPG To NITMX JSON ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Withdraw_Black_mule
    WHEN Call API Sending file withdraw black mule from aoc to ITMX
    Then Get File withdraw black mule GPG From ITMX
    Then Check Response Code WIthdraw Black Mule REQ And RES is Invalid_format_mule_nationality
    Then Deleted File all withdraw

TC001_053 Validate Format/Length - Code 7106 - Field :police_case_id - Invalid Format (Length 30) (Appendix 1.7) ||||
   Given Chose to create file name black mule run number 400 - 600
    Then PreparaData black mule is 1 Data And Genarate all type of black mule and validate format or length is Invalid_police_case_id
    WHEN Encrypt File GPG To NITMX JSON ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Withdraw_Black_mule
    WHEN Call API Sending file withdraw black mule from aoc to ITMX
    Then Get File withdraw black mule GPG From ITMX
    Then Check Response Code WIthdraw Black Mule REQ And RES is Invalid_format_police_case_id
    Then Deleted File all withdraw

TC001_054 Validate Format/Length - Code 7106 - Field :police_case_id - Invalid Length (Length 31) (Appendix 1.7) djaoifjafoiaหกนรห่ดวฟ123455678A
   Given Chose to create file name black mule run number 400 - 600
    Then PreparaData black mule is 1 Data And Genarate all type of black mule and validate format or length is Invalid_Length_police_case_id
    WHEN Encrypt File GPG To NITMX JSON ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Withdraw_Black_mule
    WHEN Call API Sending file withdraw black mule from aoc to ITMX
    Then Get File withdraw black mule GPG From ITMX
    Then Check Response Code WIthdraw Black Mule REQ And RES is Invalid_format_police_case_id
    Then Deleted File all withdraw

TC001_056 Validate Format/Length - Code 7106 - Field :police_case_type - Invalid Format (Length 2) (Appendix 1.3.3) Ts
   Given Chose to create file name black mule run number 400 - 600
    Then PreparaData black mule is 1 Data And Genarate all type of black mule and validate format or length is Invalid_police_case_type
    WHEN Encrypt File GPG To NITMX JSON ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Withdraw_Black_mule
    WHEN Call API Sending file withdraw black mule from aoc to ITMX
    Then Get File withdraw black mule GPG From ITMX
    Then Check Response Code WIthdraw Black Mule REQ And RES is Invalid_format_police_case_type
    Then Deleted File all withdraw

TC001_057 Validate Format/Length - Code 7106 - Field :police_case_type - Invalid Format (Length 3) (Appendix 1.3.3) 333
   Given Chose to create file name black mule run number 400 - 600
    Then PreparaData black mule is 1 Data And Genarate all type of black mule and validate format or length is Invalid_Length_police_case_type
    WHEN Encrypt File GPG To NITMX JSON ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Withdraw_Black_mule
    WHEN Call API Sending file withdraw black mule from aoc to ITMX
    Then Get File withdraw black mule GPG From ITMX
    Then Check Response Code WIthdraw Black Mule REQ And RES is Invalid_format_police_case_type
    Then Deleted File all withdraw

TC001_059 Validate Format/Length - Code 7106 - Field :police_case_report_date - Inalid Format (Length 10) (Appendix 1.3.12) 25671030
   Given Chose to create file name black mule run number 400 - 600
    Then PreparaData black mule is 1 Data And Genarate all type of black mule and validate format or length is Invalid_police_case_report_date
    WHEN Encrypt File GPG To NITMX JSON ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Withdraw_Black_mule
    WHEN Call API Sending file withdraw black mule from aoc to ITMX
    Then Get File withdraw black mule GPG From ITMX
    Then Check Response Code WIthdraw Black Mule REQ And RES is Invalid_format_police_case_report_date

TC001_060 Validate Format/Length - Code 7106 - Field :police_case_report_date - Inalid Format (Length 10) (Appendix 1.3.12) 25671030
   Given Chose to create file name black mule run number 400 - 600
    Then PreparaData black mule is 1 Data And Genarate all type of black mule and validate format or length is Invalid_Character_police_case_report_date
    WHEN Encrypt File GPG To NITMX JSON ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Withdraw_Black_mule
    WHEN Call API Sending file withdraw black mule from aoc to ITMX
    Then Get File withdraw black mule GPG From ITMX
    Then Check Response Code WIthdraw Black Mule REQ And RES is Invalid_format_police_case_report_date
    Then Deleted File all withdraw

TC001_061 Validate Format/Length - Code 7106 - Field :police_case_report_date - Inalid Format Date (Length 10) (Appendix 1.3.12) 2500-10-32
   Given Chose to create file name black mule run number 400 - 600
    Then PreparaData black mule is 1 Data And Genarate all type of black mule and validate format or length is Invalid_Day_police_case_report_date
    WHEN Encrypt File GPG To NITMX JSON ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Withdraw_Black_mule
    WHEN Call API Sending file withdraw black mule from aoc to ITMX
    Then Get File withdraw black mule GPG From ITMX
    Then Check Response Code WIthdraw Black Mule REQ And RES is Invalid_format_police_case_report_date
    Then Deleted File all withdraw

TC001_062 Validate Format/Length - Code 7106 - Field :police_case_report_date - Inalid Format Month (Length 10) (Appendix 1.3.12) 2500-13-01
   Given Chose to create file name black mule run number 400 - 600
    Then PreparaData black mule is 1 Data And Genarate all type of black mule and validate format or length is Invalid_Month_police_case_report_date
    WHEN Encrypt File GPG To NITMX JSON ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Withdraw_Black_mule
    WHEN Call API Sending file withdraw black mule from aoc to ITMX
    Then Get File withdraw black mule GPG From ITMX
    Then Check Response Code WIthdraw Black Mule REQ And RES is Invalid_format_police_case_report_date
    Then Deleted File all withdraw

TC001_063 Validate Format/Length - Code 7106 - Field :police_case_report_date - Inalid Length (Length 11) (Appendix 1.3.12) 2500-13-01
   Given Chose to create file name black mule run number 400 - 600
    Then PreparaData black mule is 1 Data And Genarate all type of black mule and validate format or length is Invalid_Length_police_case_report_date
    WHEN Encrypt File GPG To NITMX JSON ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Withdraw_Black_mule
    WHEN Call API Sending file withdraw black mule from aoc to ITMX
    Then Get File withdraw black mule GPG From ITMX
    Then Check Response Code WIthdraw Black Mule REQ And RES is Invalid_format_police_case_report_date
    Then Deleted File all withdraw

TC001_065 Validate Format/Length - Code 7106 - Field :mule_account_no - Invalid Format (Length 35) (Appendix 1.3.3) TjsadjaoUskdก่ดนรห่ดหนด่หหกห
   Given Chose to create file name black mule run number 400 - 600
    Then PreparaData black mule is 1 Data And Genarate all type of black mule and validate format or length is Invalid_mule_account_no
    WHEN Encrypt File GPG To NITMX JSON ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Withdraw_Black_mule
    WHEN Call API Sending file withdraw black mule from aoc to ITMX
    Then Get File withdraw black mule GPG From ITMX
    Then Check Response Code WIthdraw Black Mule REQ And RES is Invalid_format_mule_account_no
    Then Deleted File all withdraw

TC001_066 Validate Format/Length - Code 7106 - Field :mule_account_no - Invalid Length (Length 36) (Appendix 1.3.3) 101110334643434252323525252535353556
   Given Chose to create file name black mule run number 400 - 600
    Then PreparaData black mule is 1 Data And Genarate all type of black mule and validate format or length is Invalid_Length_mule_account_no
    WHEN Encrypt File GPG To NITMX JSON ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Withdraw_Black_mule
    WHEN Call API Sending file withdraw black mule from aoc to ITMX
    Then Get File withdraw black mule GPG From ITMX
    Then Check Response Code WIthdraw Black Mule REQ And RES is Invalid_format_mule_account_no
    Then Deleted File all withdraw

TC001_068 Validate Format/Length - Code 7106 - Field :mule_account_type - Invalid Format (Length 35) (Appendix 1.3.2) เทส๑$%^&*#$^&
   Given Chose to create file name black mule run number 400 - 600
    Then PreparaData black mule is 1 Data And Genarate all type of black mule and validate format or length is Invalid_mule_account_type
    WHEN Encrypt File GPG To NITMX JSON ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Withdraw_Black_mule
    WHEN Call API Sending file withdraw black mule from aoc to ITMX
    Then Get File withdraw black mule GPG From ITMX
    Then Check Response Code WIthdraw Black Mule REQ And RES is Invalid_format_mule_account_type
    Then Deleted File all withdraw

TC001_069 Validate Format/Length - Code 7106 - Field :mule_account_type - Invalid Length (Length 36) (Appendix 1.3.2) TjsadjaoUMO3449595050506696060606645
   Given Chose to create file name black mule run number 400 - 600
    Then PreparaData black mule is 1 Data And Genarate all type of black mule and validate format or length is Invalid_Length_mule_account_type
    WHEN Encrypt File GPG To NITMX JSON ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Withdraw_Black_mule
    WHEN Call API Sending file withdraw black mule from aoc to ITMX
    Then Get File withdraw black mule GPG From ITMX
    Then Check Response Code WIthdraw Black Mule REQ And RES is Invalid_format_mule_account_type
    Then Deleted File all withdraw

TC001_071 Validate Format/Length - Code 7106 - Field :mule_account_bankcode - Invalid Format (Length 3) (Appendix 1.3.3) กขT
   Given Chose to create file name black mule run number 400 - 600
    Then PreparaData black mule is 1 Data And Genarate all type of black mule and validate format or length is Invalid_mule_account_bankcode
    WHEN Encrypt File GPG To NITMX JSON ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Withdraw_Black_mule
    WHEN Call API Sending file withdraw black mule from aoc to ITMX
    Then Get File withdraw black mule GPG From ITMX
    Then Check Response Code WIthdraw Black Mule REQ And RES is Invalid_format_mule_account_bankcode
    Then Deleted File all withdraw

TC001_072 Validate Format/Length - Code 7106 - Field :mule_account_bankcode - Invalid Length (Length 141) (Appendix 1.3.3)
   Given Chose to create file name black mule run number 400 - 600
    Then PreparaData black mule is 1 Data And Genarate all type of black mule and validate format or length is Invalid_Length_mule_account_bankcode
    WHEN Encrypt File GPG To NITMX JSON ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Withdraw_Black_mule
    WHEN Call API Sending file withdraw black mule from aoc to ITMX
    Then Get File withdraw black mule GPG From ITMX
    Then Check Response Code WIthdraw Black Mule REQ And RES is Invalid_format_mule_account_bankcode
    Then Deleted File all withdraw

TC001_074 Validate Format/Length - Code 7106 - Field :mule_account_bankname - Invalid Format (Length 140) (Appendix 1.7)
   Given Chose to create file name black mule run number 400 - 600
    Then PreparaData black mule is 1 Data And Genarate all type of black mule and validate format or length is Invalid_mule_account_bankname
    WHEN Encrypt File GPG To NITMX JSON ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Withdraw_Black_mule
    WHEN Call API Sending file withdraw black mule from aoc to ITMX
    Then Get File withdraw black mule GPG From ITMX
    Then Check Response Code WIthdraw Black Mule REQ And RES is Invalid_format_mule_account_bankname
    Then Deleted File all withdraw

TC001_075 Validate Format/Length - Code 7106 - Field :mule_account_bankname - Invalid Length (Length 141) (Appendix 1.7)
   Given Chose to create file name black mule run number 400 - 600
    Then PreparaData black mule is 1 Data And Genarate all type of black mule and validate format or length is Invalid_Length_mule_account_bankname
    WHEN Encrypt File GPG To NITMX JSON ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Withdraw_Black_mule
    WHEN Call API Sending file withdraw black mule from aoc to ITMX
    Then Get File withdraw black mule GPG From ITMX
    Then Check Response Code WIthdraw Black Mule REQ And RES is Invalid_format_mule_account_bankname
    Then Deleted File all withdraw

TC001_077 Validate Format/Length - Code 7106 - Field :police_rank - Invalid Format (Length 50) (Appendix 1.7) |||
   Given Chose to create file name black mule run number 400 - 600
    Then PreparaData black mule is 1 Data And Genarate all type of black mule and validate format or length is Invalid_police_rank
    WHEN Encrypt File GPG To NITMX JSON ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Withdraw_Black_mule
    WHEN Call API Sending file withdraw black mule from aoc to ITMX
    Then Get File withdraw black mule GPG From ITMX
    Then Check Response Code WIthdraw Black Mule REQ And RES is Invalid_format_police_rank
    Then Deleted File all withdraw

TC001_078 Validate Format/Length - Code 7106 - Field :police_rank - Invalid Length (Length 51) (Appendix 1.7) 
   Given Chose to create file name black mule run number 400 - 600
    Then PreparaData black mule is 1 Data And Genarate all type of black mule and validate format or length is Invalid_Length_police_rank
    WHEN Encrypt File GPG To NITMX JSON ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Withdraw_Black_mule
    WHEN Call API Sending file withdraw black mule from aoc to ITMX
    Then Get File withdraw black mule GPG From ITMX
    Then Check Response Code WIthdraw Black Mule REQ And RES is Invalid_format_police_rank
    Then Deleted File all withdraw

TC001_080 Validate Format/Length - Code 7106 - Field :police_name - Invalid Format (Length 100) (Appendix 1.7) |||||||
   Given Chose to create file name black mule run number 400 - 600
    Then PreparaData black mule is 1 Data And Genarate all type of black mule and validate format or length is Invalid_police_name
    WHEN Encrypt File GPG To NITMX JSON ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Withdraw_Black_mule
    WHEN Call API Sending file withdraw black mule from aoc to ITMX
    Then Get File withdraw black mule GPG From ITMX
    Then Check Response Code WIthdraw Black Mule REQ And RES is Invalid_format_police_name
    Then Deleted File all withdraw

TC001_081 Validate Format/Length - Code 7106 - Field :police_name - Invalid Length (Length 101) (Appendix 1.7)
   Given Chose to create file name black mule run number 400 - 600
    Then PreparaData black mule is 1 Data And Genarate all type of black mule and validate format or length is Invalid_Length_police_name
    WHEN Encrypt File GPG To NITMX JSON ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Withdraw_Black_mule
    WHEN Call API Sending file withdraw black mule from aoc to ITMX
    Then Get File withdraw black mule GPG From ITMX
    Then Check Response Code WIthdraw Black Mule REQ And RES is Invalid_format_police_name
    Then Deleted File all withdraw

TC001_083 Validate Format/Length - Code 7106 - Field :police_surname - Invalid Format (Length 100) (Appendix 1.7) ||||||||
   Given Chose to create file name black mule run number 400 - 600
    Then PreparaData black mule is 1 Data And Genarate all type of black mule and validate format or length is Invalid_police_surname
    WHEN Encrypt File GPG To NITMX JSON ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Withdraw_Black_mule
    WHEN Call API Sending file withdraw black mule from aoc to ITMX
    Then Get File withdraw black mule GPG From ITMX
    Then Check Response Code WIthdraw Black Mule REQ And RES is Invalid_format_police_surname
    Then Deleted File all withdraw

TC001_084 Validate Format/Length - Code 7106 - Field :police_surname - Invalid Length (Length 101) (Appendix 1.7) 
   Given Chose to create file name black mule run number 400 - 600
    Then PreparaData black mule is 1 Data And Genarate all type of black mule and validate format or length is Invalid_Length_police_surname
    WHEN Encrypt File GPG To NITMX JSON ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Withdraw_Black_mule
    WHEN Call API Sending file withdraw black mule from aoc to ITMX
    Then Get File withdraw black mule GPG From ITMX
    Then Check Response Code WIthdraw Black Mule REQ And RES is Invalid_format_police_surname
    Then Deleted File all withdraw

TC001_086 Validate Format/Length - Code 7106 - Field :police_job_title - Invalid Format (Length 100) (Appendix 1.7) ||||||
   Given Chose to create file name black mule run number 400 - 600
    Then PreparaData black mule is 1 Data And Genarate all type of black mule and validate format or length is Invalid_police_job_title
    WHEN Encrypt File GPG To NITMX JSON ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Withdraw_Black_mule
    WHEN Call API Sending file withdraw black mule from aoc to ITMX
    Then Get File withdraw black mule GPG From ITMX
    Then Check Response Code WIthdraw Black Mule REQ And RES is Invalid_format_police_job_title
    Then Deleted File all withdraw

TC001_087 Validate Format/Length - Code 7106 - Field :police_job_title - Invalid Length (Length 101) (Appendix 1.7)
   Given Chose to create file name black mule run number 400 - 600
    Then PreparaData black mule is 1 Data And Genarate all type of black mule and validate format or length is Invalid_Length_police_job_title
    WHEN Encrypt File GPG To NITMX JSON ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Withdraw_Black_mule
    WHEN Call API Sending file withdraw black mule from aoc to ITMX
    Then Get File withdraw black mule GPG From ITMX
    Then Check Response Code WIthdraw Black Mule REQ And RES is Invalid_format_police_job_title
    Then Deleted File all withdraw

TC001_089 Validate Format/Length - Code 7106 - Field :police_org - Invalid Format (Length 200) (Appendix 1.7) ||||||
   Given Chose to create file name black mule run number 400 - 600
    Then PreparaData black mule is 1 Data And Genarate all type of black mule and validate format or length is Invalid_police_org
    WHEN Encrypt File GPG To NITMX JSON ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Withdraw_Black_mule
    WHEN Call API Sending file withdraw black mule from aoc to ITMX
    Then Get File withdraw black mule GPG From ITMX
    Then Check Response Code WIthdraw Black Mule REQ And RES is Invalid_format_police_org
    Then Deleted File all withdraw

TC001_090 Validate Format/Length - Code 7106 - Field :police_org - Invalid Length (Length 201) (Appendix 1.7) 
   Given Chose to create file name black mule run number 400 - 600
    Then PreparaData black mule is 1 Data And Genarate all type of black mule and validate format or length is Invalid_Length_police_org
    WHEN Encrypt File GPG To NITMX JSON ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Withdraw_Black_mule
    WHEN Call API Sending file withdraw black mule from aoc to ITMX
    Then Get File withdraw black mule GPG From ITMX
    Then Check Response Code WIthdraw Black Mule REQ And RES is Invalid_format_police_org
    Then Deleted File all withdraw

TC001_092 Validate Format/Length - Code 7106 - Field :police_tel - Invalid Format (Length 20) (Appendix 1.7) |||
   Given Chose to create file name black mule run number 400 - 600
    Then PreparaData black mule is 1 Data And Genarate all type of black mule and validate format or length is Invalid_police_tel
    WHEN Encrypt File GPG To NITMX JSON ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Withdraw_Black_mule
    WHEN Call API Sending file withdraw black mule from aoc to ITMX
    Then Get File withdraw black mule GPG From ITMX
    Then Check Response Code WIthdraw Black Mule REQ And RES is Invalid_format_police_tel
    Then Deleted File all withdraw

TC001_093 Validate Format/Length - Code 7106 - Field :police_tel - Invalid Length (Length 21) (Appendix 1.7) 
   Given Chose to create file name black mule run number 400 - 600
    Then PreparaData black mule is 1 Data And Genarate all type of black mule and validate format or length is Invalid_Length_police_tel
    WHEN Encrypt File GPG To NITMX JSON ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Withdraw_Black_mule
    WHEN Call API Sending file withdraw black mule from aoc to ITMX
    Then Get File withdraw black mule GPG From ITMX
    Then Check Response Code WIthdraw Black Mule REQ And RES is Invalid_format_police_tel
    Then Deleted File all withdraw

TC001_095 Validate Format/Length - Code 7106 - Field :police_email - Invalid Format (Length 50) (Appendix 1.5) umaporn.artjdoifjsoTdjsofijsจต932sdjsda@sfrd.co.th
   Given Chose to create file name black mule run number 400 - 600
    Then PreparaData black mule is 1 Data And Genarate all type of black mule and validate format or length is Invalid_police_email
    WHEN Encrypt File GPG To NITMX JSON ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Withdraw_Black_mule
    WHEN Call API Sending file withdraw black mule from aoc to ITMX
    Then Get File withdraw black mule GPG From ITMX
    Then Check Response Code WIthdraw Black Mule REQ And RES is Invalid_format_police_email
    Then Deleted File all withdraw

TC001_096 Validate Format/Length - Code 7106 - Field :police_email - Invalid Length (Length 51) (Appendix 1.5) Aumaporn.artjdo_ifjso-Tdjsofijs932sdjsda@sfrd.co.th
   Given Chose to create file name black mule run number 400 - 600
    Then PreparaData black mule is 1 Data And Genarate all type of black mule and validate format or length is Invalid_Length_police_email
    WHEN Encrypt File GPG To NITMX JSON ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Withdraw_Black_mule
    WHEN Call API Sending file withdraw black mule from aoc to ITMX
    Then Get File withdraw black mule GPG From ITMX
    Then Check Response Code WIthdraw Black Mule REQ And RES is Invalid_format_police_email
    Then Deleted File all withdraw

TC001_097 Validate Format/Length - Code 7106 - แกะไฟล์ Json ไม่ได้  
   Given Chose to create file name black mule run number 400 - 600
    Then PreparaData black mule is 1 Data And Genarate all type of black mule and missing parameter field is Invalid_Non_Processable_with_typecode
    WHEN Encrypt File GPG To NITMX JSON ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Withdraw_Black_mule
    WHEN Call API Sending file withdraw black mule from aoc to ITMX
    Then Get File withdraw black mule GPG From ITMX
    Then Check Response Code WIthdraw Black Mule REQ And RES is Invalid_format_Non_processable_Entity
    Then Deleted File all withdraw

TC002_001 Validate Missing required field - Code 7105 - Missing data Field : declare_uuid
   Given Chose to create file name black mule run number 400 - 600
    Then PreparaData black mule is 1 Data And Genarate all type of black mule and validate format or length is Invalid_Missing_field_uuid
    WHEN Encrypt File GPG To NITMX JSON ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Withdraw_Black_mule
    WHEN Call API Sending file withdraw black mule from aoc to ITMX
    Then Get File withdraw black mule GPG From ITMX
    Then Check Response Code WIthdraw Black Mule REQ And RES is Invalid_format_Missing_field_uuid
    Then Deleted File all withdraw

TC002_002 Validate Missing required field - Code 7105 - Missing data Field : declare_type_code
   Given Chose to create file name black mule run number 400 - 600
    Then PreparaData black mule is 1 Data And Genarate all type of black mule and validate format or length is Invalid_Missing_field_de_type_code
    WHEN Encrypt File GPG To NITMX JSON ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Withdraw_Black_mule
    WHEN Call API Sending file withdraw black mule from aoc to ITMX
    Then Get File withdraw black mule GPG From ITMX
    Then Check Response Code WIthdraw Black Mule REQ And RES is Invalid_Missing_field_de_type_code
    Then Deleted File all withdraw

TC002_003 Validate Missing required field - Code 7105 - Missing data Field : declare_type
   Given Chose to create file name black mule run number 400 - 600
    Then PreparaData black mule is 1 Data And Genarate all type of black mule and validate format or length is Invalid_Missing_field_de_type
    WHEN Encrypt File GPG To NITMX JSON ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Withdraw_Black_mule
    WHEN Call API Sending file withdraw black mule from aoc to ITMX
    Then Get File withdraw black mule GPG From ITMX
    Then Check Response Code WIthdraw Black Mule REQ And RES is Invalid_Missing_field_de_type
    Then Deleted File all withdraw

TC002_004 Validate Missing required field - Code 7105 - Missing data Field : withdraw_date
   Given Chose to create file name black mule run number 400 - 600
    Then PreparaData black mule is 1 Data And Genarate all type of black mule and validate format or length is Invalid_Missing_field_withdraw_date
    WHEN Encrypt File GPG To NITMX JSON ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Withdraw_Black_mule
    WHEN Call API Sending file withdraw black mule from aoc to ITMX
    Then Get File withdraw black mule GPG From ITMX
    Then Check Response Code WIthdraw Black Mule REQ And RES is Invalid_Missing_field_withdraw_date
    Then Deleted File all withdraw

TC002_005 Validate Missing required field - Code 7105 - Missing data Field : declare_reason_code
   Given Chose to create file name black mule run number 400 - 600
    Then PreparaData black mule is 1 Data And Genarate all type of black mule and validate format or length is Invalid_Missing_field_declare_reason_code
    WHEN Encrypt File GPG To NITMX JSON ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Withdraw_Black_mule
    WHEN Call API Sending file withdraw black mule from aoc to ITMX
    Then Get File withdraw black mule GPG From ITMX
    Then Check Response Code WIthdraw Black Mule REQ And RES is Invalid_Missing_field_declare_reason_code
    Then Deleted File all withdraw

TC002_006 Validate Missing required field - Code 7105 - Missing data Field : declare_reason
   Given Chose to create file name black mule run number 400 - 600
    Then PreparaData black mule is 1 Data And Genarate all type of black mule and validate format or length is Invalid_Missing_field_declare_reason
    WHEN Encrypt File GPG To NITMX JSON ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Withdraw_Black_mule
    WHEN Call API Sending file withdraw black mule from aoc to ITMX
    Then Get File withdraw black mule GPG From ITMX
    Then Check Response Code WIthdraw Black Mule REQ And RES is Invalid_Missing_field_declare_reason
    Then Deleted File all withdraw

TC002_007 Validate Missing required field - Code 7105 - Missing data Field : declare_note
   Given Chose to create file name black mule run number 400 - 600
    Then PreparaData black mule is 1 Data And Genarate all type of black mule and validate format or length is Invalid_Missing_field_declare_note
    WHEN Encrypt File GPG To NITMX JSON ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Withdraw_Black_mule
    WHEN Call API Sending file withdraw black mule from aoc to ITMX
    Then Get File withdraw black mule GPG From ITMX
    Then Check Response Code WIthdraw Black Mule REQ And RES is Invalid_Missing_field_declare_note
    Then Deleted File all withdraw

TC002_008 Validate Missing required field - Code 7105 - Missing data Field : mule_ref_code
   Given Chose to create file name black mule run number 400 - 600
    Then PreparaData black mule is 1 Data And Genarate all type of black mule and validate format or length is Invalid_Missing_field_mule_ref_code
    WHEN Encrypt File GPG To NITMX JSON ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Withdraw_Black_mule
    WHEN Call API Sending file withdraw black mule from aoc to ITMX
    Then Get File withdraw black mule GPG From ITMX
    Then Check Response Code WIthdraw Black Mule REQ And RES is Invalid_Missing_field_mule_ref_code
    Then Deleted File all withdraw

TC002_009 Validate Missing required field - Code 7105 - Missing data Field : mule_identity_id
   Given Chose to create file name black mule run number 400 - 600
    Then PreparaData black mule is 1 Data And Genarate all type of black mule and validate format or length is Invalid_Missing_field_mule_identity_id
    WHEN Encrypt File GPG To NITMX JSON ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Withdraw_Black_mule
    WHEN Call API Sending file withdraw black mule from aoc to ITMX
    Then Get File withdraw black mule GPG From ITMX
    Then Check Response Code WIthdraw Black Mule REQ And RES is Invalid_Missing_field_mule_identity_id
    Then Deleted File all withdraw

TC002_010 Validate Missing required field - Code 7105 - Missing data Field : mule_identity_type
   Given Chose to create file name black mule run number 400 - 600
    Then PreparaData black mule is 1 Data And Genarate all type of black mule and validate format or length is Invalid_Missing_field_mule_identity_type
    WHEN Encrypt File GPG To NITMX JSON ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Withdraw_Black_mule
    WHEN Call API Sending file withdraw black mule from aoc to ITMX
    Then Get File withdraw black mule GPG From ITMX
    Then Check Response Code WIthdraw Black Mule REQ And RES is Invalid_Missing_field_mule_identity_type
    Then Deleted File all withdraw

TC002_011 Validate Missing required field - Code 7105 - Missing data Field : mule_title
   Given Chose to create file name black mule run number 400 - 600
    Then PreparaData black mule is 1 Data And Genarate all type of black mule and validate format or length is Invalid_Missing_field_mule_title
    WHEN Encrypt File GPG To NITMX JSON ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Withdraw_Black_mule
    WHEN Call API Sending file withdraw black mule from aoc to ITMX
    Then Get File withdraw black mule GPG From ITMX
    Then Check Response Code WIthdraw Black Mule REQ And RES is Invalid_Missing_field_mule_title
    Then Deleted File all withdraw

TC002_012 Validate Missing required field - Code 7105 - Missing data Field : mule_name
   Given Chose to create file name black mule run number 400 - 600
    Then PreparaData black mule is 1 Data And Genarate all type of black mule and validate format or length is Invalid_Missing_field_mule_name
    WHEN Encrypt File GPG To NITMX JSON ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Withdraw_Black_mule
    WHEN Call API Sending file withdraw black mule from aoc to ITMX
    Then Get File withdraw black mule GPG From ITMX
    Then Check Response Code WIthdraw Black Mule REQ And RES is Invalid_Missing_field_mule_name
    Then Deleted File all withdraw

TC002_013 Validate Missing required field - Code 7105 - Missing data Field : mule_surname
   Given Chose to create file name black mule run number 400 - 600
    Then PreparaData black mule is 1 Data And Genarate all type of black mule and validate format or length is Invalid_Missing_field_mule_surname
    WHEN Encrypt File GPG To NITMX JSON ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Withdraw_Black_mule
    WHEN Call API Sending file withdraw black mule from aoc to ITMX
    Then Get File withdraw black mule GPG From ITMX
    Then Check Response Code WIthdraw Black Mule REQ And RES is Invalid_Missing_field_mule_surname
    Then Deleted File all withdraw

TC002_014 Validate Missing required field - Code 7105 - Missing data Field : mule_birth_date
   Given Chose to create file name black mule run number 400 - 600
    Then PreparaData black mule is 1 Data And Genarate all type of black mule and validate format or length is Invalid_Missing_field_mule_birth_date
    WHEN Encrypt File GPG To NITMX JSON ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Withdraw_Black_mule
    WHEN Call API Sending file withdraw black mule from aoc to ITMX
    Then Get File withdraw black mule GPG From ITMX
    Then Check Response Code WIthdraw Black Mule REQ And RES is Invalid_Missing_field_mule_birth_date
    Then Deleted File all withdraw

TC002_015 Validate Missing required field - Code 7105 - Missing data Field : mule_nationality
   Given Chose to create file name black mule run number 400 - 600
    Then PreparaData black mule is 1 Data And Genarate all type of black mule and validate format or length is Invalid_Missing_field_mule_nationality
    WHEN Encrypt File GPG To NITMX JSON ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Withdraw_Black_mule
    WHEN Call API Sending file withdraw black mule from aoc to ITMX
    Then Get File withdraw black mule GPG From ITMX
    Then Check Response Code WIthdraw Black Mule REQ And RES is Invalid_Missing_field_mule_nationality
    Then Deleted File all withdraw

TC002_016 Validate Missing required field - Code 7105 - Missing data Field : police_case_id
   Given Chose to create file name black mule run number 400 - 600
    Then PreparaData black mule is 1 Data And Genarate all type of black mule and validate format or length is Invalid_Missing_field_police_case_id
    WHEN Encrypt File GPG To NITMX JSON ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Withdraw_Black_mule
    WHEN Call API Sending file withdraw black mule from aoc to ITMX
    Then Get File withdraw black mule GPG From ITMX
    Then Check Response Code WIthdraw Black Mule REQ And RES is Invalid_Missing_field_police_case_id
    Then Deleted File all withdraw

TC002_017 Validate Missing required field - Code 7105 - Missing data Field : police_case_type
   Given Chose to create file name black mule run number 400 - 600
    Then PreparaData black mule is 1 Data And Genarate all type of black mule and validate format or length is Invalid_Missing_field_police_case_type
    WHEN Encrypt File GPG To NITMX JSON ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Withdraw_Black_mule
    WHEN Call API Sending file withdraw black mule from aoc to ITMX
    Then Get File withdraw black mule GPG From ITMX
    Then Check Response Code WIthdraw Black Mule REQ And RES is Invalid_Missing_field_police_case_type
    Then Deleted File all withdraw

TC002_018 Validate Missing required field - Code 7105 - Missing data Field : police_case_report_date
   Given Chose to create file name black mule run number 400 - 600
    Then PreparaData black mule is 1 Data And Genarate all type of black mule and validate format or length is Invalid_Missing_field_police_case_report_date
    WHEN Encrypt File GPG To NITMX JSON ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Withdraw_Black_mule
    WHEN Call API Sending file withdraw black mule from aoc to ITMX
    Then Get File withdraw black mule GPG From ITMX
    Then Check Response Code WIthdraw Black Mule REQ And RES is Invalid_Missing_field_police_case_report_date
    Then Deleted File all withdraw

TC002_019 Validate Missing required field - Code 7105 - Missing data Field : mule_account_no
   Given Chose to create file name black mule run number 400 - 600
    Then PreparaData black mule is 1 Data And Genarate all type of black mule and validate format or length is Invalid_Missing_field_mule_account_no
    WHEN Encrypt File GPG To NITMX JSON ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Withdraw_Black_mule
    WHEN Call API Sending file withdraw black mule from aoc to ITMX
    Then Get File withdraw black mule GPG From ITMX
    Then Check Response Code WIthdraw Black Mule REQ And RES is Invalid_Missing_field_mule_account_no
    Then Deleted File all withdraw

TC002_020 Validate Missing required field - Code 7105 - Missing data Field : mule_account_type
   Given Chose to create file name black mule run number 400 - 600
    Then PreparaData black mule is 1 Data And Genarate all type of black mule and validate format or length is Invalid_Missing_field_mule_account_type
    WHEN Encrypt File GPG To NITMX JSON ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Withdraw_Black_mule
    WHEN Call API Sending file withdraw black mule from aoc to ITMX
    Then Get File withdraw black mule GPG From ITMX
    Then Check Response Code WIthdraw Black Mule REQ And RES is Invalid_Missing_field_mule_account_type
    Then Deleted File all withdraw

TC002_021 Validate Missing required field - Code 7105 - Missing data Field : mule_account_bankcode
   Given Chose to create file name black mule run number 400 - 600
    Then PreparaData black mule is 1 Data And Genarate all type of black mule and validate format or length is Invalid_Missing_field_mule_account_bankcode
    WHEN Encrypt File GPG To NITMX JSON ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Withdraw_Black_mule
    WHEN Call API Sending file withdraw black mule from aoc to ITMX
    Then Get File withdraw black mule GPG From ITMX
    Then Check Response Code WIthdraw Black Mule REQ And RES is Invalid_Missing_field_mule_account_bankcode
    Then Deleted File all withdraw

TC002_022 Validate Missing required field - Code 7105 - Missing data Field : mule_account_bankname
   Given Chose to create file name black mule run number 400 - 600
    Then PreparaData black mule is 1 Data And Genarate all type of black mule and validate format or length is Invalid_Missing_field_mule_account_bankname
    WHEN Encrypt File GPG To NITMX JSON ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Withdraw_Black_mule
    WHEN Call API Sending file withdraw black mule from aoc to ITMX
    Then Get File withdraw black mule GPG From ITMX
    Then Check Response Code WIthdraw Black Mule REQ And RES is Invalid_Missing_field_mule_account_bankname
    Then Deleted File all withdraw

TC002_023 Validate Missing required field - Code 7105 - Missing data Field : police_rank
   Given Chose to create file name black mule run number 400 - 600
    Then PreparaData black mule is 1 Data And Genarate all type of black mule and validate format or length is Invalid_Missing_field_police_rank
    WHEN Encrypt File GPG To NITMX JSON ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Withdraw_Black_mule
    WHEN Call API Sending file withdraw black mule from aoc to ITMX
    Then Get File withdraw black mule GPG From ITMX
    Then Check Response Code WIthdraw Black Mule REQ And RES is Invalid_Missing_field_police_rank
    Then Deleted File all withdraw

TC002_024 Validate Missing required field - Code 7105 - Missing data Field : police_name
   Given Chose to create file name black mule run number 400 - 600
    Then PreparaData black mule is 1 Data And Genarate all type of black mule and validate format or length is Invalid_Missing_field_police_name
    WHEN Encrypt File GPG To NITMX JSON ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Withdraw_Black_mule
    WHEN Call API Sending file withdraw black mule from aoc to ITMX
    Then Get File withdraw black mule GPG From ITMX
    Then Check Response Code WIthdraw Black Mule REQ And RES is Invalid_Missing_field_police_name
    Then Deleted File all withdraw

TC002_025 Validate Missing required field - Code 7105 - Missing data Field : police_surname
   Given Chose to create file name black mule run number 400 - 600
    Then PreparaData black mule is 1 Data And Genarate all type of black mule and validate format or length is Invalid_Missing_field_police_surname
    WHEN Encrypt File GPG To NITMX JSON ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Withdraw_Black_mule
    WHEN Call API Sending file withdraw black mule from aoc to ITMX
    Then Get File withdraw black mule GPG From ITMX
    Then Check Response Code WIthdraw Black Mule REQ And RES is Invalid_Missing_field_police_surname
    Then Deleted File all withdraw

TC002_026 Validate Missing required field - Code 7105 - Missing data Field : police_job_title
   Given Chose to create file name black mule run number 400 - 600
    Then PreparaData black mule is 1 Data And Genarate all type of black mule and validate format or length is Invalid_Missing_field_police_job_title
    WHEN Encrypt File GPG To NITMX JSON ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Withdraw_Black_mule
    WHEN Call API Sending file withdraw black mule from aoc to ITMX
    Then Get File withdraw black mule GPG From ITMX
    Then Check Response Code WIthdraw Black Mule REQ And RES is Invalid_Missing_field_police_job_title
    Then Deleted File all withdraw

TC002_027 Validate Missing required field - Code 7105 - Missing data Field : police_org
   Given Chose to create file name black mule run number 400 - 600
    Then PreparaData black mule is 1 Data And Genarate all type of black mule and validate format or length is Invalid_Missing_field_police_org
    WHEN Encrypt File GPG To NITMX JSON ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Withdraw_Black_mule
    WHEN Call API Sending file withdraw black mule from aoc to ITMX
    Then Get File withdraw black mule GPG From ITMX
    Then Check Response Code WIthdraw Black Mule REQ And RES is Invalid_Missing_field_police_org
    Then Deleted File all withdraw

TC002_028 Validate Missing required field - Code 7105 - Missing data Field : police_tel
   Given Chose to create file name black mule run number 400 - 600
    Then PreparaData black mule is 1 Data And Genarate all type of black mule and validate format or length is Invalid_Missing_field_police_tel
    WHEN Encrypt File GPG To NITMX JSON ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Withdraw_Black_mule
    WHEN Call API Sending file withdraw black mule from aoc to ITMX
    Then Get File withdraw black mule GPG From ITMX
    Then Check Response Code WIthdraw Black Mule REQ And RES is Invalid_Missing_field_police_tel
    Then Deleted File all withdraw

TC002_029 Validate Missing required field - Code 7105 - Missing data Field : police_email
   Given Chose to create file name black mule run number 400 - 600
    Then PreparaData black mule is 1 Data And Genarate all type of black mule and validate format or length is Invalid_Missing_field_police_email
    WHEN Encrypt File GPG To NITMX JSON ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Withdraw_Black_mule
    WHEN Call API Sending file withdraw black mule from aoc to ITMX
    Then Get File withdraw black mule GPG From ITMX
    Then Check Response Code WIthdraw Black Mule REQ And RES is Invalid_Missing_field_police_email
    Then Deleted File all withdraw

TC003_001 Validate Missing required field - Code 7105 - Missing Parameter Field : declare_uuid
   Given Chose to create file name black mule run number 400 - 600
    Then PreparaData black mule is 1 Data And Genarate all type of black mule and missing parameter field is Invalid_Missing_Parameter_field_uuid
    WHEN Encrypt File GPG To NITMX JSON ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Withdraw_Black_mule
    WHEN Call API Sending file withdraw black mule from aoc to ITMX
    Then Get File withdraw black mule GPG From ITMX
    Then Check Response Code WIthdraw Black Mule REQ And RES is Invalid_format_Missing_Parameter_field_uuid
    Then Deleted File all withdraw

TC003_002 Validate Missing required field - Code 7105 - Missing Parameter Field : declare_type_code
   Given Chose to create file name black mule run number 400 - 600
    Then PreparaData black mule is 1 Data And Genarate all type of black mule and missing parameter field is Invalid_Missing_Parameter_field_de_type_code
    WHEN Encrypt File GPG To NITMX JSON ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Withdraw_Black_mule
    WHEN Call API Sending file withdraw black mule from aoc to ITMX
    Then Get File withdraw black mule GPG From ITMX
    Then Check Response Code WIthdraw Black Mule REQ And RES is Invalid_format_Missing_Parameter_field_de_type_code
    Then Deleted File all withdraw

TC003_003 Validate Missing required field - Code 7105 - Missing Parameter Field : declare_type
   Given Chose to create file name black mule run number 400 - 600
    Then PreparaData black mule is 1 Data And Genarate all type of black mule and missing parameter field is Invalid_Missing_Parameter_field_de_type
    WHEN Encrypt File GPG To NITMX JSON ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Withdraw_Black_mule
    WHEN Call API Sending file withdraw black mule from aoc to ITMX
    Then Get File withdraw black mule GPG From ITMX
    Then Check Response Code WIthdraw Black Mule REQ And RES is Invalid_format_Missing_Parameter_field_de_type
    Then Deleted File all withdraw

TC003_004 Validate Missing required field - Code 7105 - Missing Parameter Field : withdraw_date
   Given Chose to create file name black mule run number 400 - 600
    Then PreparaData black mule is 1 Data And Genarate all type of black mule and missing parameter field is Invalid_Missing_Parameter_field_withdraw_date
    WHEN Encrypt File GPG To NITMX JSON ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Withdraw_Black_mule
    WHEN Call API Sending file withdraw black mule from aoc to ITMX
    Then Get File withdraw black mule GPG From ITMX
    Then Check Response Code WIthdraw Black Mule REQ And RES is Invalid_format_Missing_Parameter_withdraw_date
    Then Deleted File all withdraw

TC003_005 Validate Missing required field - Code 7105 - Missing Parameter Field : declare_reason_code
   Given Chose to create file name black mule run number 400 - 600
    Then PreparaData black mule is 1 Data And Genarate all type of black mule and missing parameter field is Invalid_Missing_Parameter_field_de_reason_code
    WHEN Encrypt File GPG To NITMX JSON ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Withdraw_Black_mule
    WHEN Call API Sending file withdraw black mule from aoc to ITMX
    Then Get File withdraw black mule GPG From ITMX
    Then Check Response Code WIthdraw Black Mule REQ And RES is Invalid_format_Missing_Parameter_de_reason_code
    Then Deleted File all withdraw

TC003_006 Validate Missing required field - Code 7105 - Missing Parameter Field : declare_reason
   Given Chose to create file name black mule run number 400 - 600
    Then PreparaData black mule is 1 Data And Genarate all type of black mule and missing parameter field is Invalid_Missing_Parameter_field_de_reason
    WHEN Encrypt File GPG To NITMX JSON ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Withdraw_Black_mule
    WHEN Call API Sending file withdraw black mule from aoc to ITMX
    Then Get File withdraw black mule GPG From ITMX
    Then Check Response Code WIthdraw Black Mule REQ And RES is Invalid_format_Missing_Parameter_de_reason
    Then Deleted File all withdraw

TC003_007 Validate Missing required field - Code 7105 - Missing Parameter Field : declare_note
   Given Chose to create file name black mule run number 400 - 600
    Then PreparaData black mule is 1 Data And Genarate all type of black mule and missing parameter field is Invalid_Missing_Parameter_field_de_note
    WHEN Encrypt File GPG To NITMX JSON ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Withdraw_Black_mule
    WHEN Call API Sending file withdraw black mule from aoc to ITMX
    Then Get File withdraw black mule GPG From ITMX
    Then Check Response Code WIthdraw Black Mule REQ And RES is Invalid_format_Missing_Parameter_de_note
    Then Deleted File all withdraw

TC003_008 Validate Missing required field - Code 7105 - Missing Parameter Field : mule_ref_code
   Given Chose to create file name black mule run number 400 - 600
    Then PreparaData black mule is 1 Data And Genarate all type of black mule and missing parameter field is Invalid_Missing_Parameter_field_mule_ref_code
    WHEN Encrypt File GPG To NITMX JSON ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Withdraw_Black_mule
    WHEN Call API Sending file withdraw black mule from aoc to ITMX
    Then Get File withdraw black mule GPG From ITMX
    Then Check Response Code WIthdraw Black Mule REQ And RES is Invalid_format_Missing_Parameter_mule_ref_code
    Then Deleted File all withdraw

TC003_009 Validate Missing required field - Code 7105 - Missing Parameter Field : mule_identity_id
   Given Chose to create file name black mule run number 400 - 600
    Then PreparaData black mule is 1 Data And Genarate all type of black mule and missing parameter field is Invalid_Missing_Parameter_field_mule_iden_id
    WHEN Encrypt File GPG To NITMX JSON ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Withdraw_Black_mule
    WHEN Call API Sending file withdraw black mule from aoc to ITMX
    Then Get File withdraw black mule GPG From ITMX
    Then Check Response Code WIthdraw Black Mule REQ And RES is Invalid_format_Missing_Parameter_mule_iden_id
    Then Deleted File all withdraw

TC003_010 Validate Missing required field - Code 7105 - Missing Parameter Field : mule_identity_type
   Given Chose to create file name black mule run number 400 - 600
    Then PreparaData black mule is 1 Data And Genarate all type of black mule and missing parameter field is Invalid_Missing_Parameter_field_mule_iden_type
    WHEN Encrypt File GPG To NITMX JSON ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Withdraw_Black_mule
    WHEN Call API Sending file withdraw black mule from aoc to ITMX
    Then Get File withdraw black mule GPG From ITMX
    Then Check Response Code WIthdraw Black Mule REQ And RES is Invalid_format_Missing_Parameter_mule_iden_type
    Then Deleted File all withdraw

TC003_012 Validate Missing required field - Code 7105 - Missing Parameter Field : mule_name
   Given Chose to create file name black mule run number 400 - 600
    Then PreparaData black mule is 1 Data And Genarate all type of black mule and missing parameter field is Invalid_Missing_Parameter_field_mule_name
    WHEN Encrypt File GPG To NITMX JSON ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Withdraw_Black_mule
    WHEN Call API Sending file withdraw black mule from aoc to ITMX
    Then Get File withdraw black mule GPG From ITMX
    Then Check Response Code WIthdraw Black Mule REQ And RES is Invalid_format_Missing_Parameter_mule_name
    Then Deleted File all withdraw

TC003_013 Validate Missing required field - Code 7105 - Missing Parameter Field : mule_surname
   Given Chose to create file name black mule run number 400 - 600
    Then PreparaData black mule is 1 Data And Genarate all type of black mule and missing parameter field is Invalid_Missing_Parameter_field_mule_surname
    WHEN Encrypt File GPG To NITMX JSON ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Withdraw_Black_mule
    WHEN Call API Sending file withdraw black mule from aoc to ITMX
    Then Get File withdraw black mule GPG From ITMX
    Then Check Response Code WIthdraw Black Mule REQ And RES is Invalid_format_Missing_Parameter_mule_surname
    Then Deleted File all withdraw

TC003_015 Validate Missing required field - Code 7105 - Missing Parameter Field : mule_nationality
   Given Chose to create file name black mule run number 400 - 600
    Then PreparaData black mule is 1 Data And Genarate all type of black mule and missing parameter field is Invalid_Missing_Parameter_field_mule_nationality
    WHEN Encrypt File GPG To NITMX JSON ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Withdraw_Black_mule
    WHEN Call API Sending file withdraw black mule from aoc to ITMX
    Then Get File withdraw black mule GPG From ITMX
    Then Check Response Code WIthdraw Black Mule REQ And RES is Invalid_format_Missing_Parameter_mule_nationality
    Then Deleted File all withdraw

TC003_016 Validate Missing required field - Code 7105 - Missing Parameter Field : police_case_id
   Given Chose to create file name black mule run number 400 - 600
    Then PreparaData black mule is 1 Data And Genarate all type of black mule and missing parameter field is Invalid_Missing_Parameter_field_po_case_id
    WHEN Encrypt File GPG To NITMX JSON ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Withdraw_Black_mule
    WHEN Call API Sending file withdraw black mule from aoc to ITMX
    Then Get File withdraw black mule GPG From ITMX
    Then Check Response Code WIthdraw Black Mule REQ And RES is Invalid_format_Missing_Parameter_po_case_id
    Then Deleted File all withdraw

TC003_017 Validate Missing required field - Code 7105 - Missing Parameter Field : police_case_type
   Given Chose to create file name black mule run number 400 - 600
    Then PreparaData black mule is 1 Data And Genarate all type of black mule and missing parameter field is Invalid_Missing_Parameter_field_po_case_type
    WHEN Encrypt File GPG To NITMX JSON ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Withdraw_Black_mule
    WHEN Call API Sending file withdraw black mule from aoc to ITMX
    Then Get File withdraw black mule GPG From ITMX
    Then Check Response Code WIthdraw Black Mule REQ And RES is Invalid_format_Missing_Parameter_po_case_type
    Then Deleted File all withdraw

TC003_018 Validate Missing required field - Code 7105 - Missing Parameter Field : police_case_report_date
   Given Chose to create file name black mule run number 400 - 600
    Then PreparaData black mule is 1 Data And Genarate all type of black mule and missing parameter field is Invalid_Missing_Parameter_field_po_case_rp_date
    WHEN Encrypt File GPG To NITMX JSON ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Withdraw_Black_mule
    WHEN Call API Sending file withdraw black mule from aoc to ITMX
    Then Get File withdraw black mule GPG From ITMX
    Then Check Response Code WIthdraw Black Mule REQ And RES is Invalid_format_Missing_Parameter_po_case_rp_date
    Then Deleted File all withdraw

TC003_019 Validate Missing required field - Code 7105 - Missing Parameter Field : mule_account_no
   Given Chose to create file name black mule run number 400 - 600
    Then PreparaData black mule is 1 Data And Genarate all type of black mule and missing parameter field is Invalid_Missing_Parameter_field_mule_acc_no
    WHEN Encrypt File GPG To NITMX JSON ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Withdraw_Black_mule
    WHEN Call API Sending file withdraw black mule from aoc to ITMX
    Then Get File withdraw black mule GPG From ITMX
    Then Check Response Code WIthdraw Black Mule REQ And RES is Invalid_format_Missing_Parameter_mule_acc_no
    Then Deleted File all withdraw

TC003_020 Validate Missing required field - Code 7105 - Missing Parameter Field : mule_account_type
   Given Chose to create file name black mule run number 400 - 600
    Then PreparaData black mule is 1 Data And Genarate all type of black mule and missing parameter field is Invalid_Missing_Parameter_field_mule_acc_type
    WHEN Encrypt File GPG To NITMX JSON ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Withdraw_Black_mule
    WHEN Call API Sending file withdraw black mule from aoc to ITMX
    Then Get File withdraw black mule GPG From ITMX
    Then Check Response Code WIthdraw Black Mule REQ And RES is Invalid_format_Missing_Parameter_mule_acc_type
    Then Deleted File all withdraw

TC003_021 Validate Missing required field - Code 7105 - Missing Parameter Field : mule_account_bankcode
   Given Chose to create file name black mule run number 400 - 600
    Then PreparaData black mule is 1 Data And Genarate all type of black mule and missing parameter field is Invalid_Missing_Parameter_field_mule_acc_bankcode
    WHEN Encrypt File GPG To NITMX JSON ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Withdraw_Black_mule
    WHEN Call API Sending file withdraw black mule from aoc to ITMX
    Then Get File withdraw black mule GPG From ITMX
    Then Check Response Code WIthdraw Black Mule REQ And RES is Invalid_format_Missing_Parameter_mule_acc_bankcode
    Then Deleted File all withdraw

TC003_022 Validate Missing required field - Code 7105 - Missing Parameter Field : mule_account_bankname
   Given Chose to create file name black mule run number 400 - 600
    Then PreparaData black mule is 1 Data And Genarate all type of black mule and missing parameter field is Invalid_Missing_Parameter_field_mule_acc_bankname
    WHEN Encrypt File GPG To NITMX JSON ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Withdraw_Black_mule
    WHEN Call API Sending file withdraw black mule from aoc to ITMX
    Then Get File withdraw black mule GPG From ITMX
    Then Check Response Code WIthdraw Black Mule REQ And RES is Invalid_format_Missing_Parameter_mule_acc_bankname
    Then Deleted File all withdraw

TC003_023 Validate Missing required field - Code 7105 - Missing Parameter Field : police_rank
   Given Chose to create file name black mule run number 400 - 600
    Then PreparaData black mule is 1 Data And Genarate all type of black mule and missing parameter field is Invalid_Missing_Parameter_field_po_rank
    WHEN Encrypt File GPG To NITMX JSON ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Withdraw_Black_mule
    WHEN Call API Sending file withdraw black mule from aoc to ITMX
    Then Get File withdraw black mule GPG From ITMX
    Then Check Response Code WIthdraw Black Mule REQ And RES is Invalid_format_Missing_Parameter_po_rank
    Then Deleted File all withdraw

TC003_024 Validate Missing required field - Code 7105 - Missing Parameter Field : police_name
   Given Chose to create file name black mule run number 400 - 600
    Then PreparaData black mule is 1 Data And Genarate all type of black mule and missing parameter field is Invalid_Missing_Parameter_field_po_name
    WHEN Encrypt File GPG To NITMX JSON ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Withdraw_Black_mule
    WHEN Call API Sending file withdraw black mule from aoc to ITMX
    Then Get File withdraw black mule GPG From ITMX
    Then Check Response Code WIthdraw Black Mule REQ And RES is Invalid_format_Missing_Parameter_po_name
    Then Deleted File all withdraw

TC003_025 Validate Missing required field - Code 7105 - Missing Parameter Field : police_surname
   Given Chose to create file name black mule run number 400 - 600
    Then PreparaData black mule is 1 Data And Genarate all type of black mule and missing parameter field is Invalid_Missing_Parameter_field_po_surname
    WHEN Encrypt File GPG To NITMX JSON ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Withdraw_Black_mule
    WHEN Call API Sending file withdraw black mule from aoc to ITMX
    Then Get File withdraw black mule GPG From ITMX
    Then Check Response Code WIthdraw Black Mule REQ And RES is Invalid_format_Missing_Parameter_po_surname
    Then Deleted File all withdraw

TC003_026 Validate Missing required field - Code 7105 - Missing Parameter Field : police_job_title
   Given Chose to create file name black mule run number 400 - 600
    Then PreparaData black mule is 1 Data And Genarate all type of black mule and missing parameter field is Invalid_Missing_Parameter_field_po_job_title
    WHEN Encrypt File GPG To NITMX JSON ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Withdraw_Black_mule
    WHEN Call API Sending file withdraw black mule from aoc to ITMX
    Then Get File withdraw black mule GPG From ITMX
    Then Check Response Code WIthdraw Black Mule REQ And RES is Invalid_format_Missing_Parameter_po_job_title
    Then Deleted File all withdraw

TC003_027 Validate Missing required field - Code 7105 - Missing Parameter Field : police_org
   Given Chose to create file name black mule run number 400 - 600
    Then PreparaData black mule is 1 Data And Genarate all type of black mule and missing parameter field is Invalid_Missing_Parameter_field_po_org
    WHEN Encrypt File GPG To NITMX JSON ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Withdraw_Black_mule
    WHEN Call API Sending file withdraw black mule from aoc to ITMX
    Then Get File withdraw black mule GPG From ITMX
    Then Check Response Code WIthdraw Black Mule REQ And RES is Invalid_format_Missing_Parameter_po_org
    Then Deleted File all withdraw

TC003_028 Validate Missing required field - Code 7105 - Missing Parameter Field : police_tel
   Given Chose to create file name black mule run number 400 - 600
    Then PreparaData black mule is 1 Data And Genarate all type of black mule and missing parameter field is Invalid_Missing_Parameter_field_po_tel
    WHEN Encrypt File GPG To NITMX JSON ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Withdraw_Black_mule
    WHEN Call API Sending file withdraw black mule from aoc to ITMX
    Then Get File withdraw black mule GPG From ITMX
    Then Check Response Code WIthdraw Black Mule REQ And RES is Invalid_format_Missing_Parameter_po_tel
    Then Deleted File all withdraw

TC003_029 Validate Missing required field - Code 7105 - Missing Parameter Field : police_email
   Given Chose to create file name black mule run number 400 - 600
    Then PreparaData black mule is 1 Data And Genarate all type of black mule and missing parameter field is Invalid_Missing_Parameter_field_po_email
    WHEN Encrypt File GPG To NITMX JSON ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Withdraw_Black_mule
    WHEN Call API Sending file withdraw black mule from aoc to ITMX
    Then Get File withdraw black mule GPG From ITMX
    Then Check Response Code WIthdraw Black Mule REQ And RES is Invalid_format_Missing_Parameter_po_email
    Then Deleted File all withdraw

TC003_031 Validate Mandatory field - Code 7105 - declare_uuid = null
   Given Chose to create file name black mule run number 400 - 600
    Then PreparaData black mule is 1 Data And Genarate all type of black mule and missing parameter field is Invalid_Parameter_field_uuid_null
    WHEN Encrypt File GPG To NITMX JSON ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Withdraw_Black_mule
    WHEN Call API Sending file withdraw black mule from aoc to ITMX
    Then Get File withdraw black mule GPG From ITMX
    Then Check Response Code WIthdraw Black Mule REQ And RES is Invalid_format_Non_processable_Entity
    Then Deleted File all withdraw

TC004_002 Validate Condition field - Code 7101 - field : declare_type_code - field declare_type : ปลดม้าดำรายบุคคล - Invalid Condition :declare_type_code dose not “1”  
   Given Chose to create file name black mule run number 400 - 600
    Then PreparaData black mule is 1 Data And Genarate all type of black mule and validate format or length is Invalid_field_de_type_code_not_must_be_1
    WHEN Encrypt File GPG To NITMX JSON ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Withdraw_Black_mule
    WHEN Call API Sending file withdraw black mule from aoc to ITMX
    Then Get File withdraw black mule GPG From ITMX
    Then Check Response Code WIthdraw Black Mule REQ And RES is Invalid_declare_type_code
    Then Deleted File all withdraw

TC004_004 Validate Condition field - Code 7102 - field : mule_Identity_id - Invalid Condition :Does not match the mule_Identity_id in the CFR mule list - เป็น ม้าน้ำตาล 
   Given Chose to create file name black mule run number 400 - 600
    Then PreparaData black mule is 1 Data And Genarate Valid Condition mule is BrownMule
    WHEN Encrypt File GPG To NITMX JSON ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Withdraw_Black_mule
    WHEN Call API Sending file withdraw black mule from aoc to ITMX
    Then Get File withdraw black mule GPG From ITMX
    Then Check Response Code WIthdraw Black Mule REQ And RES is Invalid_Does_not_match_mule_iden_ID_list
    Then Deleted File all withdraw

TC004_005 Validate Condition field - Code 7102 - field : mule_Identity_id - Invalid Condition :Does not match the mule_Identity_id in the CFR mule list - เป็นม้าเทาเข้มเงื่อนไข 1 > ปลดม้าเทา > ม้าขาว 
   Given Chose to create file name black mule run number 400 - 600
    Then PreparaData black mule is 1 Data And Genarate Valid Condition mule is WhiteMuleRule
    WHEN Encrypt File GPG To NITMX JSON ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Withdraw_Black_mule
    WHEN Call API Sending file withdraw black mule from aoc to ITMX
    Then Get File withdraw black mule GPG From ITMX
    Then Check Response Code WIthdraw Black Mule REQ And RES is Invalid_Does_not_match_mule_iden_ID_list
    Then Deleted File all withdraw

TC004_006 Validate Condition field - Code 7102 - field : mule_Identity_id - Invalid Condition :Does not match the mule_Identity_id in the CFR mule list - mule_Identity_id ไม่มีในระบบ CFR mule_Identity_id : 7229594553800 (ไม่มีในระบบ CFR) mule_ref_code : VW89439588 (ม้าดำ)
   Given Chose to create file name black mule run number 400 - 600
    Then PreparaData black mule is 1 Data And Genarate all type of black mule and validate format or length is Invalid_field_does_not_sys
    WHEN Encrypt File GPG To NITMX JSON ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Withdraw_Black_mule
    WHEN Call API Sending file withdraw black mule from aoc to ITMX
    Then Get File withdraw black mule GPG From ITMX
    Then Check Response Code WIthdraw Black Mule REQ And RES is Invalid_Does_not_match_mule_iden_ID_list
    Then Deleted File all withdraw

TC004_007 Validate Condition field - Code 7102 - field : mule_Identity_id - Invalid Condition :Does not match the mule_Identity_id in the CFR mule list - เป็นม้าดำ> ปลดม้าดำ > ม้าขาว > ปลดม้าดำ 
   Given Chose to create file name black mule run number 400 - 600
    Then PreparaData black mule is 1 Data And Genarate Valid Condition mule is BlackWithdrawAgain
    WHEN Encrypt File GPG To NITMX JSON ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Withdraw_Black_mule
    WHEN Call API Sending file withdraw black mule from aoc to ITMX
    Then Get File withdraw black mule GPG From ITMX
    Then Check Response Code WIthdraw Black Mule REQ And RES is Invalid_Does_not_match_mule_iden_ID_list
    Then Deleted File all withdraw

TC004_008 Validate Condition field - Code 7102 - field : mule_Identity_id - Invalid Condition :Does not match the mule_Identity_id in the CFR mule list เป็น ม้าเทาเข้ม เงื่อนไข 1 
   Given Chose to create file name black mule run number 400 - 600
    Then PreparaData black mule is 1 Data And Genarate Valid Condition mule is MuleRule1
    WHEN Encrypt File GPG To NITMX JSON ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Withdraw_Black_mule
    WHEN Call API Sending file withdraw black mule from aoc to ITMX
    Then Get File withdraw black mule GPG From ITMX
    Then Check Response Code WIthdraw Black Mule REQ And RES is Invalid_Does_not_match_mule_iden_ID_list
    Then Deleted File all withdraw

TC004_009 Validate Condition field - Code 7102 - field : mule_Identity_id - Invalid Condition :Does not match the mule_Identity_id in the CFR mule list เป็น ม้าเทาเข้ม เงื่อนไข 2
   Given Chose to create file name black mule run number 400 - 600
    Then PreparaData black mule is 1 Data And Genarate Valid Condition mule is MuleRule2
    WHEN Encrypt File GPG To NITMX JSON ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Withdraw_Black_mule
    WHEN Call API Sending file withdraw black mule from aoc to ITMX
    Then Get File withdraw black mule GPG From ITMX
    Then Check Response Code WIthdraw Black Mule REQ And RES is Invalid_Does_not_match_mule_iden_ID_list
    Then Deleted File all withdraw

TC004_011 Validate Condition field - Code 7104 - field : mule_identity_id , mule_ref_code - Invalid Condition mule_Identity_id : (Exact match Data) mule_ref_code : WAU18XAO05 (Invalid Exact match Data)
   Given Chose to create file name black mule run number 400 - 600
    Then PreparaData black mule is 1 Data And Genarate all type of black mule and validate format or length is Invalid_field_ref_code_exact
    WHEN Encrypt File GPG To NITMX JSON ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Withdraw_Black_mule
    WHEN Call API Sending file withdraw black mule from aoc to ITMX
    Then Get File withdraw black mule GPG From ITMX
    Then Check Response Code WIthdraw Black Mule REQ And RES is invalida_mule_iden_and_mule_ref_match_sys
    Then Deleted File all withdraw

TC004_013 Validate Condition field - Code 7109 - field : mule_ref_code, declare_type - Invalid Condition :mule_ref_code, declare_type are duplicate within the same file
   Given Chose to create file name black mule run number 400 - 600
    Then PreparaData black mule is 2 Data And Genarate duplicate same file
    WHEN Encrypt File GPG To NITMX JSON ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Withdraw_Black_mule
    WHEN Call API Sending file withdraw black mule from aoc to ITMX
    Then Get File withdraw black mule GPG From ITMX
    Then Check Response Code WIthdraw Black Mule REQ And RES is invalida_mule_iden_and_mule_ref_dup_same_file
    Then Deleted File all withdraw

TC004_018 Validate Condition field - Code 7102 - field : mule_identity_id, mule_identity_type - Invalid Condition mule_identity_id : 2772118293172 (13 digits ไม่อยู่ในลอจิกการคิดเลขบัตร) mule_identity_type : 1 บุคคลธรรมดา - คนไทย บุคคลธรรมดา
   Given Chose to create file name black mule run number 400 - 600
    Then PreparaData black mule is 1 Data And Genarate all type of black mule and validate format or length is Invalid_card_id_not_logis
    WHEN Encrypt File GPG To NITMX JSON ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Withdraw_Black_mule
    WHEN Call API Sending file withdraw black mule from aoc to ITMX
    Then Get File withdraw black mule GPG From ITMX
    Then Check Response Code WIthdraw Black Mule REQ And RES is Invalid_Does_not_match_mule_iden_ID_list
    Then Deleted File all withdraw

TC004_019 Validate Condition field - Code 7106 - field : mule_identity_id, mule_identity_type - Invalid Condition mule_identity_id : 2772118293172 (13 digits ไม่อยู่ในลอจิกการคิดเลขบัตร) mule_identity_type : 1 บุคคลธรรมดา - คนไทย บุคคลธรรมดา
   Given Chose to create file name black mule run number 400 - 600
    Then PreparaData black mule is 1 Data And Genarate all type of black mule and validate format or length is Invalid_mule_identity_id_and_type_must_2
    WHEN Encrypt File GPG To NITMX JSON ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Withdraw_Black_mule
    WHEN Call API Sending file withdraw black mule from aoc to ITMX
    Then Get File withdraw black mule GPG From ITMX
    Then Check Response Code WIthdraw Black Mule REQ And RES is Invalid_format_mule_identity_id
    Then Deleted File all withdraw

TC004_020 Validate Condition field - Code 7106 - field : mule_identity_id, mule_identity_type - Invalid Condition mule_identity_id : 평 안 하 다 (ระบุภาษาเกาหลี ผิด Format) mule_identity_type : 3 
   Given Chose to create file name black mule run number 400 - 600
    Then PreparaData black mule is 1 Data And Genarate all type of black mule and validate format or length is Invalid_mule_identity_id_and_type_must_3
    WHEN Encrypt File GPG To NITMX JSON ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Withdraw_Black_mule
    WHEN Call API Sending file withdraw black mule from aoc to ITMX
    Then Get File withdraw black mule GPG From ITMX
    Then Check Response Code WIthdraw Black Mule REQ And RES is Invalid_format_mule_identity_id
    Then Deleted File all withdraw

TC004_022 Validate Condition field - Code 7104 - Invalid Condition : mule_ref_code,mule_identity_id does not match 
   Given Chose to create file name black mule run number 400 - 600
    Then PreparaData black mule is 1 Data And Genarate all type of black mule and validate format or length is Invalid_mule_identity_id_and_ref_code_not_match
    WHEN Encrypt File GPG To NITMX JSON ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Withdraw_Black_mule
    WHEN Call API Sending file withdraw black mule from aoc to ITMX
    Then Get File withdraw black mule GPG From ITMX
    Then Check Response Code WIthdraw Black Mule REQ And RES is invalida_mule_iden_and_mule_ref_match_sys
    Then Deleted File all withdraw

TC004_024 Validate Condition field - Code 7107 - Invalid Condition : declare_reason_code,declare_reason does not match 
   Given Chose to create file name black mule run number 400 - 600
    Then PreparaData black mule is 1 Data And Genarate all type of black mule and validate format or length is Invalid_de_reason_code_and_de_reason_not_match
    WHEN Encrypt File GPG To NITMX JSON ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Withdraw_Black_mule
    WHEN Call API Sending file withdraw black mule from aoc to ITMX
    Then Get File withdraw black mule GPG From ITMX
    Then Check Response Code WIthdraw Black Mule REQ And RES is Invalid_value_condition_declare_reason
    Then Deleted File all withdraw

TC004_026 Validate Condition field - Code 7107 - field : withdraw_date - Invalid Condition : withdraw_date is more than current date. - current date +1 or Less than B.E.2500
   Given Chose to create file name black mule run number 400 - 600
    Then PreparaData black mule is 1 Data And Genarate all type of black mule and validate format or length is Invalid_withdraw_date_current_date_up1
    WHEN Encrypt File GPG To NITMX JSON ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Withdraw_Black_mule
    WHEN Call API Sending file withdraw black mule from aoc to ITMX
    Then Get File withdraw black mule GPG From ITMX
    Then Check Response Code WIthdraw Black Mule REQ And RES is Invalid_value_condition_withdraw_date
    Then Deleted File all withdraw

TC004_028 Validate Condition field - Code 7107 - field : police_case_report_date - Invalid Condition : Does not Between B.E.2500 - current date 2499-m-d
   Given Chose to create file name black mule run number 400 - 600
    Then PreparaData black mule is 1 Data And Genarate all type of black mule and validate format or length is Invalid_withdraw_date_current_date_year_2499
    WHEN Encrypt File GPG To NITMX JSON ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Withdraw_Black_mule
    WHEN Call API Sending file withdraw black mule from aoc to ITMX
    Then Get File withdraw black mule GPG From ITMX
    Then Check Response Code WIthdraw Black Mule REQ And RES is Invalid_value_condition_police_case_report_date
    Then Deleted File all withdraw

TC004_032 Validate Condition field - Code 7107 - field : mule_nationality - Invalid Condition : ระบุตัวย่อประเทศที่ไม่มีอยู่จริง EZ
   Given Chose to create file name black mule run number 400 - 600
    Then PreparaData black mule is 1 Data And Genarate all type of black mule and validate format or length is Invlid_mule_nationality
    WHEN Encrypt File GPG To NITMX JSON ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Withdraw_Black_mule
    WHEN Call API Sending file withdraw black mule from aoc to ITMX
    Then Get File withdraw black mule GPG From ITMX
    Then Check Response Code WIthdraw Black Mule REQ And RES is Invalid_condition_mule_nationality
    Then Deleted File all withdraw

TC004_034 Validate Condition field - Code 7107 - field : mule_birth_date - Invalid Condition : more than the current date (B.E.) - current date+1 
   Given Chose to create file name black mule run number 400 - 600
    Then PreparaData black mule is 1 Data And Genarate all type of black mule and validate format or length is Invlid_mule_birth_date
    WHEN Encrypt File GPG To NITMX JSON ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Withdraw_Black_mule
    WHEN Call API Sending file withdraw black mule from aoc to ITMX
    Then Get File withdraw black mule GPG From ITMX
    Then Check Response Code WIthdraw Black Mule REQ And RES is Invalid_condition_mule_birth_date
    Then Deleted File all withdraw

TC004_036 Validate Condition field - Code 7107 - field : withdraw_date - Invalid Condition : วันปลดม้าดำ (withdraw_date ) น้อยกว่าวันประกาศม้าดำ (aml_report_date)
   Given Chose to create file name black mule run number 400 - 600
    Then PreparaData black mule is 1 Data And Genarate all type of black mule and validate format or length is Invlid_withdraw_date
    WHEN Encrypt File GPG To NITMX JSON ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Withdraw_Black_mule
    WHEN Call API Sending file withdraw black mule from aoc to ITMX
    Then Get File withdraw black mule GPG From ITMX
    Then Check Response Code WIthdraw Black Mule REQ And RES is Invalid_value_condition_withdraw_date
    Then Deleted File all withdraw

TC004_037 Validate Condition field - Invalid Condition : Does not match the mule_Identity_id in the CFR mule list - สั่งปลดม้าดำ ด้วยข้อมูลเหมือนกัน แต่คนละไฟล์ (Process ไฟล์ในรอบเดียวกัน)
   Given Chose to create file name black mule run number 400 - 600
    Then PreparaData black mule is 1 Data And Genarate all type of black mule
    WHEN Encrypt File GPG To NITMX JSON ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Withdraw_Black_mule
    WHEN Call API Sending file withdraw black mule from aoc to ITMX
    Then Get File withdraw black mule GPG From ITMX
    Then Check Response Code WIthdraw Black Mule REQ And RES is SUCCESS
   Given Chose to create file name black mule run number 400 - 600
    Create File    ${CURDIR}../../../keywords/Data/${directory}.json    ${cleaned_data}
    WHEN Encrypt File GPG To NITMX JSON ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Withdraw_Black_mule
    WHEN Call API Sending file withdraw black mule from aoc to ITMX
    Then Get File withdraw black mule GPG From ITMX
    Then Check Response Code WIthdraw Black Mule REQ And RES is Invalid_Does_not_match_mule_iden_ID_list
    Then Deleted File all withdraw

TC005_003 Validate File Format /File name - Withdraw Black Mule Request file - Invalid Format file name : Fix character is not CFR_WithdrawBlackMule_ - Error Code: "6103" - Message: "INVALID_FILE_NAME_FORMAT"
   Given Invalid create file name black mule Invalid_Format_file_name
    Then PreparaData black mule is 1 Data And Genarate all type of black mule
    WHEN Encrypt File GPG To NITMX JSON ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Withdraw_Black_mule
    WHEN Call API Sending file withdraw black mule from aoc to ITMX
    Then Get File withdraw black mule GPG From ITMX
    Then Check Response Code WIthdraw Black Mule REQ And RES is Invalid_file_name
    Then Deleted File all withdraw

TC005_004 Validate File Format /File name - Withdraw Black Mule Request file Contain unsupported character in file name - Error Code: "6103" - Message: "INVALID_FILE_NAME_FORMAT"
   Given Invalid create file name black mule Invalid_Format_file_name_contain_unsup
    Then PreparaData black mule is 1 Data And Genarate all type of black mule
    WHEN Encrypt File GPG To NITMX JSON ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Withdraw_Black_mule
    WHEN Call API Sending file withdraw black mule from aoc to ITMX
    Then Get File withdraw black mule GPG From ITMX
    Then Check Response Code WIthdraw Black Mule REQ And RES is Invalid_file_name
    Then Deleted File all withdraw

TC005_006 Validate File Format /File name - Withdraw Black Mule Request file - Invalid Format file name : file name extension uppercase (่gpg file)
   Given Chose to create file name black mule run number 400 - 600
    Then PreparaData black mule is 1 Data And Genarate all type of black mule
    WHEN Encrypt File GPG To NITMX TH ${Filename_Req_blackmule} in file is json and file output is GPG
    WHEN login to sftp server and Put file by Withdraw_Black_mule_trigger_not_success
    WHEN Call API Sending file withdraw black mule from aoc to ITMX
    Then check file Withdraw_Black_mule to sftp server

TC005_007 Validate File Format /File name - Withdraw Black Mule Request file - Invalid Format file name : The abbreviation Request file is not REQ.
   Given Invalid create file name black mule Invalid_Format_file_name_not_REQ
    Then PreparaData black mule is 1 Data And Genarate all type of black mule
    WHEN Encrypt File GPG To NITMX JSON ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Withdraw_Black_mule
    WHEN Call API Sending file withdraw black mule from aoc to ITMX
    Then Get File withdraw black mule GPG From ITMX
    Then Check Response Code WIthdraw Black Mule REQ And RES is Invalid_file_name
    Then Deleted File all withdraw

TC005_008 Validate File Format /File name - Withdraw Black Mule Request file - Invalid Format file name :YYYYMMDD : 2568TS14
   Given Invalid create file name black mule Invalid_Format_file_name_date_character
    Then PreparaData black mule is 1 Data And Genarate all type of black mule
    WHEN Encrypt File GPG To NITMX JSON ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Withdraw_Black_mule
    WHEN Call API Sending file withdraw black mule from aoc to ITMX
    Then Get File withdraw black mule GPG From ITMX
    Then Check Response Code WIthdraw Black Mule REQ And RES is Invalid_file_name
    Then Deleted File all withdraw

TC005_009 Validate File Format /File name - Withdraw Black Mule Request file - Invalid Format file name :YYYYMMDD : 256805เทส
   Given Invalid create file name black mule Invalid_Format_file_name_date_character_thai
    Then PreparaData black mule is 1 Data And Genarate all type of black mule
    WHEN Encrypt File GPG To NITMX JSON ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Withdraw_Black_mule
    WHEN Call API Sending file withdraw black mule from aoc to ITMX
    Then Get File withdraw black mule GPG From ITMX
    Then Check Response Code WIthdraw Black Mule REQ And RES is Invalid_file_name
    Then Deleted File all withdraw

TC005_010 Validate File Format /File name - Withdraw Black Mule Request file - Invalid Format file name : <running> : 2 digit
   Given Invalid create file name black mule Invalid_Format_file_name_runing_2dig
    Then PreparaData black mule is 1 Data And Genarate all type of black mule
    WHEN Encrypt File GPG To NITMX JSON ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Withdraw_Black_mule
    WHEN Call API Sending file withdraw black mule from aoc to ITMX
    Then Get File withdraw black mule GPG From ITMX
    Then Check Response Code WIthdraw Black Mule REQ And RES is Invalid_file_name
    Then Deleted File all withdraw

TC005_011 Validate File Format /File name - Withdraw Black Mule Request file - Invalid Format file name : <running> : 4 digit
   Given Invalid create file name black mule Invalid_Format_file_name_runing_4dig
    Then PreparaData black mule is 1 Data And Genarate all type of black mule
    WHEN Encrypt File GPG To NITMX JSON ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Withdraw_Black_mule
    WHEN Call API Sending file withdraw black mule from aoc to ITMX
    Then Get File withdraw black mule GPG From ITMX
    Then Check Response Code WIthdraw Black Mule REQ And RES is Invalid_file_name
    Then Deleted File all withdraw

TC005_014 Validate file Format /File name - Withdraw Black Mule Request file - Number of records limits (่json file) - ข้อมูล Transaction > 5000 (declare_uuid) - Exceeded maximum number of documents or record
   Given Chose to create file name black mule run number 400 - 600
    Then PreparaData black mule file is 5000record 
    WHEN Encrypt File GPG To NITMX JSON ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Withdraw_Black_mule
    WHEN Call API Sending file withdraw black mule from aoc to ITMX
    Then Get File withdraw black mule GPG From ITMX
    Then Check Response Code WIthdraw Black Mule REQ And RES is Invalid_record
    Then Deleted File all withdraw

TC005_015 Validate File Format /File name - Withdraw Black Mule Request file - Maximum file size (MB) (.gpg) - .gpg file > 10 MB - Exceeded maximum file size - Error Code: 6107" - Message: "FILE_EXCEED_LIMIT" 10MB
   Given Chose to create file name black mule run number 400 - 600
    Then PreparaData black mule file is 10MB
    WHEN Encrypt File GPG To NITMX JSON ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Withdraw_Black_mule
    WHEN Call API Sending file withdraw black mule from aoc to ITMX
    Then Get File withdraw black mule GPG From ITMX
    Then Check Response Code WIthdraw Black Mule REQ And RES is Invalid_FILE_EXCEED_LIMIT
    Then Deleted File all withdraw

TC005_017 Validate File Format /File name - Withdraw Black Mule Request file - Invalid Format file name : Date on file name dose not system date - YYYYMMDD is not system date : 25680527 system date : 25680514
   Given Invalid create file name black mule Invalid_Format_file_name_dose_not_sys
    Then PreparaData black mule is 1 Data And Genarate all type of black mule
    WHEN Encrypt File GPG To NITMX JSON ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Withdraw_Black_mule
    WHEN Call API Sending file withdraw black mule from aoc to ITMX
    Then Get File withdraw black mule GPG From ITMX
    Then Check Response Code WIthdraw Black Mule REQ And RES is invalid_date_no_filename
    Then Deleted File all withdraw

TC005_018 Validate File Format /File name - Withdraw Black Mule Request file - Invalid Format file name : Date on file name dose not system date - YYYYMMDD is not system date : 25680527 system date : 25680514
   Given Chose to create file name black mule run number 400 - 600
    Then PreparaData black mule is 1 Data And Genarate all type of black mule
    WHEN Encrypt File GPG To NITMX JSON ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Withdraw_Black_mule
    WHEN Call API Sending file withdraw black mule from aoc to ITMX
    Remove File    ${CURDIR}../../../keywords/Data/${directory}.json
    Remove File    ${CURDIR}../../../keywords/Data/${directory}.gpg
    Remove file SSH withdraw black mule  
    Then PreparaData black mule is 1 Data And Genarate all type of black mule
    WHEN Encrypt File GPG To NITMX JSON ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Withdraw_Black_mule
    WHEN Call API Sending file withdraw black mule from aoc to ITMX
    Then Get File withdraw black mule GPG From ITMX for dup
    Then Check Response Code WIthdraw Black Mule REQ And RES is duplicate_filename
    Remove File    ${CURDIR}../../../keywords/Data/*

TC005_019 Validate File Format /File name - Withdraw Black Mule Request file - Invalid File Format : Sending data with zero record 
   Given Chose to create file name black mule run number 400 - 600
    Then formatJson
    WHEN Encrypt File GPG To NITMX JSON ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Withdraw_Black_mule
    WHEN Call API Sending file withdraw black mule from aoc to ITMX
    Then Get File withdraw black mule GPG From ITMX
    Then Check Response Code WIthdraw Black Mule REQ And RES is invalid_req_format
    Then Deleted File all withdraw

TC005_020 Validate File Format /File name - Withdraw Black Mule Request file - Invalid signature value - Private key does not AOC - Public key as ITMX
   Given Chose to create file name black mule run number 400 - 600
    Then PreparaData black mule is 1 Data And Genarate all type of black mule
    WHEN Invalid signature is Encrypt File GPG To NITMX TH ${Filename_Req_blackmule} Withdraw black
    WHEN login to sftp server and Put file by Withdraw_Black_mule
    WHEN Call API Sending file withdraw black mule from aoc to ITMX
    Then Get File withdraw black mule GPG From ITMX
    Then Check Response Code WIthdraw Black Mule REQ And RES is INVALID_SIGNATURE
    Then Deleted File all withdraw

# TC005_021 Validate File Format /File name - Withdraw Black Mule Request file - Invalid signature value - Private key does not AOC - Public key as ITMX
#    Given Chose to create file name black mule run number 400 - 600
#     Then PreparaData black mule is 1 Data And Genarate all type of black mule
#     WHEN Encrypt File GPG To NITMX JSON ${Filename_Req_blackmule}
#     WHEN login to sftp server and Put file by Withdraw_Black_mule
#     WHEN Call API Sending file withdraw black mule from aoc to ITMX
#     Then Get File withdraw black mule GPG From ITMX
#     Then Check Response Code WIthdraw Black Mule REQ And RES is INVALID_SIGNATURE
#     Then Deleted File all withdraw

TC005_022 Validate File Format /File name - Withdraw Black Mule Request file - Invalid Format file name : Invalid YYYYMMDD :25681313
   Given Invalid create file name black mule Invalid_Format_file_name_date_eng
    Then PreparaData black mule is 1 Data And Genarate all type of black mule
    WHEN Encrypt File GPG To NITMX JSON ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Withdraw_Black_mule
    WHEN Call API Sending file withdraw black mule from aoc to ITMX
    Then Get File withdraw black mule GPG From ITMX
    Then Check Response Code WIthdraw Black Mule REQ And RES is invalid_date_no_filename
    Then Deleted File all withdraw

TC005_023 Validate File Format /File name - Withdraw Black Mule Request file - Invalid Format file name : Invalid YYYYMMDD :20250514
   Given Invalid create file name black mule Invalid_Format_file_name_month
    Then PreparaData black mule is 1 Data And Genarate all type of black mule
    WHEN Encrypt File GPG To NITMX JSON ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Withdraw_Black_mule
    WHEN Call API Sending file withdraw black mule from aoc to ITMX
    Then Get File withdraw black mule GPG From ITMX
    Then Check Response Code WIthdraw Black Mule REQ And RES is invalid_date_no_filename
    Then Deleted File all withdraw

TC005_024 Validate File Format /File name - Withdraw Black Mule Request file - Invalid Format file name : Invalid YYYYMMDD :25681135
   Given Invalid create file name black mule Invalid_Format_file_name_day
    Then PreparaData black mule is 1 Data And Genarate all type of black mule
    WHEN Encrypt File GPG To NITMX JSON ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Withdraw_Black_mule
    WHEN Call API Sending file withdraw black mule from aoc to ITMX
    Then Get File withdraw black mule GPG From ITMX
    Then Check Response Code WIthdraw Black Mule REQ And RES is invalid_date_no_filename
    Then Deleted File all withdraw

TC005_025 Validate File Format /File name - Withdraw Black Mule Request file - Invalid Format file name : Duplicate records are encountered in a data set ส่งชุดข้อมูลเหมือนกันมา 2 ก้อนขึ้นไป 
   Given Chose to create file name black mule run number 400 - 600
    Then PreparaData black mule is 2 Data And Genarate item dup
    WHEN Encrypt File GPG To NITMX JSON ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Withdraw_Black_mule
    WHEN Call API Sending file withdraw black mule from aoc to ITMX
    Then Get File withdraw black mule GPG From ITMX
    Then Check Response Code WIthdraw Black Mule REQ And RES is SOME_ITEM_DUPLICATE
    Then Deleted File all withdraw

TC005_026 Validate File Format /File name - Withdraw Black Mule Request file - Invalid Format file name : Date on file name dose not system date - YYYYMMDD is not system date : 25670920
   Given Invalid create file name black mule Invalid_Format_file_name_year
    Then PreparaData black mule is 1 Data And Genarate all type of black mule
    WHEN Encrypt File GPG To NITMX JSON ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Withdraw_Black_mule
    WHEN Call API Sending file withdraw black mule from aoc to ITMX
    Then Get File withdraw black mule GPG From ITMX
    Then Check Response Code WIthdraw Black Mule REQ And RES is invalid_date_no_filename
    Then Deleted File all withdraw
