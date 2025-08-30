*** Settings ***
Resource  ../../resources/imports.robot

*** Test Cases ***

TC001_004 Validate Response Fail - Code 6A06 Invalid format (Appendix 1.4) - (1) case_id : 2=/2566,6547362<> @#104
    [Documentation]    Test Case Registry Black Mule
#    Given create File Name black mule
   Given Chose to create file name black mule step_runing_number
    Then Create black mule file csv
    Then PreparaData black mule is 2 Data And Genarate all type of black mule is invalid_case_id
    WHEN Encrypt File GPG To NITMX TH ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Black_mule
    WHEN Call API Sending file black mule from aoc to ITMX
    Then Get File black mule GPG From ITMX
    Then Check Response Code Black Mule REQ And RES For Negative
    Then Deleted File all

TC001_005 Validate Response Fail - Code 6A06 Invalid format (Appendix 1.3.12 ) - (2) case_date : 2022-01-32 , 2022-13-31 , 2024-03-TS
    [Documentation]    Test Case Registry Black Mule
#    Given create File Name black mule
   Given Chose to create file name black mule step_runing_number
    Then Create black mule file csv
    Then PreparaData black mule is 6 Data And Genarate all type of black mule is invalid_case_date
    WHEN Encrypt File GPG To NITMX TH ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Black_mule
    WHEN Call API Sending file black mule from aoc to ITMX
    Then Get File black mule GPG From ITMX
    Then Check Response Code Black Mule REQ And RES For Negative
    Then Deleted File all

TC001_006 Validate Response Fail- Code 6A06 Invalid format (Appendix 1.3.3) - (4) accountno : ทดสอบ1111
    [Documentation]    Test Case Registry Black Mule
#    Given create File Name black mule
   Given Chose to create file name black mule step_runing_number
    Then Create black mule file csv
    Then PreparaData black mule is 3 Data And Genarate all type of black mule is invalid_accountno
    WHEN Encrypt File GPG To NITMX TH ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Black_mule
    WHEN Call API Sending file black mule from aoc to ITMX
    Then Get File black mule GPG From ITMX
    Then Check Response Code Black Mule REQ And RES For Negative
    Then Deleted File all

TC001_007 Validate Response Fail - Code 6A06 Invalid format (Appendix 1.3.2) - (5) accounttype: Promเพย์
    [Documentation]    Test Case Registry Black Mule
#    Given create File Name black mule
   Given Chose to create file name black mule step_runing_number
    Then Create black mule file csv
    Then PreparaData black mule is 4 Data And Genarate all type of black mule is invalid_accounttype
    WHEN Encrypt File GPG To NITMX TH ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Black_mule
    WHEN Call API Sending file black mule from aoc to ITMX
    Then Get File black mule GPG From ITMX
    Then Check Response Code Black Mule REQ And RES For Negative
    Then Deleted File all

TC001_008 Validate Response Fail - Code 6A06 Invalid format (Appendix1.7) - (10) card_id 123%!@678ăƅčɗ
    [Documentation]    Test Case Registry Black Mule
#    Given create File Name black mule
   Given Chose to create file name black mule step_runing_number
    Then Create black mule file csv
    Then PreparaData black mule is 4 Data And Genarate all type of black mule is invalid_card_id
    WHEN Encrypt File GPG To NITMX TH ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Black_mule
    WHEN Call API Sending file black mule from aoc to ITMX
    Then Get File black mule GPG From ITMX
    Then Check Response Code Black Mule REQ And RES For Negative
    Then Deleted File all

TC001_009 Validate Response Fail - Code 6A06 Invalid format (Appendix1.3.1) - (11) ref_code : cc123#$!&%456
    [Documentation]    Test Case Registry Black Mule
#    Given create File Name black mule
   Given Chose to create file name black mule step_runing_number
    Then Create black mule file csv
    Then PreparaData black mule is 3 Data And Genarate all type of black mule is invalid_ref_code
    WHEN Encrypt File GPG To NITMX TH ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Black_mule
    WHEN Call API Sending file black mule from aoc to ITMX
    Then Get File black mule GPG From ITMX
    Then Check Response Code Black Mule REQ And RES For Negative
    Then Deleted File all

TC001_010 Validate Response Fail - Code 6A06 Invalid format (Appendix1.7) - (12) title : 12345%!@678ăƅčɗ
    [Documentation]    Test Case Registry Black Mule
#    Given create File Name black mule
   Given Chose to create file name black mule step_runing_number
    Then Create black mule file csv
    Then PreparaData black mule is 3 Data And Genarate all type of black mule is invalid_title
    WHEN Encrypt File GPG To NITMX TH ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Black_mule
    WHEN Call API Sending file black mule from aoc to ITMX
    Then Get File black mule GPG From ITMX
    Then Check Response Code Black Mule REQ And RES For Negative
    Then Deleted File all

TC001_011 Validate Response Fail - Code 6A06 Invalid format (Appendix1.7) - (13) name : 12345%!@678ăƅčɗ
    [Documentation]    Test Case Registry Black Mule
#    Given create File Name black mule
   Given Chose to create file name black mule step_runing_number
    Then Create black mule file csv
    Then PreparaData black mule is 3 Data And Genarate all type of black mule is invalid_name
    WHEN Encrypt File GPG To NITMX TH ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Black_mule
    WHEN Call API Sending file black mule from aoc to ITMX
    Then Get File black mule GPG From ITMX
    Then Check Response Code Black Mule REQ And RES For Negative
    Then Deleted File all

TC001_012 Validate Response Fail - Code 6A06 Invalid format (Appendix1.7) - (14) midname : 12345%!@678ăƅčɗ
    [Documentation]    Test Case Registry Black Mule
#    Given create File Name black mule
   Given Chose to create file name black mule step_runing_number
    Then Create black mule file csv
    Then PreparaData black mule is 3 Data And Genarate all type of black mule is invalid_midname
    WHEN Encrypt File GPG To NITMX TH ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Black_mule
    WHEN Call API Sending file black mule from aoc to ITMX
    Then Get File black mule GPG From ITMX
    Then Check Response Code Black Mule REQ And RES For Negative
    Then Deleted File all

TC001_013 Validate Response Fail - Code 6A06 Invalid format (Appendix1.7) - (15) surname : 12345%!@678ăƅčɗ
    [Documentation]    Test Case Registry Black Mule
#    Given create File Name black mule
   Given Chose to create file name black mule step_runing_number
    Then Create black mule file csv
    Then PreparaData black mule is 3 Data And Genarate all type of black mule is invalid_surname
    WHEN Encrypt File GPG To NITMX TH ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Black_mule
    WHEN Call API Sending file black mule from aoc to ITMX
    Then Get File black mule GPG From ITMX
    Then Check Response Code Black Mule REQ And RES For Negative
    Then Deleted File all

TC001_014 Validate Response Fail - Code 6A06 Invalid format (Appendix1.7) - (16) eng_name : 12345%!@678ăƅčɗ
    [Documentation]    Test Case Registry Black Mule
#    Given create File Name black mule
   Given Chose to create file name black mule step_runing_number
    Then Create black mule file csv
    Then PreparaData black mule is 3 Data And Genarate all type of black mule is invalid_eng_name
    WHEN Encrypt File GPG To NITMX TH ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Black_mule
    WHEN Call API Sending file black mule from aoc to ITMX
    Then Get File black mule GPG From ITMX
    Then Check Response Code Black Mule REQ And RES For Negative
    Then Deleted File all

TC001_015 Validate Response Fail - Code 6A06 Invalid format (Appendix1.7) - (17) eng_midname : 12345%!@678ăƅčɗ
    [Documentation]    Test Case Registry Black Mule
#    Given create File Name black mule
   Given Chose to create file name black mule step_runing_number
    Then Create black mule file csv
    Then PreparaData black mule is 3 Data And Genarate all type of black mule is invalid_eng_midname
    WHEN Encrypt File GPG To NITMX TH ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Black_mule
    WHEN Call API Sending file black mule from aoc to ITMX
    Then Get File black mule GPG From ITMX
    Then Check Response Code Black Mule REQ And RES For Negative
    Then Deleted File all

TC001_016 Validate Response Fail - Code 6A06 Invalid format (Appendix1.7) - (18) eng_surname : 12345%!@678ăƅčɗ
    [Documentation]    Test Case Registry Black Mule
#    Given create File Name black mule
   Given Chose to create file name black mule step_runing_number
    Then Create black mule file csv
    Then PreparaData black mule is 3 Data And Genarate all type of black mule is invalid_eng_surname
    WHEN Encrypt File GPG To NITMX TH ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Black_mule
    WHEN Call API Sending file black mule from aoc to ITMX
    Then Get File black mule GPG From ITMX
    Then Check Response Code Black Mule REQ And RES For Negative
    Then Deleted File all

TC001_017 Validate Response Fail - Code 6A06 Invalid format (Appendix1.7) - (19) birth_date : 12345%!@678ăƅčɗ
    [Documentation]    Test Case Registry Black Mule
#    Given create File Name black mule
   Given Chose to create file name black mule step_runing_number
    Then Create black mule file csv
    Then PreparaData black mule is 3 Data And Genarate all type of black mule is invalid_birth_date
    WHEN Encrypt File GPG To NITMX TH ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Black_mule
    WHEN Call API Sending file black mule from aoc to ITMX
    Then Get File black mule GPG From ITMX
    Then Check Response Code Black Mule REQ And RES For Negative
    Then Deleted File all

TC001_018 Validate Response Fail - Code 6A06 Invalid format (Appendix1.7) - (20) nationality : th
    [Documentation]    Test Case Registry Black Mule
#    Given create File Name black mule
   Given Chose to create file name black mule step_runing_number
    Then Create black mule file csv
    Then PreparaData black mule is 3 Data And Genarate all type of black mule is invalid_nationality
    WHEN Encrypt File GPG To NITMX TH ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Black_mule
    WHEN Call API Sending file black mule from aoc to ITMX
    Then Get File black mule GPG From ITMX
    Then Check Response Code Black Mule REQ And RES For Negative
    Then Deleted File all

TC001_019 Validate Response Fail - Code 6A06 Invalid format (Appendix1.7) - (21) note : 12345%!@678ăƅčɗ
    [Documentation]    Test Case Registry Black Mule
#    Given create File Name black mule
   Given Chose to create file name black mule step_runing_number
    Then Create black mule file csv
    Then PreparaData black mule is 3 Data And Genarate all type of black mule is invalid_note
    WHEN Encrypt File GPG To NITMX TH ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Black_mule
    WHEN Call API Sending file black mule from aoc to ITMX
    Then Get File black mule GPG From ITMX
    Then Check Response Code Black Mule REQ And RES For Negative
    Then Deleted File all

TC001_020 Validate Response Fail - Code 6A06 Invalid format (Appendix1.7) - (22) other : 12345%!@678ăƅčɗ
    [Documentation]    Test Case Registry Black Mule
#    Given create File Name black mule
   Given Chose to create file name black mule step_runing_number
    Then Create black mule file csv
    Then PreparaData black mule is 3 Data And Genarate all type of black mule is invalid_other
    WHEN Encrypt File GPG To NITMX TH ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Black_mule
    WHEN Call API Sending file black mule from aoc to ITMX
    Then Get File black mule GPG From ITMX
    Then Check Response Code Black Mule REQ And RES For Negative
    Then Deleted File all

TC001_021 Validate Response Fail - Code 6A06 Invalid format (Appendix1.7) - (23) rank : 12345%!@678ăƅčɗ
    [Documentation]    Test Case Registry Black Mule
#    Given create File Name black mule
   Given Chose to create file name black mule step_runing_number
    Then Create black mule file csv
    Then PreparaData black mule is 3 Data And Genarate all type of black mule is invalid_rank
    WHEN Encrypt File GPG To NITMX TH ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Black_mule
    WHEN Call API Sending file black mule from aoc to ITMX
    Then Get File black mule GPG From ITMX
    Then Check Response Code Black Mule REQ And RES For Negative
    Then Deleted File all

TC001_022 Validate Response Fail - Code 6A06 Invalid format (Appendix1.7) - (24) pol_name : 12345%!@678ăƅčɗ
    [Documentation]    Test Case Registry Black Mule
#    Given create File Name black mule
   Given Chose to create file name black mule step_runing_number
    Then Create black mule file csv
    Then PreparaData black mule is 3 Data And Genarate all type of black mule is invalid_pol_name
    WHEN Encrypt File GPG To NITMX TH ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Black_mule
    WHEN Call API Sending file black mule from aoc to ITMX
    Then Get File black mule GPG From ITMX
    Then Check Response Code Black Mule REQ And RES For Negative
    Then Deleted File all

TC001_023 Validate Response Fail - Code 6A06 Invalid format (Appendix1.7) - (25) pol_surname : 12345%!@678ăƅčɗ
    [Documentation]    Test Case Registry Black Mule
   #    Given create File Name black mule
   Given Chose to create file name black mule step_runing_number
    Then Create black mule file csv
    Then PreparaData black mule is 3 Data And Genarate all type of black mule is invalid_pol_surname
    WHEN Encrypt File GPG To NITMX TH ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Black_mule
    WHEN Call API Sending file black mule from aoc to ITMX
    Then Get File black mule GPG From ITMX
    Then Check Response Code Black Mule REQ And RES For Negative
    Then Deleted File all

TC001_024 Validate Response Fail - Code 6A06 Invalid format (Appendix1.7) - (26) pol_job_title : 12345%!@678ăƅčɗ
    [Documentation]    Test Case Registry Black Mule
   #    Given create File Name black mule
   Given Chose to create file name black mule step_runing_number
    Then Create black mule file csv
    Then PreparaData black mule is 3 Data And Genarate all type of black mule is invalid_pol_job_title
    WHEN Encrypt File GPG To NITMX TH ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Black_mule
    WHEN Call API Sending file black mule from aoc to ITMX
    Then Get File black mule GPG From ITMX
    Then Check Response Code Black Mule REQ And RES For Negative
    Then Deleted File all

TC001_025 Validate Response Fail - Code 6A06 Invalid format (Appendix1.7) - (27) pol_org 
    [Documentation]    Test Case Registry Black Mule
   #    Given create File Name black mule
   Given Chose to create file name black mule step_runing_number
    Then Create black mule file csv
    Then PreparaData black mule is 3 Data And Genarate all type of black mule is invalid_pol_org
    WHEN Encrypt File GPG To NITMX TH ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Black_mule
    WHEN Call API Sending file black mule from aoc to ITMX
    Then Get File black mule GPG From ITMX
    Then Check Response Code Black Mule REQ And RES For Negative
    Then Deleted File all

TC001_026 Validate Response Fail - Code 6A06 Invalid format (Appendix1.7) - (28) pol_tel 
    [Documentation]    Test Case Registry Black Mule
   #    Given create File Name black mule
   Given Chose to create file name black mule step_runing_number
    Then Create black mule file csv
    Then PreparaData black mule is 3 Data And Genarate all type of black mule is invalid_pol_tel
    WHEN Encrypt File GPG To NITMX TH ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Black_mule
    WHEN Call API Sending file black mule from aoc to ITMX
    Then Get File black mule GPG From ITMX
    Then Check Response Code Black Mule REQ And RES For Negative
    Then Deleted File all

TC001_027 Validate Response Fail - Code 6A06 Invalid format (Appendix1.7) - (29) aml_report_date : 2025/03/01
    [Documentation]    Test Case Registry Black Mule
   #    Given create File Name black mule
   Given Chose to create file name black mule step_runing_number
    Then Create black mule file csv
    Then PreparaData black mule is 3 Data And Genarate all type of black mule is invalid_aml_report_date
    WHEN Encrypt File GPG To NITMX TH ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Black_mule
    WHEN Call API Sending file black mule from aoc to ITMX
    Then Get File black mule GPG From ITMX
    Then Check Response Code Black Mule REQ And RES For Negative
    Then Deleted File all

TC001_028 Validate Response Fail - Code 6A06 Invalid format - Invalid Length : case_id > 30 digits - (1) case_id : 23/2566,654736224/2566,65473632
    [Documentation]    Test Case Registry Black Mule
   #    Given create File Name black mule
   Given Chose to create file name black mule step_runing_number
    Then Create black mule file csv
    Then PreparaData black mule is 5 Data And Genarate all type of black mule is invalid_length_case_id
    WHEN Encrypt File GPG To NITMX TH ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Black_mule
    WHEN Call API Sending file black mule from aoc to ITMX
    Then Get File black mule GPG From ITMX
    Then Check Response Code Black Mule REQ And RES For Negative
    Then Deleted File all

TC001_029 Validate Response Fail - Code 6A06 Invalid format - Invalid Length : case_date > 10 digits - (2) case_date : 2025-01-155
    [Documentation]    Test Case Registry Black Mule
   #    Given create File Name black mule
   Given Chose to create file name black mule step_runing_number
    Then Create black mule file csv
    Then PreparaData black mule is 5 Data And Genarate all type of black mule is invalid_length_case_date
    WHEN Encrypt File GPG To NITMX TH ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Black_mule
    WHEN Call API Sending file black mule from aoc to ITMX
    Then Get File black mule GPG From ITMX
    Then Check Response Code Black Mule REQ And RES For Negative
    Then Deleted File all

TC001_030 Validate Response Fail - Code 6A06 Invalid format - Invalid Length : case_type > 2 digits - (3) case_type : 284
    [Documentation]    Test Case Registry Black Mule
   #    Given create File Name black mule
   Given Chose to create file name black mule step_runing_number
    Then Create black mule file csv
    Then PreparaData black mule is 5 Data And Genarate all type of black mule is invalid_length_case_type
    WHEN Encrypt File GPG To NITMX TH ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Black_mule
    WHEN Call API Sending file black mule from aoc to ITMX
    Then Get File black mule GPG From ITMX
    Then Check Response Code Black Mule REQ And RES For Negative
    Then Deleted File all

TC001_031 Validate Response Fail - Code 6A06 Invalid format - Invalid Length : accountno > 34 digits - (4) accountno : 11038005571103800558110380055911035
    [Documentation]    Test Case Registry Black Mule
   #    Given create File Name black mule
   Given Chose to create file name black mule step_runing_number
    Then Create black mule file csv
    Then PreparaData black mule is 5 Data And Genarate all type of black mule is invalid_length_accountno
    WHEN Encrypt File GPG To NITMX TH ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Black_mule
    WHEN Call API Sending file black mule from aoc to ITMX
    Then Get File black mule GPG From ITMX
    Then Check Response Code Black Mule REQ And RES For Negative
    Then Deleted File all

TC001_032 Validate Response Fail - Code 6A06 Invalid format - Invalid Length : accounttype > 20 digits - (5) accounttype : BankPromptPayWalletiD
    [Documentation]    Test Case Registry Black Mule
   #    Given create File Name black mule
   Given Chose to create file name black mule step_runing_number
    Then Create black mule file csv
    Then PreparaData black mule is 5 Data And Genarate all type of black mule is invalid_length_accounttype
    WHEN Encrypt File GPG To NITMX TH ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Black_mule
    WHEN Call API Sending file black mule from aoc to ITMX
    Then Get File black mule GPG From ITMX
    Then Check Response Code Black Mule REQ And RES For Negative
    Then Deleted File all

TC001_033 Validate Response Fail - Code 6A06 Invalid format - Invalid Length : bankcode > 3 digits - (6) bankcode : 0144
    [Documentation]    Test Case Registry Black Mule
   #    Given create File Name black mule
   Given Chose to create file name black mule step_runing_number
    Then Create black mule file csv
    Then PreparaData black mule is 5 Data And Genarate all type of black mule is invalid_length_bankcode
    WHEN Encrypt File GPG To NITMX TH ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Black_mule
    WHEN Call API Sending file black mule from aoc to ITMX
    Then Get File black mule GPG From ITMX
    Then Check Response Code Black Mule REQ And RES For Negative
    Then Deleted File all

TC001_034 Validate Response Fail - Code 6A06 Invalid format - Invalid Length : bankname > 10 digits - (7) bankname : SCBSCBSCBSC
    [Documentation]    Test Case Registry Black Mule
   #    Given create File Name black mule
   Given Chose to create file name black mule step_runing_number
    Then Create black mule file csv
    Then PreparaData black mule is 5 Data And Genarate all type of black mule is invalid_length_bankname
    WHEN Encrypt File GPG To NITMX TH ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Black_mule
    WHEN Call API Sending file black mule from aoc to ITMX
    Then Get File black mule GPG From ITMX
    Then Check Response Code Black Mule REQ And RES For Negative
    Then Deleted File all

TC001_035 Validate Response Fail - Code 6A06 Invalid format - Invalid Length : entity_type > 10 digits - (8) entity_type : PERSONNNNNQ
    [Documentation]    Test Case Registry Black Mule
   #    Given create File Name black mule
   Given Chose to create file name black mule step_runing_number
    Then Create black mule file csv
    Then PreparaData black mule is 5 Data And Genarate all type of black mule is invalid_length_entity_type
    WHEN Encrypt File GPG To NITMX TH ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Black_mule
    WHEN Call API Sending file black mule from aoc to ITMX
    Then Get File black mule GPG From ITMX
    Then Check Response Code Black Mule REQ And RES For Negative
    Then Deleted File all

TC001_036 Validate Response Fail - Code 6A06 Invalid format - Invalid Length : id_type > 15 digits - (9) id_type : National IDDNatT
    [Documentation]    Test Case Registry Black Mule
   #    Given create File Name black mule
   Given Chose to create file name black mule step_runing_number
    Then Create black mule file csv
    Then PreparaData black mule is 5 Data And Genarate all type of black mule is invalid_length_id_type
    WHEN Encrypt File GPG To NITMX TH ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Black_mule
    WHEN Call API Sending file black mule from aoc to ITMX
    Then Get File black mule GPG From ITMX
    Then Check Response Code Black Mule REQ And RES For Negative
    Then Deleted File all

TC001_037 Validate Response Fail - Code 6A06 Invalid format - Invalid Length : card_id > 35 digits - (10) card_id : 442123716653400000000348342428284848
    [Documentation]    Test Case Registry Black Mule
   #    Given create File Name black mule
   Given Chose to create file name black mule step_runing_number
    Then Create black mule file csv
    Then PreparaData black mule is 5 Data And Genarate all type of black mule is invalid_length_card_id
    WHEN Encrypt File GPG To NITMX TH ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Black_mule
    WHEN Call API Sending file black mule from aoc to ITMX
    Then Get File black mule GPG From ITMX
    Then Check Response Code Black Mule REQ And RES For Negative
    Then Deleted File all

TC001_038 Validate Response Fail - Code 6A06 Invalid format - Invalid Length : ref_code > 10 digits - (11) ref_code : AB123456556
    [Documentation]    Test Case Registry Black Mule
   #    Given create File Name black mule
   Given Chose to create file name black mule step_runing_number
    Then Create black mule file csv
    Then PreparaData black mule is 5 Data And Genarate all type of black mule is invalid_length_ref_code
    WHEN Encrypt File GPG To NITMX TH ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Black_mule
    WHEN Call API Sending file black mule from aoc to ITMX
    Then Get File black mule GPG From ITMX
    Then Check Response Code Black Mule REQ And RES For Negative
    Then Deleted File all

TC001_039 Validate Response Fail - Code 6A06 Invalid format - Invalid Length : title > 50 digits - (12) title : นาย นางสาว นาง ว่าที่ร้อยตรีนาย นางสาว นาง ว่าที่รต
    [Documentation]    Test Case Registry Black Mule
   #    Given create File Name black mule
   Given Chose to create file name black mule step_runing_number
    Then Create black mule file csv
    Then PreparaData black mule is 5 Data And Genarate all type of black mule is invalid_length_title
    WHEN Encrypt File GPG To NITMX TH ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Black_mule
    WHEN Call API Sending file black mule from aoc to ITMX
    Then Get File black mule GPG From ITMX
    Then Check Response Code Black Mule REQ And RES
    Then Deleted File all

TC001_040 Validate Response Fail - Code 6A06 Invalid format - Invalid Length : name > 100 digits - (13) name : บริวัตรบริวัตรบริวัตรบริวัตรบริวัตรบริวัตรบริวัตรบริวัตรบริวัตรบริวัตรบริวัตรบริวัตรบริวัตรบริวัตรบรน
    [Documentation]    Test Case Registry Black Mule
   #    Given create File Name black mule
   Given Chose to create file name black mule step_runing_number
    Then Create black mule file csv
    Then PreparaData black mule is 5 Data And Genarate all type of black mule is invalid_length_name
    WHEN Encrypt File GPG To NITMX TH ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Black_mule
    WHEN Call API Sending file black mule from aoc to ITMX
    Then Get File black mule GPG From ITMX
    Then Check Response Code Black Mule REQ And RES
    Then Deleted File all

TC001_041 Validate Response Fail - Code 6A06 Invalid format - Invalid Length : midname > 100 digits - (14) midname : ภณภณภณภณภณภณภณภณภณภณภณภณภณภณภณภณภณภณภณภณภณภณภณภณภณภณภณภณภณภณภณภณภณภณภณภณภณภณภณภณภณภณภณภณภณภณภณภณภณภณภ
    [Documentation]    Test Case Registry Black Mule
   #    Given create File Name black mule
   Given Chose to create file name black mule step_runing_number
    Then Create black mule file csv
    Then PreparaData black mule is 5 Data And Genarate all type of black mule is invalid_length_midname
    WHEN Encrypt File GPG To NITMX TH ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Black_mule
    WHEN Call API Sending file black mule from aoc to ITMX
    Then Get File black mule GPG From ITMX
    Then Check Response Code Black Mule REQ And RES
    Then Deleted File all

TC001_042 Validate Response Fail - Code 6A06 Invalid format - Invalid Length : surname > 100 digits - (15) surname : ก้องเกษมทรัพย์ก้องเกษมทรัพย์ก้องเกษมทรัพย์ก้องเกษมทรัพย์ก้องเกษมทรัพย์ก้องเกษมทรัพย์ก้องเกษมทรัพย์ก้พ
    [Documentation]    Test Case Registry Black Mule
   #    Given create File Name black mule
   Given Chose to create file name black mule step_runing_number
    Then Create black mule file csv
    Then PreparaData black mule is 5 Data And Genarate all type of black mule is invalid_length_surname
    WHEN Encrypt File GPG To NITMX TH ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Black_mule
    WHEN Call API Sending file black mule from aoc to ITMX
    Then Get File black mule GPG From ITMX
    Then Check Response Code Black Mule REQ And RES
    Then Deleted File all

TC001_043 Validate Response Fail - Code 6A06 - Invalid Length : eng_name > 100 digits - (16) eng_name : BoriwanBoriwanBoriwanBoriwanBoriwanBoriwanBoriwanBoriwanBoriwanBoriwanBoriwanBoriwanBoriwanBoriwanBoW
    [Documentation]    Test Case Registry Black Mule
   #    Given create File Name black mule
   Given Chose to create file name black mule step_runing_number
    Then Create black mule file csv
    Then PreparaData black mule is 5 Data And Genarate all type of black mule is invalid_length_eng_name
    WHEN Encrypt File GPG To NITMX TH ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Black_mule
    WHEN Call API Sending file black mule from aoc to ITMX
    Then Get File black mule GPG From ITMX
    Then Check Response Code Black Mule REQ And RES
    Then Deleted File all

TC001_044 Validate Response Fail - Code 6A06 - Invalid Length : eng_midname > 100 digits - (17) eng_midname : PondPondPondPondPondPondPondPondPondPondPondPondPondPondPondPondPondPondPondPondPondPondPondPondPondD
    [Documentation]    Test Case Registry Black Mule
   #    Given create File Name black mule
   Given Chose to create file name black mule step_runing_number
    Then Create black mule file csv
    Then PreparaData black mule is 5 Data And Genarate all type of black mule is invalid_length_eng_midname
    WHEN Encrypt File GPG To NITMX TH ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Black_mule
    WHEN Call API Sending file black mule from aoc to ITMX
    Then Get File black mule GPG From ITMX
    Then Check Response Code Black Mule REQ And RES
    Then Deleted File all

TC001_045 Validate Response Fail - Code 6A06 - Invalid Length : eng_surname > 100 digits - (18) eng_surname : GongkasemsabGongkasemsabGongkasemsabGongkasemsabGongkasemsabGongkasemsabGongkasemsabGongkasemsabGongG
    [Documentation]    Test Case Registry Black Mule
   #    Given create File Name black mule
   Given Chose to create file name black mule step_runing_number
    Then Create black mule file csv
    Then PreparaData black mule is 5 Data And Genarate all type of black mule is invalid_length_eng_surname
    WHEN Encrypt File GPG To NITMX TH ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Black_mule
    WHEN Call API Sending file black mule from aoc to ITMX
    Then Get File black mule GPG From ITMX
    Then Check Response Code Black Mule REQ And RES
    Then Deleted File all

TC001_046 Validate Response Fail - Code 6A06 - Invalid Length : birth_date > 10 digits - (19) birth_date : 1996-22-011
   #    Given create File Name black mule
   Given Chose to create file name black mule step_runing_number
    Then Create black mule file csv
    Then PreparaData black mule is 5 Data And Genarate all type of black mule is invalid_length_birth_date
    WHEN Encrypt File GPG To NITMX TH ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Black_mule
    WHEN Call API Sending file black mule from aoc to ITMX
    Then Get File black mule GPG From ITMX
    Then Check Response Code Black Mule REQ And RES
    Then Deleted File all

TC001_047 Validate Response Fail - Code 6A06 - Invalid Length : nationality > 2 digits - (20) nationality : THH
   #    Given create File Name black mule
   Given Chose to create file name black mule step_runing_number
    Then Create black mule file csv
    Then PreparaData black mule is 5 Data And Genarate all type of black mule is invalid_length_nationality
    WHEN Encrypt File GPG To NITMX TH ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Black_mule
    WHEN Call API Sending file black mule from aoc to ITMX
    Then Get File black mule GPG From ITMX
    Then Check Response Code Black Mule REQ And RES
    Then Deleted File all

TC001_048 Validate Response Fail - Code 6A06 - Invalid Length : note > 1000 digits - (21) note : Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search forrt
   #    Given create File Name black mule
   Given Chose to create file name black mule step_runing_number
    Then Create black mule file csv
    Then PreparaData black mule is 5 Data And Genarate all type of black mule is invalid_length_note
    WHEN Encrypt File GPG To NITMX TH ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Black_mule
    WHEN Call API Sending file black mule from aoc to ITMX
    Then Get File black mule GPG From ITMX
    Then Check Response Code Black Mule REQ And RES
    Then Deleted File all

TC001_049 Validate Response Fail - Code 6A06 - Invalid Length : other > 200 digits - (22) other : รับเลขคดี,ชั้นอัยการรับเลขคดี,ชั้นอัยการรับเลขคดี,ชั้นอัยการรับเลขคดี,ชั้นอัยการรับเลขคดี,ชั้นอัยการรับเลขคดี,ชั้นอัยการรับเลขคดี,ชั้นอัยการรับเลขคดี,ชั้นอัยการรับเลขคดี,ชั้นอัยการรับเลขคดี,ชั้นอัยการฟ
   #    Given create File Name black mule
   Given Chose to create file name black mule step_runing_number
    Then Create black mule file csv
    Then PreparaData black mule is 5 Data And Genarate all type of black mule is invalid_length_other
    WHEN Encrypt File GPG To NITMX TH ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Black_mule
    WHEN Call API Sending file black mule from aoc to ITMX
    Then Get File black mule GPG From ITMX
    Then Check Response Code Black Mule REQ And RES
    Then Deleted File all

TC001_050 Validate Response Fail - Code 6A06 - Invalid Length : rank > 50 digits - (23) rank : พล.ต.อ. พล.ต.ท. พล.ต.ต. พ.ต.อ. พ.ต.ท. พ.ต.ต. ร.ต.ออ
   #    Given create File Name black mule
   Given Chose to create file name black mule step_runing_number
    Then Create black mule file csv
    Then PreparaData black mule is 5 Data And Genarate all type of black mule is invalid_length_rank
    WHEN Encrypt File GPG To NITMX TH ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Black_mule
    WHEN Call API Sending file black mule from aoc to ITMX
    Then Get File black mule GPG From ITMX
    Then Check Response Code Black Mule REQ And RES
    Then Deleted File all

TC001_051 Validate Response Fail - Code 6A06 - Invalid Length : pol_name > 100 digits - (24) pol_name : ธนเสฏฐ์ธนเสฏฐ์ธนเสฏฐ์ธนเสฏฐ์ธนเสฏฐ์ธนเสฏฐ์ธนเสฏฐ์ธนเสฏฐ์ธนเสฏฐ์ธนเสฏฐ์ธนเสฏฐ์ธนเสฏฐ์ธนเสฏฐ์ธนเสฏฐ์ธนป
   #    Given create File Name black mule
   Given Chose to create file name black mule step_runing_number
    Then Create black mule file csv
    Then PreparaData black mule is 5 Data And Genarate all type of black mule is invalid_length_pol_name
    WHEN Encrypt File GPG To NITMX TH ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Black_mule
    WHEN Call API Sending file black mule from aoc to ITMX
    Then Get File black mule GPG From ITMX
    Then Check Response Code Black Mule REQ And RES
    Then Deleted File all

TC001_052 Validate Response Fail - Code 6A06 - Invalid Length : pol_surname > 100 digits - (25) pol_surname : พัฒน์ธนโกศลพัฒน์ธนโกศลพัฒน์ธนโกศลพัฒน์ธนโกศลพัฒน์ธนโกศลพัฒน์ธนโกศลพัฒน์ธนโกศลพัฒน์ธนโกศลพัฒน์ธนโกศลพด
   #    Given create File Name black mule
   Given Chose to create file name black mule step_runing_number
    Then Create black mule file csv
    Then PreparaData black mule is 5 Data And Genarate all type of black mule is invalid_length_pol_surname
    WHEN Encrypt File GPG To NITMX TH ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Black_mule
    WHEN Call API Sending file black mule from aoc to ITMX
    Then Get File black mule GPG From ITMX
    Then Check Response Code Black Mule REQ And RES
    Then Deleted File all

TC001_053 Validate Response Fail - Code 6A06 - Invalid Length : pol_job_title > 100 digits - (26) pol_job_title : รอง. สว.(สอบสวน) รอง. สว.(สอบสวน)รอง. สว.(สอบสวน)รอง. สว.(สอบสวน)รอง. สว.(สอบสวน)รอง. สว.(สอบสวน)รองก
   #    Given create File Name black mule
   Given Chose to create file name black mule step_runing_number
    Then Create black mule file csv
    Then PreparaData black mule is 5 Data And Genarate all type of black mule is invalid_length_pol_job_title
    WHEN Encrypt File GPG To NITMX TH ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Black_mule
    WHEN Call API Sending file black mule from aoc to ITMX
    Then Get File black mule GPG From ITMX
    Then Check Response Code Black Mule REQ And RES
    Then Deleted File all

TC001_054 Validate Response Fail - Code 6A06 - Invalid Length : pol_org > 200 digits - (27) pol_org : สภ.กระทุ่มแบน บก.จ.สมุทรสาคร ภ.7nsdoajdoajdadjaodjqdjqodjwqo่ก่ดนห่ดนห่กนรไ่กนรฟ่กๆนก่ๆรีก้ไๆไร่กนรไก่ไนรก่รไกไไี้ไรก่ไรก่ไรกไรีดรไหด่ไนก่ๆๆจตำรำกจพรได่ได่ไร่่นห่กไน่กไกไรก้ไรก่ไรดไไรี่ดนๆไ่ดๆวไสดน่ไดไ
   #    Given create File Name black mule
   Given Chose to create file name black mule step_runing_number
    Then Create black mule file csv
    Then PreparaData black mule is 5 Data And Genarate all type of black mule is invalid_length_pol_org
    WHEN Encrypt File GPG To NITMX TH ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Black_mule
    WHEN Call API Sending file black mule from aoc to ITMX
    Then Get File black mule GPG From ITMX
    Then Check Response Code Black Mule REQ And RES
    Then Deleted File all

TC001_055 Validate Response Fail - Code 6A06 - Invalid Length : pol_tel > 20 digits - (28) pol_tel : 0903241736-0903241735
   #    Given create File Name black mule
   Given Chose to create file name black mule step_runing_number
    Then Create black mule file csv
    Then PreparaData black mule is 5 Data And Genarate all type of black mule is invalid_length_pol_tel
    WHEN Encrypt File GPG To NITMX TH ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Black_mule
    WHEN Call API Sending file black mule from aoc to ITMX
    Then Get File black mule GPG From ITMX
    Then Check Response Code Black Mule REQ And RES
    Then Deleted File all

TC001_056 Validate Response Fail - Code 6A06 - Invalid Length : aml_report_date > 10 digits - (29) aml_report_date : 2025-03-011
   #    Given create File Name black mule
   Given Chose to create file name black mule step_runing_number
    Then Create black mule file csv
    Then PreparaData black mule is 5 Data And Genarate all type of black mule is invalid_length_aml_report_date
    WHEN Encrypt File GPG To NITMX TH ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Black_mule
    WHEN Call API Sending file black mule from aoc to ITMX
    Then Get File black mule GPG From ITMX
    Then Check Response Code Black Mule REQ And RES
    Then Deleted File all

TC001_057 Validate Response Fail - Code 6A06 - Invalid Length : card_id กรณีบุคคลธรรมดา (ตัวเลข 13 หลัก) - (10) card_id < 13 digit
   #    Given create File Name black mule
   Given Chose to create file name black mule step_runing_number
    Then Create black mule file csv
    Then PreparaData black mule is 5 Data And Genarate all type of black mule is invalid_length_card_id_low
    WHEN Encrypt File GPG To NITMX TH ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Black_mule
    WHEN Call API Sending file black mule from aoc to ITMX
    Then Get File black mule GPG From ITMX
    Then Check Response Code Black Mule REQ And RES
    Then Deleted File all

TC001_058 Validate Response Fail - Code 6A06 - Invalid Length : card_id กรณีบุคคลธรรมดา (ตัวเลข 13 หลัก) - (10) card_id > 13 digit
   #    Given create File Name black mule
   Given Chose to create file name black mule step_runing_number
    Then Create black mule file csv
    Then PreparaData black mule is 5 Data And Genarate all type of black mule is invalid_length_card_id_more
    WHEN Encrypt File GPG To NITMX TH ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Black_mule
    WHEN Call API Sending file black mule from aoc to ITMX
    Then Get File black mule GPG From ITMX
    Then Check Response Code Black Mule REQ And RES
    Then Deleted File all

TC001_059 Validate Response Fail - Code 6A06 - Invalid Length : card_id กรณีบุคคลธรรมดา (ตัวเลข 13 หลัก) - (10) card_id = 12digit and one string 675617489089A
   #    Given create File Name black mule
   Given Chose to create file name black mule step_runing_number
    Then Create black mule file csv
    Then PreparaData black mule is 5 Data And Genarate all type of black mule is invalid_length_12dig_1str
    WHEN Encrypt File GPG To NITMX TH ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Black_mule
    WHEN Call API Sending file black mule from aoc to ITMX
    Then Get File black mule GPG From ITMX
    Then Check Response Code Black Mule REQ And RES
    Then Deleted File all

TC001_060 Validate Response Fail - Code 6A06 - Invalid Length : card_id กรณีนิติบุคคล (ตัวเลข 18-35 หลัก) - (10) card_id < 18 digit 
   #    Given create File Name black mule
   Given Chose to create file name black mule step_runing_number
    Then Create black mule file csv
    Then PreparaData black mule is 5 Data And Genarate all type of black mule is invalid_length_card_id_entity_low
    WHEN Encrypt File GPG To NITMX TH ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Black_mule
    WHEN Call API Sending file black mule from aoc to ITMX
    Then Get File black mule GPG From ITMX
    Then Check Response Code Black Mule REQ And RES
    Then Deleted File all

TC001_061 Validate Response Fail - Code 6A06 - Invalid Length : card_id กรณีนิติบุคคล (ตัวเลข 18-35 หลัก) - (10) card_id > 35 digit
   #    Given create File Name black mule
   Given Chose to create file name black mule step_runing_number
    Then Create black mule file csv
    Then PreparaData black mule is 5 Data And Genarate all type of black mule is invalid_length_card_id_entity_more
    WHEN Encrypt File GPG To NITMX TH ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Black_mule
    WHEN Call API Sending file black mule from aoc to ITMX
    Then Get File black mule GPG From ITMX
    Then Check Response Code Black Mule REQ And RES For Negative
    Then Deleted File all

TC001_062 Validate Response Fail - Code 6A06 - Invalid Format : card_id กรณีนิติบุคคล(ตัวเลข 18-35 หลัก) Appendix 1.7 - (10) card_id = sdijsivhRTTVJJSKDHWIOPSJDHV237Ď
   #    Given create File Name black mule
   Given Chose to create file name black mule step_runing_number
    Then Create black mule file csv
    Then PreparaData black mule is 5 Data And Genarate all type of black mule is invalid_length_card_id_entity_str
    WHEN Encrypt File GPG To NITMX TH ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Black_mule
    WHEN Call API Sending file black mule from aoc to ITMX
    Then Get File black mule GPG From ITMX
    Then Check Response Code Black Mule REQ And RES For Negative
    Then Deleted File all

TC001_063 Validate Response Fail - Code 6A05 Missing required field: <FIELD_NAME> (1) case_id : Empty
   #    Given create File Name black mule
   Given Chose to create file name black mule step_runing_number
    Then Create black mule file csv
    Then PreparaData black mule is 2 Data And Genarate all type of black mule is case_id_empty
    WHEN Encrypt File GPG To NITMX TH ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Black_mule
    WHEN Call API Sending file black mule from aoc to ITMX
    Then Get File black mule GPG From ITMX
    Then Check Response Code Black Mule REQ And RES For Negative
    Then Deleted File all

TC001_064 Validate Response Fail - Code 6A05 Missing required field: <FIELD_NAME> (2) case_date : Empty
   #    Given create File Name black mule
   Given Chose to create file name black mule step_runing_number
    Then Create black mule file csv
    Then PreparaData black mule is 2 Data And Genarate all type of black mule is case_date_empty
    WHEN Encrypt File GPG To NITMX TH ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Black_mule
    WHEN Call API Sending file black mule from aoc to ITMX
    Then Get File black mule GPG From ITMX
    Then Check Response Code Black Mule REQ And RES For Negative
    Then Deleted File all

TC001_065 Validate Response Fail - Code 6A05 Missing required field: <FIELD_NAME> (3) case_type : Empty
   #    Given create File Name black mule
   Given Chose to create file name black mule step_runing_number
    Then Create black mule file csv
    Then PreparaData black mule is 2 Data And Genarate all type of black mule is case_type_empty
    WHEN Encrypt File GPG To NITMX TH ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Black_mule
    WHEN Call API Sending file black mule from aoc to ITMX
    Then Get File black mule GPG From ITMX
    Then Check Response Code Black Mule REQ And RES For Negative
    Then Deleted File all

TC001_066 Validate Response Fail - Code 6A05 Missing required field: <FIELD_NAME> (4) accountno : Empty
   #    Given create File Name black mule
   Given Chose to create file name black mule step_runing_number
    Then Create black mule file csv
    Then PreparaData black mule is 2 Data And Genarate all type of black mule is accountno_empty
    WHEN Encrypt File GPG To NITMX TH ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Black_mule
    WHEN Call API Sending file black mule from aoc to ITMX
    Then Get File black mule GPG From ITMX
    Then Check Response Code Black Mule REQ And RES For Negative
    Then Deleted File all

TC001_067 Validate Response Fail Validate Response Fail - Code 6A05 Missing required field: <FIELD_NAME> (5) accounttype : Empty
   #    Given create File Name black mule
   Given Chose to create file name black mule step_runing_number
    Then Create black mule file csv
    Then PreparaData black mule is 2 Data And Genarate all type of black mule is accounttype_empty
    WHEN Encrypt File GPG To NITMX TH ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Black_mule
    WHEN Call API Sending file black mule from aoc to ITMX
    Then Get File black mule GPG From ITMX
    Then Check Response Code Black Mule REQ And RES For Negative
    Then Deleted File all

TC001_068 Validate Response Fail - Code 6A05 Missing required field: <FIELD_NAME> (6) bankcode : Empty
   #    Given create File Name black mule
   Given Chose to create file name black mule step_runing_number
    Then Create black mule file csv
    Then PreparaData black mule is 2 Data And Genarate all type of black mule is bankcode_empty
    WHEN Encrypt File GPG To NITMX TH ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Black_mule
    WHEN Call API Sending file black mule from aoc to ITMX
    Then Get File black mule GPG From ITMX
    Then Check Response Code Black Mule REQ And RES For Negative
    Then Deleted File all

TC001_069 Validate Response Fail - Code 6A05 Missing required field: <FIELD_NAME> (7) bankname : Empty
   #    Given create File Name black mule
   Given Chose to create file name black mule step_runing_number
    Then Create black mule file csv
    Then PreparaData black mule is 2 Data And Genarate all type of black mule is bankname_empty
    WHEN Encrypt File GPG To NITMX TH ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Black_mule
    WHEN Call API Sending file black mule from aoc to ITMX
    Then Get File black mule GPG From ITMX
    Then Check Response Code Black Mule REQ And RES For Negative
    Then Deleted File all

TC001_070 Validate Response Fail - Code 6A05 Missing required field: <FIELD_NAME> (8) entity_type : Empty
   #    Given create File Name black mule
   Given Chose to create file name black mule step_runing_number
    Then Create black mule file csv
    Then PreparaData black mule is 2 Data And Genarate all type of black mule is entity_type_empty
    WHEN Encrypt File GPG To NITMX TH ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Black_mule
    WHEN Call API Sending file black mule from aoc to ITMX
    Then Get File black mule GPG From ITMX
    Then Check Response Code Black Mule REQ And RES For Negative
    Then Deleted File all

TC001_071 Validate Response Fail - Code 6A05 Missing required field: <FIELD_NAME> (9) id_type : Empty
   #    Given create File Name black mule
   Given Chose to create file name black mule step_runing_number
    Then Create black mule file csv
    Then PreparaData black mule is 2 Data And Genarate all type of black mule is id_type_empty
    WHEN Encrypt File GPG To NITMX TH ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Black_mule
    WHEN Call API Sending file black mule from aoc to ITMX
    Then Get File black mule GPG From ITMX
    Then Check Response Code Black Mule REQ And RES For Negative
    Then Deleted File all

TC001_072 Validate Response Fail - Code 6A05 Missing required field: <FIELD_NAME> (10) card_id : Empty
   #    Given create File Name black mule
   Given Chose to create file name black mule step_runing_number
    Then Create black mule file csv
    Then PreparaData black mule is 2 Data And Genarate all type of black mule is card_id_empty
    WHEN Encrypt File GPG To NITMX TH ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Black_mule
    WHEN Call API Sending file black mule from aoc to ITMX
    Then Get File black mule GPG From ITMX
    Then Check Response Code Black Mule REQ And RES For Negative
    Then Deleted File all

TC001_073 Validate Response Fail - Code 6A05 Missing required field: <FIELD_NAME> (11) ref_code : Empty
   #    Given create File Name black mule
   Given Chose to create file name black mule step_runing_number
    Then Create black mule file csv
    Then PreparaData black mule is 2 Data And Genarate all type of black mule is ref_code_empty
    WHEN Encrypt File GPG To NITMX TH ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Black_mule
    WHEN Call API Sending file black mule from aoc to ITMX
    Then Get File black mule GPG From ITMX
    Then Check Response Code Black Mule REQ And RES For Negative
    Then Deleted File all

TC001_074 Validate Response Fail - Code 6A05 Missing required field: <FIELD_NAME> (13) name : Empty
   #    Given create File Name black mule
   Given Chose to create file name black mule step_runing_number
    Then Create black mule file csv
    Then PreparaData black mule is 2 Data And Genarate all type of black mule is name_empty
    WHEN Encrypt File GPG To NITMX TH ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Black_mule
    WHEN Call API Sending file black mule from aoc to ITMX
    Then Get File black mule GPG From ITMX
    Then Check Response Code Black Mule REQ And RES For Negative
    Then Deleted File all

TC001_075 Validate Response Fail - Code 6A05 Missing required field: <FIELD_NAME> (15) surname : Empty
   #    Given create File Name black mule
   Given Chose to create file name black mule step_runing_number
    Then Create black mule file csv
    Then PreparaData black mule is 2 Data And Genarate all type of black mule is surname_empty
    WHEN Encrypt File GPG To NITMX TH ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Black_mule
    WHEN Call API Sending file black mule from aoc to ITMX
    Then Get File black mule GPG From ITMX
    Then Check Response Code Black Mule REQ And RES For Negative
    Then Deleted File all

TC001_076 Validate Response Fail - Code 6A05 Missing required field: <FIELD_NAME> (29) aml_report_date : Empty
   #    Given create File Name black mule
   Given Chose to create file name black mule step_runing_number
    Then Create black mule file csv
    Then PreparaData black mule is 2 Data And Genarate all type of black mule is aml_report_date_empty
    WHEN Encrypt File GPG To NITMX TH ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Black_mule
    WHEN Call API Sending file black mule from aoc to ITMX
    Then Get File black mule GPG From ITMX
    Then Check Response Code Black Mule REQ And RES For Negative
    Then Deleted File all

TC001_077 Validate Condition - Valid Condition Duplicate data (In file) - Code 6A09 - case_id, bankcode + accountno, card_id, and ref_code must be unique in the same file
   #    Given create File Name black mule
   Given Chose to create file name black mule step_runing_number
    Then Create black mule file csv
    Then PreparaData black mule is 1 Data And Genarate all type of black mule is dup_in_file
    WHEN Encrypt File GPG To NITMX TH ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Black_mule
    WHEN Call API Sending file black mule from aoc to ITMX
    Then Get File black mule GPG From ITMX
    Then Check Response Code Black Mule REQ And RES for Dup
    Then Deleted File all

TC001_078 Validate Condition - Valid Condition Duplicate data (In System) - Code 6A03 - For duplicating data, the CFR system will combine the key below for checking duplicates. bankcode + accountno, card_id, ref_code, case_id In the CFR system must be unique.
   #    Given create File Name black mule
   Given Chose to create file name black mule step_runing_number
    Then Create black mule file csv
    Then PreparaData black mule is 1 Data And Genarate all type of black mule is data
    WHEN Encrypt File GPG To NITMX TH ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Black_mule
    WHEN Call API Sending file black mule from aoc to ITMX
   #    Given create File Name black mule
   Given Chose to create file name black mule step_runing_number
    Then Create black mule file csv
    Then Create Data add black mule
    WHEN Encrypt File GPG To NITMX TH ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Black_mule
    WHEN Call API Sending file black mule from aoc to ITMX
    Then Get File black mule GPG From ITMX
    Then Check Response Code Black Mule REQ And RES for Dup
    Then Deleted File all not deleted DB

TC001_088 Validate Condition - Code 6A07 Invalid value condition: <FIELD_NAME> - กรณี nationality ไม่ตรงเงื่อนไขตาม (สัญชาติตาม ISO alpha-2)
   #    Given create File Name black mule
   Given Chose to create file name black mule step_runing_number
    Then Create black mule file csv
    Then PreparaData black mule is 1 Data And Genarate all type of black mule is invali_condition_nationality
    WHEN Encrypt File GPG To NITMX TH ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Black_mule
    WHEN Call API Sending file black mule from aoc to ITMX
    Then Get File black mule GPG From ITMX
    Then Check Response Code Black Mule REQ And RES
    Then Deleted File all
    
TC001_089 Validate Condition - Code 6A07 Invalid value condition: <FIELD_NAME> - aml_report_date must be equal or less than current system date and date of file
   #    Given create File Name black mule
   Given Chose to create file name black mule step_runing_number
    Then Create black mule file csv
    Then PreparaData black mule is 1 Data And Genarate all type of black mule is invali_condition_aml_report_date
    WHEN Encrypt File GPG To NITMX TH ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Black_mule
    WHEN Call API Sending file black mule from aoc to ITMX
    Then Get File black mule GPG From ITMX
    Then Check Response Code Black Mule REQ And RES For Negative
    Then Deleted File all
    
TC001_090 Validate Response Fail - Code 6A07 Invalid value condition: <FIELD_NAME> - case_type must be 1-28 (Appendix E)
   [Documentation]    พี่อ๊บ แจ้งว่า Field bankcode และ bankname ไม่จำเป็นต้องกรอกข้อมูล ให้สัมพันธ์กัน ระบบแยกเช็ค Field by Field (26/03/2025)
   #    Given create File Name black mule
   Given Chose to create file name black mule step_runing_number
    Then Create black mule file csv
    Then PreparaData black mule is 1 Data And Genarate all type of black mule is invali_condition_case_type
    WHEN Encrypt File GPG To NITMX TH ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Black_mule
    WHEN Call API Sending file black mule from aoc to ITMX
    Then Get File black mule GPG From ITMX
    Then Check Response Code Black Mule REQ And RES For Negative
    Then Deleted File all
    
TC001_091 Validate Response Fail - Code 6A07 Invalid value condition: <FIELD_NAME> - bankname ต้องสอดคล้องกับ bankcode
    [Tags]    not_ready
    [Documentation]    พี่อ๊บ แจ้งว่า Field bankcode และ bankname ไม่จำเป็นต้องกรอกข้อมูล ให้สัมพันธ์กัน ระบบแยกเช็ค Field by Field (26/03/2025)
   Given Chose to create file name black mule step_runing_number
    Then Create black mule file csv
    Then PreparaData black mule is 1 Data And Genarate all type of black mule is invali_condition_bankname
    WHEN Encrypt File GPG To NITMX TH ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Black_mule
    WHEN Call API Sending file black mule from aoc to ITMX
    Then Get File black mule GPG From ITMX
    Then Check Response Code Black Mule REQ And RES For Negative
    Then Deleted File all
    
TC001_092 Validate Response Fail - Code 6A07 Invalid value condition: <FIELD_NAME> - entity_type ต้องตรงตามเงื่อนไข (PERSON or ENTITY)
   #    Given create File Name black mule
   Given Chose to create file name black mule step_runing_number
    Then Create black mule file csv
    Then PreparaData black mule is 1 Data And Genarate all type of black mule is invali_condition_entity_type
    WHEN Encrypt File GPG To NITMX TH ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Black_mule
    WHEN Call API Sending file black mule from aoc to ITMX
    Then Get File black mule GPG From ITMX
    Then Check Response Code Black Mule REQ And RES For Negative
    Then Deleted File all
    
TC001_093 Validate Response Fail - Code 6A07 Invalid value condition: <FIELD_NAME> - id_type ต้องตรงตามเงื่อนไข (COMPANY ID or National ID)
   #    Given create File Name black mule
   Given Chose to create file name black mule step_runing_number
    Then Create black mule file csv
    Then PreparaData black mule is 1 Data And Genarate all type of black mule is invali_condition_id_type
    WHEN Encrypt File GPG To NITMX TH ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Black_mule
    WHEN Call API Sending file black mule from aoc to ITMX
    Then Get File black mule GPG From ITMX
    Then Check Response Code Black Mule REQ And RES For Negative
    Then Deleted File all
    
TC001_094 Validate Response Fail - Code 6A07 Invalid value condition: <FIELD_NAME> - กรณี entity_type ไม่ถูกตรงตามเงื่อนไข National ID, the entity type will be PERSON - entity_type = PERSON - id_type = COMPANY ID
   #    Given create File Name black mule
   Given Chose to create file name black mule step_runing_number
    Then Create black mule file csv
    Then PreparaData black mule is 1 Data And Genarate all type of black mule is invali_condition_entity_type_company
    WHEN Encrypt File GPG To NITMX TH ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Black_mule
    WHEN Call API Sending file black mule from aoc to ITMX
    Then Get File black mule GPG From ITMX
    Then Check Response Code Black Mule REQ And RES For Negative
    Then Deleted File all
    
TC001_095 Validate Response Fail - Code 6A07 Invalid value condition: <FIELD_NAME> - กรณี entity_type ไม่ถูกตรงตามเงื่อนไข COMPANY ID, the entity type column will be ENTITY. - entity_type = ENTITY - id_type = National ID
   #    Given create File Name black mule
   Given Chose to create file name black mule step_runing_number
    Then Create black mule file csv
    Then PreparaData black mule is 1 Data And Genarate all type of black mule is invali_condition_entity_type_company_v1
    WHEN Encrypt File GPG To NITMX TH ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Black_mule
    WHEN Call API Sending file black mule from aoc to ITMX
    Then Get File black mule GPG From ITMX
    Then Check Response Code Black Mule REQ And RES For Negative
    Then Deleted File all
    
TC001_096 Validate Response Fail - Code 6A07 Invalid value condition: <FIELD_NAME> - ระบุ Field : surname และ eng_surname - entity_type = ENTITY - id_type = COMPANY ID
   #    Given create File Name black mule
   Given Chose to create file name black mule step_runing_number
    Then Create black mule file csv
    Then PreparaData black mule is 1 Data And Genarate all type of black mule is invali_condition_entity_type_company_v2
    WHEN Encrypt File GPG To NITMX TH ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Black_mule
    WHEN Call API Sending file black mule from aoc to ITMX
    Then Get File black mule GPG From ITMX
    Then Check Response Code Black Mule REQ And RES For Negative
    Then Deleted File all

TC001_097 Validate Response Fail - Code 6A07 Invalid value condition: <FIELD_NAME> - ระบุ Field : surname - entity_type = ENTITY - id_type = COMPANY ID
   #    Given create File Name black mule
   Given Chose to create file name black mule step_runing_number
    Then Create black mule file csv
    Then PreparaData black mule is 1 Data And Genarate all type of black mule is invali_condition_entity_type_company_v3
    WHEN Encrypt File GPG To NITMX TH ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Black_mule
    WHEN Call API Sending file black mule from aoc to ITMX
    Then Get File black mule GPG From ITMX
    Then Check Response Code Black Mule REQ And RES For Negative
    Then Deleted File all

TC001_099 Validate Response Fail - Code 6100 INVALID_HEADER_CSV_FILE_FORMAT - Invalid header column (1) case_id = case_
   #    Given create File Name black mule
   Given Chose to create file name black mule step_runing_number
    Then Create black mule file csv for validate Header is case_
    Then PreparaData black mule is 1 Data And Genarate all type of black mule is all_filed
    WHEN Encrypt File GPG To NITMX TH ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Black_mule
    WHEN Call API Sending file black mule from aoc to ITMX
    Then Get File black mule GPG From ITMX
    Then Check Response Code Black Mule REQ And RES V1
    Then Deleted File all and deleted DB REQ RES

TC001_100 Validate Response Fail - Code 6100 INVALID_HEADER_CSV_FILE_FORMAT - Invalid header column - Invalid header : Empty
   #    Given create File Name black mule
   Given Chose to create file name black mule step_runing_number
    Then Create black mule file csv for validate Header is EMPTY
    Then PreparaData black mule is 1 Data And Genarate all type of black mule is all_filed
    WHEN Encrypt File GPG To NITMX TH ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Black_mule
    WHEN Call API Sending file black mule from aoc to ITMX
    Then Get File black mule GPG From ITMX
    Then Check Response Code Black Mule REQ And RES V1
    Then Deleted File all and deleted DB REQ RES

TC001_101 Validate Response Fail - Code 6105 INVALID_FILE_STRUCTURE - Invalid header column - Invalid header : does not header 
   #    Given create File Name black mule
   Given Chose to create file name black mule step_runing_number
    Then Create black mule file csv for validate Header is done not header
    Then PreparaData black mule is 1 Data And Genarate all type of black mule is all_filed
    WHEN Encrypt File GPG To NITMX TH ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Black_mule
    WHEN Call API Sending file black mule from aoc to ITMX
    Then Get File black mule GPG From ITMX
    Then Check Response Code Black Mule REQ And RES V1
    Then Deleted File all and deleted DB REQ RES

TC001_102 Validate Format file name - Request file - Code 6103 INVALID_FILE_NAME_FORMAT - Validate file names in gpg format - The abbreviation Request file is not REQ.
#    Given create File Name black mule and validate file name is invali_file_name
   Given Chose to create file name black mule invali_file_name
    Then Create black mule file csv
    Then PreparaData black mule is 1 Data And Genarate all type of black mule is all_filed
    WHEN Encrypt File GPG To NITMX TH ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Black_mule
    WHEN Call API Sending file black mule from aoc to ITMX
    Then Get File black mule GPG From ITMX
    Then Check Response Code Black Mule REQ And RES V1
    Then Deleted File all and deleted DB REQ RES

TC001_103 Validate Format file name - Request file - Code 6103 INVALID_FILE_NAME_FORMAT - Validate file names in gpg format - Create datetime for Timestamp file = YYMMDD
#    Given create File Name black mule and validate file name is invali_file_name_datetime
   Given Chose to create file name black mule invali_file_name_datetime
    Then Create black mule file csv
    Then PreparaData black mule is 1 Data And Genarate all type of black mule is all_filed
    WHEN Encrypt File GPG To NITMX TH ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Black_mule
    WHEN Call API Sending file black mule from aoc to ITMX
    Then Get File black mule GPG From ITMX
    Then Check Response Code Black Mule REQ And RES V1
    Then Deleted File all and deleted DB REQ RES

TC001_104 Validate Format file name - Request file - Code 6103 INVALID_FILE_NAME_FORMAT - Validate file names in gpg format - running file number = 2 digit
#    Given create File Name black mule and validate file name is invali_file_name_runing_2dig
   Given Chose to create file name black mule invali_file_name_runing_2dig
    Then Create black mule file csv
    Then PreparaData black mule is 1 Data And Genarate all type of black mule is all_filed
    WHEN Encrypt File GPG To NITMX TH ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Black_mule
    WHEN Call API Sending file black mule from aoc to ITMX
    Then Get File black mule GPG From ITMX
    Then Check Response Code Black Mule REQ And RES V1
    Then Deleted File all and deleted DB REQ RES

TC001_105 Validate Format file name - Request file - Code 6105 INVALID_FILE_STRUCTURE - invalid header - header = case_id
   #    Given create File Name black mule
   Given Chose to create file name black mule step_runing_number
    Then Create black mule file csv for validate Header case_id
    Then PreparaData black mule is 1 Data And Genarate all type of black mule is all_filed
    WHEN Encrypt File GPG To NITMX TH ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Black_mule
    WHEN Call API Sending file black mule from aoc to ITMX
    Then Get File black mule GPG From ITMX
    Then Check Response Code Black Mule REQ And RES V1
    Then Deleted File all and deleted DB REQ RES

TC001_106 Validate Format file name - Request file - Code 6109 INVALID_DATE_ON_FILENAME - Date on file name dose not system date - Create datetime for Timestamp file เป็นวันที่ไม่มีอยู่จริง
#    Given create File Name black mule and validate file name is invali_file_name_datetime_file
   Given Chose to create file name black mule invali_file_name_datetime_file
    Then Create black mule file csv
    Then PreparaData black mule is 1 Data And Genarate all type of black mule is all_filed
    WHEN Encrypt File GPG To NITMX TH ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Black_mule
    WHEN Call API Sending file black mule from aoc to ITMX
    Then Get File black mule GPG From ITMX
    Then Check Response Code Black Mule REQ And RES V1
    Then Deleted File all and deleted DB REQ RES

TC001_107 Validate Format file name - Request file - Code 6103 INVALID_FILE_NAME_FORMAT - Validate file names in gpg format - Request file = RES
#    Given create File Name black mule and validate file name is invali_file_name_req_to_res
   Given Chose to create file name black mule invali_file_name_req_to_res
    Then Create black mule file csv
    Then PreparaData black mule is 1 Data And Genarate all type of black mule is all_filed
    WHEN Encrypt File GPG To NITMX TH ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Black_mule
    WHEN Call API Sending file black mule from aoc to ITMX
    Then Get File black mule GPG From ITMX
    Then Check Response Code Black Mule REQ And RES V3
    Then Deleted File all and deleted DB REQ RES

TC001_108 Validate Response Fail - Code 6105 INVALID_FILE_STRUCTURE - Invalid header & body
   #    Given create File Name black mule
   Given Chose to create file name black mule step_runing_number
    Then Create black mule file csv for validate Header is done not header
    Then Create Data add black mule is EMPTY
    WHEN Encrypt File GPG To NITMX TH ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Black_mule
    WHEN Call API Sending file black mule from aoc to ITMX
    Then Get File black mule GPG From ITMX
    Then Check Response Code Black Mule REQ And RES V3
    Then Deleted File all and deleted DB REQ RES
    
TC001_109 Validate header CSV file - Code 6105 INVALID_FILE_STRUCTURE - invalid header line which sequence by fields name with Delimiter Character “ ; ” 
   #    Given create File Name black mule
   Given Chose to create file name black mule step_runing_number
    Then Create black mule file csv invalid header line delimiter character is ;
    Then PreparaData black mule is 1 Data And Genarate all type of black mule is all_filed
    WHEN Encrypt File GPG To NITMX TH ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Black_mule
    WHEN Call API Sending file black mule from aoc to ITMX
    Then Get File black mule GPG From ITMX
    Then Check Response Code Black Mule REQ And RES V1
    Then Deleted File all and deleted DB REQ RES

TC001_110 Validate Format file name - Code 6106 RECORD_EXCEED_LIMIT - Exceeded maximum number of documents or record - ข้อมูล Transaction > 5,000 Record
    [Documentation]    Test Case Registry Black Mule
   #    Given create File Name black mule
   Given Chose to create file name black mule step_runing_number
    Then Copy file for Encrypt for case is 5000record
    WHEN Encrypt File GPG To NITMX TH ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Black_mule
    WHEN Call API Sending file black mule from aoc to ITMX
    Then Get File black mule GPG From ITMX
    Then Check Response Code Black Mule REQ And RES V3
    Then Deleted File all and deleted DB REQ RES

TC001_111 Validate Format file name - Code 6107 FILE_EXCEED_LIMIT - Exceeded maximum file size > 10 MB 
    [Documentation]    Test Case Registry Black Mule
   #    Given create File Name black mule
   Given Chose to create file name black mule step_runing_number
    Then Copy file for Encrypt for case is 10mb
    WHEN Encrypt File GPG To NITMX TH ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Black_mule
    WHEN Call API Sending file black mule from aoc to ITMX
    Then Get File black mule GPG From ITMX
    Then Check Response Code Black Mule REQ And RES V3
    Then Deleted File all and deleted DB REQ RES

TC001_112 Validate Format file name - Code 6109 INVALID_DATE_ON_FILENAME - Date on file name dose not system date - YYYYMMDD is not system date system date : 25671108
    [Documentation]    Test Case Registry Black Mule
#    Given create File Name black mule and validate file name is invali_file_name_date_on_future
   Given Chose to create file name black mule invali_file_name_date_on_future
    Then Create black mule file csv
    Then PreparaData black mule is 1 Data And Genarate all type of black mule is all_filed
    WHEN Encrypt File GPG To NITMX TH ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Black_mule
    WHEN Call API Sending file black mule from aoc to ITMX
    Then Get File black mule GPG From ITMX
    Then Check Response Code Black Mule REQ And RES V1
    Then Deleted File all and deleted DB REQ RES

TC001_113 Validate Format file name - Code 6109 INVALID_DATE_ON_FILENAME - Invalid YYYYMMDD : 20250327
    [Documentation]    Test Case Registry Black Mule
#    Given create File Name black mule and validate file name is invali_file_name_date_on_year_eng
   Given Chose to create file name black mule invali_file_name_date_on_year_eng
    Then Create black mule file csv
    Then PreparaData black mule is 1 Data And Genarate all type of black mule is all_filed
    WHEN Encrypt File GPG To NITMX TH ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Black_mule
    WHEN Call API Sending file black mule from aoc to ITMX
    Then Get File black mule GPG From ITMX
    Then Check Response Code Black Mule REQ And RES V1
    Then Deleted File all and deleted DB REQ RES

TC001_114 Validate Format file name - Code 6110 - Duplicate File name are encountered in the system
   #    Given create File Name black mule
   Given Chose to create file name black mule step_runing_number
    Then Create black mule file csv
    Then PreparaData black mule is 1 Data And Genarate all type of black mule is data
    WHEN Encrypt File GPG To NITMX TH ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Black_mule
    WHEN Call API Sending file black mule from aoc to ITMX
    Then Create black mule file csv
    Then PreparaData black mule is 1 Data And Genarate all type of black mule is data
    WHEN Encrypt File GPG To NITMX TH ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Black_mule
    WHEN Call API Sending file black mule from aoc to ITMX
    Then Get File black mule GPG From ITMX for dup
    Then Check Response Code Black Mule REQ And RES V2
    Then Deleted File all not deleted DB

TC001_115 Validate Format file name - Code 6112 - Unable to read record in each file format - Invalid Body : ,
   #    Given create File Name black mule
   Given Chose to create file name black mule step_runing_number
    Then Create black mule file csv
    Then PreparaData black mule is 1 Data And Genarate all type of black mule is all_filed validate body have delimiter is ,
    WHEN Encrypt File GPG To NITMX TH ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Black_mule
    WHEN Call API Sending file black mule from aoc to ITMX
    Then Get File black mule GPG From ITMX
    Then Check Response Code Black Mule REQ And RES V1
    Then Deleted File all and deleted DB REQ RES

TC001_116 Validate Format file name - Code 6113 - Sending data with zero record 
   #    Given create File Name black mule
   Given Chose to create file name black mule step_runing_number
    Then Create black mule file csv
    WHEN Encrypt File GPG To NITMX TH ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Black_mule
    WHEN Call API Sending file black mule from aoc to ITMX
    Then Get File black mule GPG From ITMX
    Then Check Response Code Black Mule REQ And RES V1
    Then Deleted File all and deleted DB REQ RES

TC001_117 Validate Format file name - Code 6300 - Invalid signature value - Private key does not AOC - Public key as ITMX
   #    Given create File Name black mule
   Given Chose to create file name black mule step_runing_number
    Then Create black mule file csv
    Then PreparaData black mule is 1 Data And Genarate all type of black mule is all_filed
    WHEN Invalid signature is Encrypt File GPG To NITMX TH ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Black_mule
    WHEN Call API Sending file black mule from aoc to ITMX
    Then Get File black mule GPG From ITMX
    Then Check Response Code Black Mule REQ And RES V1
    Then Deleted File all and deleted DB REQ RES

TC001_118 Validate Format file name - Code 6400 - GPG decryption and/or identification has failed - Public key does not ITMX
   #    Given create File Name black mule
   Given Chose to create file name black mule step_runing_number
    Then Create black mule file csv
    Then PreparaData black mule is 1 Data And Genarate all type of black mule is all_filed
    WHEN Invalid signature is Encrypt File GPG To NITMX TH ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Black_mule
    WHEN Call API Sending file black mule from aoc to ITMX
    Then Get File black mule GPG From ITMX
    Then Check Response Code Black Mule REQ And RES V1
    Then Deleted File all and deleted DB REQ RES

TC001_119 Validate Format file name - Code 6A04 Multiple ref_code are associated with a single card ID. - Multiple ref_code are associated with a single card ID in the same file. The system rejected all duplicate records. 
   #    Given create File Name black mule
   Given Chose to create file name black mule step_runing_number
    Then Create black mule file csv
    Then PreparaData black mule is 2 Data And Genarate all type of black mule is 6A04
    WHEN Encrypt File GPG To NITMX TH ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Black_mule
    WHEN Call API Sending file black mule from aoc to ITMX
    Then Get File black mule GPG From ITMX
    Then Check Response Code Black Mule REQ And RES
    Then Deleted File all

TC001_120 Validate Format file name - Code 6A04 Multiple ref_code are associated with a single card ID. - The CFR system rejected the new ref_code of the person, if it found an existing card ID having a ref_code in the system. 
   #    Given create File Name black mule
   Given Chose to create file name black mule step_runing_number
    Then Create black mule file csv
    Then PreparaData black mule is 1 Data And Genarate all type of black mule is 6A04_in_sys
    WHEN Encrypt File GPG To NITMX TH ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Black_mule
    WHEN Call API Sending file black mule from aoc to ITMX
    Then Get File black mule GPG From ITMX
    Then Check Response Code Black Mule REQ And RES
    Then Deleted File all

TC001_121 Validate Response Fail - Code 6A07 Invalid value condition: <FIELD_NAME> - bankcode (appendix A: Bank Code)
   #    Given create File Name black mule
   Given Chose to create file name black mule step_runing_number
    Then Create black mule file csv
    Then PreparaData black mule is 1 Data And Genarate all type of black mule is inlivad_bankcode_6A07
    WHEN Encrypt File GPG To NITMX TH ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Black_mule
    WHEN Call API Sending file black mule from aoc to ITMX
    Then Get File black mule GPG From ITMX
    Then Check Response Code Black Mule REQ And RES For Negative
    Then Deleted File all

TC001_122 Validate Response Fail - Code 6A07 Invalid value condition: <FIELD_NAME> - bankname (appendix A: Banks abbreviate)
   #    Given create File Name black mule
   Given Chose to create file name black mule step_runing_number
    Then Create black mule file csv
    Then PreparaData black mule is 1 Data And Genarate all type of black mule is inlivad_bankname_6A07
    WHEN Encrypt File GPG To NITMX TH ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Black_mule
    WHEN Call API Sending file black mule from aoc to ITMX
    Then Get File black mule GPG From ITMX
    Then Check Response Code Black Mule REQ And RES For Negative
    Then Deleted File all

TC001_123 Validate Response Fail - Code 6A07 Invalid value condition: <FIELD_NAME> - case_date : 2021-12-31, 2025-04-01 - Acceptable date are not older than the year 2022 and not newer than the current system year.
   #    Given create File Name black mule
   Given Chose to create file name black mule step_runing_number
    Then Create black mule file csv
    Then PreparaData black mule is 3 Data And Genarate all type of black mule is inlivad_case_date_6A07
    WHEN Encrypt File GPG To NITMX TH ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Black_mule
    WHEN Call API Sending file black mule from aoc to ITMX
    Then Get File black mule GPG From ITMX
    Then Check Response Code Black Mule REQ And RES For Negative
    Then Deleted File all

TC001_127 Validate Response Fail - Code 6A06 Invalid format - Invalid Format : card_id กรณีบุคคลธรรมดา (ตัวเลข 13 หลัก ไม่ถูก logic คิดเลขบัตร ) - (10) card_id = 13 digit 0000011112200
   #    Given create File Name black mule
   Given Chose to create file name black mule step_runing_number
    Then Create black mule file csv
    Then PreparaData black mule is 1 Data And Genarate all type of black mule is invalid_case_id
    WHEN Encrypt File GPG To NITMX TH ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Black_mule
    WHEN Call API Sending file black mule from aoc to ITMX
    Then Get File black mule GPG From ITMX
    Then Check Response Code Black Mule REQ And RES For Negative
    Then Deleted File all

TC001_128 Validate Response Fail - Code 6A06 Invalid format - Invalid Format : card_id กรณีชาวต่างชาติ (ตัวเลข 1-35 digit ) - (10) card_id = 1-35 digit ( 1 digit) 9359259229929283285059585484595883à ( 35 digit)
   #    Given create File Name black mule
   Given Chose to create file name black mule step_runing_number
    Then Create black mule file csv
    Then PreparaData black mule is 1 Data And Genarate all type of black mule is invalid_case_id_35digi
    WHEN Encrypt File GPG To NITMX TH ${Filename_Req_blackmule}
    WHEN login to sftp server and Put file by Black_mule
    WHEN Call API Sending file black mule from aoc to ITMX
    Then Get File black mule GPG From ITMX
    Then Check Response Code Black Mule REQ And RES For Negative
    Then Deleted File all