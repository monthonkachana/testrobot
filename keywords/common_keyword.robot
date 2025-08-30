*** Settings ***
Resource  ../resources/imports.robot

*** Variables ***
${SLEEP_TIME}      15s
${MAX_RETRIES}     10000
${RETRY_COUNT}     0


*** Keywords ***
Create Subcase Horse 2 '${FOLDER}'
    [Documentation]    Test Case SUBMIT
    Create Directory     ${CURDIR}/${FOLDER}
    ${horse_count}=    Get Length    ${horse_other_list}
    FOR    ${i}    IN RANGE    ${horse_count}
        Open Excel Document      filename=${CURDIR}/Subcase_Template.xlsx   doc_id=docname1
        Write Excel Cell	3   1    ${master_case_id}    sheet_name=AddSubCase
        ${horse}=    Get From List    ${horse_other_list}    ${i}
        ${person_id}=    set variable  ${horse}[horse_id]
        ${person_type}=    set variable  ${horse}[horse_type]        
        ${person_name}=    set variable  ${horse}[horse_name]
        ${person_lastname}=    set variable  ${horse}[horse_lastname]
        ${person_account_no}=    set variable  ${horse}[horse_account_no]
        ${person_account_name}=    set variable  ${horse}[horse_account_name]
        ${sending_account_name}=    set variable  ${horse}[sending_account_name]
        ${person_phone_no}=    create phone no 'random'
        #   after_create_case , before_create_case , today
        ${วันและเวลาที่อายัด_72_hrs}=    create block_unblock date time 'today'
        ${วันและเวลาที่ปลด_72_hrs}=    create block_unblock date time 'after_create_case'
        ${วันและเวลาที่แจ้งความ_ขยายจาก_72_ชม_เป็น_7_วัน}=    create block_unblock date time 'after_create_case'
        ${วันและเวลาที่_Fraud_พิจารณาอายัดตามมาตรา_6_7_วัน}=    create block_unblock date time 'after_create_case'
        ${วันและเวลาที่ปลด_7_วัน}=    create block_unblock date time 'after_create_case'
        ${วันและเวลาที่อายัดจากตำรวจ}=    create block_unblock date time 'today'
        ${วันและเวลาที่ปลดจากตำรวจ}=    create block_unblock date time 'after_create_case'
        Write Excel Cell	7   1    ${person_id}    sheet_name=AddSubCase
        Write Excel Cell	7   2    ${person_type}    sheet_name=AddSubCase
        Write Excel Cell	7   3    ${person_name}    sheet_name=AddSubCase
        Write Excel Cell	7   4    ${person_lastname}    sheet_name=AddSubCase
        Write Excel Cell	7   5    ${person_account_no}    sheet_name=AddSubCase
        Write Excel Cell	7   6    ${person_account_name}    sheet_name=AddSubCase
        Write Excel Cell	7   8    ${person_phone_no}    sheet_name=AddSubCase
        Write Excel Cell	7   9    ${วันและเวลาที่อายัด_72_hrs}    sheet_name=AddSubCase
        Write Excel Cell	7   10    ${วันและเวลาที่ปลด_72_hrs}    sheet_name=AddSubCase
        Write Excel Cell	7   11    ${วันและเวลาที่แจ้งความ_ขยายจาก_72_ชม_เป็น_7_วัน}    sheet_name=AddSubCase
        Write Excel Cell	7   12    ${วันและเวลาที่_Fraud_พิจารณาอายัดตามมาตรา_6_7_วัน}    sheet_name=AddSubCase
        Write Excel Cell	7   13    ${วันและเวลาที่ปลด_7_วัน}    sheet_name=AddSubCase
        Write Excel Cell	7   17    ${วันและเวลาที่อายัดจากตำรวจ}    sheet_name=AddSubCase
        Write Excel Cell	7   18    ${วันและเวลาที่ปลดจากตำรวจ}    sheet_name=AddSubCase

        ${ประเภทของการอายัดจากธนาคาร}=    ประเภทของการอายัดจากธนาคาร 'random'
        Write Excel Cell	7   14    ${ประเภทของการอายัดจากธนาคาร}    sheet_name=AddSubCase
        IF  '${ประเภทของการอายัดจากธนาคาร}' == 'ระงับเฉพาะยอดเงิน'
             ${จำนวนเงินธุรกรรมที่ระงับจากธนาคาร}=   create transacion amount 'random'
             ${จำนวนเงินคงเหลือหลังอายัดจากธนาคาร}=   create transacion amount 'random'
             Write Excel Cell	7   15    ${จำนวนเงินธุรกรรมที่ระงับจากธนาคาร}    sheet_name=AddSubCase
             Write Excel Cell	7   16    ${จำนวนเงินคงเหลือหลังอายัดจากธนาคาร}    sheet_name=AddSubCase
        END
        ${ประเภทของหมายอายัดจากตำรวจ}=    ประเภทของหมายอายัดจากตำรวจ 'random'
        Write Excel Cell	7   19    ${ประเภทของหมายอายัดจากตำรวจ}    sheet_name=AddSubCase
        IF   '${ประเภทของหมายอายัดจากตำรวจ}' == 'หมายอายัดเฉพาะยอดเงินที่ระบุ (Q)'
             ${จำนวนวงเงินที่อายัดจากตำรวจ}=   create transacion amount 'random'
              Write Excel Cell	7   21    ${จำนวนวงเงินที่อายัดจากตำรวจ}    sheet_name=AddSubCase
        END
        IF   '${ประเภทของหมายอายัดจากตำรวจ}' != '${EMPTY}'
             ${ใส่หมายอายัดจากตำรวจ}=   random_string   10
             ${ใส่หมายปลดอายัดจากตำรวจ}=   random_string   10
             Write Excel Cell	7   20    ${ใส่หมายอายัดจากตำรวจ}    sheet_name=AddSubCase
              Write Excel Cell	7   22    ${ใส่หมายปลดอายัดจากตำรวจ}    sheet_name=AddSubCase            
        END
    ${recv_bank_short_name}=    set variable  ${bank_dict}[${person_account_name}]
    ${send_bank_short_name}=    set variable  ${bank_dict}[${sending_account_name}]
    set test variable   ${FILENAME}    ${FOLDER}/Subcase_horse2_${master_case_id}_${send_bank_short_name}_${recv_bank_short_name}
    Save Excel Document      filename=${CURDIR}/${FILENAME}.xlsx
    Close Current Excel Document
    Create transaction subcase horse 2 to '1' bank account in '${FILENAME}' with account info '${horse}'
    END

Create Subcase '${FOLDER}' Horse 2 from bank name '${SENDING_BANK}' to '${RECV_BANK_LIST}' in relation '${RELATION}'
    [Documentation]    Test Case SUBMIT
    Open Excel Document      filename=${CURDIR}/Subcase_Template.xlsx   doc_id=docname1
    Write Excel Cell	3   1    ${master_case_id}    sheet_name=AddSubCase
    # ${horse}=    Get From List    ${horse_1_list}    ${i}
    ${horse}=    set variable   ${horse_list_dict}[${RELATION}]
    ${person_id}=    set variable  ${horse}[horse_id]
    ${person_type}=    set variable  ${horse}[horse_type]        
    ${person_name}=    set variable  ${horse}[horse_name]
    ${person_lastname}=    set variable  ${horse}[horse_lastname]
    ${person_account_no}=    set variable  ${horse}[horse_account_no]
    ${person_account_name}=    set variable  ${horse}[horse_account_name]
    ${person_phone_no}=    create phone no 'random'
    Append to File    ${CURDIR}/temp_trans.txt    ${FOLDER},${SENDING_BANK},${person_account_no},${person_id}\n
    #   after_create_case , before_create_case , today
    ${วันและเวลาที่อายัด_72_hrs}=    create block_unblock date time 'today'
    ${วันและเวลาที่ปลด_72_hrs}=    create block_unblock date time 'after_create_case'
    ${วันและเวลาที่แจ้งความ_ขยายจาก_72_ชม_เป็น_7_วัน}=    create block_unblock date time 'after_create_case'
    ${วันและเวลาที่_Fraud_พิจารณาอายัดตามมาตรา_6_7_วัน}=    create block_unblock date time 'after_create_case'
    ${วันและเวลาที่ปลด_7_วัน}=    create block_unblock date time 'after_create_case'
    ${วันและเวลาที่อายัดจากตำรวจ}=    create block_unblock date time 'today'
    ${วันและเวลาที่ปลดจากตำรวจ}=    create block_unblock date time 'after_create_case'
    Write Excel Cell	7   1    ${person_id}    sheet_name=AddSubCase
    Write Excel Cell	7   2    ${person_type}    sheet_name=AddSubCase
    Write Excel Cell	7   3    ${person_name}    sheet_name=AddSubCase
    Write Excel Cell	7   4    ${person_lastname}    sheet_name=AddSubCase
    Write Excel Cell	7   5    ${person_account_no}    sheet_name=AddSubCase
    Write Excel Cell	7   6    ${person_account_name}    sheet_name=AddSubCase
    Write Excel Cell	7   8    ${person_phone_no}    sheet_name=AddSubCase
    Write Excel Cell	7   9    ${วันและเวลาที่อายัด_72_hrs}    sheet_name=AddSubCase
    Write Excel Cell	7   10    ${วันและเวลาที่ปลด_72_hrs}    sheet_name=AddSubCase
    Write Excel Cell	7   11    ${วันและเวลาที่แจ้งความ_ขยายจาก_72_ชม_เป็น_7_วัน}    sheet_name=AddSubCase
    Write Excel Cell	7   12    ${วันและเวลาที่_Fraud_พิจารณาอายัดตามมาตรา_6_7_วัน}    sheet_name=AddSubCase
    Write Excel Cell	7   13    ${วันและเวลาที่ปลด_7_วัน}    sheet_name=AddSubCase
    Write Excel Cell	7   17    ${วันและเวลาที่อายัดจากตำรวจ}    sheet_name=AddSubCase
    Write Excel Cell	7   18    ${วันและเวลาที่ปลดจากตำรวจ}    sheet_name=AddSubCase

    ${ประเภทของการอายัดจากธนาคาร}=    ประเภทของการอายัดจากธนาคาร 'random'
    Write Excel Cell	7   14    ${ประเภทของการอายัดจากธนาคาร}    sheet_name=AddSubCase
    IF  '${ประเภทของการอายัดจากธนาคาร}' == 'ระงับเฉพาะยอดเงิน'
        ${จำนวนเงินธุรกรรมที่ระงับจากธนาคาร}=   create transacion amount 'random'
        ${จำนวนเงินคงเหลือหลังอายัดจากธนาคาร}=   create transacion amount 'random'
        Write Excel Cell	7   15    ${จำนวนเงินธุรกรรมที่ระงับจากธนาคาร}    sheet_name=AddSubCase
        Write Excel Cell	7   16    ${จำนวนเงินคงเหลือหลังอายัดจากธนาคาร}    sheet_name=AddSubCase
    END
    ${ประเภทของหมายอายัดจากตำรวจ}=    ประเภทของหมายอายัดจากตำรวจ 'random'
    Write Excel Cell	7   19    ${ประเภทของหมายอายัดจากตำรวจ}    sheet_name=AddSubCase
    IF   '${ประเภทของหมายอายัดจากตำรวจ}' == 'หมายอายัดเฉพาะยอดเงินที่ระบุ (Q)'
       ${จำนวนวงเงินที่อายัดจากตำรวจ}=   create transacion amount 'random'
        Write Excel Cell	7   21    ${จำนวนวงเงินที่อายัดจากตำรวจ}    sheet_name=AddSubCase
    END
    IF   '${ประเภทของหมายอายัดจากตำรวจ}' != '${EMPTY}'
        ${ใส่หมายอายัดจากตำรวจ}=   random_string   10
        ${ใส่หมายปลดอายัดจากตำรวจ}=   random_string   10
        Write Excel Cell	7   20    ${ใส่หมายอายัดจากตำรวจ}    sheet_name=AddSubCase
        Write Excel Cell	7   22    ${ใส่หมายปลดอายัดจากตำรวจ}    sheet_name=AddSubCase            
    END
    ${subcase_filename}=   set variable   ${FOLDER}/Subcase_horse2_${master_case_id}_${RELATION}_${RECV_BANK_LIST}
    Save Excel Document      filename=${CURDIR}/${subcase_filename}.xlsx
    Close Current Excel Document
    Create transaction subcase to bank '${RECV_BANK_LIST}' bank account in '${subcase_filename}' with account info '${horse}'
    Search subCaseId and childSubCaseId with master case '${master_case_id}' and receving account no '${person_account_no}' bank name '${SENDING_BANK}'
    Add Sub Case via API '${subcase_filename}' bank name '${SENDING_BANK}'

Create Subcase '${FOLDER}' Horse 2 ไม่มีหมายอายัด from bank name '${SENDING_BANK}' to '${RECV_BANK_LIST}' in relation '${RELATION}'
    [Documentation]    Test Case SUBMIT
    Open Excel Document      filename=${CURDIR}/Subcase_Template.xlsx   doc_id=docname1
    Write Excel Cell	3   1    ${master_case_id}    sheet_name=AddSubCase
    # ${horse}=    Get From List    ${horse_1_list}    ${i}
    ${horse}=    set variable   ${horse_list_dict}[${RELATION}]
    ${person_id}=    set variable  ${horse}[horse_id]
    ${person_type}=    set variable  ${horse}[horse_type]        
    ${person_name}=    set variable  ${horse}[horse_name]
    ${person_lastname}=    set variable  ${horse}[horse_lastname]
    ${person_account_no}=    set variable  ${horse}[horse_account_no]
    ${person_account_name}=    set variable  ${horse}[horse_account_name]
    ${person_phone_no}=    create phone no 'random'
    Append to File    ${CURDIR}/temp_trans.txt    ${FOLDER},${SENDING_BANK},${person_account_no},${person_id}\n
    #   after_create_case , before_create_case , today
    Write Excel Cell	7   1    ${person_id}    sheet_name=AddSubCase
    Write Excel Cell	7   2    ${person_type}    sheet_name=AddSubCase
    Write Excel Cell	7   3    ${person_name}    sheet_name=AddSubCase
    Write Excel Cell	7   4    ${person_lastname}    sheet_name=AddSubCase
    Write Excel Cell	7   5    ${person_account_no}    sheet_name=AddSubCase
    Write Excel Cell	7   6    ${person_account_name}    sheet_name=AddSubCase
    Write Excel Cell	7   8    ${person_phone_no}    sheet_name=AddSubCase
    ${subcase_filename}=   set variable   ${FOLDER}/Subcase_horse2_${master_case_id}_${RELATION}_${RECV_BANK_LIST}
    Save Excel Document      filename=${CURDIR}/${subcase_filename}.xlsx
    Close Current Excel Document
    Create transaction subcase to bank '${RECV_BANK_LIST}' bank account in '${subcase_filename}' with account info '${horse}'
    Search subCaseId and childSubCaseId with master case '${master_case_id}' and receving account no '${person_account_no}' bank name '${SENDING_BANK}'
    Add Sub Case via API '${subcase_filename}' bank name '${SENDING_BANK}'

Create Subcase ไม่มีหมายอายัด '${FOLDER}' Horse 2 from bank name '${SENDING_BANK}' to '${RECV_BANK_LIST}' in relation '${RELATION}'
    [Documentation]    Test Case SUBMIT
    Open Excel Document      filename=${CURDIR}/Subcase_Template.xlsx   doc_id=docname1
    Write Excel Cell	3   1    ${master_case_id}    sheet_name=AddSubCase
    # ${horse}=    Get From List    ${horse_1_list}    ${i}
    ${horse}=    set variable   ${horse_list_dict}[${RELATION}]
    ${person_id}=    set variable  ${horse}[horse_id]
    ${person_type}=    set variable  ${horse}[horse_type]        
    ${person_name}=    set variable  ${horse}[horse_name]
    ${person_lastname}=    set variable  ${horse}[horse_lastname]
    ${person_account_no}=    set variable  ${horse}[horse_account_no]
    ${person_account_name}=    set variable  ${horse}[horse_account_name]
    ${person_phone_no}=    create phone no 'random'
    #   after_create_case , before_create_case , today
    Write Excel Cell	7   1    ${person_id}    sheet_name=AddSubCase
    Write Excel Cell	7   2    ${person_type}    sheet_name=AddSubCase
    Write Excel Cell	7   3    ${person_name}    sheet_name=AddSubCase
    Write Excel Cell	7   4    ${person_lastname}    sheet_name=AddSubCase
    Write Excel Cell	7   5    ${person_account_no}    sheet_name=AddSubCase
    Write Excel Cell	7   6    ${person_account_name}    sheet_name=AddSubCase
    Write Excel Cell	7   8    ${person_phone_no}    sheet_name=AddSubCase

    ${subcase_filename}=   set variable   ${FOLDER}/Subcase_horse2_${master_case_id}_${RELATION}_${RECV_BANK_LIST}
    Save Excel Document      filename=${CURDIR}/${subcase_filename}.xlsx
    Close Current Excel Document
    Create transaction subcase to bank '${RECV_BANK_LIST}' bank account in '${subcase_filename}' with account info '${horse}'
    Search subCaseId and childSubCaseId with master case '${master_case_id}' and receving account no '${person_account_no}' bank name '${SENDING_BANK}'
    Add Sub Case via API '${subcase_filename}' bank name '${SENDING_BANK}'

Create Subcase ไม่มีหมายอายัด '${FOLDER}' Horse 1 from bank name '${SENDING_BANK}' to relation '${RECV_BANK_LIST}' 
    [Documentation]    Test Case SUBMIT
    Open Excel Document      filename=${CURDIR}/Subcase_Template.xlsx   doc_id=docname1
    Write Excel Cell	3   1    ${master_case_id}    sheet_name=AddSubCase
    # ${horse}=    Get From List    ${horse_1_list}    ${i}
    ${horse}=    set variable   ${horse_list_dict}[${SENDING_BANK}]
    ${person_id}=    set variable  ${horse}[horse_id]
    ${person_type}=    set variable  ${horse}[horse_type]        
    ${person_name}=    set variable  ${horse}[horse_name]
    ${person_lastname}=    set variable  ${horse}[horse_lastname]
    ${person_account_no}=    set variable  ${horse}[horse_account_no]
    ${person_account_name}=    set variable  ${horse}[horse_account_name]
    ${person_phone_no}=    create phone no 'random'
    #   after_create_case , before_create_case , today
    Write Excel Cell	7   1    ${person_id}    sheet_name=AddSubCase
    Write Excel Cell	7   2    ${person_type}    sheet_name=AddSubCase
    Write Excel Cell	7   3    ${person_name}    sheet_name=AddSubCase
    Write Excel Cell	7   4    ${person_lastname}    sheet_name=AddSubCase
    Write Excel Cell	7   5    ${person_account_no}    sheet_name=AddSubCase
    Write Excel Cell	7   6    ${person_account_name}    sheet_name=AddSubCase
    Write Excel Cell	7   8    ${person_phone_no}    sheet_name=AddSubCase

    ${subcase_filename}=   set variable   ${FOLDER}/Subcase_horse1_${master_case_id}_${SENDING_BANK}
    Save Excel Document      filename=${CURDIR}/${subcase_filename}.xlsx
    Close Current Excel Document
    set test variable    ${test_case_name}    ${FOLDER}
    Create transaction subcase with relation to bank fix receving bank '${RECV_BANK_LIST}' bank account in '${subcase_filename}' with account info '${horse}'
    Search subCaseId and childSubCaseId with master case '${master_case_id}' and receving account no '${person_account_no}' bank name '${SENDING_BANK}'
    Add Sub Case via API '${subcase_filename}' bank name '${SENDING_BANK}'

Create Subcase ไม่มีหมายอายัด '${FOLDER}' Horse 1 from bank name '${SENDING_BANK}' to relation '${RECV_BANK_LIST}' personal null 4
    [Documentation]    Test Case SUBMIT
    Open Excel Document      filename=${CURDIR}/Subcase_Template.xlsx   doc_id=docname1
    Write Excel Cell	3   1    ${master_case_id}    sheet_name=AddSubCase
    # ${horse}=    Get From List    ${horse_1_list}    ${i}
    ${horse}=    set variable   ${horse_list_dict}[${SENDING_BANK}]
    ${person_id}=    set variable  ${horse}[horse_id]
    ${person_type}=    set variable  ${horse}[horse_type]        
    ${person_name}=    set variable  ${horse}[horse_name]
    ${person_lastname}=    set variable  ${horse}[horse_lastname]
    ${person_account_no}=    set variable  ${horse}[horse_account_no]
    ${person_account_name}=    set variable  ${horse}[horse_account_name]
    ${person_phone_no}=    create phone no 'random'
    #   after_create_case , before_create_case , today
#     Write Excel Cell	7   1    ${person_id}    sheet_name=AddSubCase
#     Write Excel Cell	7   2    ${person_type}    sheet_name=AddSubCase
    Write Excel Cell	7   3    ${person_name}    sheet_name=AddSubCase
    Write Excel Cell	7   4    ${person_lastname}    sheet_name=AddSubCase
    Write Excel Cell	7   5    ${person_account_no}    sheet_name=AddSubCase
    Write Excel Cell	7   6    ${person_account_name}    sheet_name=AddSubCase
    Write Excel Cell	7   8    ${person_phone_no}    sheet_name=AddSubCase

    ${subcase_filename}=   set variable   ${FOLDER}/Subcase_horse1_${master_case_id}_${SENDING_BANK}
    Save Excel Document      filename=${CURDIR}/${subcase_filename}.xlsx
    Close Current Excel Document
    set test variable    ${test_case_name}    ${FOLDER}
    Create transaction subcase with relation to bank fix receving bank '${RECV_BANK_LIST}' bank account in '${subcase_filename}' with account info '${horse}' personal null 4
    Search subCaseId and childSubCaseId with master case '${master_case_id}' and receving account no '${person_account_no}' bank name '${SENDING_BANK}'
    Add Sub Case via API '${subcase_filename}' bank name '${SENDING_BANK}'



Create Subcase ไม่มีหมายอายัด '${FOLDER}' Horse 1 from bank name '${SENDING_BANK}' to '${RECV_BANK_LIST}' บุคคลเก่าและบัญชีใหม่ บุคคลคนเดียวกันเปลี่ยนชื่อ
    [Documentation]    Test Case SUBMIT
    Open Excel Document      filename=${CURDIR}/Subcase_Template.xlsx   doc_id=docname1
    Write Excel Cell	3   1    ${master_case_id}    sheet_name=AddSubCase
    # ${horse}=    Get From List    ${horse_1_list}    ${i}
    ${horse}=    set variable   ${horse_list_dict}[${SENDING_BANK}]
    ${person_id}=    set variable  ${horse}[horse_id]
    ${person_type}=    set variable  ${horse}[horse_type]        
    ${person_name}=    set variable  ${horse}[horse_name]
    ${person_lastname}=    set variable  ${horse}[horse_lastname]
    ${person_account_no}=    set variable  ${horse}[horse_account_no]
    ${person_account_name}=    set variable  ${horse}[horse_account_name]
    ${person_phone_no}=    create phone no 'random'
    #   after_create_case , before_create_case , today
    Write Excel Cell	7   1    ${person_id}    sheet_name=AddSubCase
    Write Excel Cell	7   2    ${person_type}    sheet_name=AddSubCase
    Write Excel Cell	7   3    ${person_name}    sheet_name=AddSubCase
    Write Excel Cell	7   4    ${person_lastname}    sheet_name=AddSubCase
    Write Excel Cell	7   5    ${person_account_no}    sheet_name=AddSubCase
    Write Excel Cell	7   6    ${person_account_name}    sheet_name=AddSubCase
    Write Excel Cell	7   8    ${person_phone_no}    sheet_name=AddSubCase

    ${subcase_filename}=   set variable   ${FOLDER}/Subcase_horse1_${master_case_id}_${SENDING_BANK}
    Save Excel Document      filename=${CURDIR}/${subcase_filename}.xlsx
    Close Current Excel Document
    Create transaction subcase to bank บุคคลเก่าและบัญชีใหม่ บุคคลคนเดียวกันเปลี่ยนชื่อ '${RECV_BANK_LIST}' bank account in '${subcase_filename}' with account info '${horse}'
    Search subCaseId and childSubCaseId with master case '${master_case_id}' and receving account no '${person_account_no}' bank name '${SENDING_BANK}'
    Add Sub Case via API '${subcase_filename}' bank name '${SENDING_BANK}'

Create Subcase ไม่มีหมายอายัด '${FOLDER}' Horse 1 from bank name '${SENDING_BANK}' to '${RECV_BANK_LIST}' บุคคลเก่าและบัญชีใหม่ ลักษณะเคสซื้อขายสินค้า
    [Documentation]    Test Case SUBMIT
    Open Excel Document      filename=${CURDIR}/Subcase_Template.xlsx   doc_id=docname1
    Write Excel Cell	3   1    ${master_case_id}    sheet_name=AddSubCase
    # ${horse}=    Get From List    ${horse_1_list}    ${i}
    ${horse}=    set variable   ${horse_list_dict}[${SENDING_BANK}]
    ${person_id}=    set variable  ${horse}[horse_id]
    ${person_type}=    set variable  ${horse}[horse_type]        
    ${person_name}=    set variable  ${horse}[horse_name]
    ${person_lastname}=    set variable  ${horse}[horse_lastname]
    ${person_account_no}=    set variable  ${horse}[horse_account_no]
    ${person_account_name}=    set variable  ${horse}[horse_account_name]
    ${person_phone_no}=    create phone no 'random'
    #   after_create_case , before_create_case , today
    Write Excel Cell	7   1    ${person_id}    sheet_name=AddSubCase
    Write Excel Cell	7   2    ${person_type}    sheet_name=AddSubCase
    Write Excel Cell	7   3    ${person_name}    sheet_name=AddSubCase
    Write Excel Cell	7   4    ${person_lastname}    sheet_name=AddSubCase
    Write Excel Cell	7   5    ${person_account_no}    sheet_name=AddSubCase
    Write Excel Cell	7   6    ${person_account_name}    sheet_name=AddSubCase
    Write Excel Cell	7   8    ${person_phone_no}    sheet_name=AddSubCase

    ${subcase_filename}=   set variable   ${FOLDER}/Subcase_horse1_${master_case_id}_${SENDING_BANK}
    Save Excel Document      filename=${CURDIR}/${subcase_filename}.xlsx
    Close Current Excel Document
    Create transaction subcase to bank บุคคลเก่าและบัญชีใหม่ '${RECV_BANK_LIST}' bank account in '${subcase_filename}' with account info '${horse}'
    Search subCaseId and childSubCaseId with master case '${master_case_id}' and receving account no '${person_account_no}' bank name '${SENDING_BANK}'
    Add Sub Case via API '${subcase_filename}' bank name '${SENDING_BANK}'

Create Subcase ไม่มีหมายอายัด '${FOLDER}' Horse 1 from bank name '${SENDING_BANK}' to '${RECV_BANK_LIST}' บุคคลเก่าและบัญชีใหม่
    [Documentation]    Test Case SUBMIT
    Open Excel Document      filename=${CURDIR}/Subcase_Template.xlsx   doc_id=docname1
    Write Excel Cell	3   1    ${master_case_id}    sheet_name=AddSubCase
    # ${horse}=    Get From List    ${horse_1_list}    ${i}
    ${horse}=    set variable   ${horse_list_dict}[${SENDING_BANK}]
    ${person_id}=    set variable  ${horse}[horse_id]
    ${person_type}=    set variable  ${horse}[horse_type]        
    ${person_name}=    set variable  ${horse}[horse_name]
    ${person_lastname}=    set variable  ${horse}[horse_lastname]
    ${person_account_no}=    set variable  ${horse}[horse_account_no]
    ${person_account_name}=    set variable  ${horse}[horse_account_name]
    ${person_phone_no}=    create phone no 'random'
    #   after_create_case , before_create_case , today
    Write Excel Cell	7   1    ${person_id}    sheet_name=AddSubCase
    Write Excel Cell	7   2    ${person_type}    sheet_name=AddSubCase
    Write Excel Cell	7   3    ${person_name}    sheet_name=AddSubCase
    Write Excel Cell	7   4    ${person_lastname}    sheet_name=AddSubCase
    Write Excel Cell	7   5    ${person_account_no}    sheet_name=AddSubCase
    Write Excel Cell	7   6    ${person_account_name}    sheet_name=AddSubCase
    Write Excel Cell	7   8    ${person_phone_no}    sheet_name=AddSubCase

    ${subcase_filename}=   set variable   ${FOLDER}/Subcase_horse1_${master_case_id}_${SENDING_BANK}
    Save Excel Document      filename=${CURDIR}/${subcase_filename}.xlsx
    Close Current Excel Document
    Create transaction subcase to bank บุคคลเก่าและบัญชีใหม่ '${RECV_BANK_LIST}' bank account in '${subcase_filename}' with account info '${horse}'
    Search subCaseId and childSubCaseId with master case '${master_case_id}' and receving account no '${person_account_no}' bank name '${SENDING_BANK}'
    Add Sub Case via API '${subcase_filename}' bank name '${SENDING_BANK}'

Create Subcase ไม่มีหมายอายัด '${FOLDER}' Horse 1 from bank name '${SENDING_BANK}' to '${RECV_BANK_LIST}' บุคคลเก่าและบัญชีใหม่ ไม่มีข้อมูลเลขบัตรประชาชน
    [Documentation]    Test Case SUBMIT
    Open Excel Document      filename=${CURDIR}/Subcase_Template.xlsx   doc_id=docname1
    Write Excel Cell	3   1    ${master_case_id}    sheet_name=AddSubCase
    # ${horse}=    Get From List    ${horse_1_list}    ${i}
    ${horse}=    set variable   ${horse_list_dict}[${SENDING_BANK}]
    ${person_id}=    set variable  ${horse}[horse_id]
    ${person_type}=    set variable  ${horse}[horse_type]        
    ${person_name}=    set variable  ${horse}[horse_name]
    ${person_lastname}=    set variable  ${horse}[horse_lastname]
    ${person_account_no}=    set variable  ${horse}[horse_account_no]
    ${person_account_name}=    set variable  ${horse}[horse_account_name]
    ${person_phone_no}=    create phone no 'random'
    #   after_create_case , before_create_case , today
    Write Excel Cell	7   1    ${person_id}    sheet_name=AddSubCase
    Write Excel Cell	7   2    ${person_type}    sheet_name=AddSubCase
    Write Excel Cell	7   3    ${person_name}    sheet_name=AddSubCase
    Write Excel Cell	7   4    ${person_lastname}    sheet_name=AddSubCase
    Write Excel Cell	7   5    ${person_account_no}    sheet_name=AddSubCase
    Write Excel Cell	7   6    ${person_account_name}    sheet_name=AddSubCase
    Write Excel Cell	7   8    ${person_phone_no}    sheet_name=AddSubCase

    ${subcase_filename}=   set variable   ${FOLDER}/Subcase_horse1_${master_case_id}_${SENDING_BANK}
    Save Excel Document      filename=${CURDIR}/${subcase_filename}.xlsx
    Close Current Excel Document
    Create transaction subcase to bank บุคคลเก่าและบัญชีใหม่ ไม่มีข้อมูลเลขบัตรประชาชน '${RECV_BANK_LIST}' bank account in '${subcase_filename}' with account info '${horse}'
    Search subCaseId and childSubCaseId with master case '${master_case_id}' and receving account no '${person_account_no}' bank name '${SENDING_BANK}'
    Add Sub Case via API '${subcase_filename}' bank name '${SENDING_BANK}'

Create Subcase ไม่มีหมายอายัด '${FOLDER}' Horse 1 from bank name '${SENDING_BANK}' to '${RECV_BANK_LIST}' บุคคลเก่าและบัญชีใหม่ นิติบุคคล
    [Documentation]    Test Case SUBMIT
    Open Excel Document      filename=${CURDIR}/Subcase_Template.xlsx   doc_id=docname1
    Write Excel Cell	3   1    ${master_case_id}    sheet_name=AddSubCase
    # ${horse}=    Get From List    ${horse_1_list}    ${i}
    ${horse}=    set variable   ${horse_list_dict}[${SENDING_BANK}]
    ${person_id}=    set variable  ${horse}[horse_id]
    ${person_type}=    set variable  ${horse}[horse_type]        
    ${person_name}=    set variable  ${horse}[horse_name]
    ${person_lastname}=    set variable  ${horse}[horse_lastname]
    ${person_account_no}=    set variable  ${horse}[horse_account_no]
    ${person_account_name}=    set variable  ${horse}[horse_account_name]
    ${person_phone_no}=    create phone no 'random'
    #   after_create_case , before_create_case , today
    Write Excel Cell	7   1    ${person_id}    sheet_name=AddSubCase
    Write Excel Cell	7   2    ${person_type}    sheet_name=AddSubCase
    Write Excel Cell	7   3    ${person_name}    sheet_name=AddSubCase
    Write Excel Cell	7   4    ${person_lastname}    sheet_name=AddSubCase
    Write Excel Cell	7   5    ${person_account_no}    sheet_name=AddSubCase
    Write Excel Cell	7   6    ${person_account_name}    sheet_name=AddSubCase
    Write Excel Cell	7   8    ${person_phone_no}    sheet_name=AddSubCase

    ${subcase_filename}=   set variable   ${FOLDER}/Subcase_horse1_${master_case_id}_${SENDING_BANK}
    Save Excel Document      filename=${CURDIR}/${subcase_filename}.xlsx
    Close Current Excel Document
    Create transaction subcase to bank บุคคลเก่าและบัญชีใหม่ '${RECV_BANK_LIST}' นิติบุคคล bank account in '${subcase_filename}' with account info '${horse}'
    Search subCaseId and childSubCaseId with master case '${master_case_id}' and receving account no '${person_account_no}' bank name '${SENDING_BANK}'
    Add Sub Case via API '${subcase_filename}' bank name '${SENDING_BANK}'

Create Subcase ไม่มีหมายอายัด '${FOLDER}' Horse 1 from bank name '${SENDING_BANK}' to '${RECV_BANK_LIST}' บุคคลเก่าและบัญชีเก่า บุคคลคนเดียวกันเปลี่ยนชื่อ
    [Documentation]    Test Case SUBMIT
    Open Excel Document      filename=${CURDIR}/Subcase_Template.xlsx   doc_id=docname1
    Write Excel Cell	3   1    ${master_case_id}    sheet_name=AddSubCase
    # ${horse}=    Get From List    ${horse_1_list}    ${i}
    ${horse}=    set variable   ${horse_list_dict}[${SENDING_BANK}]
    ${person_id}=    set variable  ${horse}[horse_id]
    ${person_type}=    set variable  ${horse}[horse_type]        
    ${person_name}=    set variable  ${horse}[horse_name]
    ${person_lastname}=    set variable  ${horse}[horse_lastname]
    ${person_account_no}=    set variable  ${horse}[horse_account_no]
    ${person_account_name}=    set variable  ${horse}[horse_account_name]
    ${person_phone_no}=    create phone no 'random'
    #   after_create_case , before_create_case , today
    Write Excel Cell	7   1    ${person_id}    sheet_name=AddSubCase
    Write Excel Cell	7   2    ${person_type}    sheet_name=AddSubCase
    Write Excel Cell	7   3    ${person_name}    sheet_name=AddSubCase
    Write Excel Cell	7   4    ${person_lastname}    sheet_name=AddSubCase
    Write Excel Cell	7   5    ${person_account_no}    sheet_name=AddSubCase
    Write Excel Cell	7   6    ${person_account_name}    sheet_name=AddSubCase
    Write Excel Cell	7   8    ${person_phone_no}    sheet_name=AddSubCase

    ${subcase_filename}=   set variable   ${FOLDER}/Subcase_horse1_${master_case_id}_${SENDING_BANK}
    Save Excel Document      filename=${CURDIR}/${subcase_filename}.xlsx
    Close Current Excel Document
    Create transaction subcase to bank บุคคลเก่าและบัญชีเก่า บุคคลคนเดียวกันเปลี่ยนชื่อ '${RECV_BANK_LIST}' bank account in '${subcase_filename}' with account info '${horse}'
    Search subCaseId and childSubCaseId with master case '${master_case_id}' and receving account no '${person_account_no}' bank name '${SENDING_BANK}'
    Add Sub Case via API '${subcase_filename}' bank name '${SENDING_BANK}'

Create Subcase ไม่มีหมายอายัด '${FOLDER}' Horse 1 from bank name '${SENDING_BANK}' to '${RECV_BANK_LIST}' บุคคลเก่าและบัญชีเก่า บุคคลคนเดียวกันเปลี่ยนชื่อ
    [Documentation]    Test Case SUBMIT
    Open Excel Document      filename=${CURDIR}/Subcase_Template.xlsx   doc_id=docname1
    Write Excel Cell	3   1    ${master_case_id}    sheet_name=AddSubCase
    # ${horse}=    Get From List    ${horse_1_list}    ${i}
    ${horse}=    set variable   ${horse_list_dict}[${SENDING_BANK}]
    ${person_id}=    set variable  ${horse}[horse_id]
    ${person_type}=    set variable  ${horse}[horse_type]        
    ${person_name}=    set variable  ${horse}[horse_name]
    ${person_lastname}=    set variable  ${horse}[horse_lastname]
    ${person_account_no}=    set variable  ${horse}[horse_account_no]
    ${person_account_name}=    set variable  ${horse}[horse_account_name]
    ${person_phone_no}=    create phone no 'random'
    #   after_create_case , before_create_case , today
    Write Excel Cell	7   1    ${person_id}    sheet_name=AddSubCase
    Write Excel Cell	7   2    ${person_type}    sheet_name=AddSubCase
    Write Excel Cell	7   3    ${person_name}    sheet_name=AddSubCase
    Write Excel Cell	7   4    ${person_lastname}    sheet_name=AddSubCase
    Write Excel Cell	7   5    ${person_account_no}    sheet_name=AddSubCase
    Write Excel Cell	7   6    ${person_account_name}    sheet_name=AddSubCase
    Write Excel Cell	7   8    ${person_phone_no}    sheet_name=AddSubCase

    ${subcase_filename}=   set variable   ${FOLDER}/Subcase_horse1_${master_case_id}_${SENDING_BANK}
    Save Excel Document      filename=${CURDIR}/${subcase_filename}.xlsx
    Close Current Excel Document
    Create transaction subcase to bank บุคคลเก่าและบัญชีเก่า บุคคลคนเดียวกันเปลี่ยนชื่อ '${RECV_BANK_LIST}' bank account in '${subcase_filename}' with account info '${horse}'
    Search subCaseId and childSubCaseId with master case '${master_case_id}' and receving account no '${person_account_no}' bank name '${SENDING_BANK}'
    Add Sub Case via API '${subcase_filename}' bank name '${SENDING_BANK}'


Create Subcase ไม่มีหมายอายัด '${FOLDER}' Horse 1 from bank name '${SENDING_BANK}' to '${RECV_BANK_LIST}' บุคคลเก่าและบัญชีเก่า
    [Documentation]    Test Case SUBMIT
    Open Excel Document      filename=${CURDIR}/Subcase_Template.xlsx   doc_id=docname1
    Write Excel Cell	3   1    ${master_case_id}    sheet_name=AddSubCase
    # ${horse}=    Get From List    ${horse_1_list}    ${i}
    ${horse}=    set variable   ${horse_list_dict}[${SENDING_BANK}]
    ${person_id}=    set variable  ${horse}[horse_id]
    ${person_type}=    set variable  ${horse}[horse_type]        
    ${person_name}=    set variable  ${horse}[horse_name]
    ${person_lastname}=    set variable  ${horse}[horse_lastname]
    ${person_account_no}=    set variable  ${horse}[horse_account_no]
    ${person_account_name}=    set variable  ${horse}[horse_account_name]
    ${person_phone_no}=    create phone no 'random'
    #   after_create_case , before_create_case , today
    Write Excel Cell	7   1    ${person_id}    sheet_name=AddSubCase
    Write Excel Cell	7   2    ${person_type}    sheet_name=AddSubCase
    Write Excel Cell	7   3    ${person_name}    sheet_name=AddSubCase
    Write Excel Cell	7   4    ${person_lastname}    sheet_name=AddSubCase
    Write Excel Cell	7   5    ${person_account_no}    sheet_name=AddSubCase
    Write Excel Cell	7   6    ${person_account_name}    sheet_name=AddSubCase
    Write Excel Cell	7   8    ${person_phone_no}    sheet_name=AddSubCase

    ${subcase_filename}=   set variable   ${FOLDER}/Subcase_horse1_${master_case_id}_${SENDING_BANK}
    Save Excel Document      filename=${CURDIR}/${subcase_filename}.xlsx
    Close Current Excel Document
    Create transaction subcase to bank บุคคลเก่าและบัญชีเก่า '${RECV_BANK_LIST}' bank account in '${subcase_filename}' with account info '${horse}'
    Search subCaseId and childSubCaseId with master case '${master_case_id}' and receving account no '${person_account_no}' bank name '${SENDING_BANK}'
    Add Sub Case via API '${subcase_filename}' bank name '${SENDING_BANK}'


Create Subcase ไม่มีหมายอายัด '${FOLDER}' Horse 1 from bank name '${SENDING_BANK}' to '${RECV_BANK_LIST}' personal null 4
    [Documentation]    Test Case SUBMIT
    Open Excel Document      filename=${CURDIR}/Subcase_Template.xlsx   doc_id=docname1
    Write Excel Cell	3   1    ${master_case_id}    sheet_name=AddSubCase
    # ${horse}=    Get From List    ${horse_1_list}    ${i}
    ${horse}=    set variable   ${horse_list_dict}[${SENDING_BANK}]
    ${person_id}=    set variable  ${horse}[horse_id]
    ${person_type}=    set variable  ${horse}[horse_type]        
    ${person_name}=    set variable  ${horse}[horse_name]
    ${person_lastname}=    set variable  ${horse}[horse_lastname]
    ${person_account_no}=    set variable  ${horse}[horse_account_no]
    ${person_account_name}=    set variable  ${horse}[horse_account_name]
    ${person_phone_no}=    create phone no 'random'
    #   after_create_case , before_create_case , today
#     Write Excel Cell	7   1    ${person_id}    sheet_name=AddSubCase
#     Write Excel Cell	7   2    ${person_type}    sheet_name=AddSubCase
    Write Excel Cell	7   3    ${person_name}    sheet_name=AddSubCase
    Write Excel Cell	7   4    ${person_lastname}    sheet_name=AddSubCase
    Write Excel Cell	7   5    ${person_account_no}    sheet_name=AddSubCase
    Write Excel Cell	7   6    ${person_account_name}    sheet_name=AddSubCase
    Write Excel Cell	7   8    ${person_phone_no}    sheet_name=AddSubCase
             ${person_name} =	Remove String	${person_name}   \n
     ${person_lastname} =	Remove String	${person_lastname}   \n
     ${person_id} =	Remove String	${person_id}   \n
    Append to File    ${CURDIR}/temp_trans.txt    Horse1,${master_case_id},${test_case_name},${person_name},${person_lastname},${person_account_no},${person_account_no},${person_id} \n

    ${subcase_filename}=   set variable   ${FOLDER}/Subcase_horse1_${master_case_id}_${SENDING_BANK}
    Save Excel Document      filename=${CURDIR}/${subcase_filename}.xlsx
    Close Current Excel Document
    Create transaction subcase to bank '${RECV_BANK_LIST}' bank account in '${subcase_filename}' with account info '${horse}' personal null 4
    Search subCaseId and childSubCaseId with master case '${master_case_id}' and receving account no '${person_account_no}' bank name '${SENDING_BANK}'
    Add Sub Case via API '${subcase_filename}' bank name '${SENDING_BANK}'

Create Subcase ไม่มีหมายอายัด '${FOLDER}' Horse 1 from bank name '${SENDING_BANK}' to '${RECV_BANK_LIST}'
    [Documentation]    Test Case SUBMIT
    Open Excel Document      filename=${CURDIR}/Subcase_Template.xlsx   doc_id=docname1
    Write Excel Cell	3   1    ${master_case_id}    sheet_name=AddSubCase
    # ${horse}=    Get From List    ${horse_1_list}    ${i}
    ${horse}=    set variable   ${horse_list_dict}[${SENDING_BANK}]
    ${person_id}=    set variable  ${horse}[horse_id]
    ${person_type}=    set variable  ${horse}[horse_type]        
    ${person_name}=    set variable  ${horse}[horse_name]
    ${person_lastname}=    set variable  ${horse}[horse_lastname]
    ${person_account_no}=    set variable  ${horse}[horse_account_no]
    ${person_account_name}=    set variable  ${horse}[horse_account_name]
    ${person_phone_no}=    create phone no 'random'
    #   after_create_case , before_create_case , today
    Write Excel Cell	7   1    ${person_id}    sheet_name=AddSubCase
    Write Excel Cell	7   2    ${person_type}    sheet_name=AddSubCase
    Write Excel Cell	7   3    ${person_name}    sheet_name=AddSubCase
    Write Excel Cell	7   4    ${person_lastname}    sheet_name=AddSubCase
    Write Excel Cell	7   5    ${person_account_no}    sheet_name=AddSubCase
    Write Excel Cell	7   6    ${person_account_name}    sheet_name=AddSubCase
    Write Excel Cell	7   8    ${person_phone_no}    sheet_name=AddSubCase
             ${person_name} =	Remove String	${person_name}   \n
     ${person_lastname} =	Remove String	${person_lastname}   \n
     ${person_id} =	Remove String	${person_id}   \n
    Append to File    ${CURDIR}/temp_trans.txt    Horse1,${master_case_id},${test_case_name},${person_name},${person_lastname},${person_account_no},${person_account_no},${person_id} \n

    ${subcase_filename}=   set variable   ${FOLDER}/Subcase_horse1_${master_case_id}_${SENDING_BANK}
    Save Excel Document      filename=${CURDIR}/${subcase_filename}.xlsx
    Close Current Excel Document
    Create transaction subcase to bank '${RECV_BANK_LIST}' bank account in '${subcase_filename}' with account info '${horse}'
    Search subCaseId and childSubCaseId with master case '${master_case_id}' and receving account no '${person_account_no}' bank name '${SENDING_BANK}'
    Add Sub Case via API '${subcase_filename}' bank name '${SENDING_BANK}'



Create Subcase ไม่มีหมายอายัด '${FOLDER}' Horse 1 from bank name '${SENDING_BANK}' to '${RECV_BANK_LIST}' ชาวต่างชาติ
    [Documentation]    Test Case SUBMIT
    Open Excel Document      filename=${CURDIR}/Subcase_Template.xlsx   doc_id=docname1
    Write Excel Cell	3   1    ${master_case_id}    sheet_name=AddSubCase
    # ${horse}=    Get From List    ${horse_1_list}    ${i}
    ${horse}=    set variable   ${horse_list_dict}[${SENDING_BANK}]
    ${person_id}=    set variable  ${horse}[horse_id]
    ${person_type}=    set variable  ${horse}[horse_type]        
    ${person_name}=    set variable  ${horse}[horse_name]
    ${person_lastname}=    set variable  ${horse}[horse_lastname]
    ${person_account_no}=    set variable  ${horse}[horse_account_no]
    ${person_account_name}=    set variable  ${horse}[horse_account_name]
    ${person_phone_no}=    create phone no 'random'
    #   after_create_case , before_create_case , today
    Write Excel Cell	7   1    ${person_id}    sheet_name=AddSubCase
    Write Excel Cell	7   2    ${person_type}    sheet_name=AddSubCase
    Write Excel Cell	7   3    ${person_name}    sheet_name=AddSubCase
    Write Excel Cell	7   4    ${person_lastname}    sheet_name=AddSubCase
    Write Excel Cell	7   5    ${person_account_no}    sheet_name=AddSubCase
    Write Excel Cell	7   6    ${person_account_name}    sheet_name=AddSubCase
    Write Excel Cell	7   8    ${person_phone_no}    sheet_name=AddSubCase

    ${subcase_filename}=   set variable   ${FOLDER}/Subcase_horse1_${master_case_id}_${SENDING_BANK}
    Save Excel Document      filename=${CURDIR}/${subcase_filename}.xlsx
    Close Current Excel Document
    Create transaction subcase to bank ชาวต่างชาติ '${RECV_BANK_LIST}' bank account in '${subcase_filename}' with account info '${horse}'
    Search subCaseId and childSubCaseId with master case '${master_case_id}' and receving account no '${person_account_no}' bank name '${SENDING_BANK}'
    Add Sub Case via API '${subcase_filename}' bank name '${SENDING_BANK}'

Create Subcase '${FOLDER}' Horse 1 from bank name '${SENDING_BANK}' to '${RECV_BANK_LIST}'
    [Documentation]    Test Case SUBMIT
    Open Excel Document      filename=${CURDIR}/Subcase_Template.xlsx   doc_id=docname1
    Write Excel Cell	3   1    ${master_case_id}    sheet_name=AddSubCase
    # ${horse}=    Get From List    ${horse_1_list}    ${i}
    ${horse}=    set variable   ${horse_list_dict}[${SENDING_BANK}]
    ${person_id}=    set variable  ${horse}[horse_id]
    ${person_type}=    set variable  ${horse}[horse_type]        
    ${person_name}=    set variable  ${horse}[horse_name]
    ${person_lastname}=    set variable  ${horse}[horse_lastname]
    ${person_account_no}=    set variable  ${horse}[horse_account_no]
    ${person_account_name}=    set variable  ${horse}[horse_account_name]
    ${person_phone_no}=    create phone no 'random'
    #   after_create_case , before_create_case , today
    ${วันและเวลาที่อายัด_72_hrs}=    create block_unblock date time 'today'
    ${วันและเวลาที่ปลด_72_hrs}=    create block_unblock date time 'after_create_case'
    ${วันและเวลาที่แจ้งความ_ขยายจาก_72_ชม_เป็น_7_วัน}=    create block_unblock date time 'after_create_case'
    ${วันและเวลาที่_Fraud_พิจารณาอายัดตามมาตรา_6_7_วัน}=    create block_unblock date time 'after_create_case'
    ${วันและเวลาที่ปลด_7_วัน}=    create block_unblock date time 'after_create_case'
    ${วันและเวลาที่อายัดจากตำรวจ}=    create block_unblock date time 'today'
    ${วันและเวลาที่ปลดจากตำรวจ}=    create block_unblock date time 'after_create_case'
    Write Excel Cell	7   1    ${person_id}    sheet_name=AddSubCase
    Write Excel Cell	7   2    ${person_type}    sheet_name=AddSubCase
    Write Excel Cell	7   3    ${person_name}    sheet_name=AddSubCase
    Write Excel Cell	7   4    ${person_lastname}    sheet_name=AddSubCase
    Write Excel Cell	7   5    ${person_account_no}    sheet_name=AddSubCase
    Write Excel Cell	7   6    ${person_account_name}    sheet_name=AddSubCase
    Write Excel Cell	7   8    ${person_phone_no}    sheet_name=AddSubCase
    Write Excel Cell	7   9    ${วันและเวลาที่อายัด_72_hrs}    sheet_name=AddSubCase
    Write Excel Cell	7   10    ${วันและเวลาที่ปลด_72_hrs}    sheet_name=AddSubCase
    Write Excel Cell	7   11    ${วันและเวลาที่แจ้งความ_ขยายจาก_72_ชม_เป็น_7_วัน}    sheet_name=AddSubCase
    Write Excel Cell	7   12    ${วันและเวลาที่_Fraud_พิจารณาอายัดตามมาตรา_6_7_วัน}    sheet_name=AddSubCase
    Write Excel Cell	7   13    ${วันและเวลาที่ปลด_7_วัน}    sheet_name=AddSubCase
    Write Excel Cell	7   17    ${วันและเวลาที่อายัดจากตำรวจ}    sheet_name=AddSubCase
    Write Excel Cell	7   18    ${วันและเวลาที่ปลดจากตำรวจ}    sheet_name=AddSubCase

    ${ประเภทของการอายัดจากธนาคาร}=    ประเภทของการอายัดจากธนาคาร 'random'
    Write Excel Cell	7   14    ${ประเภทของการอายัดจากธนาคาร}    sheet_name=AddSubCase
    IF  '${ประเภทของการอายัดจากธนาคาร}' == 'ระงับเฉพาะยอดเงิน'
        ${จำนวนเงินธุรกรรมที่ระงับจากธนาคาร}=   create transacion amount 'random'
        ${จำนวนเงินคงเหลือหลังอายัดจากธนาคาร}=   create transacion amount 'random'
        Write Excel Cell	7   15    ${จำนวนเงินธุรกรรมที่ระงับจากธนาคาร}    sheet_name=AddSubCase
        Write Excel Cell	7   16    ${จำนวนเงินคงเหลือหลังอายัดจากธนาคาร}    sheet_name=AddSubCase
    END
    ${ประเภทของหมายอายัดจากตำรวจ}=    ประเภทของหมายอายัดจากตำรวจ 'random'
    Write Excel Cell	7   19    ${ประเภทของหมายอายัดจากตำรวจ}    sheet_name=AddSubCase
    IF   '${ประเภทของหมายอายัดจากตำรวจ}' == 'หมายอายัดเฉพาะยอดเงินที่ระบุ (Q)'
       ${จำนวนวงเงินที่อายัดจากตำรวจ}=   create transacion amount 'random'
        Write Excel Cell	7   21    ${จำนวนวงเงินที่อายัดจากตำรวจ}    sheet_name=AddSubCase
    END
    IF   '${ประเภทของหมายอายัดจากตำรวจ}' != '${EMPTY}'
        ${ใส่หมายอายัดจากตำรวจ}=   random_string   10
        ${ใส่หมายปลดอายัดจากตำรวจ}=   random_string   10
        Write Excel Cell	7   20    ${ใส่หมายอายัดจากตำรวจ}    sheet_name=AddSubCase
        Write Excel Cell	7   22    ${ใส่หมายปลดอายัดจากตำรวจ}    sheet_name=AddSubCase            
    END
    ${subcase_filename}=   set variable   ${FOLDER}/Subcase_horse1_${master_case_id}_${SENDING_BANK}
    Save Excel Document      filename=${CURDIR}/${subcase_filename}.xlsx
    Close Current Excel Document
    Create transaction subcase to bank '${RECV_BANK_LIST}' bank account in '${subcase_filename}' with account info '${horse}'
    Search subCaseId and childSubCaseId with master case '${master_case_id}' and receving account no '${person_account_no}' bank name '${SENDING_BANK}'
    Add Sub Case via API '${subcase_filename}' bank name '${SENDING_BANK}'
             ${person_name} =	Remove String	${person_name}   \n
     ${person_lastname} =	Remove String	${person_lastname}   \n
     ${person_id} =	Remove String	${person_id}   \n
    Append to File    ${CURDIR}/temp_trans.txt    ${master_case_id},${FOLDER},${SENDING_BANK},${person_name},${person_lastname},${person_account_no},${person_id}\n


Create Subcase '${FOLDER}' Horse 1 from bank name '${SENDING_BANK}' to '${RECV_BANK_LIST}' TC007
    Open Excel Document      filename=${CURDIR}/Subcase_Template.xlsx   doc_id=docname1
    Write Excel Cell	3   1    ${master_case_id}    sheet_name=AddSubCase
    # ${horse}=    Get From List    ${horse_1_list}    ${i}
    ${horse}=    set variable   ${horse_list_dict}[${SENDING_BANK}]
    ${person_id}=    set variable  ${horse}[horse_id]
    ${person_type}=    set variable  ${horse}[horse_type]        
    ${person_name}=    set variable  ${horse}[horse_name]
    ${person_lastname}=    set variable  ${horse}[horse_lastname]
    ${person_account_no}=    set variable  ${horse}[horse_account_no]
    ${person_account_name}=    set variable  ${horse}[horse_account_name]
    ${person_phone_no}=    create phone no 'random'
    Append to File    ${CURDIR}/temp_trans.txt    ${master_case_id},${FOLDER},${SENDING_BANK},${person_name},${person_lastname},${person_account_no},${person_id}\n
    #   after_create_case , before_create_case , today
    ${วันและเวลาที่อายัด_72_hrs}=    create block_unblock date time 'today'
    ${วันและเวลาที่ปลด_72_hrs}=    create block_unblock date time 'after_create_case'
    ${วันและเวลาที่แจ้งความ_ขยายจาก_72_ชม_เป็น_7_วัน}=    create block_unblock date time 'after_create_case'
    ${วันและเวลาที่_Fraud_พิจารณาอายัดตามมาตรา_6_7_วัน}=    create block_unblock date time 'after_create_case'
    ${วันและเวลาที่ปลด_7_วัน}=    create block_unblock date time 'after_create_case'
    ${วันและเวลาที่อายัดจากตำรวจ}=    create block_unblock date time 'today'
    ${วันและเวลาที่ปลดจากตำรวจ}=    create block_unblock date time 'after_create_case'
    Write Excel Cell	7   1    ${person_id}    sheet_name=AddSubCase
    Write Excel Cell	7   2    ${person_type}    sheet_name=AddSubCase
    Write Excel Cell	7   3    ${person_name}    sheet_name=AddSubCase
    Write Excel Cell	7   4    ${person_lastname}    sheet_name=AddSubCase
    Write Excel Cell	7   5    ${person_account_no}    sheet_name=AddSubCase
    Write Excel Cell	7   6    ${person_account_name}    sheet_name=AddSubCase
    Write Excel Cell	7   8    ${person_phone_no}    sheet_name=AddSubCase
    Write Excel Cell	7   9    ${วันและเวลาที่อายัด_72_hrs}    sheet_name=AddSubCase
    Write Excel Cell	7   10    ${วันและเวลาที่ปลด_72_hrs}    sheet_name=AddSubCase
    Write Excel Cell	7   11    ${วันและเวลาที่แจ้งความ_ขยายจาก_72_ชม_เป็น_7_วัน}    sheet_name=AddSubCase
    Write Excel Cell	7   12    ${วันและเวลาที่_Fraud_พิจารณาอายัดตามมาตรา_6_7_วัน}    sheet_name=AddSubCase
    Write Excel Cell	7   13    ${วันและเวลาที่ปลด_7_วัน}    sheet_name=AddSubCase
    Write Excel Cell	7   17    ${วันและเวลาที่อายัดจากตำรวจ}    sheet_name=AddSubCase
    Write Excel Cell	7   18    ${วันและเวลาที่ปลดจากตำรวจ}    sheet_name=AddSubCase

    ${ประเภทของการอายัดจากธนาคาร}=    ประเภทของการอายัดจากธนาคาร 'random'
    Write Excel Cell	7   14    ${ประเภทของการอายัดจากธนาคาร}    sheet_name=AddSubCase
    IF  '${ประเภทของการอายัดจากธนาคาร}' == 'ระงับเฉพาะยอดเงิน'
        ${จำนวนเงินธุรกรรมที่ระงับจากธนาคาร}=   create transacion amount 'random'
        ${จำนวนเงินคงเหลือหลังอายัดจากธนาคาร}=   create transacion amount 'random'
        Write Excel Cell	7   15    ${จำนวนเงินธุรกรรมที่ระงับจากธนาคาร}    sheet_name=AddSubCase
        Write Excel Cell	7   16    ${จำนวนเงินคงเหลือหลังอายัดจากธนาคาร}    sheet_name=AddSubCase
    END
    ${ประเภทของหมายอายัดจากตำรวจ}=    ประเภทของหมายอายัดจากตำรวจ 'random'
    Write Excel Cell	7   19    ${ประเภทของหมายอายัดจากตำรวจ}    sheet_name=AddSubCase
    IF   '${ประเภทของหมายอายัดจากตำรวจ}' == 'หมายอายัดเฉพาะยอดเงินที่ระบุ (Q)'
       ${จำนวนวงเงินที่อายัดจากตำรวจ}=   create transacion amount 'random'
        Write Excel Cell	7   21    ${จำนวนวงเงินที่อายัดจากตำรวจ}    sheet_name=AddSubCase
    END
    IF   '${ประเภทของหมายอายัดจากตำรวจ}' != '${EMPTY}'
        ${ใส่หมายอายัดจากตำรวจ}=   random_string   10
        ${ใส่หมายปลดอายัดจากตำรวจ}=   random_string   10
        Write Excel Cell	7   20    ${ใส่หมายอายัดจากตำรวจ}    sheet_name=AddSubCase
        Write Excel Cell	7   22    ${ใส่หมายปลดอายัดจากตำรวจ}    sheet_name=AddSubCase            
    END
    ${subcase_filename}=   set variable   ${FOLDER}/Subcase_horse1_${master_case_id}_${SENDING_BANK}
    Save Excel Document      filename=${CURDIR}/${subcase_filename}.xlsx
    Close Current Excel Document
    Create transaction subcase to bank '${RECV_BANK_LIST}' bank account in '${subcase_filename}' with account info '${horse}' TC007 '${FOLDER}'
    Search subCaseId and childSubCaseId with master case '${master_case_id}' and receving account no '${person_account_no}' bank name '${SENDING_BANK}'
    Add Sub Case via API '${subcase_filename}' bank name '${SENDING_BANK}'

Search subCaseId and childSubCaseId with master case '${master_case_id}' and receving account no '${person_account_no}' bank name '${BANK_NAME}'
    ${json_string}=  Catenate    SEPARATOR=\n   
    ...   {
    ...   "masterCaseId": "${master_case_id}",
    ...   "policeCaseId": "",
    ...   "detectiveTypeId": "",
    ...   "ownerFirstName": "",
    ...   "ownerLastName": "",
    ...   "ownerIdCard": "",
    ...   "senderAccountNumber": "",
    ...   "senderBankCode": "",
    ...   "receiverAccountId": "",
    ...   "receiverAccountNumber": "${person_account_no}",
    ...   "receiverBankCode": "",
    ...   "caseCreateStartDate": "", 
    ...   "caseCreateEndDate": "",
    ...   "page": {
    ...       "offset": 0,
    ...       "totalRecords": 0,
    ...       "maxRecordPerPage": 10,
    ...       "orderBy": "masterCaseId",
    ...       "orderType": "DESC" }
    ...   }

    ${API_URL}=   Set Variable     ${host}
    Create Session    exampleSession    ${API_URL}
    ${headers} =   Create Dictionary    Content-Type=application/json    X-Institution-Id=${${BANK_NAME}.bank_code}xxx   X-Roles=xxx   X-User-Id=xxx
    ${response}=    POST On Session   exampleSession  /api/fraud-cases/search    data=${json_string}    headers=${headers}
    set test variable    ${subCaseId}    ${response.json()['fraudCasesSearchResult'][0]['subCaseId']}
    set test variable    ${childSubCaseId}    ${response.json()['fraudCasesSearchResult'][0]['childSubCaseId']}

decrypt cfr string '${STRING}'
    ${API_URL}=   Set Variable     https://cfr-dev.itmx.co.th
    Create Session    exampleSession    ${API_URL}
    ${headers} =   Create Dictionary    Content-Type=text/plain
    ${response}=    POST On Session   exampleSession  /fraud-api/api/aes/decrypt    data=${STRING}    headers=${headers}
    RETURN    ${response.text}

Add Sub Case via API '${SUB_CASE_FILE}' bank name '${BANK_NAME}'
    ${encode_base64}=    encodeExcel  ${CURDIR}/${SUB_CASE_FILE}.xlsx
    Set Test Variable   ${encode_base64}  
    ${json_string}=  Catenate    SEPARATOR=\n
    ...  {
    ...   "fileData": "${encode_base64}",
    ...   "subCaseId": "${subCaseId}",
    ...   "childSubCaseId": "${childSubCaseId}",
    ...   "fileName":"AddSub.xlsx"
    ...  }
    ${API_URL}=   Set Variable     ${host}
    Create Session    exampleSession    ${API_URL}
    ${headers} =   Create Dictionary    Content-Type=application/json    X-Institution-Id=${${BANK_NAME}.bank_code}xxx   X-Roles=xxx   X-User-Id=xxx
    ${response}=    POST On Session   exampleSession  /api/excel-file/sub-case-insert   data=${json_string}    headers=${headers}
    
Create Subcase Horse 1 '${FOLDER}'
    Create Directory     ${CURDIR}/${FOLDER}
    ${horse_count}=    Get Length    ${horse_1_list}
    FOR    ${i}    IN RANGE    ${horse_count}
        Open Excel Document      filename=${CURDIR}/Subcase_Template.xlsx   doc_id=docname1
        Write Excel Cell	3   1    ${master_case_id}    sheet_name=AddSubCase
        ${horse}=    Get From List    ${horse_1_list}    ${i}
        ${person_id}=    set variable  ${horse}[horse_id]
        ${person_type}=    set variable  ${horse}[horse_type]        
        ${person_name}=    set variable  ${horse}[horse_name]
        ${person_lastname}=    set variable  ${horse}[horse_lastname]
        ${person_account_no}=    set variable  ${horse}[horse_account_no]
        ${person_account_name}=    set variable  ${horse}[horse_account_name]
        ${person_phone_no}=    create phone no 'random'
        #   after_create_case , before_create_case , today
        ${วันและเวลาที่อายัด_72_hrs}=    create block_unblock date time 'today'
        ${วันและเวลาที่ปลด_72_hrs}=    create block_unblock date time 'after_create_case'
        ${วันและเวลาที่แจ้งความ_ขยายจาก_72_ชม_เป็น_7_วัน}=    create block_unblock date time 'after_create_case'
        ${วันและเวลาที่_Fraud_พิจารณาอายัดตามมาตรา_6_7_วัน}=    create block_unblock date time 'after_create_case'
        ${วันและเวลาที่ปลด_7_วัน}=    create block_unblock date time 'after_create_case'
        ${วันและเวลาที่อายัดจากตำรวจ}=    create block_unblock date time 'today'
        ${วันและเวลาที่ปลดจากตำรวจ}=    create block_unblock date time 'after_create_case'
        Write Excel Cell	7   1    ${person_id}    sheet_name=AddSubCase
        Write Excel Cell	7   2    ${person_type}    sheet_name=AddSubCase
        Write Excel Cell	7   3    ${person_name}    sheet_name=AddSubCase
        Write Excel Cell	7   4    ${person_lastname}    sheet_name=AddSubCase
        Write Excel Cell	7   5    ${person_account_no}    sheet_name=AddSubCase
        Write Excel Cell	7   6    ${person_account_name}    sheet_name=AddSubCase
        Write Excel Cell	7   8    ${person_phone_no}    sheet_name=AddSubCase
        Write Excel Cell	7   9    ${วันและเวลาที่อายัด_72_hrs}    sheet_name=AddSubCase
        Write Excel Cell	7   10    ${วันและเวลาที่ปลด_72_hrs}    sheet_name=AddSubCase
        Write Excel Cell	7   11    ${วันและเวลาที่แจ้งความ_ขยายจาก_72_ชม_เป็น_7_วัน}    sheet_name=AddSubCase
        Write Excel Cell	7   12    ${วันและเวลาที่_Fraud_พิจารณาอายัดตามมาตรา_6_7_วัน}    sheet_name=AddSubCase
        Write Excel Cell	7   13    ${วันและเวลาที่ปลด_7_วัน}    sheet_name=AddSubCase
        Write Excel Cell	7   17    ${วันและเวลาที่อายัดจากตำรวจ}    sheet_name=AddSubCase
        Write Excel Cell	7   18    ${วันและเวลาที่ปลดจากตำรวจ}    sheet_name=AddSubCase

        ${ประเภทของการอายัดจากธนาคาร}=    ประเภทของการอายัดจากธนาคาร 'random'
        Write Excel Cell	7   14    ${ประเภทของการอายัดจากธนาคาร}    sheet_name=AddSubCase
        IF  '${ประเภทของการอายัดจากธนาคาร}' == 'ระงับเฉพาะยอดเงิน'
             ${จำนวนเงินธุรกรรมที่ระงับจากธนาคาร}=   create transacion amount 'random'
             ${จำนวนเงินคงเหลือหลังอายัดจากธนาคาร}=   create transacion amount 'random'
             Write Excel Cell	7   15    ${จำนวนเงินธุรกรรมที่ระงับจากธนาคาร}    sheet_name=AddSubCase
             Write Excel Cell	7   16    ${จำนวนเงินคงเหลือหลังอายัดจากธนาคาร}    sheet_name=AddSubCase
        END
        ${ประเภทของหมายอายัดจากตำรวจ}=    ประเภทของหมายอายัดจากตำรวจ 'random'
        Write Excel Cell	7   19    ${ประเภทของหมายอายัดจากตำรวจ}    sheet_name=AddSubCase
        IF   '${ประเภทของหมายอายัดจากตำรวจ}' == 'หมายอายัดเฉพาะยอดเงินที่ระบุ (Q)'
             ${จำนวนวงเงินที่อายัดจากตำรวจ}=   create transacion amount 'random'
              Write Excel Cell	7   21    ${จำนวนวงเงินที่อายัดจากตำรวจ}    sheet_name=AddSubCase
        END
        IF   '${ประเภทของหมายอายัดจากตำรวจ}' != '${EMPTY}'
             ${ใส่หมายอายัดจากตำรวจ}=   random_string   10
             ${ใส่หมายปลดอายัดจากตำรวจ}=   random_string   10
             Write Excel Cell	7   20    ${ใส่หมายอายัดจากตำรวจ}    sheet_name=AddSubCase
              Write Excel Cell	7   22    ${ใส่หมายปลดอายัดจากตำรวจ}    sheet_name=AddSubCase            
        END
    ${bank_short_name}=    set variable  ${bank_dict}[${person_account_name}]
    Save Excel Document      filename=${CURDIR}/${FOLDER}/Subcase_horse1_${master_case_id}_${bank_short_name}.xlsx
    Close Current Excel Document
    Create transaction subcase to '2' bank account in '${FOLDER}/Subcase_horse1_${master_case_id}_${bank_short_name}' with account info '${horse}'
    END

Create Master Case File '${FOLDER}' from bank name '${BANK_NAME}' to '${HORSE_LIST}'
    ${horse_list_dict} =    Create Dictionary
    set test variable   ${horse_list_dict}
    Create Directory     ${CURDIR}/${FOLDER}
    ${bank_dict} =    Create Dictionary    ธนาคารกรุงเทพ จำกัด (มหาชน)=BBL    ธนาคารกสิกรไทย จำกัด (มหาชน)=KBNK    ธนาคารกรุงไทย จำกัด (มหาชน)=KTB    ธนาคาร เจพีมอร์แกน เชส=JPMC    ธนาคาร โอเวอร์ซี-ไชนีสแบงกิ้งคอร์ปอเรชั่น จํากัด=OCBC    ธนาคารทหารไทยธนชาต จำกัด (มหาชน)=TTB    ธนาคารไทยพาณิชย์ จำกัด (มหาชน)=SCB    ธนาคารซิตี้แบงก์=CITI    ธนาคารซูมิโตโม มิตซุย แบงกิ้ง คอร์ปอเรชั่น=SMBC    ธนาคารสแตนดาร์ดชาร์เตอร์ด(ไทย) จำกัด (มหาชน)=SCBT    ธนาคาร ซีไอเอ็มบี ไทย จำกัด (มหาชน)=CMBT    ธนาคาร อาร์ เอช บี จำกัด=RHB    ธนาคารยูโอบี จำกัด (มหาชน)=UOBT    ธนาคารกรุงศรีอยุธยา จำกัด (มหาชน)=BAY    ธนาคารเมกะ สากลพาณิชย์ จำกัด (มหาชน)=MEGA    ธนาคารแห่งอเมริกา เนชั่นแนล แอสโซซิเอชั่น=BOA    ธนาคารอินเดียนโอเวอร์ซีส์=IOB    ธนาคารออมสิน=GSB    ธนาคารฮ่องกงและเซี่ยงไฮ้แบงกิ้ง คอร์ปอเรชั่น จำกัด=HSBC    ธนาคารดอยซ์แบงก์=DB    ธนาคารอาคารสงเคราะห์=GHB    ธนาคารเพื่อการเกษตรและสหกรณ์=BAAC    ธนาคารเพื่อการส่งออกและนำเข้าแห่งประเทศไทย=EXIM    ธนาคารมิซูโฮ จำกัด=MHCB    ธนาคารบีเอ็นพี พารีบาส์=BNPP    ธนาคารแห่งประเทศจีน จำกัด=BOC    ธนาคารอิสลามแห่งประเทศไทย=ISBT    ธนาคารทิสโก้ จำกัด (มหาชน)=TSCO    ธนาคารเกียรตินาคินภัทร จำกัด (มหาชน)=KKP    ธนาคารไอซีบีซี (ไทย) จำกัด (มหาชน)=ICBC    ธนาคารไทยเครดิต จำกัด (มหาชน)=TCRB    ธนาคารแลนด์ แอนด์ เฮ้าส์ จำกัด (มหาชน)=LHB    ธนาคารซูมิโตโม มิตซุย ทรัสต์ (ไทย) จำกัด (มหาชน)=SMTB    ธนาคารพัฒนาวิสาหกิจขนาดกลางและขนาดย่อมแห่งประเทศไทย=SME
    ${bank_name_dict} =    Create Dictionary    BBL=ธนาคารกรุงเทพ จำกัด (มหาชน)     KBNK=ธนาคารกสิกรไทย จำกัด (มหาชน)    KTB=ธนาคารกรุงไทย จำกัด (มหาชน)    JPMC=ธนาคาร เจพีมอร์แกน เชส    OCBC=ธนาคาร โอเวอร์ซี-ไชนีสแบงกิ้งคอร์ปอเรชั่น จํากัด    TTB=ธนาคารทหารไทยธนชาต จำกัด (มหาชน)     SCB=ธนาคารไทยพาณิชย์ จำกัด (มหาชน)     CITI=ธนาคารซิตี้แบงก์     SMBC=ธนาคารซูมิโตโม มิตซุย แบงกิ้ง คอร์ปอเรชั่น     SCBT=ธนาคารสแตนดาร์ดชาร์เตอร์ด(ไทย) จำกัด (มหาชน)     CMBT=ธนาคาร ซีไอเอ็มบี ไทย จำกัด (มหาชน)     RHB=ธนาคาร อาร์ เอช บี จำกัด     UOBT=ธนาคารยูโอบี จำกัด (มหาชน)     BAY=ธนาคารกรุงศรีอยุธยา จำกัด (มหาชน)     MEGA=ธนาคารเมกะ สากลพาณิชย์ จำกัด (มหาชน)     BOA=ธนาคารแห่งอเมริกา เนชั่นแนล แอสโซซิเอชั่น     IOB=ธนาคารอินเดียนโอเวอร์ซีส์     GSB=ธนาคารออมสิน     HSBC=ธนาคารฮ่องกงและเซี่ยงไฮ้แบงกิ้ง คอร์ปอเรชั่น จำกัด     DB=ธนาคารดอยซ์แบงก์     GHB=ธนาคารอาคารสงเคราะห์     BAAC=ธนาคารเพื่อการเกษตรและสหกรณ์     EXIM=ธนาคารเพื่อการส่งออกและนำเข้าแห่งประเทศไทย     MHCB=ธนาคารมิซูโฮ จำกัด     BNPP=ธนาคารบีเอ็นพี พารีบาส์     BOC=ธนาคารแห่งประเทศจีน จำกัด     ISBT=ธนาคารอิสลามแห่งประเทศไทย     TSCO=ธนาคารทิสโก้ จำกัด (มหาชน)     KKP=ธนาคารเกียรตินาคินภัทร จำกัด (มหาชน)     ICBC=ธนาคารไอซีบีซี (ไทย) จำกัด (มหาชน)     TCRB=ธนาคารไทยเครดิต จำกัด (มหาชน)     LHB=ธนาคารแลนด์ แอนด์ เฮ้าส์ จำกัด (มหาชน)     SMTB=ธนาคารซูมิโตโม มิตซุย ทรัสต์ (ไทย) จำกัด (มหาชน)     SME=ธนาคารพัฒนาวิสาหกิจขนาดกลางและขนาดย่อมแห่งประเทศไทย
    set test variable   ${bank_dict}
    set test variable   ${bank_name_dict}
    Open Excel Document      filename=${CURDIR}/Mastercase_Template.xlsx   doc_id=docname1
    ${master_case_id}=    create master case id of bank name '${BANK_NAME}'
    set test variable   ${master_case_id}
    Write Excel Cell	3   1    ${master_case_id}    sheet_name=CreateBankCase
    ${polics_date}=    create polics date 'before_create_case'
    ${polics_time}=    create polics time 'random'
    ${polics_case_id}=    create polics case id 'random' total '50' digit
    ${police_section}=    การตรวจพบรายการ คือ 'ผู้เสียหายแจ้งเอง มาตรา 7'
    Write Excel Cell	3   2    ${polics_date}    sheet_name=CreateBankCase
    Write Excel Cell	3   3    ${polics_time}    sheet_name=CreateBankCase
    Write Excel Cell	3   4    ${polics_case_id}    sheet_name=CreateBankCase
    Write Excel Cell	3   5    ${police_section}    sheet_name=CreateBankCase
    set test variable    ${master_file_name}    Mastercase_${master_case_id}
    Save Excel Document      filename=${CURDIR}/${FOLDER}/${master_file_name}.xlsx
    Close Current Excel Document
    set test variable    ${test_case_name}    ${FOLDER}
    Create victim information '${FOLDER}/${master_file_name}' of bank name '${bank_name_dict}[${BANK_NAME}]'
    Create transaction to banks '${HORSE_LIST}' in '${FOLDER}/${master_file_name}'
    Add Master Case via API '${FOLDER}/${master_file_name}' bank name '${BANK_NAME}'

Create Master Case File '${FOLDER}' from bank name '${BANK_NAME}' to '${HORSE_LIST}' only 1 account many Personal
    ${horse_list_dict} =    Create Dictionary
    set test variable   ${horse_list_dict}
    Create Directory     ${CURDIR}/${FOLDER}
    ${bank_dict} =    Create Dictionary    ธนาคารกรุงเทพ จำกัด (มหาชน)=BBL    ธนาคารกสิกรไทย จำกัด (มหาชน)=KBNK    ธนาคารกรุงไทย จำกัด (มหาชน)=KTB    ธนาคาร เจพีมอร์แกน เชส=JPMC    ธนาคาร โอเวอร์ซี-ไชนีสแบงกิ้งคอร์ปอเรชั่น จํากัด=OCBC    ธนาคารทหารไทยธนชาต จำกัด (มหาชน)=TTB    ธนาคารไทยพาณิชย์ จำกัด (มหาชน)=SCB    ธนาคารซิตี้แบงก์=CITI    ธนาคารซูมิโตโม มิตซุย แบงกิ้ง คอร์ปอเรชั่น=SMBC    ธนาคารสแตนดาร์ดชาร์เตอร์ด(ไทย) จำกัด (มหาชน)=SCBT    ธนาคาร ซีไอเอ็มบี ไทย จำกัด (มหาชน)=CMBT    ธนาคาร อาร์ เอช บี จำกัด=RHB    ธนาคารยูโอบี จำกัด (มหาชน)=UOBT    ธนาคารกรุงศรีอยุธยา จำกัด (มหาชน)=BAY    ธนาคารเมกะ สากลพาณิชย์ จำกัด (มหาชน)=MEGA    ธนาคารแห่งอเมริกา เนชั่นแนล แอสโซซิเอชั่น=BOA    ธนาคารอินเดียนโอเวอร์ซีส์=IOB    ธนาคารออมสิน=GSB    ธนาคารฮ่องกงและเซี่ยงไฮ้แบงกิ้ง คอร์ปอเรชั่น จำกัด=HSBC    ธนาคารดอยซ์แบงก์=DB    ธนาคารอาคารสงเคราะห์=GHB    ธนาคารเพื่อการเกษตรและสหกรณ์=BAAC    ธนาคารเพื่อการส่งออกและนำเข้าแห่งประเทศไทย=EXIM    ธนาคารมิซูโฮ จำกัด=MHCB    ธนาคารบีเอ็นพี พารีบาส์=BNPP    ธนาคารแห่งประเทศจีน จำกัด=BOC    ธนาคารอิสลามแห่งประเทศไทย=ISBT    ธนาคารทิสโก้ จำกัด (มหาชน)=TSCO    ธนาคารเกียรตินาคินภัทร จำกัด (มหาชน)=KKP    ธนาคารไอซีบีซี (ไทย) จำกัด (มหาชน)=ICBC    ธนาคารไทยเครดิต จำกัด (มหาชน)=TCRB    ธนาคารแลนด์ แอนด์ เฮ้าส์ จำกัด (มหาชน)=LHB    ธนาคารซูมิโตโม มิตซุย ทรัสต์ (ไทย) จำกัด (มหาชน)=SMTB    ธนาคารพัฒนาวิสาหกิจขนาดกลางและขนาดย่อมแห่งประเทศไทย=SME
    ${bank_name_dict} =    Create Dictionary    BBL=ธนาคารกรุงเทพ จำกัด (มหาชน)     KBNK=ธนาคารกสิกรไทย จำกัด (มหาชน)    KTB=ธนาคารกรุงไทย จำกัด (มหาชน)    JPMC=ธนาคาร เจพีมอร์แกน เชส    OCBC=ธนาคาร โอเวอร์ซี-ไชนีสแบงกิ้งคอร์ปอเรชั่น จํากัด    TTB=ธนาคารทหารไทยธนชาต จำกัด (มหาชน)     SCB=ธนาคารไทยพาณิชย์ จำกัด (มหาชน)     CITI=ธนาคารซิตี้แบงก์     SMBC=ธนาคารซูมิโตโม มิตซุย แบงกิ้ง คอร์ปอเรชั่น     SCBT=ธนาคารสแตนดาร์ดชาร์เตอร์ด(ไทย) จำกัด (มหาชน)     CMBT=ธนาคาร ซีไอเอ็มบี ไทย จำกัด (มหาชน)     RHB=ธนาคาร อาร์ เอช บี จำกัด     UOBT=ธนาคารยูโอบี จำกัด (มหาชน)     BAY=ธนาคารกรุงศรีอยุธยา จำกัด (มหาชน)     MEGA=ธนาคารเมกะ สากลพาณิชย์ จำกัด (มหาชน)     BOA=ธนาคารแห่งอเมริกา เนชั่นแนล แอสโซซิเอชั่น     IOB=ธนาคารอินเดียนโอเวอร์ซีส์     GSB=ธนาคารออมสิน     HSBC=ธนาคารฮ่องกงและเซี่ยงไฮ้แบงกิ้ง คอร์ปอเรชั่น จำกัด     DB=ธนาคารดอยซ์แบงก์     GHB=ธนาคารอาคารสงเคราะห์     BAAC=ธนาคารเพื่อการเกษตรและสหกรณ์     EXIM=ธนาคารเพื่อการส่งออกและนำเข้าแห่งประเทศไทย     MHCB=ธนาคารมิซูโฮ จำกัด     BNPP=ธนาคารบีเอ็นพี พารีบาส์     BOC=ธนาคารแห่งประเทศจีน จำกัด     ISBT=ธนาคารอิสลามแห่งประเทศไทย     TSCO=ธนาคารทิสโก้ จำกัด (มหาชน)     KKP=ธนาคารเกียรตินาคินภัทร จำกัด (มหาชน)     ICBC=ธนาคารไอซีบีซี (ไทย) จำกัด (มหาชน)     TCRB=ธนาคารไทยเครดิต จำกัด (มหาชน)     LHB=ธนาคารแลนด์ แอนด์ เฮ้าส์ จำกัด (มหาชน)     SMTB=ธนาคารซูมิโตโม มิตซุย ทรัสต์ (ไทย) จำกัด (มหาชน)     SME=ธนาคารพัฒนาวิสาหกิจขนาดกลางและขนาดย่อมแห่งประเทศไทย
    set test variable   ${bank_dict}
    set test variable   ${bank_name_dict}
    Open Excel Document      filename=${CURDIR}/Mastercase_Template.xlsx   doc_id=docname1
    ${master_case_id}=    create master case id of bank name '${BANK_NAME}'
    set test variable   ${master_case_id}
    Write Excel Cell	3   1    ${master_case_id}    sheet_name=CreateBankCase
    ${polics_date}=    create polics date 'before_create_case'
    ${polics_time}=    create polics time 'random'
    ${polics_case_id}=    create polics case id 'random' total '50' digit
    ${police_section}=    การตรวจพบรายการ คือ 'ผู้เสียหายแจ้งเอง มาตรา 7'
    Write Excel Cell	3   2    ${polics_date}    sheet_name=CreateBankCase
    Write Excel Cell	3   3    ${polics_time}    sheet_name=CreateBankCase
    Write Excel Cell	3   4    ${polics_case_id}    sheet_name=CreateBankCase
    Write Excel Cell	3   5    ${police_section}    sheet_name=CreateBankCase
    set test variable    ${master_file_name}    Mastercase_${master_case_id}
    Save Excel Document      filename=${CURDIR}/${FOLDER}/${master_file_name}.xlsx
    Close Current Excel Document
    set test variable    ${test_case_name}    ${FOLDER}
    Create victim information '${FOLDER}/${master_file_name}' of bank name '${bank_name_dict}[${BANK_NAME}]'
    Create transaction to banks '${HORSE_LIST}' in '${FOLDER}/${master_file_name}' only 1
    Add Master Case via API '${FOLDER}/${master_file_name}' bank name '${BANK_NAME}'

Create Master Case File '${FOLDER}' from bank name '${BANK_NAME}' to '${HORSE_LIST}' Cleansing TC01
    ${horse_list_dict} =    Create Dictionary
    set test variable   ${horse_list_dict}
    Create Directory     ${CURDIR}/${FOLDER}
    ${bank_dict} =    Create Dictionary    ธนาคารกรุงเทพ จำกัด (มหาชน)=BBL    ธนาคารกสิกรไทย จำกัด (มหาชน)=KBNK    ธนาคารกรุงไทย จำกัด (มหาชน)=KTB    ธนาคาร เจพีมอร์แกน เชส=JPMC    ธนาคาร โอเวอร์ซี-ไชนีสแบงกิ้งคอร์ปอเรชั่น จํากัด=OCBC    ธนาคารทหารไทยธนชาต จำกัด (มหาชน)=TTB    ธนาคารไทยพาณิชย์ จำกัด (มหาชน)=SCB    ธนาคารซิตี้แบงก์=CITI    ธนาคารซูมิโตโม มิตซุย แบงกิ้ง คอร์ปอเรชั่น=SMBC    ธนาคารสแตนดาร์ดชาร์เตอร์ด(ไทย) จำกัด (มหาชน)=SCBT    ธนาคาร ซีไอเอ็มบี ไทย จำกัด (มหาชน)=CMBT    ธนาคาร อาร์ เอช บี จำกัด=RHB    ธนาคารยูโอบี จำกัด (มหาชน)=UOBT    ธนาคารกรุงศรีอยุธยา จำกัด (มหาชน)=BAY    ธนาคารเมกะ สากลพาณิชย์ จำกัด (มหาชน)=MEGA    ธนาคารแห่งอเมริกา เนชั่นแนล แอสโซซิเอชั่น=BOA    ธนาคารอินเดียนโอเวอร์ซีส์=IOB    ธนาคารออมสิน=GSB    ธนาคารฮ่องกงและเซี่ยงไฮ้แบงกิ้ง คอร์ปอเรชั่น จำกัด=HSBC    ธนาคารดอยซ์แบงก์=DB    ธนาคารอาคารสงเคราะห์=GHB    ธนาคารเพื่อการเกษตรและสหกรณ์=BAAC    ธนาคารเพื่อการส่งออกและนำเข้าแห่งประเทศไทย=EXIM    ธนาคารมิซูโฮ จำกัด=MHCB    ธนาคารบีเอ็นพี พารีบาส์=BNPP    ธนาคารแห่งประเทศจีน จำกัด=BOC    ธนาคารอิสลามแห่งประเทศไทย=ISBT    ธนาคารทิสโก้ จำกัด (มหาชน)=TSCO    ธนาคารเกียรตินาคินภัทร จำกัด (มหาชน)=KKP    ธนาคารไอซีบีซี (ไทย) จำกัด (มหาชน)=ICBC    ธนาคารไทยเครดิต จำกัด (มหาชน)=TCRB    ธนาคารแลนด์ แอนด์ เฮ้าส์ จำกัด (มหาชน)=LHB    ธนาคารซูมิโตโม มิตซุย ทรัสต์ (ไทย) จำกัด (มหาชน)=SMTB    ธนาคารพัฒนาวิสาหกิจขนาดกลางและขนาดย่อมแห่งประเทศไทย=SME
    ${bank_name_dict} =    Create Dictionary    BBL=ธนาคารกรุงเทพ จำกัด (มหาชน)     KBNK=ธนาคารกสิกรไทย จำกัด (มหาชน)    KTB=ธนาคารกรุงไทย จำกัด (มหาชน)    JPMC=ธนาคาร เจพีมอร์แกน เชส    OCBC=ธนาคาร โอเวอร์ซี-ไชนีสแบงกิ้งคอร์ปอเรชั่น จํากัด    TTB=ธนาคารทหารไทยธนชาต จำกัด (มหาชน)     SCB=ธนาคารไทยพาณิชย์ จำกัด (มหาชน)     CITI=ธนาคารซิตี้แบงก์     SMBC=ธนาคารซูมิโตโม มิตซุย แบงกิ้ง คอร์ปอเรชั่น     SCBT=ธนาคารสแตนดาร์ดชาร์เตอร์ด(ไทย) จำกัด (มหาชน)     CMBT=ธนาคาร ซีไอเอ็มบี ไทย จำกัด (มหาชน)     RHB=ธนาคาร อาร์ เอช บี จำกัด     UOBT=ธนาคารยูโอบี จำกัด (มหาชน)     BAY=ธนาคารกรุงศรีอยุธยา จำกัด (มหาชน)     MEGA=ธนาคารเมกะ สากลพาณิชย์ จำกัด (มหาชน)     BOA=ธนาคารแห่งอเมริกา เนชั่นแนล แอสโซซิเอชั่น     IOB=ธนาคารอินเดียนโอเวอร์ซีส์     GSB=ธนาคารออมสิน     HSBC=ธนาคารฮ่องกงและเซี่ยงไฮ้แบงกิ้ง คอร์ปอเรชั่น จำกัด     DB=ธนาคารดอยซ์แบงก์     GHB=ธนาคารอาคารสงเคราะห์     BAAC=ธนาคารเพื่อการเกษตรและสหกรณ์     EXIM=ธนาคารเพื่อการส่งออกและนำเข้าแห่งประเทศไทย     MHCB=ธนาคารมิซูโฮ จำกัด     BNPP=ธนาคารบีเอ็นพี พารีบาส์     BOC=ธนาคารแห่งประเทศจีน จำกัด     ISBT=ธนาคารอิสลามแห่งประเทศไทย     TSCO=ธนาคารทิสโก้ จำกัด (มหาชน)     KKP=ธนาคารเกียรตินาคินภัทร จำกัด (มหาชน)     ICBC=ธนาคารไอซีบีซี (ไทย) จำกัด (มหาชน)     TCRB=ธนาคารไทยเครดิต จำกัด (มหาชน)     LHB=ธนาคารแลนด์ แอนด์ เฮ้าส์ จำกัด (มหาชน)     SMTB=ธนาคารซูมิโตโม มิตซุย ทรัสต์ (ไทย) จำกัด (มหาชน)     SME=ธนาคารพัฒนาวิสาหกิจขนาดกลางและขนาดย่อมแห่งประเทศไทย
    set test variable   ${bank_dict}
    set test variable   ${bank_name_dict}
    Open Excel Document      filename=${CURDIR}/Mastercase_Template.xlsx   doc_id=docname1
    ${master_case_id}=    create master case id of bank name '${BANK_NAME}'
    set test variable   ${master_case_id}
    Write Excel Cell	3   1    ${master_case_id}    sheet_name=CreateBankCase
    ${polics_date}=    create polics date 'before_create_case'
    ${polics_time}=    create polics time 'random'
    ${polics_case_id}=    create polics case id 'random' total '50' digit
    ${police_section}=    การตรวจพบรายการ คือ 'ผู้เสียหายแจ้งเอง มาตรา 7'
    Write Excel Cell	3   2    ${polics_date}    sheet_name=CreateBankCase
    Write Excel Cell	3   3    ${polics_time}    sheet_name=CreateBankCase
    Write Excel Cell	3   4    ${polics_case_id}    sheet_name=CreateBankCase
    Write Excel Cell	3   5    ${police_section}    sheet_name=CreateBankCase
    set test variable    ${master_file_name}    Mastercase_${master_case_id}
    Save Excel Document      filename=${CURDIR}/${FOLDER}/${master_file_name}.xlsx
    Close Current Excel Document
    set test variable    ${test_case_name}    ${FOLDER}
    Create victim information '${FOLDER}/${master_file_name}' of bank name '${bank_name_dict}[${BANK_NAME}]'
    Create transaction to banks '${HORSE_LIST}' in '${FOLDER}/${master_file_name}' Cleansing TC01
    Add Master Case via API '${FOLDER}/${master_file_name}' bank name '${BANK_NAME}'


Create Master Case File '${FOLDER}' from bank name '${BANK_NAME}' to '${HORSE_LIST}' Case Insert personalID from add Sub Case
    ${horse_list_dict} =    Create Dictionary
    set test variable   ${horse_list_dict}
    Create Directory     ${CURDIR}/${FOLDER}
    ${bank_dict} =    Create Dictionary    ธนาคารกรุงเทพ จำกัด (มหาชน)=BBL    ธนาคารกสิกรไทย จำกัด (มหาชน)=KBNK    ธนาคารกรุงไทย จำกัด (มหาชน)=KTB    ธนาคาร เจพีมอร์แกน เชส=JPMC    ธนาคาร โอเวอร์ซี-ไชนีสแบงกิ้งคอร์ปอเรชั่น จํากัด=OCBC    ธนาคารทหารไทยธนชาต จำกัด (มหาชน)=TTB    ธนาคารไทยพาณิชย์ จำกัด (มหาชน)=SCB    ธนาคารซิตี้แบงก์=CITI    ธนาคารซูมิโตโม มิตซุย แบงกิ้ง คอร์ปอเรชั่น=SMBC    ธนาคารสแตนดาร์ดชาร์เตอร์ด(ไทย) จำกัด (มหาชน)=SCBT    ธนาคาร ซีไอเอ็มบี ไทย จำกัด (มหาชน)=CMBT    ธนาคาร อาร์ เอช บี จำกัด=RHB    ธนาคารยูโอบี จำกัด (มหาชน)=UOBT    ธนาคารกรุงศรีอยุธยา จำกัด (มหาชน)=BAY    ธนาคารเมกะ สากลพาณิชย์ จำกัด (มหาชน)=MEGA    ธนาคารแห่งอเมริกา เนชั่นแนล แอสโซซิเอชั่น=BOA    ธนาคารอินเดียนโอเวอร์ซีส์=IOB    ธนาคารออมสิน=GSB    ธนาคารฮ่องกงและเซี่ยงไฮ้แบงกิ้ง คอร์ปอเรชั่น จำกัด=HSBC    ธนาคารดอยซ์แบงก์=DB    ธนาคารอาคารสงเคราะห์=GHB    ธนาคารเพื่อการเกษตรและสหกรณ์=BAAC    ธนาคารเพื่อการส่งออกและนำเข้าแห่งประเทศไทย=EXIM    ธนาคารมิซูโฮ จำกัด=MHCB    ธนาคารบีเอ็นพี พารีบาส์=BNPP    ธนาคารแห่งประเทศจีน จำกัด=BOC    ธนาคารอิสลามแห่งประเทศไทย=ISBT    ธนาคารทิสโก้ จำกัด (มหาชน)=TSCO    ธนาคารเกียรตินาคินภัทร จำกัด (มหาชน)=KKP    ธนาคารไอซีบีซี (ไทย) จำกัด (มหาชน)=ICBC    ธนาคารไทยเครดิต จำกัด (มหาชน)=TCRB    ธนาคารแลนด์ แอนด์ เฮ้าส์ จำกัด (มหาชน)=LHB    ธนาคารซูมิโตโม มิตซุย ทรัสต์ (ไทย) จำกัด (มหาชน)=SMTB    ธนาคารพัฒนาวิสาหกิจขนาดกลางและขนาดย่อมแห่งประเทศไทย=SME
    ${bank_name_dict} =    Create Dictionary    BBL=ธนาคารกรุงเทพ จำกัด (มหาชน)     KBNK=ธนาคารกสิกรไทย จำกัด (มหาชน)    KTB=ธนาคารกรุงไทย จำกัด (มหาชน)    JPMC=ธนาคาร เจพีมอร์แกน เชส    OCBC=ธนาคาร โอเวอร์ซี-ไชนีสแบงกิ้งคอร์ปอเรชั่น จํากัด    TTB=ธนาคารทหารไทยธนชาต จำกัด (มหาชน)     SCB=ธนาคารไทยพาณิชย์ จำกัด (มหาชน)     CITI=ธนาคารซิตี้แบงก์     SMBC=ธนาคารซูมิโตโม มิตซุย แบงกิ้ง คอร์ปอเรชั่น     SCBT=ธนาคารสแตนดาร์ดชาร์เตอร์ด(ไทย) จำกัด (มหาชน)     CMBT=ธนาคาร ซีไอเอ็มบี ไทย จำกัด (มหาชน)     RHB=ธนาคาร อาร์ เอช บี จำกัด     UOBT=ธนาคารยูโอบี จำกัด (มหาชน)     BAY=ธนาคารกรุงศรีอยุธยา จำกัด (มหาชน)     MEGA=ธนาคารเมกะ สากลพาณิชย์ จำกัด (มหาชน)     BOA=ธนาคารแห่งอเมริกา เนชั่นแนล แอสโซซิเอชั่น     IOB=ธนาคารอินเดียนโอเวอร์ซีส์     GSB=ธนาคารออมสิน     HSBC=ธนาคารฮ่องกงและเซี่ยงไฮ้แบงกิ้ง คอร์ปอเรชั่น จำกัด     DB=ธนาคารดอยซ์แบงก์     GHB=ธนาคารอาคารสงเคราะห์     BAAC=ธนาคารเพื่อการเกษตรและสหกรณ์     EXIM=ธนาคารเพื่อการส่งออกและนำเข้าแห่งประเทศไทย     MHCB=ธนาคารมิซูโฮ จำกัด     BNPP=ธนาคารบีเอ็นพี พารีบาส์     BOC=ธนาคารแห่งประเทศจีน จำกัด     ISBT=ธนาคารอิสลามแห่งประเทศไทย     TSCO=ธนาคารทิสโก้ จำกัด (มหาชน)     KKP=ธนาคารเกียรตินาคินภัทร จำกัด (มหาชน)     ICBC=ธนาคารไอซีบีซี (ไทย) จำกัด (มหาชน)     TCRB=ธนาคารไทยเครดิต จำกัด (มหาชน)     LHB=ธนาคารแลนด์ แอนด์ เฮ้าส์ จำกัด (มหาชน)     SMTB=ธนาคารซูมิโตโม มิตซุย ทรัสต์ (ไทย) จำกัด (มหาชน)     SME=ธนาคารพัฒนาวิสาหกิจขนาดกลางและขนาดย่อมแห่งประเทศไทย
    set test variable   ${bank_dict}
    set test variable   ${bank_name_dict}
    Open Excel Document      filename=${CURDIR}/Mastercase_Template.xlsx   doc_id=docname1
    ${master_case_id}=    create master case id of bank name '${BANK_NAME}'
    set test variable   ${master_case_id}
    Write Excel Cell	3   1    ${master_case_id}    sheet_name=CreateBankCase
    ${polics_date}=    create polics date 'before_create_case'
    ${polics_time}=    create polics time 'random'
    ${polics_case_id}=    create polics case id 'random' total '50' digit
    ${police_section}=    การตรวจพบรายการ คือ 'ผู้เสียหายแจ้งเอง มาตรา 7'
    Write Excel Cell	3   2    ${polics_date}    sheet_name=CreateBankCase
    Write Excel Cell	3   3    ${polics_time}    sheet_name=CreateBankCase
    Write Excel Cell	3   4    ${polics_case_id}    sheet_name=CreateBankCase
    Write Excel Cell	3   5    ${police_section}    sheet_name=CreateBankCase
    set test variable    ${master_file_name}    Mastercase_${master_case_id}
    Save Excel Document      filename=${CURDIR}/${FOLDER}/${master_file_name}.xlsx
    Close Current Excel Document
    set test variable    ${test_case_name}    ${FOLDER}
    Create victim information '${FOLDER}/${master_file_name}' of bank name '${bank_name_dict}[${BANK_NAME}]'
#     Create transaction to banks '${HORSE_LIST}' in '${FOLDER}/${master_file_name}' only 1
    Create transaction to banks '${HORSE_LIST}' in '${FOLDER}/${master_file_name}' Case Insert personalID from add Sub Case
    Add Master Case via API '${FOLDER}/${master_file_name}' bank name '${BANK_NAME}'

Create Master Case File '${FOLDER}' from bank name '${BANK_NAME}' to '${HORSE_LIST}' personal null
    ${horse_list_dict} =    Create Dictionary
    set test variable   ${horse_list_dict}
    Create Directory     ${CURDIR}/${FOLDER}
    ${bank_dict} =    Create Dictionary    ธนาคารกรุงเทพ จำกัด (มหาชน)=BBL    ธนาคารกสิกรไทย จำกัด (มหาชน)=KBNK    ธนาคารกรุงไทย จำกัด (มหาชน)=KTB    ธนาคาร เจพีมอร์แกน เชส=JPMC    ธนาคาร โอเวอร์ซี-ไชนีสแบงกิ้งคอร์ปอเรชั่น จํากัด=OCBC    ธนาคารทหารไทยธนชาต จำกัด (มหาชน)=TTB    ธนาคารไทยพาณิชย์ จำกัด (มหาชน)=SCB    ธนาคารซิตี้แบงก์=CITI    ธนาคารซูมิโตโม มิตซุย แบงกิ้ง คอร์ปอเรชั่น=SMBC    ธนาคารสแตนดาร์ดชาร์เตอร์ด(ไทย) จำกัด (มหาชน)=SCBT    ธนาคาร ซีไอเอ็มบี ไทย จำกัด (มหาชน)=CMBT    ธนาคาร อาร์ เอช บี จำกัด=RHB    ธนาคารยูโอบี จำกัด (มหาชน)=UOBT    ธนาคารกรุงศรีอยุธยา จำกัด (มหาชน)=BAY    ธนาคารเมกะ สากลพาณิชย์ จำกัด (มหาชน)=MEGA    ธนาคารแห่งอเมริกา เนชั่นแนล แอสโซซิเอชั่น=BOA    ธนาคารอินเดียนโอเวอร์ซีส์=IOB    ธนาคารออมสิน=GSB    ธนาคารฮ่องกงและเซี่ยงไฮ้แบงกิ้ง คอร์ปอเรชั่น จำกัด=HSBC    ธนาคารดอยซ์แบงก์=DB    ธนาคารอาคารสงเคราะห์=GHB    ธนาคารเพื่อการเกษตรและสหกรณ์=BAAC    ธนาคารเพื่อการส่งออกและนำเข้าแห่งประเทศไทย=EXIM    ธนาคารมิซูโฮ จำกัด=MHCB    ธนาคารบีเอ็นพี พารีบาส์=BNPP    ธนาคารแห่งประเทศจีน จำกัด=BOC    ธนาคารอิสลามแห่งประเทศไทย=ISBT    ธนาคารทิสโก้ จำกัด (มหาชน)=TSCO    ธนาคารเกียรตินาคินภัทร จำกัด (มหาชน)=KKP    ธนาคารไอซีบีซี (ไทย) จำกัด (มหาชน)=ICBC    ธนาคารไทยเครดิต จำกัด (มหาชน)=TCRB    ธนาคารแลนด์ แอนด์ เฮ้าส์ จำกัด (มหาชน)=LHB    ธนาคารซูมิโตโม มิตซุย ทรัสต์ (ไทย) จำกัด (มหาชน)=SMTB    ธนาคารพัฒนาวิสาหกิจขนาดกลางและขนาดย่อมแห่งประเทศไทย=SME
    ${bank_name_dict} =    Create Dictionary    BBL=ธนาคารกรุงเทพ จำกัด (มหาชน)     KBNK=ธนาคารกสิกรไทย จำกัด (มหาชน)    KTB=ธนาคารกรุงไทย จำกัด (มหาชน)    JPMC=ธนาคาร เจพีมอร์แกน เชส    OCBC=ธนาคาร โอเวอร์ซี-ไชนีสแบงกิ้งคอร์ปอเรชั่น จํากัด    TTB=ธนาคารทหารไทยธนชาต จำกัด (มหาชน)     SCB=ธนาคารไทยพาณิชย์ จำกัด (มหาชน)     CITI=ธนาคารซิตี้แบงก์     SMBC=ธนาคารซูมิโตโม มิตซุย แบงกิ้ง คอร์ปอเรชั่น     SCBT=ธนาคารสแตนดาร์ดชาร์เตอร์ด(ไทย) จำกัด (มหาชน)     CMBT=ธนาคาร ซีไอเอ็มบี ไทย จำกัด (มหาชน)     RHB=ธนาคาร อาร์ เอช บี จำกัด     UOBT=ธนาคารยูโอบี จำกัด (มหาชน)     BAY=ธนาคารกรุงศรีอยุธยา จำกัด (มหาชน)     MEGA=ธนาคารเมกะ สากลพาณิชย์ จำกัด (มหาชน)     BOA=ธนาคารแห่งอเมริกา เนชั่นแนล แอสโซซิเอชั่น     IOB=ธนาคารอินเดียนโอเวอร์ซีส์     GSB=ธนาคารออมสิน     HSBC=ธนาคารฮ่องกงและเซี่ยงไฮ้แบงกิ้ง คอร์ปอเรชั่น จำกัด     DB=ธนาคารดอยซ์แบงก์     GHB=ธนาคารอาคารสงเคราะห์     BAAC=ธนาคารเพื่อการเกษตรและสหกรณ์     EXIM=ธนาคารเพื่อการส่งออกและนำเข้าแห่งประเทศไทย     MHCB=ธนาคารมิซูโฮ จำกัด     BNPP=ธนาคารบีเอ็นพี พารีบาส์     BOC=ธนาคารแห่งประเทศจีน จำกัด     ISBT=ธนาคารอิสลามแห่งประเทศไทย     TSCO=ธนาคารทิสโก้ จำกัด (มหาชน)     KKP=ธนาคารเกียรตินาคินภัทร จำกัด (มหาชน)     ICBC=ธนาคารไอซีบีซี (ไทย) จำกัด (มหาชน)     TCRB=ธนาคารไทยเครดิต จำกัด (มหาชน)     LHB=ธนาคารแลนด์ แอนด์ เฮ้าส์ จำกัด (มหาชน)     SMTB=ธนาคารซูมิโตโม มิตซุย ทรัสต์ (ไทย) จำกัด (มหาชน)     SME=ธนาคารพัฒนาวิสาหกิจขนาดกลางและขนาดย่อมแห่งประเทศไทย
    set test variable   ${bank_dict}
    set test variable   ${bank_name_dict}
    Open Excel Document      filename=${CURDIR}/Mastercase_Template.xlsx   doc_id=docname1
    ${master_case_id}=    create master case id of bank name '${BANK_NAME}'
    set test variable   ${master_case_id}
    Write Excel Cell	3   1    ${master_case_id}    sheet_name=CreateBankCase
    ${polics_date}=    create polics date 'before_create_case'
    ${polics_time}=    create polics time 'random'
    ${polics_case_id}=    create polics case id 'random' total '50' digit
    ${police_section}=    การตรวจพบรายการ คือ 'ผู้เสียหายแจ้งเอง มาตรา 7'
    Write Excel Cell	3   2    ${polics_date}    sheet_name=CreateBankCase
    Write Excel Cell	3   3    ${polics_time}    sheet_name=CreateBankCase
    Write Excel Cell	3   4    ${polics_case_id}    sheet_name=CreateBankCase
    Write Excel Cell	3   5    ${police_section}    sheet_name=CreateBankCase
    set test variable    ${master_file_name}    Mastercase_${master_case_id}
    Save Excel Document      filename=${CURDIR}/${FOLDER}/${master_file_name}.xlsx
    Close Current Excel Document
    set test variable    ${test_case_name}    ${FOLDER}
    Create victim information '${FOLDER}/${master_file_name}' of bank name '${bank_name_dict}[${BANK_NAME}]'
    Create transaction to banks '${HORSE_LIST}' in '${FOLDER}/${master_file_name}' personal null
    Add Master Case via API '${FOLDER}/${master_file_name}' bank name '${BANK_NAME}'

Create Master Case File '${FOLDER}' from bank name '${BANK_NAME}' to '${HORSE_LIST}' many Personal
    ${horse_list_dict} =    Create Dictionary
    set test variable   ${horse_list_dict}
    Create Directory     ${CURDIR}/${FOLDER}
    ${bank_dict} =    Create Dictionary    ธนาคารกรุงเทพ จำกัด (มหาชน)=BBL    ธนาคารกสิกรไทย จำกัด (มหาชน)=KBNK    ธนาคารกรุงไทย จำกัด (มหาชน)=KTB    ธนาคาร เจพีมอร์แกน เชส=JPMC    ธนาคาร โอเวอร์ซี-ไชนีสแบงกิ้งคอร์ปอเรชั่น จํากัด=OCBC    ธนาคารทหารไทยธนชาต จำกัด (มหาชน)=TTB    ธนาคารไทยพาณิชย์ จำกัด (มหาชน)=SCB    ธนาคารซิตี้แบงก์=CITI    ธนาคารซูมิโตโม มิตซุย แบงกิ้ง คอร์ปอเรชั่น=SMBC    ธนาคารสแตนดาร์ดชาร์เตอร์ด(ไทย) จำกัด (มหาชน)=SCBT    ธนาคาร ซีไอเอ็มบี ไทย จำกัด (มหาชน)=CMBT    ธนาคาร อาร์ เอช บี จำกัด=RHB    ธนาคารยูโอบี จำกัด (มหาชน)=UOBT    ธนาคารกรุงศรีอยุธยา จำกัด (มหาชน)=BAY    ธนาคารเมกะ สากลพาณิชย์ จำกัด (มหาชน)=MEGA    ธนาคารแห่งอเมริกา เนชั่นแนล แอสโซซิเอชั่น=BOA    ธนาคารอินเดียนโอเวอร์ซีส์=IOB    ธนาคารออมสิน=GSB    ธนาคารฮ่องกงและเซี่ยงไฮ้แบงกิ้ง คอร์ปอเรชั่น จำกัด=HSBC    ธนาคารดอยซ์แบงก์=DB    ธนาคารอาคารสงเคราะห์=GHB    ธนาคารเพื่อการเกษตรและสหกรณ์=BAAC    ธนาคารเพื่อการส่งออกและนำเข้าแห่งประเทศไทย=EXIM    ธนาคารมิซูโฮ จำกัด=MHCB    ธนาคารบีเอ็นพี พารีบาส์=BNPP    ธนาคารแห่งประเทศจีน จำกัด=BOC    ธนาคารอิสลามแห่งประเทศไทย=ISBT    ธนาคารทิสโก้ จำกัด (มหาชน)=TSCO    ธนาคารเกียรตินาคินภัทร จำกัด (มหาชน)=KKP    ธนาคารไอซีบีซี (ไทย) จำกัด (มหาชน)=ICBC    ธนาคารไทยเครดิต จำกัด (มหาชน)=TCRB    ธนาคารแลนด์ แอนด์ เฮ้าส์ จำกัด (มหาชน)=LHB    ธนาคารซูมิโตโม มิตซุย ทรัสต์ (ไทย) จำกัด (มหาชน)=SMTB    ธนาคารพัฒนาวิสาหกิจขนาดกลางและขนาดย่อมแห่งประเทศไทย=SME
    ${bank_name_dict} =    Create Dictionary    BBL=ธนาคารกรุงเทพ จำกัด (มหาชน)     KBNK=ธนาคารกสิกรไทย จำกัด (มหาชน)    KTB=ธนาคารกรุงไทย จำกัด (มหาชน)    JPMC=ธนาคาร เจพีมอร์แกน เชส    OCBC=ธนาคาร โอเวอร์ซี-ไชนีสแบงกิ้งคอร์ปอเรชั่น จํากัด    TTB=ธนาคารทหารไทยธนชาต จำกัด (มหาชน)     SCB=ธนาคารไทยพาณิชย์ จำกัด (มหาชน)     CITI=ธนาคารซิตี้แบงก์     SMBC=ธนาคารซูมิโตโม มิตซุย แบงกิ้ง คอร์ปอเรชั่น     SCBT=ธนาคารสแตนดาร์ดชาร์เตอร์ด(ไทย) จำกัด (มหาชน)     CMBT=ธนาคาร ซีไอเอ็มบี ไทย จำกัด (มหาชน)     RHB=ธนาคาร อาร์ เอช บี จำกัด     UOBT=ธนาคารยูโอบี จำกัด (มหาชน)     BAY=ธนาคารกรุงศรีอยุธยา จำกัด (มหาชน)     MEGA=ธนาคารเมกะ สากลพาณิชย์ จำกัด (มหาชน)     BOA=ธนาคารแห่งอเมริกา เนชั่นแนล แอสโซซิเอชั่น     IOB=ธนาคารอินเดียนโอเวอร์ซีส์     GSB=ธนาคารออมสิน     HSBC=ธนาคารฮ่องกงและเซี่ยงไฮ้แบงกิ้ง คอร์ปอเรชั่น จำกัด     DB=ธนาคารดอยซ์แบงก์     GHB=ธนาคารอาคารสงเคราะห์     BAAC=ธนาคารเพื่อการเกษตรและสหกรณ์     EXIM=ธนาคารเพื่อการส่งออกและนำเข้าแห่งประเทศไทย     MHCB=ธนาคารมิซูโฮ จำกัด     BNPP=ธนาคารบีเอ็นพี พารีบาส์     BOC=ธนาคารแห่งประเทศจีน จำกัด     ISBT=ธนาคารอิสลามแห่งประเทศไทย     TSCO=ธนาคารทิสโก้ จำกัด (มหาชน)     KKP=ธนาคารเกียรตินาคินภัทร จำกัด (มหาชน)     ICBC=ธนาคารไอซีบีซี (ไทย) จำกัด (มหาชน)     TCRB=ธนาคารไทยเครดิต จำกัด (มหาชน)     LHB=ธนาคารแลนด์ แอนด์ เฮ้าส์ จำกัด (มหาชน)     SMTB=ธนาคารซูมิโตโม มิตซุย ทรัสต์ (ไทย) จำกัด (มหาชน)     SME=ธนาคารพัฒนาวิสาหกิจขนาดกลางและขนาดย่อมแห่งประเทศไทย
    set test variable   ${bank_dict}
    set test variable   ${bank_name_dict}
    Open Excel Document      filename=${CURDIR}/Mastercase_Template.xlsx   doc_id=docname1
    ${master_case_id}=    create master case id of bank name '${BANK_NAME}'
    set test variable   ${master_case_id}
    Write Excel Cell	3   1    ${master_case_id}    sheet_name=CreateBankCase
    ${polics_date}=    create polics date 'before_create_case'
    ${polics_time}=    create polics time 'random'
    ${polics_case_id}=    create polics case id 'random' total '50' digit
    ${police_section}=    การตรวจพบรายการ คือ 'ผู้เสียหายแจ้งเอง มาตรา 7'
    Write Excel Cell	3   2    ${polics_date}    sheet_name=CreateBankCase
    Write Excel Cell	3   3    ${polics_time}    sheet_name=CreateBankCase
    Write Excel Cell	3   4    ${polics_case_id}    sheet_name=CreateBankCase
    Write Excel Cell	3   5    ${police_section}    sheet_name=CreateBankCase
    set test variable    ${master_file_name}    Mastercase_${master_case_id}
    Save Excel Document      filename=${CURDIR}/${FOLDER}/${master_file_name}.xlsx
    Close Current Excel Document
    set test variable    ${test_case_name}    ${FOLDER}
    Create victim information '${FOLDER}/${master_file_name}' of bank name '${bank_name_dict}[${BANK_NAME}]'
    Create transaction to banks '${HORSE_LIST}' in '${FOLDER}/${master_file_name}' many PersonalID
    Add Master Case via API '${FOLDER}/${master_file_name}' bank name '${BANK_NAME}'

Create Master Case File '${FOLDER}' from bank name '${BANK_NAME}' to '${HORSE_LIST}' SP TEST
    ${horse_list_dict} =    Create Dictionary
    set test variable   ${horse_list_dict}
    Create Directory     ${CURDIR}/${FOLDER}
    ${bank_dict} =    Create Dictionary    ธนาคารกรุงเทพ จำกัด (มหาชน)=BBL    ธนาคารกสิกรไทย จำกัด (มหาชน)=KBNK    ธนาคารกรุงไทย จำกัด (มหาชน)=KTB    ธนาคาร เจพีมอร์แกน เชส=JPMC    ธนาคาร โอเวอร์ซี-ไชนีสแบงกิ้งคอร์ปอเรชั่น จํากัด=OCBC    ธนาคารทหารไทยธนชาต จำกัด (มหาชน)=TTB    ธนาคารไทยพาณิชย์ จำกัด (มหาชน)=SCB    ธนาคารซิตี้แบงก์=CITI    ธนาคารซูมิโตโม มิตซุย แบงกิ้ง คอร์ปอเรชั่น=SMBC    ธนาคารสแตนดาร์ดชาร์เตอร์ด(ไทย) จำกัด (มหาชน)=SCBT    ธนาคาร ซีไอเอ็มบี ไทย จำกัด (มหาชน)=CMBT    ธนาคาร อาร์ เอช บี จำกัด=RHB    ธนาคารยูโอบี จำกัด (มหาชน)=UOBT    ธนาคารกรุงศรีอยุธยา จำกัด (มหาชน)=BAY    ธนาคารเมกะ สากลพาณิชย์ จำกัด (มหาชน)=MEGA    ธนาคารแห่งอเมริกา เนชั่นแนล แอสโซซิเอชั่น=BOA    ธนาคารอินเดียนโอเวอร์ซีส์=IOB    ธนาคารออมสิน=GSB    ธนาคารฮ่องกงและเซี่ยงไฮ้แบงกิ้ง คอร์ปอเรชั่น จำกัด=HSBC    ธนาคารดอยซ์แบงก์=DB    ธนาคารอาคารสงเคราะห์=GHB    ธนาคารเพื่อการเกษตรและสหกรณ์=BAAC    ธนาคารเพื่อการส่งออกและนำเข้าแห่งประเทศไทย=EXIM    ธนาคารมิซูโฮ จำกัด=MHCB    ธนาคารบีเอ็นพี พารีบาส์=BNPP    ธนาคารแห่งประเทศจีน จำกัด=BOC    ธนาคารอิสลามแห่งประเทศไทย=ISBT    ธนาคารทิสโก้ จำกัด (มหาชน)=TSCO    ธนาคารเกียรตินาคินภัทร จำกัด (มหาชน)=KKP    ธนาคารไอซีบีซี (ไทย) จำกัด (มหาชน)=ICBC    ธนาคารไทยเครดิต จำกัด (มหาชน)=TCRB    ธนาคารแลนด์ แอนด์ เฮ้าส์ จำกัด (มหาชน)=LHB    ธนาคารซูมิโตโม มิตซุย ทรัสต์ (ไทย) จำกัด (มหาชน)=SMTB    ธนาคารพัฒนาวิสาหกิจขนาดกลางและขนาดย่อมแห่งประเทศไทย=SME
    ${bank_name_dict} =    Create Dictionary    BBL=ธนาคารกรุงเทพ จำกัด (มหาชน)     KBNK=ธนาคารกสิกรไทย จำกัด (มหาชน)    KTB=ธนาคารกรุงไทย จำกัด (มหาชน)    JPMC=ธนาคาร เจพีมอร์แกน เชส    OCBC=ธนาคาร โอเวอร์ซี-ไชนีสแบงกิ้งคอร์ปอเรชั่น จํากัด    TTB=ธนาคารทหารไทยธนชาต จำกัด (มหาชน)     SCB=ธนาคารไทยพาณิชย์ จำกัด (มหาชน)     CITI=ธนาคารซิตี้แบงก์     SMBC=ธนาคารซูมิโตโม มิตซุย แบงกิ้ง คอร์ปอเรชั่น     SCBT=ธนาคารสแตนดาร์ดชาร์เตอร์ด(ไทย) จำกัด (มหาชน)     CMBT=ธนาคาร ซีไอเอ็มบี ไทย จำกัด (มหาชน)     RHB=ธนาคาร อาร์ เอช บี จำกัด     UOBT=ธนาคารยูโอบี จำกัด (มหาชน)     BAY=ธนาคารกรุงศรีอยุธยา จำกัด (มหาชน)     MEGA=ธนาคารเมกะ สากลพาณิชย์ จำกัด (มหาชน)     BOA=ธนาคารแห่งอเมริกา เนชั่นแนล แอสโซซิเอชั่น     IOB=ธนาคารอินเดียนโอเวอร์ซีส์     GSB=ธนาคารออมสิน     HSBC=ธนาคารฮ่องกงและเซี่ยงไฮ้แบงกิ้ง คอร์ปอเรชั่น จำกัด     DB=ธนาคารดอยซ์แบงก์     GHB=ธนาคารอาคารสงเคราะห์     BAAC=ธนาคารเพื่อการเกษตรและสหกรณ์     EXIM=ธนาคารเพื่อการส่งออกและนำเข้าแห่งประเทศไทย     MHCB=ธนาคารมิซูโฮ จำกัด     BNPP=ธนาคารบีเอ็นพี พารีบาส์     BOC=ธนาคารแห่งประเทศจีน จำกัด     ISBT=ธนาคารอิสลามแห่งประเทศไทย     TSCO=ธนาคารทิสโก้ จำกัด (มหาชน)     KKP=ธนาคารเกียรตินาคินภัทร จำกัด (มหาชน)     ICBC=ธนาคารไอซีบีซี (ไทย) จำกัด (มหาชน)     TCRB=ธนาคารไทยเครดิต จำกัด (มหาชน)     LHB=ธนาคารแลนด์ แอนด์ เฮ้าส์ จำกัด (มหาชน)     SMTB=ธนาคารซูมิโตโม มิตซุย ทรัสต์ (ไทย) จำกัด (มหาชน)     SME=ธนาคารพัฒนาวิสาหกิจขนาดกลางและขนาดย่อมแห่งประเทศไทย
    set test variable   ${bank_dict}
    set test variable   ${bank_name_dict}
    Open Excel Document      filename=${CURDIR}/Mastercase_Template.xlsx   doc_id=docname1
    ${master_case_id}=    create master case id of bank name '${BANK_NAME}'
    set test variable   ${master_case_id}
    Write Excel Cell	3   1    ${master_case_id}    sheet_name=CreateBankCase
    ${polics_date}=    create polics date 'before_create_case'
    ${polics_time}=    create polics time 'random'
    ${polics_case_id}=    create polics case id 'random' total '50' digit
    ${police_section}=    การตรวจพบรายการ คือ 'ผู้เสียหายแจ้งเอง มาตรา 7'
    Write Excel Cell	3   2    ${polics_date}    sheet_name=CreateBankCase
    Write Excel Cell	3   3    ${polics_time}    sheet_name=CreateBankCase
    Write Excel Cell	3   4    ${polics_case_id}    sheet_name=CreateBankCase
    Write Excel Cell	3   5    ${police_section}    sheet_name=CreateBankCase
    set test variable    ${master_file_name}    Mastercase_${master_case_id}
    Save Excel Document      filename=${CURDIR}/${FOLDER}/${master_file_name}.xlsx
    Close Current Excel Document
    set test variable    ${test_case_name}    ${FOLDER}
    Create victim information '${FOLDER}/${master_file_name}' of bank name '${bank_name_dict}[${BANK_NAME}]' SP TEST
    Create transaction to banks '${HORSE_LIST}' in '${FOLDER}/${master_file_name}' SP TEST
    Add Master Case via API '${FOLDER}/${master_file_name}' bank name '${BANK_NAME}' SP TEST


Create Master Case File '${FOLDER}' from bank name '${BANK_NAME}' to '${HORSE_LIST}' Test 1-3
    ${horse_list_dict} =    Create Dictionary
    set test variable   ${horse_list_dict}
    Create Directory     ${CURDIR}/${FOLDER}
    ${bank_dict} =    Create Dictionary    ธนาคารกรุงเทพ จำกัด (มหาชน)=BBL    ธนาคารกสิกรไทย จำกัด (มหาชน)=KBNK    ธนาคารกรุงไทย จำกัด (มหาชน)=KTB    ธนาคาร เจพีมอร์แกน เชส=JPMC    ธนาคาร โอเวอร์ซี-ไชนีสแบงกิ้งคอร์ปอเรชั่น จํากัด=OCBC    ธนาคารทหารไทยธนชาต จำกัด (มหาชน)=TTB    ธนาคารไทยพาณิชย์ จำกัด (มหาชน)=SCB    ธนาคารซิตี้แบงก์=CITI    ธนาคารซูมิโตโม มิตซุย แบงกิ้ง คอร์ปอเรชั่น=SMBC    ธนาคารสแตนดาร์ดชาร์เตอร์ด(ไทย) จำกัด (มหาชน)=SCBT    ธนาคาร ซีไอเอ็มบี ไทย จำกัด (มหาชน)=CMBT    ธนาคาร อาร์ เอช บี จำกัด=RHB    ธนาคารยูโอบี จำกัด (มหาชน)=UOBT    ธนาคารกรุงศรีอยุธยา จำกัด (มหาชน)=BAY    ธนาคารเมกะ สากลพาณิชย์ จำกัด (มหาชน)=MEGA    ธนาคารแห่งอเมริกา เนชั่นแนล แอสโซซิเอชั่น=BOA    ธนาคารอินเดียนโอเวอร์ซีส์=IOB    ธนาคารออมสิน=GSB    ธนาคารฮ่องกงและเซี่ยงไฮ้แบงกิ้ง คอร์ปอเรชั่น จำกัด=HSBC    ธนาคารดอยซ์แบงก์=DB    ธนาคารอาคารสงเคราะห์=GHB    ธนาคารเพื่อการเกษตรและสหกรณ์=BAAC    ธนาคารเพื่อการส่งออกและนำเข้าแห่งประเทศไทย=EXIM    ธนาคารมิซูโฮ จำกัด=MHCB    ธนาคารบีเอ็นพี พารีบาส์=BNPP    ธนาคารแห่งประเทศจีน จำกัด=BOC    ธนาคารอิสลามแห่งประเทศไทย=ISBT    ธนาคารทิสโก้ จำกัด (มหาชน)=TSCO    ธนาคารเกียรตินาคินภัทร จำกัด (มหาชน)=KKP    ธนาคารไอซีบีซี (ไทย) จำกัด (มหาชน)=ICBC    ธนาคารไทยเครดิต จำกัด (มหาชน)=TCRB    ธนาคารแลนด์ แอนด์ เฮ้าส์ จำกัด (มหาชน)=LHB    ธนาคารซูมิโตโม มิตซุย ทรัสต์ (ไทย) จำกัด (มหาชน)=SMTB    ธนาคารพัฒนาวิสาหกิจขนาดกลางและขนาดย่อมแห่งประเทศไทย=SME
    ${bank_name_dict} =    Create Dictionary    BBL=ธนาคารกรุงเทพ จำกัด (มหาชน)     KBNK=ธนาคารกสิกรไทย จำกัด (มหาชน)    KTB=ธนาคารกรุงไทย จำกัด (มหาชน)    JPMC=ธนาคาร เจพีมอร์แกน เชส    OCBC=ธนาคาร โอเวอร์ซี-ไชนีสแบงกิ้งคอร์ปอเรชั่น จํากัด    TTB=ธนาคารทหารไทยธนชาต จำกัด (มหาชน)     SCB=ธนาคารไทยพาณิชย์ จำกัด (มหาชน)     CITI=ธนาคารซิตี้แบงก์     SMBC=ธนาคารซูมิโตโม มิตซุย แบงกิ้ง คอร์ปอเรชั่น     SCBT=ธนาคารสแตนดาร์ดชาร์เตอร์ด(ไทย) จำกัด (มหาชน)     CMBT=ธนาคาร ซีไอเอ็มบี ไทย จำกัด (มหาชน)     RHB=ธนาคาร อาร์ เอช บี จำกัด     UOBT=ธนาคารยูโอบี จำกัด (มหาชน)     BAY=ธนาคารกรุงศรีอยุธยา จำกัด (มหาชน)     MEGA=ธนาคารเมกะ สากลพาณิชย์ จำกัด (มหาชน)     BOA=ธนาคารแห่งอเมริกา เนชั่นแนล แอสโซซิเอชั่น     IOB=ธนาคารอินเดียนโอเวอร์ซีส์     GSB=ธนาคารออมสิน     HSBC=ธนาคารฮ่องกงและเซี่ยงไฮ้แบงกิ้ง คอร์ปอเรชั่น จำกัด     DB=ธนาคารดอยซ์แบงก์     GHB=ธนาคารอาคารสงเคราะห์     BAAC=ธนาคารเพื่อการเกษตรและสหกรณ์     EXIM=ธนาคารเพื่อการส่งออกและนำเข้าแห่งประเทศไทย     MHCB=ธนาคารมิซูโฮ จำกัด     BNPP=ธนาคารบีเอ็นพี พารีบาส์     BOC=ธนาคารแห่งประเทศจีน จำกัด     ISBT=ธนาคารอิสลามแห่งประเทศไทย     TSCO=ธนาคารทิสโก้ จำกัด (มหาชน)     KKP=ธนาคารเกียรตินาคินภัทร จำกัด (มหาชน)     ICBC=ธนาคารไอซีบีซี (ไทย) จำกัด (มหาชน)     TCRB=ธนาคารไทยเครดิต จำกัด (มหาชน)     LHB=ธนาคารแลนด์ แอนด์ เฮ้าส์ จำกัด (มหาชน)     SMTB=ธนาคารซูมิโตโม มิตซุย ทรัสต์ (ไทย) จำกัด (มหาชน)     SME=ธนาคารพัฒนาวิสาหกิจขนาดกลางและขนาดย่อมแห่งประเทศไทย
    set test variable   ${bank_dict}
    set test variable   ${bank_name_dict}
    Open Excel Document      filename=${CURDIR}/Mastercase_Template.xlsx   doc_id=docname1
    ${master_case_id}=    create master case id of bank name '${BANK_NAME}'
    set test variable   ${master_case_id}
    Write Excel Cell	3   1    ${master_case_id}    sheet_name=CreateBankCase
    ${polics_date}=    create polics date 'before_create_case'
    ${polics_time}=    create polics time 'random'
    ${polics_case_id}=    create polics case id 'random' total '50' digit
    ${police_section}=    การตรวจพบรายการ คือ 'ผู้เสียหายแจ้งเอง มาตรา 7'
    Write Excel Cell	3   2    ${polics_date}    sheet_name=CreateBankCase
    Write Excel Cell	3   3    ${polics_time}    sheet_name=CreateBankCase
    Write Excel Cell	3   4    ${polics_case_id}    sheet_name=CreateBankCase
    Write Excel Cell	3   5    ${police_section}    sheet_name=CreateBankCase
    set test variable    ${master_file_name}    Mastercase_${master_case_id}
    Save Excel Document      filename=${CURDIR}/${FOLDER}/${master_file_name}.xlsx
    Close Current Excel Document
    set test variable    ${test_case_name}    ${FOLDER}
    Create victim information '${FOLDER}/${master_file_name}' of bank name '${bank_name_dict}[${BANK_NAME}]' test 1-3
    Create transaction to banks '${HORSE_LIST}' in '${FOLDER}/${master_file_name}' Test 1-3
    Add Master Case via API '${FOLDER}/${master_file_name}' bank name '${BANK_NAME}'

Create Master Case File '${FOLDER}' from bank name '${BANK_NAME}' to '${HORSE_LIST}' to 2 personal 3 account
    ${horse_list_dict} =    Create Dictionary
    set test variable   ${horse_list_dict}
    Create Directory     ${CURDIR}/${FOLDER}
    ${bank_dict} =    Create Dictionary    ธนาคารกรุงเทพ จำกัด (มหาชน)=BBL    ธนาคารกสิกรไทย จำกัด (มหาชน)=KBNK    ธนาคารกรุงไทย จำกัด (มหาชน)=KTB    ธนาคาร เจพีมอร์แกน เชส=JPMC    ธนาคาร โอเวอร์ซี-ไชนีสแบงกิ้งคอร์ปอเรชั่น จํากัด=OCBC    ธนาคารทหารไทยธนชาต จำกัด (มหาชน)=TTB    ธนาคารไทยพาณิชย์ จำกัด (มหาชน)=SCB    ธนาคารซิตี้แบงก์=CITI    ธนาคารซูมิโตโม มิตซุย แบงกิ้ง คอร์ปอเรชั่น=SMBC    ธนาคารสแตนดาร์ดชาร์เตอร์ด(ไทย) จำกัด (มหาชน)=SCBT    ธนาคาร ซีไอเอ็มบี ไทย จำกัด (มหาชน)=CMBT    ธนาคาร อาร์ เอช บี จำกัด=RHB    ธนาคารยูโอบี จำกัด (มหาชน)=UOBT    ธนาคารกรุงศรีอยุธยา จำกัด (มหาชน)=BAY    ธนาคารเมกะ สากลพาณิชย์ จำกัด (มหาชน)=MEGA    ธนาคารแห่งอเมริกา เนชั่นแนล แอสโซซิเอชั่น=BOA    ธนาคารอินเดียนโอเวอร์ซีส์=IOB    ธนาคารออมสิน=GSB    ธนาคารฮ่องกงและเซี่ยงไฮ้แบงกิ้ง คอร์ปอเรชั่น จำกัด=HSBC    ธนาคารดอยซ์แบงก์=DB    ธนาคารอาคารสงเคราะห์=GHB    ธนาคารเพื่อการเกษตรและสหกรณ์=BAAC    ธนาคารเพื่อการส่งออกและนำเข้าแห่งประเทศไทย=EXIM    ธนาคารมิซูโฮ จำกัด=MHCB    ธนาคารบีเอ็นพี พารีบาส์=BNPP    ธนาคารแห่งประเทศจีน จำกัด=BOC    ธนาคารอิสลามแห่งประเทศไทย=ISBT    ธนาคารทิสโก้ จำกัด (มหาชน)=TSCO    ธนาคารเกียรตินาคินภัทร จำกัด (มหาชน)=KKP    ธนาคารไอซีบีซี (ไทย) จำกัด (มหาชน)=ICBC    ธนาคารไทยเครดิต จำกัด (มหาชน)=TCRB    ธนาคารแลนด์ แอนด์ เฮ้าส์ จำกัด (มหาชน)=LHB    ธนาคารซูมิโตโม มิตซุย ทรัสต์ (ไทย) จำกัด (มหาชน)=SMTB    ธนาคารพัฒนาวิสาหกิจขนาดกลางและขนาดย่อมแห่งประเทศไทย=SME
    ${bank_name_dict} =    Create Dictionary    BBL=ธนาคารกรุงเทพ จำกัด (มหาชน)     KBNK=ธนาคารกสิกรไทย จำกัด (มหาชน)    KTB=ธนาคารกรุงไทย จำกัด (มหาชน)    JPMC=ธนาคาร เจพีมอร์แกน เชส    OCBC=ธนาคาร โอเวอร์ซี-ไชนีสแบงกิ้งคอร์ปอเรชั่น จํากัด    TTB=ธนาคารทหารไทยธนชาต จำกัด (มหาชน)     SCB=ธนาคารไทยพาณิชย์ จำกัด (มหาชน)     CITI=ธนาคารซิตี้แบงก์     SMBC=ธนาคารซูมิโตโม มิตซุย แบงกิ้ง คอร์ปอเรชั่น     SCBT=ธนาคารสแตนดาร์ดชาร์เตอร์ด(ไทย) จำกัด (มหาชน)     CMBT=ธนาคาร ซีไอเอ็มบี ไทย จำกัด (มหาชน)     RHB=ธนาคาร อาร์ เอช บี จำกัด     UOBT=ธนาคารยูโอบี จำกัด (มหาชน)     BAY=ธนาคารกรุงศรีอยุธยา จำกัด (มหาชน)     MEGA=ธนาคารเมกะ สากลพาณิชย์ จำกัด (มหาชน)     BOA=ธนาคารแห่งอเมริกา เนชั่นแนล แอสโซซิเอชั่น     IOB=ธนาคารอินเดียนโอเวอร์ซีส์     GSB=ธนาคารออมสิน     HSBC=ธนาคารฮ่องกงและเซี่ยงไฮ้แบงกิ้ง คอร์ปอเรชั่น จำกัด     DB=ธนาคารดอยซ์แบงก์     GHB=ธนาคารอาคารสงเคราะห์     BAAC=ธนาคารเพื่อการเกษตรและสหกรณ์     EXIM=ธนาคารเพื่อการส่งออกและนำเข้าแห่งประเทศไทย     MHCB=ธนาคารมิซูโฮ จำกัด     BNPP=ธนาคารบีเอ็นพี พารีบาส์     BOC=ธนาคารแห่งประเทศจีน จำกัด     ISBT=ธนาคารอิสลามแห่งประเทศไทย     TSCO=ธนาคารทิสโก้ จำกัด (มหาชน)     KKP=ธนาคารเกียรตินาคินภัทร จำกัด (มหาชน)     ICBC=ธนาคารไอซีบีซี (ไทย) จำกัด (มหาชน)     TCRB=ธนาคารไทยเครดิต จำกัด (มหาชน)     LHB=ธนาคารแลนด์ แอนด์ เฮ้าส์ จำกัด (มหาชน)     SMTB=ธนาคารซูมิโตโม มิตซุย ทรัสต์ (ไทย) จำกัด (มหาชน)     SME=ธนาคารพัฒนาวิสาหกิจขนาดกลางและขนาดย่อมแห่งประเทศไทย
    set test variable   ${bank_dict}
    set test variable   ${bank_name_dict}
    Open Excel Document      filename=${CURDIR}/Mastercase_Template.xlsx   doc_id=docname1
    ${master_case_id}=    create master case id of bank name '${BANK_NAME}'
    set test variable   ${master_case_id}
    Write Excel Cell	3   1    ${master_case_id}    sheet_name=CreateBankCase
    ${polics_date}=    create polics date 'before_create_case'
    ${polics_time}=    create polics time 'random'
    ${polics_case_id}=    create polics case id 'random' total '50' digit
    ${police_section}=    การตรวจพบรายการ คือ 'ผู้เสียหายแจ้งเอง มาตรา 7'
    Write Excel Cell	3   2    ${polics_date}    sheet_name=CreateBankCase
    Write Excel Cell	3   3    ${polics_time}    sheet_name=CreateBankCase
    Write Excel Cell	3   4    ${polics_case_id}    sheet_name=CreateBankCase
    Write Excel Cell	3   5    ${police_section}    sheet_name=CreateBankCase
    set test variable    ${master_file_name}    Mastercase_${master_case_id}
    Save Excel Document      filename=${CURDIR}/${FOLDER}/${master_file_name}.xlsx
    Close Current Excel Document
    set test variable    ${test_case_name}    ${FOLDER}
    Create victim information '${FOLDER}/${master_file_name}' of bank name '${bank_name_dict}[${BANK_NAME}]' test 1-3
    Create transaction to banks '${HORSE_LIST}' in '${FOLDER}/${master_file_name}' To 2 personal 3 account
    Add Master Case via API '${FOLDER}/${master_file_name}' bank name '${BANK_NAME}'

Create Master Case File '${FOLDER}' from bank name '${BANK_NAME}' to '${HORSE_LIST}' only 2 account many Personal
    ${horse_list_dict} =    Create Dictionary
    set test variable   ${horse_list_dict}
    Create Directory     ${CURDIR}/${FOLDER}
    ${bank_dict} =    Create Dictionary    ธนาคารกรุงเทพ จำกัด (มหาชน)=BBL    ธนาคารกสิกรไทย จำกัด (มหาชน)=KBNK    ธนาคารกรุงไทย จำกัด (มหาชน)=KTB    ธนาคาร เจพีมอร์แกน เชส=JPMC    ธนาคาร โอเวอร์ซี-ไชนีสแบงกิ้งคอร์ปอเรชั่น จํากัด=OCBC    ธนาคารทหารไทยธนชาต จำกัด (มหาชน)=TTB    ธนาคารไทยพาณิชย์ จำกัด (มหาชน)=SCB    ธนาคารซิตี้แบงก์=CITI    ธนาคารซูมิโตโม มิตซุย แบงกิ้ง คอร์ปอเรชั่น=SMBC    ธนาคารสแตนดาร์ดชาร์เตอร์ด(ไทย) จำกัด (มหาชน)=SCBT    ธนาคาร ซีไอเอ็มบี ไทย จำกัด (มหาชน)=CMBT    ธนาคาร อาร์ เอช บี จำกัด=RHB    ธนาคารยูโอบี จำกัด (มหาชน)=UOBT    ธนาคารกรุงศรีอยุธยา จำกัด (มหาชน)=BAY    ธนาคารเมกะ สากลพาณิชย์ จำกัด (มหาชน)=MEGA    ธนาคารแห่งอเมริกา เนชั่นแนล แอสโซซิเอชั่น=BOA    ธนาคารอินเดียนโอเวอร์ซีส์=IOB    ธนาคารออมสิน=GSB    ธนาคารฮ่องกงและเซี่ยงไฮ้แบงกิ้ง คอร์ปอเรชั่น จำกัด=HSBC    ธนาคารดอยซ์แบงก์=DB    ธนาคารอาคารสงเคราะห์=GHB    ธนาคารเพื่อการเกษตรและสหกรณ์=BAAC    ธนาคารเพื่อการส่งออกและนำเข้าแห่งประเทศไทย=EXIM    ธนาคารมิซูโฮ จำกัด=MHCB    ธนาคารบีเอ็นพี พารีบาส์=BNPP    ธนาคารแห่งประเทศจีน จำกัด=BOC    ธนาคารอิสลามแห่งประเทศไทย=ISBT    ธนาคารทิสโก้ จำกัด (มหาชน)=TSCO    ธนาคารเกียรตินาคินภัทร จำกัด (มหาชน)=KKP    ธนาคารไอซีบีซี (ไทย) จำกัด (มหาชน)=ICBC    ธนาคารไทยเครดิต จำกัด (มหาชน)=TCRB    ธนาคารแลนด์ แอนด์ เฮ้าส์ จำกัด (มหาชน)=LHB    ธนาคารซูมิโตโม มิตซุย ทรัสต์ (ไทย) จำกัด (มหาชน)=SMTB    ธนาคารพัฒนาวิสาหกิจขนาดกลางและขนาดย่อมแห่งประเทศไทย=SME
    ${bank_name_dict} =    Create Dictionary    BBL=ธนาคารกรุงเทพ จำกัด (มหาชน)     KBNK=ธนาคารกสิกรไทย จำกัด (มหาชน)    KTB=ธนาคารกรุงไทย จำกัด (มหาชน)    JPMC=ธนาคาร เจพีมอร์แกน เชส    OCBC=ธนาคาร โอเวอร์ซี-ไชนีสแบงกิ้งคอร์ปอเรชั่น จํากัด    TTB=ธนาคารทหารไทยธนชาต จำกัด (มหาชน)     SCB=ธนาคารไทยพาณิชย์ จำกัด (มหาชน)     CITI=ธนาคารซิตี้แบงก์     SMBC=ธนาคารซูมิโตโม มิตซุย แบงกิ้ง คอร์ปอเรชั่น     SCBT=ธนาคารสแตนดาร์ดชาร์เตอร์ด(ไทย) จำกัด (มหาชน)     CMBT=ธนาคาร ซีไอเอ็มบี ไทย จำกัด (มหาชน)     RHB=ธนาคาร อาร์ เอช บี จำกัด     UOBT=ธนาคารยูโอบี จำกัด (มหาชน)     BAY=ธนาคารกรุงศรีอยุธยา จำกัด (มหาชน)     MEGA=ธนาคารเมกะ สากลพาณิชย์ จำกัด (มหาชน)     BOA=ธนาคารแห่งอเมริกา เนชั่นแนล แอสโซซิเอชั่น     IOB=ธนาคารอินเดียนโอเวอร์ซีส์     GSB=ธนาคารออมสิน     HSBC=ธนาคารฮ่องกงและเซี่ยงไฮ้แบงกิ้ง คอร์ปอเรชั่น จำกัด     DB=ธนาคารดอยซ์แบงก์     GHB=ธนาคารอาคารสงเคราะห์     BAAC=ธนาคารเพื่อการเกษตรและสหกรณ์     EXIM=ธนาคารเพื่อการส่งออกและนำเข้าแห่งประเทศไทย     MHCB=ธนาคารมิซูโฮ จำกัด     BNPP=ธนาคารบีเอ็นพี พารีบาส์     BOC=ธนาคารแห่งประเทศจีน จำกัด     ISBT=ธนาคารอิสลามแห่งประเทศไทย     TSCO=ธนาคารทิสโก้ จำกัด (มหาชน)     KKP=ธนาคารเกียรตินาคินภัทร จำกัด (มหาชน)     ICBC=ธนาคารไอซีบีซี (ไทย) จำกัด (มหาชน)     TCRB=ธนาคารไทยเครดิต จำกัด (มหาชน)     LHB=ธนาคารแลนด์ แอนด์ เฮ้าส์ จำกัด (มหาชน)     SMTB=ธนาคารซูมิโตโม มิตซุย ทรัสต์ (ไทย) จำกัด (มหาชน)     SME=ธนาคารพัฒนาวิสาหกิจขนาดกลางและขนาดย่อมแห่งประเทศไทย
    set test variable   ${bank_dict}
    set test variable   ${bank_name_dict}
    Open Excel Document      filename=${CURDIR}/Mastercase_Template.xlsx   doc_id=docname1
    ${master_case_id}=    create master case id of bank name '${BANK_NAME}'
    set test variable   ${master_case_id}
    Write Excel Cell	3   1    ${master_case_id}    sheet_name=CreateBankCase
    ${polics_date}=    create polics date 'before_create_case'
    ${polics_time}=    create polics time 'random'
    ${polics_case_id}=    create polics case id 'random' total '50' digit
    ${police_section}=    การตรวจพบรายการ คือ 'ผู้เสียหายแจ้งเอง มาตรา 7'
    Write Excel Cell	3   2    ${polics_date}    sheet_name=CreateBankCase
    Write Excel Cell	3   3    ${polics_time}    sheet_name=CreateBankCase
    Write Excel Cell	3   4    ${polics_case_id}    sheet_name=CreateBankCase
    Write Excel Cell	3   5    ${police_section}    sheet_name=CreateBankCase
    set test variable    ${master_file_name}    Mastercase_${master_case_id}
    Save Excel Document      filename=${CURDIR}/${FOLDER}/${master_file_name}.xlsx
    Close Current Excel Document
    set test variable    ${test_case_name}    ${FOLDER}
    Create victim information '${FOLDER}/${master_file_name}' of bank name '${bank_name_dict}[${BANK_NAME}]'
    Create transaction to banks '${HORSE_LIST}' in '${FOLDER}/${master_file_name}' only 2
    Add Master Case via API '${FOLDER}/${master_file_name}' bank name '${BANK_NAME}'


Create Master Case File '${FOLDER}' from bank name '${BANK_NAME}' to '${HORSE_LIST}' only 3 account many Personal
    ${horse_list_dict} =    Create Dictionary
    set test variable   ${horse_list_dict}
    Create Directory     ${CURDIR}/${FOLDER}
    ${bank_dict} =    Create Dictionary    ธนาคารกรุงเทพ จำกัด (มหาชน)=BBL    ธนาคารกสิกรไทย จำกัด (มหาชน)=KBNK    ธนาคารกรุงไทย จำกัด (มหาชน)=KTB    ธนาคาร เจพีมอร์แกน เชส=JPMC    ธนาคาร โอเวอร์ซี-ไชนีสแบงกิ้งคอร์ปอเรชั่น จํากัด=OCBC    ธนาคารทหารไทยธนชาต จำกัด (มหาชน)=TTB    ธนาคารไทยพาณิชย์ จำกัด (มหาชน)=SCB    ธนาคารซิตี้แบงก์=CITI    ธนาคารซูมิโตโม มิตซุย แบงกิ้ง คอร์ปอเรชั่น=SMBC    ธนาคารสแตนดาร์ดชาร์เตอร์ด(ไทย) จำกัด (มหาชน)=SCBT    ธนาคาร ซีไอเอ็มบี ไทย จำกัด (มหาชน)=CMBT    ธนาคาร อาร์ เอช บี จำกัด=RHB    ธนาคารยูโอบี จำกัด (มหาชน)=UOBT    ธนาคารกรุงศรีอยุธยา จำกัด (มหาชน)=BAY    ธนาคารเมกะ สากลพาณิชย์ จำกัด (มหาชน)=MEGA    ธนาคารแห่งอเมริกา เนชั่นแนล แอสโซซิเอชั่น=BOA    ธนาคารอินเดียนโอเวอร์ซีส์=IOB    ธนาคารออมสิน=GSB    ธนาคารฮ่องกงและเซี่ยงไฮ้แบงกิ้ง คอร์ปอเรชั่น จำกัด=HSBC    ธนาคารดอยซ์แบงก์=DB    ธนาคารอาคารสงเคราะห์=GHB    ธนาคารเพื่อการเกษตรและสหกรณ์=BAAC    ธนาคารเพื่อการส่งออกและนำเข้าแห่งประเทศไทย=EXIM    ธนาคารมิซูโฮ จำกัด=MHCB    ธนาคารบีเอ็นพี พารีบาส์=BNPP    ธนาคารแห่งประเทศจีน จำกัด=BOC    ธนาคารอิสลามแห่งประเทศไทย=ISBT    ธนาคารทิสโก้ จำกัด (มหาชน)=TSCO    ธนาคารเกียรตินาคินภัทร จำกัด (มหาชน)=KKP    ธนาคารไอซีบีซี (ไทย) จำกัด (มหาชน)=ICBC    ธนาคารไทยเครดิต จำกัด (มหาชน)=TCRB    ธนาคารแลนด์ แอนด์ เฮ้าส์ จำกัด (มหาชน)=LHB    ธนาคารซูมิโตโม มิตซุย ทรัสต์ (ไทย) จำกัด (มหาชน)=SMTB    ธนาคารพัฒนาวิสาหกิจขนาดกลางและขนาดย่อมแห่งประเทศไทย=SME
    ${bank_name_dict} =    Create Dictionary    BBL=ธนาคารกรุงเทพ จำกัด (มหาชน)     KBNK=ธนาคารกสิกรไทย จำกัด (มหาชน)    KTB=ธนาคารกรุงไทย จำกัด (มหาชน)    JPMC=ธนาคาร เจพีมอร์แกน เชส    OCBC=ธนาคาร โอเวอร์ซี-ไชนีสแบงกิ้งคอร์ปอเรชั่น จํากัด    TTB=ธนาคารทหารไทยธนชาต จำกัด (มหาชน)     SCB=ธนาคารไทยพาณิชย์ จำกัด (มหาชน)     CITI=ธนาคารซิตี้แบงก์     SMBC=ธนาคารซูมิโตโม มิตซุย แบงกิ้ง คอร์ปอเรชั่น     SCBT=ธนาคารสแตนดาร์ดชาร์เตอร์ด(ไทย) จำกัด (มหาชน)     CMBT=ธนาคาร ซีไอเอ็มบี ไทย จำกัด (มหาชน)     RHB=ธนาคาร อาร์ เอช บี จำกัด     UOBT=ธนาคารยูโอบี จำกัด (มหาชน)     BAY=ธนาคารกรุงศรีอยุธยา จำกัด (มหาชน)     MEGA=ธนาคารเมกะ สากลพาณิชย์ จำกัด (มหาชน)     BOA=ธนาคารแห่งอเมริกา เนชั่นแนล แอสโซซิเอชั่น     IOB=ธนาคารอินเดียนโอเวอร์ซีส์     GSB=ธนาคารออมสิน     HSBC=ธนาคารฮ่องกงและเซี่ยงไฮ้แบงกิ้ง คอร์ปอเรชั่น จำกัด     DB=ธนาคารดอยซ์แบงก์     GHB=ธนาคารอาคารสงเคราะห์     BAAC=ธนาคารเพื่อการเกษตรและสหกรณ์     EXIM=ธนาคารเพื่อการส่งออกและนำเข้าแห่งประเทศไทย     MHCB=ธนาคารมิซูโฮ จำกัด     BNPP=ธนาคารบีเอ็นพี พารีบาส์     BOC=ธนาคารแห่งประเทศจีน จำกัด     ISBT=ธนาคารอิสลามแห่งประเทศไทย     TSCO=ธนาคารทิสโก้ จำกัด (มหาชน)     KKP=ธนาคารเกียรตินาคินภัทร จำกัด (มหาชน)     ICBC=ธนาคารไอซีบีซี (ไทย) จำกัด (มหาชน)     TCRB=ธนาคารไทยเครดิต จำกัด (มหาชน)     LHB=ธนาคารแลนด์ แอนด์ เฮ้าส์ จำกัด (มหาชน)     SMTB=ธนาคารซูมิโตโม มิตซุย ทรัสต์ (ไทย) จำกัด (มหาชน)     SME=ธนาคารพัฒนาวิสาหกิจขนาดกลางและขนาดย่อมแห่งประเทศไทย
    set test variable   ${bank_dict}
    set test variable   ${bank_name_dict}
    Open Excel Document      filename=${CURDIR}/Mastercase_Template.xlsx   doc_id=docname1
    ${master_case_id}=    create master case id of bank name '${BANK_NAME}'
    set test variable   ${master_case_id}
    Write Excel Cell	3   1    ${master_case_id}    sheet_name=CreateBankCase
    ${polics_date}=    create polics date 'before_create_case'
    ${polics_time}=    create polics time 'random'
    ${polics_case_id}=    create polics case id 'random' total '50' digit
    ${police_section}=    การตรวจพบรายการ คือ 'ผู้เสียหายแจ้งเอง มาตรา 7'
    Write Excel Cell	3   2    ${polics_date}    sheet_name=CreateBankCase
    Write Excel Cell	3   3    ${polics_time}    sheet_name=CreateBankCase
    Write Excel Cell	3   4    ${polics_case_id}    sheet_name=CreateBankCase
    Write Excel Cell	3   5    ${police_section}    sheet_name=CreateBankCase
    set test variable    ${master_file_name}    Mastercase_${master_case_id}
    Save Excel Document      filename=${CURDIR}/${FOLDER}/${master_file_name}.xlsx
    Close Current Excel Document
    set test variable    ${test_case_name}    ${FOLDER}
    Create victim information '${FOLDER}/${master_file_name}' of bank name '${bank_name_dict}[${BANK_NAME}]'
    Create transaction to banks '${HORSE_LIST}' in '${FOLDER}/${master_file_name}' only 3
    Add Master Case via API '${FOLDER}/${master_file_name}' bank name '${BANK_NAME}'




Create Master Case ไม่มีหมายแจ้งความ File '${FOLDER}' from bank name '${BANK_NAME}' to '${HORSE_LIST}'
    ${horse_list_dict} =    Create Dictionary
    set test variable   ${horse_list_dict}
    Create Directory     ${CURDIR}/${FOLDER}
    ${bank_dict} =    Create Dictionary    ธนาคารกรุงเทพ จำกัด (มหาชน)=BBL    ธนาคารกสิกรไทย จำกัด (มหาชน)=KBNK    ธนาคารกรุงไทย จำกัด (มหาชน)=KTB    ธนาคาร เจพีมอร์แกน เชส=JPMC    ธนาคาร โอเวอร์ซี-ไชนีสแบงกิ้งคอร์ปอเรชั่น จํากัด=OCBC    ธนาคารทหารไทยธนชาต จำกัด (มหาชน)=TTB    ธนาคารไทยพาณิชย์ จำกัด (มหาชน)=SCB    ธนาคารซิตี้แบงก์=CITI    ธนาคารซูมิโตโม มิตซุย แบงกิ้ง คอร์ปอเรชั่น=SMBC    ธนาคารสแตนดาร์ดชาร์เตอร์ด(ไทย) จำกัด (มหาชน)=SCBT    ธนาคาร ซีไอเอ็มบี ไทย จำกัด (มหาชน)=CMBT    ธนาคาร อาร์ เอช บี จำกัด=RHB    ธนาคารยูโอบี จำกัด (มหาชน)=UOBT    ธนาคารกรุงศรีอยุธยา จำกัด (มหาชน)=BAY    ธนาคารเมกะ สากลพาณิชย์ จำกัด (มหาชน)=MEGA    ธนาคารแห่งอเมริกา เนชั่นแนล แอสโซซิเอชั่น=BOA    ธนาคารอินเดียนโอเวอร์ซีส์=IOB    ธนาคารออมสิน=GSB    ธนาคารฮ่องกงและเซี่ยงไฮ้แบงกิ้ง คอร์ปอเรชั่น จำกัด=HSBC    ธนาคารดอยซ์แบงก์=DB    ธนาคารอาคารสงเคราะห์=GHB    ธนาคารเพื่อการเกษตรและสหกรณ์=BAAC    ธนาคารเพื่อการส่งออกและนำเข้าแห่งประเทศไทย=EXIM    ธนาคารมิซูโฮ จำกัด=MHCB    ธนาคารบีเอ็นพี พารีบาส์=BNPP    ธนาคารแห่งประเทศจีน จำกัด=BOC    ธนาคารอิสลามแห่งประเทศไทย=ISBT    ธนาคารทิสโก้ จำกัด (มหาชน)=TSCO    ธนาคารเกียรตินาคินภัทร จำกัด (มหาชน)=KKP    ธนาคารไอซีบีซี (ไทย) จำกัด (มหาชน)=ICBC    ธนาคารไทยเครดิต จำกัด (มหาชน)=TCRB    ธนาคารแลนด์ แอนด์ เฮ้าส์ จำกัด (มหาชน)=LHB    ธนาคารซูมิโตโม มิตซุย ทรัสต์ (ไทย) จำกัด (มหาชน)=SMTB    ธนาคารพัฒนาวิสาหกิจขนาดกลางและขนาดย่อมแห่งประเทศไทย=SME
    ${bank_name_dict} =    Create Dictionary    BBL=ธนาคารกรุงเทพ จำกัด (มหาชน)     KBNK=ธนาคารกสิกรไทย จำกัด (มหาชน)    KTB=ธนาคารกรุงไทย จำกัด (มหาชน)    JPMC=ธนาคาร เจพีมอร์แกน เชส    OCBC=ธนาคาร โอเวอร์ซี-ไชนีสแบงกิ้งคอร์ปอเรชั่น จํากัด    TTB=ธนาคารทหารไทยธนชาต จำกัด (มหาชน)     SCB=ธนาคารไทยพาณิชย์ จำกัด (มหาชน)     CITI=ธนาคารซิตี้แบงก์     SMBC=ธนาคารซูมิโตโม มิตซุย แบงกิ้ง คอร์ปอเรชั่น     SCBT=ธนาคารสแตนดาร์ดชาร์เตอร์ด(ไทย) จำกัด (มหาชน)     CMBT=ธนาคาร ซีไอเอ็มบี ไทย จำกัด (มหาชน)     RHB=ธนาคาร อาร์ เอช บี จำกัด     UOBT=ธนาคารยูโอบี จำกัด (มหาชน)     BAY=ธนาคารกรุงศรีอยุธยา จำกัด (มหาชน)     MEGA=ธนาคารเมกะ สากลพาณิชย์ จำกัด (มหาชน)     BOA=ธนาคารแห่งอเมริกา เนชั่นแนล แอสโซซิเอชั่น     IOB=ธนาคารอินเดียนโอเวอร์ซีส์     GSB=ธนาคารออมสิน     HSBC=ธนาคารฮ่องกงและเซี่ยงไฮ้แบงกิ้ง คอร์ปอเรชั่น จำกัด     DB=ธนาคารดอยซ์แบงก์     GHB=ธนาคารอาคารสงเคราะห์     BAAC=ธนาคารเพื่อการเกษตรและสหกรณ์     EXIM=ธนาคารเพื่อการส่งออกและนำเข้าแห่งประเทศไทย     MHCB=ธนาคารมิซูโฮ จำกัด     BNPP=ธนาคารบีเอ็นพี พารีบาส์     BOC=ธนาคารแห่งประเทศจีน จำกัด     ISBT=ธนาคารอิสลามแห่งประเทศไทย     TSCO=ธนาคารทิสโก้ จำกัด (มหาชน)     KKP=ธนาคารเกียรตินาคินภัทร จำกัด (มหาชน)     ICBC=ธนาคารไอซีบีซี (ไทย) จำกัด (มหาชน)     TCRB=ธนาคารไทยเครดิต จำกัด (มหาชน)     LHB=ธนาคารแลนด์ แอนด์ เฮ้าส์ จำกัด (มหาชน)     SMTB=ธนาคารซูมิโตโม มิตซุย ทรัสต์ (ไทย) จำกัด (มหาชน)     SME=ธนาคารพัฒนาวิสาหกิจขนาดกลางและขนาดย่อมแห่งประเทศไทย
    set test variable   ${bank_dict}
    set test variable   ${bank_name_dict}
    Open Excel Document      filename=${CURDIR}/Mastercase_Template.xlsx   doc_id=docname1
    ${master_case_id}=    create master case id of bank name '${BANK_NAME}'
    set test variable   ${master_case_id}
    Write Excel Cell	3   1    ${master_case_id}    sheet_name=CreateBankCase
    ${police_section}=    การตรวจพบรายการ คือ 'ผู้เสียหายแจ้งเอง มาตรา 7'
    Write Excel Cell	3   5    ${police_section}    sheet_name=CreateBankCase
    set test variable    ${master_file_name}    Mastercase_${master_case_id}
    Save Excel Document      filename=${CURDIR}/${FOLDER}/${master_file_name}.xlsx
    Close Current Excel Document
    set test variable    ${test_case_name}    ${FOLDER}
    Create victim information '${FOLDER}/${master_file_name}' of bank name '${bank_name_dict}[${BANK_NAME}]'
    Create transaction to banks '${HORSE_LIST}' in '${FOLDER}/${master_file_name}'
    Add Master Case via API '${FOLDER}/${master_file_name}' bank name '${BANK_NAME}'

Create Master Case File '${FOLDER}' from bank name '${BANK_NAME}' to นิติบุคคล '${HORSE_LIST}'
    ${horse_list_dict} =    Create Dictionary
    set test variable   ${horse_list_dict}
    Create Directory     ${CURDIR}/${FOLDER}
    ${bank_dict} =    Create Dictionary    ธนาคารกรุงเทพ จำกัด (มหาชน)=BBL    ธนาคารกสิกรไทย จำกัด (มหาชน)=KBNK    ธนาคารกรุงไทย จำกัด (มหาชน)=KTB    ธนาคาร เจพีมอร์แกน เชส=JPMC    ธนาคาร โอเวอร์ซี-ไชนีสแบงกิ้งคอร์ปอเรชั่น จํากัด=OCBC    ธนาคารทหารไทยธนชาต จำกัด (มหาชน)=TTB    ธนาคารไทยพาณิชย์ จำกัด (มหาชน)=SCB    ธนาคารซิตี้แบงก์=CITI    ธนาคารซูมิโตโม มิตซุย แบงกิ้ง คอร์ปอเรชั่น=SMBC    ธนาคารสแตนดาร์ดชาร์เตอร์ด(ไทย) จำกัด (มหาชน)=SCBT    ธนาคาร ซีไอเอ็มบี ไทย จำกัด (มหาชน)=CMBT    ธนาคาร อาร์ เอช บี จำกัด=RHB    ธนาคารยูโอบี จำกัด (มหาชน)=UOBT    ธนาคารกรุงศรีอยุธยา จำกัด (มหาชน)=BAY    ธนาคารเมกะ สากลพาณิชย์ จำกัด (มหาชน)=MEGA    ธนาคารแห่งอเมริกา เนชั่นแนล แอสโซซิเอชั่น=BOA    ธนาคารอินเดียนโอเวอร์ซีส์=IOB    ธนาคารออมสิน=GSB    ธนาคารฮ่องกงและเซี่ยงไฮ้แบงกิ้ง คอร์ปอเรชั่น จำกัด=HSBC    ธนาคารดอยซ์แบงก์=DB    ธนาคารอาคารสงเคราะห์=GHB    ธนาคารเพื่อการเกษตรและสหกรณ์=BAAC    ธนาคารเพื่อการส่งออกและนำเข้าแห่งประเทศไทย=EXIM    ธนาคารมิซูโฮ จำกัด=MHCB    ธนาคารบีเอ็นพี พารีบาส์=BNPP    ธนาคารแห่งประเทศจีน จำกัด=BOC    ธนาคารอิสลามแห่งประเทศไทย=ISBT    ธนาคารทิสโก้ จำกัด (มหาชน)=TSCO    ธนาคารเกียรตินาคินภัทร จำกัด (มหาชน)=KKP    ธนาคารไอซีบีซี (ไทย) จำกัด (มหาชน)=ICBC    ธนาคารไทยเครดิต จำกัด (มหาชน)=TCRB    ธนาคารแลนด์ แอนด์ เฮ้าส์ จำกัด (มหาชน)=LHB    ธนาคารซูมิโตโม มิตซุย ทรัสต์ (ไทย) จำกัด (มหาชน)=SMTB    ธนาคารพัฒนาวิสาหกิจขนาดกลางและขนาดย่อมแห่งประเทศไทย=SME
    ${bank_name_dict} =    Create Dictionary    BBL=ธนาคารกรุงเทพ จำกัด (มหาชน)     KBNK=ธนาคารกสิกรไทย จำกัด (มหาชน)    KTB=ธนาคารกรุงไทย จำกัด (มหาชน)    JPMC=ธนาคาร เจพีมอร์แกน เชส    OCBC=ธนาคาร โอเวอร์ซี-ไชนีสแบงกิ้งคอร์ปอเรชั่น จํากัด    TTB=ธนาคารทหารไทยธนชาต จำกัด (มหาชน)     SCB=ธนาคารไทยพาณิชย์ จำกัด (มหาชน)     CITI=ธนาคารซิตี้แบงก์     SMBC=ธนาคารซูมิโตโม มิตซุย แบงกิ้ง คอร์ปอเรชั่น     SCBT=ธนาคารสแตนดาร์ดชาร์เตอร์ด(ไทย) จำกัด (มหาชน)     CMBT=ธนาคาร ซีไอเอ็มบี ไทย จำกัด (มหาชน)     RHB=ธนาคาร อาร์ เอช บี จำกัด     UOBT=ธนาคารยูโอบี จำกัด (มหาชน)     BAY=ธนาคารกรุงศรีอยุธยา จำกัด (มหาชน)     MEGA=ธนาคารเมกะ สากลพาณิชย์ จำกัด (มหาชน)     BOA=ธนาคารแห่งอเมริกา เนชั่นแนล แอสโซซิเอชั่น     IOB=ธนาคารอินเดียนโอเวอร์ซีส์     GSB=ธนาคารออมสิน     HSBC=ธนาคารฮ่องกงและเซี่ยงไฮ้แบงกิ้ง คอร์ปอเรชั่น จำกัด     DB=ธนาคารดอยซ์แบงก์     GHB=ธนาคารอาคารสงเคราะห์     BAAC=ธนาคารเพื่อการเกษตรและสหกรณ์     EXIM=ธนาคารเพื่อการส่งออกและนำเข้าแห่งประเทศไทย     MHCB=ธนาคารมิซูโฮ จำกัด     BNPP=ธนาคารบีเอ็นพี พารีบาส์     BOC=ธนาคารแห่งประเทศจีน จำกัด     ISBT=ธนาคารอิสลามแห่งประเทศไทย     TSCO=ธนาคารทิสโก้ จำกัด (มหาชน)     KKP=ธนาคารเกียรตินาคินภัทร จำกัด (มหาชน)     ICBC=ธนาคารไอซีบีซี (ไทย) จำกัด (มหาชน)     TCRB=ธนาคารไทยเครดิต จำกัด (มหาชน)     LHB=ธนาคารแลนด์ แอนด์ เฮ้าส์ จำกัด (มหาชน)     SMTB=ธนาคารซูมิโตโม มิตซุย ทรัสต์ (ไทย) จำกัด (มหาชน)     SME=ธนาคารพัฒนาวิสาหกิจขนาดกลางและขนาดย่อมแห่งประเทศไทย
    set test variable   ${bank_dict}
    set test variable   ${bank_name_dict}
    Open Excel Document      filename=${CURDIR}/Mastercase_Template.xlsx   doc_id=docname1
    ${master_case_id}=    create master case id of bank name '${BANK_NAME}'
    set test variable   ${master_case_id}
    Write Excel Cell	3   1    ${master_case_id}    sheet_name=CreateBankCase
    ${polics_date}=    create polics date 'before_create_case'
    ${polics_time}=    create polics time 'random'
    ${polics_case_id}=    create polics case id 'random' total '50' digit
    ${police_section}=    การตรวจพบรายการ คือ 'ผู้เสียหายแจ้งเอง มาตรา 7'
    Write Excel Cell	3   2    ${polics_date}    sheet_name=CreateBankCase
    Write Excel Cell	3   3    ${polics_time}    sheet_name=CreateBankCase
    Write Excel Cell	3   4    ${polics_case_id}    sheet_name=CreateBankCase
    Write Excel Cell	3   5    ${police_section}    sheet_name=CreateBankCase
    set test variable    ${master_file_name}    Mastercase_${master_case_id}
    Save Excel Document      filename=${CURDIR}/${FOLDER}/${master_file_name}.xlsx
    Close Current Excel Document
    set test variable    ${test_case_name}    ${FOLDER}
    Create victim information '${FOLDER}/${master_file_name}' of bank name '${bank_name_dict}[${BANK_NAME}]'
    Create transaction to banks นิติบุคคล '${HORSE_LIST}' in '${FOLDER}/${master_file_name}'
    Add Master Case via API '${FOLDER}/${master_file_name}' bank name '${BANK_NAME}'

Create Master Case File '${FOLDER}' from bank name '${BANK_NAME}' to '${HORSE_LIST}' ชาวต่างชาติ
    ${horse_list_dict} =    Create Dictionary
    set test variable   ${horse_list_dict}
    Create Directory     ${CURDIR}/${FOLDER}
    ${bank_dict} =    Create Dictionary    ธนาคารกรุงเทพ จำกัด (มหาชน)=BBL    ธนาคารกสิกรไทย จำกัด (มหาชน)=KBNK    ธนาคารกรุงไทย จำกัด (มหาชน)=KTB    ธนาคาร เจพีมอร์แกน เชส=JPMC    ธนาคาร โอเวอร์ซี-ไชนีสแบงกิ้งคอร์ปอเรชั่น จํากัด=OCBC    ธนาคารทหารไทยธนชาต จำกัด (มหาชน)=TTB    ธนาคารไทยพาณิชย์ จำกัด (มหาชน)=SCB    ธนาคารซิตี้แบงก์=CITI    ธนาคารซูมิโตโม มิตซุย แบงกิ้ง คอร์ปอเรชั่น=SMBC    ธนาคารสแตนดาร์ดชาร์เตอร์ด(ไทย) จำกัด (มหาชน)=SCBT    ธนาคาร ซีไอเอ็มบี ไทย จำกัด (มหาชน)=CMBT    ธนาคาร อาร์ เอช บี จำกัด=RHB    ธนาคารยูโอบี จำกัด (มหาชน)=UOBT    ธนาคารกรุงศรีอยุธยา จำกัด (มหาชน)=BAY    ธนาคารเมกะ สากลพาณิชย์ จำกัด (มหาชน)=MEGA    ธนาคารแห่งอเมริกา เนชั่นแนล แอสโซซิเอชั่น=BOA    ธนาคารอินเดียนโอเวอร์ซีส์=IOB    ธนาคารออมสิน=GSB    ธนาคารฮ่องกงและเซี่ยงไฮ้แบงกิ้ง คอร์ปอเรชั่น จำกัด=HSBC    ธนาคารดอยซ์แบงก์=DB    ธนาคารอาคารสงเคราะห์=GHB    ธนาคารเพื่อการเกษตรและสหกรณ์=BAAC    ธนาคารเพื่อการส่งออกและนำเข้าแห่งประเทศไทย=EXIM    ธนาคารมิซูโฮ จำกัด=MHCB    ธนาคารบีเอ็นพี พารีบาส์=BNPP    ธนาคารแห่งประเทศจีน จำกัด=BOC    ธนาคารอิสลามแห่งประเทศไทย=ISBT    ธนาคารทิสโก้ จำกัด (มหาชน)=TSCO    ธนาคารเกียรตินาคินภัทร จำกัด (มหาชน)=KKP    ธนาคารไอซีบีซี (ไทย) จำกัด (มหาชน)=ICBC    ธนาคารไทยเครดิต จำกัด (มหาชน)=TCRB    ธนาคารแลนด์ แอนด์ เฮ้าส์ จำกัด (มหาชน)=LHB    ธนาคารซูมิโตโม มิตซุย ทรัสต์ (ไทย) จำกัด (มหาชน)=SMTB    ธนาคารพัฒนาวิสาหกิจขนาดกลางและขนาดย่อมแห่งประเทศไทย=SME
    ${bank_name_dict} =    Create Dictionary    BBL=ธนาคารกรุงเทพ จำกัด (มหาชน)     KBNK=ธนาคารกสิกรไทย จำกัด (มหาชน)    KTB=ธนาคารกรุงไทย จำกัด (มหาชน)    JPMC=ธนาคาร เจพีมอร์แกน เชส    OCBC=ธนาคาร โอเวอร์ซี-ไชนีสแบงกิ้งคอร์ปอเรชั่น จํากัด    TTB=ธนาคารทหารไทยธนชาต จำกัด (มหาชน)     SCB=ธนาคารไทยพาณิชย์ จำกัด (มหาชน)     CITI=ธนาคารซิตี้แบงก์     SMBC=ธนาคารซูมิโตโม มิตซุย แบงกิ้ง คอร์ปอเรชั่น     SCBT=ธนาคารสแตนดาร์ดชาร์เตอร์ด(ไทย) จำกัด (มหาชน)     CMBT=ธนาคาร ซีไอเอ็มบี ไทย จำกัด (มหาชน)     RHB=ธนาคาร อาร์ เอช บี จำกัด     UOBT=ธนาคารยูโอบี จำกัด (มหาชน)     BAY=ธนาคารกรุงศรีอยุธยา จำกัด (มหาชน)     MEGA=ธนาคารเมกะ สากลพาณิชย์ จำกัด (มหาชน)     BOA=ธนาคารแห่งอเมริกา เนชั่นแนล แอสโซซิเอชั่น     IOB=ธนาคารอินเดียนโอเวอร์ซีส์     GSB=ธนาคารออมสิน     HSBC=ธนาคารฮ่องกงและเซี่ยงไฮ้แบงกิ้ง คอร์ปอเรชั่น จำกัด     DB=ธนาคารดอยซ์แบงก์     GHB=ธนาคารอาคารสงเคราะห์     BAAC=ธนาคารเพื่อการเกษตรและสหกรณ์     EXIM=ธนาคารเพื่อการส่งออกและนำเข้าแห่งประเทศไทย     MHCB=ธนาคารมิซูโฮ จำกัด     BNPP=ธนาคารบีเอ็นพี พารีบาส์     BOC=ธนาคารแห่งประเทศจีน จำกัด     ISBT=ธนาคารอิสลามแห่งประเทศไทย     TSCO=ธนาคารทิสโก้ จำกัด (มหาชน)     KKP=ธนาคารเกียรตินาคินภัทร จำกัด (มหาชน)     ICBC=ธนาคารไอซีบีซี (ไทย) จำกัด (มหาชน)     TCRB=ธนาคารไทยเครดิต จำกัด (มหาชน)     LHB=ธนาคารแลนด์ แอนด์ เฮ้าส์ จำกัด (มหาชน)     SMTB=ธนาคารซูมิโตโม มิตซุย ทรัสต์ (ไทย) จำกัด (มหาชน)     SME=ธนาคารพัฒนาวิสาหกิจขนาดกลางและขนาดย่อมแห่งประเทศไทย
    set test variable   ${bank_dict}
    set test variable   ${bank_name_dict}
    Open Excel Document      filename=${CURDIR}/Mastercase_Template.xlsx   doc_id=docname1
    ${master_case_id}=    create master case id of bank name '${BANK_NAME}'
    set test variable   ${master_case_id}
    Write Excel Cell	3   1    ${master_case_id}    sheet_name=CreateBankCase
    ${polics_date}=    create polics date 'before_create_case'
    ${polics_time}=    create polics time 'random'
    ${polics_case_id}=    create polics case id 'random' total '50' digit
    ${police_section}=    การตรวจพบรายการ คือ 'ผู้เสียหายแจ้งเอง มาตรา 7'
    Write Excel Cell	3   2    ${polics_date}    sheet_name=CreateBankCase
    Write Excel Cell	3   3    ${polics_time}    sheet_name=CreateBankCase
    Write Excel Cell	3   4    ${polics_case_id}    sheet_name=CreateBankCase
    Write Excel Cell	3   5    ${police_section}    sheet_name=CreateBankCase
    set test variable    ${master_file_name}    Mastercase_${master_case_id}
    Save Excel Document      filename=${CURDIR}/${FOLDER}/${master_file_name}.xlsx
    set test variable    ${test_case_name}    ${FOLDER}
    Close Current Excel Document
    Create victim information '${FOLDER}/${master_file_name}' of bank name '${bank_name_dict}[${BANK_NAME}]'
    Create transaction to banks '${HORSE_LIST}' in '${FOLDER}/${master_file_name}' ชาวต่างชาติ
    Add Master Case via API '${FOLDER}/${master_file_name}' bank name '${BANK_NAME}'

Create Master Case File บุคคลเก่าและบัญชีใหม่ ยังไม่เคยออกรายงาน บุคคลคนเดียวกันเปลี่ยนชื่อ '${FOLDER}' from bank name '${BANK_NAME}' to '${HORSE_LIST}'
    Create Directory     ${CURDIR}/${FOLDER}
    ${bank_dict} =    Create Dictionary    ธนาคารกรุงเทพ จำกัด (มหาชน)=BBL    ธนาคารกสิกรไทย จำกัด (มหาชน)=KBNK    ธนาคารกรุงไทย จำกัด (มหาชน)=KTB    ธนาคาร เจพีมอร์แกน เชส=JPMC    ธนาคาร โอเวอร์ซี-ไชนีสแบงกิ้งคอร์ปอเรชั่น จํากัด=OCBC    ธนาคารทหารไทยธนชาต จำกัด (มหาชน)=TTB    ธนาคารไทยพาณิชย์ จำกัด (มหาชน)=SCB    ธนาคารซิตี้แบงก์=CITI    ธนาคารซูมิโตโม มิตซุย แบงกิ้ง คอร์ปอเรชั่น=SMBC    ธนาคารสแตนดาร์ดชาร์เตอร์ด(ไทย) จำกัด (มหาชน)=SCBT    ธนาคาร ซีไอเอ็มบี ไทย จำกัด (มหาชน)=CMBT    ธนาคาร อาร์ เอช บี จำกัด=RHB    ธนาคารยูโอบี จำกัด (มหาชน)=UOBT    ธนาคารกรุงศรีอยุธยา จำกัด (มหาชน)=BAY    ธนาคารเมกะ สากลพาณิชย์ จำกัด (มหาชน)=MEGA    ธนาคารแห่งอเมริกา เนชั่นแนล แอสโซซิเอชั่น=BOA    ธนาคารอินเดียนโอเวอร์ซีส์=IOB    ธนาคารออมสิน=GSB    ธนาคารฮ่องกงและเซี่ยงไฮ้แบงกิ้ง คอร์ปอเรชั่น จำกัด=HSBC    ธนาคารดอยซ์แบงก์=DB    ธนาคารอาคารสงเคราะห์=GHB    ธนาคารเพื่อการเกษตรและสหกรณ์=BAAC    ธนาคารเพื่อการส่งออกและนำเข้าแห่งประเทศไทย=EXIM    ธนาคารมิซูโฮ จำกัด=MHCB    ธนาคารบีเอ็นพี พารีบาส์=BNPP    ธนาคารแห่งประเทศจีน จำกัด=BOC    ธนาคารอิสลามแห่งประเทศไทย=ISBT    ธนาคารทิสโก้ จำกัด (มหาชน)=TSCO    ธนาคารเกียรตินาคินภัทร จำกัด (มหาชน)=KKP    ธนาคารไอซีบีซี (ไทย) จำกัด (มหาชน)=ICBC    ธนาคารไทยเครดิต จำกัด (มหาชน)=TCRB    ธนาคารแลนด์ แอนด์ เฮ้าส์ จำกัด (มหาชน)=LHB    ธนาคารซูมิโตโม มิตซุย ทรัสต์ (ไทย) จำกัด (มหาชน)=SMTB    ธนาคารพัฒนาวิสาหกิจขนาดกลางและขนาดย่อมแห่งประเทศไทย=SME
    ${bank_name_dict} =    Create Dictionary    BBL=ธนาคารกรุงเทพ จำกัด (มหาชน)     KBNK=ธนาคารกสิกรไทย จำกัด (มหาชน)    KTB=ธนาคารกรุงไทย จำกัด (มหาชน)    JPMC=ธนาคาร เจพีมอร์แกน เชส    OCBC=ธนาคาร โอเวอร์ซี-ไชนีสแบงกิ้งคอร์ปอเรชั่น จํากัด    TTB=ธนาคารทหารไทยธนชาต จำกัด (มหาชน)     SCB=ธนาคารไทยพาณิชย์ จำกัด (มหาชน)     CITI=ธนาคารซิตี้แบงก์     SMBC=ธนาคารซูมิโตโม มิตซุย แบงกิ้ง คอร์ปอเรชั่น     SCBT=ธนาคารสแตนดาร์ดชาร์เตอร์ด(ไทย) จำกัด (มหาชน)     CMBT=ธนาคาร ซีไอเอ็มบี ไทย จำกัด (มหาชน)     RHB=ธนาคาร อาร์ เอช บี จำกัด     UOBT=ธนาคารยูโอบี จำกัด (มหาชน)     BAY=ธนาคารกรุงศรีอยุธยา จำกัด (มหาชน)     MEGA=ธนาคารเมกะ สากลพาณิชย์ จำกัด (มหาชน)     BOA=ธนาคารแห่งอเมริกา เนชั่นแนล แอสโซซิเอชั่น     IOB=ธนาคารอินเดียนโอเวอร์ซีส์     GSB=ธนาคารออมสิน     HSBC=ธนาคารฮ่องกงและเซี่ยงไฮ้แบงกิ้ง คอร์ปอเรชั่น จำกัด     DB=ธนาคารดอยซ์แบงก์     GHB=ธนาคารอาคารสงเคราะห์     BAAC=ธนาคารเพื่อการเกษตรและสหกรณ์     EXIM=ธนาคารเพื่อการส่งออกและนำเข้าแห่งประเทศไทย     MHCB=ธนาคารมิซูโฮ จำกัด     BNPP=ธนาคารบีเอ็นพี พารีบาส์     BOC=ธนาคารแห่งประเทศจีน จำกัด     ISBT=ธนาคารอิสลามแห่งประเทศไทย     TSCO=ธนาคารทิสโก้ จำกัด (มหาชน)     KKP=ธนาคารเกียรตินาคินภัทร จำกัด (มหาชน)     ICBC=ธนาคารไอซีบีซี (ไทย) จำกัด (มหาชน)     TCRB=ธนาคารไทยเครดิต จำกัด (มหาชน)     LHB=ธนาคารแลนด์ แอนด์ เฮ้าส์ จำกัด (มหาชน)     SMTB=ธนาคารซูมิโตโม มิตซุย ทรัสต์ (ไทย) จำกัด (มหาชน)     SME=ธนาคารพัฒนาวิสาหกิจขนาดกลางและขนาดย่อมแห่งประเทศไทย
    set test variable   ${bank_dict}
    set test variable   ${bank_name_dict}
    Open Excel Document      filename=${CURDIR}/Mastercase_Template.xlsx   doc_id=docname1
    ${master_case_id}=    create master case id of bank name '${BANK_NAME}'
    set test variable   ${master_case_id}
    Write Excel Cell	3   1    ${master_case_id}    sheet_name=CreateBankCase
    ${polics_date}=    create polics date 'before_create_case'
    ${polics_time}=    create polics time 'random'
    ${polics_case_id}=    create polics case id 'random' total '50' digit
    ${police_section}=    การตรวจพบรายการ คือ 'ผู้เสียหายแจ้งเอง มาตรา 7'
    Write Excel Cell	3   2    ${polics_date}    sheet_name=CreateBankCase
    Write Excel Cell	3   3    ${polics_time}    sheet_name=CreateBankCase
    Write Excel Cell	3   4    ${polics_case_id}    sheet_name=CreateBankCase
    Write Excel Cell	3   5    ${police_section}    sheet_name=CreateBankCase
    set test variable    ${master_file_name}    Mastercase_${master_case_id}
    Save Excel Document      filename=${CURDIR}/${FOLDER}/${master_file_name}.xlsx
    Close Current Excel Document
    set test variable    ${test_case_name}    ${FOLDER}
    Create victim information '${FOLDER}/${master_file_name}' of bank name '${bank_name_dict}[${BANK_NAME}]'
    Create transaction to banks บุคคลเก่าและบัญชีใหม่ ยังไม่เคยออกรายงาน บุคคลคนเดียวกันเปลี่ยนชื่อ '${HORSE_LIST}' in '${FOLDER}/${master_file_name}'
    Add Master Case via API '${FOLDER}/${master_file_name}' bank name '${BANK_NAME}'

Create Master Case File บุคคลเก่าและบัญชีเก่าเคยออกรายงาน '${FOLDER}' from bank name '${BANK_NAME}' to '${HORSE_LIST}'
    Create Directory     ${CURDIR}/${FOLDER}
    ${bank_dict} =    Create Dictionary    ธนาคารกรุงเทพ จำกัด (มหาชน)=BBL    ธนาคารกสิกรไทย จำกัด (มหาชน)=KBNK    ธนาคารกรุงไทย จำกัด (มหาชน)=KTB    ธนาคาร เจพีมอร์แกน เชส=JPMC    ธนาคาร โอเวอร์ซี-ไชนีสแบงกิ้งคอร์ปอเรชั่น จํากัด=OCBC    ธนาคารทหารไทยธนชาต จำกัด (มหาชน)=TTB    ธนาคารไทยพาณิชย์ จำกัด (มหาชน)=SCB    ธนาคารซิตี้แบงก์=CITI    ธนาคารซูมิโตโม มิตซุย แบงกิ้ง คอร์ปอเรชั่น=SMBC    ธนาคารสแตนดาร์ดชาร์เตอร์ด(ไทย) จำกัด (มหาชน)=SCBT    ธนาคาร ซีไอเอ็มบี ไทย จำกัด (มหาชน)=CMBT    ธนาคาร อาร์ เอช บี จำกัด=RHB    ธนาคารยูโอบี จำกัด (มหาชน)=UOBT    ธนาคารกรุงศรีอยุธยา จำกัด (มหาชน)=BAY    ธนาคารเมกะ สากลพาณิชย์ จำกัด (มหาชน)=MEGA    ธนาคารแห่งอเมริกา เนชั่นแนล แอสโซซิเอชั่น=BOA    ธนาคารอินเดียนโอเวอร์ซีส์=IOB    ธนาคารออมสิน=GSB    ธนาคารฮ่องกงและเซี่ยงไฮ้แบงกิ้ง คอร์ปอเรชั่น จำกัด=HSBC    ธนาคารดอยซ์แบงก์=DB    ธนาคารอาคารสงเคราะห์=GHB    ธนาคารเพื่อการเกษตรและสหกรณ์=BAAC    ธนาคารเพื่อการส่งออกและนำเข้าแห่งประเทศไทย=EXIM    ธนาคารมิซูโฮ จำกัด=MHCB    ธนาคารบีเอ็นพี พารีบาส์=BNPP    ธนาคารแห่งประเทศจีน จำกัด=BOC    ธนาคารอิสลามแห่งประเทศไทย=ISBT    ธนาคารทิสโก้ จำกัด (มหาชน)=TSCO    ธนาคารเกียรตินาคินภัทร จำกัด (มหาชน)=KKP    ธนาคารไอซีบีซี (ไทย) จำกัด (มหาชน)=ICBC    ธนาคารไทยเครดิต จำกัด (มหาชน)=TCRB    ธนาคารแลนด์ แอนด์ เฮ้าส์ จำกัด (มหาชน)=LHB    ธนาคารซูมิโตโม มิตซุย ทรัสต์ (ไทย) จำกัด (มหาชน)=SMTB    ธนาคารพัฒนาวิสาหกิจขนาดกลางและขนาดย่อมแห่งประเทศไทย=SME
    ${bank_name_dict} =    Create Dictionary    BBL=ธนาคารกรุงเทพ จำกัด (มหาชน)     KBNK=ธนาคารกสิกรไทย จำกัด (มหาชน)    KTB=ธนาคารกรุงไทย จำกัด (มหาชน)    JPMC=ธนาคาร เจพีมอร์แกน เชส    OCBC=ธนาคาร โอเวอร์ซี-ไชนีสแบงกิ้งคอร์ปอเรชั่น จํากัด    TTB=ธนาคารทหารไทยธนชาต จำกัด (มหาชน)     SCB=ธนาคารไทยพาณิชย์ จำกัด (มหาชน)     CITI=ธนาคารซิตี้แบงก์     SMBC=ธนาคารซูมิโตโม มิตซุย แบงกิ้ง คอร์ปอเรชั่น     SCBT=ธนาคารสแตนดาร์ดชาร์เตอร์ด(ไทย) จำกัด (มหาชน)     CMBT=ธนาคาร ซีไอเอ็มบี ไทย จำกัด (มหาชน)     RHB=ธนาคาร อาร์ เอช บี จำกัด     UOBT=ธนาคารยูโอบี จำกัด (มหาชน)     BAY=ธนาคารกรุงศรีอยุธยา จำกัด (มหาชน)     MEGA=ธนาคารเมกะ สากลพาณิชย์ จำกัด (มหาชน)     BOA=ธนาคารแห่งอเมริกา เนชั่นแนล แอสโซซิเอชั่น     IOB=ธนาคารอินเดียนโอเวอร์ซีส์     GSB=ธนาคารออมสิน     HSBC=ธนาคารฮ่องกงและเซี่ยงไฮ้แบงกิ้ง คอร์ปอเรชั่น จำกัด     DB=ธนาคารดอยซ์แบงก์     GHB=ธนาคารอาคารสงเคราะห์     BAAC=ธนาคารเพื่อการเกษตรและสหกรณ์     EXIM=ธนาคารเพื่อการส่งออกและนำเข้าแห่งประเทศไทย     MHCB=ธนาคารมิซูโฮ จำกัด     BNPP=ธนาคารบีเอ็นพี พารีบาส์     BOC=ธนาคารแห่งประเทศจีน จำกัด     ISBT=ธนาคารอิสลามแห่งประเทศไทย     TSCO=ธนาคารทิสโก้ จำกัด (มหาชน)     KKP=ธนาคารเกียรตินาคินภัทร จำกัด (มหาชน)     ICBC=ธนาคารไอซีบีซี (ไทย) จำกัด (มหาชน)     TCRB=ธนาคารไทยเครดิต จำกัด (มหาชน)     LHB=ธนาคารแลนด์ แอนด์ เฮ้าส์ จำกัด (มหาชน)     SMTB=ธนาคารซูมิโตโม มิตซุย ทรัสต์ (ไทย) จำกัด (มหาชน)     SME=ธนาคารพัฒนาวิสาหกิจขนาดกลางและขนาดย่อมแห่งประเทศไทย
    set test variable   ${bank_dict}
    set test variable   ${bank_name_dict}
    Open Excel Document      filename=${CURDIR}/Mastercase_Template.xlsx   doc_id=docname1
    ${master_case_id}=    create master case id of bank name '${BANK_NAME}'
    set test variable   ${master_case_id}
    Write Excel Cell	3   1    ${master_case_id}    sheet_name=CreateBankCase
    ${polics_date}=    create polics date 'before_create_case'
    ${polics_time}=    create polics time 'random'
    ${polics_case_id}=    create polics case id 'random' total '50' digit
    ${police_section}=    การตรวจพบรายการ คือ 'ผู้เสียหายแจ้งเอง มาตรา 7'
    Write Excel Cell	3   2    ${polics_date}    sheet_name=CreateBankCase
    Write Excel Cell	3   3    ${polics_time}    sheet_name=CreateBankCase
    Write Excel Cell	3   4    ${polics_case_id}    sheet_name=CreateBankCase
    Write Excel Cell	3   5    ${police_section}    sheet_name=CreateBankCase
    set test variable    ${master_file_name}    Mastercase_${master_case_id}
    Save Excel Document      filename=${CURDIR}/${FOLDER}/${master_file_name}.xlsx
    Close Current Excel Document
    Create victim information '${FOLDER}/${master_file_name}' of bank name '${bank_name_dict}[${BANK_NAME}]'
    Create transaction to banks บุคคลเก่าและบัญชีเก่าเคยออกรายงาน '${HORSE_LIST}' in '${FOLDER}/${master_file_name}'
    Add Master Case via API '${FOLDER}/${master_file_name}' bank name '${BANK_NAME}'

Create Master Case File ไปหาบุคคลที่เคยออกรายการ '${FOLDER}' from bank name '${BANK_NAME}' to '${HORSE_LIST}'
    Create Directory     ${CURDIR}/${FOLDER}
    ${bank_dict} =    Create Dictionary    ธนาคารกรุงเทพ จำกัด (มหาชน)=BBL    ธนาคารกสิกรไทย จำกัด (มหาชน)=KBNK    ธนาคารกรุงไทย จำกัด (มหาชน)=KTB    ธนาคาร เจพีมอร์แกน เชส=JPMC    ธนาคาร โอเวอร์ซี-ไชนีสแบงกิ้งคอร์ปอเรชั่น จํากัด=OCBC    ธนาคารทหารไทยธนชาต จำกัด (มหาชน)=TTB    ธนาคารไทยพาณิชย์ จำกัด (มหาชน)=SCB    ธนาคารซิตี้แบงก์=CITI    ธนาคารซูมิโตโม มิตซุย แบงกิ้ง คอร์ปอเรชั่น=SMBC    ธนาคารสแตนดาร์ดชาร์เตอร์ด(ไทย) จำกัด (มหาชน)=SCBT    ธนาคาร ซีไอเอ็มบี ไทย จำกัด (มหาชน)=CMBT    ธนาคาร อาร์ เอช บี จำกัด=RHB    ธนาคารยูโอบี จำกัด (มหาชน)=UOBT    ธนาคารกรุงศรีอยุธยา จำกัด (มหาชน)=BAY    ธนาคารเมกะ สากลพาณิชย์ จำกัด (มหาชน)=MEGA    ธนาคารแห่งอเมริกา เนชั่นแนล แอสโซซิเอชั่น=BOA    ธนาคารอินเดียนโอเวอร์ซีส์=IOB    ธนาคารออมสิน=GSB    ธนาคารฮ่องกงและเซี่ยงไฮ้แบงกิ้ง คอร์ปอเรชั่น จำกัด=HSBC    ธนาคารดอยซ์แบงก์=DB    ธนาคารอาคารสงเคราะห์=GHB    ธนาคารเพื่อการเกษตรและสหกรณ์=BAAC    ธนาคารเพื่อการส่งออกและนำเข้าแห่งประเทศไทย=EXIM    ธนาคารมิซูโฮ จำกัด=MHCB    ธนาคารบีเอ็นพี พารีบาส์=BNPP    ธนาคารแห่งประเทศจีน จำกัด=BOC    ธนาคารอิสลามแห่งประเทศไทย=ISBT    ธนาคารทิสโก้ จำกัด (มหาชน)=TSCO    ธนาคารเกียรตินาคินภัทร จำกัด (มหาชน)=KKP    ธนาคารไอซีบีซี (ไทย) จำกัด (มหาชน)=ICBC    ธนาคารไทยเครดิต จำกัด (มหาชน)=TCRB    ธนาคารแลนด์ แอนด์ เฮ้าส์ จำกัด (มหาชน)=LHB    ธนาคารซูมิโตโม มิตซุย ทรัสต์ (ไทย) จำกัด (มหาชน)=SMTB    ธนาคารพัฒนาวิสาหกิจขนาดกลางและขนาดย่อมแห่งประเทศไทย=SME
    ${bank_name_dict} =    Create Dictionary    BBL=ธนาคารกรุงเทพ จำกัด (มหาชน)     KBNK=ธนาคารกสิกรไทย จำกัด (มหาชน)    KTB=ธนาคารกรุงไทย จำกัด (มหาชน)    JPMC=ธนาคาร เจพีมอร์แกน เชส    OCBC=ธนาคาร โอเวอร์ซี-ไชนีสแบงกิ้งคอร์ปอเรชั่น จํากัด    TTB=ธนาคารทหารไทยธนชาต จำกัด (มหาชน)     SCB=ธนาคารไทยพาณิชย์ จำกัด (มหาชน)     CITI=ธนาคารซิตี้แบงก์     SMBC=ธนาคารซูมิโตโม มิตซุย แบงกิ้ง คอร์ปอเรชั่น     SCBT=ธนาคารสแตนดาร์ดชาร์เตอร์ด(ไทย) จำกัด (มหาชน)     CMBT=ธนาคาร ซีไอเอ็มบี ไทย จำกัด (มหาชน)     RHB=ธนาคาร อาร์ เอช บี จำกัด     UOBT=ธนาคารยูโอบี จำกัด (มหาชน)     BAY=ธนาคารกรุงศรีอยุธยา จำกัด (มหาชน)     MEGA=ธนาคารเมกะ สากลพาณิชย์ จำกัด (มหาชน)     BOA=ธนาคารแห่งอเมริกา เนชั่นแนล แอสโซซิเอชั่น     IOB=ธนาคารอินเดียนโอเวอร์ซีส์     GSB=ธนาคารออมสิน     HSBC=ธนาคารฮ่องกงและเซี่ยงไฮ้แบงกิ้ง คอร์ปอเรชั่น จำกัด     DB=ธนาคารดอยซ์แบงก์     GHB=ธนาคารอาคารสงเคราะห์     BAAC=ธนาคารเพื่อการเกษตรและสหกรณ์     EXIM=ธนาคารเพื่อการส่งออกและนำเข้าแห่งประเทศไทย     MHCB=ธนาคารมิซูโฮ จำกัด     BNPP=ธนาคารบีเอ็นพี พารีบาส์     BOC=ธนาคารแห่งประเทศจีน จำกัด     ISBT=ธนาคารอิสลามแห่งประเทศไทย     TSCO=ธนาคารทิสโก้ จำกัด (มหาชน)     KKP=ธนาคารเกียรตินาคินภัทร จำกัด (มหาชน)     ICBC=ธนาคารไอซีบีซี (ไทย) จำกัด (มหาชน)     TCRB=ธนาคารไทยเครดิต จำกัด (มหาชน)     LHB=ธนาคารแลนด์ แอนด์ เฮ้าส์ จำกัด (มหาชน)     SMTB=ธนาคารซูมิโตโม มิตซุย ทรัสต์ (ไทย) จำกัด (มหาชน)     SME=ธนาคารพัฒนาวิสาหกิจขนาดกลางและขนาดย่อมแห่งประเทศไทย
    set test variable   ${bank_dict}
    set test variable   ${bank_name_dict}
    Open Excel Document      filename=${CURDIR}/Mastercase_Template.xlsx   doc_id=docname1
    ${master_case_id}=    create master case id of bank name '${BANK_NAME}'
    set test variable   ${master_case_id}
    Write Excel Cell	3   1    ${master_case_id}    sheet_name=CreateBankCase
    ${polics_date}=    create polics date 'before_create_case'
    ${polics_time}=    create polics time 'random'
    ${polics_case_id}=    create polics case id 'random' total '50' digit
    ${police_section}=    การตรวจพบรายการ คือ 'ผู้เสียหายแจ้งเอง มาตรา 7'
    Write Excel Cell	3   2    ${polics_date}    sheet_name=CreateBankCase
    Write Excel Cell	3   3    ${polics_time}    sheet_name=CreateBankCase
    Write Excel Cell	3   4    ${polics_case_id}    sheet_name=CreateBankCase
    Write Excel Cell	3   5    ${police_section}    sheet_name=CreateBankCase
    set test variable    ${master_file_name}    Mastercase_${master_case_id}
    Save Excel Document      filename=${CURDIR}/${FOLDER}/${master_file_name}.xlsx
    Close Current Excel Document
    Create victim information '${FOLDER}/${master_file_name}' of bank name '${bank_name_dict}[${BANK_NAME}]'
    Create transaction to banks ทีเคยออกรายการแล้ว '${HORSE_LIST}' in '${FOLDER}/${master_file_name}'
    Add Master Case via API '${FOLDER}/${master_file_name}' bank name '${BANK_NAME}'

Create Master Case File บุคคลเก่าและบัญชีเก่าเคยออกรายงานด้วยเงื่อนไข เงื่อนไข 1 หรือ 2 '${FOLDER}' from bank name '${BANK_NAME}' to '${HORSE_LIST}'
    Create Directory     ${CURDIR}/${FOLDER}
    ${bank_dict} =    Create Dictionary    ธนาคารกรุงเทพ จำกัด (มหาชน)=BBL    ธนาคารกสิกรไทย จำกัด (มหาชน)=KBNK    ธนาคารกรุงไทย จำกัด (มหาชน)=KTB    ธนาคาร เจพีมอร์แกน เชส=JPMC    ธนาคาร โอเวอร์ซี-ไชนีสแบงกิ้งคอร์ปอเรชั่น จํากัด=OCBC    ธนาคารทหารไทยธนชาต จำกัด (มหาชน)=TTB    ธนาคารไทยพาณิชย์ จำกัด (มหาชน)=SCB    ธนาคารซิตี้แบงก์=CITI    ธนาคารซูมิโตโม มิตซุย แบงกิ้ง คอร์ปอเรชั่น=SMBC    ธนาคารสแตนดาร์ดชาร์เตอร์ด(ไทย) จำกัด (มหาชน)=SCBT    ธนาคาร ซีไอเอ็มบี ไทย จำกัด (มหาชน)=CMBT    ธนาคาร อาร์ เอช บี จำกัด=RHB    ธนาคารยูโอบี จำกัด (มหาชน)=UOBT    ธนาคารกรุงศรีอยุธยา จำกัด (มหาชน)=BAY    ธนาคารเมกะ สากลพาณิชย์ จำกัด (มหาชน)=MEGA    ธนาคารแห่งอเมริกา เนชั่นแนล แอสโซซิเอชั่น=BOA    ธนาคารอินเดียนโอเวอร์ซีส์=IOB    ธนาคารออมสิน=GSB    ธนาคารฮ่องกงและเซี่ยงไฮ้แบงกิ้ง คอร์ปอเรชั่น จำกัด=HSBC    ธนาคารดอยซ์แบงก์=DB    ธนาคารอาคารสงเคราะห์=GHB    ธนาคารเพื่อการเกษตรและสหกรณ์=BAAC    ธนาคารเพื่อการส่งออกและนำเข้าแห่งประเทศไทย=EXIM    ธนาคารมิซูโฮ จำกัด=MHCB    ธนาคารบีเอ็นพี พารีบาส์=BNPP    ธนาคารแห่งประเทศจีน จำกัด=BOC    ธนาคารอิสลามแห่งประเทศไทย=ISBT    ธนาคารทิสโก้ จำกัด (มหาชน)=TSCO    ธนาคารเกียรตินาคินภัทร จำกัด (มหาชน)=KKP    ธนาคารไอซีบีซี (ไทย) จำกัด (มหาชน)=ICBC    ธนาคารไทยเครดิต จำกัด (มหาชน)=TCRB    ธนาคารแลนด์ แอนด์ เฮ้าส์ จำกัด (มหาชน)=LHB    ธนาคารซูมิโตโม มิตซุย ทรัสต์ (ไทย) จำกัด (มหาชน)=SMTB    ธนาคารพัฒนาวิสาหกิจขนาดกลางและขนาดย่อมแห่งประเทศไทย=SME
    ${bank_name_dict} =    Create Dictionary    BBL=ธนาคารกรุงเทพ จำกัด (มหาชน)     KBNK=ธนาคารกสิกรไทย จำกัด (มหาชน)    KTB=ธนาคารกรุงไทย จำกัด (มหาชน)    JPMC=ธนาคาร เจพีมอร์แกน เชส    OCBC=ธนาคาร โอเวอร์ซี-ไชนีสแบงกิ้งคอร์ปอเรชั่น จํากัด    TTB=ธนาคารทหารไทยธนชาต จำกัด (มหาชน)     SCB=ธนาคารไทยพาณิชย์ จำกัด (มหาชน)     CITI=ธนาคารซิตี้แบงก์     SMBC=ธนาคารซูมิโตโม มิตซุย แบงกิ้ง คอร์ปอเรชั่น     SCBT=ธนาคารสแตนดาร์ดชาร์เตอร์ด(ไทย) จำกัด (มหาชน)     CMBT=ธนาคาร ซีไอเอ็มบี ไทย จำกัด (มหาชน)     RHB=ธนาคาร อาร์ เอช บี จำกัด     UOBT=ธนาคารยูโอบี จำกัด (มหาชน)     BAY=ธนาคารกรุงศรีอยุธยา จำกัด (มหาชน)     MEGA=ธนาคารเมกะ สากลพาณิชย์ จำกัด (มหาชน)     BOA=ธนาคารแห่งอเมริกา เนชั่นแนล แอสโซซิเอชั่น     IOB=ธนาคารอินเดียนโอเวอร์ซีส์     GSB=ธนาคารออมสิน     HSBC=ธนาคารฮ่องกงและเซี่ยงไฮ้แบงกิ้ง คอร์ปอเรชั่น จำกัด     DB=ธนาคารดอยซ์แบงก์     GHB=ธนาคารอาคารสงเคราะห์     BAAC=ธนาคารเพื่อการเกษตรและสหกรณ์     EXIM=ธนาคารเพื่อการส่งออกและนำเข้าแห่งประเทศไทย     MHCB=ธนาคารมิซูโฮ จำกัด     BNPP=ธนาคารบีเอ็นพี พารีบาส์     BOC=ธนาคารแห่งประเทศจีน จำกัด     ISBT=ธนาคารอิสลามแห่งประเทศไทย     TSCO=ธนาคารทิสโก้ จำกัด (มหาชน)     KKP=ธนาคารเกียรตินาคินภัทร จำกัด (มหาชน)     ICBC=ธนาคารไอซีบีซี (ไทย) จำกัด (มหาชน)     TCRB=ธนาคารไทยเครดิต จำกัด (มหาชน)     LHB=ธนาคารแลนด์ แอนด์ เฮ้าส์ จำกัด (มหาชน)     SMTB=ธนาคารซูมิโตโม มิตซุย ทรัสต์ (ไทย) จำกัด (มหาชน)     SME=ธนาคารพัฒนาวิสาหกิจขนาดกลางและขนาดย่อมแห่งประเทศไทย
    set test variable   ${bank_dict}
    set test variable   ${bank_name_dict}
    Open Excel Document      filename=${CURDIR}/Mastercase_Template.xlsx   doc_id=docname1
    ${master_case_id}=    create master case id of bank name '${BANK_NAME}'
    set test variable   ${master_case_id}
    Write Excel Cell	3   1    ${master_case_id}    sheet_name=CreateBankCase
    ${polics_date}=    create polics date 'before_create_case'
    ${polics_time}=    create polics time 'random'
    ${polics_case_id}=    create polics case id 'random' total '50' digit
    ${police_section}=    การตรวจพบรายการ คือ 'ผู้เสียหายแจ้งเอง มาตรา 7'
    Write Excel Cell	3   2    ${polics_date}    sheet_name=CreateBankCase
    Write Excel Cell	3   3    ${polics_time}    sheet_name=CreateBankCase
    Write Excel Cell	3   4    ${polics_case_id}    sheet_name=CreateBankCase
    Write Excel Cell	3   5    ${police_section}    sheet_name=CreateBankCase
    set test variable    ${master_file_name}    Mastercase_${master_case_id}
    Save Excel Document      filename=${CURDIR}/${FOLDER}/${master_file_name}.xlsx
    Close Current Excel Document
    set test variable    ${test_case_name}    ${FOLDER}
    Create victim information '${FOLDER}/${master_file_name}' of bank name '${bank_name_dict}[${BANK_NAME}]'
    Create transaction to banks ทีเคยออกรายการแล้วด้วยบุคคลเก่าและบัญชีเก่า '${HORSE_LIST}' in '${FOLDER}/${master_file_name}'
    Add Master Case via API '${FOLDER}/${master_file_name}' bank name '${BANK_NAME}'

Create Master Case File บุคคลเก่าและบัญชีเก่าเคยออกรายงานด้วยเงื่อนไข เงื่อนไข 1 หรือ 2 บุคคลคนเดียวกันเปลี่ยนชื่อ '${FOLDER}' from bank name '${BANK_NAME}' to '${HORSE_LIST}'
    Create Directory     ${CURDIR}/${FOLDER}
    ${bank_dict} =    Create Dictionary    ธนาคารกรุงเทพ จำกัด (มหาชน)=BBL    ธนาคารกสิกรไทย จำกัด (มหาชน)=KBNK    ธนาคารกรุงไทย จำกัด (มหาชน)=KTB    ธนาคาร เจพีมอร์แกน เชส=JPMC    ธนาคาร โอเวอร์ซี-ไชนีสแบงกิ้งคอร์ปอเรชั่น จํากัด=OCBC    ธนาคารทหารไทยธนชาต จำกัด (มหาชน)=TTB    ธนาคารไทยพาณิชย์ จำกัด (มหาชน)=SCB    ธนาคารซิตี้แบงก์=CITI    ธนาคารซูมิโตโม มิตซุย แบงกิ้ง คอร์ปอเรชั่น=SMBC    ธนาคารสแตนดาร์ดชาร์เตอร์ด(ไทย) จำกัด (มหาชน)=SCBT    ธนาคาร ซีไอเอ็มบี ไทย จำกัด (มหาชน)=CMBT    ธนาคาร อาร์ เอช บี จำกัด=RHB    ธนาคารยูโอบี จำกัด (มหาชน)=UOBT    ธนาคารกรุงศรีอยุธยา จำกัด (มหาชน)=BAY    ธนาคารเมกะ สากลพาณิชย์ จำกัด (มหาชน)=MEGA    ธนาคารแห่งอเมริกา เนชั่นแนล แอสโซซิเอชั่น=BOA    ธนาคารอินเดียนโอเวอร์ซีส์=IOB    ธนาคารออมสิน=GSB    ธนาคารฮ่องกงและเซี่ยงไฮ้แบงกิ้ง คอร์ปอเรชั่น จำกัด=HSBC    ธนาคารดอยซ์แบงก์=DB    ธนาคารอาคารสงเคราะห์=GHB    ธนาคารเพื่อการเกษตรและสหกรณ์=BAAC    ธนาคารเพื่อการส่งออกและนำเข้าแห่งประเทศไทย=EXIM    ธนาคารมิซูโฮ จำกัด=MHCB    ธนาคารบีเอ็นพี พารีบาส์=BNPP    ธนาคารแห่งประเทศจีน จำกัด=BOC    ธนาคารอิสลามแห่งประเทศไทย=ISBT    ธนาคารทิสโก้ จำกัด (มหาชน)=TSCO    ธนาคารเกียรตินาคินภัทร จำกัด (มหาชน)=KKP    ธนาคารไอซีบีซี (ไทย) จำกัด (มหาชน)=ICBC    ธนาคารไทยเครดิต จำกัด (มหาชน)=TCRB    ธนาคารแลนด์ แอนด์ เฮ้าส์ จำกัด (มหาชน)=LHB    ธนาคารซูมิโตโม มิตซุย ทรัสต์ (ไทย) จำกัด (มหาชน)=SMTB    ธนาคารพัฒนาวิสาหกิจขนาดกลางและขนาดย่อมแห่งประเทศไทย=SME
    ${bank_name_dict} =    Create Dictionary    BBL=ธนาคารกรุงเทพ จำกัด (มหาชน)     KBNK=ธนาคารกสิกรไทย จำกัด (มหาชน)    KTB=ธนาคารกรุงไทย จำกัด (มหาชน)    JPMC=ธนาคาร เจพีมอร์แกน เชส    OCBC=ธนาคาร โอเวอร์ซี-ไชนีสแบงกิ้งคอร์ปอเรชั่น จํากัด    TTB=ธนาคารทหารไทยธนชาต จำกัด (มหาชน)     SCB=ธนาคารไทยพาณิชย์ จำกัด (มหาชน)     CITI=ธนาคารซิตี้แบงก์     SMBC=ธนาคารซูมิโตโม มิตซุย แบงกิ้ง คอร์ปอเรชั่น     SCBT=ธนาคารสแตนดาร์ดชาร์เตอร์ด(ไทย) จำกัด (มหาชน)     CMBT=ธนาคาร ซีไอเอ็มบี ไทย จำกัด (มหาชน)     RHB=ธนาคาร อาร์ เอช บี จำกัด     UOBT=ธนาคารยูโอบี จำกัด (มหาชน)     BAY=ธนาคารกรุงศรีอยุธยา จำกัด (มหาชน)     MEGA=ธนาคารเมกะ สากลพาณิชย์ จำกัด (มหาชน)     BOA=ธนาคารแห่งอเมริกา เนชั่นแนล แอสโซซิเอชั่น     IOB=ธนาคารอินเดียนโอเวอร์ซีส์     GSB=ธนาคารออมสิน     HSBC=ธนาคารฮ่องกงและเซี่ยงไฮ้แบงกิ้ง คอร์ปอเรชั่น จำกัด     DB=ธนาคารดอยซ์แบงก์     GHB=ธนาคารอาคารสงเคราะห์     BAAC=ธนาคารเพื่อการเกษตรและสหกรณ์     EXIM=ธนาคารเพื่อการส่งออกและนำเข้าแห่งประเทศไทย     MHCB=ธนาคารมิซูโฮ จำกัด     BNPP=ธนาคารบีเอ็นพี พารีบาส์     BOC=ธนาคารแห่งประเทศจีน จำกัด     ISBT=ธนาคารอิสลามแห่งประเทศไทย     TSCO=ธนาคารทิสโก้ จำกัด (มหาชน)     KKP=ธนาคารเกียรตินาคินภัทร จำกัด (มหาชน)     ICBC=ธนาคารไอซีบีซี (ไทย) จำกัด (มหาชน)     TCRB=ธนาคารไทยเครดิต จำกัด (มหาชน)     LHB=ธนาคารแลนด์ แอนด์ เฮ้าส์ จำกัด (มหาชน)     SMTB=ธนาคารซูมิโตโม มิตซุย ทรัสต์ (ไทย) จำกัด (มหาชน)     SME=ธนาคารพัฒนาวิสาหกิจขนาดกลางและขนาดย่อมแห่งประเทศไทย
    set test variable   ${bank_dict}
    set test variable   ${bank_name_dict}
    Open Excel Document      filename=${CURDIR}/Mastercase_Template.xlsx   doc_id=docname1
    ${master_case_id}=    create master case id of bank name '${BANK_NAME}'
    set test variable   ${master_case_id}
    Write Excel Cell	3   1    ${master_case_id}    sheet_name=CreateBankCase
    ${polics_date}=    create polics date 'before_create_case'
    ${polics_time}=    create polics time 'random'
    ${polics_case_id}=    create polics case id 'random' total '50' digit
    ${police_section}=    การตรวจพบรายการ คือ 'ผู้เสียหายแจ้งเอง มาตรา 7'
    Write Excel Cell	3   2    ${polics_date}    sheet_name=CreateBankCase
    Write Excel Cell	3   3    ${polics_time}    sheet_name=CreateBankCase
    Write Excel Cell	3   4    ${polics_case_id}    sheet_name=CreateBankCase
    Write Excel Cell	3   5    ${police_section}    sheet_name=CreateBankCase
    set test variable    ${master_file_name}    Mastercase_${master_case_id}
    Save Excel Document      filename=${CURDIR}/${FOLDER}/${master_file_name}.xlsx
    Close Current Excel Document
    set test variable    ${test_case_name}    ${FOLDER}
    Create victim information '${FOLDER}/${master_file_name}' of bank name '${bank_name_dict}[${BANK_NAME}]'
    Create transaction to banks ทีเคยออกรายการแล้วด้วยบุคคลเก่าและบัญชีเก่า บุคคลคนเดียวกันเปลี่ยนชื่อ '${HORSE_LIST}' in '${FOLDER}/${master_file_name}'
    Add Master Case via API '${FOLDER}/${master_file_name}' bank name '${BANK_NAME}'

Create Master Case for condition 2 ไปหาบุคคลเก่าและบัญชีใหม่ ยังไม่เคยออกรายงาน File '${FOLDER}' from bank name '${BANK_NAME}' to '${HORSE_LIST}'
    Create Directory     ${CURDIR}/${FOLDER}
    ${bank_dict} =    Create Dictionary    ธนาคารกรุงเทพ จำกัด (มหาชน)=BBL    ธนาคารกสิกรไทย จำกัด (มหาชน)=KBNK    ธนาคารกรุงไทย จำกัด (มหาชน)=KTB    ธนาคาร เจพีมอร์แกน เชส=JPMC    ธนาคาร โอเวอร์ซี-ไชนีสแบงกิ้งคอร์ปอเรชั่น จํากัด=OCBC    ธนาคารทหารไทยธนชาต จำกัด (มหาชน)=TTB    ธนาคารไทยพาณิชย์ จำกัด (มหาชน)=SCB    ธนาคารซิตี้แบงก์=CITI    ธนาคารซูมิโตโม มิตซุย แบงกิ้ง คอร์ปอเรชั่น=SMBC    ธนาคารสแตนดาร์ดชาร์เตอร์ด(ไทย) จำกัด (มหาชน)=SCBT    ธนาคาร ซีไอเอ็มบี ไทย จำกัด (มหาชน)=CMBT    ธนาคาร อาร์ เอช บี จำกัด=RHB    ธนาคารยูโอบี จำกัด (มหาชน)=UOBT    ธนาคารกรุงศรีอยุธยา จำกัด (มหาชน)=BAY    ธนาคารเมกะ สากลพาณิชย์ จำกัด (มหาชน)=MEGA    ธนาคารแห่งอเมริกา เนชั่นแนล แอสโซซิเอชั่น=BOA    ธนาคารอินเดียนโอเวอร์ซีส์=IOB    ธนาคารออมสิน=GSB    ธนาคารฮ่องกงและเซี่ยงไฮ้แบงกิ้ง คอร์ปอเรชั่น จำกัด=HSBC    ธนาคารดอยซ์แบงก์=DB    ธนาคารอาคารสงเคราะห์=GHB    ธนาคารเพื่อการเกษตรและสหกรณ์=BAAC    ธนาคารเพื่อการส่งออกและนำเข้าแห่งประเทศไทย=EXIM    ธนาคารมิซูโฮ จำกัด=MHCB    ธนาคารบีเอ็นพี พารีบาส์=BNPP    ธนาคารแห่งประเทศจีน จำกัด=BOC    ธนาคารอิสลามแห่งประเทศไทย=ISBT    ธนาคารทิสโก้ จำกัด (มหาชน)=TSCO    ธนาคารเกียรตินาคินภัทร จำกัด (มหาชน)=KKP    ธนาคารไอซีบีซี (ไทย) จำกัด (มหาชน)=ICBC    ธนาคารไทยเครดิต จำกัด (มหาชน)=TCRB    ธนาคารแลนด์ แอนด์ เฮ้าส์ จำกัด (มหาชน)=LHB    ธนาคารซูมิโตโม มิตซุย ทรัสต์ (ไทย) จำกัด (มหาชน)=SMTB    ธนาคารพัฒนาวิสาหกิจขนาดกลางและขนาดย่อมแห่งประเทศไทย=SME
    ${bank_name_dict} =    Create Dictionary    BBL=ธนาคารกรุงเทพ จำกัด (มหาชน)     KBNK=ธนาคารกสิกรไทย จำกัด (มหาชน)    KTB=ธนาคารกรุงไทย จำกัด (มหาชน)    JPMC=ธนาคาร เจพีมอร์แกน เชส    OCBC=ธนาคาร โอเวอร์ซี-ไชนีสแบงกิ้งคอร์ปอเรชั่น จํากัด    TTB=ธนาคารทหารไทยธนชาต จำกัด (มหาชน)     SCB=ธนาคารไทยพาณิชย์ จำกัด (มหาชน)     CITI=ธนาคารซิตี้แบงก์     SMBC=ธนาคารซูมิโตโม มิตซุย แบงกิ้ง คอร์ปอเรชั่น     SCBT=ธนาคารสแตนดาร์ดชาร์เตอร์ด(ไทย) จำกัด (มหาชน)     CMBT=ธนาคาร ซีไอเอ็มบี ไทย จำกัด (มหาชน)     RHB=ธนาคาร อาร์ เอช บี จำกัด     UOBT=ธนาคารยูโอบี จำกัด (มหาชน)     BAY=ธนาคารกรุงศรีอยุธยา จำกัด (มหาชน)     MEGA=ธนาคารเมกะ สากลพาณิชย์ จำกัด (มหาชน)     BOA=ธนาคารแห่งอเมริกา เนชั่นแนล แอสโซซิเอชั่น     IOB=ธนาคารอินเดียนโอเวอร์ซีส์     GSB=ธนาคารออมสิน     HSBC=ธนาคารฮ่องกงและเซี่ยงไฮ้แบงกิ้ง คอร์ปอเรชั่น จำกัด     DB=ธนาคารดอยซ์แบงก์     GHB=ธนาคารอาคารสงเคราะห์     BAAC=ธนาคารเพื่อการเกษตรและสหกรณ์     EXIM=ธนาคารเพื่อการส่งออกและนำเข้าแห่งประเทศไทย     MHCB=ธนาคารมิซูโฮ จำกัด     BNPP=ธนาคารบีเอ็นพี พารีบาส์     BOC=ธนาคารแห่งประเทศจีน จำกัด     ISBT=ธนาคารอิสลามแห่งประเทศไทย     TSCO=ธนาคารทิสโก้ จำกัด (มหาชน)     KKP=ธนาคารเกียรตินาคินภัทร จำกัด (มหาชน)     ICBC=ธนาคารไอซีบีซี (ไทย) จำกัด (มหาชน)     TCRB=ธนาคารไทยเครดิต จำกัด (มหาชน)     LHB=ธนาคารแลนด์ แอนด์ เฮ้าส์ จำกัด (มหาชน)     SMTB=ธนาคารซูมิโตโม มิตซุย ทรัสต์ (ไทย) จำกัด (มหาชน)     SME=ธนาคารพัฒนาวิสาหกิจขนาดกลางและขนาดย่อมแห่งประเทศไทย
    set test variable   ${bank_dict}
    set test variable   ${bank_name_dict}
    Open Excel Document      filename=${CURDIR}/Mastercase_Template.xlsx   doc_id=docname1
    ${master_case_id}=    create master case id of bank name '${BANK_NAME}'
    set test variable   ${master_case_id}
    Write Excel Cell	3   1    ${master_case_id}    sheet_name=CreateBankCase
    ${polics_date}=    create polics date 'before_create_case'
    ${polics_time}=    create polics time 'random'
    ${polics_case_id}=    create polics case id 'random' total '50' digit
    ${police_section}=    การตรวจพบรายการ คือ 'ผู้เสียหายแจ้งเอง มาตรา 7'
    Write Excel Cell	3   2    ${polics_date}    sheet_name=CreateBankCase
    Write Excel Cell	3   3    ${polics_time}    sheet_name=CreateBankCase
    Write Excel Cell	3   4    ${polics_case_id}    sheet_name=CreateBankCase
    Write Excel Cell	3   5    ${police_section}    sheet_name=CreateBankCase
    ${police_section}=    การตรวจพบรายการ คือ 'ผู้เสียหายแจ้งเอง มาตรา 7'
    Write Excel Cell	3   5    ${police_section}    sheet_name=CreateBankCase
    set test variable    ${master_file_name}    Mastercase_${master_case_id}
    Save Excel Document      filename=${CURDIR}/${FOLDER}/${master_file_name}.xlsx
    Close Current Excel Document
    set test variable   ${test_case_name}    ${FOLDER}
    Create victim information condition 2 '${FOLDER}/${master_file_name}' of bank name '${bank_name_dict}[${BANK_NAME}]'
    Create transaction to banks ทีเคยออกรายการแล้ว '${HORSE_LIST}' in '${FOLDER}/${master_file_name}'
    Add Master Case via API '${FOLDER}/${master_file_name}' bank name '${BANK_NAME}'

Create Master Case for condition 2 ไปหาบุคคลเก่าและบัญชีเก่าเคยออกรายงานด้วยเงื่อนไข เงื่อนไข 3 หรือ 4 File '${FOLDER}' from bank name '${BANK_NAME}' to '${HORSE_LIST}'
    Create Directory     ${CURDIR}/${FOLDER}
    ${bank_dict} =    Create Dictionary    ธนาคารกรุงเทพ จำกัด (มหาชน)=BBL    ธนาคารกสิกรไทย จำกัด (มหาชน)=KBNK    ธนาคารกรุงไทย จำกัด (มหาชน)=KTB    ธนาคาร เจพีมอร์แกน เชส=JPMC    ธนาคาร โอเวอร์ซี-ไชนีสแบงกิ้งคอร์ปอเรชั่น จํากัด=OCBC    ธนาคารทหารไทยธนชาต จำกัด (มหาชน)=TTB    ธนาคารไทยพาณิชย์ จำกัด (มหาชน)=SCB    ธนาคารซิตี้แบงก์=CITI    ธนาคารซูมิโตโม มิตซุย แบงกิ้ง คอร์ปอเรชั่น=SMBC    ธนาคารสแตนดาร์ดชาร์เตอร์ด(ไทย) จำกัด (มหาชน)=SCBT    ธนาคาร ซีไอเอ็มบี ไทย จำกัด (มหาชน)=CMBT    ธนาคาร อาร์ เอช บี จำกัด=RHB    ธนาคารยูโอบี จำกัด (มหาชน)=UOBT    ธนาคารกรุงศรีอยุธยา จำกัด (มหาชน)=BAY    ธนาคารเมกะ สากลพาณิชย์ จำกัด (มหาชน)=MEGA    ธนาคารแห่งอเมริกา เนชั่นแนล แอสโซซิเอชั่น=BOA    ธนาคารอินเดียนโอเวอร์ซีส์=IOB    ธนาคารออมสิน=GSB    ธนาคารฮ่องกงและเซี่ยงไฮ้แบงกิ้ง คอร์ปอเรชั่น จำกัด=HSBC    ธนาคารดอยซ์แบงก์=DB    ธนาคารอาคารสงเคราะห์=GHB    ธนาคารเพื่อการเกษตรและสหกรณ์=BAAC    ธนาคารเพื่อการส่งออกและนำเข้าแห่งประเทศไทย=EXIM    ธนาคารมิซูโฮ จำกัด=MHCB    ธนาคารบีเอ็นพี พารีบาส์=BNPP    ธนาคารแห่งประเทศจีน จำกัด=BOC    ธนาคารอิสลามแห่งประเทศไทย=ISBT    ธนาคารทิสโก้ จำกัด (มหาชน)=TSCO    ธนาคารเกียรตินาคินภัทร จำกัด (มหาชน)=KKP    ธนาคารไอซีบีซี (ไทย) จำกัด (มหาชน)=ICBC    ธนาคารไทยเครดิต จำกัด (มหาชน)=TCRB    ธนาคารแลนด์ แอนด์ เฮ้าส์ จำกัด (มหาชน)=LHB    ธนาคารซูมิโตโม มิตซุย ทรัสต์ (ไทย) จำกัด (มหาชน)=SMTB    ธนาคารพัฒนาวิสาหกิจขนาดกลางและขนาดย่อมแห่งประเทศไทย=SME
    ${bank_name_dict} =    Create Dictionary    BBL=ธนาคารกรุงเทพ จำกัด (มหาชน)     KBNK=ธนาคารกสิกรไทย จำกัด (มหาชน)    KTB=ธนาคารกรุงไทย จำกัด (มหาชน)    JPMC=ธนาคาร เจพีมอร์แกน เชส    OCBC=ธนาคาร โอเวอร์ซี-ไชนีสแบงกิ้งคอร์ปอเรชั่น จํากัด    TTB=ธนาคารทหารไทยธนชาต จำกัด (มหาชน)     SCB=ธนาคารไทยพาณิชย์ จำกัด (มหาชน)     CITI=ธนาคารซิตี้แบงก์     SMBC=ธนาคารซูมิโตโม มิตซุย แบงกิ้ง คอร์ปอเรชั่น     SCBT=ธนาคารสแตนดาร์ดชาร์เตอร์ด(ไทย) จำกัด (มหาชน)     CMBT=ธนาคาร ซีไอเอ็มบี ไทย จำกัด (มหาชน)     RHB=ธนาคาร อาร์ เอช บี จำกัด     UOBT=ธนาคารยูโอบี จำกัด (มหาชน)     BAY=ธนาคารกรุงศรีอยุธยา จำกัด (มหาชน)     MEGA=ธนาคารเมกะ สากลพาณิชย์ จำกัด (มหาชน)     BOA=ธนาคารแห่งอเมริกา เนชั่นแนล แอสโซซิเอชั่น     IOB=ธนาคารอินเดียนโอเวอร์ซีส์     GSB=ธนาคารออมสิน     HSBC=ธนาคารฮ่องกงและเซี่ยงไฮ้แบงกิ้ง คอร์ปอเรชั่น จำกัด     DB=ธนาคารดอยซ์แบงก์     GHB=ธนาคารอาคารสงเคราะห์     BAAC=ธนาคารเพื่อการเกษตรและสหกรณ์     EXIM=ธนาคารเพื่อการส่งออกและนำเข้าแห่งประเทศไทย     MHCB=ธนาคารมิซูโฮ จำกัด     BNPP=ธนาคารบีเอ็นพี พารีบาส์     BOC=ธนาคารแห่งประเทศจีน จำกัด     ISBT=ธนาคารอิสลามแห่งประเทศไทย     TSCO=ธนาคารทิสโก้ จำกัด (มหาชน)     KKP=ธนาคารเกียรตินาคินภัทร จำกัด (มหาชน)     ICBC=ธนาคารไอซีบีซี (ไทย) จำกัด (มหาชน)     TCRB=ธนาคารไทยเครดิต จำกัด (มหาชน)     LHB=ธนาคารแลนด์ แอนด์ เฮ้าส์ จำกัด (มหาชน)     SMTB=ธนาคารซูมิโตโม มิตซุย ทรัสต์ (ไทย) จำกัด (มหาชน)     SME=ธนาคารพัฒนาวิสาหกิจขนาดกลางและขนาดย่อมแห่งประเทศไทย
    set test variable   ${bank_dict}
    set test variable   ${bank_name_dict}
    Open Excel Document      filename=${CURDIR}/Mastercase_Template.xlsx   doc_id=docname1
    ${master_case_id}=    create master case id of bank name '${BANK_NAME}'
    set test variable   ${master_case_id}
    Write Excel Cell	3   1    ${master_case_id}    sheet_name=CreateBankCase
    ${polics_date}=    create polics date 'before_create_case'
    ${polics_time}=    create polics time 'random'
    ${polics_case_id}=    create polics case id 'random' total '50' digit
    ${police_section}=    การตรวจพบรายการ คือ 'ผู้เสียหายแจ้งเอง มาตรา 7'
    Write Excel Cell	3   2    ${polics_date}    sheet_name=CreateBankCase
    Write Excel Cell	3   3    ${polics_time}    sheet_name=CreateBankCase
    Write Excel Cell	3   4    ${polics_case_id}    sheet_name=CreateBankCase
    Write Excel Cell	3   5    ${police_section}    sheet_name=CreateBankCase
    ${police_section}=    การตรวจพบรายการ คือ 'ผู้เสียหายแจ้งเอง มาตรา 7'
    Write Excel Cell	3   5    ${police_section}    sheet_name=CreateBankCase
    set test variable    ${master_file_name}    Mastercase_${master_case_id}
    Save Excel Document      filename=${CURDIR}/${FOLDER}/${master_file_name}.xlsx
    Close Current Excel Document
    Create victim information condition 2 '${FOLDER}/${master_file_name}' of bank name '${bank_name_dict}[${BANK_NAME}]'
    Create transaction to banks บุคคลเก่าและบัญชีเก่าเคยออกรายงาน '${HORSE_LIST}' in '${FOLDER}/${master_file_name}'
    Add Master Case via API '${FOLDER}/${master_file_name}' bank name '${BANK_NAME}'

Create Master Case for condition 2 บุคคลเก่าและบัญชีใหม่ ยังไม่เคยออกรายงาน บุคคลคนเดียวกันเปลี่ยนชื่อ File '${FOLDER}' from bank name '${BANK_NAME}' to '${HORSE_LIST}'
    Create Directory     ${CURDIR}/${FOLDER}
    ${bank_dict} =    Create Dictionary    ธนาคารกรุงเทพ จำกัด (มหาชน)=BBL    ธนาคารกสิกรไทย จำกัด (มหาชน)=KBNK    ธนาคารกรุงไทย จำกัด (มหาชน)=KTB    ธนาคาร เจพีมอร์แกน เชส=JPMC    ธนาคาร โอเวอร์ซี-ไชนีสแบงกิ้งคอร์ปอเรชั่น จํากัด=OCBC    ธนาคารทหารไทยธนชาต จำกัด (มหาชน)=TTB    ธนาคารไทยพาณิชย์ จำกัด (มหาชน)=SCB    ธนาคารซิตี้แบงก์=CITI    ธนาคารซูมิโตโม มิตซุย แบงกิ้ง คอร์ปอเรชั่น=SMBC    ธนาคารสแตนดาร์ดชาร์เตอร์ด(ไทย) จำกัด (มหาชน)=SCBT    ธนาคาร ซีไอเอ็มบี ไทย จำกัด (มหาชน)=CMBT    ธนาคาร อาร์ เอช บี จำกัด=RHB    ธนาคารยูโอบี จำกัด (มหาชน)=UOBT    ธนาคารกรุงศรีอยุธยา จำกัด (มหาชน)=BAY    ธนาคารเมกะ สากลพาณิชย์ จำกัด (มหาชน)=MEGA    ธนาคารแห่งอเมริกา เนชั่นแนล แอสโซซิเอชั่น=BOA    ธนาคารอินเดียนโอเวอร์ซีส์=IOB    ธนาคารออมสิน=GSB    ธนาคารฮ่องกงและเซี่ยงไฮ้แบงกิ้ง คอร์ปอเรชั่น จำกัด=HSBC    ธนาคารดอยซ์แบงก์=DB    ธนาคารอาคารสงเคราะห์=GHB    ธนาคารเพื่อการเกษตรและสหกรณ์=BAAC    ธนาคารเพื่อการส่งออกและนำเข้าแห่งประเทศไทย=EXIM    ธนาคารมิซูโฮ จำกัด=MHCB    ธนาคารบีเอ็นพี พารีบาส์=BNPP    ธนาคารแห่งประเทศจีน จำกัด=BOC    ธนาคารอิสลามแห่งประเทศไทย=ISBT    ธนาคารทิสโก้ จำกัด (มหาชน)=TSCO    ธนาคารเกียรตินาคินภัทร จำกัด (มหาชน)=KKP    ธนาคารไอซีบีซี (ไทย) จำกัด (มหาชน)=ICBC    ธนาคารไทยเครดิต จำกัด (มหาชน)=TCRB    ธนาคารแลนด์ แอนด์ เฮ้าส์ จำกัด (มหาชน)=LHB    ธนาคารซูมิโตโม มิตซุย ทรัสต์ (ไทย) จำกัด (มหาชน)=SMTB    ธนาคารพัฒนาวิสาหกิจขนาดกลางและขนาดย่อมแห่งประเทศไทย=SME
    ${bank_name_dict} =    Create Dictionary    BBL=ธนาคารกรุงเทพ จำกัด (มหาชน)     KBNK=ธนาคารกสิกรไทย จำกัด (มหาชน)    KTB=ธนาคารกรุงไทย จำกัด (มหาชน)    JPMC=ธนาคาร เจพีมอร์แกน เชส    OCBC=ธนาคาร โอเวอร์ซี-ไชนีสแบงกิ้งคอร์ปอเรชั่น จํากัด    TTB=ธนาคารทหารไทยธนชาต จำกัด (มหาชน)     SCB=ธนาคารไทยพาณิชย์ จำกัด (มหาชน)     CITI=ธนาคารซิตี้แบงก์     SMBC=ธนาคารซูมิโตโม มิตซุย แบงกิ้ง คอร์ปอเรชั่น     SCBT=ธนาคารสแตนดาร์ดชาร์เตอร์ด(ไทย) จำกัด (มหาชน)     CMBT=ธนาคาร ซีไอเอ็มบี ไทย จำกัด (มหาชน)     RHB=ธนาคาร อาร์ เอช บี จำกัด     UOBT=ธนาคารยูโอบี จำกัด (มหาชน)     BAY=ธนาคารกรุงศรีอยุธยา จำกัด (มหาชน)     MEGA=ธนาคารเมกะ สากลพาณิชย์ จำกัด (มหาชน)     BOA=ธนาคารแห่งอเมริกา เนชั่นแนล แอสโซซิเอชั่น     IOB=ธนาคารอินเดียนโอเวอร์ซีส์     GSB=ธนาคารออมสิน     HSBC=ธนาคารฮ่องกงและเซี่ยงไฮ้แบงกิ้ง คอร์ปอเรชั่น จำกัด     DB=ธนาคารดอยซ์แบงก์     GHB=ธนาคารอาคารสงเคราะห์     BAAC=ธนาคารเพื่อการเกษตรและสหกรณ์     EXIM=ธนาคารเพื่อการส่งออกและนำเข้าแห่งประเทศไทย     MHCB=ธนาคารมิซูโฮ จำกัด     BNPP=ธนาคารบีเอ็นพี พารีบาส์     BOC=ธนาคารแห่งประเทศจีน จำกัด     ISBT=ธนาคารอิสลามแห่งประเทศไทย     TSCO=ธนาคารทิสโก้ จำกัด (มหาชน)     KKP=ธนาคารเกียรตินาคินภัทร จำกัด (มหาชน)     ICBC=ธนาคารไอซีบีซี (ไทย) จำกัด (มหาชน)     TCRB=ธนาคารไทยเครดิต จำกัด (มหาชน)     LHB=ธนาคารแลนด์ แอนด์ เฮ้าส์ จำกัด (มหาชน)     SMTB=ธนาคารซูมิโตโม มิตซุย ทรัสต์ (ไทย) จำกัด (มหาชน)     SME=ธนาคารพัฒนาวิสาหกิจขนาดกลางและขนาดย่อมแห่งประเทศไทย
    set test variable   ${bank_dict}
    set test variable   ${bank_name_dict}
    Open Excel Document      filename=${CURDIR}/Mastercase_Template.xlsx   doc_id=docname1
    ${master_case_id}=    create master case id of bank name '${BANK_NAME}'
    set test variable   ${master_case_id}
    Write Excel Cell	3   1    ${master_case_id}    sheet_name=CreateBankCase
    ${polics_date}=    create polics date 'before_create_case'
    ${polics_time}=    create polics time 'random'
    ${polics_case_id}=    create polics case id 'random' total '50' digit
    ${police_section}=    การตรวจพบรายการ คือ 'ผู้เสียหายแจ้งเอง มาตรา 7'
    Write Excel Cell	3   2    ${polics_date}    sheet_name=CreateBankCase
    Write Excel Cell	3   3    ${polics_time}    sheet_name=CreateBankCase
    Write Excel Cell	3   4    ${polics_case_id}    sheet_name=CreateBankCase
    Write Excel Cell	3   5    ${police_section}    sheet_name=CreateBankCase
    ${police_section}=    การตรวจพบรายการ คือ 'ผู้เสียหายแจ้งเอง มาตรา 7'
    Write Excel Cell	3   5    ${police_section}    sheet_name=CreateBankCase
    set test variable    ${master_file_name}    Mastercase_${master_case_id}
    Save Excel Document      filename=${CURDIR}/${FOLDER}/${master_file_name}.xlsx
    Close Current Excel Document
    set test variable    ${test_case_name}    ${FOLDER}
    Create victim information condition 2 '${FOLDER}/${master_file_name}' of bank name '${bank_name_dict}[${BANK_NAME}]'
    Create transaction to banks บุคคลเก่าและบัญชีใหม่ ยังไม่เคยออกรายงาน บุคคลคนเดียวกันเปลี่ยนชื่อ '${HORSE_LIST}' in '${FOLDER}/${master_file_name}'
    Add Master Case via API '${FOLDER}/${master_file_name}' bank name '${BANK_NAME}'

Create Master Case for condition 2 บุคคลเก่าและบัญชีใหม่ ลักษณะเคสซื้อขายสินค้า File '${FOLDER}' from bank name '${BANK_NAME}' to '${HORSE_LIST}'
    ${horse_list_dict} =    Create Dictionary
    set test variable   ${horse_list_dict}
    Create Directory     ${CURDIR}/${FOLDER}
    ${bank_dict} =    Create Dictionary    ธนาคารกรุงเทพ จำกัด (มหาชน)=BBL    ธนาคารกสิกรไทย จำกัด (มหาชน)=KBNK    ธนาคารกรุงไทย จำกัด (มหาชน)=KTB    ธนาคาร เจพีมอร์แกน เชส=JPMC    ธนาคาร โอเวอร์ซี-ไชนีสแบงกิ้งคอร์ปอเรชั่น จํากัด=OCBC    ธนาคารทหารไทยธนชาต จำกัด (มหาชน)=TTB    ธนาคารไทยพาณิชย์ จำกัด (มหาชน)=SCB    ธนาคารซิตี้แบงก์=CITI    ธนาคารซูมิโตโม มิตซุย แบงกิ้ง คอร์ปอเรชั่น=SMBC    ธนาคารสแตนดาร์ดชาร์เตอร์ด(ไทย) จำกัด (มหาชน)=SCBT    ธนาคาร ซีไอเอ็มบี ไทย จำกัด (มหาชน)=CMBT    ธนาคาร อาร์ เอช บี จำกัด=RHB    ธนาคารยูโอบี จำกัด (มหาชน)=UOBT    ธนาคารกรุงศรีอยุธยา จำกัด (มหาชน)=BAY    ธนาคารเมกะ สากลพาณิชย์ จำกัด (มหาชน)=MEGA    ธนาคารแห่งอเมริกา เนชั่นแนล แอสโซซิเอชั่น=BOA    ธนาคารอินเดียนโอเวอร์ซีส์=IOB    ธนาคารออมสิน=GSB    ธนาคารฮ่องกงและเซี่ยงไฮ้แบงกิ้ง คอร์ปอเรชั่น จำกัด=HSBC    ธนาคารดอยซ์แบงก์=DB    ธนาคารอาคารสงเคราะห์=GHB    ธนาคารเพื่อการเกษตรและสหกรณ์=BAAC    ธนาคารเพื่อการส่งออกและนำเข้าแห่งประเทศไทย=EXIM    ธนาคารมิซูโฮ จำกัด=MHCB    ธนาคารบีเอ็นพี พารีบาส์=BNPP    ธนาคารแห่งประเทศจีน จำกัด=BOC    ธนาคารอิสลามแห่งประเทศไทย=ISBT    ธนาคารทิสโก้ จำกัด (มหาชน)=TSCO    ธนาคารเกียรตินาคินภัทร จำกัด (มหาชน)=KKP    ธนาคารไอซีบีซี (ไทย) จำกัด (มหาชน)=ICBC    ธนาคารไทยเครดิต จำกัด (มหาชน)=TCRB    ธนาคารแลนด์ แอนด์ เฮ้าส์ จำกัด (มหาชน)=LHB    ธนาคารซูมิโตโม มิตซุย ทรัสต์ (ไทย) จำกัด (มหาชน)=SMTB    ธนาคารพัฒนาวิสาหกิจขนาดกลางและขนาดย่อมแห่งประเทศไทย=SME
    ${bank_name_dict} =    Create Dictionary    BBL=ธนาคารกรุงเทพ จำกัด (มหาชน)     KBNK=ธนาคารกสิกรไทย จำกัด (มหาชน)    KTB=ธนาคารกรุงไทย จำกัด (มหาชน)    JPMC=ธนาคาร เจพีมอร์แกน เชส    OCBC=ธนาคาร โอเวอร์ซี-ไชนีสแบงกิ้งคอร์ปอเรชั่น จํากัด    TTB=ธนาคารทหารไทยธนชาต จำกัด (มหาชน)     SCB=ธนาคารไทยพาณิชย์ จำกัด (มหาชน)     CITI=ธนาคารซิตี้แบงก์     SMBC=ธนาคารซูมิโตโม มิตซุย แบงกิ้ง คอร์ปอเรชั่น     SCBT=ธนาคารสแตนดาร์ดชาร์เตอร์ด(ไทย) จำกัด (มหาชน)     CMBT=ธนาคาร ซีไอเอ็มบี ไทย จำกัด (มหาชน)     RHB=ธนาคาร อาร์ เอช บี จำกัด     UOBT=ธนาคารยูโอบี จำกัด (มหาชน)     BAY=ธนาคารกรุงศรีอยุธยา จำกัด (มหาชน)     MEGA=ธนาคารเมกะ สากลพาณิชย์ จำกัด (มหาชน)     BOA=ธนาคารแห่งอเมริกา เนชั่นแนล แอสโซซิเอชั่น     IOB=ธนาคารอินเดียนโอเวอร์ซีส์     GSB=ธนาคารออมสิน     HSBC=ธนาคารฮ่องกงและเซี่ยงไฮ้แบงกิ้ง คอร์ปอเรชั่น จำกัด     DB=ธนาคารดอยซ์แบงก์     GHB=ธนาคารอาคารสงเคราะห์     BAAC=ธนาคารเพื่อการเกษตรและสหกรณ์     EXIM=ธนาคารเพื่อการส่งออกและนำเข้าแห่งประเทศไทย     MHCB=ธนาคารมิซูโฮ จำกัด     BNPP=ธนาคารบีเอ็นพี พารีบาส์     BOC=ธนาคารแห่งประเทศจีน จำกัด     ISBT=ธนาคารอิสลามแห่งประเทศไทย     TSCO=ธนาคารทิสโก้ จำกัด (มหาชน)     KKP=ธนาคารเกียรตินาคินภัทร จำกัด (มหาชน)     ICBC=ธนาคารไอซีบีซี (ไทย) จำกัด (มหาชน)     TCRB=ธนาคารไทยเครดิต จำกัด (มหาชน)     LHB=ธนาคารแลนด์ แอนด์ เฮ้าส์ จำกัด (มหาชน)     SMTB=ธนาคารซูมิโตโม มิตซุย ทรัสต์ (ไทย) จำกัด (มหาชน)     SME=ธนาคารพัฒนาวิสาหกิจขนาดกลางและขนาดย่อมแห่งประเทศไทย
    set test variable   ${bank_dict}
    set test variable   ${bank_name_dict}
    Open Excel Document      filename=${CURDIR}/Mastercase_Template.xlsx   doc_id=docname1
    ${master_case_id}=    create master case id of bank name '${BANK_NAME}'
    set test variable   ${master_case_id}
    Write Excel Cell	3   1    ${master_case_id}    sheet_name=CreateBankCase
    ${polics_date}=    create polics date 'before_create_case'
    ${polics_time}=    create polics time 'random'
    ${polics_case_id}=    create polics case id 'random' total '50' digit
    ${police_section}=    การตรวจพบรายการ คือ 'ผู้เสียหายแจ้งเอง มาตรา 7'
    Write Excel Cell	3   2    ${polics_date}    sheet_name=CreateBankCase
    Write Excel Cell	3   3    ${polics_time}    sheet_name=CreateBankCase
    Write Excel Cell	3   4    ${polics_case_id}    sheet_name=CreateBankCase
    Write Excel Cell	3   5    ${police_section}    sheet_name=CreateBankCase
    ${police_section}=    การตรวจพบรายการ คือ 'ผู้เสียหายแจ้งเอง มาตรา 7'
    Write Excel Cell	3   5    ${police_section}    sheet_name=CreateBankCase
    set test variable    ${master_file_name}    Mastercase_${master_case_id}
    Save Excel Document      filename=${CURDIR}/${FOLDER}/${master_file_name}.xlsx
    Close Current Excel Document
    set test variable    ${test_case_name}    ${FOLDER}
    Create victim information condition 2 ลักษณะเคสซื้อขายสินค้า '${FOLDER}/${master_file_name}' of bank name '${bank_name_dict}[${BANK_NAME}]'
    Create transaction to banks '${HORSE_LIST}' in '${FOLDER}/${master_file_name}'
    Add Master Case via API '${FOLDER}/${master_file_name}' bank name '${BANK_NAME}'

Create Master Case for condition 2 File '${FOLDER}' from bank name '${BANK_NAME}' to '${HORSE_LIST}' ไม่มีข้อมูลเลขบัตรประชาชน
    ${horse_list_dict} =    Create Dictionary
    set test variable   ${horse_list_dict}
    Create Directory     ${CURDIR}/${FOLDER}
    ${bank_dict} =    Create Dictionary    ธนาคารกรุงเทพ จำกัด (มหาชน)=BBL    ธนาคารกสิกรไทย จำกัด (มหาชน)=KBNK    ธนาคารกรุงไทย จำกัด (มหาชน)=KTB    ธนาคาร เจพีมอร์แกน เชส=JPMC    ธนาคาร โอเวอร์ซี-ไชนีสแบงกิ้งคอร์ปอเรชั่น จํากัด=OCBC    ธนาคารทหารไทยธนชาต จำกัด (มหาชน)=TTB    ธนาคารไทยพาณิชย์ จำกัด (มหาชน)=SCB    ธนาคารซิตี้แบงก์=CITI    ธนาคารซูมิโตโม มิตซุย แบงกิ้ง คอร์ปอเรชั่น=SMBC    ธนาคารสแตนดาร์ดชาร์เตอร์ด(ไทย) จำกัด (มหาชน)=SCBT    ธนาคาร ซีไอเอ็มบี ไทย จำกัด (มหาชน)=CMBT    ธนาคาร อาร์ เอช บี จำกัด=RHB    ธนาคารยูโอบี จำกัด (มหาชน)=UOBT    ธนาคารกรุงศรีอยุธยา จำกัด (มหาชน)=BAY    ธนาคารเมกะ สากลพาณิชย์ จำกัด (มหาชน)=MEGA    ธนาคารแห่งอเมริกา เนชั่นแนล แอสโซซิเอชั่น=BOA    ธนาคารอินเดียนโอเวอร์ซีส์=IOB    ธนาคารออมสิน=GSB    ธนาคารฮ่องกงและเซี่ยงไฮ้แบงกิ้ง คอร์ปอเรชั่น จำกัด=HSBC    ธนาคารดอยซ์แบงก์=DB    ธนาคารอาคารสงเคราะห์=GHB    ธนาคารเพื่อการเกษตรและสหกรณ์=BAAC    ธนาคารเพื่อการส่งออกและนำเข้าแห่งประเทศไทย=EXIM    ธนาคารมิซูโฮ จำกัด=MHCB    ธนาคารบีเอ็นพี พารีบาส์=BNPP    ธนาคารแห่งประเทศจีน จำกัด=BOC    ธนาคารอิสลามแห่งประเทศไทย=ISBT    ธนาคารทิสโก้ จำกัด (มหาชน)=TSCO    ธนาคารเกียรตินาคินภัทร จำกัด (มหาชน)=KKP    ธนาคารไอซีบีซี (ไทย) จำกัด (มหาชน)=ICBC    ธนาคารไทยเครดิต จำกัด (มหาชน)=TCRB    ธนาคารแลนด์ แอนด์ เฮ้าส์ จำกัด (มหาชน)=LHB    ธนาคารซูมิโตโม มิตซุย ทรัสต์ (ไทย) จำกัด (มหาชน)=SMTB    ธนาคารพัฒนาวิสาหกิจขนาดกลางและขนาดย่อมแห่งประเทศไทย=SME
    ${bank_name_dict} =    Create Dictionary    BBL=ธนาคารกรุงเทพ จำกัด (มหาชน)     KBNK=ธนาคารกสิกรไทย จำกัด (มหาชน)    KTB=ธนาคารกรุงไทย จำกัด (มหาชน)    JPMC=ธนาคาร เจพีมอร์แกน เชส    OCBC=ธนาคาร โอเวอร์ซี-ไชนีสแบงกิ้งคอร์ปอเรชั่น จํากัด    TTB=ธนาคารทหารไทยธนชาต จำกัด (มหาชน)     SCB=ธนาคารไทยพาณิชย์ จำกัด (มหาชน)     CITI=ธนาคารซิตี้แบงก์     SMBC=ธนาคารซูมิโตโม มิตซุย แบงกิ้ง คอร์ปอเรชั่น     SCBT=ธนาคารสแตนดาร์ดชาร์เตอร์ด(ไทย) จำกัด (มหาชน)     CMBT=ธนาคาร ซีไอเอ็มบี ไทย จำกัด (มหาชน)     RHB=ธนาคาร อาร์ เอช บี จำกัด     UOBT=ธนาคารยูโอบี จำกัด (มหาชน)     BAY=ธนาคารกรุงศรีอยุธยา จำกัด (มหาชน)     MEGA=ธนาคารเมกะ สากลพาณิชย์ จำกัด (มหาชน)     BOA=ธนาคารแห่งอเมริกา เนชั่นแนล แอสโซซิเอชั่น     IOB=ธนาคารอินเดียนโอเวอร์ซีส์     GSB=ธนาคารออมสิน     HSBC=ธนาคารฮ่องกงและเซี่ยงไฮ้แบงกิ้ง คอร์ปอเรชั่น จำกัด     DB=ธนาคารดอยซ์แบงก์     GHB=ธนาคารอาคารสงเคราะห์     BAAC=ธนาคารเพื่อการเกษตรและสหกรณ์     EXIM=ธนาคารเพื่อการส่งออกและนำเข้าแห่งประเทศไทย     MHCB=ธนาคารมิซูโฮ จำกัด     BNPP=ธนาคารบีเอ็นพี พารีบาส์     BOC=ธนาคารแห่งประเทศจีน จำกัด     ISBT=ธนาคารอิสลามแห่งประเทศไทย     TSCO=ธนาคารทิสโก้ จำกัด (มหาชน)     KKP=ธนาคารเกียรตินาคินภัทร จำกัด (มหาชน)     ICBC=ธนาคารไอซีบีซี (ไทย) จำกัด (มหาชน)     TCRB=ธนาคารไทยเครดิต จำกัด (มหาชน)     LHB=ธนาคารแลนด์ แอนด์ เฮ้าส์ จำกัด (มหาชน)     SMTB=ธนาคารซูมิโตโม มิตซุย ทรัสต์ (ไทย) จำกัด (มหาชน)     SME=ธนาคารพัฒนาวิสาหกิจขนาดกลางและขนาดย่อมแห่งประเทศไทย
    set test variable   ${bank_dict}
    set test variable   ${bank_name_dict}
    Open Excel Document      filename=${CURDIR}/Mastercase_Template.xlsx   doc_id=docname1
    ${master_case_id}=    create master case id of bank name '${BANK_NAME}'
    set test variable   ${master_case_id}
    Write Excel Cell	3   1    ${master_case_id}    sheet_name=CreateBankCase
    ${polics_date}=    create polics date 'before_create_case'
    ${polics_time}=    create polics time 'random'
    ${polics_case_id}=    create polics case id 'random' total '50' digit
    ${police_section}=    การตรวจพบรายการ คือ 'ผู้เสียหายแจ้งเอง มาตรา 7'
    Write Excel Cell	3   2    ${polics_date}    sheet_name=CreateBankCase
    Write Excel Cell	3   3    ${polics_time}    sheet_name=CreateBankCase
    Write Excel Cell	3   4    ${polics_case_id}    sheet_name=CreateBankCase
    Write Excel Cell	3   5    ${police_section}    sheet_name=CreateBankCase
    ${police_section}=    การตรวจพบรายการ คือ 'ผู้เสียหายแจ้งเอง มาตรา 7'
    Write Excel Cell	3   5    ${police_section}    sheet_name=CreateBankCase
    set test variable    ${master_file_name}    Mastercase_${master_case_id}
    Save Excel Document      filename=${CURDIR}/${FOLDER}/${master_file_name}.xlsx
    Close Current Excel Document
    set test variable    ${test_case_name}    ${FOLDER}
    Create victim information condition 2 '${FOLDER}/${master_file_name}' of bank name '${bank_name_dict}[${BANK_NAME}]'
    Create transaction to banks '${HORSE_LIST}' in '${FOLDER}/${master_file_name}' ไม่มีข้อมูลเลขบัตรประชาชน
    Add Master Case via API '${FOLDER}/${master_file_name}' bank name '${BANK_NAME}'

Create Master Case for condition 2 File '${FOLDER}' from bank name '${BANK_NAME}' to '${HORSE_LIST}'
    ${horse_list_dict} =    Create Dictionary
    set test variable   ${horse_list_dict}
    Create Directory     ${CURDIR}/${FOLDER}
    ${bank_dict} =    Create Dictionary    ธนาคารกรุงเทพ จำกัด (มหาชน)=BBL    ธนาคารกสิกรไทย จำกัด (มหาชน)=KBNK    ธนาคารกรุงไทย จำกัด (มหาชน)=KTB    ธนาคาร เจพีมอร์แกน เชส=JPMC    ธนาคาร โอเวอร์ซี-ไชนีสแบงกิ้งคอร์ปอเรชั่น จํากัด=OCBC    ธนาคารทหารไทยธนชาต จำกัด (มหาชน)=TTB    ธนาคารไทยพาณิชย์ จำกัด (มหาชน)=SCB    ธนาคารซิตี้แบงก์=CITI    ธนาคารซูมิโตโม มิตซุย แบงกิ้ง คอร์ปอเรชั่น=SMBC    ธนาคารสแตนดาร์ดชาร์เตอร์ด(ไทย) จำกัด (มหาชน)=SCBT    ธนาคาร ซีไอเอ็มบี ไทย จำกัด (มหาชน)=CMBT    ธนาคาร อาร์ เอช บี จำกัด=RHB    ธนาคารยูโอบี จำกัด (มหาชน)=UOBT    ธนาคารกรุงศรีอยุธยา จำกัด (มหาชน)=BAY    ธนาคารเมกะ สากลพาณิชย์ จำกัด (มหาชน)=MEGA    ธนาคารแห่งอเมริกา เนชั่นแนล แอสโซซิเอชั่น=BOA    ธนาคารอินเดียนโอเวอร์ซีส์=IOB    ธนาคารออมสิน=GSB    ธนาคารฮ่องกงและเซี่ยงไฮ้แบงกิ้ง คอร์ปอเรชั่น จำกัด=HSBC    ธนาคารดอยซ์แบงก์=DB    ธนาคารอาคารสงเคราะห์=GHB    ธนาคารเพื่อการเกษตรและสหกรณ์=BAAC    ธนาคารเพื่อการส่งออกและนำเข้าแห่งประเทศไทย=EXIM    ธนาคารมิซูโฮ จำกัด=MHCB    ธนาคารบีเอ็นพี พารีบาส์=BNPP    ธนาคารแห่งประเทศจีน จำกัด=BOC    ธนาคารอิสลามแห่งประเทศไทย=ISBT    ธนาคารทิสโก้ จำกัด (มหาชน)=TSCO    ธนาคารเกียรตินาคินภัทร จำกัด (มหาชน)=KKP    ธนาคารไอซีบีซี (ไทย) จำกัด (มหาชน)=ICBC    ธนาคารไทยเครดิต จำกัด (มหาชน)=TCRB    ธนาคารแลนด์ แอนด์ เฮ้าส์ จำกัด (มหาชน)=LHB    ธนาคารซูมิโตโม มิตซุย ทรัสต์ (ไทย) จำกัด (มหาชน)=SMTB    ธนาคารพัฒนาวิสาหกิจขนาดกลางและขนาดย่อมแห่งประเทศไทย=SME
    ${bank_name_dict} =    Create Dictionary    BBL=ธนาคารกรุงเทพ จำกัด (มหาชน)     KBNK=ธนาคารกสิกรไทย จำกัด (มหาชน)    KTB=ธนาคารกรุงไทย จำกัด (มหาชน)    JPMC=ธนาคาร เจพีมอร์แกน เชส    OCBC=ธนาคาร โอเวอร์ซี-ไชนีสแบงกิ้งคอร์ปอเรชั่น จํากัด    TTB=ธนาคารทหารไทยธนชาต จำกัด (มหาชน)     SCB=ธนาคารไทยพาณิชย์ จำกัด (มหาชน)     CITI=ธนาคารซิตี้แบงก์     SMBC=ธนาคารซูมิโตโม มิตซุย แบงกิ้ง คอร์ปอเรชั่น     SCBT=ธนาคารสแตนดาร์ดชาร์เตอร์ด(ไทย) จำกัด (มหาชน)     CMBT=ธนาคาร ซีไอเอ็มบี ไทย จำกัด (มหาชน)     RHB=ธนาคาร อาร์ เอช บี จำกัด     UOBT=ธนาคารยูโอบี จำกัด (มหาชน)     BAY=ธนาคารกรุงศรีอยุธยา จำกัด (มหาชน)     MEGA=ธนาคารเมกะ สากลพาณิชย์ จำกัด (มหาชน)     BOA=ธนาคารแห่งอเมริกา เนชั่นแนล แอสโซซิเอชั่น     IOB=ธนาคารอินเดียนโอเวอร์ซีส์     GSB=ธนาคารออมสิน     HSBC=ธนาคารฮ่องกงและเซี่ยงไฮ้แบงกิ้ง คอร์ปอเรชั่น จำกัด     DB=ธนาคารดอยซ์แบงก์     GHB=ธนาคารอาคารสงเคราะห์     BAAC=ธนาคารเพื่อการเกษตรและสหกรณ์     EXIM=ธนาคารเพื่อการส่งออกและนำเข้าแห่งประเทศไทย     MHCB=ธนาคารมิซูโฮ จำกัด     BNPP=ธนาคารบีเอ็นพี พารีบาส์     BOC=ธนาคารแห่งประเทศจีน จำกัด     ISBT=ธนาคารอิสลามแห่งประเทศไทย     TSCO=ธนาคารทิสโก้ จำกัด (มหาชน)     KKP=ธนาคารเกียรตินาคินภัทร จำกัด (มหาชน)     ICBC=ธนาคารไอซีบีซี (ไทย) จำกัด (มหาชน)     TCRB=ธนาคารไทยเครดิต จำกัด (มหาชน)     LHB=ธนาคารแลนด์ แอนด์ เฮ้าส์ จำกัด (มหาชน)     SMTB=ธนาคารซูมิโตโม มิตซุย ทรัสต์ (ไทย) จำกัด (มหาชน)     SME=ธนาคารพัฒนาวิสาหกิจขนาดกลางและขนาดย่อมแห่งประเทศไทย
    set test variable   ${bank_dict}
    set test variable   ${bank_name_dict}
    Open Excel Document      filename=${CURDIR}/Mastercase_Template.xlsx   doc_id=docname1
    ${master_case_id}=    create master case id of bank name '${BANK_NAME}'
    set test variable   ${master_case_id}
    Write Excel Cell	3   1    ${master_case_id}    sheet_name=CreateBankCase
    ${polics_date}=    create polics date 'before_create_case'
    ${polics_time}=    create polics time 'random'
    ${polics_case_id}=    create polics case id 'random' total '50' digit
    ${police_section}=    การตรวจพบรายการ คือ 'ผู้เสียหายแจ้งเอง มาตรา 7'
    Write Excel Cell	3   2    ${polics_date}    sheet_name=CreateBankCase
    Write Excel Cell	3   3    ${polics_time}    sheet_name=CreateBankCase
    Write Excel Cell	3   4    ${polics_case_id}    sheet_name=CreateBankCase
    Write Excel Cell	3   5    ${police_section}    sheet_name=CreateBankCase
    ${police_section}=    การตรวจพบรายการ คือ 'ผู้เสียหายแจ้งเอง มาตรา 7'
    Write Excel Cell	3   5    ${police_section}    sheet_name=CreateBankCase
    set test variable    ${master_file_name}    Mastercase_${master_case_id}
    Save Excel Document      filename=${CURDIR}/${FOLDER}/${master_file_name}.xlsx
    Close Current Excel Document
    set test variable    ${test_case_name}    ${FOLDER}
    Create victim information condition 2 '${FOLDER}/${master_file_name}' of bank name '${bank_name_dict}[${BANK_NAME}]'
    Create transaction to banks '${HORSE_LIST}' in '${FOLDER}/${master_file_name}'
    Add Master Case via API '${FOLDER}/${master_file_name}' bank name '${BANK_NAME}'



Create Master Case for condition 2 File '${FOLDER}' from bank name '${BANK_NAME}' to '${HORSE_LIST}' con 2 Normal
    ${horse_list_dict} =    Create Dictionary
    set test variable   ${horse_list_dict}
    Create Directory     ${CURDIR}/${FOLDER}
    ${bank_dict} =    Create Dictionary    ธนาคารกรุงเทพ จำกัด (มหาชน)=BBL    ธนาคารกสิกรไทย จำกัด (มหาชน)=KBNK    ธนาคารกรุงไทย จำกัด (มหาชน)=KTB    ธนาคาร เจพีมอร์แกน เชส=JPMC    ธนาคาร โอเวอร์ซี-ไชนีสแบงกิ้งคอร์ปอเรชั่น จํากัด=OCBC    ธนาคารทหารไทยธนชาต จำกัด (มหาชน)=TTB    ธนาคารไทยพาณิชย์ จำกัด (มหาชน)=SCB    ธนาคารซิตี้แบงก์=CITI    ธนาคารซูมิโตโม มิตซุย แบงกิ้ง คอร์ปอเรชั่น=SMBC    ธนาคารสแตนดาร์ดชาร์เตอร์ด(ไทย) จำกัด (มหาชน)=SCBT    ธนาคาร ซีไอเอ็มบี ไทย จำกัด (มหาชน)=CMBT    ธนาคาร อาร์ เอช บี จำกัด=RHB    ธนาคารยูโอบี จำกัด (มหาชน)=UOBT    ธนาคารกรุงศรีอยุธยา จำกัด (มหาชน)=BAY    ธนาคารเมกะ สากลพาณิชย์ จำกัด (มหาชน)=MEGA    ธนาคารแห่งอเมริกา เนชั่นแนล แอสโซซิเอชั่น=BOA    ธนาคารอินเดียนโอเวอร์ซีส์=IOB    ธนาคารออมสิน=GSB    ธนาคารฮ่องกงและเซี่ยงไฮ้แบงกิ้ง คอร์ปอเรชั่น จำกัด=HSBC    ธนาคารดอยซ์แบงก์=DB    ธนาคารอาคารสงเคราะห์=GHB    ธนาคารเพื่อการเกษตรและสหกรณ์=BAAC    ธนาคารเพื่อการส่งออกและนำเข้าแห่งประเทศไทย=EXIM    ธนาคารมิซูโฮ จำกัด=MHCB    ธนาคารบีเอ็นพี พารีบาส์=BNPP    ธนาคารแห่งประเทศจีน จำกัด=BOC    ธนาคารอิสลามแห่งประเทศไทย=ISBT    ธนาคารทิสโก้ จำกัด (มหาชน)=TSCO    ธนาคารเกียรตินาคินภัทร จำกัด (มหาชน)=KKP    ธนาคารไอซีบีซี (ไทย) จำกัด (มหาชน)=ICBC    ธนาคารไทยเครดิต จำกัด (มหาชน)=TCRB    ธนาคารแลนด์ แอนด์ เฮ้าส์ จำกัด (มหาชน)=LHB    ธนาคารซูมิโตโม มิตซุย ทรัสต์ (ไทย) จำกัด (มหาชน)=SMTB    ธนาคารพัฒนาวิสาหกิจขนาดกลางและขนาดย่อมแห่งประเทศไทย=SME
    ${bank_name_dict} =    Create Dictionary    BBL=ธนาคารกรุงเทพ จำกัด (มหาชน)     KBNK=ธนาคารกสิกรไทย จำกัด (มหาชน)    KTB=ธนาคารกรุงไทย จำกัด (มหาชน)    JPMC=ธนาคาร เจพีมอร์แกน เชส    OCBC=ธนาคาร โอเวอร์ซี-ไชนีสแบงกิ้งคอร์ปอเรชั่น จํากัด    TTB=ธนาคารทหารไทยธนชาต จำกัด (มหาชน)     SCB=ธนาคารไทยพาณิชย์ จำกัด (มหาชน)     CITI=ธนาคารซิตี้แบงก์     SMBC=ธนาคารซูมิโตโม มิตซุย แบงกิ้ง คอร์ปอเรชั่น     SCBT=ธนาคารสแตนดาร์ดชาร์เตอร์ด(ไทย) จำกัด (มหาชน)     CMBT=ธนาคาร ซีไอเอ็มบี ไทย จำกัด (มหาชน)     RHB=ธนาคาร อาร์ เอช บี จำกัด     UOBT=ธนาคารยูโอบี จำกัด (มหาชน)     BAY=ธนาคารกรุงศรีอยุธยา จำกัด (มหาชน)     MEGA=ธนาคารเมกะ สากลพาณิชย์ จำกัด (มหาชน)     BOA=ธนาคารแห่งอเมริกา เนชั่นแนล แอสโซซิเอชั่น     IOB=ธนาคารอินเดียนโอเวอร์ซีส์     GSB=ธนาคารออมสิน     HSBC=ธนาคารฮ่องกงและเซี่ยงไฮ้แบงกิ้ง คอร์ปอเรชั่น จำกัด     DB=ธนาคารดอยซ์แบงก์     GHB=ธนาคารอาคารสงเคราะห์     BAAC=ธนาคารเพื่อการเกษตรและสหกรณ์     EXIM=ธนาคารเพื่อการส่งออกและนำเข้าแห่งประเทศไทย     MHCB=ธนาคารมิซูโฮ จำกัด     BNPP=ธนาคารบีเอ็นพี พารีบาส์     BOC=ธนาคารแห่งประเทศจีน จำกัด     ISBT=ธนาคารอิสลามแห่งประเทศไทย     TSCO=ธนาคารทิสโก้ จำกัด (มหาชน)     KKP=ธนาคารเกียรตินาคินภัทร จำกัด (มหาชน)     ICBC=ธนาคารไอซีบีซี (ไทย) จำกัด (มหาชน)     TCRB=ธนาคารไทยเครดิต จำกัด (มหาชน)     LHB=ธนาคารแลนด์ แอนด์ เฮ้าส์ จำกัด (มหาชน)     SMTB=ธนาคารซูมิโตโม มิตซุย ทรัสต์ (ไทย) จำกัด (มหาชน)     SME=ธนาคารพัฒนาวิสาหกิจขนาดกลางและขนาดย่อมแห่งประเทศไทย
    set test variable   ${bank_dict}
    set test variable   ${bank_name_dict}
    Open Excel Document      filename=${CURDIR}/Mastercase_Template.xlsx   doc_id=docname1
    ${master_case_id}=    create master case id of bank name '${BANK_NAME}'
    set test variable   ${master_case_id}
    Write Excel Cell	3   1    ${master_case_id}    sheet_name=CreateBankCase
    ${polics_date}=    create polics date 'before_create_case'
    ${polics_time}=    create polics time 'random'
    ${polics_case_id}=    create polics case id 'random' total '50' digit
    ${police_section}=    การตรวจพบรายการ คือ 'ผู้เสียหายแจ้งเอง มาตรา 7'
    Write Excel Cell	3   2    ${polics_date}    sheet_name=CreateBankCase
    Write Excel Cell	3   3    ${polics_time}    sheet_name=CreateBankCase
    Write Excel Cell	3   4    ${polics_case_id}    sheet_name=CreateBankCase
    Write Excel Cell	3   5    ${police_section}    sheet_name=CreateBankCase
    ${police_section}=    การตรวจพบรายการ คือ 'ผู้เสียหายแจ้งเอง มาตรา 7'
    Write Excel Cell	3   5    ${police_section}    sheet_name=CreateBankCase
    set test variable    ${master_file_name}    Mastercase_${master_case_id}
    Save Excel Document      filename=${CURDIR}/${FOLDER}/${master_file_name}.xlsx
    Close Current Excel Document
    set test variable    ${test_case_name}    ${FOLDER}
    Create victim information condition 2 '${FOLDER}/${master_file_name}' of bank name '${bank_name_dict}[${BANK_NAME}]'
    Create transaction to banks '${HORSE_LIST}' in '${FOLDER}/${master_file_name}' con 2 Normal
    Add Master Case via API '${FOLDER}/${master_file_name}' bank name '${BANK_NAME}'

Create Master Case for condition 2 File '${FOLDER}' from bank name '${BANK_NAME}' to '${HORSE_LIST}' con 2 Personal null
    ${horse_list_dict} =    Create Dictionary
    set test variable   ${horse_list_dict}
    Create Directory     ${CURDIR}/${FOLDER}
    ${bank_dict} =    Create Dictionary    ธนาคารกรุงเทพ จำกัด (มหาชน)=BBL    ธนาคารกสิกรไทย จำกัด (มหาชน)=KBNK    ธนาคารกรุงไทย จำกัด (มหาชน)=KTB    ธนาคาร เจพีมอร์แกน เชส=JPMC    ธนาคาร โอเวอร์ซี-ไชนีสแบงกิ้งคอร์ปอเรชั่น จํากัด=OCBC    ธนาคารทหารไทยธนชาต จำกัด (มหาชน)=TTB    ธนาคารไทยพาณิชย์ จำกัด (มหาชน)=SCB    ธนาคารซิตี้แบงก์=CITI    ธนาคารซูมิโตโม มิตซุย แบงกิ้ง คอร์ปอเรชั่น=SMBC    ธนาคารสแตนดาร์ดชาร์เตอร์ด(ไทย) จำกัด (มหาชน)=SCBT    ธนาคาร ซีไอเอ็มบี ไทย จำกัด (มหาชน)=CMBT    ธนาคาร อาร์ เอช บี จำกัด=RHB    ธนาคารยูโอบี จำกัด (มหาชน)=UOBT    ธนาคารกรุงศรีอยุธยา จำกัด (มหาชน)=BAY    ธนาคารเมกะ สากลพาณิชย์ จำกัด (มหาชน)=MEGA    ธนาคารแห่งอเมริกา เนชั่นแนล แอสโซซิเอชั่น=BOA    ธนาคารอินเดียนโอเวอร์ซีส์=IOB    ธนาคารออมสิน=GSB    ธนาคารฮ่องกงและเซี่ยงไฮ้แบงกิ้ง คอร์ปอเรชั่น จำกัด=HSBC    ธนาคารดอยซ์แบงก์=DB    ธนาคารอาคารสงเคราะห์=GHB    ธนาคารเพื่อการเกษตรและสหกรณ์=BAAC    ธนาคารเพื่อการส่งออกและนำเข้าแห่งประเทศไทย=EXIM    ธนาคารมิซูโฮ จำกัด=MHCB    ธนาคารบีเอ็นพี พารีบาส์=BNPP    ธนาคารแห่งประเทศจีน จำกัด=BOC    ธนาคารอิสลามแห่งประเทศไทย=ISBT    ธนาคารทิสโก้ จำกัด (มหาชน)=TSCO    ธนาคารเกียรตินาคินภัทร จำกัด (มหาชน)=KKP    ธนาคารไอซีบีซี (ไทย) จำกัด (มหาชน)=ICBC    ธนาคารไทยเครดิต จำกัด (มหาชน)=TCRB    ธนาคารแลนด์ แอนด์ เฮ้าส์ จำกัด (มหาชน)=LHB    ธนาคารซูมิโตโม มิตซุย ทรัสต์ (ไทย) จำกัด (มหาชน)=SMTB    ธนาคารพัฒนาวิสาหกิจขนาดกลางและขนาดย่อมแห่งประเทศไทย=SME
    ${bank_name_dict} =    Create Dictionary    BBL=ธนาคารกรุงเทพ จำกัด (มหาชน)     KBNK=ธนาคารกสิกรไทย จำกัด (มหาชน)    KTB=ธนาคารกรุงไทย จำกัด (มหาชน)    JPMC=ธนาคาร เจพีมอร์แกน เชส    OCBC=ธนาคาร โอเวอร์ซี-ไชนีสแบงกิ้งคอร์ปอเรชั่น จํากัด    TTB=ธนาคารทหารไทยธนชาต จำกัด (มหาชน)     SCB=ธนาคารไทยพาณิชย์ จำกัด (มหาชน)     CITI=ธนาคารซิตี้แบงก์     SMBC=ธนาคารซูมิโตโม มิตซุย แบงกิ้ง คอร์ปอเรชั่น     SCBT=ธนาคารสแตนดาร์ดชาร์เตอร์ด(ไทย) จำกัด (มหาชน)     CMBT=ธนาคาร ซีไอเอ็มบี ไทย จำกัด (มหาชน)     RHB=ธนาคาร อาร์ เอช บี จำกัด     UOBT=ธนาคารยูโอบี จำกัด (มหาชน)     BAY=ธนาคารกรุงศรีอยุธยา จำกัด (มหาชน)     MEGA=ธนาคารเมกะ สากลพาณิชย์ จำกัด (มหาชน)     BOA=ธนาคารแห่งอเมริกา เนชั่นแนล แอสโซซิเอชั่น     IOB=ธนาคารอินเดียนโอเวอร์ซีส์     GSB=ธนาคารออมสิน     HSBC=ธนาคารฮ่องกงและเซี่ยงไฮ้แบงกิ้ง คอร์ปอเรชั่น จำกัด     DB=ธนาคารดอยซ์แบงก์     GHB=ธนาคารอาคารสงเคราะห์     BAAC=ธนาคารเพื่อการเกษตรและสหกรณ์     EXIM=ธนาคารเพื่อการส่งออกและนำเข้าแห่งประเทศไทย     MHCB=ธนาคารมิซูโฮ จำกัด     BNPP=ธนาคารบีเอ็นพี พารีบาส์     BOC=ธนาคารแห่งประเทศจีน จำกัด     ISBT=ธนาคารอิสลามแห่งประเทศไทย     TSCO=ธนาคารทิสโก้ จำกัด (มหาชน)     KKP=ธนาคารเกียรตินาคินภัทร จำกัด (มหาชน)     ICBC=ธนาคารไอซีบีซี (ไทย) จำกัด (มหาชน)     TCRB=ธนาคารไทยเครดิต จำกัด (มหาชน)     LHB=ธนาคารแลนด์ แอนด์ เฮ้าส์ จำกัด (มหาชน)     SMTB=ธนาคารซูมิโตโม มิตซุย ทรัสต์ (ไทย) จำกัด (มหาชน)     SME=ธนาคารพัฒนาวิสาหกิจขนาดกลางและขนาดย่อมแห่งประเทศไทย
    set test variable   ${bank_dict}
    set test variable   ${bank_name_dict}
    Open Excel Document      filename=${CURDIR}/Mastercase_Template.xlsx   doc_id=docname1
    ${master_case_id}=    create master case id of bank name '${BANK_NAME}'
    set test variable   ${master_case_id}
    Write Excel Cell	3   1    ${master_case_id}    sheet_name=CreateBankCase
    ${polics_date}=    create polics date 'before_create_case'
    ${polics_time}=    create polics time 'random'
    ${polics_case_id}=    create polics case id 'random' total '50' digit
    ${police_section}=    การตรวจพบรายการ คือ 'ผู้เสียหายแจ้งเอง มาตรา 7'
    Write Excel Cell	3   2    ${polics_date}    sheet_name=CreateBankCase
    Write Excel Cell	3   3    ${polics_time}    sheet_name=CreateBankCase
    Write Excel Cell	3   4    ${polics_case_id}    sheet_name=CreateBankCase
    Write Excel Cell	3   5    ${police_section}    sheet_name=CreateBankCase
    ${police_section}=    การตรวจพบรายการ คือ 'ผู้เสียหายแจ้งเอง มาตรา 7'
    Write Excel Cell	3   5    ${police_section}    sheet_name=CreateBankCase
    set test variable    ${master_file_name}    Mastercase_${master_case_id}
    Save Excel Document      filename=${CURDIR}/${FOLDER}/${master_file_name}.xlsx
    Close Current Excel Document
    set test variable    ${test_case_name}    ${FOLDER}
    Create victim information condition 2 '${FOLDER}/${master_file_name}' of bank name '${bank_name_dict}[${BANK_NAME}]'
    Create transaction to banks '${HORSE_LIST}' in '${FOLDER}/${master_file_name}' con 2 Personal null
    Add Master Case via API '${FOLDER}/${master_file_name}' bank name '${BANK_NAME}'

Create Master Case for condition 2 File '${FOLDER}' from bank name '${BANK_NAME}' to '${HORSE_LIST}' บุคคลคนเดียวกันเปลี่ยนชื่อ
    Create Directory     ${CURDIR}/${FOLDER}
    ${bank_dict} =    Create Dictionary    ธนาคารกรุงเทพ จำกัด (มหาชน)=BBL    ธนาคารกสิกรไทย จำกัด (มหาชน)=KBNK    ธนาคารกรุงไทย จำกัด (มหาชน)=KTB    ธนาคาร เจพีมอร์แกน เชส=JPMC    ธนาคาร โอเวอร์ซี-ไชนีสแบงกิ้งคอร์ปอเรชั่น จํากัด=OCBC    ธนาคารทหารไทยธนชาต จำกัด (มหาชน)=TTB    ธนาคารไทยพาณิชย์ จำกัด (มหาชน)=SCB    ธนาคารซิตี้แบงก์=CITI    ธนาคารซูมิโตโม มิตซุย แบงกิ้ง คอร์ปอเรชั่น=SMBC    ธนาคารสแตนดาร์ดชาร์เตอร์ด(ไทย) จำกัด (มหาชน)=SCBT    ธนาคาร ซีไอเอ็มบี ไทย จำกัด (มหาชน)=CMBT    ธนาคาร อาร์ เอช บี จำกัด=RHB    ธนาคารยูโอบี จำกัด (มหาชน)=UOBT    ธนาคารกรุงศรีอยุธยา จำกัด (มหาชน)=BAY    ธนาคารเมกะ สากลพาณิชย์ จำกัด (มหาชน)=MEGA    ธนาคารแห่งอเมริกา เนชั่นแนล แอสโซซิเอชั่น=BOA    ธนาคารอินเดียนโอเวอร์ซีส์=IOB    ธนาคารออมสิน=GSB    ธนาคารฮ่องกงและเซี่ยงไฮ้แบงกิ้ง คอร์ปอเรชั่น จำกัด=HSBC    ธนาคารดอยซ์แบงก์=DB    ธนาคารอาคารสงเคราะห์=GHB    ธนาคารเพื่อการเกษตรและสหกรณ์=BAAC    ธนาคารเพื่อการส่งออกและนำเข้าแห่งประเทศไทย=EXIM    ธนาคารมิซูโฮ จำกัด=MHCB    ธนาคารบีเอ็นพี พารีบาส์=BNPP    ธนาคารแห่งประเทศจีน จำกัด=BOC    ธนาคารอิสลามแห่งประเทศไทย=ISBT    ธนาคารทิสโก้ จำกัด (มหาชน)=TSCO    ธนาคารเกียรตินาคินภัทร จำกัด (มหาชน)=KKP    ธนาคารไอซีบีซี (ไทย) จำกัด (มหาชน)=ICBC    ธนาคารไทยเครดิต จำกัด (มหาชน)=TCRB    ธนาคารแลนด์ แอนด์ เฮ้าส์ จำกัด (มหาชน)=LHB    ธนาคารซูมิโตโม มิตซุย ทรัสต์ (ไทย) จำกัด (มหาชน)=SMTB    ธนาคารพัฒนาวิสาหกิจขนาดกลางและขนาดย่อมแห่งประเทศไทย=SME
    ${bank_name_dict} =    Create Dictionary    BBL=ธนาคารกรุงเทพ จำกัด (มหาชน)     KBNK=ธนาคารกสิกรไทย จำกัด (มหาชน)    KTB=ธนาคารกรุงไทย จำกัด (มหาชน)    JPMC=ธนาคาร เจพีมอร์แกน เชส    OCBC=ธนาคาร โอเวอร์ซี-ไชนีสแบงกิ้งคอร์ปอเรชั่น จํากัด    TTB=ธนาคารทหารไทยธนชาต จำกัด (มหาชน)     SCB=ธนาคารไทยพาณิชย์ จำกัด (มหาชน)     CITI=ธนาคารซิตี้แบงก์     SMBC=ธนาคารซูมิโตโม มิตซุย แบงกิ้ง คอร์ปอเรชั่น     SCBT=ธนาคารสแตนดาร์ดชาร์เตอร์ด(ไทย) จำกัด (มหาชน)     CMBT=ธนาคาร ซีไอเอ็มบี ไทย จำกัด (มหาชน)     RHB=ธนาคาร อาร์ เอช บี จำกัด     UOBT=ธนาคารยูโอบี จำกัด (มหาชน)     BAY=ธนาคารกรุงศรีอยุธยา จำกัด (มหาชน)     MEGA=ธนาคารเมกะ สากลพาณิชย์ จำกัด (มหาชน)     BOA=ธนาคารแห่งอเมริกา เนชั่นแนล แอสโซซิเอชั่น     IOB=ธนาคารอินเดียนโอเวอร์ซีส์     GSB=ธนาคารออมสิน     HSBC=ธนาคารฮ่องกงและเซี่ยงไฮ้แบงกิ้ง คอร์ปอเรชั่น จำกัด     DB=ธนาคารดอยซ์แบงก์     GHB=ธนาคารอาคารสงเคราะห์     BAAC=ธนาคารเพื่อการเกษตรและสหกรณ์     EXIM=ธนาคารเพื่อการส่งออกและนำเข้าแห่งประเทศไทย     MHCB=ธนาคารมิซูโฮ จำกัด     BNPP=ธนาคารบีเอ็นพี พารีบาส์     BOC=ธนาคารแห่งประเทศจีน จำกัด     ISBT=ธนาคารอิสลามแห่งประเทศไทย     TSCO=ธนาคารทิสโก้ จำกัด (มหาชน)     KKP=ธนาคารเกียรตินาคินภัทร จำกัด (มหาชน)     ICBC=ธนาคารไอซีบีซี (ไทย) จำกัด (มหาชน)     TCRB=ธนาคารไทยเครดิต จำกัด (มหาชน)     LHB=ธนาคารแลนด์ แอนด์ เฮ้าส์ จำกัด (มหาชน)     SMTB=ธนาคารซูมิโตโม มิตซุย ทรัสต์ (ไทย) จำกัด (มหาชน)     SME=ธนาคารพัฒนาวิสาหกิจขนาดกลางและขนาดย่อมแห่งประเทศไทย
    set test variable   ${bank_dict}
    set test variable   ${bank_name_dict}
    Open Excel Document      filename=${CURDIR}/Mastercase_Template.xlsx   doc_id=docname1
    ${master_case_id}=    create master case id of bank name '${BANK_NAME}'
    set test variable   ${master_case_id}
    Write Excel Cell	3   1    ${master_case_id}    sheet_name=CreateBankCase
    ${polics_date}=    create polics date 'before_create_case'
    ${polics_time}=    create polics time 'random'
    ${polics_case_id}=    create polics case id 'random' total '50' digit
    ${police_section}=    การตรวจพบรายการ คือ 'ผู้เสียหายแจ้งเอง มาตรา 7'
    Write Excel Cell	3   2    ${polics_date}    sheet_name=CreateBankCase
    Write Excel Cell	3   3    ${polics_time}    sheet_name=CreateBankCase
    Write Excel Cell	3   4    ${polics_case_id}    sheet_name=CreateBankCase
    Write Excel Cell	3   5    ${police_section}    sheet_name=CreateBankCase
    ${police_section}=    การตรวจพบรายการ คือ 'ผู้เสียหายแจ้งเอง มาตรา 7'
    Write Excel Cell	3   5    ${police_section}    sheet_name=CreateBankCase
    set test variable    ${master_file_name}    Mastercase_${master_case_id}
    Save Excel Document      filename=${CURDIR}/${FOLDER}/${master_file_name}.xlsx
    Close Current Excel Document
    set test variable    ${test_case_name}    ${FOLDER}
    Create victim information condition 2 '${FOLDER}/${master_file_name}' of bank name '${bank_name_dict}[${BANK_NAME}]'
    Create transaction to banks ทีเคยออกรายการแล้ว '${HORSE_LIST}' in '${FOLDER}/${master_file_name}' บุคคลคนเดียวกันเปลี่ยนชื่อ
    Add Master Case via API '${FOLDER}/${master_file_name}' bank name '${BANK_NAME}'

Create Master Case for condition 2 File '${FOLDER}' from bank name '${BANK_NAME}' to '${HORSE_LIST}' บุคคลเก่าและบัญชีเก่า
    Create Directory     ${CURDIR}/${FOLDER}
    ${bank_dict} =    Create Dictionary    ธนาคารกรุงเทพ จำกัด (มหาชน)=BBL    ธนาคารกสิกรไทย จำกัด (มหาชน)=KBNK    ธนาคารกรุงไทย จำกัด (มหาชน)=KTB    ธนาคาร เจพีมอร์แกน เชส=JPMC    ธนาคาร โอเวอร์ซี-ไชนีสแบงกิ้งคอร์ปอเรชั่น จํากัด=OCBC    ธนาคารทหารไทยธนชาต จำกัด (มหาชน)=TTB    ธนาคารไทยพาณิชย์ จำกัด (มหาชน)=SCB    ธนาคารซิตี้แบงก์=CITI    ธนาคารซูมิโตโม มิตซุย แบงกิ้ง คอร์ปอเรชั่น=SMBC    ธนาคารสแตนดาร์ดชาร์เตอร์ด(ไทย) จำกัด (มหาชน)=SCBT    ธนาคาร ซีไอเอ็มบี ไทย จำกัด (มหาชน)=CMBT    ธนาคาร อาร์ เอช บี จำกัด=RHB    ธนาคารยูโอบี จำกัด (มหาชน)=UOBT    ธนาคารกรุงศรีอยุธยา จำกัด (มหาชน)=BAY    ธนาคารเมกะ สากลพาณิชย์ จำกัด (มหาชน)=MEGA    ธนาคารแห่งอเมริกา เนชั่นแนล แอสโซซิเอชั่น=BOA    ธนาคารอินเดียนโอเวอร์ซีส์=IOB    ธนาคารออมสิน=GSB    ธนาคารฮ่องกงและเซี่ยงไฮ้แบงกิ้ง คอร์ปอเรชั่น จำกัด=HSBC    ธนาคารดอยซ์แบงก์=DB    ธนาคารอาคารสงเคราะห์=GHB    ธนาคารเพื่อการเกษตรและสหกรณ์=BAAC    ธนาคารเพื่อการส่งออกและนำเข้าแห่งประเทศไทย=EXIM    ธนาคารมิซูโฮ จำกัด=MHCB    ธนาคารบีเอ็นพี พารีบาส์=BNPP    ธนาคารแห่งประเทศจีน จำกัด=BOC    ธนาคารอิสลามแห่งประเทศไทย=ISBT    ธนาคารทิสโก้ จำกัด (มหาชน)=TSCO    ธนาคารเกียรตินาคินภัทร จำกัด (มหาชน)=KKP    ธนาคารไอซีบีซี (ไทย) จำกัด (มหาชน)=ICBC    ธนาคารไทยเครดิต จำกัด (มหาชน)=TCRB    ธนาคารแลนด์ แอนด์ เฮ้าส์ จำกัด (มหาชน)=LHB    ธนาคารซูมิโตโม มิตซุย ทรัสต์ (ไทย) จำกัด (มหาชน)=SMTB    ธนาคารพัฒนาวิสาหกิจขนาดกลางและขนาดย่อมแห่งประเทศไทย=SME
    ${bank_name_dict} =    Create Dictionary    BBL=ธนาคารกรุงเทพ จำกัด (มหาชน)     KBNK=ธนาคารกสิกรไทย จำกัด (มหาชน)    KTB=ธนาคารกรุงไทย จำกัด (มหาชน)    JPMC=ธนาคาร เจพีมอร์แกน เชส    OCBC=ธนาคาร โอเวอร์ซี-ไชนีสแบงกิ้งคอร์ปอเรชั่น จํากัด    TTB=ธนาคารทหารไทยธนชาต จำกัด (มหาชน)     SCB=ธนาคารไทยพาณิชย์ จำกัด (มหาชน)     CITI=ธนาคารซิตี้แบงก์     SMBC=ธนาคารซูมิโตโม มิตซุย แบงกิ้ง คอร์ปอเรชั่น     SCBT=ธนาคารสแตนดาร์ดชาร์เตอร์ด(ไทย) จำกัด (มหาชน)     CMBT=ธนาคาร ซีไอเอ็มบี ไทย จำกัด (มหาชน)     RHB=ธนาคาร อาร์ เอช บี จำกัด     UOBT=ธนาคารยูโอบี จำกัด (มหาชน)     BAY=ธนาคารกรุงศรีอยุธยา จำกัด (มหาชน)     MEGA=ธนาคารเมกะ สากลพาณิชย์ จำกัด (มหาชน)     BOA=ธนาคารแห่งอเมริกา เนชั่นแนล แอสโซซิเอชั่น     IOB=ธนาคารอินเดียนโอเวอร์ซีส์     GSB=ธนาคารออมสิน     HSBC=ธนาคารฮ่องกงและเซี่ยงไฮ้แบงกิ้ง คอร์ปอเรชั่น จำกัด     DB=ธนาคารดอยซ์แบงก์     GHB=ธนาคารอาคารสงเคราะห์     BAAC=ธนาคารเพื่อการเกษตรและสหกรณ์     EXIM=ธนาคารเพื่อการส่งออกและนำเข้าแห่งประเทศไทย     MHCB=ธนาคารมิซูโฮ จำกัด     BNPP=ธนาคารบีเอ็นพี พารีบาส์     BOC=ธนาคารแห่งประเทศจีน จำกัด     ISBT=ธนาคารอิสลามแห่งประเทศไทย     TSCO=ธนาคารทิสโก้ จำกัด (มหาชน)     KKP=ธนาคารเกียรตินาคินภัทร จำกัด (มหาชน)     ICBC=ธนาคารไอซีบีซี (ไทย) จำกัด (มหาชน)     TCRB=ธนาคารไทยเครดิต จำกัด (มหาชน)     LHB=ธนาคารแลนด์ แอนด์ เฮ้าส์ จำกัด (มหาชน)     SMTB=ธนาคารซูมิโตโม มิตซุย ทรัสต์ (ไทย) จำกัด (มหาชน)     SME=ธนาคารพัฒนาวิสาหกิจขนาดกลางและขนาดย่อมแห่งประเทศไทย
    set test variable   ${bank_dict}
    set test variable   ${bank_name_dict}
    Open Excel Document      filename=${CURDIR}/Mastercase_Template.xlsx   doc_id=docname1
    ${master_case_id}=    create master case id of bank name '${BANK_NAME}'
    set test variable   ${master_case_id}
    Write Excel Cell	3   1    ${master_case_id}    sheet_name=CreateBankCase
    ${polics_date}=    create polics date 'before_create_case'
    ${polics_time}=    create polics time 'random'
    ${polics_case_id}=    create polics case id 'random' total '50' digit
    ${police_section}=    การตรวจพบรายการ คือ 'ผู้เสียหายแจ้งเอง มาตรา 7'
    Write Excel Cell	3   2    ${polics_date}    sheet_name=CreateBankCase
    Write Excel Cell	3   3    ${polics_time}    sheet_name=CreateBankCase
    Write Excel Cell	3   4    ${polics_case_id}    sheet_name=CreateBankCase
    Write Excel Cell	3   5    ${police_section}    sheet_name=CreateBankCase
    ${police_section}=    การตรวจพบรายการ คือ 'ผู้เสียหายแจ้งเอง มาตรา 7'
    Write Excel Cell	3   5    ${police_section}    sheet_name=CreateBankCase
    set test variable    ${master_file_name}    Mastercase_${master_case_id}
    Save Excel Document      filename=${CURDIR}/${FOLDER}/${master_file_name}.xlsx
    Close Current Excel Document
    set test variable    ${test_case_name}    ${FOLDER}
    Create victim information condition 2 '${FOLDER}/${master_file_name}' of bank name '${bank_name_dict}[${BANK_NAME}]'
    Create transaction to banks ทีเคยออกรายการแล้ว '${HORSE_LIST}' in '${FOLDER}/${master_file_name}' บุคคลเก่าและบัญชีเก่า
    Add Master Case via API '${FOLDER}/${master_file_name}' bank name '${BANK_NAME}'

Create Master Case for condition 2 File '${FOLDER}' from bank name '${BANK_NAME}' to '${HORSE_LIST}' นิติบุคคล
    ${horse_list_dict} =    Create Dictionary
    set test variable   ${horse_list_dict}
    Create Directory     ${CURDIR}/${FOLDER}
    ${bank_dict} =    Create Dictionary    ธนาคารกรุงเทพ จำกัด (มหาชน)=BBL    ธนาคารกสิกรไทย จำกัด (มหาชน)=KBNK    ธนาคารกรุงไทย จำกัด (มหาชน)=KTB    ธนาคาร เจพีมอร์แกน เชส=JPMC    ธนาคาร โอเวอร์ซี-ไชนีสแบงกิ้งคอร์ปอเรชั่น จํากัด=OCBC    ธนาคารทหารไทยธนชาต จำกัด (มหาชน)=TTB    ธนาคารไทยพาณิชย์ จำกัด (มหาชน)=SCB    ธนาคารซิตี้แบงก์=CITI    ธนาคารซูมิโตโม มิตซุย แบงกิ้ง คอร์ปอเรชั่น=SMBC    ธนาคารสแตนดาร์ดชาร์เตอร์ด(ไทย) จำกัด (มหาชน)=SCBT    ธนาคาร ซีไอเอ็มบี ไทย จำกัด (มหาชน)=CMBT    ธนาคาร อาร์ เอช บี จำกัด=RHB    ธนาคารยูโอบี จำกัด (มหาชน)=UOBT    ธนาคารกรุงศรีอยุธยา จำกัด (มหาชน)=BAY    ธนาคารเมกะ สากลพาณิชย์ จำกัด (มหาชน)=MEGA    ธนาคารแห่งอเมริกา เนชั่นแนล แอสโซซิเอชั่น=BOA    ธนาคารอินเดียนโอเวอร์ซีส์=IOB    ธนาคารออมสิน=GSB    ธนาคารฮ่องกงและเซี่ยงไฮ้แบงกิ้ง คอร์ปอเรชั่น จำกัด=HSBC    ธนาคารดอยซ์แบงก์=DB    ธนาคารอาคารสงเคราะห์=GHB    ธนาคารเพื่อการเกษตรและสหกรณ์=BAAC    ธนาคารเพื่อการส่งออกและนำเข้าแห่งประเทศไทย=EXIM    ธนาคารมิซูโฮ จำกัด=MHCB    ธนาคารบีเอ็นพี พารีบาส์=BNPP    ธนาคารแห่งประเทศจีน จำกัด=BOC    ธนาคารอิสลามแห่งประเทศไทย=ISBT    ธนาคารทิสโก้ จำกัด (มหาชน)=TSCO    ธนาคารเกียรตินาคินภัทร จำกัด (มหาชน)=KKP    ธนาคารไอซีบีซี (ไทย) จำกัด (มหาชน)=ICBC    ธนาคารไทยเครดิต จำกัด (มหาชน)=TCRB    ธนาคารแลนด์ แอนด์ เฮ้าส์ จำกัด (มหาชน)=LHB    ธนาคารซูมิโตโม มิตซุย ทรัสต์ (ไทย) จำกัด (มหาชน)=SMTB    ธนาคารพัฒนาวิสาหกิจขนาดกลางและขนาดย่อมแห่งประเทศไทย=SME
    ${bank_name_dict} =    Create Dictionary    BBL=ธนาคารกรุงเทพ จำกัด (มหาชน)     KBNK=ธนาคารกสิกรไทย จำกัด (มหาชน)    KTB=ธนาคารกรุงไทย จำกัด (มหาชน)    JPMC=ธนาคาร เจพีมอร์แกน เชส    OCBC=ธนาคาร โอเวอร์ซี-ไชนีสแบงกิ้งคอร์ปอเรชั่น จํากัด    TTB=ธนาคารทหารไทยธนชาต จำกัด (มหาชน)     SCB=ธนาคารไทยพาณิชย์ จำกัด (มหาชน)     CITI=ธนาคารซิตี้แบงก์     SMBC=ธนาคารซูมิโตโม มิตซุย แบงกิ้ง คอร์ปอเรชั่น     SCBT=ธนาคารสแตนดาร์ดชาร์เตอร์ด(ไทย) จำกัด (มหาชน)     CMBT=ธนาคาร ซีไอเอ็มบี ไทย จำกัด (มหาชน)     RHB=ธนาคาร อาร์ เอช บี จำกัด     UOBT=ธนาคารยูโอบี จำกัด (มหาชน)     BAY=ธนาคารกรุงศรีอยุธยา จำกัด (มหาชน)     MEGA=ธนาคารเมกะ สากลพาณิชย์ จำกัด (มหาชน)     BOA=ธนาคารแห่งอเมริกา เนชั่นแนล แอสโซซิเอชั่น     IOB=ธนาคารอินเดียนโอเวอร์ซีส์     GSB=ธนาคารออมสิน     HSBC=ธนาคารฮ่องกงและเซี่ยงไฮ้แบงกิ้ง คอร์ปอเรชั่น จำกัด     DB=ธนาคารดอยซ์แบงก์     GHB=ธนาคารอาคารสงเคราะห์     BAAC=ธนาคารเพื่อการเกษตรและสหกรณ์     EXIM=ธนาคารเพื่อการส่งออกและนำเข้าแห่งประเทศไทย     MHCB=ธนาคารมิซูโฮ จำกัด     BNPP=ธนาคารบีเอ็นพี พารีบาส์     BOC=ธนาคารแห่งประเทศจีน จำกัด     ISBT=ธนาคารอิสลามแห่งประเทศไทย     TSCO=ธนาคารทิสโก้ จำกัด (มหาชน)     KKP=ธนาคารเกียรตินาคินภัทร จำกัด (มหาชน)     ICBC=ธนาคารไอซีบีซี (ไทย) จำกัด (มหาชน)     TCRB=ธนาคารไทยเครดิต จำกัด (มหาชน)     LHB=ธนาคารแลนด์ แอนด์ เฮ้าส์ จำกัด (มหาชน)     SMTB=ธนาคารซูมิโตโม มิตซุย ทรัสต์ (ไทย) จำกัด (มหาชน)     SME=ธนาคารพัฒนาวิสาหกิจขนาดกลางและขนาดย่อมแห่งประเทศไทย
    set test variable   ${bank_dict}
    set test variable   ${bank_name_dict}
    Open Excel Document      filename=${CURDIR}/Mastercase_Template.xlsx   doc_id=docname1
    ${master_case_id}=    create master case id of bank name '${BANK_NAME}'
    set test variable   ${master_case_id}
    Write Excel Cell	3   1    ${master_case_id}    sheet_name=CreateBankCase
    ${polics_date}=    create polics date 'before_create_case'
    ${polics_time}=    create polics time 'random'
    ${polics_case_id}=    create polics case id 'random' total '50' digit
    ${police_section}=    การตรวจพบรายการ คือ 'ผู้เสียหายแจ้งเอง มาตรา 7'
    Write Excel Cell	3   2    ${polics_date}    sheet_name=CreateBankCase
    Write Excel Cell	3   3    ${polics_time}    sheet_name=CreateBankCase
    Write Excel Cell	3   4    ${polics_case_id}    sheet_name=CreateBankCase
    Write Excel Cell	3   5    ${police_section}    sheet_name=CreateBankCase
    ${police_section}=    การตรวจพบรายการ คือ 'ผู้เสียหายแจ้งเอง มาตรา 7'
    Write Excel Cell	3   5    ${police_section}    sheet_name=CreateBankCase
    set test variable    ${master_file_name}    Mastercase_${master_case_id}
    Save Excel Document      filename=${CURDIR}/${FOLDER}/${master_file_name}.xlsx
    Close Current Excel Document
    set test variable    ${test_case_name}    ${FOLDER}
    Create victim information condition 2 '${FOLDER}/${master_file_name}' of bank name '${bank_name_dict}[${BANK_NAME}]'
    Create transaction to banks '${HORSE_LIST}' in '${FOLDER}/${master_file_name}' นิติบุคคล
    Add Master Case via API '${FOLDER}/${master_file_name}' bank name '${BANK_NAME}'

Create Master Case for condition 2 File '${FOLDER}' from bank name '${BANK_NAME}' to '${HORSE_LIST}' ชาวต่างชาติ
    ${horse_list_dict} =    Create Dictionary
    set test variable   ${horse_list_dict}
    Create Directory     ${CURDIR}/${FOLDER}
    ${bank_dict} =    Create Dictionary    ธนาคารกรุงเทพ จำกัด (มหาชน)=BBL    ธนาคารกสิกรไทย จำกัด (มหาชน)=KBNK    ธนาคารกรุงไทย จำกัด (มหาชน)=KTB    ธนาคาร เจพีมอร์แกน เชส=JPMC    ธนาคาร โอเวอร์ซี-ไชนีสแบงกิ้งคอร์ปอเรชั่น จํากัด=OCBC    ธนาคารทหารไทยธนชาต จำกัด (มหาชน)=TTB    ธนาคารไทยพาณิชย์ จำกัด (มหาชน)=SCB    ธนาคารซิตี้แบงก์=CITI    ธนาคารซูมิโตโม มิตซุย แบงกิ้ง คอร์ปอเรชั่น=SMBC    ธนาคารสแตนดาร์ดชาร์เตอร์ด(ไทย) จำกัด (มหาชน)=SCBT    ธนาคาร ซีไอเอ็มบี ไทย จำกัด (มหาชน)=CMBT    ธนาคาร อาร์ เอช บี จำกัด=RHB    ธนาคารยูโอบี จำกัด (มหาชน)=UOBT    ธนาคารกรุงศรีอยุธยา จำกัด (มหาชน)=BAY    ธนาคารเมกะ สากลพาณิชย์ จำกัด (มหาชน)=MEGA    ธนาคารแห่งอเมริกา เนชั่นแนล แอสโซซิเอชั่น=BOA    ธนาคารอินเดียนโอเวอร์ซีส์=IOB    ธนาคารออมสิน=GSB    ธนาคารฮ่องกงและเซี่ยงไฮ้แบงกิ้ง คอร์ปอเรชั่น จำกัด=HSBC    ธนาคารดอยซ์แบงก์=DB    ธนาคารอาคารสงเคราะห์=GHB    ธนาคารเพื่อการเกษตรและสหกรณ์=BAAC    ธนาคารเพื่อการส่งออกและนำเข้าแห่งประเทศไทย=EXIM    ธนาคารมิซูโฮ จำกัด=MHCB    ธนาคารบีเอ็นพี พารีบาส์=BNPP    ธนาคารแห่งประเทศจีน จำกัด=BOC    ธนาคารอิสลามแห่งประเทศไทย=ISBT    ธนาคารทิสโก้ จำกัด (มหาชน)=TSCO    ธนาคารเกียรตินาคินภัทร จำกัด (มหาชน)=KKP    ธนาคารไอซีบีซี (ไทย) จำกัด (มหาชน)=ICBC    ธนาคารไทยเครดิต จำกัด (มหาชน)=TCRB    ธนาคารแลนด์ แอนด์ เฮ้าส์ จำกัด (มหาชน)=LHB    ธนาคารซูมิโตโม มิตซุย ทรัสต์ (ไทย) จำกัด (มหาชน)=SMTB    ธนาคารพัฒนาวิสาหกิจขนาดกลางและขนาดย่อมแห่งประเทศไทย=SME
    ${bank_name_dict} =    Create Dictionary    BBL=ธนาคารกรุงเทพ จำกัด (มหาชน)     KBNK=ธนาคารกสิกรไทย จำกัด (มหาชน)    KTB=ธนาคารกรุงไทย จำกัด (มหาชน)    JPMC=ธนาคาร เจพีมอร์แกน เชส    OCBC=ธนาคาร โอเวอร์ซี-ไชนีสแบงกิ้งคอร์ปอเรชั่น จํากัด    TTB=ธนาคารทหารไทยธนชาต จำกัด (มหาชน)     SCB=ธนาคารไทยพาณิชย์ จำกัด (มหาชน)     CITI=ธนาคารซิตี้แบงก์     SMBC=ธนาคารซูมิโตโม มิตซุย แบงกิ้ง คอร์ปอเรชั่น     SCBT=ธนาคารสแตนดาร์ดชาร์เตอร์ด(ไทย) จำกัด (มหาชน)     CMBT=ธนาคาร ซีไอเอ็มบี ไทย จำกัด (มหาชน)     RHB=ธนาคาร อาร์ เอช บี จำกัด     UOBT=ธนาคารยูโอบี จำกัด (มหาชน)     BAY=ธนาคารกรุงศรีอยุธยา จำกัด (มหาชน)     MEGA=ธนาคารเมกะ สากลพาณิชย์ จำกัด (มหาชน)     BOA=ธนาคารแห่งอเมริกา เนชั่นแนล แอสโซซิเอชั่น     IOB=ธนาคารอินเดียนโอเวอร์ซีส์     GSB=ธนาคารออมสิน     HSBC=ธนาคารฮ่องกงและเซี่ยงไฮ้แบงกิ้ง คอร์ปอเรชั่น จำกัด     DB=ธนาคารดอยซ์แบงก์     GHB=ธนาคารอาคารสงเคราะห์     BAAC=ธนาคารเพื่อการเกษตรและสหกรณ์     EXIM=ธนาคารเพื่อการส่งออกและนำเข้าแห่งประเทศไทย     MHCB=ธนาคารมิซูโฮ จำกัด     BNPP=ธนาคารบีเอ็นพี พารีบาส์     BOC=ธนาคารแห่งประเทศจีน จำกัด     ISBT=ธนาคารอิสลามแห่งประเทศไทย     TSCO=ธนาคารทิสโก้ จำกัด (มหาชน)     KKP=ธนาคารเกียรตินาคินภัทร จำกัด (มหาชน)     ICBC=ธนาคารไอซีบีซี (ไทย) จำกัด (มหาชน)     TCRB=ธนาคารไทยเครดิต จำกัด (มหาชน)     LHB=ธนาคารแลนด์ แอนด์ เฮ้าส์ จำกัด (มหาชน)     SMTB=ธนาคารซูมิโตโม มิตซุย ทรัสต์ (ไทย) จำกัด (มหาชน)     SME=ธนาคารพัฒนาวิสาหกิจขนาดกลางและขนาดย่อมแห่งประเทศไทย
    set test variable   ${bank_dict}
    set test variable   ${bank_name_dict}
    Open Excel Document      filename=${CURDIR}/Mastercase_Template.xlsx   doc_id=docname1
    ${master_case_id}=    create master case id of bank name '${BANK_NAME}'
    set test variable   ${master_case_id}
    Write Excel Cell	3   1    ${master_case_id}    sheet_name=CreateBankCase
    ${polics_date}=    create polics date 'before_create_case'
    ${polics_time}=    create polics time 'random'
    ${polics_case_id}=    create polics case id 'random' total '50' digit
    ${police_section}=    การตรวจพบรายการ คือ 'ผู้เสียหายแจ้งเอง มาตรา 7'
    Write Excel Cell	3   2    ${polics_date}    sheet_name=CreateBankCase
    Write Excel Cell	3   3    ${polics_time}    sheet_name=CreateBankCase
    Write Excel Cell	3   4    ${polics_case_id}    sheet_name=CreateBankCase
    Write Excel Cell	3   5    ${police_section}    sheet_name=CreateBankCase
    ${police_section}=    การตรวจพบรายการ คือ 'ผู้เสียหายแจ้งเอง มาตรา 7'
    Write Excel Cell	3   5    ${police_section}    sheet_name=CreateBankCase
    set test variable    ${master_file_name}    Mastercase_${master_case_id}
    Save Excel Document      filename=${CURDIR}/${FOLDER}/${master_file_name}.xlsx
    Close Current Excel Document
    set test variable    ${test_case_name}    ${FOLDER}
    Create victim information condition 2 '${FOLDER}/${master_file_name}' of bank name '${bank_name_dict}[${BANK_NAME}]'
    Create transaction to banks '${HORSE_LIST}' in '${FOLDER}/${master_file_name}' ชาวต่างชาติ
    Add Master Case via API '${FOLDER}/${master_file_name}' bank name '${BANK_NAME}'

Set info Case Dictionary
    ${horse_list_dict} =    Create Dictionary
    set test variable   ${horse_list_dict}

Create Master Case for condition 3 บุคคลเก่าและบัญชีใหม่ ยังไม่เคยออกรายงาน บุคคลคนเดียวกันเปลี่ยนชื่อ File '${FOLDER}' from bank name '${BANK_NAME}' to '${HORSE_LIST}'
    Create Directory     ${CURDIR}/${FOLDER}
    ${bank_dict} =    Create Dictionary    ธนาคารกรุงเทพ จำกัด (มหาชน)=BBL    ธนาคารกสิกรไทย จำกัด (มหาชน)=KBNK    ธนาคารกรุงไทย จำกัด (มหาชน)=KTB    ธนาคาร เจพีมอร์แกน เชส=JPMC    ธนาคาร โอเวอร์ซี-ไชนีสแบงกิ้งคอร์ปอเรชั่น จํากัด=OCBC    ธนาคารทหารไทยธนชาต จำกัด (มหาชน)=TTB    ธนาคารไทยพาณิชย์ จำกัด (มหาชน)=SCB    ธนาคารซิตี้แบงก์=CITI    ธนาคารซูมิโตโม มิตซุย แบงกิ้ง คอร์ปอเรชั่น=SMBC    ธนาคารสแตนดาร์ดชาร์เตอร์ด(ไทย) จำกัด (มหาชน)=SCBT    ธนาคาร ซีไอเอ็มบี ไทย จำกัด (มหาชน)=CMBT    ธนาคาร อาร์ เอช บี จำกัด=RHB    ธนาคารยูโอบี จำกัด (มหาชน)=UOBT    ธนาคารกรุงศรีอยุธยา จำกัด (มหาชน)=BAY    ธนาคารเมกะ สากลพาณิชย์ จำกัด (มหาชน)=MEGA    ธนาคารแห่งอเมริกา เนชั่นแนล แอสโซซิเอชั่น=BOA    ธนาคารอินเดียนโอเวอร์ซีส์=IOB    ธนาคารออมสิน=GSB    ธนาคารฮ่องกงและเซี่ยงไฮ้แบงกิ้ง คอร์ปอเรชั่น จำกัด=HSBC    ธนาคารดอยซ์แบงก์=DB    ธนาคารอาคารสงเคราะห์=GHB    ธนาคารเพื่อการเกษตรและสหกรณ์=BAAC    ธนาคารเพื่อการส่งออกและนำเข้าแห่งประเทศไทย=EXIM    ธนาคารมิซูโฮ จำกัด=MHCB    ธนาคารบีเอ็นพี พารีบาส์=BNPP    ธนาคารแห่งประเทศจีน จำกัด=BOC    ธนาคารอิสลามแห่งประเทศไทย=ISBT    ธนาคารทิสโก้ จำกัด (มหาชน)=TSCO    ธนาคารเกียรตินาคินภัทร จำกัด (มหาชน)=KKP    ธนาคารไอซีบีซี (ไทย) จำกัด (มหาชน)=ICBC    ธนาคารไทยเครดิต จำกัด (มหาชน)=TCRB    ธนาคารแลนด์ แอนด์ เฮ้าส์ จำกัด (มหาชน)=LHB    ธนาคารซูมิโตโม มิตซุย ทรัสต์ (ไทย) จำกัด (มหาชน)=SMTB    ธนาคารพัฒนาวิสาหกิจขนาดกลางและขนาดย่อมแห่งประเทศไทย=SME
    ${bank_name_dict} =    Create Dictionary    BBL=ธนาคารกรุงเทพ จำกัด (มหาชน)     KBNK=ธนาคารกสิกรไทย จำกัด (มหาชน)    KTB=ธนาคารกรุงไทย จำกัด (มหาชน)    JPMC=ธนาคาร เจพีมอร์แกน เชส    OCBC=ธนาคาร โอเวอร์ซี-ไชนีสแบงกิ้งคอร์ปอเรชั่น จํากัด    TTB=ธนาคารทหารไทยธนชาต จำกัด (มหาชน)     SCB=ธนาคารไทยพาณิชย์ จำกัด (มหาชน)     CITI=ธนาคารซิตี้แบงก์     SMBC=ธนาคารซูมิโตโม มิตซุย แบงกิ้ง คอร์ปอเรชั่น     SCBT=ธนาคารสแตนดาร์ดชาร์เตอร์ด(ไทย) จำกัด (มหาชน)     CMBT=ธนาคาร ซีไอเอ็มบี ไทย จำกัด (มหาชน)     RHB=ธนาคาร อาร์ เอช บี จำกัด     UOBT=ธนาคารยูโอบี จำกัด (มหาชน)     BAY=ธนาคารกรุงศรีอยุธยา จำกัด (มหาชน)     MEGA=ธนาคารเมกะ สากลพาณิชย์ จำกัด (มหาชน)     BOA=ธนาคารแห่งอเมริกา เนชั่นแนล แอสโซซิเอชั่น     IOB=ธนาคารอินเดียนโอเวอร์ซีส์     GSB=ธนาคารออมสิน     HSBC=ธนาคารฮ่องกงและเซี่ยงไฮ้แบงกิ้ง คอร์ปอเรชั่น จำกัด     DB=ธนาคารดอยซ์แบงก์     GHB=ธนาคารอาคารสงเคราะห์     BAAC=ธนาคารเพื่อการเกษตรและสหกรณ์     EXIM=ธนาคารเพื่อการส่งออกและนำเข้าแห่งประเทศไทย     MHCB=ธนาคารมิซูโฮ จำกัด     BNPP=ธนาคารบีเอ็นพี พารีบาส์     BOC=ธนาคารแห่งประเทศจีน จำกัด     ISBT=ธนาคารอิสลามแห่งประเทศไทย     TSCO=ธนาคารทิสโก้ จำกัด (มหาชน)     KKP=ธนาคารเกียรตินาคินภัทร จำกัด (มหาชน)     ICBC=ธนาคารไอซีบีซี (ไทย) จำกัด (มหาชน)     TCRB=ธนาคารไทยเครดิต จำกัด (มหาชน)     LHB=ธนาคารแลนด์ แอนด์ เฮ้าส์ จำกัด (มหาชน)     SMTB=ธนาคารซูมิโตโม มิตซุย ทรัสต์ (ไทย) จำกัด (มหาชน)     SME=ธนาคารพัฒนาวิสาหกิจขนาดกลางและขนาดย่อมแห่งประเทศไทย
    set test variable   ${bank_dict}
    set test variable   ${bank_name_dict}
    Open Excel Document      filename=${CURDIR}/Mastercase_Template.xlsx   doc_id=docname1
    ${master_case_id}=    create master case id of bank name '${BANK_NAME}'
    set test variable   ${master_case_id}
    Write Excel Cell	3   1    ${master_case_id}    sheet_name=CreateBankCase
    ${police_section}=    การตรวจพบรายการ คือ 'ผู้เสียหายแจ้งเอง มาตรา 7'
    Write Excel Cell	3   5    ${police_section}    sheet_name=CreateBankCase
    ${police_section}=    การตรวจพบรายการ คือ 'ผู้เสียหายแจ้งเอง มาตรา 7'
    Write Excel Cell	3   5    ${police_section}    sheet_name=CreateBankCase
    set test variable    ${master_file_name}    Mastercase_${master_case_id}
    Save Excel Document      filename=${CURDIR}/${FOLDER}/${master_file_name}.xlsx
    Close Current Excel Document
    set test variable    ${test_case_name}    ${FOLDER}
    Create victim information condition 2 '${FOLDER}/${master_file_name}' of bank name '${bank_name_dict}[${BANK_NAME}]'
    Create transaction to banks บุคคลเก่าและบัญชีใหม่ ยังไม่เคยออกรายงาน บุคคลคนเดียวกันเปลี่ยนชื่อ '${HORSE_LIST}' in '${FOLDER}/${master_file_name}'
    Add Master Case via API '${FOLDER}/${master_file_name}' bank name '${BANK_NAME}'

Create Master Case for condition 3 บุคคลเก่าและบัญชีเก่าเคยออกรายงานด้วยเงื่อนไข เงื่อนไข 3 หรือ 4 File '${FOLDER}' from bank name '${BANK_NAME}' to '${HORSE_LIST}'
    Create Directory     ${CURDIR}/${FOLDER}
    ${bank_dict} =    Create Dictionary    ธนาคารกรุงเทพ จำกัด (มหาชน)=BBL    ธนาคารกสิกรไทย จำกัด (มหาชน)=KBNK    ธนาคารกรุงไทย จำกัด (มหาชน)=KTB    ธนาคาร เจพีมอร์แกน เชส=JPMC    ธนาคาร โอเวอร์ซี-ไชนีสแบงกิ้งคอร์ปอเรชั่น จํากัด=OCBC    ธนาคารทหารไทยธนชาต จำกัด (มหาชน)=TTB    ธนาคารไทยพาณิชย์ จำกัด (มหาชน)=SCB    ธนาคารซิตี้แบงก์=CITI    ธนาคารซูมิโตโม มิตซุย แบงกิ้ง คอร์ปอเรชั่น=SMBC    ธนาคารสแตนดาร์ดชาร์เตอร์ด(ไทย) จำกัด (มหาชน)=SCBT    ธนาคาร ซีไอเอ็มบี ไทย จำกัด (มหาชน)=CMBT    ธนาคาร อาร์ เอช บี จำกัด=RHB    ธนาคารยูโอบี จำกัด (มหาชน)=UOBT    ธนาคารกรุงศรีอยุธยา จำกัด (มหาชน)=BAY    ธนาคารเมกะ สากลพาณิชย์ จำกัด (มหาชน)=MEGA    ธนาคารแห่งอเมริกา เนชั่นแนล แอสโซซิเอชั่น=BOA    ธนาคารอินเดียนโอเวอร์ซีส์=IOB    ธนาคารออมสิน=GSB    ธนาคารฮ่องกงและเซี่ยงไฮ้แบงกิ้ง คอร์ปอเรชั่น จำกัด=HSBC    ธนาคารดอยซ์แบงก์=DB    ธนาคารอาคารสงเคราะห์=GHB    ธนาคารเพื่อการเกษตรและสหกรณ์=BAAC    ธนาคารเพื่อการส่งออกและนำเข้าแห่งประเทศไทย=EXIM    ธนาคารมิซูโฮ จำกัด=MHCB    ธนาคารบีเอ็นพี พารีบาส์=BNPP    ธนาคารแห่งประเทศจีน จำกัด=BOC    ธนาคารอิสลามแห่งประเทศไทย=ISBT    ธนาคารทิสโก้ จำกัด (มหาชน)=TSCO    ธนาคารเกียรตินาคินภัทร จำกัด (มหาชน)=KKP    ธนาคารไอซีบีซี (ไทย) จำกัด (มหาชน)=ICBC    ธนาคารไทยเครดิต จำกัด (มหาชน)=TCRB    ธนาคารแลนด์ แอนด์ เฮ้าส์ จำกัด (มหาชน)=LHB    ธนาคารซูมิโตโม มิตซุย ทรัสต์ (ไทย) จำกัด (มหาชน)=SMTB    ธนาคารพัฒนาวิสาหกิจขนาดกลางและขนาดย่อมแห่งประเทศไทย=SME
    ${bank_name_dict} =    Create Dictionary    BBL=ธนาคารกรุงเทพ จำกัด (มหาชน)     KBNK=ธนาคารกสิกรไทย จำกัด (มหาชน)    KTB=ธนาคารกรุงไทย จำกัด (มหาชน)    JPMC=ธนาคาร เจพีมอร์แกน เชส    OCBC=ธนาคาร โอเวอร์ซี-ไชนีสแบงกิ้งคอร์ปอเรชั่น จํากัด    TTB=ธนาคารทหารไทยธนชาต จำกัด (มหาชน)     SCB=ธนาคารไทยพาณิชย์ จำกัด (มหาชน)     CITI=ธนาคารซิตี้แบงก์     SMBC=ธนาคารซูมิโตโม มิตซุย แบงกิ้ง คอร์ปอเรชั่น     SCBT=ธนาคารสแตนดาร์ดชาร์เตอร์ด(ไทย) จำกัด (มหาชน)     CMBT=ธนาคาร ซีไอเอ็มบี ไทย จำกัด (มหาชน)     RHB=ธนาคาร อาร์ เอช บี จำกัด     UOBT=ธนาคารยูโอบี จำกัด (มหาชน)     BAY=ธนาคารกรุงศรีอยุธยา จำกัด (มหาชน)     MEGA=ธนาคารเมกะ สากลพาณิชย์ จำกัด (มหาชน)     BOA=ธนาคารแห่งอเมริกา เนชั่นแนล แอสโซซิเอชั่น     IOB=ธนาคารอินเดียนโอเวอร์ซีส์     GSB=ธนาคารออมสิน     HSBC=ธนาคารฮ่องกงและเซี่ยงไฮ้แบงกิ้ง คอร์ปอเรชั่น จำกัด     DB=ธนาคารดอยซ์แบงก์     GHB=ธนาคารอาคารสงเคราะห์     BAAC=ธนาคารเพื่อการเกษตรและสหกรณ์     EXIM=ธนาคารเพื่อการส่งออกและนำเข้าแห่งประเทศไทย     MHCB=ธนาคารมิซูโฮ จำกัด     BNPP=ธนาคารบีเอ็นพี พารีบาส์     BOC=ธนาคารแห่งประเทศจีน จำกัด     ISBT=ธนาคารอิสลามแห่งประเทศไทย     TSCO=ธนาคารทิสโก้ จำกัด (มหาชน)     KKP=ธนาคารเกียรตินาคินภัทร จำกัด (มหาชน)     ICBC=ธนาคารไอซีบีซี (ไทย) จำกัด (มหาชน)     TCRB=ธนาคารไทยเครดิต จำกัด (มหาชน)     LHB=ธนาคารแลนด์ แอนด์ เฮ้าส์ จำกัด (มหาชน)     SMTB=ธนาคารซูมิโตโม มิตซุย ทรัสต์ (ไทย) จำกัด (มหาชน)     SME=ธนาคารพัฒนาวิสาหกิจขนาดกลางและขนาดย่อมแห่งประเทศไทย
    set test variable   ${bank_dict}
    set test variable   ${bank_name_dict}
    Open Excel Document      filename=${CURDIR}/Mastercase_Template.xlsx   doc_id=docname1
    ${master_case_id}=    create master case id of bank name '${BANK_NAME}'
    set test variable   ${master_case_id}
    Write Excel Cell	3   1    ${master_case_id}    sheet_name=CreateBankCase
    ${police_section}=    การตรวจพบรายการ คือ 'ผู้เสียหายแจ้งเอง มาตรา 7'
    Write Excel Cell	3   5    ${police_section}    sheet_name=CreateBankCase
    ${police_section}=    การตรวจพบรายการ คือ 'ผู้เสียหายแจ้งเอง มาตรา 7'
    Write Excel Cell	3   5    ${police_section}    sheet_name=CreateBankCase
    set test variable    ${master_file_name}    Mastercase_${master_case_id}
    Save Excel Document      filename=${CURDIR}/${FOLDER}/${master_file_name}.xlsx
    Close Current Excel Document
    set test variable    ${test_case_name}    ${FOLDER}
    Create victim information condition 2 '${FOLDER}/${master_file_name}' of bank name '${bank_name_dict}[${BANK_NAME}]'
    Create transaction to banks บุคคลเก่าและบัญชีเก่าเคยออกรายงาน '${HORSE_LIST}' in '${FOLDER}/${master_file_name}'
    Add Master Case via API '${FOLDER}/${master_file_name}' bank name '${BANK_NAME}'

Create Master Case for condition 3 บุคคลเก่าและบัญชีเก่าเคยออกรายงาน บุคคลคนเดียวกันเปลี่ยนชื่อ File '${FOLDER}' from bank name '${BANK_NAME}' to '${HORSE_LIST}'
    Create Directory     ${CURDIR}/${FOLDER}
    ${bank_dict} =    Create Dictionary    ธนาคารกรุงเทพ จำกัด (มหาชน)=BBL    ธนาคารกสิกรไทย จำกัด (มหาชน)=KBNK    ธนาคารกรุงไทย จำกัด (มหาชน)=KTB    ธนาคาร เจพีมอร์แกน เชส=JPMC    ธนาคาร โอเวอร์ซี-ไชนีสแบงกิ้งคอร์ปอเรชั่น จํากัด=OCBC    ธนาคารทหารไทยธนชาต จำกัด (มหาชน)=TTB    ธนาคารไทยพาณิชย์ จำกัด (มหาชน)=SCB    ธนาคารซิตี้แบงก์=CITI    ธนาคารซูมิโตโม มิตซุย แบงกิ้ง คอร์ปอเรชั่น=SMBC    ธนาคารสแตนดาร์ดชาร์เตอร์ด(ไทย) จำกัด (มหาชน)=SCBT    ธนาคาร ซีไอเอ็มบี ไทย จำกัด (มหาชน)=CMBT    ธนาคาร อาร์ เอช บี จำกัด=RHB    ธนาคารยูโอบี จำกัด (มหาชน)=UOBT    ธนาคารกรุงศรีอยุธยา จำกัด (มหาชน)=BAY    ธนาคารเมกะ สากลพาณิชย์ จำกัด (มหาชน)=MEGA    ธนาคารแห่งอเมริกา เนชั่นแนล แอสโซซิเอชั่น=BOA    ธนาคารอินเดียนโอเวอร์ซีส์=IOB    ธนาคารออมสิน=GSB    ธนาคารฮ่องกงและเซี่ยงไฮ้แบงกิ้ง คอร์ปอเรชั่น จำกัด=HSBC    ธนาคารดอยซ์แบงก์=DB    ธนาคารอาคารสงเคราะห์=GHB    ธนาคารเพื่อการเกษตรและสหกรณ์=BAAC    ธนาคารเพื่อการส่งออกและนำเข้าแห่งประเทศไทย=EXIM    ธนาคารมิซูโฮ จำกัด=MHCB    ธนาคารบีเอ็นพี พารีบาส์=BNPP    ธนาคารแห่งประเทศจีน จำกัด=BOC    ธนาคารอิสลามแห่งประเทศไทย=ISBT    ธนาคารทิสโก้ จำกัด (มหาชน)=TSCO    ธนาคารเกียรตินาคินภัทร จำกัด (มหาชน)=KKP    ธนาคารไอซีบีซี (ไทย) จำกัด (มหาชน)=ICBC    ธนาคารไทยเครดิต จำกัด (มหาชน)=TCRB    ธนาคารแลนด์ แอนด์ เฮ้าส์ จำกัด (มหาชน)=LHB    ธนาคารซูมิโตโม มิตซุย ทรัสต์ (ไทย) จำกัด (มหาชน)=SMTB    ธนาคารพัฒนาวิสาหกิจขนาดกลางและขนาดย่อมแห่งประเทศไทย=SME
    ${bank_name_dict} =    Create Dictionary    BBL=ธนาคารกรุงเทพ จำกัด (มหาชน)     KBNK=ธนาคารกสิกรไทย จำกัด (มหาชน)    KTB=ธนาคารกรุงไทย จำกัด (มหาชน)    JPMC=ธนาคาร เจพีมอร์แกน เชส    OCBC=ธนาคาร โอเวอร์ซี-ไชนีสแบงกิ้งคอร์ปอเรชั่น จํากัด    TTB=ธนาคารทหารไทยธนชาต จำกัด (มหาชน)     SCB=ธนาคารไทยพาณิชย์ จำกัด (มหาชน)     CITI=ธนาคารซิตี้แบงก์     SMBC=ธนาคารซูมิโตโม มิตซุย แบงกิ้ง คอร์ปอเรชั่น     SCBT=ธนาคารสแตนดาร์ดชาร์เตอร์ด(ไทย) จำกัด (มหาชน)     CMBT=ธนาคาร ซีไอเอ็มบี ไทย จำกัด (มหาชน)     RHB=ธนาคาร อาร์ เอช บี จำกัด     UOBT=ธนาคารยูโอบี จำกัด (มหาชน)     BAY=ธนาคารกรุงศรีอยุธยา จำกัด (มหาชน)     MEGA=ธนาคารเมกะ สากลพาณิชย์ จำกัด (มหาชน)     BOA=ธนาคารแห่งอเมริกา เนชั่นแนล แอสโซซิเอชั่น     IOB=ธนาคารอินเดียนโอเวอร์ซีส์     GSB=ธนาคารออมสิน     HSBC=ธนาคารฮ่องกงและเซี่ยงไฮ้แบงกิ้ง คอร์ปอเรชั่น จำกัด     DB=ธนาคารดอยซ์แบงก์     GHB=ธนาคารอาคารสงเคราะห์     BAAC=ธนาคารเพื่อการเกษตรและสหกรณ์     EXIM=ธนาคารเพื่อการส่งออกและนำเข้าแห่งประเทศไทย     MHCB=ธนาคารมิซูโฮ จำกัด     BNPP=ธนาคารบีเอ็นพี พารีบาส์     BOC=ธนาคารแห่งประเทศจีน จำกัด     ISBT=ธนาคารอิสลามแห่งประเทศไทย     TSCO=ธนาคารทิสโก้ จำกัด (มหาชน)     KKP=ธนาคารเกียรตินาคินภัทร จำกัด (มหาชน)     ICBC=ธนาคารไอซีบีซี (ไทย) จำกัด (มหาชน)     TCRB=ธนาคารไทยเครดิต จำกัด (มหาชน)     LHB=ธนาคารแลนด์ แอนด์ เฮ้าส์ จำกัด (มหาชน)     SMTB=ธนาคารซูมิโตโม มิตซุย ทรัสต์ (ไทย) จำกัด (มหาชน)     SME=ธนาคารพัฒนาวิสาหกิจขนาดกลางและขนาดย่อมแห่งประเทศไทย
    set test variable   ${bank_dict}
    set test variable   ${bank_name_dict}
    Open Excel Document      filename=${CURDIR}/Mastercase_Template.xlsx   doc_id=docname1
    ${master_case_id}=    create master case id of bank name '${BANK_NAME}'
    set test variable   ${master_case_id}
    Write Excel Cell	3   1    ${master_case_id}    sheet_name=CreateBankCase
    ${police_section}=    การตรวจพบรายการ คือ 'ผู้เสียหายแจ้งเอง มาตรา 7'
    Write Excel Cell	3   5    ${police_section}    sheet_name=CreateBankCase
    ${police_section}=    การตรวจพบรายการ คือ 'ผู้เสียหายแจ้งเอง มาตรา 7'
    Write Excel Cell	3   5    ${police_section}    sheet_name=CreateBankCase
    set test variable    ${master_file_name}    Mastercase_${master_case_id}
    Save Excel Document      filename=${CURDIR}/${FOLDER}/${master_file_name}.xlsx
    Close Current Excel Document
    set test variable    ${test_case_name}    ${FOLDER}
    Create victim information condition 2 '${FOLDER}/${master_file_name}' of bank name '${bank_name_dict}[${BANK_NAME}]'
    Create transaction to banks ทีเคยออกรายการแล้ว '${HORSE_LIST}' in '${FOLDER}/${master_file_name}' บุคคลคนเดียวกันเปลี่ยนชื่อ
    Add Master Case via API '${FOLDER}/${master_file_name}' bank name '${BANK_NAME}'

Create Master Case for condition 3 บุคคลเก่าและบัญชีเก่าเคยออกรายงานด้วยเงื่อนไข เงื่อนไข 1 หรือ 2 File '${FOLDER}' from bank name '${BANK_NAME}' to '${HORSE_LIST}'
    Create Directory     ${CURDIR}/${FOLDER}
    ${bank_dict} =    Create Dictionary    ธนาคารกรุงเทพ จำกัด (มหาชน)=BBL    ธนาคารกสิกรไทย จำกัด (มหาชน)=KBNK    ธนาคารกรุงไทย จำกัด (มหาชน)=KTB    ธนาคาร เจพีมอร์แกน เชส=JPMC    ธนาคาร โอเวอร์ซี-ไชนีสแบงกิ้งคอร์ปอเรชั่น จํากัด=OCBC    ธนาคารทหารไทยธนชาต จำกัด (มหาชน)=TTB    ธนาคารไทยพาณิชย์ จำกัด (มหาชน)=SCB    ธนาคารซิตี้แบงก์=CITI    ธนาคารซูมิโตโม มิตซุย แบงกิ้ง คอร์ปอเรชั่น=SMBC    ธนาคารสแตนดาร์ดชาร์เตอร์ด(ไทย) จำกัด (มหาชน)=SCBT    ธนาคาร ซีไอเอ็มบี ไทย จำกัด (มหาชน)=CMBT    ธนาคาร อาร์ เอช บี จำกัด=RHB    ธนาคารยูโอบี จำกัด (มหาชน)=UOBT    ธนาคารกรุงศรีอยุธยา จำกัด (มหาชน)=BAY    ธนาคารเมกะ สากลพาณิชย์ จำกัด (มหาชน)=MEGA    ธนาคารแห่งอเมริกา เนชั่นแนล แอสโซซิเอชั่น=BOA    ธนาคารอินเดียนโอเวอร์ซีส์=IOB    ธนาคารออมสิน=GSB    ธนาคารฮ่องกงและเซี่ยงไฮ้แบงกิ้ง คอร์ปอเรชั่น จำกัด=HSBC    ธนาคารดอยซ์แบงก์=DB    ธนาคารอาคารสงเคราะห์=GHB    ธนาคารเพื่อการเกษตรและสหกรณ์=BAAC    ธนาคารเพื่อการส่งออกและนำเข้าแห่งประเทศไทย=EXIM    ธนาคารมิซูโฮ จำกัด=MHCB    ธนาคารบีเอ็นพี พารีบาส์=BNPP    ธนาคารแห่งประเทศจีน จำกัด=BOC    ธนาคารอิสลามแห่งประเทศไทย=ISBT    ธนาคารทิสโก้ จำกัด (มหาชน)=TSCO    ธนาคารเกียรตินาคินภัทร จำกัด (มหาชน)=KKP    ธนาคารไอซีบีซี (ไทย) จำกัด (มหาชน)=ICBC    ธนาคารไทยเครดิต จำกัด (มหาชน)=TCRB    ธนาคารแลนด์ แอนด์ เฮ้าส์ จำกัด (มหาชน)=LHB    ธนาคารซูมิโตโม มิตซุย ทรัสต์ (ไทย) จำกัด (มหาชน)=SMTB    ธนาคารพัฒนาวิสาหกิจขนาดกลางและขนาดย่อมแห่งประเทศไทย=SME
    ${bank_name_dict} =    Create Dictionary    BBL=ธนาคารกรุงเทพ จำกัด (มหาชน)     KBNK=ธนาคารกสิกรไทย จำกัด (มหาชน)    KTB=ธนาคารกรุงไทย จำกัด (มหาชน)    JPMC=ธนาคาร เจพีมอร์แกน เชส    OCBC=ธนาคาร โอเวอร์ซี-ไชนีสแบงกิ้งคอร์ปอเรชั่น จํากัด    TTB=ธนาคารทหารไทยธนชาต จำกัด (มหาชน)     SCB=ธนาคารไทยพาณิชย์ จำกัด (มหาชน)     CITI=ธนาคารซิตี้แบงก์     SMBC=ธนาคารซูมิโตโม มิตซุย แบงกิ้ง คอร์ปอเรชั่น     SCBT=ธนาคารสแตนดาร์ดชาร์เตอร์ด(ไทย) จำกัด (มหาชน)     CMBT=ธนาคาร ซีไอเอ็มบี ไทย จำกัด (มหาชน)     RHB=ธนาคาร อาร์ เอช บี จำกัด     UOBT=ธนาคารยูโอบี จำกัด (มหาชน)     BAY=ธนาคารกรุงศรีอยุธยา จำกัด (มหาชน)     MEGA=ธนาคารเมกะ สากลพาณิชย์ จำกัด (มหาชน)     BOA=ธนาคารแห่งอเมริกา เนชั่นแนล แอสโซซิเอชั่น     IOB=ธนาคารอินเดียนโอเวอร์ซีส์     GSB=ธนาคารออมสิน     HSBC=ธนาคารฮ่องกงและเซี่ยงไฮ้แบงกิ้ง คอร์ปอเรชั่น จำกัด     DB=ธนาคารดอยซ์แบงก์     GHB=ธนาคารอาคารสงเคราะห์     BAAC=ธนาคารเพื่อการเกษตรและสหกรณ์     EXIM=ธนาคารเพื่อการส่งออกและนำเข้าแห่งประเทศไทย     MHCB=ธนาคารมิซูโฮ จำกัด     BNPP=ธนาคารบีเอ็นพี พารีบาส์     BOC=ธนาคารแห่งประเทศจีน จำกัด     ISBT=ธนาคารอิสลามแห่งประเทศไทย     TSCO=ธนาคารทิสโก้ จำกัด (มหาชน)     KKP=ธนาคารเกียรตินาคินภัทร จำกัด (มหาชน)     ICBC=ธนาคารไอซีบีซี (ไทย) จำกัด (มหาชน)     TCRB=ธนาคารไทยเครดิต จำกัด (มหาชน)     LHB=ธนาคารแลนด์ แอนด์ เฮ้าส์ จำกัด (มหาชน)     SMTB=ธนาคารซูมิโตโม มิตซุย ทรัสต์ (ไทย) จำกัด (มหาชน)     SME=ธนาคารพัฒนาวิสาหกิจขนาดกลางและขนาดย่อมแห่งประเทศไทย
    set test variable   ${bank_dict}
    set test variable   ${bank_name_dict}
    Open Excel Document      filename=${CURDIR}/Mastercase_Template.xlsx   doc_id=docname1
    ${master_case_id}=    create master case id of bank name '${BANK_NAME}'
    set test variable   ${master_case_id}
    Write Excel Cell	3   1    ${master_case_id}    sheet_name=CreateBankCase
    ${police_section}=    การตรวจพบรายการ คือ 'ผู้เสียหายแจ้งเอง มาตรา 7'
    Write Excel Cell	3   5    ${police_section}    sheet_name=CreateBankCase
    ${police_section}=    การตรวจพบรายการ คือ 'ผู้เสียหายแจ้งเอง มาตรา 7'
    Write Excel Cell	3   5    ${police_section}    sheet_name=CreateBankCase
    set test variable    ${master_file_name}    Mastercase_${master_case_id}
    Save Excel Document      filename=${CURDIR}/${FOLDER}/${master_file_name}.xlsx
    Close Current Excel Document
    set test variable    ${test_case_name}    ${FOLDER}
    Create victim information condition 2 '${FOLDER}/${master_file_name}' of bank name '${bank_name_dict}[${BANK_NAME}]'
    Create transaction to banks บุคคลเก่าและบัญชีเก่าเคยออกรายงาน '${HORSE_LIST}' in '${FOLDER}/${master_file_name}'
    Add Master Case via API '${FOLDER}/${master_file_name}' bank name '${BANK_NAME}'

Create Master Case for condition 3 บุคคลเก่าและบัญชีใหม่ ยังไม่เคยออกรายงาน File '${FOLDER}' from bank name '${BANK_NAME}' to '${HORSE_LIST}'
    Create Directory     ${CURDIR}/${FOLDER}
    ${bank_dict} =    Create Dictionary    ธนาคารกรุงเทพ จำกัด (มหาชน)=BBL    ธนาคารกสิกรไทย จำกัด (มหาชน)=KBNK    ธนาคารกรุงไทย จำกัด (มหาชน)=KTB    ธนาคาร เจพีมอร์แกน เชส=JPMC    ธนาคาร โอเวอร์ซี-ไชนีสแบงกิ้งคอร์ปอเรชั่น จํากัด=OCBC    ธนาคารทหารไทยธนชาต จำกัด (มหาชน)=TTB    ธนาคารไทยพาณิชย์ จำกัด (มหาชน)=SCB    ธนาคารซิตี้แบงก์=CITI    ธนาคารซูมิโตโม มิตซุย แบงกิ้ง คอร์ปอเรชั่น=SMBC    ธนาคารสแตนดาร์ดชาร์เตอร์ด(ไทย) จำกัด (มหาชน)=SCBT    ธนาคาร ซีไอเอ็มบี ไทย จำกัด (มหาชน)=CMBT    ธนาคาร อาร์ เอช บี จำกัด=RHB    ธนาคารยูโอบี จำกัด (มหาชน)=UOBT    ธนาคารกรุงศรีอยุธยา จำกัด (มหาชน)=BAY    ธนาคารเมกะ สากลพาณิชย์ จำกัด (มหาชน)=MEGA    ธนาคารแห่งอเมริกา เนชั่นแนล แอสโซซิเอชั่น=BOA    ธนาคารอินเดียนโอเวอร์ซีส์=IOB    ธนาคารออมสิน=GSB    ธนาคารฮ่องกงและเซี่ยงไฮ้แบงกิ้ง คอร์ปอเรชั่น จำกัด=HSBC    ธนาคารดอยซ์แบงก์=DB    ธนาคารอาคารสงเคราะห์=GHB    ธนาคารเพื่อการเกษตรและสหกรณ์=BAAC    ธนาคารเพื่อการส่งออกและนำเข้าแห่งประเทศไทย=EXIM    ธนาคารมิซูโฮ จำกัด=MHCB    ธนาคารบีเอ็นพี พารีบาส์=BNPP    ธนาคารแห่งประเทศจีน จำกัด=BOC    ธนาคารอิสลามแห่งประเทศไทย=ISBT    ธนาคารทิสโก้ จำกัด (มหาชน)=TSCO    ธนาคารเกียรตินาคินภัทร จำกัด (มหาชน)=KKP    ธนาคารไอซีบีซี (ไทย) จำกัด (มหาชน)=ICBC    ธนาคารไทยเครดิต จำกัด (มหาชน)=TCRB    ธนาคารแลนด์ แอนด์ เฮ้าส์ จำกัด (มหาชน)=LHB    ธนาคารซูมิโตโม มิตซุย ทรัสต์ (ไทย) จำกัด (มหาชน)=SMTB    ธนาคารพัฒนาวิสาหกิจขนาดกลางและขนาดย่อมแห่งประเทศไทย=SME
    ${bank_name_dict} =    Create Dictionary    BBL=ธนาคารกรุงเทพ จำกัด (มหาชน)     KBNK=ธนาคารกสิกรไทย จำกัด (มหาชน)    KTB=ธนาคารกรุงไทย จำกัด (มหาชน)    JPMC=ธนาคาร เจพีมอร์แกน เชส    OCBC=ธนาคาร โอเวอร์ซี-ไชนีสแบงกิ้งคอร์ปอเรชั่น จํากัด    TTB=ธนาคารทหารไทยธนชาต จำกัด (มหาชน)     SCB=ธนาคารไทยพาณิชย์ จำกัด (มหาชน)     CITI=ธนาคารซิตี้แบงก์     SMBC=ธนาคารซูมิโตโม มิตซุย แบงกิ้ง คอร์ปอเรชั่น     SCBT=ธนาคารสแตนดาร์ดชาร์เตอร์ด(ไทย) จำกัด (มหาชน)     CMBT=ธนาคาร ซีไอเอ็มบี ไทย จำกัด (มหาชน)     RHB=ธนาคาร อาร์ เอช บี จำกัด     UOBT=ธนาคารยูโอบี จำกัด (มหาชน)     BAY=ธนาคารกรุงศรีอยุธยา จำกัด (มหาชน)     MEGA=ธนาคารเมกะ สากลพาณิชย์ จำกัด (มหาชน)     BOA=ธนาคารแห่งอเมริกา เนชั่นแนล แอสโซซิเอชั่น     IOB=ธนาคารอินเดียนโอเวอร์ซีส์     GSB=ธนาคารออมสิน     HSBC=ธนาคารฮ่องกงและเซี่ยงไฮ้แบงกิ้ง คอร์ปอเรชั่น จำกัด     DB=ธนาคารดอยซ์แบงก์     GHB=ธนาคารอาคารสงเคราะห์     BAAC=ธนาคารเพื่อการเกษตรและสหกรณ์     EXIM=ธนาคารเพื่อการส่งออกและนำเข้าแห่งประเทศไทย     MHCB=ธนาคารมิซูโฮ จำกัด     BNPP=ธนาคารบีเอ็นพี พารีบาส์     BOC=ธนาคารแห่งประเทศจีน จำกัด     ISBT=ธนาคารอิสลามแห่งประเทศไทย     TSCO=ธนาคารทิสโก้ จำกัด (มหาชน)     KKP=ธนาคารเกียรตินาคินภัทร จำกัด (มหาชน)     ICBC=ธนาคารไอซีบีซี (ไทย) จำกัด (มหาชน)     TCRB=ธนาคารไทยเครดิต จำกัด (มหาชน)     LHB=ธนาคารแลนด์ แอนด์ เฮ้าส์ จำกัด (มหาชน)     SMTB=ธนาคารซูมิโตโม มิตซุย ทรัสต์ (ไทย) จำกัด (มหาชน)     SME=ธนาคารพัฒนาวิสาหกิจขนาดกลางและขนาดย่อมแห่งประเทศไทย
    set test variable   ${bank_dict}
    set test variable   ${bank_name_dict}
    Open Excel Document      filename=${CURDIR}/Mastercase_Template.xlsx   doc_id=docname1
    ${master_case_id}=    create master case id of bank name '${BANK_NAME}'
    set test variable   ${master_case_id}
    Write Excel Cell	3   1    ${master_case_id}    sheet_name=CreateBankCase
    ${police_section}=    การตรวจพบรายการ คือ 'ผู้เสียหายแจ้งเอง มาตรา 7'
    Write Excel Cell	3   5    ${police_section}    sheet_name=CreateBankCase
    ${police_section}=    การตรวจพบรายการ คือ 'ผู้เสียหายแจ้งเอง มาตรา 7'
    Write Excel Cell	3   5    ${police_section}    sheet_name=CreateBankCase
    set test variable    ${master_file_name}    Mastercase_${master_case_id}
    Save Excel Document      filename=${CURDIR}/${FOLDER}/${master_file_name}.xlsx
    Close Current Excel Document
    set test variable    ${test_case_name}    ${FOLDER}
    Create victim information condition 2 '${FOLDER}/${master_file_name}' of bank name '${bank_name_dict}[${BANK_NAME}]'
    Create transaction to banks ทีเคยออกรายการแล้ว '${HORSE_LIST}' in '${FOLDER}/${master_file_name}'
    Add Master Case via API '${FOLDER}/${master_file_name}' bank name '${BANK_NAME}'

Create Master Case for condition 3 บุคคลเก่าและบัญชีใหม่ บุคคลคนเดียวกันเปลี่ยนชื่อ File '${FOLDER}' from bank name '${BANK_NAME}' to '${HORSE_LIST}' 
    Create Directory     ${CURDIR}/${FOLDER}
    ${bank_dict} =    Create Dictionary    ธนาคารกรุงเทพ จำกัด (มหาชน)=BBL    ธนาคารกสิกรไทย จำกัด (มหาชน)=KBNK    ธนาคารกรุงไทย จำกัด (มหาชน)=KTB    ธนาคาร เจพีมอร์แกน เชส=JPMC    ธนาคาร โอเวอร์ซี-ไชนีสแบงกิ้งคอร์ปอเรชั่น จํากัด=OCBC    ธนาคารทหารไทยธนชาต จำกัด (มหาชน)=TTB    ธนาคารไทยพาณิชย์ จำกัด (มหาชน)=SCB    ธนาคารซิตี้แบงก์=CITI    ธนาคารซูมิโตโม มิตซุย แบงกิ้ง คอร์ปอเรชั่น=SMBC    ธนาคารสแตนดาร์ดชาร์เตอร์ด(ไทย) จำกัด (มหาชน)=SCBT    ธนาคาร ซีไอเอ็มบี ไทย จำกัด (มหาชน)=CMBT    ธนาคาร อาร์ เอช บี จำกัด=RHB    ธนาคารยูโอบี จำกัด (มหาชน)=UOBT    ธนาคารกรุงศรีอยุธยา จำกัด (มหาชน)=BAY    ธนาคารเมกะ สากลพาณิชย์ จำกัด (มหาชน)=MEGA    ธนาคารแห่งอเมริกา เนชั่นแนล แอสโซซิเอชั่น=BOA    ธนาคารอินเดียนโอเวอร์ซีส์=IOB    ธนาคารออมสิน=GSB    ธนาคารฮ่องกงและเซี่ยงไฮ้แบงกิ้ง คอร์ปอเรชั่น จำกัด=HSBC    ธนาคารดอยซ์แบงก์=DB    ธนาคารอาคารสงเคราะห์=GHB    ธนาคารเพื่อการเกษตรและสหกรณ์=BAAC    ธนาคารเพื่อการส่งออกและนำเข้าแห่งประเทศไทย=EXIM    ธนาคารมิซูโฮ จำกัด=MHCB    ธนาคารบีเอ็นพี พารีบาส์=BNPP    ธนาคารแห่งประเทศจีน จำกัด=BOC    ธนาคารอิสลามแห่งประเทศไทย=ISBT    ธนาคารทิสโก้ จำกัด (มหาชน)=TSCO    ธนาคารเกียรตินาคินภัทร จำกัด (มหาชน)=KKP    ธนาคารไอซีบีซี (ไทย) จำกัด (มหาชน)=ICBC    ธนาคารไทยเครดิต จำกัด (มหาชน)=TCRB    ธนาคารแลนด์ แอนด์ เฮ้าส์ จำกัด (มหาชน)=LHB    ธนาคารซูมิโตโม มิตซุย ทรัสต์ (ไทย) จำกัด (มหาชน)=SMTB    ธนาคารพัฒนาวิสาหกิจขนาดกลางและขนาดย่อมแห่งประเทศไทย=SME
    ${bank_name_dict} =    Create Dictionary    BBL=ธนาคารกรุงเทพ จำกัด (มหาชน)     KBNK=ธนาคารกสิกรไทย จำกัด (มหาชน)    KTB=ธนาคารกรุงไทย จำกัด (มหาชน)    JPMC=ธนาคาร เจพีมอร์แกน เชส    OCBC=ธนาคาร โอเวอร์ซี-ไชนีสแบงกิ้งคอร์ปอเรชั่น จํากัด    TTB=ธนาคารทหารไทยธนชาต จำกัด (มหาชน)     SCB=ธนาคารไทยพาณิชย์ จำกัด (มหาชน)     CITI=ธนาคารซิตี้แบงก์     SMBC=ธนาคารซูมิโตโม มิตซุย แบงกิ้ง คอร์ปอเรชั่น     SCBT=ธนาคารสแตนดาร์ดชาร์เตอร์ด(ไทย) จำกัด (มหาชน)     CMBT=ธนาคาร ซีไอเอ็มบี ไทย จำกัด (มหาชน)     RHB=ธนาคาร อาร์ เอช บี จำกัด     UOBT=ธนาคารยูโอบี จำกัด (มหาชน)     BAY=ธนาคารกรุงศรีอยุธยา จำกัด (มหาชน)     MEGA=ธนาคารเมกะ สากลพาณิชย์ จำกัด (มหาชน)     BOA=ธนาคารแห่งอเมริกา เนชั่นแนล แอสโซซิเอชั่น     IOB=ธนาคารอินเดียนโอเวอร์ซีส์     GSB=ธนาคารออมสิน     HSBC=ธนาคารฮ่องกงและเซี่ยงไฮ้แบงกิ้ง คอร์ปอเรชั่น จำกัด     DB=ธนาคารดอยซ์แบงก์     GHB=ธนาคารอาคารสงเคราะห์     BAAC=ธนาคารเพื่อการเกษตรและสหกรณ์     EXIM=ธนาคารเพื่อการส่งออกและนำเข้าแห่งประเทศไทย     MHCB=ธนาคารมิซูโฮ จำกัด     BNPP=ธนาคารบีเอ็นพี พารีบาส์     BOC=ธนาคารแห่งประเทศจีน จำกัด     ISBT=ธนาคารอิสลามแห่งประเทศไทย     TSCO=ธนาคารทิสโก้ จำกัด (มหาชน)     KKP=ธนาคารเกียรตินาคินภัทร จำกัด (มหาชน)     ICBC=ธนาคารไอซีบีซี (ไทย) จำกัด (มหาชน)     TCRB=ธนาคารไทยเครดิต จำกัด (มหาชน)     LHB=ธนาคารแลนด์ แอนด์ เฮ้าส์ จำกัด (มหาชน)     SMTB=ธนาคารซูมิโตโม มิตซุย ทรัสต์ (ไทย) จำกัด (มหาชน)     SME=ธนาคารพัฒนาวิสาหกิจขนาดกลางและขนาดย่อมแห่งประเทศไทย
    set test variable   ${bank_dict}
    set test variable   ${bank_name_dict}
    Open Excel Document      filename=${CURDIR}/Mastercase_Template.xlsx   doc_id=docname1
    ${master_case_id}=    create master case id of bank name '${BANK_NAME}'
    set test variable   ${master_case_id}
    Write Excel Cell	3   1    ${master_case_id}    sheet_name=CreateBankCase
    ${police_section}=    การตรวจพบรายการ คือ 'ผู้เสียหายแจ้งเอง มาตรา 7'
    Write Excel Cell	3   5    ${police_section}    sheet_name=CreateBankCase
    ${police_section}=    การตรวจพบรายการ คือ 'ผู้เสียหายแจ้งเอง มาตรา 7'
    Write Excel Cell	3   5    ${police_section}    sheet_name=CreateBankCase
    set test variable    ${master_file_name}    Mastercase_${master_case_id}
    Save Excel Document      filename=${CURDIR}/${FOLDER}/${master_file_name}.xlsx
    Close Current Excel Document
    Create victim information condition 2 '${FOLDER}/${master_file_name}' of bank name '${bank_name_dict}[${BANK_NAME}]'
    Create transaction to banks '${HORSE_LIST}' in '${FOLDER}/${master_file_name}'
    Add Master Case via API '${FOLDER}/${master_file_name}' bank name '${BANK_NAME}'

Create Master Case for condition 3 File '${FOLDER}' from bank name '${BANK_NAME}' to '${HORSE_LIST}' ลักษณะเคสซื้อขายสินค้า
    Create Directory     ${CURDIR}/${FOLDER}
    ${bank_dict} =    Create Dictionary    ธนาคารกรุงเทพ จำกัด (มหาชน)=BBL    ธนาคารกสิกรไทย จำกัด (มหาชน)=KBNK    ธนาคารกรุงไทย จำกัด (มหาชน)=KTB    ธนาคาร เจพีมอร์แกน เชส=JPMC    ธนาคาร โอเวอร์ซี-ไชนีสแบงกิ้งคอร์ปอเรชั่น จํากัด=OCBC    ธนาคารทหารไทยธนชาต จำกัด (มหาชน)=TTB    ธนาคารไทยพาณิชย์ จำกัด (มหาชน)=SCB    ธนาคารซิตี้แบงก์=CITI    ธนาคารซูมิโตโม มิตซุย แบงกิ้ง คอร์ปอเรชั่น=SMBC    ธนาคารสแตนดาร์ดชาร์เตอร์ด(ไทย) จำกัด (มหาชน)=SCBT    ธนาคาร ซีไอเอ็มบี ไทย จำกัด (มหาชน)=CMBT    ธนาคาร อาร์ เอช บี จำกัด=RHB    ธนาคารยูโอบี จำกัด (มหาชน)=UOBT    ธนาคารกรุงศรีอยุธยา จำกัด (มหาชน)=BAY    ธนาคารเมกะ สากลพาณิชย์ จำกัด (มหาชน)=MEGA    ธนาคารแห่งอเมริกา เนชั่นแนล แอสโซซิเอชั่น=BOA    ธนาคารอินเดียนโอเวอร์ซีส์=IOB    ธนาคารออมสิน=GSB    ธนาคารฮ่องกงและเซี่ยงไฮ้แบงกิ้ง คอร์ปอเรชั่น จำกัด=HSBC    ธนาคารดอยซ์แบงก์=DB    ธนาคารอาคารสงเคราะห์=GHB    ธนาคารเพื่อการเกษตรและสหกรณ์=BAAC    ธนาคารเพื่อการส่งออกและนำเข้าแห่งประเทศไทย=EXIM    ธนาคารมิซูโฮ จำกัด=MHCB    ธนาคารบีเอ็นพี พารีบาส์=BNPP    ธนาคารแห่งประเทศจีน จำกัด=BOC    ธนาคารอิสลามแห่งประเทศไทย=ISBT    ธนาคารทิสโก้ จำกัด (มหาชน)=TSCO    ธนาคารเกียรตินาคินภัทร จำกัด (มหาชน)=KKP    ธนาคารไอซีบีซี (ไทย) จำกัด (มหาชน)=ICBC    ธนาคารไทยเครดิต จำกัด (มหาชน)=TCRB    ธนาคารแลนด์ แอนด์ เฮ้าส์ จำกัด (มหาชน)=LHB    ธนาคารซูมิโตโม มิตซุย ทรัสต์ (ไทย) จำกัด (มหาชน)=SMTB    ธนาคารพัฒนาวิสาหกิจขนาดกลางและขนาดย่อมแห่งประเทศไทย=SME
    ${bank_name_dict} =    Create Dictionary    BBL=ธนาคารกรุงเทพ จำกัด (มหาชน)     KBNK=ธนาคารกสิกรไทย จำกัด (มหาชน)    KTB=ธนาคารกรุงไทย จำกัด (มหาชน)    JPMC=ธนาคาร เจพีมอร์แกน เชส    OCBC=ธนาคาร โอเวอร์ซี-ไชนีสแบงกิ้งคอร์ปอเรชั่น จํากัด    TTB=ธนาคารทหารไทยธนชาต จำกัด (มหาชน)     SCB=ธนาคารไทยพาณิชย์ จำกัด (มหาชน)     CITI=ธนาคารซิตี้แบงก์     SMBC=ธนาคารซูมิโตโม มิตซุย แบงกิ้ง คอร์ปอเรชั่น     SCBT=ธนาคารสแตนดาร์ดชาร์เตอร์ด(ไทย) จำกัด (มหาชน)     CMBT=ธนาคาร ซีไอเอ็มบี ไทย จำกัด (มหาชน)     RHB=ธนาคาร อาร์ เอช บี จำกัด     UOBT=ธนาคารยูโอบี จำกัด (มหาชน)     BAY=ธนาคารกรุงศรีอยุธยา จำกัด (มหาชน)     MEGA=ธนาคารเมกะ สากลพาณิชย์ จำกัด (มหาชน)     BOA=ธนาคารแห่งอเมริกา เนชั่นแนล แอสโซซิเอชั่น     IOB=ธนาคารอินเดียนโอเวอร์ซีส์     GSB=ธนาคารออมสิน     HSBC=ธนาคารฮ่องกงและเซี่ยงไฮ้แบงกิ้ง คอร์ปอเรชั่น จำกัด     DB=ธนาคารดอยซ์แบงก์     GHB=ธนาคารอาคารสงเคราะห์     BAAC=ธนาคารเพื่อการเกษตรและสหกรณ์     EXIM=ธนาคารเพื่อการส่งออกและนำเข้าแห่งประเทศไทย     MHCB=ธนาคารมิซูโฮ จำกัด     BNPP=ธนาคารบีเอ็นพี พารีบาส์     BOC=ธนาคารแห่งประเทศจีน จำกัด     ISBT=ธนาคารอิสลามแห่งประเทศไทย     TSCO=ธนาคารทิสโก้ จำกัด (มหาชน)     KKP=ธนาคารเกียรตินาคินภัทร จำกัด (มหาชน)     ICBC=ธนาคารไอซีบีซี (ไทย) จำกัด (มหาชน)     TCRB=ธนาคารไทยเครดิต จำกัด (มหาชน)     LHB=ธนาคารแลนด์ แอนด์ เฮ้าส์ จำกัด (มหาชน)     SMTB=ธนาคารซูมิโตโม มิตซุย ทรัสต์ (ไทย) จำกัด (มหาชน)     SME=ธนาคารพัฒนาวิสาหกิจขนาดกลางและขนาดย่อมแห่งประเทศไทย
    set test variable   ${bank_dict}
    set test variable   ${bank_name_dict}
    Open Excel Document      filename=${CURDIR}/Mastercase_Template.xlsx   doc_id=docname1
    ${master_case_id}=    create master case id of bank name '${BANK_NAME}'
    set test variable   ${master_case_id}
    Write Excel Cell	3   1    ${master_case_id}    sheet_name=CreateBankCase
    ${police_section}=    การตรวจพบรายการ คือ 'ผู้เสียหายแจ้งเอง มาตรา 7'
    Write Excel Cell	3   5    ${police_section}    sheet_name=CreateBankCase
    ${police_section}=    การตรวจพบรายการ คือ 'ผู้เสียหายแจ้งเอง มาตรา 7'
    Write Excel Cell	3   5    ${police_section}    sheet_name=CreateBankCase
    set test variable    ${master_file_name}    Mastercase_${master_case_id}
    Save Excel Document      filename=${CURDIR}/${FOLDER}/${master_file_name}.xlsx
    Close Current Excel Document
    set test variable    ${test_case_name}    ${FOLDER}
    Create victim information condition 2 ลักษณะเคสซื้อขายสินค้า '${FOLDER}/${master_file_name}' of bank name '${bank_name_dict}[${BANK_NAME}]'
    Create transaction to banks '${HORSE_LIST}' in '${FOLDER}/${master_file_name}'
    Add Master Case via API '${FOLDER}/${master_file_name}' bank name '${BANK_NAME}'

Create Master Case for condition 3 File '${FOLDER}' from bank name '${BANK_NAME}' to '${HORSE_LIST}' ไม่มีข้อมูลเลขบัตรประชาชน
    Create Directory     ${CURDIR}/${FOLDER}
    ${bank_dict} =    Create Dictionary    ธนาคารกรุงเทพ จำกัด (มหาชน)=BBL    ธนาคารกสิกรไทย จำกัด (มหาชน)=KBNK    ธนาคารกรุงไทย จำกัด (มหาชน)=KTB    ธนาคาร เจพีมอร์แกน เชส=JPMC    ธนาคาร โอเวอร์ซี-ไชนีสแบงกิ้งคอร์ปอเรชั่น จํากัด=OCBC    ธนาคารทหารไทยธนชาต จำกัด (มหาชน)=TTB    ธนาคารไทยพาณิชย์ จำกัด (มหาชน)=SCB    ธนาคารซิตี้แบงก์=CITI    ธนาคารซูมิโตโม มิตซุย แบงกิ้ง คอร์ปอเรชั่น=SMBC    ธนาคารสแตนดาร์ดชาร์เตอร์ด(ไทย) จำกัด (มหาชน)=SCBT    ธนาคาร ซีไอเอ็มบี ไทย จำกัด (มหาชน)=CMBT    ธนาคาร อาร์ เอช บี จำกัด=RHB    ธนาคารยูโอบี จำกัด (มหาชน)=UOBT    ธนาคารกรุงศรีอยุธยา จำกัด (มหาชน)=BAY    ธนาคารเมกะ สากลพาณิชย์ จำกัด (มหาชน)=MEGA    ธนาคารแห่งอเมริกา เนชั่นแนล แอสโซซิเอชั่น=BOA    ธนาคารอินเดียนโอเวอร์ซีส์=IOB    ธนาคารออมสิน=GSB    ธนาคารฮ่องกงและเซี่ยงไฮ้แบงกิ้ง คอร์ปอเรชั่น จำกัด=HSBC    ธนาคารดอยซ์แบงก์=DB    ธนาคารอาคารสงเคราะห์=GHB    ธนาคารเพื่อการเกษตรและสหกรณ์=BAAC    ธนาคารเพื่อการส่งออกและนำเข้าแห่งประเทศไทย=EXIM    ธนาคารมิซูโฮ จำกัด=MHCB    ธนาคารบีเอ็นพี พารีบาส์=BNPP    ธนาคารแห่งประเทศจีน จำกัด=BOC    ธนาคารอิสลามแห่งประเทศไทย=ISBT    ธนาคารทิสโก้ จำกัด (มหาชน)=TSCO    ธนาคารเกียรตินาคินภัทร จำกัด (มหาชน)=KKP    ธนาคารไอซีบีซี (ไทย) จำกัด (มหาชน)=ICBC    ธนาคารไทยเครดิต จำกัด (มหาชน)=TCRB    ธนาคารแลนด์ แอนด์ เฮ้าส์ จำกัด (มหาชน)=LHB    ธนาคารซูมิโตโม มิตซุย ทรัสต์ (ไทย) จำกัด (มหาชน)=SMTB    ธนาคารพัฒนาวิสาหกิจขนาดกลางและขนาดย่อมแห่งประเทศไทย=SME
    ${bank_name_dict} =    Create Dictionary    BBL=ธนาคารกรุงเทพ จำกัด (มหาชน)     KBNK=ธนาคารกสิกรไทย จำกัด (มหาชน)    KTB=ธนาคารกรุงไทย จำกัด (มหาชน)    JPMC=ธนาคาร เจพีมอร์แกน เชส    OCBC=ธนาคาร โอเวอร์ซี-ไชนีสแบงกิ้งคอร์ปอเรชั่น จํากัด    TTB=ธนาคารทหารไทยธนชาต จำกัด (มหาชน)     SCB=ธนาคารไทยพาณิชย์ จำกัด (มหาชน)     CITI=ธนาคารซิตี้แบงก์     SMBC=ธนาคารซูมิโตโม มิตซุย แบงกิ้ง คอร์ปอเรชั่น     SCBT=ธนาคารสแตนดาร์ดชาร์เตอร์ด(ไทย) จำกัด (มหาชน)     CMBT=ธนาคาร ซีไอเอ็มบี ไทย จำกัด (มหาชน)     RHB=ธนาคาร อาร์ เอช บี จำกัด     UOBT=ธนาคารยูโอบี จำกัด (มหาชน)     BAY=ธนาคารกรุงศรีอยุธยา จำกัด (มหาชน)     MEGA=ธนาคารเมกะ สากลพาณิชย์ จำกัด (มหาชน)     BOA=ธนาคารแห่งอเมริกา เนชั่นแนล แอสโซซิเอชั่น     IOB=ธนาคารอินเดียนโอเวอร์ซีส์     GSB=ธนาคารออมสิน     HSBC=ธนาคารฮ่องกงและเซี่ยงไฮ้แบงกิ้ง คอร์ปอเรชั่น จำกัด     DB=ธนาคารดอยซ์แบงก์     GHB=ธนาคารอาคารสงเคราะห์     BAAC=ธนาคารเพื่อการเกษตรและสหกรณ์     EXIM=ธนาคารเพื่อการส่งออกและนำเข้าแห่งประเทศไทย     MHCB=ธนาคารมิซูโฮ จำกัด     BNPP=ธนาคารบีเอ็นพี พารีบาส์     BOC=ธนาคารแห่งประเทศจีน จำกัด     ISBT=ธนาคารอิสลามแห่งประเทศไทย     TSCO=ธนาคารทิสโก้ จำกัด (มหาชน)     KKP=ธนาคารเกียรตินาคินภัทร จำกัด (มหาชน)     ICBC=ธนาคารไอซีบีซี (ไทย) จำกัด (มหาชน)     TCRB=ธนาคารไทยเครดิต จำกัด (มหาชน)     LHB=ธนาคารแลนด์ แอนด์ เฮ้าส์ จำกัด (มหาชน)     SMTB=ธนาคารซูมิโตโม มิตซุย ทรัสต์ (ไทย) จำกัด (มหาชน)     SME=ธนาคารพัฒนาวิสาหกิจขนาดกลางและขนาดย่อมแห่งประเทศไทย
    set test variable   ${bank_dict}
    set test variable   ${bank_name_dict}
    Open Excel Document      filename=${CURDIR}/Mastercase_Template.xlsx   doc_id=docname1
    ${master_case_id}=    create master case id of bank name '${BANK_NAME}'
    set test variable   ${master_case_id}
    Write Excel Cell	3   1    ${master_case_id}    sheet_name=CreateBankCase
    ${police_section}=    การตรวจพบรายการ คือ 'ผู้เสียหายแจ้งเอง มาตรา 7'
    Write Excel Cell	3   5    ${police_section}    sheet_name=CreateBankCase
    ${police_section}=    การตรวจพบรายการ คือ 'ผู้เสียหายแจ้งเอง มาตรา 7'
    Write Excel Cell	3   5    ${police_section}    sheet_name=CreateBankCase
    set test variable    ${master_file_name}    Mastercase_${master_case_id}
    Save Excel Document      filename=${CURDIR}/${FOLDER}/${master_file_name}.xlsx
    Close Current Excel Document
    set test variable    ${test_case_name}    ${FOLDER}
    Create victim information condition 2 '${FOLDER}/${master_file_name}' of bank name '${bank_name_dict}[${BANK_NAME}]'
    Create transaction to banks '${HORSE_LIST}' in '${FOLDER}/${master_file_name}' ไม่มีข้อมูลเลขบัตรประชาชน 
    Add Master Case via API '${FOLDER}/${master_file_name}' bank name '${BANK_NAME}'


Create Master Case for condition 3 File '${FOLDER}' from bank name '${BANK_NAME}' to '${HORSE_LIST}'
    Create Directory     ${CURDIR}/${FOLDER}
    ${bank_dict} =    Create Dictionary    ธนาคารกรุงเทพ จำกัด (มหาชน)=BBL    ธนาคารกสิกรไทย จำกัด (มหาชน)=KBNK    ธนาคารกรุงไทย จำกัด (มหาชน)=KTB    ธนาคาร เจพีมอร์แกน เชส=JPMC    ธนาคาร โอเวอร์ซี-ไชนีสแบงกิ้งคอร์ปอเรชั่น จํากัด=OCBC    ธนาคารทหารไทยธนชาต จำกัด (มหาชน)=TTB    ธนาคารไทยพาณิชย์ จำกัด (มหาชน)=SCB    ธนาคารซิตี้แบงก์=CITI    ธนาคารซูมิโตโม มิตซุย แบงกิ้ง คอร์ปอเรชั่น=SMBC    ธนาคารสแตนดาร์ดชาร์เตอร์ด(ไทย) จำกัด (มหาชน)=SCBT    ธนาคาร ซีไอเอ็มบี ไทย จำกัด (มหาชน)=CMBT    ธนาคาร อาร์ เอช บี จำกัด=RHB    ธนาคารยูโอบี จำกัด (มหาชน)=UOBT    ธนาคารกรุงศรีอยุธยา จำกัด (มหาชน)=BAY    ธนาคารเมกะ สากลพาณิชย์ จำกัด (มหาชน)=MEGA    ธนาคารแห่งอเมริกา เนชั่นแนล แอสโซซิเอชั่น=BOA    ธนาคารอินเดียนโอเวอร์ซีส์=IOB    ธนาคารออมสิน=GSB    ธนาคารฮ่องกงและเซี่ยงไฮ้แบงกิ้ง คอร์ปอเรชั่น จำกัด=HSBC    ธนาคารดอยซ์แบงก์=DB    ธนาคารอาคารสงเคราะห์=GHB    ธนาคารเพื่อการเกษตรและสหกรณ์=BAAC    ธนาคารเพื่อการส่งออกและนำเข้าแห่งประเทศไทย=EXIM    ธนาคารมิซูโฮ จำกัด=MHCB    ธนาคารบีเอ็นพี พารีบาส์=BNPP    ธนาคารแห่งประเทศจีน จำกัด=BOC    ธนาคารอิสลามแห่งประเทศไทย=ISBT    ธนาคารทิสโก้ จำกัด (มหาชน)=TSCO    ธนาคารเกียรตินาคินภัทร จำกัด (มหาชน)=KKP    ธนาคารไอซีบีซี (ไทย) จำกัด (มหาชน)=ICBC    ธนาคารไทยเครดิต จำกัด (มหาชน)=TCRB    ธนาคารแลนด์ แอนด์ เฮ้าส์ จำกัด (มหาชน)=LHB    ธนาคารซูมิโตโม มิตซุย ทรัสต์ (ไทย) จำกัด (มหาชน)=SMTB    ธนาคารพัฒนาวิสาหกิจขนาดกลางและขนาดย่อมแห่งประเทศไทย=SME
    ${bank_name_dict} =    Create Dictionary    BBL=ธนาคารกรุงเทพ จำกัด (มหาชน)     KBNK=ธนาคารกสิกรไทย จำกัด (มหาชน)    KTB=ธนาคารกรุงไทย จำกัด (มหาชน)    JPMC=ธนาคาร เจพีมอร์แกน เชส    OCBC=ธนาคาร โอเวอร์ซี-ไชนีสแบงกิ้งคอร์ปอเรชั่น จํากัด    TTB=ธนาคารทหารไทยธนชาต จำกัด (มหาชน)     SCB=ธนาคารไทยพาณิชย์ จำกัด (มหาชน)     CITI=ธนาคารซิตี้แบงก์     SMBC=ธนาคารซูมิโตโม มิตซุย แบงกิ้ง คอร์ปอเรชั่น     SCBT=ธนาคารสแตนดาร์ดชาร์เตอร์ด(ไทย) จำกัด (มหาชน)     CMBT=ธนาคาร ซีไอเอ็มบี ไทย จำกัด (มหาชน)     RHB=ธนาคาร อาร์ เอช บี จำกัด     UOBT=ธนาคารยูโอบี จำกัด (มหาชน)     BAY=ธนาคารกรุงศรีอยุธยา จำกัด (มหาชน)     MEGA=ธนาคารเมกะ สากลพาณิชย์ จำกัด (มหาชน)     BOA=ธนาคารแห่งอเมริกา เนชั่นแนล แอสโซซิเอชั่น     IOB=ธนาคารอินเดียนโอเวอร์ซีส์     GSB=ธนาคารออมสิน     HSBC=ธนาคารฮ่องกงและเซี่ยงไฮ้แบงกิ้ง คอร์ปอเรชั่น จำกัด     DB=ธนาคารดอยซ์แบงก์     GHB=ธนาคารอาคารสงเคราะห์     BAAC=ธนาคารเพื่อการเกษตรและสหกรณ์     EXIM=ธนาคารเพื่อการส่งออกและนำเข้าแห่งประเทศไทย     MHCB=ธนาคารมิซูโฮ จำกัด     BNPP=ธนาคารบีเอ็นพี พารีบาส์     BOC=ธนาคารแห่งประเทศจีน จำกัด     ISBT=ธนาคารอิสลามแห่งประเทศไทย     TSCO=ธนาคารทิสโก้ จำกัด (มหาชน)     KKP=ธนาคารเกียรตินาคินภัทร จำกัด (มหาชน)     ICBC=ธนาคารไอซีบีซี (ไทย) จำกัด (มหาชน)     TCRB=ธนาคารไทยเครดิต จำกัด (มหาชน)     LHB=ธนาคารแลนด์ แอนด์ เฮ้าส์ จำกัด (มหาชน)     SMTB=ธนาคารซูมิโตโม มิตซุย ทรัสต์ (ไทย) จำกัด (มหาชน)     SME=ธนาคารพัฒนาวิสาหกิจขนาดกลางและขนาดย่อมแห่งประเทศไทย
    set test variable   ${bank_dict}
    set test variable   ${bank_name_dict}
    Open Excel Document      filename=${CURDIR}/Mastercase_Template.xlsx   doc_id=docname1
    ${master_case_id}=    create master case id of bank name '${BANK_NAME}'
    set test variable   ${master_case_id}
    Write Excel Cell	3   1    ${master_case_id}    sheet_name=CreateBankCase
    ${police_section}=    การตรวจพบรายการ คือ 'ผู้เสียหายแจ้งเอง มาตรา 7'
    Write Excel Cell	3   5    ${police_section}    sheet_name=CreateBankCase
    ${police_section}=    การตรวจพบรายการ คือ 'ผู้เสียหายแจ้งเอง มาตรา 7'
    Write Excel Cell	3   5    ${police_section}    sheet_name=CreateBankCase
    set test variable    ${master_file_name}    Mastercase_${master_case_id}
    Save Excel Document      filename=${CURDIR}/${FOLDER}/${master_file_name}.xlsx
    Close Current Excel Document
    set test variable    ${test_case_name}    ${FOLDER}
    Create victim information condition 2 '${FOLDER}/${master_file_name}' of bank name '${bank_name_dict}[${BANK_NAME}]'
    Create transaction to banks '${HORSE_LIST}' in '${FOLDER}/${master_file_name}'
    Add Master Case via API '${FOLDER}/${master_file_name}' bank name '${BANK_NAME}'


Create Master Case for condition 3 File '${FOLDER}' from bank name '${BANK_NAME}' to '${HORSE_LIST}' personal null
    Create Directory     ${CURDIR}/${FOLDER}
    ${bank_dict} =    Create Dictionary    ธนาคารกรุงเทพ จำกัด (มหาชน)=BBL    ธนาคารกสิกรไทย จำกัด (มหาชน)=KBNK    ธนาคารกรุงไทย จำกัด (มหาชน)=KTB    ธนาคาร เจพีมอร์แกน เชส=JPMC    ธนาคาร โอเวอร์ซี-ไชนีสแบงกิ้งคอร์ปอเรชั่น จํากัด=OCBC    ธนาคารทหารไทยธนชาต จำกัด (มหาชน)=TTB    ธนาคารไทยพาณิชย์ จำกัด (มหาชน)=SCB    ธนาคารซิตี้แบงก์=CITI    ธนาคารซูมิโตโม มิตซุย แบงกิ้ง คอร์ปอเรชั่น=SMBC    ธนาคารสแตนดาร์ดชาร์เตอร์ด(ไทย) จำกัด (มหาชน)=SCBT    ธนาคาร ซีไอเอ็มบี ไทย จำกัด (มหาชน)=CMBT    ธนาคาร อาร์ เอช บี จำกัด=RHB    ธนาคารยูโอบี จำกัด (มหาชน)=UOBT    ธนาคารกรุงศรีอยุธยา จำกัด (มหาชน)=BAY    ธนาคารเมกะ สากลพาณิชย์ จำกัด (มหาชน)=MEGA    ธนาคารแห่งอเมริกา เนชั่นแนล แอสโซซิเอชั่น=BOA    ธนาคารอินเดียนโอเวอร์ซีส์=IOB    ธนาคารออมสิน=GSB    ธนาคารฮ่องกงและเซี่ยงไฮ้แบงกิ้ง คอร์ปอเรชั่น จำกัด=HSBC    ธนาคารดอยซ์แบงก์=DB    ธนาคารอาคารสงเคราะห์=GHB    ธนาคารเพื่อการเกษตรและสหกรณ์=BAAC    ธนาคารเพื่อการส่งออกและนำเข้าแห่งประเทศไทย=EXIM    ธนาคารมิซูโฮ จำกัด=MHCB    ธนาคารบีเอ็นพี พารีบาส์=BNPP    ธนาคารแห่งประเทศจีน จำกัด=BOC    ธนาคารอิสลามแห่งประเทศไทย=ISBT    ธนาคารทิสโก้ จำกัด (มหาชน)=TSCO    ธนาคารเกียรตินาคินภัทร จำกัด (มหาชน)=KKP    ธนาคารไอซีบีซี (ไทย) จำกัด (มหาชน)=ICBC    ธนาคารไทยเครดิต จำกัด (มหาชน)=TCRB    ธนาคารแลนด์ แอนด์ เฮ้าส์ จำกัด (มหาชน)=LHB    ธนาคารซูมิโตโม มิตซุย ทรัสต์ (ไทย) จำกัด (มหาชน)=SMTB    ธนาคารพัฒนาวิสาหกิจขนาดกลางและขนาดย่อมแห่งประเทศไทย=SME
    ${bank_name_dict} =    Create Dictionary    BBL=ธนาคารกรุงเทพ จำกัด (มหาชน)     KBNK=ธนาคารกสิกรไทย จำกัด (มหาชน)    KTB=ธนาคารกรุงไทย จำกัด (มหาชน)    JPMC=ธนาคาร เจพีมอร์แกน เชส    OCBC=ธนาคาร โอเวอร์ซี-ไชนีสแบงกิ้งคอร์ปอเรชั่น จํากัด    TTB=ธนาคารทหารไทยธนชาต จำกัด (มหาชน)     SCB=ธนาคารไทยพาณิชย์ จำกัด (มหาชน)     CITI=ธนาคารซิตี้แบงก์     SMBC=ธนาคารซูมิโตโม มิตซุย แบงกิ้ง คอร์ปอเรชั่น     SCBT=ธนาคารสแตนดาร์ดชาร์เตอร์ด(ไทย) จำกัด (มหาชน)     CMBT=ธนาคาร ซีไอเอ็มบี ไทย จำกัด (มหาชน)     RHB=ธนาคาร อาร์ เอช บี จำกัด     UOBT=ธนาคารยูโอบี จำกัด (มหาชน)     BAY=ธนาคารกรุงศรีอยุธยา จำกัด (มหาชน)     MEGA=ธนาคารเมกะ สากลพาณิชย์ จำกัด (มหาชน)     BOA=ธนาคารแห่งอเมริกา เนชั่นแนล แอสโซซิเอชั่น     IOB=ธนาคารอินเดียนโอเวอร์ซีส์     GSB=ธนาคารออมสิน     HSBC=ธนาคารฮ่องกงและเซี่ยงไฮ้แบงกิ้ง คอร์ปอเรชั่น จำกัด     DB=ธนาคารดอยซ์แบงก์     GHB=ธนาคารอาคารสงเคราะห์     BAAC=ธนาคารเพื่อการเกษตรและสหกรณ์     EXIM=ธนาคารเพื่อการส่งออกและนำเข้าแห่งประเทศไทย     MHCB=ธนาคารมิซูโฮ จำกัด     BNPP=ธนาคารบีเอ็นพี พารีบาส์     BOC=ธนาคารแห่งประเทศจีน จำกัด     ISBT=ธนาคารอิสลามแห่งประเทศไทย     TSCO=ธนาคารทิสโก้ จำกัด (มหาชน)     KKP=ธนาคารเกียรตินาคินภัทร จำกัด (มหาชน)     ICBC=ธนาคารไอซีบีซี (ไทย) จำกัด (มหาชน)     TCRB=ธนาคารไทยเครดิต จำกัด (มหาชน)     LHB=ธนาคารแลนด์ แอนด์ เฮ้าส์ จำกัด (มหาชน)     SMTB=ธนาคารซูมิโตโม มิตซุย ทรัสต์ (ไทย) จำกัด (มหาชน)     SME=ธนาคารพัฒนาวิสาหกิจขนาดกลางและขนาดย่อมแห่งประเทศไทย
    set test variable   ${bank_dict}
    set test variable   ${bank_name_dict}
    Open Excel Document      filename=${CURDIR}/Mastercase_Template.xlsx   doc_id=docname1
    ${master_case_id}=    create master case id of bank name '${BANK_NAME}'
    set test variable   ${master_case_id}
    Write Excel Cell	3   1    ${master_case_id}    sheet_name=CreateBankCase
    ${police_section}=    การตรวจพบรายการ คือ 'ผู้เสียหายแจ้งเอง มาตรา 7'
    Write Excel Cell	3   5    ${police_section}    sheet_name=CreateBankCase
    ${police_section}=    การตรวจพบรายการ คือ 'ผู้เสียหายแจ้งเอง มาตรา 7'
    Write Excel Cell	3   5    ${police_section}    sheet_name=CreateBankCase
    set test variable    ${master_file_name}    Mastercase_${master_case_id}
    Save Excel Document      filename=${CURDIR}/${FOLDER}/${master_file_name}.xlsx
    Close Current Excel Document
    set test variable    ${test_case_name}    ${FOLDER}
    Create victim information condition 2 '${FOLDER}/${master_file_name}' of bank name '${bank_name_dict}[${BANK_NAME}]'
#     Create transaction to banks '${HORSE_LIST}' in '${FOLDER}/${master_file_name}' personal null 3
    Create transaction to banks '${HORSE_LIST}' in '${FOLDER}/${master_file_name}' personal null 3
    Add Master Case via API '${FOLDER}/${master_file_name}' bank name '${BANK_NAME}'

Create Master Case for condition 3 File '${FOLDER}' from bank name '${BANK_NAME}' to '${HORSE_LIST}' นิติบุคคล
    Create Directory     ${CURDIR}/${FOLDER}
    ${bank_dict} =    Create Dictionary    ธนาคารกรุงเทพ จำกัด (มหาชน)=BBL    ธนาคารกสิกรไทย จำกัด (มหาชน)=KBNK    ธนาคารกรุงไทย จำกัด (มหาชน)=KTB    ธนาคาร เจพีมอร์แกน เชส=JPMC    ธนาคาร โอเวอร์ซี-ไชนีสแบงกิ้งคอร์ปอเรชั่น จํากัด=OCBC    ธนาคารทหารไทยธนชาต จำกัด (มหาชน)=TTB    ธนาคารไทยพาณิชย์ จำกัด (มหาชน)=SCB    ธนาคารซิตี้แบงก์=CITI    ธนาคารซูมิโตโม มิตซุย แบงกิ้ง คอร์ปอเรชั่น=SMBC    ธนาคารสแตนดาร์ดชาร์เตอร์ด(ไทย) จำกัด (มหาชน)=SCBT    ธนาคาร ซีไอเอ็มบี ไทย จำกัด (มหาชน)=CMBT    ธนาคาร อาร์ เอช บี จำกัด=RHB    ธนาคารยูโอบี จำกัด (มหาชน)=UOBT    ธนาคารกรุงศรีอยุธยา จำกัด (มหาชน)=BAY    ธนาคารเมกะ สากลพาณิชย์ จำกัด (มหาชน)=MEGA    ธนาคารแห่งอเมริกา เนชั่นแนล แอสโซซิเอชั่น=BOA    ธนาคารอินเดียนโอเวอร์ซีส์=IOB    ธนาคารออมสิน=GSB    ธนาคารฮ่องกงและเซี่ยงไฮ้แบงกิ้ง คอร์ปอเรชั่น จำกัด=HSBC    ธนาคารดอยซ์แบงก์=DB    ธนาคารอาคารสงเคราะห์=GHB    ธนาคารเพื่อการเกษตรและสหกรณ์=BAAC    ธนาคารเพื่อการส่งออกและนำเข้าแห่งประเทศไทย=EXIM    ธนาคารมิซูโฮ จำกัด=MHCB    ธนาคารบีเอ็นพี พารีบาส์=BNPP    ธนาคารแห่งประเทศจีน จำกัด=BOC    ธนาคารอิสลามแห่งประเทศไทย=ISBT    ธนาคารทิสโก้ จำกัด (มหาชน)=TSCO    ธนาคารเกียรตินาคินภัทร จำกัด (มหาชน)=KKP    ธนาคารไอซีบีซี (ไทย) จำกัด (มหาชน)=ICBC    ธนาคารไทยเครดิต จำกัด (มหาชน)=TCRB    ธนาคารแลนด์ แอนด์ เฮ้าส์ จำกัด (มหาชน)=LHB    ธนาคารซูมิโตโม มิตซุย ทรัสต์ (ไทย) จำกัด (มหาชน)=SMTB    ธนาคารพัฒนาวิสาหกิจขนาดกลางและขนาดย่อมแห่งประเทศไทย=SME
    ${bank_name_dict} =    Create Dictionary    BBL=ธนาคารกรุงเทพ จำกัด (มหาชน)     KBNK=ธนาคารกสิกรไทย จำกัด (มหาชน)    KTB=ธนาคารกรุงไทย จำกัด (มหาชน)    JPMC=ธนาคาร เจพีมอร์แกน เชส    OCBC=ธนาคาร โอเวอร์ซี-ไชนีสแบงกิ้งคอร์ปอเรชั่น จํากัด    TTB=ธนาคารทหารไทยธนชาต จำกัด (มหาชน)     SCB=ธนาคารไทยพาณิชย์ จำกัด (มหาชน)     CITI=ธนาคารซิตี้แบงก์     SMBC=ธนาคารซูมิโตโม มิตซุย แบงกิ้ง คอร์ปอเรชั่น     SCBT=ธนาคารสแตนดาร์ดชาร์เตอร์ด(ไทย) จำกัด (มหาชน)     CMBT=ธนาคาร ซีไอเอ็มบี ไทย จำกัด (มหาชน)     RHB=ธนาคาร อาร์ เอช บี จำกัด     UOBT=ธนาคารยูโอบี จำกัด (มหาชน)     BAY=ธนาคารกรุงศรีอยุธยา จำกัด (มหาชน)     MEGA=ธนาคารเมกะ สากลพาณิชย์ จำกัด (มหาชน)     BOA=ธนาคารแห่งอเมริกา เนชั่นแนล แอสโซซิเอชั่น     IOB=ธนาคารอินเดียนโอเวอร์ซีส์     GSB=ธนาคารออมสิน     HSBC=ธนาคารฮ่องกงและเซี่ยงไฮ้แบงกิ้ง คอร์ปอเรชั่น จำกัด     DB=ธนาคารดอยซ์แบงก์     GHB=ธนาคารอาคารสงเคราะห์     BAAC=ธนาคารเพื่อการเกษตรและสหกรณ์     EXIM=ธนาคารเพื่อการส่งออกและนำเข้าแห่งประเทศไทย     MHCB=ธนาคารมิซูโฮ จำกัด     BNPP=ธนาคารบีเอ็นพี พารีบาส์     BOC=ธนาคารแห่งประเทศจีน จำกัด     ISBT=ธนาคารอิสลามแห่งประเทศไทย     TSCO=ธนาคารทิสโก้ จำกัด (มหาชน)     KKP=ธนาคารเกียรตินาคินภัทร จำกัด (มหาชน)     ICBC=ธนาคารไอซีบีซี (ไทย) จำกัด (มหาชน)     TCRB=ธนาคารไทยเครดิต จำกัด (มหาชน)     LHB=ธนาคารแลนด์ แอนด์ เฮ้าส์ จำกัด (มหาชน)     SMTB=ธนาคารซูมิโตโม มิตซุย ทรัสต์ (ไทย) จำกัด (มหาชน)     SME=ธนาคารพัฒนาวิสาหกิจขนาดกลางและขนาดย่อมแห่งประเทศไทย
    set test variable   ${bank_dict}
    set test variable   ${bank_name_dict}
    Open Excel Document      filename=${CURDIR}/Mastercase_Template.xlsx   doc_id=docname1
    ${master_case_id}=    create master case id of bank name '${BANK_NAME}'
    set test variable   ${master_case_id}
    Write Excel Cell	3   1    ${master_case_id}    sheet_name=CreateBankCase
    ${police_section}=    การตรวจพบรายการ คือ 'ผู้เสียหายแจ้งเอง มาตรา 7'
    Write Excel Cell	3   5    ${police_section}    sheet_name=CreateBankCase
    ${police_section}=    การตรวจพบรายการ คือ 'ผู้เสียหายแจ้งเอง มาตรา 7'
    Write Excel Cell	3   5    ${police_section}    sheet_name=CreateBankCase
    set test variable    ${master_file_name}    Mastercase_${master_case_id}
    Save Excel Document      filename=${CURDIR}/${FOLDER}/${master_file_name}.xlsx
    Close Current Excel Document
    set test variable    ${test_case_name}    ${FOLDER}
    Create victim information condition 2 '${FOLDER}/${master_file_name}' of bank name '${bank_name_dict}[${BANK_NAME}]'
    Create transaction to banks '${HORSE_LIST}' in '${FOLDER}/${master_file_name}' นิติบุคคล
    Add Master Case via API '${FOLDER}/${master_file_name}' bank name '${BANK_NAME}'

Create Master Case for condition 3 File '${FOLDER}' from bank name '${BANK_NAME}' to '${HORSE_LIST}' ชาวต่างชาติ
    Create Directory     ${CURDIR}/${FOLDER}
    ${bank_dict} =    Create Dictionary    ธนาคารกรุงเทพ จำกัด (มหาชน)=BBL    ธนาคารกสิกรไทย จำกัด (มหาชน)=KBNK    ธนาคารกรุงไทย จำกัด (มหาชน)=KTB    ธนาคาร เจพีมอร์แกน เชส=JPMC    ธนาคาร โอเวอร์ซี-ไชนีสแบงกิ้งคอร์ปอเรชั่น จํากัด=OCBC    ธนาคารทหารไทยธนชาต จำกัด (มหาชน)=TTB    ธนาคารไทยพาณิชย์ จำกัด (มหาชน)=SCB    ธนาคารซิตี้แบงก์=CITI    ธนาคารซูมิโตโม มิตซุย แบงกิ้ง คอร์ปอเรชั่น=SMBC    ธนาคารสแตนดาร์ดชาร์เตอร์ด(ไทย) จำกัด (มหาชน)=SCBT    ธนาคาร ซีไอเอ็มบี ไทย จำกัด (มหาชน)=CMBT    ธนาคาร อาร์ เอช บี จำกัด=RHB    ธนาคารยูโอบี จำกัด (มหาชน)=UOBT    ธนาคารกรุงศรีอยุธยา จำกัด (มหาชน)=BAY    ธนาคารเมกะ สากลพาณิชย์ จำกัด (มหาชน)=MEGA    ธนาคารแห่งอเมริกา เนชั่นแนล แอสโซซิเอชั่น=BOA    ธนาคารอินเดียนโอเวอร์ซีส์=IOB    ธนาคารออมสิน=GSB    ธนาคารฮ่องกงและเซี่ยงไฮ้แบงกิ้ง คอร์ปอเรชั่น จำกัด=HSBC    ธนาคารดอยซ์แบงก์=DB    ธนาคารอาคารสงเคราะห์=GHB    ธนาคารเพื่อการเกษตรและสหกรณ์=BAAC    ธนาคารเพื่อการส่งออกและนำเข้าแห่งประเทศไทย=EXIM    ธนาคารมิซูโฮ จำกัด=MHCB    ธนาคารบีเอ็นพี พารีบาส์=BNPP    ธนาคารแห่งประเทศจีน จำกัด=BOC    ธนาคารอิสลามแห่งประเทศไทย=ISBT    ธนาคารทิสโก้ จำกัด (มหาชน)=TSCO    ธนาคารเกียรตินาคินภัทร จำกัด (มหาชน)=KKP    ธนาคารไอซีบีซี (ไทย) จำกัด (มหาชน)=ICBC    ธนาคารไทยเครดิต จำกัด (มหาชน)=TCRB    ธนาคารแลนด์ แอนด์ เฮ้าส์ จำกัด (มหาชน)=LHB    ธนาคารซูมิโตโม มิตซุย ทรัสต์ (ไทย) จำกัด (มหาชน)=SMTB    ธนาคารพัฒนาวิสาหกิจขนาดกลางและขนาดย่อมแห่งประเทศไทย=SME
    ${bank_name_dict} =    Create Dictionary    BBL=ธนาคารกรุงเทพ จำกัด (มหาชน)     KBNK=ธนาคารกสิกรไทย จำกัด (มหาชน)    KTB=ธนาคารกรุงไทย จำกัด (มหาชน)    JPMC=ธนาคาร เจพีมอร์แกน เชส    OCBC=ธนาคาร โอเวอร์ซี-ไชนีสแบงกิ้งคอร์ปอเรชั่น จํากัด    TTB=ธนาคารทหารไทยธนชาต จำกัด (มหาชน)     SCB=ธนาคารไทยพาณิชย์ จำกัด (มหาชน)     CITI=ธนาคารซิตี้แบงก์     SMBC=ธนาคารซูมิโตโม มิตซุย แบงกิ้ง คอร์ปอเรชั่น     SCBT=ธนาคารสแตนดาร์ดชาร์เตอร์ด(ไทย) จำกัด (มหาชน)     CMBT=ธนาคาร ซีไอเอ็มบี ไทย จำกัด (มหาชน)     RHB=ธนาคาร อาร์ เอช บี จำกัด     UOBT=ธนาคารยูโอบี จำกัด (มหาชน)     BAY=ธนาคารกรุงศรีอยุธยา จำกัด (มหาชน)     MEGA=ธนาคารเมกะ สากลพาณิชย์ จำกัด (มหาชน)     BOA=ธนาคารแห่งอเมริกา เนชั่นแนล แอสโซซิเอชั่น     IOB=ธนาคารอินเดียนโอเวอร์ซีส์     GSB=ธนาคารออมสิน     HSBC=ธนาคารฮ่องกงและเซี่ยงไฮ้แบงกิ้ง คอร์ปอเรชั่น จำกัด     DB=ธนาคารดอยซ์แบงก์     GHB=ธนาคารอาคารสงเคราะห์     BAAC=ธนาคารเพื่อการเกษตรและสหกรณ์     EXIM=ธนาคารเพื่อการส่งออกและนำเข้าแห่งประเทศไทย     MHCB=ธนาคารมิซูโฮ จำกัด     BNPP=ธนาคารบีเอ็นพี พารีบาส์     BOC=ธนาคารแห่งประเทศจีน จำกัด     ISBT=ธนาคารอิสลามแห่งประเทศไทย     TSCO=ธนาคารทิสโก้ จำกัด (มหาชน)     KKP=ธนาคารเกียรตินาคินภัทร จำกัด (มหาชน)     ICBC=ธนาคารไอซีบีซี (ไทย) จำกัด (มหาชน)     TCRB=ธนาคารไทยเครดิต จำกัด (มหาชน)     LHB=ธนาคารแลนด์ แอนด์ เฮ้าส์ จำกัด (มหาชน)     SMTB=ธนาคารซูมิโตโม มิตซุย ทรัสต์ (ไทย) จำกัด (มหาชน)     SME=ธนาคารพัฒนาวิสาหกิจขนาดกลางและขนาดย่อมแห่งประเทศไทย
    set test variable   ${bank_dict}
    set test variable   ${bank_name_dict}
    Open Excel Document      filename=${CURDIR}/Mastercase_Template.xlsx   doc_id=docname1
    ${master_case_id}=    create master case id of bank name '${BANK_NAME}'
    set test variable   ${master_case_id}
    Write Excel Cell	3   1    ${master_case_id}    sheet_name=CreateBankCase
    ${police_section}=    การตรวจพบรายการ คือ 'ผู้เสียหายแจ้งเอง มาตรา 7'
    Write Excel Cell	3   5    ${police_section}    sheet_name=CreateBankCase
    ${police_section}=    การตรวจพบรายการ คือ 'ผู้เสียหายแจ้งเอง มาตรา 7'
    Write Excel Cell	3   5    ${police_section}    sheet_name=CreateBankCase
    set test variable    ${master_file_name}    Mastercase_${master_case_id}
    Save Excel Document      filename=${CURDIR}/${FOLDER}/${master_file_name}.xlsx
    Close Current Excel Document
    set test variable    ${test_case_name}    ${FOLDER}
    Create victim information condition 2 '${FOLDER}/${master_file_name}' of bank name '${bank_name_dict}[${BANK_NAME}]'
    Create transaction to banks '${HORSE_LIST}' in '${FOLDER}/${master_file_name}' ชาวต่างชาติ
    Add Master Case via API '${FOLDER}/${master_file_name}' bank name '${BANK_NAME}'

Create Master Case for condition 3 File '${FOLDER}' from bank name '${BANK_NAME}' to relation '${HORSE_LIST}' ลักษณะเคสซื้อขายสินค้า
    Create Directory     ${CURDIR}/${FOLDER}
    ${bank_dict} =    Create Dictionary    ธนาคารกรุงเทพ จำกัด (มหาชน)=BBL    ธนาคารกสิกรไทย จำกัด (มหาชน)=KBNK    ธนาคารกรุงไทย จำกัด (มหาชน)=KTB    ธนาคาร เจพีมอร์แกน เชส=JPMC    ธนาคาร โอเวอร์ซี-ไชนีสแบงกิ้งคอร์ปอเรชั่น จํากัด=OCBC    ธนาคารทหารไทยธนชาต จำกัด (มหาชน)=TTB    ธนาคารไทยพาณิชย์ จำกัด (มหาชน)=SCB    ธนาคารซิตี้แบงก์=CITI    ธนาคารซูมิโตโม มิตซุย แบงกิ้ง คอร์ปอเรชั่น=SMBC    ธนาคารสแตนดาร์ดชาร์เตอร์ด(ไทย) จำกัด (มหาชน)=SCBT    ธนาคาร ซีไอเอ็มบี ไทย จำกัด (มหาชน)=CMBT    ธนาคาร อาร์ เอช บี จำกัด=RHB    ธนาคารยูโอบี จำกัด (มหาชน)=UOBT    ธนาคารกรุงศรีอยุธยา จำกัด (มหาชน)=BAY    ธนาคารเมกะ สากลพาณิชย์ จำกัด (มหาชน)=MEGA    ธนาคารแห่งอเมริกา เนชั่นแนล แอสโซซิเอชั่น=BOA    ธนาคารอินเดียนโอเวอร์ซีส์=IOB    ธนาคารออมสิน=GSB    ธนาคารฮ่องกงและเซี่ยงไฮ้แบงกิ้ง คอร์ปอเรชั่น จำกัด=HSBC    ธนาคารดอยซ์แบงก์=DB    ธนาคารอาคารสงเคราะห์=GHB    ธนาคารเพื่อการเกษตรและสหกรณ์=BAAC    ธนาคารเพื่อการส่งออกและนำเข้าแห่งประเทศไทย=EXIM    ธนาคารมิซูโฮ จำกัด=MHCB    ธนาคารบีเอ็นพี พารีบาส์=BNPP    ธนาคารแห่งประเทศจีน จำกัด=BOC    ธนาคารอิสลามแห่งประเทศไทย=ISBT    ธนาคารทิสโก้ จำกัด (มหาชน)=TSCO    ธนาคารเกียรตินาคินภัทร จำกัด (มหาชน)=KKP    ธนาคารไอซีบีซี (ไทย) จำกัด (มหาชน)=ICBC    ธนาคารไทยเครดิต จำกัด (มหาชน)=TCRB    ธนาคารแลนด์ แอนด์ เฮ้าส์ จำกัด (มหาชน)=LHB    ธนาคารซูมิโตโม มิตซุย ทรัสต์ (ไทย) จำกัด (มหาชน)=SMTB    ธนาคารพัฒนาวิสาหกิจขนาดกลางและขนาดย่อมแห่งประเทศไทย=SME
    ${bank_name_dict} =    Create Dictionary    BBL=ธนาคารกรุงเทพ จำกัด (มหาชน)     KBNK=ธนาคารกสิกรไทย จำกัด (มหาชน)    KTB=ธนาคารกรุงไทย จำกัด (มหาชน)    JPMC=ธนาคาร เจพีมอร์แกน เชส    OCBC=ธนาคาร โอเวอร์ซี-ไชนีสแบงกิ้งคอร์ปอเรชั่น จํากัด    TTB=ธนาคารทหารไทยธนชาต จำกัด (มหาชน)     SCB=ธนาคารไทยพาณิชย์ จำกัด (มหาชน)     CITI=ธนาคารซิตี้แบงก์     SMBC=ธนาคารซูมิโตโม มิตซุย แบงกิ้ง คอร์ปอเรชั่น     SCBT=ธนาคารสแตนดาร์ดชาร์เตอร์ด(ไทย) จำกัด (มหาชน)     CMBT=ธนาคาร ซีไอเอ็มบี ไทย จำกัด (มหาชน)     RHB=ธนาคาร อาร์ เอช บี จำกัด     UOBT=ธนาคารยูโอบี จำกัด (มหาชน)     BAY=ธนาคารกรุงศรีอยุธยา จำกัด (มหาชน)     MEGA=ธนาคารเมกะ สากลพาณิชย์ จำกัด (มหาชน)     BOA=ธนาคารแห่งอเมริกา เนชั่นแนล แอสโซซิเอชั่น     IOB=ธนาคารอินเดียนโอเวอร์ซีส์     GSB=ธนาคารออมสิน     HSBC=ธนาคารฮ่องกงและเซี่ยงไฮ้แบงกิ้ง คอร์ปอเรชั่น จำกัด     DB=ธนาคารดอยซ์แบงก์     GHB=ธนาคารอาคารสงเคราะห์     BAAC=ธนาคารเพื่อการเกษตรและสหกรณ์     EXIM=ธนาคารเพื่อการส่งออกและนำเข้าแห่งประเทศไทย     MHCB=ธนาคารมิซูโฮ จำกัด     BNPP=ธนาคารบีเอ็นพี พารีบาส์     BOC=ธนาคารแห่งประเทศจีน จำกัด     ISBT=ธนาคารอิสลามแห่งประเทศไทย     TSCO=ธนาคารทิสโก้ จำกัด (มหาชน)     KKP=ธนาคารเกียรตินาคินภัทร จำกัด (มหาชน)     ICBC=ธนาคารไอซีบีซี (ไทย) จำกัด (มหาชน)     TCRB=ธนาคารไทยเครดิต จำกัด (มหาชน)     LHB=ธนาคารแลนด์ แอนด์ เฮ้าส์ จำกัด (มหาชน)     SMTB=ธนาคารซูมิโตโม มิตซุย ทรัสต์ (ไทย) จำกัด (มหาชน)     SME=ธนาคารพัฒนาวิสาหกิจขนาดกลางและขนาดย่อมแห่งประเทศไทย
    set test variable   ${bank_dict}
    set test variable   ${bank_name_dict}
    Open Excel Document      filename=${CURDIR}/Mastercase_Template.xlsx   doc_id=docname1
    ${master_case_id}=    create master case id of bank name '${BANK_NAME}'
    set test variable   ${master_case_id}
    Write Excel Cell	3   1    ${master_case_id}    sheet_name=CreateBankCase
    ${police_section}=    การตรวจพบรายการ คือ 'ผู้เสียหายแจ้งเอง มาตรา 7'
    Write Excel Cell	3   5    ${police_section}    sheet_name=CreateBankCase
    ${police_section}=    การตรวจพบรายการ คือ 'ผู้เสียหายแจ้งเอง มาตรา 7'
    Write Excel Cell	3   5    ${police_section}    sheet_name=CreateBankCase
    set test variable    ${master_file_name}    Mastercase_${master_case_id}
    Save Excel Document      filename=${CURDIR}/${FOLDER}/${master_file_name}.xlsx
    Close Current Excel Document
    Create victim information condition 2 ลักษณะเคสซื้อขายสินค้า '${FOLDER}/${master_file_name}' of bank name '${bank_name_dict}[${BANK_NAME}]'
    Create transaction with relation to banks '${HORSE_LIST}' in '${FOLDER}/${master_file_name}'
    Add Master Case via API '${FOLDER}/${master_file_name}' bank name '${BANK_NAME}'

Create Master Case for condition 3 File '${FOLDER}' from bank name '${BANK_NAME}' to relation '${HORSE_LIST}' ไม่มีข้อมูลเลขบัตรประชาชน
    Create Directory     ${CURDIR}/${FOLDER}
    ${bank_dict} =    Create Dictionary    ธนาคารกรุงเทพ จำกัด (มหาชน)=BBL    ธนาคารกสิกรไทย จำกัด (มหาชน)=KBNK    ธนาคารกรุงไทย จำกัด (มหาชน)=KTB    ธนาคาร เจพีมอร์แกน เชส=JPMC    ธนาคาร โอเวอร์ซี-ไชนีสแบงกิ้งคอร์ปอเรชั่น จํากัด=OCBC    ธนาคารทหารไทยธนชาต จำกัด (มหาชน)=TTB    ธนาคารไทยพาณิชย์ จำกัด (มหาชน)=SCB    ธนาคารซิตี้แบงก์=CITI    ธนาคารซูมิโตโม มิตซุย แบงกิ้ง คอร์ปอเรชั่น=SMBC    ธนาคารสแตนดาร์ดชาร์เตอร์ด(ไทย) จำกัด (มหาชน)=SCBT    ธนาคาร ซีไอเอ็มบี ไทย จำกัด (มหาชน)=CMBT    ธนาคาร อาร์ เอช บี จำกัด=RHB    ธนาคารยูโอบี จำกัด (มหาชน)=UOBT    ธนาคารกรุงศรีอยุธยา จำกัด (มหาชน)=BAY    ธนาคารเมกะ สากลพาณิชย์ จำกัด (มหาชน)=MEGA    ธนาคารแห่งอเมริกา เนชั่นแนล แอสโซซิเอชั่น=BOA    ธนาคารอินเดียนโอเวอร์ซีส์=IOB    ธนาคารออมสิน=GSB    ธนาคารฮ่องกงและเซี่ยงไฮ้แบงกิ้ง คอร์ปอเรชั่น จำกัด=HSBC    ธนาคารดอยซ์แบงก์=DB    ธนาคารอาคารสงเคราะห์=GHB    ธนาคารเพื่อการเกษตรและสหกรณ์=BAAC    ธนาคารเพื่อการส่งออกและนำเข้าแห่งประเทศไทย=EXIM    ธนาคารมิซูโฮ จำกัด=MHCB    ธนาคารบีเอ็นพี พารีบาส์=BNPP    ธนาคารแห่งประเทศจีน จำกัด=BOC    ธนาคารอิสลามแห่งประเทศไทย=ISBT    ธนาคารทิสโก้ จำกัด (มหาชน)=TSCO    ธนาคารเกียรตินาคินภัทร จำกัด (มหาชน)=KKP    ธนาคารไอซีบีซี (ไทย) จำกัด (มหาชน)=ICBC    ธนาคารไทยเครดิต จำกัด (มหาชน)=TCRB    ธนาคารแลนด์ แอนด์ เฮ้าส์ จำกัด (มหาชน)=LHB    ธนาคารซูมิโตโม มิตซุย ทรัสต์ (ไทย) จำกัด (มหาชน)=SMTB    ธนาคารพัฒนาวิสาหกิจขนาดกลางและขนาดย่อมแห่งประเทศไทย=SME
    ${bank_name_dict} =    Create Dictionary    BBL=ธนาคารกรุงเทพ จำกัด (มหาชน)     KBNK=ธนาคารกสิกรไทย จำกัด (มหาชน)    KTB=ธนาคารกรุงไทย จำกัด (มหาชน)    JPMC=ธนาคาร เจพีมอร์แกน เชส    OCBC=ธนาคาร โอเวอร์ซี-ไชนีสแบงกิ้งคอร์ปอเรชั่น จํากัด    TTB=ธนาคารทหารไทยธนชาต จำกัด (มหาชน)     SCB=ธนาคารไทยพาณิชย์ จำกัด (มหาชน)     CITI=ธนาคารซิตี้แบงก์     SMBC=ธนาคารซูมิโตโม มิตซุย แบงกิ้ง คอร์ปอเรชั่น     SCBT=ธนาคารสแตนดาร์ดชาร์เตอร์ด(ไทย) จำกัด (มหาชน)     CMBT=ธนาคาร ซีไอเอ็มบี ไทย จำกัด (มหาชน)     RHB=ธนาคาร อาร์ เอช บี จำกัด     UOBT=ธนาคารยูโอบี จำกัด (มหาชน)     BAY=ธนาคารกรุงศรีอยุธยา จำกัด (มหาชน)     MEGA=ธนาคารเมกะ สากลพาณิชย์ จำกัด (มหาชน)     BOA=ธนาคารแห่งอเมริกา เนชั่นแนล แอสโซซิเอชั่น     IOB=ธนาคารอินเดียนโอเวอร์ซีส์     GSB=ธนาคารออมสิน     HSBC=ธนาคารฮ่องกงและเซี่ยงไฮ้แบงกิ้ง คอร์ปอเรชั่น จำกัด     DB=ธนาคารดอยซ์แบงก์     GHB=ธนาคารอาคารสงเคราะห์     BAAC=ธนาคารเพื่อการเกษตรและสหกรณ์     EXIM=ธนาคารเพื่อการส่งออกและนำเข้าแห่งประเทศไทย     MHCB=ธนาคารมิซูโฮ จำกัด     BNPP=ธนาคารบีเอ็นพี พารีบาส์     BOC=ธนาคารแห่งประเทศจีน จำกัด     ISBT=ธนาคารอิสลามแห่งประเทศไทย     TSCO=ธนาคารทิสโก้ จำกัด (มหาชน)     KKP=ธนาคารเกียรตินาคินภัทร จำกัด (มหาชน)     ICBC=ธนาคารไอซีบีซี (ไทย) จำกัด (มหาชน)     TCRB=ธนาคารไทยเครดิต จำกัด (มหาชน)     LHB=ธนาคารแลนด์ แอนด์ เฮ้าส์ จำกัด (มหาชน)     SMTB=ธนาคารซูมิโตโม มิตซุย ทรัสต์ (ไทย) จำกัด (มหาชน)     SME=ธนาคารพัฒนาวิสาหกิจขนาดกลางและขนาดย่อมแห่งประเทศไทย
    set test variable   ${bank_dict}
    set test variable   ${bank_name_dict}
    Open Excel Document      filename=${CURDIR}/Mastercase_Template.xlsx   doc_id=docname1
    ${master_case_id}=    create master case id of bank name '${BANK_NAME}'
    set test variable   ${master_case_id}
    Write Excel Cell	3   1    ${master_case_id}    sheet_name=CreateBankCase
    ${police_section}=    การตรวจพบรายการ คือ 'ผู้เสียหายแจ้งเอง มาตรา 7'
    Write Excel Cell	3   5    ${police_section}    sheet_name=CreateBankCase
    ${police_section}=    การตรวจพบรายการ คือ 'ผู้เสียหายแจ้งเอง มาตรา 7'
    Write Excel Cell	3   5    ${police_section}    sheet_name=CreateBankCase
    set test variable    ${master_file_name}    Mastercase_${master_case_id}
    Save Excel Document      filename=${CURDIR}/${FOLDER}/${master_file_name}.xlsx
    Close Current Excel Document
    Create victim information condition 2 '${FOLDER}/${master_file_name}' of bank name '${bank_name_dict}[${BANK_NAME}]'
    Create transaction with relation to banks '${HORSE_LIST}' in '${FOLDER}/${master_file_name}' ไม่มีข้อมูลเลขบัตรประชาชน
    Add Master Case via API '${FOLDER}/${master_file_name}' bank name '${BANK_NAME}'

Create Master Case for condition 3 File '${FOLDER}' from bank name '${BANK_NAME}' to relation '${HORSE_LIST}'
    Create Directory     ${CURDIR}/${FOLDER}
    ${bank_dict} =    Create Dictionary    ธนาคารกรุงเทพ จำกัด (มหาชน)=BBL    ธนาคารกสิกรไทย จำกัด (มหาชน)=KBNK    ธนาคารกรุงไทย จำกัด (มหาชน)=KTB    ธนาคาร เจพีมอร์แกน เชส=JPMC    ธนาคาร โอเวอร์ซี-ไชนีสแบงกิ้งคอร์ปอเรชั่น จํากัด=OCBC    ธนาคารทหารไทยธนชาต จำกัด (มหาชน)=TTB    ธนาคารไทยพาณิชย์ จำกัด (มหาชน)=SCB    ธนาคารซิตี้แบงก์=CITI    ธนาคารซูมิโตโม มิตซุย แบงกิ้ง คอร์ปอเรชั่น=SMBC    ธนาคารสแตนดาร์ดชาร์เตอร์ด(ไทย) จำกัด (มหาชน)=SCBT    ธนาคาร ซีไอเอ็มบี ไทย จำกัด (มหาชน)=CMBT    ธนาคาร อาร์ เอช บี จำกัด=RHB    ธนาคารยูโอบี จำกัด (มหาชน)=UOBT    ธนาคารกรุงศรีอยุธยา จำกัด (มหาชน)=BAY    ธนาคารเมกะ สากลพาณิชย์ จำกัด (มหาชน)=MEGA    ธนาคารแห่งอเมริกา เนชั่นแนล แอสโซซิเอชั่น=BOA    ธนาคารอินเดียนโอเวอร์ซีส์=IOB    ธนาคารออมสิน=GSB    ธนาคารฮ่องกงและเซี่ยงไฮ้แบงกิ้ง คอร์ปอเรชั่น จำกัด=HSBC    ธนาคารดอยซ์แบงก์=DB    ธนาคารอาคารสงเคราะห์=GHB    ธนาคารเพื่อการเกษตรและสหกรณ์=BAAC    ธนาคารเพื่อการส่งออกและนำเข้าแห่งประเทศไทย=EXIM    ธนาคารมิซูโฮ จำกัด=MHCB    ธนาคารบีเอ็นพี พารีบาส์=BNPP    ธนาคารแห่งประเทศจีน จำกัด=BOC    ธนาคารอิสลามแห่งประเทศไทย=ISBT    ธนาคารทิสโก้ จำกัด (มหาชน)=TSCO    ธนาคารเกียรตินาคินภัทร จำกัด (มหาชน)=KKP    ธนาคารไอซีบีซี (ไทย) จำกัด (มหาชน)=ICBC    ธนาคารไทยเครดิต จำกัด (มหาชน)=TCRB    ธนาคารแลนด์ แอนด์ เฮ้าส์ จำกัด (มหาชน)=LHB    ธนาคารซูมิโตโม มิตซุย ทรัสต์ (ไทย) จำกัด (มหาชน)=SMTB    ธนาคารพัฒนาวิสาหกิจขนาดกลางและขนาดย่อมแห่งประเทศไทย=SME
    ${bank_name_dict} =    Create Dictionary    BBL=ธนาคารกรุงเทพ จำกัด (มหาชน)     KBNK=ธนาคารกสิกรไทย จำกัด (มหาชน)    KTB=ธนาคารกรุงไทย จำกัด (มหาชน)    JPMC=ธนาคาร เจพีมอร์แกน เชส    OCBC=ธนาคาร โอเวอร์ซี-ไชนีสแบงกิ้งคอร์ปอเรชั่น จํากัด    TTB=ธนาคารทหารไทยธนชาต จำกัด (มหาชน)     SCB=ธนาคารไทยพาณิชย์ จำกัด (มหาชน)     CITI=ธนาคารซิตี้แบงก์     SMBC=ธนาคารซูมิโตโม มิตซุย แบงกิ้ง คอร์ปอเรชั่น     SCBT=ธนาคารสแตนดาร์ดชาร์เตอร์ด(ไทย) จำกัด (มหาชน)     CMBT=ธนาคาร ซีไอเอ็มบี ไทย จำกัด (มหาชน)     RHB=ธนาคาร อาร์ เอช บี จำกัด     UOBT=ธนาคารยูโอบี จำกัด (มหาชน)     BAY=ธนาคารกรุงศรีอยุธยา จำกัด (มหาชน)     MEGA=ธนาคารเมกะ สากลพาณิชย์ จำกัด (มหาชน)     BOA=ธนาคารแห่งอเมริกา เนชั่นแนล แอสโซซิเอชั่น     IOB=ธนาคารอินเดียนโอเวอร์ซีส์     GSB=ธนาคารออมสิน     HSBC=ธนาคารฮ่องกงและเซี่ยงไฮ้แบงกิ้ง คอร์ปอเรชั่น จำกัด     DB=ธนาคารดอยซ์แบงก์     GHB=ธนาคารอาคารสงเคราะห์     BAAC=ธนาคารเพื่อการเกษตรและสหกรณ์     EXIM=ธนาคารเพื่อการส่งออกและนำเข้าแห่งประเทศไทย     MHCB=ธนาคารมิซูโฮ จำกัด     BNPP=ธนาคารบีเอ็นพี พารีบาส์     BOC=ธนาคารแห่งประเทศจีน จำกัด     ISBT=ธนาคารอิสลามแห่งประเทศไทย     TSCO=ธนาคารทิสโก้ จำกัด (มหาชน)     KKP=ธนาคารเกียรตินาคินภัทร จำกัด (มหาชน)     ICBC=ธนาคารไอซีบีซี (ไทย) จำกัด (มหาชน)     TCRB=ธนาคารไทยเครดิต จำกัด (มหาชน)     LHB=ธนาคารแลนด์ แอนด์ เฮ้าส์ จำกัด (มหาชน)     SMTB=ธนาคารซูมิโตโม มิตซุย ทรัสต์ (ไทย) จำกัด (มหาชน)     SME=ธนาคารพัฒนาวิสาหกิจขนาดกลางและขนาดย่อมแห่งประเทศไทย
    set test variable   ${bank_dict}
    set test variable   ${bank_name_dict}
    Open Excel Document      filename=${CURDIR}/Mastercase_Template.xlsx   doc_id=docname1
    ${master_case_id}=    create master case id of bank name '${BANK_NAME}'
    set test variable   ${master_case_id}
    Write Excel Cell	3   1    ${master_case_id}    sheet_name=CreateBankCase
    ${police_section}=    การตรวจพบรายการ คือ 'ผู้เสียหายแจ้งเอง มาตรา 7'
    Write Excel Cell	3   5    ${police_section}    sheet_name=CreateBankCase
    ${police_section}=    การตรวจพบรายการ คือ 'ผู้เสียหายแจ้งเอง มาตรา 7'
    Write Excel Cell	3   5    ${police_section}    sheet_name=CreateBankCase
    set test variable    ${master_file_name}    Mastercase_${master_case_id}
    Save Excel Document      filename=${CURDIR}/${FOLDER}/${master_file_name}.xlsx
    Close Current Excel Document
    Create victim information condition 2 '${FOLDER}/${master_file_name}' of bank name '${bank_name_dict}[${BANK_NAME}]'
    Create transaction with relation to banks '${HORSE_LIST}' in '${FOLDER}/${master_file_name}'
    Add Master Case via API '${FOLDER}/${master_file_name}' bank name '${BANK_NAME}'


Create Master Case for condition 3 File '${FOLDER}' from bank name '${BANK_NAME}' to relation '${HORSE_LIST}' personal null 3
    Create Directory     ${CURDIR}/${FOLDER}
    ${bank_dict} =    Create Dictionary    ธนาคารกรุงเทพ จำกัด (มหาชน)=BBL    ธนาคารกสิกรไทย จำกัด (มหาชน)=KBNK    ธนาคารกรุงไทย จำกัด (มหาชน)=KTB    ธนาคาร เจพีมอร์แกน เชส=JPMC    ธนาคาร โอเวอร์ซี-ไชนีสแบงกิ้งคอร์ปอเรชั่น จํากัด=OCBC    ธนาคารทหารไทยธนชาต จำกัด (มหาชน)=TTB    ธนาคารไทยพาณิชย์ จำกัด (มหาชน)=SCB    ธนาคารซิตี้แบงก์=CITI    ธนาคารซูมิโตโม มิตซุย แบงกิ้ง คอร์ปอเรชั่น=SMBC    ธนาคารสแตนดาร์ดชาร์เตอร์ด(ไทย) จำกัด (มหาชน)=SCBT    ธนาคาร ซีไอเอ็มบี ไทย จำกัด (มหาชน)=CMBT    ธนาคาร อาร์ เอช บี จำกัด=RHB    ธนาคารยูโอบี จำกัด (มหาชน)=UOBT    ธนาคารกรุงศรีอยุธยา จำกัด (มหาชน)=BAY    ธนาคารเมกะ สากลพาณิชย์ จำกัด (มหาชน)=MEGA    ธนาคารแห่งอเมริกา เนชั่นแนล แอสโซซิเอชั่น=BOA    ธนาคารอินเดียนโอเวอร์ซีส์=IOB    ธนาคารออมสิน=GSB    ธนาคารฮ่องกงและเซี่ยงไฮ้แบงกิ้ง คอร์ปอเรชั่น จำกัด=HSBC    ธนาคารดอยซ์แบงก์=DB    ธนาคารอาคารสงเคราะห์=GHB    ธนาคารเพื่อการเกษตรและสหกรณ์=BAAC    ธนาคารเพื่อการส่งออกและนำเข้าแห่งประเทศไทย=EXIM    ธนาคารมิซูโฮ จำกัด=MHCB    ธนาคารบีเอ็นพี พารีบาส์=BNPP    ธนาคารแห่งประเทศจีน จำกัด=BOC    ธนาคารอิสลามแห่งประเทศไทย=ISBT    ธนาคารทิสโก้ จำกัด (มหาชน)=TSCO    ธนาคารเกียรตินาคินภัทร จำกัด (มหาชน)=KKP    ธนาคารไอซีบีซี (ไทย) จำกัด (มหาชน)=ICBC    ธนาคารไทยเครดิต จำกัด (มหาชน)=TCRB    ธนาคารแลนด์ แอนด์ เฮ้าส์ จำกัด (มหาชน)=LHB    ธนาคารซูมิโตโม มิตซุย ทรัสต์ (ไทย) จำกัด (มหาชน)=SMTB    ธนาคารพัฒนาวิสาหกิจขนาดกลางและขนาดย่อมแห่งประเทศไทย=SME
    ${bank_name_dict} =    Create Dictionary    BBL=ธนาคารกรุงเทพ จำกัด (มหาชน)     KBNK=ธนาคารกสิกรไทย จำกัด (มหาชน)    KTB=ธนาคารกรุงไทย จำกัด (มหาชน)    JPMC=ธนาคาร เจพีมอร์แกน เชส    OCBC=ธนาคาร โอเวอร์ซี-ไชนีสแบงกิ้งคอร์ปอเรชั่น จํากัด    TTB=ธนาคารทหารไทยธนชาต จำกัด (มหาชน)     SCB=ธนาคารไทยพาณิชย์ จำกัด (มหาชน)     CITI=ธนาคารซิตี้แบงก์     SMBC=ธนาคารซูมิโตโม มิตซุย แบงกิ้ง คอร์ปอเรชั่น     SCBT=ธนาคารสแตนดาร์ดชาร์เตอร์ด(ไทย) จำกัด (มหาชน)     CMBT=ธนาคาร ซีไอเอ็มบี ไทย จำกัด (มหาชน)     RHB=ธนาคาร อาร์ เอช บี จำกัด     UOBT=ธนาคารยูโอบี จำกัด (มหาชน)     BAY=ธนาคารกรุงศรีอยุธยา จำกัด (มหาชน)     MEGA=ธนาคารเมกะ สากลพาณิชย์ จำกัด (มหาชน)     BOA=ธนาคารแห่งอเมริกา เนชั่นแนล แอสโซซิเอชั่น     IOB=ธนาคารอินเดียนโอเวอร์ซีส์     GSB=ธนาคารออมสิน     HSBC=ธนาคารฮ่องกงและเซี่ยงไฮ้แบงกิ้ง คอร์ปอเรชั่น จำกัด     DB=ธนาคารดอยซ์แบงก์     GHB=ธนาคารอาคารสงเคราะห์     BAAC=ธนาคารเพื่อการเกษตรและสหกรณ์     EXIM=ธนาคารเพื่อการส่งออกและนำเข้าแห่งประเทศไทย     MHCB=ธนาคารมิซูโฮ จำกัด     BNPP=ธนาคารบีเอ็นพี พารีบาส์     BOC=ธนาคารแห่งประเทศจีน จำกัด     ISBT=ธนาคารอิสลามแห่งประเทศไทย     TSCO=ธนาคารทิสโก้ จำกัด (มหาชน)     KKP=ธนาคารเกียรตินาคินภัทร จำกัด (มหาชน)     ICBC=ธนาคารไอซีบีซี (ไทย) จำกัด (มหาชน)     TCRB=ธนาคารไทยเครดิต จำกัด (มหาชน)     LHB=ธนาคารแลนด์ แอนด์ เฮ้าส์ จำกัด (มหาชน)     SMTB=ธนาคารซูมิโตโม มิตซุย ทรัสต์ (ไทย) จำกัด (มหาชน)     SME=ธนาคารพัฒนาวิสาหกิจขนาดกลางและขนาดย่อมแห่งประเทศไทย
    set test variable   ${bank_dict}
    set test variable   ${bank_name_dict}
    Open Excel Document      filename=${CURDIR}/Mastercase_Template.xlsx   doc_id=docname1
    ${master_case_id}=    create master case id of bank name '${BANK_NAME}'
    set test variable   ${master_case_id}
    Write Excel Cell	3   1    ${master_case_id}    sheet_name=CreateBankCase
    ${police_section}=    การตรวจพบรายการ คือ 'ผู้เสียหายแจ้งเอง มาตรา 7'
    Write Excel Cell	3   5    ${police_section}    sheet_name=CreateBankCase
    ${police_section}=    การตรวจพบรายการ คือ 'ผู้เสียหายแจ้งเอง มาตรา 7'
    Write Excel Cell	3   5    ${police_section}    sheet_name=CreateBankCase
    set test variable    ${master_file_name}    Mastercase_${master_case_id}
    Save Excel Document      filename=${CURDIR}/${FOLDER}/${master_file_name}.xlsx
    Close Current Excel Document
    Create victim information condition 2 '${FOLDER}/${master_file_name}' of bank name '${bank_name_dict}[${BANK_NAME}]'
    Create transaction with relation to banks '${HORSE_LIST}' in '${FOLDER}/${master_file_name}' personal null 3
    Add Master Case via API '${FOLDER}/${master_file_name}' bank name '${BANK_NAME}'

Create Master Case for condition 3 File '${FOLDER}' from bank name '${BANK_NAME}' to relation '${HORSE_LIST}' นิติบุคคล
    Create Directory     ${CURDIR}/${FOLDER}
    ${bank_dict} =    Create Dictionary    ธนาคารกรุงเทพ จำกัด (มหาชน)=BBL    ธนาคารกสิกรไทย จำกัด (มหาชน)=KBNK    ธนาคารกรุงไทย จำกัด (มหาชน)=KTB    ธนาคาร เจพีมอร์แกน เชส=JPMC    ธนาคาร โอเวอร์ซี-ไชนีสแบงกิ้งคอร์ปอเรชั่น จํากัด=OCBC    ธนาคารทหารไทยธนชาต จำกัด (มหาชน)=TTB    ธนาคารไทยพาณิชย์ จำกัด (มหาชน)=SCB    ธนาคารซิตี้แบงก์=CITI    ธนาคารซูมิโตโม มิตซุย แบงกิ้ง คอร์ปอเรชั่น=SMBC    ธนาคารสแตนดาร์ดชาร์เตอร์ด(ไทย) จำกัด (มหาชน)=SCBT    ธนาคาร ซีไอเอ็มบี ไทย จำกัด (มหาชน)=CMBT    ธนาคาร อาร์ เอช บี จำกัด=RHB    ธนาคารยูโอบี จำกัด (มหาชน)=UOBT    ธนาคารกรุงศรีอยุธยา จำกัด (มหาชน)=BAY    ธนาคารเมกะ สากลพาณิชย์ จำกัด (มหาชน)=MEGA    ธนาคารแห่งอเมริกา เนชั่นแนล แอสโซซิเอชั่น=BOA    ธนาคารอินเดียนโอเวอร์ซีส์=IOB    ธนาคารออมสิน=GSB    ธนาคารฮ่องกงและเซี่ยงไฮ้แบงกิ้ง คอร์ปอเรชั่น จำกัด=HSBC    ธนาคารดอยซ์แบงก์=DB    ธนาคารอาคารสงเคราะห์=GHB    ธนาคารเพื่อการเกษตรและสหกรณ์=BAAC    ธนาคารเพื่อการส่งออกและนำเข้าแห่งประเทศไทย=EXIM    ธนาคารมิซูโฮ จำกัด=MHCB    ธนาคารบีเอ็นพี พารีบาส์=BNPP    ธนาคารแห่งประเทศจีน จำกัด=BOC    ธนาคารอิสลามแห่งประเทศไทย=ISBT    ธนาคารทิสโก้ จำกัด (มหาชน)=TSCO    ธนาคารเกียรตินาคินภัทร จำกัด (มหาชน)=KKP    ธนาคารไอซีบีซี (ไทย) จำกัด (มหาชน)=ICBC    ธนาคารไทยเครดิต จำกัด (มหาชน)=TCRB    ธนาคารแลนด์ แอนด์ เฮ้าส์ จำกัด (มหาชน)=LHB    ธนาคารซูมิโตโม มิตซุย ทรัสต์ (ไทย) จำกัด (มหาชน)=SMTB    ธนาคารพัฒนาวิสาหกิจขนาดกลางและขนาดย่อมแห่งประเทศไทย=SME
    ${bank_name_dict} =    Create Dictionary    BBL=ธนาคารกรุงเทพ จำกัด (มหาชน)     KBNK=ธนาคารกสิกรไทย จำกัด (มหาชน)    KTB=ธนาคารกรุงไทย จำกัด (มหาชน)    JPMC=ธนาคาร เจพีมอร์แกน เชส    OCBC=ธนาคาร โอเวอร์ซี-ไชนีสแบงกิ้งคอร์ปอเรชั่น จํากัด    TTB=ธนาคารทหารไทยธนชาต จำกัด (มหาชน)     SCB=ธนาคารไทยพาณิชย์ จำกัด (มหาชน)     CITI=ธนาคารซิตี้แบงก์     SMBC=ธนาคารซูมิโตโม มิตซุย แบงกิ้ง คอร์ปอเรชั่น     SCBT=ธนาคารสแตนดาร์ดชาร์เตอร์ด(ไทย) จำกัด (มหาชน)     CMBT=ธนาคาร ซีไอเอ็มบี ไทย จำกัด (มหาชน)     RHB=ธนาคาร อาร์ เอช บี จำกัด     UOBT=ธนาคารยูโอบี จำกัด (มหาชน)     BAY=ธนาคารกรุงศรีอยุธยา จำกัด (มหาชน)     MEGA=ธนาคารเมกะ สากลพาณิชย์ จำกัด (มหาชน)     BOA=ธนาคารแห่งอเมริกา เนชั่นแนล แอสโซซิเอชั่น     IOB=ธนาคารอินเดียนโอเวอร์ซีส์     GSB=ธนาคารออมสิน     HSBC=ธนาคารฮ่องกงและเซี่ยงไฮ้แบงกิ้ง คอร์ปอเรชั่น จำกัด     DB=ธนาคารดอยซ์แบงก์     GHB=ธนาคารอาคารสงเคราะห์     BAAC=ธนาคารเพื่อการเกษตรและสหกรณ์     EXIM=ธนาคารเพื่อการส่งออกและนำเข้าแห่งประเทศไทย     MHCB=ธนาคารมิซูโฮ จำกัด     BNPP=ธนาคารบีเอ็นพี พารีบาส์     BOC=ธนาคารแห่งประเทศจีน จำกัด     ISBT=ธนาคารอิสลามแห่งประเทศไทย     TSCO=ธนาคารทิสโก้ จำกัด (มหาชน)     KKP=ธนาคารเกียรตินาคินภัทร จำกัด (มหาชน)     ICBC=ธนาคารไอซีบีซี (ไทย) จำกัด (มหาชน)     TCRB=ธนาคารไทยเครดิต จำกัด (มหาชน)     LHB=ธนาคารแลนด์ แอนด์ เฮ้าส์ จำกัด (มหาชน)     SMTB=ธนาคารซูมิโตโม มิตซุย ทรัสต์ (ไทย) จำกัด (มหาชน)     SME=ธนาคารพัฒนาวิสาหกิจขนาดกลางและขนาดย่อมแห่งประเทศไทย
    set test variable   ${bank_dict}
    set test variable   ${bank_name_dict}
    Open Excel Document      filename=${CURDIR}/Mastercase_Template.xlsx   doc_id=docname1
    ${master_case_id}=    create master case id of bank name '${BANK_NAME}'
    set test variable   ${master_case_id}
    Write Excel Cell	3   1    ${master_case_id}    sheet_name=CreateBankCase
    ${police_section}=    การตรวจพบรายการ คือ 'ผู้เสียหายแจ้งเอง มาตรา 7'
    Write Excel Cell	3   5    ${police_section}    sheet_name=CreateBankCase
    ${police_section}=    การตรวจพบรายการ คือ 'ผู้เสียหายแจ้งเอง มาตรา 7'
    Write Excel Cell	3   5    ${police_section}    sheet_name=CreateBankCase
    set test variable    ${master_file_name}    Mastercase_${master_case_id}
    Save Excel Document      filename=${CURDIR}/${FOLDER}/${master_file_name}.xlsx
    Close Current Excel Document
    Create victim information condition 2 '${FOLDER}/${master_file_name}' of bank name '${bank_name_dict}[${BANK_NAME}]'
    Create transaction with relation to banks นิติบุคคล '${HORSE_LIST}' in '${FOLDER}/${master_file_name}'
    Add Master Case via API '${FOLDER}/${master_file_name}' bank name '${BANK_NAME}'


Add Master Case via API '${MASTER_CASE_FILE}' bank name '${BANK_NAME}'
    ${encode_base64}=    encodeExcel  ${CURDIR}/${MASTER_CASE_FILE}.xlsx
    Set Test Variable   ${encode_base64}  
    ${json_string}=  Catenate    SEPARATOR=\n
    ...  {
    ...    "fileData": "${encode_base64}"
    ...  }
    ${API_URL}=   Set Variable     ${host}
    Create Session    exampleSession    ${API_URL}
    ${headers} =   Create Dictionary    Content-Type=application/json    X-Institution-Id=${${BANK_NAME}.bank_code}xxx   X-Roles=xxx   X-User-Id=xxx
    ${response}=    POST On Session   exampleSession  /api/excel-file/case-insert   data=${json_string}    headers=${headers}

    ${dict}=    Set Variable    ${response.json()}
#     ${error}=     set variable     ${dict}[errorExcelInfoList]
#     Should Be Equal As Strings    ${error}    []

Add Master Case via API '${MASTER_CASE_FILE}' bank name '${BANK_NAME}' SP TEST
    ${encode_base64}=    encodeExcel  ${CURDIR}/${MASTER_CASE_FILE}.xlsx
    Set Test Variable   ${encode_base64}  
    ${json_string}=  Catenate    SEPARATOR=\n
    ...  {
    ...    "fileData": "${encode_base64}"
    ...  }
    ${API_URL}=   Set Variable     ${host}
    Create Session    exampleSession    ${API_URL}
    ${headers} =   Create Dictionary    Content-Type=application/json    X-Institution-Id=${${BANK_NAME}.bank_code}xxx   X-Roles=xxx   X-User-Id=xxx
    ${response}=    POST On Session   exampleSession  /api/excel-file/case-insert   data=${json_string}    headers=${headers}
#     ${dict}=    Set Variable    ${response.json()}
#     ${error}=     set variable     ${dict}[errorExcelInfoList]
#     Should Be Equal As Strings    ${error}    []

Create transaction with relation to banks '${HORSE_LIST}' in '${FILE_NAME}'
    ${start_row}=    set variable   ${14}
    Open Excel Document      filename=${CURDIR}/${FILE_NAME}.xlsx   doc_id=docname1
    @{bank_words} =  Split String    ${HORSE_LIST}       ,
    ${horse_count}=    Get Length    ${bank_words}
     FOR    ${i}    IN RANGE    ${horse_count}
        ${tran_count}=    random_number_transaction   1
        ${SENDING_BANK}=    set variable    ${bank_words}[${i}]
        ${horse}=    set variable   ${horse_list_dict}[${SENDING_BANK}]
        ${person_id}=    set variable  ${horse}[horse_id]
        ${person_type}=    set variable  ${horse}[horse_type]        
        ${person_name}=    set variable  ${horse}[horse_name]
        ${person_lastname}=    set variable  ${horse}[horse_lastname]
        ${person_account_no}=    set variable  ${horse}[horse_account_no]
        ${person_account_name}=    set variable  ${horse}[horse_account_name]
        ${person_phone_no}=    create phone no 'random'
        
        ${recv_id}=     set variable  ${horse}[horse_id]
        ${recv_type}=   set variable  ${horse}[horse_type] 
        ${recv_name}=    set variable  ${horse}[horse_name]
        ${recv_lastname}=   set variable  ${horse}[horse_lastname]
        ${recv_promptpay_type}=    create promptpay type 'random'
        set test variable  ${recv_promptpay_type}  ไม่มี
        ${recv_promptpay_id}=    set variable   ${EMPTY}
        IF  '${recv_promptpay_type}' == 'เบอร์โทร'
                ${recv_phone} =   random_number   9
                ${recv_promptpay_id} =   set variable   +66${recv_phone}
        ELSE IF  '${recv_promptpay_type}' == 'หมายเลขบัตรประชาชน'
                ${recv_promptpay_id} =   generate_thai_citizen_id
        ELSE IF  '${recv_promptpay_type}' == 'เลขนิติบุคคล (Biller Id)'
                ${recv_promptpay_id} =   random_number   15
        ELSE IF  '${recv_promptpay_type}' == 'e-wallet'
                ${recv_promptpay_id} =   random_number   15
        ELSE
                ${recv_promptpay_id} =   set variable   ${EMPTY}
        END
        ${horse_short_name}=    set variable    ${bank_words}[${i}]
        ${horse_bank_name}=    set variable  ${bank_name_dict}[${horse_short_name}]  
        ${recv_account_no}=    set variable  ${horse}[horse_account_no]
        ${recv_bank_name}=    create bank name '${horse_bank_name}'
        &{horse_dict}=    Create Dictionary     horse_id=${recv_id}    horse_type=${recv_type}    horse_name=${recv_name}    horse_lastname=${recv_lastname}    horse_account_no=${recv_account_no}    horse_account_name=${recv_bank_name}
        Set To Dictionary   ${horse_list_dict}   ${horse_short_name}=${horse_dict}
        set test variable    ${horse_list_dict}
        FOR   ${n}   IN RANGE    ${tran_count}
                ${victim_ip_address}=    create ip address 'random'
                ${txn_date}=    create transaction date 'before_create_case'
                ${txn_time}=   create transaction time 'random'
                ${txn_id}=   create transacion id 'random'
                ${txn_amount}=   create transacion amount 'random'
                Write Excel Cell	${start_row}   2    ${victim_person_name}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   3    ${victim_person_lastname}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   4    ${victim_account_no}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   5    ${victim_bank_name}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   7    ${victim_ip_address}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   8    ${recv_id}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   9    ${recv_type}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   11    ${recv_name}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   12    ${recv_lastname}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   13    ${recv_promptpay_type}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   14    ${recv_promptpay_id}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   15    ${recv_account_no}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   16    ${recv_bank_name}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   18    ${txn_date}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   19    ${txn_time}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   20    ${txn_id}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   21    ${txn_amount}    sheet_name=CreateBankCase
                ${start_row}=    evaluate   ${start_row}+${1}
        END
     END
     Save Excel Document      filename=${CURDIR}/${FILE_NAME}.xlsx
     Close Current Excel Document
                  ${recv_name} =	Remove String	${recv_name}   \n
     ${recv_lastname} =	Remove String	${recv_lastname}   \n
     ${recv_id} =	Remove String	${recv_id}   \n
    Append to File    ${CURDIR}/temp_trans.txt    Horse1,${master_case_id},${test_case_name},${horse_short_name},${recv_name},${recv_lastname},${recv_account_no},${recv_id} \n


Create transaction with relation to banks '${HORSE_LIST}' in '${FILE_NAME}' personal null 3
    ${start_row}=    set variable   ${14}
    Open Excel Document      filename=${CURDIR}/${FILE_NAME}.xlsx   doc_id=docname1
    @{bank_words} =  Split String    ${HORSE_LIST}       ,
    ${horse_count}=    Get Length    ${bank_words}
     FOR    ${i}    IN RANGE    ${horse_count}
        ${tran_count}=    random_number_transaction   1
        ${SENDING_BANK}=    set variable    ${bank_words}[${i}]
        ${horse}=    set variable   ${horse_list_dict}[${SENDING_BANK}]
        ${person_id}=    set variable  ${horse}[horse_id]
        ${person_type}=    set variable  ${horse}[horse_type]        
        ${person_name}=    set variable  ${horse}[horse_name]
        ${person_lastname}=    set variable  ${horse}[horse_lastname]
        ${person_account_no}=    set variable  ${horse}[horse_account_no]
        ${person_account_name}=    set variable  ${horse}[horse_account_name]
        ${person_phone_no}=    create phone no 'random'
        
        ${recv_id}=     set variable  ${horse}[horse_id]
        ${recv_type}=   set variable  ${horse}[horse_type] 
        ${recv_name}=    set variable  ${horse}[horse_name]
        ${recv_lastname}=   set variable  ${horse}[horse_lastname]
        ${recv_promptpay_type}=    create promptpay type 'random'
        ${recv_promptpay_id}=    set variable   ${EMPTY}
        set test variable   ${recv_promptpay_type}   ไม่มี
        IF  '${recv_promptpay_type}' == 'เบอร์โทร'
                ${recv_phone} =   random_number   9
                ${recv_promptpay_id} =   set variable   +66${recv_phone}
        ELSE IF  '${recv_promptpay_type}' == 'หมายเลขบัตรประชาชน'
                ${recv_promptpay_id} =   generate_thai_citizen_id
        ELSE IF  '${recv_promptpay_type}' == 'เลขนิติบุคคล (Biller Id)'
                ${recv_promptpay_id} =   random_number   15
        ELSE IF  '${recv_promptpay_type}' == 'e-wallet'
                ${recv_promptpay_id} =   random_number   15
        ELSE
                ${recv_promptpay_id} =   set variable   ${EMPTY}
        END
        ${horse_short_name}=    set variable    ${bank_words}[${i}]
        ${horse_bank_name}=    set variable  ${bank_name_dict}[${horse_short_name}]  
        ${recv_account_no}=    set variable  ${horse}[horse_account_no]
        ${recv_bank_name}=    create bank name '${horse_bank_name}'
        &{horse_dict}=    Create Dictionary     horse_id=${recv_id}    horse_type=${recv_type}    horse_name=${recv_name}    horse_lastname=${recv_lastname}    horse_account_no=${recv_account_no}    horse_account_name=${recv_bank_name}
        Set To Dictionary   ${horse_list_dict}   ${horse_short_name}=${horse_dict}
        set test variable    ${horse_list_dict}
        FOR   ${n}   IN RANGE    ${tran_count}
                ${victim_ip_address}=    create ip address 'random'
                ${txn_date}=    create transaction date 'before_create_case'
                ${txn_time}=   create transaction time 'random'
                ${txn_id}=   create transacion id 'random'
                ${txn_amount}=   create transacion amount 'random'
                Write Excel Cell	${start_row}   2    ${victim_person_name}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   3    ${victim_person_lastname}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   4    ${victim_account_no}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   5    ${victim_bank_name}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   7    ${victim_ip_address}    sheet_name=CreateBankCase
                # Write Excel Cell	${start_row}   8    ${recv_id}    sheet_name=CreateBankCase
                # Write Excel Cell	${start_row}   9    ${recv_type}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   11    ${recv_name}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   12    ${recv_lastname}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   13    ${recv_promptpay_type}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   14    ${recv_promptpay_id}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   15    ${recv_account_no}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   16    ${recv_bank_name}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   18    ${txn_date}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   19    ${txn_time}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   20    ${txn_id}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   21    ${txn_amount}    sheet_name=CreateBankCase
                ${start_row}=    evaluate   ${start_row}+${1}
        END
     END
     Save Excel Document      filename=${CURDIR}/${FILE_NAME}.xlsx
     Close Current Excel Document
                  ${recv_name} =	Remove String	${recv_name}   \n
     ${recv_lastname} =	Remove String	${recv_lastname}   \n
     ${recv_id} =	Remove String	${recv_id}   \n
    Append to File    ${CURDIR}/temp_trans.txt    Horse1,${master_case_id},${test_case_name},${horse_short_name},${recv_name},${recv_lastname},${recv_account_no},${recv_id} \n

Create transaction with relation to banks นิติบุคคล '${HORSE_LIST}' in '${FILE_NAME}'
    ${start_row}=    set variable   ${14}
    Open Excel Document      filename=${CURDIR}/${FILE_NAME}.xlsx   doc_id=docname1
    @{bank_words} =  Split String    ${HORSE_LIST}       ,
    ${horse_count}=    Get Length    ${bank_words}
     FOR    ${i}    IN RANGE    ${horse_count}
        ${tran_count}=    random_number_transaction   1
        ${SENDING_BANK}=    set variable    ${bank_words}[${i}]
        ${horse}=    set variable   ${horse_list_dict}[${SENDING_BANK}]
        ${person_id}=    set variable  ${horse}[horse_id]
        ${person_type}=    set variable  ${horse}[horse_type]        
        ${person_name}=    set variable  ${horse}[horse_name]
        ${person_lastname}=    set variable  ${horse}[horse_lastname]
        ${person_account_no}=    set variable  ${horse}[horse_account_no]
        ${person_account_name}=    set variable  ${horse}[horse_account_name]
        ${person_phone_no}=    create phone no 'random'
        
        ${recv_id}=     set variable  ${horse}[horse_id]
        ${recv_type}=   set variable  ${horse}[horse_type] 
        ${recv_name}=    set variable  ${horse}[horse_name]
        ${recv_lastname}=   set variable  ${horse}[horse_lastname]
        ${recv_promptpay_type}=    create promptpay type 'random'
        ${recv_promptpay_id}=    set variable   ${EMPTY}
        IF  '${recv_promptpay_type}' == 'เบอร์โทร'
                ${recv_phone} =   random_number   9
                ${recv_promptpay_id} =   set variable   +66${recv_phone}
        ELSE IF  '${recv_promptpay_type}' == 'หมายเลขบัตรประชาชน'
                ${recv_promptpay_id} =   generate_thai_citizen_id
        ELSE IF  '${recv_promptpay_type}' == 'เลขนิติบุคคล (Biller Id)'
                ${recv_promptpay_id} =   random_number   15
        ELSE IF  '${recv_promptpay_type}' == 'e-wallet'
                ${recv_promptpay_id} =   random_number   15
        ELSE
                ${recv_promptpay_id} =   set variable   ${EMPTY}
        END
        ${horse_short_name}=    set variable    ${bank_words}[${i}]
        ${horse_bank_name}=    set variable  ${bank_name_dict}[${horse_short_name}]  
        ${recv_account_no}=    set variable  ${horse}[horse_account_no]
        ${recv_bank_name}=    create bank name '${horse_bank_name}'
        &{horse_dict}=    Create Dictionary     horse_id=${recv_id}    horse_type=${recv_type}    horse_name=${recv_name}    horse_lastname=${recv_lastname}    horse_account_no=${recv_account_no}    horse_account_name=${recv_bank_name}
        Set To Dictionary   ${horse_list_dict}   ${horse_short_name}=${horse_dict}
        set test variable    ${horse_list_dict}
        FOR   ${n}   IN RANGE    ${tran_count}
                ${victim_ip_address}=    create ip address 'random'
                ${txn_date}=    create transaction date 'before_create_case'
                ${txn_time}=   create transaction time 'random'
                ${txn_id}=   create transacion id 'random'
                ${txn_amount}=   create transacion amount 'random'
                Write Excel Cell	${start_row}   2    ${victim_person_name}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   3    ${victim_person_lastname}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   4    ${victim_account_no}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   5    ${victim_bank_name}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   7    ${victim_ip_address}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   8    ${recv_id}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   9    ${recv_type}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   11    ${recv_name}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   12    ${recv_lastname}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   13    ${recv_promptpay_type}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   14    ${recv_promptpay_id}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   15    ${recv_account_no}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   16    ${recv_bank_name}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   18    ${txn_date}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   19    ${txn_time}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   20    ${txn_id}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   21    ${txn_amount}    sheet_name=CreateBankCase
                ${start_row}=    evaluate   ${start_row}+${1}
        END
     END
     Save Excel Document      filename=${CURDIR}/${FILE_NAME}.xlsx
     Close Current Excel Document

Create transaction with relation to banks '${HORSE_LIST}' in '${FILE_NAME}' ไม่มีข้อมูลเลขบัตรประชาชน
    ${start_row}=    set variable   ${14}
    Open Excel Document      filename=${CURDIR}/${FILE_NAME}.xlsx   doc_id=docname1
    @{bank_words} =  Split String    ${HORSE_LIST}       ,
    ${horse_count}=    Get Length    ${bank_words}
     FOR    ${i}    IN RANGE    ${horse_count}
        ${tran_count}=    random_number_transaction   1
        ${SENDING_BANK}=    set variable    ${bank_words}[${i}]
        ${horse}=    set variable   ${horse_list_dict}[${SENDING_BANK}]
        ${person_id}=    set variable  ${horse}[horse_id]
        ${person_type}=    set variable  ${horse}[horse_type]        
        ${person_name}=    set variable  ${horse}[horse_name]
        ${person_lastname}=    set variable  ${horse}[horse_lastname]
        ${person_account_no}=    set variable  ${horse}[horse_account_no]
        ${person_account_name}=    set variable  ${horse}[horse_account_name]
        ${person_phone_no}=    create phone no 'random'
        
        ${recv_name}=    set variable  ${horse}[horse_name]
        ${recv_lastname}=   set variable  ${horse}[horse_lastname]
        ${recv_promptpay_type}=    create promptpay type 'random'
        ${recv_promptpay_id}=    set variable   ${EMPTY}
        IF  '${recv_promptpay_type}' == 'เบอร์โทร'
                ${recv_phone} =   random_number   9
                ${recv_promptpay_id} =   set variable   +66${recv_phone}
        ELSE IF  '${recv_promptpay_type}' == 'หมายเลขบัตรประชาชน'
                ${recv_promptpay_id} =   generate_thai_citizen_id
        ELSE IF  '${recv_promptpay_type}' == 'เลขนิติบุคคล (Biller Id)'
                ${recv_promptpay_id} =   random_number   15
        ELSE IF  '${recv_promptpay_type}' == 'e-wallet'
                ${recv_promptpay_id} =   random_number   15
        ELSE
                ${recv_promptpay_id} =   set variable   ${EMPTY}
        END
        ${horse_short_name}=    set variable    ${bank_words}[${i}]
        ${horse_bank_name}=    set variable  ${bank_name_dict}[${horse_short_name}]  
        ${recv_account_no}=    set variable  ${horse}[horse_account_no]
        ${recv_bank_name}=    create bank name '${horse_bank_name}'
        &{horse_dict}=    Create Dictionary     horse_id=${EMPTY}    horse_type=${EMPTY}    horse_name=${recv_name}    horse_lastname=${recv_lastname}    horse_account_no=${recv_account_no}    horse_account_name=${recv_bank_name}
        Set To Dictionary   ${horse_list_dict}   ${horse_short_name}=${horse_dict}
        set test variable    ${horse_list_dict}
        FOR   ${n}   IN RANGE    ${tran_count}
                ${victim_ip_address}=    create ip address 'random'
                ${txn_date}=    create transaction date 'before_create_case'
                ${txn_time}=   create transaction time 'random'
                ${txn_id}=   create transacion id 'random'
                ${txn_amount}=   create transacion amount 'random'
                Write Excel Cell	${start_row}   2    ${victim_person_name}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   3    ${victim_person_lastname}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   4    ${victim_account_no}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   5    ${victim_bank_name}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   7    ${victim_ip_address}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   11    ${recv_name}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   12    ${recv_lastname}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   13    ${recv_promptpay_type}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   14    ${recv_promptpay_id}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   15    ${recv_account_no}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   16    ${recv_bank_name}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   18    ${txn_date}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   19    ${txn_time}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   20    ${txn_id}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   21    ${txn_amount}    sheet_name=CreateBankCase
                ${start_row}=    evaluate   ${start_row}+${1}
        END
     END
     Save Excel Document      filename=${CURDIR}/${FILE_NAME}.xlsx
     Close Current Excel Document

Create transaction to banks '${HORSE_LIST}' in '${FILE_NAME}' ไม่มีข้อมูลเลขบัตรประชาชน
    ${start_row}=    set variable   ${14}
    Open Excel Document      filename=${CURDIR}/${FILE_NAME}.xlsx   doc_id=docname1
    @{bank_words} =  Split String    ${HORSE_LIST}       ,
    ${horse_count}=    Get Length    ${bank_words}
     FOR    ${i}    IN RANGE    ${horse_count}
        ${tran_count}=    random_number_transaction   1
        ${recv_name}=    create person name 'random'
        ${recv_lastname}=    create person lastname 'random'
        ${recv_promptpay_type}=    create promptpay type 'random'
        ${recv_promptpay_id}=    set variable   ${EMPTY}
        IF  '${recv_promptpay_type}' == 'เบอร์โทร'
                ${recv_phone} =   random_number   9
                ${recv_promptpay_id} =   set variable   +66${recv_phone}
        ELSE IF  '${recv_promptpay_type}' == 'หมายเลขบัตรประชาชน'
                ${recv_promptpay_id} =   generate_thai_citizen_id
        ELSE IF  '${recv_promptpay_type}' == 'เลขนิติบุคคล (Biller Id)'
                ${recv_promptpay_id} =   random_number   15
        ELSE IF  '${recv_promptpay_type}' == 'e-wallet'
                ${recv_promptpay_id} =   random_number   15
        ELSE
                ${recv_promptpay_id} =   set variable   ${EMPTY}
        END
        ${horse_short_name}=    set variable    ${bank_words}[${i}]
        ${horse_bank_name}=    set variable  ${bank_name_dict}[${horse_short_name}]  
        ${recv_account_no}=    create account_no 'random'
        ${recv_bank_name}=    create bank name '${horse_bank_name}'
        &{horse_dict}=    Create Dictionary     horse_id=${EMPTY}    horse_type=${EMPTY}    horse_name=${recv_name}    horse_lastname=${recv_lastname}    horse_account_no=${recv_account_no}    horse_account_name=${recv_bank_name}
        Set To Dictionary   ${horse_list_dict}   ${horse_short_name}=${horse_dict}
        set test variable    ${horse_list_dict}
        Append to File    ${CURDIR}/temp_trans.txt    ${test_case_name},${horse_short_name},${recv_account_no}\n

        FOR   ${n}   IN RANGE    ${tran_count}
                ${victim_ip_address}=    create ip address 'random'
                ${txn_date}=    create transaction date 'before_create_case'
                ${txn_time}=   create transaction time 'random'
                ${txn_id}=   create transacion id 'random'
                ${txn_amount}=   create transacion amount 'random'
                Write Excel Cell	${start_row}   2    ${victim_person_name}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   3    ${victim_person_lastname}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   4    ${victim_account_no}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   5    ${victim_bank_name}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   7    ${victim_ip_address}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   11    ${recv_name}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   12    ${recv_lastname}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   13    ${recv_promptpay_type}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   14    ${recv_promptpay_id}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   15    ${recv_account_no}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   16    ${recv_bank_name}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   18    ${txn_date}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   19    ${txn_time}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   20    ${txn_id}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   21    ${txn_amount}    sheet_name=CreateBankCase
                ${start_row}=    evaluate   ${start_row}+${1}
        END
     END
     Save Excel Document      filename=${CURDIR}/${FILE_NAME}.xlsx
     Close Current Excel Document

Create transaction to banks '${HORSE_LIST}' in '${FILE_NAME}' นิติบุคคล
    ${start_row}=    set variable   ${14}
    Open Excel Document      filename=${CURDIR}/${FILE_NAME}.xlsx   doc_id=docname1
    @{bank_words} =  Split String    ${HORSE_LIST}       ,
    ${horse_count}=    Get Length    ${bank_words}
     FOR    ${i}    IN RANGE    ${horse_count}
        ${tran_count}=    random_number_transaction   1
        ${recv_id}=    create person id 'นิติบุคคล'
        ${recv_type}=    set variable    นิติบุคคล
        ${recv_name}=    create person name 'random'
        ${recv_promptpay_type}=    create promptpay type 'random'
        ${recv_promptpay_id}=    set variable   ${EMPTY}
        IF  '${recv_promptpay_type}' == 'เบอร์โทร'
                ${recv_phone} =   random_number   9
                ${recv_promptpay_id} =   set variable   +66${recv_phone}
        ELSE IF  '${recv_promptpay_type}' == 'หมายเลขบัตรประชาชน'
                ${recv_promptpay_id} =   generate_thai_citizen_id
        ELSE IF  '${recv_promptpay_type}' == 'เลขนิติบุคคล (Biller Id)'
                ${recv_promptpay_id} =   random_number   15
        ELSE IF  '${recv_promptpay_type}' == 'e-wallet'
                ${recv_promptpay_id} =   random_number   15
        ELSE
                ${recv_promptpay_id} =   set variable   ${EMPTY}
        END
        ${horse_short_name}=    set variable    ${bank_words}[${i}]
        ${horse_bank_name}=    set variable  ${bank_name_dict}[${horse_short_name}]  
        ${recv_account_no}=    create account_no 'random'
        ${recv_bank_name}=    create bank name '${horse_bank_name}'
        &{horse_dict}=    Create Dictionary     horse_id=${recv_id}    horse_type=${recv_type}    horse_name=${recv_name}    horse_lastname=${EMPTY}    horse_account_no=${recv_account_no}    horse_account_name=${recv_bank_name}
        Set To Dictionary   ${horse_list_dict}   ${horse_short_name}=${horse_dict}
        set test variable    ${horse_list_dict}
        Append to File    ${CURDIR}/temp_trans.txt    ${test_case_name},${horse_short_name},${recv_account_no},${recv_id}\n

        FOR   ${n}   IN RANGE    ${tran_count}
                ${victim_ip_address}=    create ip address 'random'
                ${txn_date}=    create transaction date 'before_create_case'
                ${txn_time}=   create transaction time 'random'
                ${txn_id}=   create transacion id 'random'
                ${txn_amount}=   create transacion amount 'random'
                Write Excel Cell	${start_row}   2    ${victim_person_name}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   3    ${victim_person_lastname}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   4    ${victim_account_no}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   5    ${victim_bank_name}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   7    ${victim_ip_address}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   8    ${recv_id}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   9    ${recv_type}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   11    ${recv_name}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   13    ${recv_promptpay_type}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   14    ${recv_promptpay_id}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   15    ${recv_account_no}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   16    ${recv_bank_name}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   18    ${txn_date}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   19    ${txn_time}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   20    ${txn_id}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   21    ${txn_amount}    sheet_name=CreateBankCase
                ${start_row}=    evaluate   ${start_row}+${1}
        END
     END
     Save Excel Document      filename=${CURDIR}/${FILE_NAME}.xlsx
     Close Current Excel Document

Create transaction to banks '${HORSE_LIST}' in '${FILE_NAME}'
    ${start_row}=    set variable   ${14}
    Open Excel Document      filename=${CURDIR}/${FILE_NAME}.xlsx   doc_id=docname1
    @{bank_words} =  Split String    ${HORSE_LIST}       ,
    ${horse_count}=    Get Length    ${bank_words}
     FOR    ${i}    IN RANGE    ${horse_count}
        ${tran_count}=    random_number_transaction   1
        ${recv_id}=    create person id 'บุคคลธรรมดา'
        ${recv_type}=    set variable    บุคคลธรรมดา
        ${recv_name}=    create person name 'random'
        ${recv_lastname}=    create person lastname 'random'
        ${recv_promptpay_type}=    create promptpay type 'random'
        set test variable   ${recv_promptpay_type}    ไม่มี
        ${recv_promptpay_id}=    set variable   ${EMPTY}
        IF  '${recv_promptpay_type}' == 'เบอร์โทร'
                ${recv_phone} =   random_number   9
                ${recv_promptpay_id} =   set variable   +66${recv_phone}
        ELSE IF  '${recv_promptpay_type}' == 'หมายเลขบัตรประชาชน'
                ${recv_promptpay_id} =   generate_thai_citizen_id
        ELSE IF  '${recv_promptpay_type}' == 'เลขนิติบุคคล (Biller Id)'
                ${recv_promptpay_id} =   random_number   15
        ELSE IF  '${recv_promptpay_type}' == 'e-wallet'
                ${recv_promptpay_id} =   random_number   15
        ELSE
                ${recv_promptpay_id} =   set variable   ${EMPTY}
        END
        ${horse_short_name}=    set variable    ${bank_words}[${i}]
        ${horse_bank_name}=    set variable  ${bank_name_dict}[${horse_short_name}]  
        ${recv_account_no}=    create account_no 'random'
        ${recv_bank_name}=    create bank name '${horse_bank_name}'
        &{horse_dict}=    Create Dictionary     horse_id=${recv_id}    horse_type=${recv_type}    horse_name=${recv_name}    horse_lastname=${recv_lastname}    horse_account_no=${recv_account_no}    horse_account_name=${recv_bank_name}
        Set To Dictionary   ${horse_list_dict}   ${horse_short_name}=${horse_dict}
        set test variable    ${horse_list_dict}
             ${recv_name} =	Remove String	${recv_name}   \n
     ${recv_lastname} =	Remove String	${recv_lastname}   \n
     ${recv_id} =	Remove String	${recv_id}   \n
    Append to File    ${CURDIR}/temp_trans.txt    Horse1,${master_case_id},${test_case_name},${horse_short_name},${recv_name},${recv_lastname},${recv_account_no},${recv_id} \n

        FOR   ${n}   IN RANGE    ${tran_count}
                ${victim_ip_address}=    create ip address 'random'
                ${txn_date}=    create transaction date 'before_create_case'
                ${txn_time}=   create transaction time 'random'
                ${txn_id}=   create transacion id 'random'
                ${txn_amount}=   create transacion amount 'random'
                Write Excel Cell	${start_row}   2    ${victim_person_name}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   3    ${victim_person_lastname}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   4    ${victim_account_no}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   5    ${victim_bank_name}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   7    ${victim_ip_address}    sheet_name=CreateBankCase
                # Write Excel Cell	${start_row}   8    ${recv_id}    sheet_name=CreateBankCase
                # Write Excel Cell	${start_row}   9    ${recv_type}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   11    ${recv_name}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   12    ${recv_lastname}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   13    ${recv_promptpay_type}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   14    ${recv_promptpay_id}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   15    ${recv_account_no}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   16    ${recv_bank_name}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   18    ${txn_date}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   19    ${txn_time}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   20    ${txn_id}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   21    ${txn_amount}    sheet_name=CreateBankCase
                ${start_row}=    evaluate   ${start_row}+${1}
        END
     END
     Save Excel Document      filename=${CURDIR}/${FILE_NAME}.xlsx
     Close Current Excel Document


Create transaction to banks '${HORSE_LIST}' in '${FILE_NAME}' personal null 3
    ${start_row}=    set variable   ${14}
    Open Excel Document      filename=${CURDIR}/${FILE_NAME}.xlsx   doc_id=docname1
    @{bank_words} =  Split String    ${HORSE_LIST}       ,
    ${horse_count}=    Get Length    ${bank_words}
     FOR    ${i}    IN RANGE    ${horse_count}
        ${tran_count}=    random_number_transaction   1
        ${recv_id}=    create person id 'บุคคลธรรมดา'
        ${recv_type}=    set variable    บุคคลธรรมดา
        ${recv_name}=    create person name 'random'
        ${recv_lastname}=    create person lastname 'random'
        ${recv_promptpay_type}=    create promptpay type 'random'
        set test variable   ${recv_promptpay_type}   ไม่มี
        ${recv_promptpay_id}=    set variable   ${EMPTY}
        IF  '${recv_promptpay_type}' == 'เบอร์โทร'
                ${recv_phone} =   random_number   9
                ${recv_promptpay_id} =   set variable   +66${recv_phone}
        ELSE IF  '${recv_promptpay_type}' == 'หมายเลขบัตรประชาชน'
                ${recv_promptpay_id} =   generate_thai_citizen_id
        ELSE IF  '${recv_promptpay_type}' == 'เลขนิติบุคคล (Biller Id)'
                ${recv_promptpay_id} =   random_number   15
        ELSE IF  '${recv_promptpay_type}' == 'e-wallet'
                ${recv_promptpay_id} =   random_number   15
        ELSE
                ${recv_promptpay_id} =   set variable   ${EMPTY}
        END
        ${horse_short_name}=    set variable    ${bank_words}[${i}]
        ${horse_bank_name}=    set variable  ${bank_name_dict}[${horse_short_name}]  
        ${recv_account_no}=    create account_no 'random'
        ${recv_bank_name}=    create bank name '${horse_bank_name}'
        &{horse_dict}=    Create Dictionary     horse_id=${recv_id}    horse_type=${recv_type}    horse_name=${recv_name}    horse_lastname=${recv_lastname}    horse_account_no=${recv_account_no}    horse_account_name=${recv_bank_name}
        Set To Dictionary   ${horse_list_dict}   ${horse_short_name}=${horse_dict}
        set test variable    ${horse_list_dict}
             ${recv_name} =	Remove String	${recv_name}   \n
     ${recv_lastname} =	Remove String	${recv_lastname}   \n
     ${recv_id} =	Remove String	${recv_id}   \n
    Append to File    ${CURDIR}/temp_trans.txt    Horse1,${master_case_id},${test_case_name},${horse_short_name},${recv_name},${recv_lastname},${recv_account_no},${recv_id} \n

        FOR   ${n}   IN RANGE    ${tran_count}
                ${victim_ip_address}=    create ip address 'random'
                ${txn_date}=    create transaction date 'before_create_case'
                ${txn_time}=   create transaction time 'random'
                ${txn_id}=   create transacion id 'random'
                ${txn_amount}=   create transacion amount 'random'
                Write Excel Cell	${start_row}   2    ${victim_person_name}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   3    ${victim_person_lastname}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   4    ${victim_account_no}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   5    ${victim_bank_name}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   7    ${victim_ip_address}    sheet_name=CreateBankCase
                # Write Excel Cell	${start_row}   8    ${recv_id}    sheet_name=CreateBankCase
                # Write Excel Cell	${start_row}   9    ${recv_type}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   11    ${recv_name}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   12    ${recv_lastname}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   13    ${recv_promptpay_type}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   14    ${recv_promptpay_id}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   15    ${recv_account_no}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   16    ${recv_bank_name}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   18    ${txn_date}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   19    ${txn_time}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   20    ${txn_id}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   21    ${txn_amount}    sheet_name=CreateBankCase
                ${start_row}=    evaluate   ${start_row}+${1}
        END
     END
     Save Excel Document      filename=${CURDIR}/${FILE_NAME}.xlsx
     Close Current Excel Document

Create transaction to banks '${HORSE_LIST}' in '${FILE_NAME}' con 2 Normal
    ${start_row}=    set variable   ${14}
    Open Excel Document      filename=${CURDIR}/${FILE_NAME}.xlsx   doc_id=docname1
    @{bank_words} =  Split String    ${HORSE_LIST}       ,
    ${horse_count}=    Get Length    ${bank_words}
     FOR    ${i}    IN RANGE    ${horse_count}
        ${tran_count}=    random_number_transaction   1
        set test variable   ${tran_count}    1   
        ${recv_id}=    create person id 'บุคคลธรรมดา'
        ${recv_type}=    set variable    บุคคลธรรมดา
        ${recv_name}=    create person name 'random'
        ${recv_lastname}=    create person lastname 'random'
        ${recv_promptpay_type}=    create promptpay type 'random'
        set test variable   ${recv_promptpay_type}  ไม่มี
        ${recv_promptpay_id}=    set variable   ${EMPTY}
        IF  '${recv_promptpay_type}' == 'เบอร์โทร'
                ${recv_phone} =   random_number   9
                ${recv_promptpay_id} =   set variable   +66${recv_phone}
        ELSE IF  '${recv_promptpay_type}' == 'หมายเลขบัตรประชาชน'
                ${recv_promptpay_id} =   generate_thai_citizen_id
        ELSE IF  '${recv_promptpay_type}' == 'เลขนิติบุคคล (Biller Id)'
                ${recv_promptpay_id} =   random_number   15
        ELSE IF  '${recv_promptpay_type}' == 'e-wallet'
                ${recv_promptpay_id} =   random_number   15
        ELSE
                ${recv_promptpay_id} =   set variable   ${EMPTY}
        END
        ${horse_short_name}=    set variable    ${bank_words}[${i}]
        ${horse_bank_name}=    set variable  ${bank_name_dict}[${horse_short_name}]  
        ${recv_account_no}=    create account_no 'random'
        ${recv_bank_name}=    create bank name '${horse_bank_name}'
        &{horse_dict}=    Create Dictionary     horse_id=${recv_id}    horse_type=${recv_type}    horse_name=${recv_name}    horse_lastname=${recv_lastname}    horse_account_no=${recv_account_no}    horse_account_name=${recv_bank_name}
        Set To Dictionary   ${horse_list_dict}   ${horse_short_name}=${horse_dict}
        set test variable    ${horse_list_dict}

        FOR   ${n}   IN RANGE    ${tran_count}
                ${victim_ip_address}=    create ip address 'random'
                ${txn_date}=    create transaction date 'before_create_case'
                ${txn_time}=   create transaction time 'random'
                ${txn_id}=   create transacion id 'random'
                ${txn_amount}=   create transacion amount 'random'
                Write Excel Cell	${start_row}   2    ${victim_person_name}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   3    ${victim_person_lastname}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   4    ${victim_account_no}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   5    ${victim_bank_name}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   7    ${victim_ip_address}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   8    ${recv_id}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   9    ${recv_type}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   11    ${recv_name}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   12    ${recv_lastname}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   13    ${recv_promptpay_type}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   14    ${recv_promptpay_id}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   15    ${recv_account_no}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   16    ${recv_bank_name}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   18    ${txn_date}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   19    ${txn_time}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   20    ${txn_id}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   21    ${txn_amount}    sheet_name=CreateBankCase
                ${start_row}=    evaluate   ${start_row}+${1}
        END
     END
     Save Excel Document      filename=${CURDIR}/${FILE_NAME}.xlsx
     Close Current Excel Document
     ${recv_name} =	Remove String	${recv_name}   \n
     ${recv_lastname} =	Remove String	${recv_lastname}   \n
     ${recv_id} =	Remove String	${recv_id}   \n
    Append to File    ${CURDIR}/temp_trans.txt    ${test_case_name},${horse_short_name},${master_case_id},${recv_account_no},${recv_name},${recv_lastname},${recv_id}\n



Create transaction to banks '${HORSE_LIST}' in '${FILE_NAME}' con 2 Personal null
    ${start_row}=    set variable   ${14}
    Open Excel Document      filename=${CURDIR}/${FILE_NAME}.xlsx   doc_id=docname1
    @{bank_words} =  Split String    ${HORSE_LIST}       ,
    ${horse_count}=    Get Length    ${bank_words}
     FOR    ${i}    IN RANGE    ${horse_count}
        ${tran_count}=    random_number_transaction   1
        set test variable   ${tran_count}    1   
        ${recv_id}=    create person id 'บุคคลธรรมดา'
        ${recv_type}=    set variable    บุคคลธรรมดา
        ${recv_name}=    create person name 'random'
        ${recv_lastname}=    create person lastname 'random'
        ${recv_promptpay_type}=    create promptpay type 'random'
        set test variable   ${recv_promptpay_type}  ไม่มี
        ${recv_promptpay_id}=    set variable   ${EMPTY}
        IF  '${recv_promptpay_type}' == 'เบอร์โทร'
                ${recv_phone} =   random_number   9
                ${recv_promptpay_id} =   set variable   +66${recv_phone}
        ELSE IF  '${recv_promptpay_type}' == 'หมายเลขบัตรประชาชน'
                ${recv_promptpay_id} =   generate_thai_citizen_id
        ELSE IF  '${recv_promptpay_type}' == 'เลขนิติบุคคล (Biller Id)'
                ${recv_promptpay_id} =   random_number   15
        ELSE IF  '${recv_promptpay_type}' == 'e-wallet'
                ${recv_promptpay_id} =   random_number   15
        ELSE
                ${recv_promptpay_id} =   set variable   ${EMPTY}
        END
        ${horse_short_name}=    set variable    ${bank_words}[${i}]
        ${horse_bank_name}=    set variable  ${bank_name_dict}[${horse_short_name}]  
        ${recv_account_no}=    create account_no 'random'
        ${recv_bank_name}=    create bank name '${horse_bank_name}'
        &{horse_dict}=    Create Dictionary     horse_id=${recv_id}    horse_type=${recv_type}    horse_name=${recv_name}    horse_lastname=${recv_lastname}    horse_account_no=${recv_account_no}    horse_account_name=${recv_bank_name}
        Set To Dictionary   ${horse_list_dict}   ${horse_short_name}=${horse_dict}
        set test variable    ${horse_list_dict}

        FOR   ${n}   IN RANGE    ${tran_count}
                ${victim_ip_address}=    create ip address 'random'
                ${txn_date}=    create transaction date 'before_create_case'
                ${txn_time}=   create transaction time 'random'
                ${txn_id}=   create transacion id 'random'
                ${txn_amount}=   create transacion amount 'random'
                Write Excel Cell	${start_row}   2    ${victim_person_name}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   3    ${victim_person_lastname}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   4    ${victim_account_no}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   5    ${victim_bank_name}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   7    ${victim_ip_address}    sheet_name=CreateBankCase
                # Write Excel Cell	${start_row}   8    ${recv_id}    sheet_name=CreateBankCase
                # Write Excel Cell	${start_row}   9    ${recv_type}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   11    ${recv_name}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   12    ${recv_lastname}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   13    ${recv_promptpay_type}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   14    ${recv_promptpay_id}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   15    ${recv_account_no}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   16    ${recv_bank_name}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   18    ${txn_date}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   19    ${txn_time}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   20    ${txn_id}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   21    ${txn_amount}    sheet_name=CreateBankCase
                ${start_row}=    evaluate   ${start_row}+${1}
        END
     END
     Save Excel Document      filename=${CURDIR}/${FILE_NAME}.xlsx
     Close Current Excel Document
     ${recv_name} =	Remove String	${recv_name}   \n
     ${recv_lastname} =	Remove String	${recv_lastname}   \n
     ${recv_id} =	Remove String	${recv_id}   \n
    Append to File    ${CURDIR}/temp_trans.txt    ${test_case_name},${horse_short_name},${master_case_id},${recv_account_no},${recv_name},${recv_lastname},${recv_id}\n




Create transaction to banks '${HORSE_LIST}' in '${FILE_NAME}' SP TEST
    ${start_row}=    set variable   ${14}
    Open Excel Document      filename=${CURDIR}/${FILE_NAME}.xlsx   doc_id=docname1
    @{bank_words} =  Split String    ${HORSE_LIST}       ,
    ${horse_count}=    Get Length    ${bank_words}
     FOR    ${i}    IN RANGE    ${horse_count}
        ${tran_count}=    random_number_transaction   1
        set test variable   ${tran_count}     5 
        ${recv_id}=    create person id 'บุคคลธรรมดา'
        ${recv_type}=    set variable    บุคคลธรรมดา
        ${recv_name}=    create person name 'random'
        ${recv_lastname}=    create person lastname 'random'
        ${recv_promptpay_type}=    create promptpay type 'random'
        ${recv_promptpay_id}=    set variable   ${EMPTY}
        set test variable  ${recv_promptpay_id}   ไม่มี    
        IF  '${recv_promptpay_type}' == 'เบอร์โทร'
                ${recv_phone} =   random_number   9
                ${recv_promptpay_id} =   set variable   +66${recv_phone}
        ELSE IF  '${recv_promptpay_type}' == 'หมายเลขบัตรประชาชน'
                ${recv_promptpay_id} =   generate_thai_citizen_id
        ELSE IF  '${recv_promptpay_type}' == 'เลขนิติบุคคล (Biller Id)'
                ${recv_promptpay_id} =   random_number   15
        ELSE IF  '${recv_promptpay_type}' == 'e-wallet'
                ${recv_promptpay_id} =   random_number   15
        ELSE
                ${recv_promptpay_id} =   set variable   ${EMPTY}
        END
        ${horse_short_name}=    set variable    ${bank_words}[${i}]
        ${horse_bank_name}=    set variable  ${bank_name_dict}[${horse_short_name}]  
        ${recv_account_no}=    create account_no 'random'
        ${recv_account_no2}=    create account_no 'random'
        ${recv_account_no3}=    create account_no 'random'
        ${recv_bank_name}=    create bank name '${horse_bank_name}'
        &{horse_dict}=    Create Dictionary     horse_id=${recv_id}    horse_type=${recv_type}    horse_name=${recv_name}    horse_lastname=${recv_lastname}    horse_account_no=${recv_account_no}    horse_account_name=${recv_bank_name}  horse_account_no2=${recv_account_no2}
        Set To Dictionary   ${horse_list_dict}   ${horse_short_name}=${horse_dict}
        set test variable    ${horse_list_dict}

        FOR   ${n}   IN RANGE    ${tran_count}
                ${victim_ip_address}=    create ip address 'random'
                ${txn_date}=    create transaction date 'before_create_case'
                ${txn_time}=   create transaction time 'random'
                ${txn_id}=   create transacion id 'random'
                ${txn_amount}=   create transacion amount 'random'
                Write Excel Cell	${start_row}   2    ${victim_person_name}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   3    ${victim_person_lastname}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   4    ${victim_account_no}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   5    ${victim_bank_name}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   7    ${victim_ip_address}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   8    ${recv_id}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   9    ${recv_type}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   11    ${recv_name}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   12    ${recv_lastname}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   13    ${recv_promptpay_type}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   14    ${recv_promptpay_id}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   15    ${recv_account_no}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   16    ${recv_bank_name}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   18    ${txn_date}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   19    ${txn_time}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   20    ${txn_id}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   21    ${txn_amount}    sheet_name=CreateBankCase
                ${start_row}=    evaluate   ${start_row}+${1}
                ${victim_ip_address}=    create ip address 'random'
                ${txn_date}=    create transaction date 'before_create_case'
                ${txn_time}=   create transaction time 'random'
                ${txn_id}=   create transacion id 'random'
                ${txn_amount}=   create transacion amount 'random'
                Write Excel Cell	${start_row}   2    ${victim_person_name}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   3    ${victim_person_lastname}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   4    ${victim_account_no2}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   5    ${victim_bank_name}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   7    ${victim_ip_address}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   8    ${recv_id}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   9    ${recv_type}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   11    ${recv_name}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   12    ${recv_lastname}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   13    ${recv_promptpay_type}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   14    ${recv_promptpay_id}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   15    ${recv_account_no2}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   16    ${recv_bank_name}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   18    ${txn_date}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   19    ${txn_time}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   20    ${txn_id}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   21    ${txn_amount}    sheet_name=CreateBankCase
                ${start_row}=    evaluate   ${start_row}+${1}
                ${victim_ip_address}=    create ip address 'random'
                ${txn_date}=    create transaction date 'before_create_case'
                ${txn_time}=   create transaction time 'random'
                ${txn_id}=   create transacion id 'random'
                ${txn_amount}=   create transacion amount 'random'
                Write Excel Cell	${start_row}   2    ${victim_person_name}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   3    ${victim_person_lastname}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   4    ${victim_account_no}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   5    ${victim_bank_name}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   7    ${victim_ip_address}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   8    ${recv_id}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   9    ${recv_type}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   11    ${recv_name}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   12    ${recv_lastname}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   13    ${recv_promptpay_type}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   14    ${recv_promptpay_id}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   15    ${recv_account_no3}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   16    ${recv_bank_name}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   18    ${txn_date}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   19    ${txn_time}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   20    ${txn_id}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   21    ${txn_amount}    sheet_name=CreateBankCase
                ${start_row}=    evaluate   ${start_row}+${1}
                ${victim_ip_address}=    create ip address 'random'
                ${txn_date}=    create transaction date 'before_create_case'
                ${txn_time}=   create transaction time 'random'
                ${txn_id}=   create transacion id 'random'
                ${txn_amount}=   create transacion amount 'random'
                Write Excel Cell	${start_row}   2    ${victim_person_name}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   3    ${victim_person_lastname}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   4    ${victim_account_no2}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   5    ${victim_bank_name}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   7    ${victim_ip_address}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   8    ${recv_id}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   9    ${recv_type}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   11    ${recv_name}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   12    ${recv_lastname}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   13    ${recv_promptpay_type}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   14    ${recv_promptpay_id}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   15    ${recv_account_no3}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   16    ${recv_bank_name}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   18    ${txn_date}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   19    ${txn_time}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   20    ${txn_id}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   21    ${txn_amount}    sheet_name=CreateBankCase
                ${start_row}=    evaluate   ${start_row}+${1}
        END
     END
     Save Excel Document      filename=${CURDIR}/${FILE_NAME}.xlsx
     Close Current Excel Document
     ${recv_name} =	Remove String	${recv_name}   \n
     ${recv_lastname} =	Remove String	${recv_lastname}   \n
     ${recv_id} =	Remove String	${recv_id}   \n
    Append to File    ${CURDIR}/temp_trans.txt    Account1,${test_case_name},${horse_short_name},${master_case_id},${recv_account_no},${recv_name},${recv_lastname},${recv_id}\n
    Append to File    ${CURDIR}/temp_trans.txt    Account2,${test_case_name},${horse_short_name},${master_case_id},${recv_account_no2},${recv_name},${recv_lastname},${recv_id}\n


Create transaction to banks '${HORSE_LIST}' in '${FILE_NAME}' Test 1-3
    ${start_row}=    set variable   ${14}
    Open Excel Document      filename=${CURDIR}/${FILE_NAME}.xlsx   doc_id=docname1
    @{bank_words} =  Split String    ${HORSE_LIST}       ,
    ${horse_count}=    Get Length    ${bank_words}
     FOR    ${i}    IN RANGE    ${horse_count}
        ${tran_count}=    random_number_transaction   1
        set test variable   ${tran_count}     5 
        ${recv_id}=    create person id 'บุคคลธรรมดา'
        ${recv_type}=    set variable    บุคคลธรรมดา
        ${recv_name}=    create person name 'random'
        ${recv_lastname}=    create person lastname 'random'
        ${recv_promptpay_type}=    create promptpay type 'random'
        set test variable    ${recv_promptpay_type}    ไม่มี
        ${recv_promptpay_id}=    set variable   ${EMPTY}
        IF  '${recv_promptpay_type}' == 'เบอร์โทร'
                ${recv_phone} =   random_number   9
                ${recv_promptpay_id} =   set variable   +66${recv_phone}
        ELSE IF  '${recv_promptpay_type}' == 'หมายเลขบัตรประชาชน'
                ${recv_promptpay_id} =   generate_thai_citizen_id
        ELSE IF  '${recv_promptpay_type}' == 'เลขนิติบุคคล (Biller Id)'
                ${recv_promptpay_id} =   random_number   15
        ELSE IF  '${recv_promptpay_type}' == 'e-wallet'
                ${recv_promptpay_id} =   random_number   15
        ELSE
                ${recv_promptpay_id} =   set variable   ${EMPTY}
        END
        ${horse_short_name}=    set variable    ${bank_words}[${i}]
        ${horse_bank_name}=    set variable  ${bank_name_dict}[${horse_short_name}]  
        ${recv_account_no}=    create account_no 'random'
        ${recv_account_no2}=    create account_no 'random'
        ${recv_account_no3}=    create account_no 'random'
        ${recv_bank_name}=    create bank name '${horse_bank_name}'
        &{horse_dict}=    Create Dictionary     horse_id=${recv_id}    horse_type=${recv_type}    horse_name=${recv_name}    horse_lastname=${recv_lastname}    horse_account_no=${recv_account_no}    horse_account_name=${recv_bank_name}  horse_account_no2=${recv_account_no2}
        Set To Dictionary   ${horse_list_dict}   ${horse_short_name}=${horse_dict}
        set test variable    ${horse_list_dict}

        FOR   ${n}   IN RANGE    ${tran_count}
                ${victim_ip_address}=    create ip address 'random'
                ${txn_date}=    create transaction date 'before_create_case'
                ${txn_time}=   create transaction time 'random'
                ${txn_id}=   create transacion id 'random'
                ${txn_amount}=   create transacion amount 'random'
                Write Excel Cell	${start_row}   2    ${victim_person_name}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   3    ${victim_person_lastname}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   4    ${victim_account_no}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   5    ${victim_bank_name}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   7    ${victim_ip_address}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   8    ${recv_id}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   9    ${recv_type}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   11    ${recv_name}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   12    ${recv_lastname}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   13    ${recv_promptpay_type}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   14    ${recv_promptpay_id}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   15    ${recv_account_no}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   16    ${recv_bank_name}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   18    ${txn_date}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   19    ${txn_time}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   20    ${txn_id}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   21    ${txn_amount}    sheet_name=CreateBankCase
                ${start_row}=    evaluate   ${start_row}+${1}
                ${victim_ip_address}=    create ip address 'random'
                ${txn_date}=    create transaction date 'before_create_case'
                ${txn_time}=   create transaction time 'random'
                ${txn_id}=   create transacion id 'random'
                ${txn_amount}=   create transacion amount 'random'
                Write Excel Cell	${start_row}   2    ${victim_person_name}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   3    ${victim_person_lastname}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   4    ${victim_account_no}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   5    ${victim_bank_name}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   7    ${victim_ip_address}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   8    ${recv_id}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   9    ${recv_type}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   11    ${recv_name}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   12    ${recv_lastname}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   13    ${recv_promptpay_type}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   14    ${recv_promptpay_id}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   15    ${recv_account_no2}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   16    ${recv_bank_name}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   18    ${txn_date}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   19    ${txn_time}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   20    ${txn_id}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   21    ${txn_amount}    sheet_name=CreateBankCase
                ${start_row}=    evaluate   ${start_row}+${1}
                ${victim_ip_address}=    create ip address 'random'
                ${txn_date}=    create transaction date 'before_create_case'
                ${txn_time}=   create transaction time 'random'
                ${txn_id}=   create transacion id 'random'
                ${txn_amount}=   create transacion amount 'random'
                Write Excel Cell	${start_row}   2    ${victim_person_name}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   3    ${victim_person_lastname}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   4    ${victim_account_no}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   5    ${victim_bank_name}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   7    ${victim_ip_address}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   8    ${recv_id}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   9    ${recv_type}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   11    ${recv_name}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   12    ${recv_lastname}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   13    ${recv_promptpay_type}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   14    ${recv_promptpay_id}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   15    ${recv_account_no3}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   16    ${recv_bank_name}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   18    ${txn_date}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   19    ${txn_time}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   20    ${txn_id}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   21    ${txn_amount}    sheet_name=CreateBankCase
                ${start_row}=    evaluate   ${start_row}+${1}
                ${victim_ip_address}=    create ip address 'random'
                ${txn_date}=    create transaction date 'before_create_case'
                ${txn_time}=   create transaction time 'random'
                ${txn_id}=   create transacion id 'random'
                ${txn_amount}=   create transacion amount 'random'
                Write Excel Cell	${start_row}   2    ${victim_person_name}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   3    ${victim_person_lastname}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   4    ${victim_account_no}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   5    ${victim_bank_name}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   7    ${victim_ip_address}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   8    ${recv_id}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   9    ${recv_type}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   11    ${recv_name}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   12    ${recv_lastname}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   13    ${recv_promptpay_type}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   14    ${recv_promptpay_id}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   15    ${recv_account_no}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   16    ${recv_bank_name}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   18    ${txn_date}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   19    ${txn_time}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   20    ${txn_id}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   21    ${txn_amount}    sheet_name=CreateBankCase
                ${start_row}=    evaluate   ${start_row}+${1}
                ${victim_ip_address}=    create ip address 'random'
                ${txn_date}=    create transaction date 'before_create_case'
                ${txn_time}=   create transaction time 'random'
                ${txn_id}=   create transacion id 'random'
                ${txn_amount}=   create transacion amount 'random'
                Write Excel Cell	${start_row}   2    ${victim_person_name}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   3    ${victim_person_lastname}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   4    ${victim_account_no}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   5    ${victim_bank_name}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   7    ${victim_ip_address}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   8    ${recv_id}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   9    ${recv_type}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   11    ${recv_name}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   12    ${recv_lastname}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   13    ${recv_promptpay_type}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   14    ${recv_promptpay_id}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   15    ${recv_account_no2}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   16    ${recv_bank_name}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   18    ${txn_date}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   19    ${txn_time}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   20    ${txn_id}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   21    ${txn_amount}    sheet_name=CreateBankCase
                ${start_row}=    evaluate   ${start_row}+${1}
                ${victim_ip_address}=    create ip address 'random'
                ${txn_date}=    create transaction date 'before_create_case'
                ${txn_time}=   create transaction time 'random'
                ${txn_id}=   create transacion id 'random'
                ${txn_amount}=   create transacion amount 'random'
                Write Excel Cell	${start_row}   2    ${victim_person_name}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   3    ${victim_person_lastname}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   4    ${victim_account_no}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   5    ${victim_bank_name}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   7    ${victim_ip_address}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   8    ${recv_id}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   9    ${recv_type}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   11    ${recv_name}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   12    ${recv_lastname}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   13    ${recv_promptpay_type}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   14    ${recv_promptpay_id}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   15    ${recv_account_no3}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   16    ${recv_bank_name}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   18    ${txn_date}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   19    ${txn_time}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   20    ${txn_id}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   21    ${txn_amount}    sheet_name=CreateBankCase
                ${start_row}=    evaluate   ${start_row}+${1}
        END
     END
     Save Excel Document      filename=${CURDIR}/${FILE_NAME}.xlsx
     Close Current Excel Document
     ${recv_name} =	Remove String	${recv_name}   \n
     ${recv_lastname} =	Remove String	${recv_lastname}   \n
     ${recv_id} =	Remove String	${recv_id}   \n
    Append to File    ${CURDIR}/temp_trans.txt    Account1,${test_case_name},${horse_short_name},${master_case_id},${recv_account_no},${recv_name},${recv_lastname},${recv_id}\n
    Append to File    ${CURDIR}/temp_trans.txt    Account2,${test_case_name},${horse_short_name},${master_case_id},${recv_account_no2},${recv_name},${recv_lastname},${recv_id}\n
    Append to File    ${CURDIR}/temp_trans.txt    Account3,${test_case_name},${horse_short_name},${master_case_id},${recv_account_no3},${recv_name},${recv_lastname},${recv_id}\n



Create transaction to banks '${HORSE_LIST}' in '${FILE_NAME}' To 2 personal 3 account
    ${start_row}=    set variable   ${14}
    Open Excel Document      filename=${CURDIR}/${FILE_NAME}.xlsx   doc_id=docname1
    @{bank_words} =  Split String    ${HORSE_LIST}       ,
    ${horse_count}=    Get Length    ${bank_words}
     FOR    ${i}    IN RANGE    ${horse_count}
        ${tran_count}=    random_number_transaction   1
        set test variable   ${tran_count}     5 
        ${recv_id}=    create person id 'บุคคลธรรมดา'
        ${recv_id2}=    create person id 'บุคคลธรรมดา'
        ${recv_type}=    set variable    บุคคลธรรมดา
        ${recv_name}=    create person name 'random'
        ${recv_name2}=    create person name 'random'
        ${recv_lastname}=    create person lastname 'random'
        ${recv_lastname2}=    create person lastname 'random'
        ${recv_promptpay_type}=    create promptpay type 'random'
        set test variable    ${recv_promptpay_type}    ไม่มี
        ${recv_promptpay_id}=    set variable   ${EMPTY}
        IF  '${recv_promptpay_type}' == 'เบอร์โทร'
                ${recv_phone} =   random_number   9
                ${recv_promptpay_id} =   set variable   +66${recv_phone}
        ELSE IF  '${recv_promptpay_type}' == 'หมายเลขบัตรประชาชน'
                ${recv_promptpay_id} =   generate_thai_citizen_id
        ELSE IF  '${recv_promptpay_type}' == 'เลขนิติบุคคล (Biller Id)'
                ${recv_promptpay_id} =   random_number   15
        ELSE IF  '${recv_promptpay_type}' == 'e-wallet'
                ${recv_promptpay_id} =   random_number   15
        ELSE
                ${recv_promptpay_id} =   set variable   ${EMPTY}
        END
        ${horse_short_name}=    set variable    ${bank_words}[${i}]
        ${horse_bank_name}=    set variable  ${bank_name_dict}[${horse_short_name}]  
        ${recv_account_no}=    create account_no 'random'
        ${recv_account_no2}=    create account_no 'random'
        ${recv_account_no3}=    create account_no 'random'
        ${recv_account_no4}=    create account_no 'random'
        ${recv_account_no5}=    create account_no 'random'
        ${recv_account_no6}=    create account_no 'random'
        ${recv_bank_name}=    create bank name '${horse_bank_name}'
        &{horse_dict}=    Create Dictionary     horse_id=${recv_id}  horse_id2=${recv_id}    horse_type=${recv_type}    horse_name=${recv_name} horse_name2=${recv_name2}    horse_lastname=${recv_lastname}  horse_lastname2=${recv_lastname2}   horse_account_no=${recv_account_no}    horse_account_name=${recv_bank_name}  horse_account_no2=${recv_account_no2}  horse_account_no3=${recv_account_no3}  horse_account_no4=${recv_account_no4}  horse_account_no5=${recv_account_no5} horse_account_no6=${recv_account_no6}
        Set To Dictionary   ${horse_list_dict}   ${horse_short_name}=${horse_dict}
        set test variable    ${horse_list_dict}

        FOR   ${n}   IN RANGE    ${tran_count}
                ${victim_ip_address}=    create ip address 'random'
                ${txn_date}=    create transaction date 'before_create_case'
                ${txn_time}=   create transaction time 'random'
                ${txn_id}=   create transacion id 'random'
                ${txn_amount}=   create transacion amount 'random'
                Write Excel Cell	${start_row}   2    ${victim_person_name}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   3    ${victim_person_lastname}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   4    ${victim_account_no}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   5    ${victim_bank_name}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   7    ${victim_ip_address}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   8    ${recv_id}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   9    ${recv_type}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   11    ${recv_name}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   12    ${recv_lastname}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   13    ${recv_promptpay_type}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   14    ${recv_promptpay_id}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   15    ${recv_account_no}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   16    ${recv_bank_name}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   18    ${txn_date}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   19    ${txn_time}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   20    ${txn_id}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   21    ${txn_amount}    sheet_name=CreateBankCase
                ${start_row}=    evaluate   ${start_row}+${1}
                ${victim_ip_address}=    create ip address 'random'
                ${txn_date}=    create transaction date 'before_create_case'
                ${txn_time}=   create transaction time 'random'
                ${txn_id}=   create transacion id 'random'
                ${txn_amount}=   create transacion amount 'random'
                Write Excel Cell	${start_row}   2    ${victim_person_name}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   3    ${victim_person_lastname}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   4    ${victim_account_no}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   5    ${victim_bank_name}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   7    ${victim_ip_address}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   8    ${recv_id}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   9    ${recv_type}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   11    ${recv_name}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   12    ${recv_lastname}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   13    ${recv_promptpay_type}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   14    ${recv_promptpay_id}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   15    ${recv_account_no2}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   16    ${recv_bank_name}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   18    ${txn_date}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   19    ${txn_time}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   20    ${txn_id}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   21    ${txn_amount}    sheet_name=CreateBankCase
                ${start_row}=    evaluate   ${start_row}+${1}
                ${victim_ip_address}=    create ip address 'random'
                ${txn_date}=    create transaction date 'before_create_case'
                ${txn_time}=   create transaction time 'random'
                ${txn_id}=   create transacion id 'random'
                ${txn_amount}=   create transacion amount 'random'
                Write Excel Cell	${start_row}   2    ${victim_person_name}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   3    ${victim_person_lastname}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   4    ${victim_account_no}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   5    ${victim_bank_name}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   7    ${victim_ip_address}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   8    ${recv_id}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   9    ${recv_type}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   11    ${recv_name}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   12    ${recv_lastname}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   13    ${recv_promptpay_type}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   14    ${recv_promptpay_id}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   15    ${recv_account_no3}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   16    ${recv_bank_name}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   18    ${txn_date}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   19    ${txn_time}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   20    ${txn_id}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   21    ${txn_amount}    sheet_name=CreateBankCase
                ${start_row}=    evaluate   ${start_row}+${1}
               ${victim_ip_address}=    create ip address 'random'
                ${txn_date}=    create transaction date 'before_create_case'
                ${txn_time}=   create transaction time 'random'
                ${txn_id}=   create transacion id 'random'
                ${txn_amount}=   create transacion amount 'random'
                Write Excel Cell	${start_row}   2    ${victim_person_name}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   3    ${victim_person_lastname}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   4    ${victim_account_no}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   5    ${victim_bank_name}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   7    ${victim_ip_address}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   8    ${recv_id2}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   9    ${recv_type}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   11    ${recv_name2}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   12    ${recv_lastname2}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   13    ${recv_promptpay_type}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   14    ${recv_promptpay_id}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   15    ${recv_account_no4}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   16    ${recv_bank_name}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   18    ${txn_date}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   19    ${txn_time}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   20    ${txn_id}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   21    ${txn_amount}    sheet_name=CreateBankCase
                ${start_row}=    evaluate   ${start_row}+${1}
                ${victim_ip_address}=    create ip address 'random'
                ${txn_date}=    create transaction date 'before_create_case'
                ${txn_time}=   create transaction time 'random'
                ${txn_id}=   create transacion id 'random'
                ${txn_amount}=   create transacion amount 'random'
                Write Excel Cell	${start_row}   2    ${victim_person_name}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   3    ${victim_person_lastname}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   4    ${victim_account_no}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   5    ${victim_bank_name}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   7    ${victim_ip_address}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   8    ${recv_id2}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   9    ${recv_type}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   11    ${recv_name2}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   12    ${recv_lastname2}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   13    ${recv_promptpay_type}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   14    ${recv_promptpay_id}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   15    ${recv_account_no5}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   16    ${recv_bank_name}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   18    ${txn_date}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   19    ${txn_time}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   20    ${txn_id}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   21    ${txn_amount}    sheet_name=CreateBankCase
                ${start_row}=    evaluate   ${start_row}+${1}
                ${victim_ip_address}=    create ip address 'random'
                ${txn_date}=    create transaction date 'before_create_case'
                ${txn_time}=   create transaction time 'random'
                ${txn_id}=   create transacion id 'random'
                ${txn_amount}=   create transacion amount 'random'
                Write Excel Cell	${start_row}   2    ${victim_person_name}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   3    ${victim_person_lastname}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   4    ${victim_account_no}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   5    ${victim_bank_name}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   7    ${victim_ip_address}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   8    ${recv_id2}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   9    ${recv_type}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   11    ${recv_name2}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   12    ${recv_lastname2}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   13    ${recv_promptpay_type}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   14    ${recv_promptpay_id}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   15    ${recv_account_no6}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   16    ${recv_bank_name}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   18    ${txn_date}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   19    ${txn_time}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   20    ${txn_id}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   21    ${txn_amount}    sheet_name=CreateBankCase
                ${start_row}=    evaluate   ${start_row}+${1}
        END
     END
     Save Excel Document      filename=${CURDIR}/${FILE_NAME}.xlsx
     Close Current Excel Document
     ${recv_name} =	Remove String	${recv_name}   \n
     ${recv_lastname} =	Remove String	${recv_lastname}   \n
     ${recv_id} =	Remove String	${recv_id}   \n
     ${recv_name2} =	Remove String	${recv_name2}   \n
     ${recv_lastname2} =	Remove String	${recv_lastname2}   \n
     ${recv_id2} =	Remove String	${recv_id2}   \n
    Append to File    ${CURDIR}/temp_trans.txt    Account1,${test_case_name},${horse_short_name},${master_case_id},${recv_account_no},${recv_name},${recv_lastname},${recv_id}\n
    Append to File    ${CURDIR}/temp_trans.txt    Account2,${test_case_name},${horse_short_name},${master_case_id},${recv_account_no2},${recv_name},${recv_lastname},${recv_id}\n
    Append to File    ${CURDIR}/temp_trans.txt    Account3,${test_case_name},${horse_short_name},${master_case_id},${recv_account_no3},${recv_name},${recv_lastname},${recv_id}\n
    Append to File    ${CURDIR}/temp_trans.txt    Account1,${test_case_name},${horse_short_name},${master_case_id},${recv_account_no4},${recv_name2},${recv_lastname2},${recv_id2}\n
    Append to File    ${CURDIR}/temp_trans.txt    Account2,${test_case_name},${horse_short_name},${master_case_id},${recv_account_no5},${recv_name2},${recv_lastname2},${recv_id2}\n
    Append to File    ${CURDIR}/temp_trans.txt    Account3,${test_case_name},${horse_short_name},${master_case_id},${recv_account_no6},${recv_name2},${recv_lastname2},${recv_id2}\n


Create transaction to banks '${HORSE_LIST}' in '${FILE_NAME}' only 1
    ${start_row}=    set variable   ${14}
    Open Excel Document      filename=${CURDIR}/${FILE_NAME}.xlsx   doc_id=docname1
    @{bank_words} =  Split String    ${HORSE_LIST}       ,
    ${horse_count}=    Get Length    ${bank_words}
     FOR    ${i}    IN RANGE    ${horse_count}
        ${tran_count}=    random_number_transaction   1
        set test variable   ${tran_count}   1
        ${recv_id}=    create person id 'บุคคลธรรมดา'
        # set test variable   ${recv_id}    7632058666129
        ${recv_type}=    set variable    บุคคลธรรมดา
        ${recv_name}=    create person name 'random'
        # set test variable   ${recv_name}    1บัญชี
        ${recv_lastname}=    create person lastname 'random'
        # set test variable   ${recv_lastname}    หลายรอบ
        ${recv_promptpay_type}=    create promptpay type 'random'
        set test variable    ${recv_promptpay_type}     ไม่มี
        ${recv_promptpay_id}=    set variable   ${EMPTY}
        IF  '${recv_promptpay_type}' == 'เบอร์โทร'
                ${recv_phone} =   random_number   9
                ${recv_promptpay_id} =   set variable   +66${recv_phone}
        ELSE IF  '${recv_promptpay_type}' == 'หมายเลขบัตรประชาชน'
                ${recv_promptpay_id} =   generate_thai_citizen_id
        ELSE IF  '${recv_promptpay_type}' == 'เลขนิติบุคคล (Biller Id)'
                ${recv_promptpay_id} =   random_number   15
        ELSE IF  '${recv_promptpay_type}' == 'e-wallet'
                ${recv_promptpay_id} =   random_number   15
        ELSE
                ${recv_promptpay_id} =   set variable   ${EMPTY}
        END
        ${horse_short_name}=    set variable    ${bank_words}[${i}]
        ${horse_bank_name}=    set variable  ${bank_name_dict}[${horse_short_name}]  
        ${recv_account_no}=    create account_no 'random'
        set test variable    ${recv_account_no}     2274089880
        ${recv_bank_name}=    create bank name '${horse_bank_name}'
        &{horse_dict}=    Create Dictionary     horse_id=${recv_id}    horse_type=${recv_type}    horse_name=${recv_name}    horse_lastname=${recv_lastname}    horse_account_no=${recv_account_no}    horse_account_name=${recv_bank_name}
        Set To Dictionary   ${horse_list_dict}   ${horse_short_name}=${horse_dict}
        set test variable    ${horse_list_dict}

        FOR   ${n}   IN RANGE    ${tran_count}
                ${victim_ip_address}=    create ip address 'random'
                ${txn_date}=    create transaction date 'before_create_case'
                ${txn_time}=   create transaction time 'random'
                ${txn_id}=   create transacion id 'random'
                ${txn_amount}=   create transacion amount 'random'
                Write Excel Cell	${start_row}   2    ${victim_person_name}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   3    ${victim_person_lastname}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   4    ${victim_account_no}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   5    ${victim_bank_name}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   7    ${victim_ip_address}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   8    ${recv_id}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   9    ${recv_type}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   11    ${recv_name}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   12    ${recv_lastname}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   13    ${recv_promptpay_type}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   14    ${recv_promptpay_id}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   15    ${recv_account_no}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   16    ${recv_bank_name}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   18    ${txn_date}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   19    ${txn_time}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   20    ${txn_id}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   21    ${txn_amount}    sheet_name=CreateBankCase
                    #   after_create_case , before_create_case , today
    ${วันและเวลาที่อายัด_72_hrs}=    create block_unblock date time 'today'
    ${วันและเวลาที่ปลด_72_hrs}=    create block_unblock date time 'after_create_case'
    ${วันและเวลาที่แจ้งความ_ขยายจาก_72_ชม_เป็น_7_วัน}=    create block_unblock date time 'after_create_case'
    ${วันและเวลาที่_Fraud_พิจารณาอายัดตามมาตรา_6_7_วัน}=    create block_unblock date time 'after_create_case'
    ${วันและเวลาที่ปลด_7_วัน}=    create block_unblock date time 'after_create_case'
    ${วันและเวลาที่อายัดจากตำรวจ}=    create block_unblock date time 'today'
    ${วันและเวลาที่ปลดจากตำรวจ}=    create block_unblock date time 'after_create_case'
    Write Excel Cell	${start_row}   22    ${วันและเวลาที่อายัด_72_hrs}    sheet_name=CreateBankCase
    Write Excel Cell	${start_row}   23    ${วันและเวลาที่ปลด_72_hrs}    sheet_name=CreateBankCase
    Write Excel Cell	${start_row}   24    ${วันและเวลาที่แจ้งความ_ขยายจาก_72_ชม_เป็น_7_วัน}    sheet_name=CreateBankCase
    Write Excel Cell	${start_row}   25    ${วันและเวลาที่_Fraud_พิจารณาอายัดตามมาตรา_6_7_วัน}    sheet_name=CreateBankCase
    Write Excel Cell	${start_row}   26    ${วันและเวลาที่ปลด_7_วัน}    sheet_name=CreateBankCase
    Write Excel Cell	${start_row}  30    ${วันและเวลาที่อายัดจากตำรวจ}    sheet_name=CreateBankCase
    Write Excel Cell	${start_row}   31    ${วันและเวลาที่ปลดจากตำรวจ}    sheet_name=CreateBankCase

    ${ประเภทของการอายัดจากธนาคาร}=    ประเภทของการอายัดจากธนาคาร 'random'
    Write Excel Cell	${start_row}   27    ${ประเภทของการอายัดจากธนาคาร}    sheet_name=CreateBankCase
    IF  '${ประเภทของการอายัดจากธนาคาร}' == 'ระงับเฉพาะยอดเงิน'
        ${จำนวนเงินธุรกรรมที่ระงับจากธนาคาร}=   create transacion amount 'random'
        ${จำนวนเงินคงเหลือหลังอายัดจากธนาคาร}=   create transacion amount 'random'
        Write Excel Cell	${start_row}   28    ${จำนวนเงินธุรกรรมที่ระงับจากธนาคาร}    sheet_name=CreateBankCase
        Write Excel Cell	${start_row}   29    ${จำนวนเงินคงเหลือหลังอายัดจากธนาคาร}    sheet_name=CreateBankCase
    END
    ${ประเภทของหมายอายัดจากตำรวจ}=    ประเภทของหมายอายัดจากตำรวจ 'random'
    Write Excel Cell	${start_row}   32    ${ประเภทของหมายอายัดจากตำรวจ}    sheet_name=CreateBankCase
    IF   '${ประเภทของหมายอายัดจากตำรวจ}' == 'หมายอายัดเฉพาะยอดเงินที่ระบุ (Q)'
       ${จำนวนวงเงินที่อายัดจากตำรวจ}=   create transacion amount 'random'
        Write Excel Cell	${start_row}   34    ${จำนวนวงเงินที่อายัดจากตำรวจ}    sheet_name=CreateBankCase
    END
    IF   '${ประเภทของหมายอายัดจากตำรวจ}' != '${EMPTY}'
        ${ใส่หมายอายัดจากตำรวจ}=   random_string   10
        ${ใส่หมายปลดอายัดจากตำรวจ}=   random_string   10
        Write Excel Cell	${start_row}   33    ${ใส่หมายอายัดจากตำรวจ}    sheet_name=CreateBankCase
        Write Excel Cell	${start_row}   35    ${ใส่หมายปลดอายัดจากตำรวจ}    sheet_name=CreateBankCase            
    END
                ${start_row}=    evaluate   ${start_row}+${1}
        END
     END
     Save Excel Document      filename=${CURDIR}/${FILE_NAME}.xlsx
     Close Current Excel Document
         ${recv_name} =	Remove String	${recv_name}   \n
     ${recv_lastname} =	Remove String	${recv_lastname}   \n
     ${recv_id} =	Remove String	${recv_id}   \n
        Append to File    ${CURDIR}/temp_trans.txt    ${master_case_id},${test_case_name},${horse_short_name},${recv_name},${recv_lastname},${recv_account_no},${recv_id}\n


Create transaction to banks '${HORSE_LIST}' in '${FILE_NAME}' Cleansing TC01
    ${start_row}=    set variable   ${14}
    Open Excel Document      filename=${CURDIR}/${FILE_NAME}.xlsx   doc_id=docname1
    @{bank_words} =  Split String    ${HORSE_LIST}       ,
    ${horse_count}=    Get Length    ${bank_words}
     FOR    ${i}    IN RANGE    ${horse_count}
        ${tran_count}=    random_number_transaction   1
        set test variable   ${tran_count}   1
        ${recv_id}=    create person id 'บุคคลธรรมดา'
        # set test variable   ${recv_id}    5794336719050
        ${recv_type}=    set variable    บุคคลธรรมดา
        ${recv_name}=    create person name 'random'
        # set test variable   ${recv_name}    ทดสอบ
        ${recv_lastname}=    create person lastname 'random'
        # set test variable   ${recv_lastname}    รอบสอง
        ${recv_promptpay_type}=    create promptpay type 'random'
        set test variable    ${recv_promptpay_type}     ไม่มี
        ${recv_promptpay_id}=    set variable   ${EMPTY}
        IF  '${recv_promptpay_type}' == 'เบอร์โทร'
                ${recv_phone} =   random_number   9
                ${recv_promptpay_id} =   set variable   +66${recv_phone}
        ELSE IF  '${recv_promptpay_type}' == 'หมายเลขบัตรประชาชน'
                ${recv_promptpay_id} =   generate_thai_citizen_id
        ELSE IF  '${recv_promptpay_type}' == 'เลขนิติบุคคล (Biller Id)'
                ${recv_promptpay_id} =   random_number   15
        ELSE IF  '${recv_promptpay_type}' == 'e-wallet'
                ${recv_promptpay_id} =   random_number   15
        ELSE
                ${recv_promptpay_id} =   set variable   ${EMPTY}
        END
        ${horse_short_name}=    set variable    ${bank_words}[${i}]
        ${horse_bank_name}=    set variable  ${bank_name_dict}[${horse_short_name}]  
        ${recv_account_no}=    create account_no 'random'
        # set test variable    ${recv_account_no}     6543211200
        ${recv_bank_name}=    create bank name '${horse_bank_name}'
        &{horse_dict}=    Create Dictionary     horse_id=${recv_id}    horse_type=${recv_type}    horse_name=${recv_name}    horse_lastname=${recv_lastname}    horse_account_no=${recv_account_no}    horse_account_name=${recv_bank_name}
        Set To Dictionary   ${horse_list_dict}   ${horse_short_name}=${horse_dict}
        set test variable    ${horse_list_dict}

        FOR   ${n}   IN RANGE    ${tran_count}
                ${victim_ip_address}=    create ip address 'random'
                ${txn_date}=    create transaction date 'before_create_case'
                ${txn_time}=   create transaction time 'random'
                ${txn_id}=   create transacion id 'random'
                ${txn_amount}=   create transacion amount 'random'
                Write Excel Cell	${start_row}   2    ${victim_person_name}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   3    ${victim_person_lastname}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   4    ${victim_account_no}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   5    ${victim_bank_name}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   7    ${victim_ip_address}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   8    ${recv_id}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   9    ${recv_type}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   11    ${recv_name}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   12    ${recv_lastname}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   13    ${recv_promptpay_type}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   14    ${recv_promptpay_id}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   15    ${recv_account_no}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   16    ${recv_bank_name}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   18    ${txn_date}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   19    ${txn_time}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   20    ${txn_id}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   21    ${txn_amount}    sheet_name=CreateBankCase
                    #   after_create_case , before_create_case , today
    ${วันและเวลาที่อายัด_72_hrs}=    create block_unblock date time 'today'
    ${วันและเวลาที่ปลด_72_hrs}=    create block_unblock date time 'after_create_case'
    ${วันและเวลาที่แจ้งความ_ขยายจาก_72_ชม_เป็น_7_วัน}=    create block_unblock date time 'after_create_case'
    ${วันและเวลาที่_Fraud_พิจารณาอายัดตามมาตรา_6_7_วัน}=    create block_unblock date time 'after_create_case'
    ${วันและเวลาที่ปลด_7_วัน}=    create block_unblock date time 'after_create_case'
    ${วันและเวลาที่อายัดจากตำรวจ}=    create block_unblock date time 'today'
    ${วันและเวลาที่ปลดจากตำรวจ}=    create block_unblock date time 'after_create_case'
    Write Excel Cell	${start_row}   22    ${วันและเวลาที่อายัด_72_hrs}    sheet_name=CreateBankCase
    Write Excel Cell	${start_row}   23    ${วันและเวลาที่ปลด_72_hrs}    sheet_name=CreateBankCase
    Write Excel Cell	${start_row}   24    ${วันและเวลาที่แจ้งความ_ขยายจาก_72_ชม_เป็น_7_วัน}    sheet_name=CreateBankCase
    Write Excel Cell	${start_row}   25    ${วันและเวลาที่_Fraud_พิจารณาอายัดตามมาตรา_6_7_วัน}    sheet_name=CreateBankCase
    Write Excel Cell	${start_row}   26    ${วันและเวลาที่ปลด_7_วัน}    sheet_name=CreateBankCase
    Write Excel Cell	${start_row}  30    ${วันและเวลาที่อายัดจากตำรวจ}    sheet_name=CreateBankCase
    Write Excel Cell	${start_row}   31    ${วันและเวลาที่ปลดจากตำรวจ}    sheet_name=CreateBankCase

    ${ประเภทของการอายัดจากธนาคาร}=    ประเภทของการอายัดจากธนาคาร 'random'
    Write Excel Cell	${start_row}   27    ${ประเภทของการอายัดจากธนาคาร}    sheet_name=CreateBankCase
    IF  '${ประเภทของการอายัดจากธนาคาร}' == 'ระงับเฉพาะยอดเงิน'
        ${จำนวนเงินธุรกรรมที่ระงับจากธนาคาร}=   create transacion amount 'random'
        ${จำนวนเงินคงเหลือหลังอายัดจากธนาคาร}=   create transacion amount 'random'
        Write Excel Cell	${start_row}   28    ${จำนวนเงินธุรกรรมที่ระงับจากธนาคาร}    sheet_name=CreateBankCase
        Write Excel Cell	${start_row}   29    ${จำนวนเงินคงเหลือหลังอายัดจากธนาคาร}    sheet_name=CreateBankCase
    END
    ${ประเภทของหมายอายัดจากตำรวจ}=    ประเภทของหมายอายัดจากตำรวจ 'random'
    Write Excel Cell	${start_row}   32    ${ประเภทของหมายอายัดจากตำรวจ}    sheet_name=CreateBankCase
    IF   '${ประเภทของหมายอายัดจากตำรวจ}' == 'หมายอายัดเฉพาะยอดเงินที่ระบุ (Q)'
       ${จำนวนวงเงินที่อายัดจากตำรวจ}=   create transacion amount 'random'
        Write Excel Cell	${start_row}   34    ${จำนวนวงเงินที่อายัดจากตำรวจ}    sheet_name=CreateBankCase
    END
    IF   '${ประเภทของหมายอายัดจากตำรวจ}' != '${EMPTY}'
        ${ใส่หมายอายัดจากตำรวจ}=   random_string   10
        ${ใส่หมายปลดอายัดจากตำรวจ}=   random_string   10
        Write Excel Cell	${start_row}   33    ${ใส่หมายอายัดจากตำรวจ}    sheet_name=CreateBankCase
        Write Excel Cell	${start_row}   35    ${ใส่หมายปลดอายัดจากตำรวจ}    sheet_name=CreateBankCase            
    END
                ${start_row}=    evaluate   ${start_row}+${1}
        END
     END
     Save Excel Document      filename=${CURDIR}/${FILE_NAME}.xlsx
     Close Current Excel Document
         ${recv_name} =	Remove String	${recv_name}   \n
     ${recv_lastname} =	Remove String	${recv_lastname}   \n
     ${recv_id} =	Remove String	${recv_id}   \n
        Append to File    ${CURDIR}/temp_trans.txt    ${master_case_id},${test_case_name},${horse_short_name},${recv_name},${recv_lastname},${recv_account_no},${recv_id}\n


Create transaction to banks '${HORSE_LIST}' in '${FILE_NAME}' personal null
    ${start_row}=    set variable   ${14}
    Open Excel Document      filename=${CURDIR}/${FILE_NAME}.xlsx   doc_id=docname1
    @{bank_words} =  Split String    ${HORSE_LIST}       ,
    ${horse_count}=    Get Length    ${bank_words}
     FOR    ${i}    IN RANGE    ${horse_count}
        ${tran_count}=    random_number_transaction   1
        set test variable   ${tran_count}   1
        ${recv_id}=    create person id 'บุคคลธรรมดา'
        set test variable   ${recv_id}    ${EMPTY}
        ${recv_type}=    set variable     ${EMPTY}
        ${recv_name}=    create person name 'random'
        # set test variable   ${recv_name}    วิมลวรรณ
        ${recv_lastname}=    create person lastname 'random'
        ${recv_promptpay_type}=    create promptpay type 'random'
        set test variable    ${recv_promptpay_type}     ไม่มี
        ${recv_promptpay_id}=    set variable   ${EMPTY}
        IF  '${recv_promptpay_type}' == 'เบอร์โทร'
                ${recv_phone} =   random_number   9
                ${recv_promptpay_id} =   set variable   +66${recv_phone}
        ELSE IF  '${recv_promptpay_type}' == 'หมายเลขบัตรประชาชน'
                ${recv_promptpay_id} =   generate_thai_citizen_id
        ELSE IF  '${recv_promptpay_type}' == 'เลขนิติบุคคล (Biller Id)'
                ${recv_promptpay_id} =   random_number   15
        ELSE IF  '${recv_promptpay_type}' == 'e-wallet'
                ${recv_promptpay_id} =   random_number   15
        ELSE
                ${recv_promptpay_id} =   set variable   ${EMPTY}
        END
        ${horse_short_name}=    set variable    ${bank_words}[${i}]
        ${horse_bank_name}=    set variable  ${bank_name_dict}[${horse_short_name}]  
        ${recv_account_no}=    create account_no 'random'
        ${recv_bank_name}=    create bank name '${horse_bank_name}'
        &{horse_dict}=    Create Dictionary     horse_id=${recv_id}    horse_type=${recv_type}    horse_name=${recv_name}    horse_lastname=${recv_lastname}    horse_account_no=${recv_account_no}    horse_account_name=${recv_bank_name}
        Set To Dictionary   ${horse_list_dict}   ${horse_short_name}=${horse_dict}
        set test variable    ${horse_list_dict}

        FOR   ${n}   IN RANGE    ${tran_count}
                ${victim_ip_address}=    create ip address 'random'
                ${txn_date}=    create transaction date 'before_create_case'
                ${txn_time}=   create transaction time 'random'
                ${txn_id}=   create transacion id 'random'
                ${txn_amount}=   create transacion amount 'random'
                Write Excel Cell	${start_row}   2    ${victim_person_name}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   3    ${victim_person_lastname}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   4    ${victim_account_no}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   5    ${victim_bank_name}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   7    ${victim_ip_address}    sheet_name=CreateBankCase
                # Write Excel Cell	${start_row}   8    ${recv_id}    sheet_name=CreateBankCase
                # Write Excel Cell	${start_row}   9    ${recv_type}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   11    ${recv_name}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   12    ${recv_lastname}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   13    ${recv_promptpay_type}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   14    ${recv_promptpay_id}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   15    ${recv_account_no}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   16    ${recv_bank_name}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   18    ${txn_date}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   19    ${txn_time}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   20    ${txn_id}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   21    ${txn_amount}    sheet_name=CreateBankCase
                #   after_create_case , before_create_case , today
    ${วันและเวลาที่อายัด_72_hrs}=    create block_unblock date time 'today'
    ${วันและเวลาที่ปลด_72_hrs}=    create block_unblock date time 'after_create_case'
    ${วันและเวลาที่แจ้งความ_ขยายจาก_72_ชม_เป็น_7_วัน}=    create block_unblock date time 'after_create_case'
    ${วันและเวลาที่_Fraud_พิจารณาอายัดตามมาตรา_6_7_วัน}=    create block_unblock date time 'after_create_case'
    ${วันและเวลาที่ปลด_7_วัน}=    create block_unblock date time 'after_create_case'
    ${วันและเวลาที่อายัดจากตำรวจ}=    create block_unblock date time 'today'
    ${วันและเวลาที่ปลดจากตำรวจ}=    create block_unblock date time 'after_create_case'
    Write Excel Cell	${start_row}   22    ${วันและเวลาที่อายัด_72_hrs}    sheet_name=CreateBankCase
    Write Excel Cell	${start_row}   23    ${วันและเวลาที่ปลด_72_hrs}    sheet_name=CreateBankCase
    Write Excel Cell	${start_row}   24    ${วันและเวลาที่แจ้งความ_ขยายจาก_72_ชม_เป็น_7_วัน}    sheet_name=CreateBankCase
    Write Excel Cell	${start_row}   25    ${วันและเวลาที่_Fraud_พิจารณาอายัดตามมาตรา_6_7_วัน}    sheet_name=CreateBankCase
    Write Excel Cell	${start_row}   26    ${วันและเวลาที่ปลด_7_วัน}    sheet_name=CreateBankCase
    Write Excel Cell	${start_row}  30    ${วันและเวลาที่อายัดจากตำรวจ}    sheet_name=CreateBankCase
    Write Excel Cell	${start_row}   31    ${วันและเวลาที่ปลดจากตำรวจ}    sheet_name=CreateBankCase

    ${ประเภทของการอายัดจากธนาคาร}=    ประเภทของการอายัดจากธนาคาร 'random'
    Write Excel Cell	${start_row}   27    ${ประเภทของการอายัดจากธนาคาร}    sheet_name=CreateBankCase
    IF  '${ประเภทของการอายัดจากธนาคาร}' == 'ระงับเฉพาะยอดเงิน'
        ${จำนวนเงินธุรกรรมที่ระงับจากธนาคาร}=   create transacion amount 'random'
        ${จำนวนเงินคงเหลือหลังอายัดจากธนาคาร}=   create transacion amount 'random'
        Write Excel Cell	${start_row}   28    ${จำนวนเงินธุรกรรมที่ระงับจากธนาคาร}    sheet_name=CreateBankCase
        Write Excel Cell	${start_row}   29    ${จำนวนเงินคงเหลือหลังอายัดจากธนาคาร}    sheet_name=CreateBankCase
    END
    ${ประเภทของหมายอายัดจากตำรวจ}=    ประเภทของหมายอายัดจากตำรวจ 'random'
    Write Excel Cell	${start_row}   32    ${ประเภทของหมายอายัดจากตำรวจ}    sheet_name=CreateBankCase
    IF   '${ประเภทของหมายอายัดจากตำรวจ}' == 'หมายอายัดเฉพาะยอดเงินที่ระบุ (Q)'
       ${จำนวนวงเงินที่อายัดจากตำรวจ}=   create transacion amount 'random'
        Write Excel Cell	${start_row}   34    ${จำนวนวงเงินที่อายัดจากตำรวจ}    sheet_name=CreateBankCase
    END
    IF   '${ประเภทของหมายอายัดจากตำรวจ}' != '${EMPTY}'
        ${ใส่หมายอายัดจากตำรวจ}=   random_string   10
        ${ใส่หมายปลดอายัดจากตำรวจ}=   random_string   10
        Write Excel Cell	${start_row}   33    ${ใส่หมายอายัดจากตำรวจ}    sheet_name=CreateBankCase
        Write Excel Cell	${start_row}   35    ${ใส่หมายปลดอายัดจากตำรวจ}    sheet_name=CreateBankCase            
    END
                ${start_row}=    evaluate   ${start_row}+${1}
        END
     END
     Save Excel Document      filename=${CURDIR}/${FILE_NAME}.xlsx
     Close Current Excel Document
         ${recv_name} =	Remove String	${recv_name}   \n
     ${recv_lastname} =	Remove String	${recv_lastname}   \n
     ${recv_id} =	Remove String	${recv_id}   \n
        Append to File    ${CURDIR}/temp_trans.txt    ${master_case_id},${test_case_name},${horse_short_name},${recv_name},${recv_lastname},${recv_account_no},${recv_id}\n



Create transaction to banks '${HORSE_LIST}' in '${FILE_NAME}' many PersonalID
    ${start_row}=    set variable   ${14}
    Open Excel Document      filename=${CURDIR}/${FILE_NAME}.xlsx   doc_id=docname1
    @{bank_words} =  Split String    ${HORSE_LIST}       ,
    ${horse_count}=    Get Length    ${bank_words}
     FOR    ${i}    IN RANGE    ${horse_count}
        ${tran_count}=    random_number_transaction   1
        set test variable   ${tran_count}   1
        ${recv_id}=    create person id 'บุคคลธรรมดา'
        # set test variable   ${recv_id}    5794336719050
        ${recv_type}=    set variable    บุคคลธรรมดา
        ${recv_name}=    create person name 'random'
        set test variable   ${recv_name}    นิรดา
        ${recv_lastname}=    create person lastname 'random'
        set test variable   ${recv_lastname}    ภูงาม
        ${recv_promptpay_type}=    create promptpay type 'random'
        set test variable    ${recv_promptpay_type}     ไม่มี
        ${recv_promptpay_id}=    set variable   ${EMPTY}
        IF  '${recv_promptpay_type}' == 'เบอร์โทร'
                ${recv_phone} =   random_number   9
                ${recv_promptpay_id} =   set variable   +66${recv_phone}
        ELSE IF  '${recv_promptpay_type}' == 'หมายเลขบัตรประชาชน'
                ${recv_promptpay_id} =   generate_thai_citizen_id
        ELSE IF  '${recv_promptpay_type}' == 'เลขนิติบุคคล (Biller Id)'
                ${recv_promptpay_id} =   random_number   15
        ELSE IF  '${recv_promptpay_type}' == 'e-wallet'
                ${recv_promptpay_id} =   random_number   15
        ELSE
                ${recv_promptpay_id} =   set variable   ${EMPTY}
        END
        ${horse_short_name}=    set variable    ${bank_words}[${i}]
        ${horse_bank_name}=    set variable  ${bank_name_dict}[${horse_short_name}]  
        ${recv_account_no}=    create account_no 'random'
        set test variable    ${recv_account_no}     7500020001
        ${recv_bank_name}=    create bank name '${horse_bank_name}'
        &{horse_dict}=    Create Dictionary     horse_id=${recv_id}    horse_type=${recv_type}    horse_name=${recv_name}    horse_lastname=${recv_lastname}    horse_account_no=${recv_account_no}    horse_account_name=${recv_bank_name}
        Set To Dictionary   ${horse_list_dict}   ${horse_short_name}=${horse_dict}
        set test variable    ${horse_list_dict}
        Append to File    ${CURDIR}/temp_trans.txt    ${master_case_id},${test_case_name},${horse_short_name},${recv_name},${recv_lastname},${recv_account_no},${recv_id}\n

        FOR   ${n}   IN RANGE    ${tran_count}
                ${victim_ip_address}=    create ip address 'random'
                ${txn_date}=    create transaction date 'before_create_case'
                ${txn_time}=   create transaction time 'random'
                ${txn_id}=   create transacion id 'random'
                ${txn_amount}=   create transacion amount 'random'
                Write Excel Cell	${start_row}   2    ${victim_person_name}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   3    ${victim_person_lastname}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   4    ${victim_account_no}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   5    ${victim_bank_name}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   7    ${victim_ip_address}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   8    ${recv_id}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   9    ${recv_type}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   11    ${recv_name}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   12    ${recv_lastname}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   13    ${recv_promptpay_type}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   14    ${recv_promptpay_id}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   15    ${recv_account_no}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   16    ${recv_bank_name}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   18    ${txn_date}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   19    ${txn_time}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   20    ${txn_id}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   21    ${txn_amount}    sheet_name=CreateBankCase
                ${start_row}=    evaluate   ${start_row}+${1}
        END
     END
     Save Excel Document      filename=${CURDIR}/${FILE_NAME}.xlsx
     Close Current Excel Document


Create transaction to banks '${HORSE_LIST}' in '${FILE_NAME}' only 2
    ${start_row}=    set variable   ${14}
    Open Excel Document      filename=${CURDIR}/${FILE_NAME}.xlsx   doc_id=docname1
    @{bank_words} =  Split String    ${HORSE_LIST}       ,
    ${horse_count}=    Get Length    ${bank_words}
     FOR    ${i}    IN RANGE    ${horse_count}
        ${tran_count}=    random_number_transaction   1
        set test variable   ${tran_count}   1
        ${recv_id}=    create person id 'บุคคลธรรมดา'
        set test variable   ${recv_id}    5794336719050AA3
        ${recv_type}=    set variable    บุคคลธรรมดา
        ${recv_name}=    create person name 'random'
        set test variable   ${recv_name}    Chachaya
        ${recv_lastname}=    create person lastname 'random'
        set test variable   ${recv_lastname}    Sritong
        ${recv_promptpay_type}=    create promptpay type 'random'
        set test variable    ${recv_promptpay_type}     ไม่มี
        ${recv_promptpay_id}=    set variable   ${EMPTY}
        IF  '${recv_promptpay_type}' == 'เบอร์โทร'
                ${recv_phone} =   random_number   9
                ${recv_promptpay_id} =   set variable   +66${recv_phone}
        ELSE IF  '${recv_promptpay_type}' == 'หมายเลขบัตรประชาชน'
                ${recv_promptpay_id} =   generate_thai_citizen_id
        ELSE IF  '${recv_promptpay_type}' == 'เลขนิติบุคคล (Biller Id)'
                ${recv_promptpay_id} =   random_number   15
        ELSE IF  '${recv_promptpay_type}' == 'e-wallet'
                ${recv_promptpay_id} =   random_number   15
        ELSE
                ${recv_promptpay_id} =   set variable   ${EMPTY}
        END
        ${horse_short_name}=    set variable    ${bank_words}[${i}]
        ${horse_bank_name}=    set variable  ${bank_name_dict}[${horse_short_name}]  
        ${recv_account_no}=    create account_no 'random'
        # set test variable    ${recv_account_no}     3333333333
        ${recv_bank_name}=    create bank name '${horse_bank_name}'
        &{horse_dict}=    Create Dictionary     horse_id=${recv_id}    horse_type=${recv_type}    horse_name=${recv_name}    horse_lastname=${recv_lastname}    horse_account_no=${recv_account_no}    horse_account_name=${recv_bank_name}
        Set To Dictionary   ${horse_list_dict}   ${horse_short_name}=${horse_dict}
        set test variable    ${horse_list_dict}
        Append to File    ${CURDIR}/temp_trans.txt    ${master_case_id},${test_case_name},${horse_short_name},${recv_name},${recv_lastname},${recv_account_no},${recv_id}\n

        FOR   ${n}   IN RANGE    ${tran_count}
                ${victim_ip_address}=    create ip address 'random'
                ${txn_date}=    create transaction date 'before_create_case'
                ${txn_time}=   create transaction time 'random'
                ${txn_id}=   create transacion id 'random'
                ${txn_amount}=   create transacion amount 'random'
                Write Excel Cell	${start_row}   2    ${victim_person_name}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   3    ${victim_person_lastname}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   4    ${victim_account_no}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   5    ${victim_bank_name}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   7    ${victim_ip_address}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   8    ${recv_id}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   9    ${recv_type}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   11    ${recv_name}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   12    ${recv_lastname}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   13    ${recv_promptpay_type}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   14    ${recv_promptpay_id}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   15    ${recv_account_no}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   16    ${recv_bank_name}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   18    ${txn_date}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   19    ${txn_time}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   20    ${txn_id}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   21    ${txn_amount}    sheet_name=CreateBankCase
                ${start_row}=    evaluate   ${start_row}+${1}
        END
     END
     Save Excel Document      filename=${CURDIR}/${FILE_NAME}.xlsx
     Close Current Excel Document

Create transaction to banks '${HORSE_LIST}' in '${FILE_NAME}' only 3
    ${start_row}=    set variable   ${14}
    Open Excel Document      filename=${CURDIR}/${FILE_NAME}.xlsx   doc_id=docname1
    @{bank_words} =  Split String    ${HORSE_LIST}       ,
    ${horse_count}=    Get Length    ${bank_words}
     FOR    ${i}    IN RANGE    ${horse_count}
        ${tran_count}=    random_number_transaction   1
        set test variable   ${tran_count}   1
        ${recv_id}=    create person id 'บุคคลธรรมดา'
        # set test variable   ${recv_id}    5794336719050AA3
        ${recv_type}=    set variable    บุคคลธรรมดา
        ${recv_name}=    create person name 'random'
        set test variable   ${recv_name}    Chayut
        ${recv_lastname}=    create person lastname 'random'
        set test variable   ${recv_lastname}    Srisai
        ${recv_promptpay_type}=    create promptpay type 'random'
        set test variable    ${recv_promptpay_type}     ไม่มี
        ${recv_promptpay_id}=    set variable   ${EMPTY}
        IF  '${recv_promptpay_type}' == 'เบอร์โทร'
                ${recv_phone} =   random_number   9
                ${recv_promptpay_id} =   set variable   +66${recv_phone}
        ELSE IF  '${recv_promptpay_type}' == 'หมายเลขบัตรประชาชน'
                ${recv_promptpay_id} =   generate_thai_citizen_id
        ELSE IF  '${recv_promptpay_type}' == 'เลขนิติบุคคล (Biller Id)'
                ${recv_promptpay_id} =   random_number   15
        ELSE IF  '${recv_promptpay_type}' == 'e-wallet'
                ${recv_promptpay_id} =   random_number   15
        ELSE
                ${recv_promptpay_id} =   set variable   ${EMPTY}
        END
        ${horse_short_name}=    set variable    ${bank_words}[${i}]
        ${horse_bank_name}=    set variable  ${bank_name_dict}[${horse_short_name}]  
        ${recv_account_no}=    create account_no 'random'
        set test variable    ${recv_account_no}     6666666654
        ${recv_bank_name}=    create bank name '${horse_bank_name}'
        &{horse_dict}=    Create Dictionary     horse_id=${recv_id}    horse_type=${recv_type}    horse_name=${recv_name}    horse_lastname=${recv_lastname}    horse_account_no=${recv_account_no}    horse_account_name=${recv_bank_name}
        Set To Dictionary   ${horse_list_dict}   ${horse_short_name}=${horse_dict}
        set test variable    ${horse_list_dict}
        Append to File    ${CURDIR}/temp_trans.txt    ${master_case_id},${test_case_name},${horse_short_name},${recv_name},${recv_lastname},${recv_account_no},${recv_id}\n

        FOR   ${n}   IN RANGE    ${tran_count}
                ${victim_ip_address}=    create ip address 'random'
                ${txn_date}=    create transaction date 'before_create_case'
                ${txn_time}=   create transaction time 'random'
                ${txn_id}=   create transacion id 'random'
                ${txn_amount}=   create transacion amount 'random'
                Write Excel Cell	${start_row}   2    ${victim_person_name}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   3    ${victim_person_lastname}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   4    ${victim_account_no}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   5    ${victim_bank_name}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   7    ${victim_ip_address}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   8    ${recv_id}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   9    ${recv_type}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   11    ${recv_name}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   12    ${recv_lastname}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   13    ${recv_promptpay_type}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   14    ${recv_promptpay_id}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   15    ${recv_account_no}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   16    ${recv_bank_name}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   18    ${txn_date}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   19    ${txn_time}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   20    ${txn_id}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   21    ${txn_amount}    sheet_name=CreateBankCase
                ${start_row}=    evaluate   ${start_row}+${1}
        END
     END
     Save Excel Document      filename=${CURDIR}/${FILE_NAME}.xlsx
     Close Current Excel Document




Create transaction to banks นิติบุคคล '${HORSE_LIST}' in '${FILE_NAME}'
    ${start_row}=    set variable   ${14}
    Open Excel Document      filename=${CURDIR}/${FILE_NAME}.xlsx   doc_id=docname1
    @{bank_words} =  Split String    ${HORSE_LIST}       ,
    ${horse_count}=    Get Length    ${bank_words}
     FOR    ${i}    IN RANGE    ${horse_count}
        ${tran_count}=    random_number_transaction   1
        ${recv_id}=    create person id 'นิติบุคคล'
        ${recv_type}=    set variable    นิติบุคคล
        ${recv_name}=    create person name 'random'
        ${recv_promptpay_type}=    create promptpay type 'random'
        ${recv_promptpay_id}=    set variable   ${EMPTY}
        IF  '${recv_promptpay_type}' == 'เบอร์โทร'
                ${recv_phone} =   random_number   9
                ${recv_promptpay_id} =   set variable   +66${recv_phone}
        ELSE IF  '${recv_promptpay_type}' == 'หมายเลขบัตรประชาชน'
                ${recv_promptpay_id} =   generate_thai_citizen_id
        ELSE IF  '${recv_promptpay_type}' == 'เลขนิติบุคคล (Biller Id)'
                ${recv_promptpay_id} =   random_number   15
        ELSE IF  '${recv_promptpay_type}' == 'e-wallet'
                ${recv_promptpay_id} =   random_number   15
        ELSE
                ${recv_promptpay_id} =   set variable   ${EMPTY}
        END
        ${horse_short_name}=    set variable    ${bank_words}[${i}]
        ${horse_bank_name}=    set variable  ${bank_name_dict}[${horse_short_name}]  
        ${recv_account_no}=    create account_no 'random'
        ${recv_bank_name}=    create bank name '${horse_bank_name}'
        &{horse_dict}=    Create Dictionary     horse_id=${recv_id}    horse_type=${recv_type}    horse_name=${recv_name}    horse_lastname=${EMPTY}    horse_account_no=${recv_account_no}    horse_account_name=${recv_bank_name}
        Set To Dictionary   ${horse_list_dict}   ${horse_short_name}=${horse_dict}
        set test variable    ${horse_list_dict}
        Append to File    ${CURDIR}/temp_trans.txt    ${test_case_name},${horse_short_name},${recv_account_no},${recv_id}\n

        FOR   ${n}   IN RANGE    ${tran_count}
                ${victim_ip_address}=    create ip address 'random'
                ${txn_date}=    create transaction date 'before_create_case'
                ${txn_time}=   create transaction time 'random'
                ${txn_id}=   create transacion id 'random'
                ${txn_amount}=   create transacion amount 'random'
                Write Excel Cell	${start_row}   2    ${victim_person_name}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   3    ${victim_person_lastname}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   4    ${victim_account_no}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   5    ${victim_bank_name}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   7    ${victim_ip_address}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   8    ${recv_id}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   9    ${recv_type}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   11    ${recv_name}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   13    ${recv_promptpay_type}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   14    ${recv_promptpay_id}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   15    ${recv_account_no}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   16    ${recv_bank_name}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   18    ${txn_date}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   19    ${txn_time}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   20    ${txn_id}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   21    ${txn_amount}    sheet_name=CreateBankCase
                ${start_row}=    evaluate   ${start_row}+${1}
        END
     END
     Save Excel Document      filename=${CURDIR}/${FILE_NAME}.xlsx
     Close Current Excel Document

Create transaction to banks '${HORSE_LIST}' in '${FILE_NAME}' ชาวต่างชาติ
    ${start_row}=    set variable   ${14}
    Open Excel Document      filename=${CURDIR}/${FILE_NAME}.xlsx   doc_id=docname1
    @{bank_words} =  Split String    ${HORSE_LIST}       ,
    ${horse_count}=    Get Length    ${bank_words}
     FOR    ${i}    IN RANGE    ${horse_count}
        ${tran_count}=    random_number_transaction   1
        ${recv_id}=    create person id 'ชาวต่างชาติ'
        ${recv_type}=    set variable    ชาวต่างชาติ
        ${recv_name}=    create person name 'random'
        ${recv_lastname}=    create person lastname 'random'
        ${recv_promptpay_type}=    create promptpay type 'random'
        ${recv_promptpay_id}=    set variable   ${EMPTY}
        IF  '${recv_promptpay_type}' == 'เบอร์โทร'
                ${recv_phone} =   random_number   9
                ${recv_promptpay_id} =   set variable   +66${recv_phone}
        ELSE IF  '${recv_promptpay_type}' == 'หมายเลขบัตรประชาชน'
                ${recv_promptpay_id} =   generate_thai_citizen_id
        ELSE IF  '${recv_promptpay_type}' == 'เลขนิติบุคคล (Biller Id)'
                ${recv_promptpay_id} =   random_number   15
        ELSE IF  '${recv_promptpay_type}' == 'e-wallet'
                ${recv_promptpay_id} =   random_number   15
        ELSE
                ${recv_promptpay_id} =   set variable   ${EMPTY}
        END
        ${horse_short_name}=    set variable    ${bank_words}[${i}]
        ${horse_bank_name}=    set variable  ${bank_name_dict}[${horse_short_name}]  
        ${recv_account_no}=    create account_no 'random'
        ${recv_bank_name}=    create bank name '${horse_bank_name}'
        &{horse_dict}=    Create Dictionary     horse_id=${recv_id}    horse_type=${recv_type}    horse_name=${recv_name}    horse_lastname=${recv_lastname}    horse_account_no=${recv_account_no}    horse_account_name=${recv_bank_name}
        Set To Dictionary   ${horse_list_dict}   ${horse_short_name}=${horse_dict}
        set test variable    ${horse_list_dict}
        Append to File    ${CURDIR}/temp_trans.txt    ${test_case_name},${horse_short_name},${recv_account_no},${recv_id}\n
        FOR   ${n}   IN RANGE    ${tran_count}
                ${victim_ip_address}=    create ip address 'random'
                ${txn_date}=    create transaction date 'before_create_case'
                ${txn_time}=   create transaction time 'random'
                ${txn_id}=   create transacion id 'random'
                ${txn_amount}=   create transacion amount 'random'
                Write Excel Cell	${start_row}   2    ${victim_person_name}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   3    ${victim_person_lastname}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   4    ${victim_account_no}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   5    ${victim_bank_name}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   7    ${victim_ip_address}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   8    ${recv_id}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   9    ${recv_type}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   11    ${recv_name}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   12    ${recv_lastname}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   13    ${recv_promptpay_type}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   14    ${recv_promptpay_id}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   15    ${recv_account_no}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   16    ${recv_bank_name}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   18    ${txn_date}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   19    ${txn_time}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   20    ${txn_id}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   21    ${txn_amount}    sheet_name=CreateBankCase
                ${start_row}=    evaluate   ${start_row}+${1}
        END
     END
     Save Excel Document      filename=${CURDIR}/${FILE_NAME}.xlsx
     Close Current Excel Document

Create transaction to banks บุคคลเก่าและบัญชีใหม่ ยังไม่เคยออกรายงาน บุคคลคนเดียวกันเปลี่ยนชื่อ '${HORSE_LIST}' in '${FILE_NAME}'
    ${start_row}=    set variable   ${14}
    Open Excel Document      filename=${CURDIR}/${FILE_NAME}.xlsx   doc_id=docname1
    @{bank_words} =  Split String    ${HORSE_LIST}       ,
    ${horse_count}=    Get Length    ${bank_words}
     FOR    ${i}    IN RANGE    ${horse_count}
        ${tran_count}=    random_number_transaction   1              
        ${horse_recv}=    set variable    ${bank_words}[${i}]
        ${horse}=    set variable  ${horse_list_dict}[${horse_recv}]  
        ${recv_id}=     set variable  ${horse}[horse_id]
        ${recv_type}=     set variable  ${horse}[horse_type]
        ${recv_name}=     create person name 'random'
        ${recv_lastname}=     set variable  ${horse}[horse_lastname]
        ${recv_promptpay_type}=    create promptpay type 'random'
        ${recv_promptpay_id}=    set variable   ${EMPTY}
        IF  '${recv_promptpay_type}' == 'เบอร์โทร'
                ${recv_phone} =   random_number   9
                ${recv_promptpay_id} =   set variable   +66${recv_phone}
        ELSE IF  '${recv_promptpay_type}' == 'หมายเลขบัตรประชาชน'
                ${recv_promptpay_id} =   generate_thai_citizen_id
        ELSE IF  '${recv_promptpay_type}' == 'เลขนิติบุคคล (Biller Id)'
                ${recv_promptpay_id} =   random_number   15
        ELSE IF  '${recv_promptpay_type}' == 'e-wallet'
                ${recv_promptpay_id} =   random_number   15
        ELSE
                ${recv_promptpay_id} =   set variable   ${EMPTY}
        END
        ${horse_short_name}=    set variable    ${bank_words}[${i}]
        ${horse_bank_name}=    set variable  ${bank_name_dict}[${horse_short_name}]  
        ${recv_account_no}=     create account_no 'random'
        ${recv_bank_name}=    create bank name '${horse_bank_name}'
        &{horse_dict}=    Create Dictionary     horse_id=${recv_id}    horse_type=${recv_type}    horse_name=${recv_name}    horse_lastname=${recv_lastname}    horse_account_no=${recv_account_no}    horse_account_name=${recv_bank_name}
        Set To Dictionary   ${horse_list_dict}   ${horse_short_name}=${horse_dict}
        set test variable    ${horse_list_dict}
        Append to File    ${CURDIR}/temp_trans.txt    ${test_case_name},${horse_short_name},${recv_account_no},${recv_id}\n

        FOR   ${n}   IN RANGE    ${tran_count}
                ${victim_ip_address}=    create ip address 'random'
                ${txn_date}=    create transaction date 'before_create_case'
                ${txn_time}=   create transaction time 'random'
                ${txn_id}=   create transacion id 'random'
                ${txn_amount}=   create transacion amount 'random'
                Write Excel Cell	${start_row}   2    ${victim_person_name}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   3    ${victim_person_lastname}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   4    ${victim_account_no}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   5    ${victim_bank_name}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   7    ${victim_ip_address}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   8    ${recv_id}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   9    ${recv_type}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   11    ${recv_name}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   12    ${recv_lastname}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   13    ${recv_promptpay_type}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   14    ${recv_promptpay_id}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   15    ${recv_account_no}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   16    ${recv_bank_name}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   18    ${txn_date}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   19    ${txn_time}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   20    ${txn_id}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   21    ${txn_amount}    sheet_name=CreateBankCase
                ${start_row}=    evaluate   ${start_row}+${1}
        END
     END
     Save Excel Document      filename=${CURDIR}/${FILE_NAME}.xlsx
     Close Current Excel Document

Create transaction to banks บุคคลเก่าและบัญชีเก่าเคยออกรายงาน '${HORSE_LIST}' in '${FILE_NAME}'
    ${start_row}=    set variable   ${14}
    Open Excel Document      filename=${CURDIR}/${FILE_NAME}.xlsx   doc_id=docname1
    @{bank_words} =  Split String    ${HORSE_LIST}       ,
    ${horse_count}=    Get Length    ${bank_words}
     FOR    ${i}    IN RANGE    ${horse_count}
        ${tran_count}=    random_number_transaction   1              
        ${horse_recv}=    set variable    ${bank_words}[${i}]
        ${horse}=    set variable  ${horse_list_dict}[${horse_recv}]  
        ${recv_id}=     set variable  ${horse}[horse_id]
        ${recv_type}=     set variable  ${horse}[horse_type]
        ${recv_name}=     set variable  ${horse}[horse_name]
        ${recv_lastname}=     set variable  ${horse}[horse_lastname]
        ${recv_promptpay_type}=    create promptpay type 'random'
        ${recv_promptpay_id}=    set variable   ${EMPTY}
        IF  '${recv_promptpay_type}' == 'เบอร์โทร'
                ${recv_phone} =   random_number   9
                ${recv_promptpay_id} =   set variable   +66${recv_phone}
        ELSE IF  '${recv_promptpay_type}' == 'หมายเลขบัตรประชาชน'
                ${recv_promptpay_id} =   generate_thai_citizen_id
        ELSE IF  '${recv_promptpay_type}' == 'เลขนิติบุคคล (Biller Id)'
                ${recv_promptpay_id} =   random_number   15
        ELSE IF  '${recv_promptpay_type}' == 'e-wallet'
                ${recv_promptpay_id} =   random_number   15
        ELSE
                ${recv_promptpay_id} =   set variable   ${EMPTY}
        END
        ${horse_short_name}=    set variable    ${bank_words}[${i}]
        ${horse_bank_name}=    set variable  ${bank_name_dict}[${horse_short_name}]  

        ${recv_account_no}=     set variable  ${horse}[horse_account_no]
        ${recv_bank_name}=    create bank name '${horse_bank_name}'
        &{horse_dict}=    Create Dictionary     horse_id=${recv_id}    horse_type=${recv_type}    horse_name=${recv_name}    horse_lastname=${recv_lastname}    horse_account_no=${recv_account_no}    horse_account_name=${recv_bank_name}
        Set To Dictionary   ${horse_list_dict}   ${horse_short_name}=${horse_dict}
        set test variable    ${horse_list_dict}
        Append to File    ${CURDIR}/temp_trans.txt    ${FILE_NAME},${horse_short_name},${recv_account_no},${recv_id}\n
        FOR   ${n}   IN RANGE    ${tran_count}
                ${victim_ip_address}=    create ip address 'random'
                ${txn_date}=    create transaction date 'before_create_case'
                ${txn_time}=   create transaction time 'random'
                ${txn_id}=   create transacion id 'random'
                ${txn_amount}=   create transacion amount 'random'
                Write Excel Cell	${start_row}   2    ${victim_person_name}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   3    ${victim_person_lastname}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   4    ${victim_account_no}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   5    ${victim_bank_name}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   7    ${victim_ip_address}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   8    ${recv_id}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   9    ${recv_type}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   11    ${recv_name}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   12    ${recv_lastname}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   13    ${recv_promptpay_type}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   14    ${recv_promptpay_id}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   15    ${recv_account_no}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   16    ${recv_bank_name}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   18    ${txn_date}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   19    ${txn_time}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   20    ${txn_id}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   21    ${txn_amount}    sheet_name=CreateBankCase
                ${start_row}=    evaluate   ${start_row}+${1}
        END
     END
     Save Excel Document      filename=${CURDIR}/${FILE_NAME}.xlsx
     Close Current Excel Document

Create transaction to banks ทีเคยออกรายการแล้ว with passport number '${HORSE_LIST}' in '${FILE_NAME}'
    ${start_row}=    set variable   ${14}
    Open Excel Document      filename=${CURDIR}/${FILE_NAME}.xlsx   doc_id=docname1
    @{bank_words} =  Split String    ${HORSE_LIST}       ,
    ${horse_count}=    Get Length    ${bank_words}
     FOR    ${i}    IN RANGE    ${horse_count}
        ${tran_count}=    random_number_transaction   1              
        ${horse_recv}=    set variable    ${bank_words}[${i}]
        ${horse}=    set variable  ${horse_list_dict}[${horse_recv}]  
        ${recv_id}=     set variable  ${horse}[horse_id]
        ${recv_type}=     set variable  ${horse}[horse_type]
        ${recv_name}=     set variable  ${horse}[horse_name]
        ${recv_lastname}=     set variable  ${horse}[horse_lastname]
        ${recv_promptpay_type}=    create promptpay type 'random'
        ${recv_promptpay_id}=    set variable   ${EMPTY}
        IF  '${recv_promptpay_type}' == 'เบอร์โทร'
                ${recv_phone} =   random_number   9
                ${recv_promptpay_id} =   set variable   +66${recv_phone}
        ELSE IF  '${recv_promptpay_type}' == 'หมายเลขบัตรประชาชน'
                ${recv_promptpay_id} =   generate_thai_citizen_id
        ELSE IF  '${recv_promptpay_type}' == 'เลขนิติบุคคล (Biller Id)'
                ${recv_promptpay_id} =   random_number   15
        ELSE IF  '${recv_promptpay_type}' == 'e-wallet'
                ${recv_promptpay_id} =   random_number   15
        ELSE
                ${recv_promptpay_id} =   set variable   ${EMPTY}
        END
        ${horse_short_name}=    set variable    ${bank_words}[${i}]
        ${horse_bank_name}=    set variable  ${bank_name_dict}[${horse_short_name}]  

        ${recv_account_no}=    create account_no 'random'
        ${recv_bank_name}=    create bank name '${horse_bank_name}'
        &{horse_dict}=    Create Dictionary     horse_id=${recv_id}    horse_type=${recv_type}    horse_name=${recv_name}    horse_lastname=${recv_lastname}    horse_account_no=${recv_account_no}    horse_account_name=${recv_bank_name}
        Set To Dictionary   ${horse_list_dict}   ${horse_short_name}=${horse_dict}
        set test variable    ${horse_list_dict}
        FOR   ${n}   IN RANGE    ${tran_count}
                ${victim_ip_address}=    create ip address 'random'
                ${txn_date}=    create transaction date 'before_create_case'
                ${txn_time}=   create transaction time 'random'
                ${txn_id}=   create transacion id 'random'
                ${txn_amount}=   create transacion amount 'random'
                Write Excel Cell	${start_row}   2    ${victim_person_name}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   3    ${victim_person_lastname}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   4    ${victim_account_no}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   5    ${victim_bank_name}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   7    ${victim_ip_address}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   8    ${recv_id}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   9    ${recv_type}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   11    ${recv_name}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   12    ${recv_lastname}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   13    ${recv_promptpay_type}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   14    ${recv_promptpay_id}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   15    ${recv_account_no}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   16    ${recv_bank_name}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   18    ${txn_date}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   19    ${txn_time}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   20    ${txn_id}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   21    ${txn_amount}    sheet_name=CreateBankCase
                ${start_row}=    evaluate   ${start_row}+${1}
        END
     END
     Save Excel Document      filename=${CURDIR}/${FILE_NAME}.xlsx
     Close Current Excel Document

Create transaction to banks ทีเคยออกรายการแล้ว '${HORSE_LIST}' in '${FILE_NAME}' บุคคลคนเดียวกันเปลี่ยนชื่อ
    ${start_row}=    set variable   ${14}
    Open Excel Document      filename=${CURDIR}/${FILE_NAME}.xlsx   doc_id=docname1
    @{bank_words} =  Split String    ${HORSE_LIST}       ,
    ${horse_count}=    Get Length    ${bank_words}
     FOR    ${i}    IN RANGE    ${horse_count}
        ${tran_count}=    random_number_transaction   1              
        ${horse_recv}=    set variable    ${bank_words}[${i}]
        ${horse}=    set variable  ${horse_list_dict}[${horse_recv}]  
        ${recv_id}=     set variable  ${horse}[horse_id]
        ${recv_type}=     set variable  ${horse}[horse_type]
        ${recv_name}=     create person name 'random'
        ${recv_lastname}=     set variable  ${horse}[horse_lastname]
        ${recv_promptpay_type}=    create promptpay type 'random'
        ${recv_promptpay_id}=    set variable   ${EMPTY}
        IF  '${recv_promptpay_type}' == 'เบอร์โทร'
                ${recv_phone} =   random_number   9
                ${recv_promptpay_id} =   set variable   +66${recv_phone}
        ELSE IF  '${recv_promptpay_type}' == 'หมายเลขบัตรประชาชน'
                ${recv_promptpay_id} =   generate_thai_citizen_id
        ELSE IF  '${recv_promptpay_type}' == 'เลขนิติบุคคล (Biller Id)'
                ${recv_promptpay_id} =   random_number   15
        ELSE IF  '${recv_promptpay_type}' == 'e-wallet'
                ${recv_promptpay_id} =   random_number   15
        ELSE
                ${recv_promptpay_id} =   set variable   ${EMPTY}
        END
        ${horse_short_name}=    set variable    ${bank_words}[${i}]
        ${horse_bank_name}=    set variable  ${bank_name_dict}[${horse_short_name}]  

        ${recv_account_no}=    set variable  ${horse}[horse_account_no]
        ${recv_bank_name}=    create bank name '${horse_bank_name}'
        &{horse_dict}=    Create Dictionary     horse_id=${recv_id}    horse_type=${recv_type}    horse_name=${recv_name}    horse_lastname=${recv_lastname}    horse_account_no=${recv_account_no}    horse_account_name=${recv_bank_name}
        Set To Dictionary   ${horse_list_dict}   ${horse_short_name}=${horse_dict}
        set test variable    ${horse_list_dict}
        Append to File    ${CURDIR}/temp_trans.txt    ${test_case_name},${horse_short_name},${recv_account_no},${recv_id}\n
        FOR   ${n}   IN RANGE    ${tran_count}
                ${victim_ip_address}=    create ip address 'random'
                ${txn_date}=    create transaction date 'before_create_case'
                ${txn_time}=   create transaction time 'random'
                ${txn_id}=   create transacion id 'random'
                ${txn_amount}=   create transacion amount 'random'
                Write Excel Cell	${start_row}   2    ${victim_person_name}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   3    ${victim_person_lastname}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   4    ${victim_account_no}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   5    ${victim_bank_name}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   7    ${victim_ip_address}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   8    ${recv_id}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   9    ${recv_type}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   11    ${recv_name}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   12    ${recv_lastname}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   13    ${recv_promptpay_type}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   14    ${recv_promptpay_id}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   15    ${recv_account_no}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   16    ${recv_bank_name}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   18    ${txn_date}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   19    ${txn_time}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   20    ${txn_id}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   21    ${txn_amount}    sheet_name=CreateBankCase
                ${start_row}=    evaluate   ${start_row}+${1}
        END
     END
     Save Excel Document      filename=${CURDIR}/${FILE_NAME}.xlsx
     Close Current Excel Document

Create transaction to banks ทีเคยออกรายการแล้ว '${HORSE_LIST}' in '${FILE_NAME}' บุคคลเก่าและบัญชีเก่า
    ${start_row}=    set variable   ${14}
    Open Excel Document      filename=${CURDIR}/${FILE_NAME}.xlsx   doc_id=docname1
    @{bank_words} =  Split String    ${HORSE_LIST}       ,
    ${horse_count}=    Get Length    ${bank_words}
     FOR    ${i}    IN RANGE    ${horse_count}
        ${tran_count}=    random_number_transaction   1              
        ${horse_recv}=    set variable    ${bank_words}[${i}]
        ${horse}=    set variable  ${horse_list_dict}[${horse_recv}]  
        ${recv_id}=     set variable  ${horse}[horse_id]
        ${recv_type}=     set variable  ${horse}[horse_type]
        ${recv_name}=     set variable  ${horse}[horse_name]
        ${recv_lastname}=     set variable  ${horse}[horse_lastname]
        ${recv_promptpay_type}=    create promptpay type 'random'
        ${recv_promptpay_id}=    set variable   ${EMPTY}
        IF  '${recv_promptpay_type}' == 'เบอร์โทร'
                ${recv_phone} =   random_number   9
                ${recv_promptpay_id} =   set variable   +66${recv_phone}
        ELSE IF  '${recv_promptpay_type}' == 'หมายเลขบัตรประชาชน'
                ${recv_promptpay_id} =   generate_thai_citizen_id
        ELSE IF  '${recv_promptpay_type}' == 'เลขนิติบุคคล (Biller Id)'
                ${recv_promptpay_id} =   random_number   15
        ELSE IF  '${recv_promptpay_type}' == 'e-wallet'
                ${recv_promptpay_id} =   random_number   15
        ELSE
                ${recv_promptpay_id} =   set variable   ${EMPTY}
        END
        ${horse_short_name}=    set variable    ${bank_words}[${i}]
        ${horse_bank_name}=    set variable  ${bank_name_dict}[${horse_short_name}]  

        ${recv_account_no}=    set variable  ${horse}[horse_account_no]
        ${recv_bank_name}=    create bank name '${horse_bank_name}'
        &{horse_dict}=    Create Dictionary     horse_id=${recv_id}    horse_type=${recv_type}    horse_name=${recv_name}    horse_lastname=${recv_lastname}    horse_account_no=${recv_account_no}    horse_account_name=${recv_bank_name}
        Set To Dictionary   ${horse_list_dict}   ${horse_short_name}=${horse_dict}
        set test variable    ${horse_list_dict}
        Append to File    ${CURDIR}/temp_trans.txt    ${test_case_name},${horse_short_name},${recv_account_no},${recv_id}\n
        FOR   ${n}   IN RANGE    ${tran_count}
                ${victim_ip_address}=    create ip address 'random'
                ${txn_date}=    create transaction date 'before_create_case'
                ${txn_time}=   create transaction time 'random'
                ${txn_id}=   create transacion id 'random'
                ${txn_amount}=   create transacion amount 'random'
                Write Excel Cell	${start_row}   2    ${victim_person_name}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   3    ${victim_person_lastname}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   4    ${victim_account_no}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   5    ${victim_bank_name}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   7    ${victim_ip_address}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   8    ${recv_id}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   9    ${recv_type}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   11    ${recv_name}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   12    ${recv_lastname}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   13    ${recv_promptpay_type}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   14    ${recv_promptpay_id}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   15    ${recv_account_no}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   16    ${recv_bank_name}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   18    ${txn_date}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   19    ${txn_time}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   20    ${txn_id}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   21    ${txn_amount}    sheet_name=CreateBankCase
                ${start_row}=    evaluate   ${start_row}+${1}
        END
     END
     Save Excel Document      filename=${CURDIR}/${FILE_NAME}.xlsx
     Close Current Excel Document

Create transaction to banks ทีเคยออกรายการแล้ว '${HORSE_LIST}' in '${FILE_NAME}'
    ${start_row}=    set variable   ${14}
    Open Excel Document      filename=${CURDIR}/${FILE_NAME}.xlsx   doc_id=docname1
    @{bank_words} =  Split String    ${HORSE_LIST}       ,
    ${horse_count}=    Get Length    ${bank_words}
     FOR    ${i}    IN RANGE    ${horse_count}
        ${tran_count}=    random_number_transaction   1              
        ${horse_recv}=    set variable    ${bank_words}[${i}]
        ${horse}=    set variable  ${horse_list_dict}[${horse_recv}]  
        ${recv_id}=     set variable  ${horse}[horse_id]
        ${recv_type}=     set variable  ${horse}[horse_type]
        ${recv_name}=     set variable  ${horse}[horse_name]
        ${recv_lastname}=     set variable  ${horse}[horse_lastname]
        ${recv_promptpay_type}=    create promptpay type 'random'
        ${recv_promptpay_id}=    set variable   ${EMPTY}
        IF  '${recv_promptpay_type}' == 'เบอร์โทร'
                ${recv_phone} =   random_number   9
                ${recv_promptpay_id} =   set variable   +66${recv_phone}
        ELSE IF  '${recv_promptpay_type}' == 'หมายเลขบัตรประชาชน'
                ${recv_promptpay_id} =   generate_thai_citizen_id
        ELSE IF  '${recv_promptpay_type}' == 'เลขนิติบุคคล (Biller Id)'
                ${recv_promptpay_id} =   random_number   15
        ELSE IF  '${recv_promptpay_type}' == 'e-wallet'
                ${recv_promptpay_id} =   random_number   15
        ELSE
                ${recv_promptpay_id} =   set variable   ${EMPTY}
        END
        ${horse_short_name}=    set variable    ${bank_words}[${i}]
        ${horse_bank_name}=    set variable  ${bank_name_dict}[${horse_short_name}]  

        ${recv_account_no}=    create account_no 'random'
        ${recv_bank_name}=    create bank name '${horse_bank_name}'
        &{horse_dict}=    Create Dictionary     horse_id=${recv_id}    horse_type=${recv_type}    horse_name=${recv_name}    horse_lastname=${recv_lastname}    horse_account_no=${recv_account_no}    horse_account_name=${recv_bank_name}
        Set To Dictionary   ${horse_list_dict}   ${horse_short_name}=${horse_dict}
        set test variable    ${horse_list_dict}
        Append to File    ${CURDIR}/temp_trans.txt    ${test_case_name},${horse_short_name},${recv_account_no},${recv_id}\n
        FOR   ${n}   IN RANGE    ${tran_count}
                ${victim_ip_address}=    create ip address 'random'
                ${txn_date}=    create transaction date 'before_create_case'
                ${txn_time}=   create transaction time 'random'
                ${txn_id}=   create transacion id 'random'
                ${txn_amount}=   create transacion amount 'random'
                Write Excel Cell	${start_row}   2    ${victim_person_name}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   3    ${victim_person_lastname}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   4    ${victim_account_no}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   5    ${victim_bank_name}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   7    ${victim_ip_address}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   8    ${recv_id}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   9    ${recv_type}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   11    ${recv_name}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   12    ${recv_lastname}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   13    ${recv_promptpay_type}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   14    ${recv_promptpay_id}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   15    ${recv_account_no}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   16    ${recv_bank_name}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   18    ${txn_date}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   19    ${txn_time}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   20    ${txn_id}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   21    ${txn_amount}    sheet_name=CreateBankCase
                ${start_row}=    evaluate   ${start_row}+${1}
        END
     END
     Save Excel Document      filename=${CURDIR}/${FILE_NAME}.xlsx
     Close Current Excel Document

Create transaction to banks ทีเคยออกรายการแล้วด้วยบุคคลเก่าและบัญชีเก่า บุคคลคนเดียวกันเปลี่ยนชื่อ '${HORSE_LIST}' in '${FILE_NAME}'
    ${start_row}=    set variable   ${14}
    Open Excel Document      filename=${CURDIR}/${FILE_NAME}.xlsx   doc_id=docname1
    @{bank_words} =  Split String    ${HORSE_LIST}       ,
    ${horse_count}=    Get Length    ${bank_words}
     FOR    ${i}    IN RANGE    ${horse_count}
        ${tran_count}=    random_number_transaction   1              
        ${horse_recv}=    set variable    ${bank_words}[${i}]
        ${horse}=    set variable  ${horse_list_dict}[${horse_recv}]  
        ${recv_id}=     set variable  ${horse}[horse_id]
        ${recv_type}=     set variable  ${horse}[horse_type]
        ${recv_name}=     create person name 'random'
        ${recv_lastname}=     set variable  ${horse}[horse_lastname]
        ${recv_promptpay_type}=    create promptpay type 'random'
        ${recv_promptpay_id}=    set variable   ${EMPTY}
        IF  '${recv_promptpay_type}' == 'เบอร์โทร'
                ${recv_phone} =   random_number   9
                ${recv_promptpay_id} =   set variable   +66${recv_phone}
        ELSE IF  '${recv_promptpay_type}' == 'หมายเลขบัตรประชาชน'
                ${recv_promptpay_id} =   generate_thai_citizen_id
        ELSE IF  '${recv_promptpay_type}' == 'เลขนิติบุคคล (Biller Id)'
                ${recv_promptpay_id} =   random_number   15
        ELSE IF  '${recv_promptpay_type}' == 'e-wallet'
                ${recv_promptpay_id} =   random_number   15
        ELSE
                ${recv_promptpay_id} =   set variable   ${EMPTY}
        END
        ${horse_short_name}=    set variable    ${bank_words}[${i}]
        ${horse_bank_name}=    set variable  ${bank_name_dict}[${horse_short_name}]  

        ${recv_account_no}=    set variable  ${horse}[horse_account_no]
        ${recv_bank_name}=    create bank name '${horse_bank_name}'
        &{horse_dict}=    Create Dictionary     horse_id=${recv_id}    horse_type=${recv_type}    horse_name=${recv_name}    horse_lastname=${recv_lastname}    horse_account_no=${recv_account_no}    horse_account_name=${recv_bank_name}
        Set To Dictionary   ${horse_list_dict}   ${horse_short_name}=${horse_dict}
        set test variable    ${horse_list_dict}
        Append to File    ${CURDIR}/temp_trans.txt    ${test_case_name},${horse_short_name},${recv_account_no},${recv_id}\n
        FOR   ${n}   IN RANGE    ${tran_count}
                ${victim_ip_address}=    create ip address 'random'
                ${txn_date}=    create transaction date 'before_create_case'
                ${txn_time}=   create transaction time 'random'
                ${txn_id}=   create transacion id 'random'
                ${txn_amount}=   create transacion amount 'random'
                Write Excel Cell	${start_row}   2    ${victim_person_name}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   3    ${victim_person_lastname}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   4    ${victim_account_no}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   5    ${victim_bank_name}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   7    ${victim_ip_address}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   8    ${recv_id}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   9    ${recv_type}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   11    ${recv_name}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   12    ${recv_lastname}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   13    ${recv_promptpay_type}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   14    ${recv_promptpay_id}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   15    ${recv_account_no}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   16    ${recv_bank_name}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   18    ${txn_date}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   19    ${txn_time}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   20    ${txn_id}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   21    ${txn_amount}    sheet_name=CreateBankCase
                ${start_row}=    evaluate   ${start_row}+${1}
        END
     END
     Save Excel Document      filename=${CURDIR}/${FILE_NAME}.xlsx
     Close Current Excel Document

Create transaction to banks ทีเคยออกรายการแล้วด้วยบุคคลเก่าและบัญชีเก่า '${HORSE_LIST}' in '${FILE_NAME}'
    ${start_row}=    set variable   ${14}
    Open Excel Document      filename=${CURDIR}/${FILE_NAME}.xlsx   doc_id=docname1
    @{bank_words} =  Split String    ${HORSE_LIST}       ,
    ${horse_count}=    Get Length    ${bank_words}
     FOR    ${i}    IN RANGE    ${horse_count}
        ${tran_count}=    random_number_transaction   1              
        ${horse_recv}=    set variable    ${bank_words}[${i}]
        ${horse}=    set variable  ${horse_list_dict}[${horse_recv}]  
        ${recv_id}=     set variable  ${horse}[horse_id]
        ${recv_type}=     set variable  ${horse}[horse_type]
        ${recv_name}=     set variable  ${horse}[horse_name]
        ${recv_lastname}=     set variable  ${horse}[horse_lastname]
        ${recv_promptpay_type}=    create promptpay type 'random'
        ${recv_promptpay_id}=    set variable   ${EMPTY}
        IF  '${recv_promptpay_type}' == 'เบอร์โทร'
                ${recv_phone} =   random_number   9
                ${recv_promptpay_id} =   set variable   +66${recv_phone}
        ELSE IF  '${recv_promptpay_type}' == 'หมายเลขบัตรประชาชน'
                ${recv_promptpay_id} =   generate_thai_citizen_id
        ELSE IF  '${recv_promptpay_type}' == 'เลขนิติบุคคล (Biller Id)'
                ${recv_promptpay_id} =   random_number   15
        ELSE IF  '${recv_promptpay_type}' == 'e-wallet'
                ${recv_promptpay_id} =   random_number   15
        ELSE
                ${recv_promptpay_id} =   set variable   ${EMPTY}
        END
        ${horse_short_name}=    set variable    ${bank_words}[${i}]
        ${horse_bank_name}=    set variable  ${bank_name_dict}[${horse_short_name}]  

        ${recv_account_no}=    set variable  ${horse}[horse_account_no]
        ${recv_bank_name}=    create bank name '${horse_bank_name}'
        &{horse_dict}=    Create Dictionary     horse_id=${recv_id}    horse_type=${recv_type}    horse_name=${recv_name}    horse_lastname=${recv_lastname}    horse_account_no=${recv_account_no}    horse_account_name=${recv_bank_name}
        Set To Dictionary   ${horse_list_dict}   ${horse_short_name}=${horse_dict}
        set test variable    ${horse_list_dict}
        Append to File    ${CURDIR}/temp_trans.txt    ${test_case_name},${horse_short_name},${recv_account_no},${recv_id}\n
        FOR   ${n}   IN RANGE    ${tran_count}
                ${victim_ip_address}=    create ip address 'random'
                ${txn_date}=    create transaction date 'before_create_case'
                ${txn_time}=   create transaction time 'random'
                ${txn_id}=   create transacion id 'random'
                ${txn_amount}=   create transacion amount 'random'
                Write Excel Cell	${start_row}   2    ${victim_person_name}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   3    ${victim_person_lastname}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   4    ${victim_account_no}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   5    ${victim_bank_name}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   7    ${victim_ip_address}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   8    ${recv_id}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   9    ${recv_type}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   11    ${recv_name}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   12    ${recv_lastname}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   13    ${recv_promptpay_type}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   14    ${recv_promptpay_id}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   15    ${recv_account_no}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   16    ${recv_bank_name}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   18    ${txn_date}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   19    ${txn_time}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   20    ${txn_id}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   21    ${txn_amount}    sheet_name=CreateBankCase
                ${start_row}=    evaluate   ${start_row}+${1}
        END
     END
     Save Excel Document      filename=${CURDIR}/${FILE_NAME}.xlsx
     Close Current Excel Document

Create transaction to '${TOTAL_ACC}' bank account in '${FILE_NAME}'
     ${horse_1_list} =    Create List
     ${start_row}=    set variable   ${14}
     Open Excel Document      filename=${CURDIR}/${FILE_NAME}.xlsx   doc_id=docname1
     ${bank_code}=	Read Excel Cell    row_num=9    col_num=8
     ${bank_short_name}=    set variable  ${bank_dict}[${bank_code}]
     ${master_case_id}=    create master case id of bank name '${bank_short_name}'
     set test variable   ${master_case_id}
     Write Excel Cell	3   1    ${master_case_id}    sheet_name=CreateBankCase
     FOR    ${i}    IN RANGE    ${TOTAL_ACC}
        ${tran_count}=    random_number_transaction   1
        ${recv_id}=    create person id 'บุคคลธรรมดา'
        ${recv_type}=    set variable    บุคคลธรรมดา
        ${recv_name}=    create person name 'random'
        ${recv_lastname}=    create person lastname 'random'
        ${recv_promptpay_type}=    create promptpay type 'random'
        ${recv_promptpay_id}=    set variable   ${EMPTY}
        IF  '${recv_promptpay_type}' == 'เบอร์โทร'
                ${recv_phone} =   random_number   9
                ${recv_promptpay_id} =   set variable   +66${recv_phone}
        ELSE IF  '${recv_promptpay_type}' == 'หมายเลขบัตรประชาชน'
                ${recv_promptpay_id} =   generate_thai_citizen_id
        ELSE IF  '${recv_promptpay_type}' == 'เลขนิติบุคคล (Biller Id)'
                ${recv_promptpay_id} =   random_number   15
        ELSE IF  '${recv_promptpay_type}' == 'e-wallet'
                ${recv_promptpay_id} =   random_number   15
        ELSE
                ${recv_promptpay_id} =   set variable   ${EMPTY}
        END
        ${recv_account_no}=    create account_no 'random'
        ${recv_bank_name}=    create bank name 'random'
        &{horse_dict}=    Create Dictionary     horse_id=${recv_id}    horse_type=${recv_type}    horse_name=${recv_name}    horse_lastname=${recv_lastname}    horse_account_no=${recv_account_no}    horse_account_name=${recv_bank_name}
        Append To List   ${horse_1_list}   ${horse_dict}
        set test variable    ${horse_1_list}
        FOR   ${n}   IN RANGE    ${tran_count}
                ${victim_ip_address}=    create ip address 'random'
                ${txn_date}=    create transaction date 'before_create_case'
                ${txn_time}=   create transaction time 'random'
                ${txn_id}=   create transacion id 'random'
                ${txn_amount}=   create transacion amount 'random'
                Write Excel Cell	${start_row}   2    ${victim_person_name}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   3    ${victim_person_lastname}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   4    ${victim_account_no}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   5    ${victim_bank_name}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   7    ${victim_ip_address}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   8    ${recv_id}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   9    ${recv_type}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   11    ${recv_name}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   12    ${recv_lastname}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   13    ${recv_promptpay_type}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   14    ${recv_promptpay_id}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   15    ${recv_account_no}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   16    ${recv_bank_name}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   18    ${txn_date}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   19    ${txn_time}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   20    ${txn_id}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   21    ${txn_amount}    sheet_name=CreateBankCase
                ${start_row}=    evaluate   ${start_row}+${1}
        END
     END
     Save Excel Document      filename=${CURDIR}/${FILE_NAME}_${bank_short_name}.xlsx
     Close Current Excel Document
     set test variable    ${master_case_fiel_name}    ${FILE_NAME}_${bank_short_name}.xlsx

Create transaction subcase with relation to bank fix receving bank '${HORSE_LIST}' bank account in '${FILE_NAME}' with account info '${ACC_INFO}'
    @{bank_words} =  Split String    ${HORSE_LIST}       ,
    ${horse_count}=    Get Length    ${bank_words}
    ${start_row}=    set variable   ${12}        
    ${person_name}=    set variable  ${ACC_INFO}[horse_name]
    ${person_lastname}=    set variable  ${ACC_INFO}[horse_lastname]
    ${person_account_no}=    set variable  ${ACC_INFO}[horse_account_no]
    ${person_account_name}=    set variable  ${ACC_INFO}[horse_account_name]
    ${send_bank_name}=    set variable  ${bank_dict}[${person_account_name}]
    Open Excel Document      filename=${CURDIR}/${FILE_NAME}.xlsx   doc_id=docname1
    FOR    ${i}    IN RANGE    ${horse_count}
        ${horse_recv}=    set variable    ${bank_words}[${i}]
        log  ${horse_recv}
        ${horse}=    set variable  ${horse_list_dict}[${horse_recv}]  
        ${tran_count}=    random_number_transaction   1
        ${recv_id}=     set variable  ${horse}[horse_id]
        ${recv_type}=     set variable  ${horse}[horse_type]
        ${recv_name}=     set variable  ${horse}[horse_name]
        ${recv_lastname}=     set variable  ${horse}[horse_lastname]
        ${recv_promptpay_type}=    create promptpay type 'random'
        set test variable   ${recv_promptpay_type}   ไม่มี
        ${recv_promptpay_id}=    set variable   ${EMPTY}
        IF  '${recv_promptpay_type}' == 'เบอร์โทร'
                ${recv_phone} =   random_number   9
                ${recv_promptpay_id} =   set variable   +66${recv_phone}
        ELSE IF  '${recv_promptpay_type}' == 'หมายเลขบัตรประชาชน'
                ${recv_promptpay_id} =   generate_thai_citizen_id
        ELSE IF  '${recv_promptpay_type}' == 'เลขนิติบุคคล (Biller Id)'
                ${recv_promptpay_id} =   random_number   15
        ELSE IF  '${recv_promptpay_type}' == 'e-wallet'
                ${recv_promptpay_id} =   random_number   15
        ELSE
                ${recv_promptpay_id} =   set variable   ${EMPTY}
        END
        ${recv_account_no}=    set variable  ${horse}[horse_account_no]
        ${horse_relation_name}=    set variable    ${bank_words}[${i}]
        @{bank_recv} =  Split String    ${horse_relation_name}       _
        ${horse_short_name}=    set variable    ${bank_recv}[1]
        ${horse_bank_name}=    set variable  ${bank_name_dict}[${horse_short_name}]  
        ${recv_bank_name}=    create bank name '${horse_bank_name}'
        &{horse_dict}=    Create Dictionary     horse_id=${recv_id}    horse_type=${recv_type}    horse_name=${recv_name}    horse_lastname=${recv_lastname}    horse_account_no=${recv_account_no}    horse_account_name=${recv_bank_name}
        Set To Dictionary   ${horse_list_dict}   ${send_bank_name}_${horse_short_name}=${horse_dict}
        set test variable    ${horse_list_dict}
                     ${recv_name} =	Remove String	${recv_name}   \n
     ${recv_lastname} =	Remove String	${recv_lastname}   \n
     ${recv_id} =	Remove String	${recv_id}   \n
        Append to File    ${CURDIR}/temp_trans.txt    Horse2,${master_case_id},${test_case_name},${horse_short_name},${recv_name},${recv_lastname},${recv_account_no},${recv_id}\n
        set test variable   ${horse_short_name}
        set test variable  ${recv_name}
        set test variable  ${recv_lastname}
        set test variable  ${recv_account_no}
        set test variable  ${recv_id}
        FOR   ${n}   IN RANGE    ${tran_count}
                ${victim_ip_address}=    create ip address 'random'
                ${txn_date}=    create transaction date 'before_create_case'
                ${txn_time}=   create transaction time 'random'
                ${txn_id}=   create transacion id 'random'
                ${txn_amount}=   create transacion amount 'random'
                Write Excel Cell	${start_row}   2    ${person_name}    sheet_name=AddSubCase
                Write Excel Cell	${start_row}   3    ${person_lastname}    sheet_name=AddSubCase
                Write Excel Cell	${start_row}   4    ${person_account_no}    sheet_name=AddSubCase
                Write Excel Cell	${start_row}   5    ${person_account_name}    sheet_name=AddSubCase
                Write Excel Cell	${start_row}   7    ${victim_ip_address}    sheet_name=AddSubCase
                Write Excel Cell	${start_row}   8    ${recv_id}    sheet_name=AddSubCase
                Write Excel Cell	${start_row}   9    ${recv_type}    sheet_name=AddSubCase
                Write Excel Cell	${start_row}   11    ${recv_name}    sheet_name=AddSubCase
                Write Excel Cell	${start_row}   12    ${recv_lastname}    sheet_name=AddSubCase
                Write Excel Cell	${start_row}   13    ${recv_promptpay_type}    sheet_name=AddSubCase
                Write Excel Cell	${start_row}   14    ${recv_promptpay_id}    sheet_name=AddSubCase
                Write Excel Cell	${start_row}   15    ${recv_account_no}    sheet_name=AddSubCase
                Write Excel Cell	${start_row}   16    ${recv_bank_name}    sheet_name=AddSubCase
                Write Excel Cell	${start_row}   18    ${txn_date}    sheet_name=AddSubCase
                Write Excel Cell	${start_row}   19    ${txn_time}    sheet_name=AddSubCase
                Write Excel Cell	${start_row}   20    ${txn_id}    sheet_name=AddSubCase
                Write Excel Cell	${start_row}   21    ${txn_amount}    sheet_name=AddSubCase
                ${start_row}=    evaluate   ${start_row}+${1}
        END
     END
     Save Excel Document      filename=${CURDIR}/${FILE_NAME}.xlsx
     Close Current Excel Document

Create transaction subcase with relation to bank fix receving bank '${HORSE_LIST}' bank account in '${FILE_NAME}' with account info '${ACC_INFO}' personal null 4
    @{bank_words} =  Split String    ${HORSE_LIST}       ,
    ${horse_count}=    Get Length    ${bank_words}
    ${start_row}=    set variable   ${12}        
    ${person_name}=    set variable  ${ACC_INFO}[horse_name]
    ${person_lastname}=    set variable  ${ACC_INFO}[horse_lastname]
    ${person_account_no}=    set variable  ${ACC_INFO}[horse_account_no]
    ${person_account_name}=    set variable  ${ACC_INFO}[horse_account_name]
    ${send_bank_name}=    set variable  ${bank_dict}[${person_account_name}]
    Open Excel Document      filename=${CURDIR}/${FILE_NAME}.xlsx   doc_id=docname1
    FOR    ${i}    IN RANGE    ${horse_count}
        ${horse_recv}=    set variable    ${bank_words}[${i}]
        log  ${horse_recv}
        ${horse}=    set variable  ${horse_list_dict}[${horse_recv}]  
        ${tran_count}=    random_number_transaction   1
        ${recv_id}=     set variable  ${horse}[horse_id]
        ${recv_type}=     set variable  ${horse}[horse_type]
        ${recv_name}=     set variable  ${horse}[horse_name]
        ${recv_lastname}=     set variable  ${horse}[horse_lastname]
        ${recv_promptpay_type}=    create promptpay type 'random'
        set test variable   ${recv_promptpay_type}   ไม่มี
        ${recv_promptpay_id}=    set variable   ${EMPTY}
        IF  '${recv_promptpay_type}' == 'เบอร์โทร'
                ${recv_phone} =   random_number   9
                ${recv_promptpay_id} =   set variable   +66${recv_phone}
        ELSE IF  '${recv_promptpay_type}' == 'หมายเลขบัตรประชาชน'
                ${recv_promptpay_id} =   generate_thai_citizen_id
        ELSE IF  '${recv_promptpay_type}' == 'เลขนิติบุคคล (Biller Id)'
                ${recv_promptpay_id} =   random_number   15
        ELSE IF  '${recv_promptpay_type}' == 'e-wallet'
                ${recv_promptpay_id} =   random_number   15
        ELSE
                ${recv_promptpay_id} =   set variable   ${EMPTY}
        END
        ${recv_account_no}=    set variable  ${horse}[horse_account_no]
        ${horse_relation_name}=    set variable    ${bank_words}[${i}]
        @{bank_recv} =  Split String    ${horse_relation_name}       _
        ${horse_short_name}=    set variable    ${bank_recv}[1]
        ${horse_bank_name}=    set variable  ${bank_name_dict}[${horse_short_name}]  
        ${recv_bank_name}=    create bank name '${horse_bank_name}'
        &{horse_dict}=    Create Dictionary     horse_id=${recv_id}    horse_type=${recv_type}    horse_name=${recv_name}    horse_lastname=${recv_lastname}    horse_account_no=${recv_account_no}    horse_account_name=${recv_bank_name}
        Set To Dictionary   ${horse_list_dict}   ${send_bank_name}_${horse_short_name}=${horse_dict}
        set test variable    ${horse_list_dict}
                     ${recv_name} =	Remove String	${recv_name}   \n
     ${recv_lastname} =	Remove String	${recv_lastname}   \n
     ${recv_id} =	Remove String	${recv_id}   \n
        Append to File    ${CURDIR}/temp_trans.txt    Horse2,${master_case_id},${test_case_name},${horse_short_name},${recv_name},${recv_lastname},${recv_account_no},${recv_id}\n
        set test variable   ${horse_short_name}
        set test variable  ${recv_name}
        set test variable  ${recv_lastname}
        set test variable  ${recv_account_no}
        set test variable  ${recv_id}
        FOR   ${n}   IN RANGE    ${tran_count}
                ${victim_ip_address}=    create ip address 'random'
                ${txn_date}=    create transaction date 'before_create_case'
                ${txn_time}=   create transaction time 'random'
                ${txn_id}=   create transacion id 'random'
                ${txn_amount}=   create transacion amount 'random'
                Write Excel Cell	${start_row}   2    ${person_name}    sheet_name=AddSubCase
                Write Excel Cell	${start_row}   3    ${person_lastname}    sheet_name=AddSubCase
                Write Excel Cell	${start_row}   4    ${person_account_no}    sheet_name=AddSubCase
                Write Excel Cell	${start_row}   5    ${person_account_name}    sheet_name=AddSubCase
                Write Excel Cell	${start_row}   7    ${victim_ip_address}    sheet_name=AddSubCase
                # Write Excel Cell	${start_row}   8    ${recv_id}    sheet_name=AddSubCase
                # Write Excel Cell	${start_row}   9    ${recv_type}    sheet_name=AddSubCase
                Write Excel Cell	${start_row}   11    ${recv_name}    sheet_name=AddSubCase
                Write Excel Cell	${start_row}   12    ${recv_lastname}    sheet_name=AddSubCase
                Write Excel Cell	${start_row}   13    ${recv_promptpay_type}    sheet_name=AddSubCase
                Write Excel Cell	${start_row}   14    ${recv_promptpay_id}    sheet_name=AddSubCase
                Write Excel Cell	${start_row}   15    ${recv_account_no}    sheet_name=AddSubCase
                Write Excel Cell	${start_row}   16    ${recv_bank_name}    sheet_name=AddSubCase
                Write Excel Cell	${start_row}   18    ${txn_date}    sheet_name=AddSubCase
                Write Excel Cell	${start_row}   19    ${txn_time}    sheet_name=AddSubCase
                Write Excel Cell	${start_row}   20    ${txn_id}    sheet_name=AddSubCase
                Write Excel Cell	${start_row}   21    ${txn_amount}    sheet_name=AddSubCase
                ${start_row}=    evaluate   ${start_row}+${1}
        END
     END
     Save Excel Document      filename=${CURDIR}/${FILE_NAME}.xlsx
     Close Current Excel Document


Create transaction subcase to bank ชาวต่างชาติ '${HORSE_LIST}' bank account in '${FILE_NAME}' with account info '${ACC_INFO}'
    @{bank_words} =  Split String    ${HORSE_LIST}       ,
    ${horse_count}=    Get Length    ${bank_words}
    ${start_row}=    set variable   ${12}        
    ${person_name}=    set variable  ${ACC_INFO}[horse_name]
    ${person_lastname}=    set variable  ${ACC_INFO}[horse_lastname]
    ${person_account_no}=    set variable  ${ACC_INFO}[horse_account_no]
    ${person_account_name}=    set variable  ${ACC_INFO}[horse_account_name]
    ${send_bank_name}=    set variable  ${bank_dict}[${person_account_name}]
    Open Excel Document      filename=${CURDIR}/${FILE_NAME}.xlsx   doc_id=docname1
    FOR    ${i}    IN RANGE    ${horse_count}
        ${tran_count}=    random_number_transaction   1
        ${recv_id}=    create person id 'ชาวต่างชาติ'
        ${recv_type}=    set variable    ชาวต่างชาติ
        ${recv_name}=    create person name 'random'
        ${recv_lastname}=    create person lastname 'random'
        ${recv_promptpay_type}=    create promptpay type 'random'
        ${recv_promptpay_id}=    set variable   ${EMPTY}
        IF  '${recv_promptpay_type}' == 'เบอร์โทร'
                ${recv_phone} =   random_number   9
                ${recv_promptpay_id} =   set variable   +66${recv_phone}
        ELSE IF  '${recv_promptpay_type}' == 'หมายเลขบัตรประชาชน'
                ${recv_promptpay_id} =   generate_thai_citizen_id
        ELSE IF  '${recv_promptpay_type}' == 'เลขนิติบุคคล (Biller Id)'
                ${recv_promptpay_id} =   random_number   15
        ELSE IF  '${recv_promptpay_type}' == 'e-wallet'
                ${recv_promptpay_id} =   random_number   15
        ELSE
                ${recv_promptpay_id} =   set variable   ${EMPTY}
        END
        ${recv_account_no}=    create account_no 'random'
        ${horse_short_name}=    set variable    ${bank_words}[${i}]
        ${horse_bank_name}=    set variable  ${bank_name_dict}[${horse_short_name}]  
        ${recv_bank_name}=    create bank name '${horse_bank_name}'
        &{horse_dict}=    Create Dictionary     horse_id=${recv_id}    horse_type=${recv_type}    horse_name=${recv_name}    horse_lastname=${recv_lastname}    horse_account_no=${recv_account_no}    horse_account_name=${recv_bank_name}
        Set To Dictionary   ${horse_list_dict}   ${send_bank_name}_${horse_short_name}=${horse_dict}
        set test variable    ${horse_list_dict}

        FOR   ${n}   IN RANGE    ${tran_count}
                ${victim_ip_address}=    create ip address 'random'
                ${txn_date}=    create transaction date 'before_create_case'
                ${txn_time}=   create transaction time 'random'
                ${txn_id}=   create transacion id 'random'
                ${txn_amount}=   create transacion amount 'random'
                Write Excel Cell	${start_row}   2    ${person_name}    sheet_name=AddSubCase
                Write Excel Cell	${start_row}   3    ${person_lastname}    sheet_name=AddSubCase
                Write Excel Cell	${start_row}   4    ${person_account_no}    sheet_name=AddSubCase
                Write Excel Cell	${start_row}   5    ${person_account_name}    sheet_name=AddSubCase
                Write Excel Cell	${start_row}   7    ${victim_ip_address}    sheet_name=AddSubCase
                Write Excel Cell	${start_row}   8    ${recv_id}    sheet_name=AddSubCase
                Write Excel Cell	${start_row}   9    ${recv_type}    sheet_name=AddSubCase
                Write Excel Cell	${start_row}   11    ${recv_name}    sheet_name=AddSubCase
                Write Excel Cell	${start_row}   12    ${recv_lastname}    sheet_name=AddSubCase
                Write Excel Cell	${start_row}   13    ${recv_promptpay_type}    sheet_name=AddSubCase
                Write Excel Cell	${start_row}   14    ${recv_promptpay_id}    sheet_name=AddSubCase
                Write Excel Cell	${start_row}   15    ${recv_account_no}    sheet_name=AddSubCase
                Write Excel Cell	${start_row}   16    ${recv_bank_name}    sheet_name=AddSubCase
                Write Excel Cell	${start_row}   18    ${txn_date}    sheet_name=AddSubCase
                Write Excel Cell	${start_row}   19    ${txn_time}    sheet_name=AddSubCase
                Write Excel Cell	${start_row}   20    ${txn_id}    sheet_name=AddSubCase
                Write Excel Cell	${start_row}   21    ${txn_amount}    sheet_name=AddSubCase
                ${start_row}=    evaluate   ${start_row}+${1}
        END
     END
     Save Excel Document      filename=${CURDIR}/${FILE_NAME}.xlsx
     Close Current Excel Document

Create transaction subcase to bank บุคคลเก่าและบัญชีใหม่ ไม่มีข้อมูลเลขบัตรประชาชน '${HORSE_LIST}' bank account in '${FILE_NAME}' with account info '${ACC_INFO}'
    @{bank_words} =  Split String    ${HORSE_LIST}       ,
    ${horse_count}=    Get Length    ${bank_words}
    ${start_row}=    set variable   ${12}        
    ${person_name}=    set variable  ${ACC_INFO}[horse_name]
    ${person_lastname}=    set variable  ${ACC_INFO}[horse_lastname]
    ${person_account_no}=    set variable  ${ACC_INFO}[horse_account_no]
    ${person_account_name}=    set variable  ${ACC_INFO}[horse_account_name]
    ${send_bank_name}=    set variable  ${bank_dict}[${person_account_name}]
    Open Excel Document      filename=${CURDIR}/${FILE_NAME}.xlsx   doc_id=docname1
    FOR    ${i}    IN RANGE    ${horse_count}
        ${tran_count}=    random_number_transaction   1
        ${horse_recv}=    set variable    ${bank_words}[${i}]
        ${horse}=    set variable  ${horse_list_dict}[${horse_recv}]  
        ${recv_id}=     set variable  ${EMPTY}
        ${recv_type}=     set variable  ${EMPTY}
        ${recv_name}=     set variable  ${horse}[horse_name]
        ${recv_lastname}=     set variable  ${horse}[horse_lastname]
        ${recv_promptpay_type}=    create promptpay type 'random'
        ${recv_promptpay_id}=    set variable   ${EMPTY}
        IF  '${recv_promptpay_type}' == 'เบอร์โทร'
                ${recv_phone} =   random_number   9
                ${recv_promptpay_id} =   set variable   +66${recv_phone}
        ELSE IF  '${recv_promptpay_type}' == 'หมายเลขบัตรประชาชน'
                ${recv_promptpay_id} =   generate_thai_citizen_id
        ELSE IF  '${recv_promptpay_type}' == 'เลขนิติบุคคล (Biller Id)'
                ${recv_promptpay_id} =   random_number   15
        ELSE IF  '${recv_promptpay_type}' == 'e-wallet'
                ${recv_promptpay_id} =   random_number   15
        ELSE
                ${recv_promptpay_id} =   set variable   ${EMPTY}
        END
        ${recv_account_no}=    create account_no 'random'
        ${horse_short_name}=    set variable    ${bank_words}[${i}]
        ${horse_bank_name}=    set variable  ${bank_name_dict}[${horse_short_name}]  
        ${recv_bank_name}=    create bank name '${horse_bank_name}'
        &{horse_dict}=    Create Dictionary     horse_id=${recv_id}    horse_type=${recv_type}    horse_name=${recv_name}    horse_lastname=${recv_lastname}    horse_account_no=${recv_account_no}    horse_account_name=${recv_bank_name}
        Set To Dictionary   ${horse_list_dict}   ${send_bank_name}_${horse_short_name}=${horse_dict}
        set test variable    ${horse_list_dict}
        Append to File    ${CURDIR}/temp_trans.txt    ${FILE_NAME},${horse_short_name},${recv_account_no},${recv_id}\n

        FOR   ${n}   IN RANGE    ${tran_count}
                ${victim_ip_address}=    create ip address 'random'
                ${txn_date}=    create transaction date 'before_create_case'
                ${txn_time}=   create transaction time 'random'
                ${txn_id}=   create transacion id 'random'
                ${txn_amount}=   create transacion amount 'random'
                Write Excel Cell	${start_row}   2    ${person_name}    sheet_name=AddSubCase
                Write Excel Cell	${start_row}   3    ${person_lastname}    sheet_name=AddSubCase
                Write Excel Cell	${start_row}   4    ${person_account_no}    sheet_name=AddSubCase
                Write Excel Cell	${start_row}   5    ${person_account_name}    sheet_name=AddSubCase
                Write Excel Cell	${start_row}   7    ${victim_ip_address}    sheet_name=AddSubCase
                Write Excel Cell	${start_row}   8    ${recv_id}    sheet_name=AddSubCase
                Write Excel Cell	${start_row}   9    ${recv_type}    sheet_name=AddSubCase
                Write Excel Cell	${start_row}   11    ${recv_name}    sheet_name=AddSubCase
                Write Excel Cell	${start_row}   12    ${recv_lastname}    sheet_name=AddSubCase
                Write Excel Cell	${start_row}   13    ${recv_promptpay_type}    sheet_name=AddSubCase
                Write Excel Cell	${start_row}   14    ${recv_promptpay_id}    sheet_name=AddSubCase
                Write Excel Cell	${start_row}   15    ${recv_account_no}    sheet_name=AddSubCase
                Write Excel Cell	${start_row}   16    ${recv_bank_name}    sheet_name=AddSubCase
                Write Excel Cell	${start_row}   18    ${txn_date}    sheet_name=AddSubCase
                Write Excel Cell	${start_row}   19    ${txn_time}    sheet_name=AddSubCase
                Write Excel Cell	${start_row}   20    ${txn_id}    sheet_name=AddSubCase
                Write Excel Cell	${start_row}   21    ${txn_amount}    sheet_name=AddSubCase
                ${start_row}=    evaluate   ${start_row}+${1}
        END
     END
     Save Excel Document      filename=${CURDIR}/${FILE_NAME}.xlsx
     Close Current Excel Document


Create transaction subcase to bank บุคคลเก่าและบัญชีใหม่ '${HORSE_LIST}' bank account in '${FILE_NAME}' with account info '${ACC_INFO}'
    @{bank_words} =  Split String    ${HORSE_LIST}       ,
    ${horse_count}=    Get Length    ${bank_words}
    ${start_row}=    set variable   ${12}        
    ${person_name}=    set variable  ${ACC_INFO}[horse_name]
    ${person_lastname}=    set variable  ${ACC_INFO}[horse_lastname]
    ${person_account_no}=    set variable  ${ACC_INFO}[horse_account_no]
    ${person_account_name}=    set variable  ${ACC_INFO}[horse_account_name]
    ${send_bank_name}=    set variable  ${bank_dict}[${person_account_name}]
    Open Excel Document      filename=${CURDIR}/${FILE_NAME}.xlsx   doc_id=docname1
    FOR    ${i}    IN RANGE    ${horse_count}
        ${tran_count}=    random_number_transaction   1
        ${horse_recv}=    set variable    ${bank_words}[${i}]
        ${horse}=    set variable  ${horse_list_dict}[${horse_recv}]  
        ${recv_id}=     set variable  ${horse}[horse_id]
        ${recv_type}=     set variable  ${horse}[horse_type]
        ${recv_name}=     set variable  ${horse}[horse_name]
        ${recv_lastname}=     set variable  ${horse}[horse_lastname]
        ${recv_promptpay_type}=    create promptpay type 'random'
        ${recv_promptpay_id}=    set variable   ${EMPTY}
        IF  '${recv_promptpay_type}' == 'เบอร์โทร'
                ${recv_phone} =   random_number   9
                ${recv_promptpay_id} =   set variable   +66${recv_phone}
        ELSE IF  '${recv_promptpay_type}' == 'หมายเลขบัตรประชาชน'
                ${recv_promptpay_id} =   generate_thai_citizen_id
        ELSE IF  '${recv_promptpay_type}' == 'เลขนิติบุคคล (Biller Id)'
                ${recv_promptpay_id} =   random_number   15
        ELSE IF  '${recv_promptpay_type}' == 'e-wallet'
                ${recv_promptpay_id} =   random_number   15
        ELSE
                ${recv_promptpay_id} =   set variable   ${EMPTY}
        END
        ${recv_account_no}=    create account_no 'random'
        ${horse_short_name}=    set variable    ${bank_words}[${i}]
        ${horse_bank_name}=    set variable  ${bank_name_dict}[${horse_short_name}]  
        ${recv_bank_name}=    create bank name '${horse_bank_name}'
        &{horse_dict}=    Create Dictionary     horse_id=${recv_id}    horse_type=${recv_type}    horse_name=${recv_name}    horse_lastname=${recv_lastname}    horse_account_no=${recv_account_no}    horse_account_name=${recv_bank_name}
        Set To Dictionary   ${horse_list_dict}   ${send_bank_name}_${horse_short_name}=${horse_dict}
        set test variable    ${horse_list_dict}
        Append to File    ${CURDIR}/temp_trans.txt    ${master_case_id},${FILE_NAME},${horse_short_name},${recv_account_no},${recv_id}\n

        FOR   ${n}   IN RANGE    ${tran_count}
                ${victim_ip_address}=    create ip address 'random'
                ${txn_date}=    create transaction date 'before_create_case'
                ${txn_time}=   create transaction time 'random'
                ${txn_id}=   create transacion id 'random'
                ${txn_amount}=   create transacion amount 'random'
                Write Excel Cell	${start_row}   2    ${person_name}    sheet_name=AddSubCase
                Write Excel Cell	${start_row}   3    ${person_lastname}    sheet_name=AddSubCase
                Write Excel Cell	${start_row}   4    ${person_account_no}    sheet_name=AddSubCase
                Write Excel Cell	${start_row}   5    ${person_account_name}    sheet_name=AddSubCase
                Write Excel Cell	${start_row}   7    ${victim_ip_address}    sheet_name=AddSubCase
                Write Excel Cell	${start_row}   8    ${recv_id}    sheet_name=AddSubCase
                Write Excel Cell	${start_row}   9    ${recv_type}    sheet_name=AddSubCase
                Write Excel Cell	${start_row}   11    ${recv_name}    sheet_name=AddSubCase
                Write Excel Cell	${start_row}   12    ${recv_lastname}    sheet_name=AddSubCase
                Write Excel Cell	${start_row}   13    ${recv_promptpay_type}    sheet_name=AddSubCase
                Write Excel Cell	${start_row}   14    ${recv_promptpay_id}    sheet_name=AddSubCase
                Write Excel Cell	${start_row}   15    ${recv_account_no}    sheet_name=AddSubCase
                Write Excel Cell	${start_row}   16    ${recv_bank_name}    sheet_name=AddSubCase
                Write Excel Cell	${start_row}   18    ${txn_date}    sheet_name=AddSubCase
                Write Excel Cell	${start_row}   19    ${txn_time}    sheet_name=AddSubCase
                Write Excel Cell	${start_row}   20    ${txn_id}    sheet_name=AddSubCase
                Write Excel Cell	${start_row}   21    ${txn_amount}    sheet_name=AddSubCase
                ${start_row}=    evaluate   ${start_row}+${1}
        END
     END
     Save Excel Document      filename=${CURDIR}/${FILE_NAME}.xlsx
     Close Current Excel Document

Create transaction subcase to bank บุคคลเก่าและบัญชีใหม่ '${HORSE_LIST}' นิติบุคคล bank account in '${FILE_NAME}' with account info '${ACC_INFO}'
    @{bank_words} =  Split String    ${HORSE_LIST}       ,
    ${horse_count}=    Get Length    ${bank_words}
    ${start_row}=    set variable   ${12}        
    ${person_name}=    set variable  ${ACC_INFO}[horse_name]
    ${person_lastname}=    set variable  ${ACC_INFO}[horse_lastname]
    ${person_account_no}=    set variable  ${ACC_INFO}[horse_account_no]
    ${person_account_name}=    set variable  ${ACC_INFO}[horse_account_name]
    ${send_bank_name}=    set variable  ${bank_dict}[${person_account_name}]
    Open Excel Document      filename=${CURDIR}/${FILE_NAME}.xlsx   doc_id=docname1
    FOR    ${i}    IN RANGE    ${horse_count}
        ${tran_count}=    random_number_transaction   1
        ${horse_recv}=    set variable    ${bank_words}[${i}]
        ${horse}=    set variable  ${horse_list_dict}[${horse_recv}]  
        ${recv_id}=     create person id 'นิติบุคคล'
        ${recv_type}=     set variable    นิติบุคคล
        ${recv_name}=     set variable  ${horse}[horse_name]
        ${recv_lastname}=    set variable    ${EMPTY}
        ${recv_promptpay_type}=    create promptpay type 'random'
        ${recv_promptpay_id}=    set variable   ${EMPTY}
        IF  '${recv_promptpay_type}' == 'เบอร์โทร'
                ${recv_phone} =   random_number   9
                ${recv_promptpay_id} =   set variable   +66${recv_phone}
        ELSE IF  '${recv_promptpay_type}' == 'หมายเลขบัตรประชาชน'
                ${recv_promptpay_id} =   generate_thai_citizen_id
        ELSE IF  '${recv_promptpay_type}' == 'เลขนิติบุคคล (Biller Id)'
                ${recv_promptpay_id} =   random_number   15
        ELSE IF  '${recv_promptpay_type}' == 'e-wallet'
                ${recv_promptpay_id} =   random_number   15
        ELSE
                ${recv_promptpay_id} =   set variable   ${EMPTY}
        END
        ${recv_account_no}=    create account_no 'random'
        ${horse_short_name}=    set variable    ${bank_words}[${i}]
        ${horse_bank_name}=    set variable  ${bank_name_dict}[${horse_short_name}]  
        ${recv_bank_name}=    create bank name '${horse_bank_name}'
        &{horse_dict}=    Create Dictionary     horse_id=${recv_id}    horse_type=${recv_type}    horse_name=${recv_name}    horse_lastname=${recv_lastname}    horse_account_no=${recv_account_no}    horse_account_name=${recv_bank_name}
        Set To Dictionary   ${horse_list_dict}   ${send_bank_name}_${horse_short_name}=${horse_dict}
        set test variable    ${horse_list_dict}
        Append to File    ${CURDIR}/temp_trans.txt    ${FILE_NAME},${horse_short_name},${recv_account_no},${recv_id}\n

        FOR   ${n}   IN RANGE    ${tran_count}
                ${victim_ip_address}=    create ip address 'random'
                ${txn_date}=    create transaction date 'before_create_case'
                ${txn_time}=   create transaction time 'random'
                ${txn_id}=   create transacion id 'random'
                ${txn_amount}=   create transacion amount 'random'
                Write Excel Cell	${start_row}   2    ${person_name}    sheet_name=AddSubCase
                Write Excel Cell	${start_row}   3    ${person_lastname}    sheet_name=AddSubCase
                Write Excel Cell	${start_row}   4    ${person_account_no}    sheet_name=AddSubCase
                Write Excel Cell	${start_row}   5    ${person_account_name}    sheet_name=AddSubCase
                Write Excel Cell	${start_row}   7    ${victim_ip_address}    sheet_name=AddSubCase
                Write Excel Cell	${start_row}   8    ${recv_id}    sheet_name=AddSubCase
                Write Excel Cell	${start_row}   9    ${recv_type}    sheet_name=AddSubCase
                Write Excel Cell	${start_row}   11    ${recv_name}    sheet_name=AddSubCase
                Write Excel Cell	${start_row}   12    ${recv_lastname}    sheet_name=AddSubCase
                Write Excel Cell	${start_row}   13    ${recv_promptpay_type}    sheet_name=AddSubCase
                Write Excel Cell	${start_row}   14    ${recv_promptpay_id}    sheet_name=AddSubCase
                Write Excel Cell	${start_row}   15    ${recv_account_no}    sheet_name=AddSubCase
                Write Excel Cell	${start_row}   16    ${recv_bank_name}    sheet_name=AddSubCase
                Write Excel Cell	${start_row}   18    ${txn_date}    sheet_name=AddSubCase
                Write Excel Cell	${start_row}   19    ${txn_time}    sheet_name=AddSubCase
                Write Excel Cell	${start_row}   20    ${txn_id}    sheet_name=AddSubCase
                Write Excel Cell	${start_row}   21    ${txn_amount}    sheet_name=AddSubCase
                ${start_row}=    evaluate   ${start_row}+${1}
        END
     END
     Save Excel Document      filename=${CURDIR}/${FILE_NAME}.xlsx
     Close Current Excel Document

Create transaction subcase to bank บุคคลเก่าและบัญชีเก่า บุคคลคนเดียวกันเปลี่ยนชื่อ '${HORSE_LIST}' bank account in '${FILE_NAME}' with account info '${ACC_INFO}'
    @{bank_words} =  Split String    ${HORSE_LIST}       ,
    ${horse_count}=    Get Length    ${bank_words}
    ${start_row}=    set variable   ${12}        
    ${person_name}=    set variable  ${ACC_INFO}[horse_name]
    ${person_lastname}=    set variable  ${ACC_INFO}[horse_lastname]
    ${person_account_no}=    set variable  ${ACC_INFO}[horse_account_no]
    ${person_account_name}=    set variable  ${ACC_INFO}[horse_account_name]
    ${send_bank_name}=    set variable  ${bank_dict}[${person_account_name}]
    Open Excel Document      filename=${CURDIR}/${FILE_NAME}.xlsx   doc_id=docname1
    FOR    ${i}    IN RANGE    ${horse_count}
        ${tran_count}=    random_number_transaction   1
        ${horse_recv}=    set variable    ${bank_words}[${i}]
        ${horse}=    set variable  ${horse_list_dict}[${horse_recv}]  
        ${recv_id}=     set variable  ${horse}[horse_id]
        ${recv_type}=     set variable  ${horse}[horse_type]
        ${recv_name}=     create person name 'random'
        ${recv_lastname}=     set variable  ${horse}[horse_lastname]
        ${recv_promptpay_type}=    create promptpay type 'random'
        ${recv_promptpay_id}=    set variable   ${EMPTY}
        IF  '${recv_promptpay_type}' == 'เบอร์โทร'
                ${recv_phone} =   random_number   9
                ${recv_promptpay_id} =   set variable   +66${recv_phone}
        ELSE IF  '${recv_promptpay_type}' == 'หมายเลขบัตรประชาชน'
                ${recv_promptpay_id} =   generate_thai_citizen_id
        ELSE IF  '${recv_promptpay_type}' == 'เลขนิติบุคคล (Biller Id)'
                ${recv_promptpay_id} =   random_number   15
        ELSE IF  '${recv_promptpay_type}' == 'e-wallet'
                ${recv_promptpay_id} =   random_number   15
        ELSE
                ${recv_promptpay_id} =   set variable   ${EMPTY}
        END
        ${recv_account_no}=    set variable  ${horse}[horse_account_no]
        ${horse_short_name}=    set variable    ${bank_words}[${i}]
        ${horse_bank_name}=    set variable  ${bank_name_dict}[${horse_short_name}]  
        ${recv_bank_name}=    create bank name '${horse_bank_name}'
        &{horse_dict}=    Create Dictionary     horse_id=${recv_id}    horse_type=${recv_type}    horse_name=${recv_name}    horse_lastname=${recv_lastname}    horse_account_no=${recv_account_no}    horse_account_name=${recv_bank_name}
        Set To Dictionary   ${horse_list_dict}   ${send_bank_name}_${horse_short_name}=${horse_dict}
        set test variable    ${horse_list_dict}

        FOR   ${n}   IN RANGE    ${tran_count}
                ${victim_ip_address}=    create ip address 'random'
                ${txn_date}=    create transaction date 'before_create_case'
                ${txn_time}=   create transaction time 'random'
                ${txn_id}=   create transacion id 'random'
                ${txn_amount}=   create transacion amount 'random'
                Write Excel Cell	${start_row}   2    ${person_name}    sheet_name=AddSubCase
                Write Excel Cell	${start_row}   3    ${person_lastname}    sheet_name=AddSubCase
                Write Excel Cell	${start_row}   4    ${person_account_no}    sheet_name=AddSubCase
                Write Excel Cell	${start_row}   5    ${person_account_name}    sheet_name=AddSubCase
                Write Excel Cell	${start_row}   7    ${victim_ip_address}    sheet_name=AddSubCase
                Write Excel Cell	${start_row}   8    ${recv_id}    sheet_name=AddSubCase
                Write Excel Cell	${start_row}   9    ${recv_type}    sheet_name=AddSubCase
                Write Excel Cell	${start_row}   11    ${recv_name}    sheet_name=AddSubCase
                Write Excel Cell	${start_row}   12    ${recv_lastname}    sheet_name=AddSubCase
                Write Excel Cell	${start_row}   13    ${recv_promptpay_type}    sheet_name=AddSubCase
                Write Excel Cell	${start_row}   14    ${recv_promptpay_id}    sheet_name=AddSubCase
                Write Excel Cell	${start_row}   15    ${recv_account_no}    sheet_name=AddSubCase
                Write Excel Cell	${start_row}   16    ${recv_bank_name}    sheet_name=AddSubCase
                Write Excel Cell	${start_row}   18    ${txn_date}    sheet_name=AddSubCase
                Write Excel Cell	${start_row}   19    ${txn_time}    sheet_name=AddSubCase
                Write Excel Cell	${start_row}   20    ${txn_id}    sheet_name=AddSubCase
                Write Excel Cell	${start_row}   21    ${txn_amount}    sheet_name=AddSubCase
                ${start_row}=    evaluate   ${start_row}+${1}
        END
     END
     Save Excel Document      filename=${CURDIR}/${FILE_NAME}.xlsx
     Close Current Excel Document

Create transaction subcase to bank บุคคลเก่าและบัญชีเก่า '${HORSE_LIST}' bank account in '${FILE_NAME}' with account info '${ACC_INFO}'
    @{bank_words} =  Split String    ${HORSE_LIST}       ,
    ${horse_count}=    Get Length    ${bank_words}
    ${start_row}=    set variable   ${12}        
    ${person_name}=    set variable  ${ACC_INFO}[horse_name]
    ${person_lastname}=    set variable  ${ACC_INFO}[horse_lastname]
    ${person_account_no}=    set variable  ${ACC_INFO}[horse_account_no]
    ${person_account_name}=    set variable  ${ACC_INFO}[horse_account_name]
    ${send_bank_name}=    set variable  ${bank_dict}[${person_account_name}]
    Open Excel Document      filename=${CURDIR}/${FILE_NAME}.xlsx   doc_id=docname1
    FOR    ${i}    IN RANGE    ${horse_count}
        ${tran_count}=    random_number_transaction   1
        ${horse_recv}=    set variable    ${bank_words}[${i}]
        ${horse}=    set variable  ${horse_list_dict}[${horse_recv}]  
        ${recv_id}=     set variable  ${horse}[horse_id]
        ${recv_type}=     set variable  ${horse}[horse_type]
        ${recv_name}=     set variable  ${horse}[horse_name]
        ${recv_lastname}=     set variable  ${horse}[horse_lastname]
        ${recv_promptpay_type}=    create promptpay type 'random'
        ${recv_promptpay_id}=    set variable   ${EMPTY}
        IF  '${recv_promptpay_type}' == 'เบอร์โทร'
                ${recv_phone} =   random_number   9
                ${recv_promptpay_id} =   set variable   +66${recv_phone}
        ELSE IF  '${recv_promptpay_type}' == 'หมายเลขบัตรประชาชน'
                ${recv_promptpay_id} =   generate_thai_citizen_id
        ELSE IF  '${recv_promptpay_type}' == 'เลขนิติบุคคล (Biller Id)'
                ${recv_promptpay_id} =   random_number   15
        ELSE IF  '${recv_promptpay_type}' == 'e-wallet'
                ${recv_promptpay_id} =   random_number   15
        ELSE
                ${recv_promptpay_id} =   set variable   ${EMPTY}
        END
        ${recv_account_no}=    set variable  ${horse}[horse_account_no]
        ${horse_short_name}=    set variable    ${bank_words}[${i}]
        ${horse_bank_name}=    set variable  ${bank_name_dict}[${horse_short_name}]  
        ${recv_bank_name}=    create bank name '${horse_bank_name}'
        &{horse_dict}=    Create Dictionary     horse_id=${recv_id}    horse_type=${recv_type}    horse_name=${recv_name}    horse_lastname=${recv_lastname}    horse_account_no=${recv_account_no}    horse_account_name=${recv_bank_name}
        Set To Dictionary   ${horse_list_dict}   ${send_bank_name}_${horse_short_name}=${horse_dict}
        set test variable    ${horse_list_dict}
        Append to File    ${CURDIR}/temp_trans.txt    ${FILE_NAME},${horse_short_name},${recv_account_no},${recv_id}\n
        
        FOR   ${n}   IN RANGE    ${tran_count}
                ${victim_ip_address}=    create ip address 'random'
                ${txn_date}=    create transaction date 'before_create_case'
                ${txn_time}=   create transaction time 'random'
                ${txn_id}=   create transacion id 'random'
                ${txn_amount}=   create transacion amount 'random'
                Write Excel Cell	${start_row}   2    ${person_name}    sheet_name=AddSubCase
                Write Excel Cell	${start_row}   3    ${person_lastname}    sheet_name=AddSubCase
                Write Excel Cell	${start_row}   4    ${person_account_no}    sheet_name=AddSubCase
                Write Excel Cell	${start_row}   5    ${person_account_name}    sheet_name=AddSubCase
                Write Excel Cell	${start_row}   7    ${victim_ip_address}    sheet_name=AddSubCase
                Write Excel Cell	${start_row}   8    ${recv_id}    sheet_name=AddSubCase
                Write Excel Cell	${start_row}   9    ${recv_type}    sheet_name=AddSubCase
                Write Excel Cell	${start_row}   11    ${recv_name}    sheet_name=AddSubCase
                Write Excel Cell	${start_row}   12    ${recv_lastname}    sheet_name=AddSubCase
                Write Excel Cell	${start_row}   13    ${recv_promptpay_type}    sheet_name=AddSubCase
                Write Excel Cell	${start_row}   14    ${recv_promptpay_id}    sheet_name=AddSubCase
                Write Excel Cell	${start_row}   15    ${recv_account_no}    sheet_name=AddSubCase
                Write Excel Cell	${start_row}   16    ${recv_bank_name}    sheet_name=AddSubCase
                Write Excel Cell	${start_row}   18    ${txn_date}    sheet_name=AddSubCase
                Write Excel Cell	${start_row}   19    ${txn_time}    sheet_name=AddSubCase
                Write Excel Cell	${start_row}   20    ${txn_id}    sheet_name=AddSubCase
                Write Excel Cell	${start_row}   21    ${txn_amount}    sheet_name=AddSubCase
                ${start_row}=    evaluate   ${start_row}+${1}
        END
     END
     Save Excel Document      filename=${CURDIR}/${FILE_NAME}.xlsx
     Close Current Excel Document

Create transaction subcase to bank บุคคลเก่าและบัญชีใหม่ บุคคลคนเดียวกันเปลี่ยนชื่อ '${HORSE_LIST}' bank account in '${FILE_NAME}' with account info '${ACC_INFO}'
    @{bank_words} =  Split String    ${HORSE_LIST}       ,
    ${horse_count}=    Get Length    ${bank_words}
    ${start_row}=    set variable   ${12}        
    ${person_name}=    set variable  ${ACC_INFO}[horse_name]
    ${person_lastname}=    set variable  ${ACC_INFO}[horse_lastname]
    ${person_account_no}=    set variable  ${ACC_INFO}[horse_account_no]
    ${person_account_name}=    set variable  ${ACC_INFO}[horse_account_name]
    ${send_bank_name}=    set variable  ${bank_dict}[${person_account_name}]
    Open Excel Document      filename=${CURDIR}/${FILE_NAME}.xlsx   doc_id=docname1
    FOR    ${i}    IN RANGE    ${horse_count}
        ${tran_count}=    random_number_transaction   1
        ${horse_recv}=    set variable    ${bank_words}[${i}]
        ${horse}=    set variable  ${horse_list_dict}[${horse_recv}]  
        ${recv_id}=     set variable  ${horse}[horse_id]
        ${recv_type}=     set variable  ${horse}[horse_type]
        ${recv_name}=     create person name 'random'
        ${recv_lastname}=     set variable  ${horse}[horse_lastname]

        ${recv_promptpay_type}=    create promptpay type 'random'
        ${recv_promptpay_id}=    set variable   ${EMPTY}
        IF  '${recv_promptpay_type}' == 'เบอร์โทร'
                ${recv_phone} =   random_number   9
                ${recv_promptpay_id} =   set variable   +66${recv_phone}
        ELSE IF  '${recv_promptpay_type}' == 'หมายเลขบัตรประชาชน'
                ${recv_promptpay_id} =   generate_thai_citizen_id
        ELSE IF  '${recv_promptpay_type}' == 'เลขนิติบุคคล (Biller Id)'
                ${recv_promptpay_id} =   random_number   15
        ELSE IF  '${recv_promptpay_type}' == 'e-wallet'
                ${recv_promptpay_id} =   random_number   15
        ELSE
                ${recv_promptpay_id} =   set variable   ${EMPTY}
        END
        ${recv_account_no}=    create account_no 'random'
        ${horse_short_name}=    set variable    ${bank_words}[${i}]
        ${horse_bank_name}=    set variable  ${bank_name_dict}[${horse_short_name}]  
        ${recv_bank_name}=    create bank name '${horse_bank_name}'
        &{horse_dict}=    Create Dictionary     horse_id=${recv_id}    horse_type=${recv_type}    horse_name=${recv_name}    horse_lastname=${recv_lastname}    horse_account_no=${recv_account_no}    horse_account_name=${recv_bank_name}
        Set To Dictionary   ${horse_list_dict}   ${send_bank_name}_${horse_short_name}=${horse_dict}
        set test variable    ${horse_list_dict}

        FOR   ${n}   IN RANGE    ${tran_count}
                ${victim_ip_address}=    create ip address 'random'
                ${txn_date}=    create transaction date 'before_create_case'
                ${txn_time}=   create transaction time 'random'
                ${txn_id}=   create transacion id 'random'
                ${txn_amount}=   create transacion amount 'random'
                Write Excel Cell	${start_row}   2    ${person_name}    sheet_name=AddSubCase
                Write Excel Cell	${start_row}   3    ${person_lastname}    sheet_name=AddSubCase
                Write Excel Cell	${start_row}   4    ${person_account_no}    sheet_name=AddSubCase
                Write Excel Cell	${start_row}   5    ${person_account_name}    sheet_name=AddSubCase
                Write Excel Cell	${start_row}   7    ${victim_ip_address}    sheet_name=AddSubCase
                Write Excel Cell	${start_row}   8    ${recv_id}    sheet_name=AddSubCase
                Write Excel Cell	${start_row}   9    ${recv_type}    sheet_name=AddSubCase
                Write Excel Cell	${start_row}   11    ${recv_name}    sheet_name=AddSubCase
                Write Excel Cell	${start_row}   12    ${recv_lastname}    sheet_name=AddSubCase
                Write Excel Cell	${start_row}   13    ${recv_promptpay_type}    sheet_name=AddSubCase
                Write Excel Cell	${start_row}   14    ${recv_promptpay_id}    sheet_name=AddSubCase
                Write Excel Cell	${start_row}   15    ${recv_account_no}    sheet_name=AddSubCase
                Write Excel Cell	${start_row}   16    ${recv_bank_name}    sheet_name=AddSubCase
                Write Excel Cell	${start_row}   18    ${txn_date}    sheet_name=AddSubCase
                Write Excel Cell	${start_row}   19    ${txn_time}    sheet_name=AddSubCase
                Write Excel Cell	${start_row}   20    ${txn_id}    sheet_name=AddSubCase
                Write Excel Cell	${start_row}   21    ${txn_amount}    sheet_name=AddSubCase
                ${start_row}=    evaluate   ${start_row}+${1}
        END
     END
     Save Excel Document      filename=${CURDIR}/${FILE_NAME}.xlsx
     Close Current Excel Document

Create transaction subcase to bank '${HORSE_LIST}' bank account in '${FILE_NAME}' with account info '${ACC_INFO}'
    @{bank_words} =  Split String    ${HORSE_LIST}       ,
    ${horse_count}=    Get Length    ${bank_words}
    ${start_row}=    set variable   ${12}        
    ${person_name}=    set variable  ${ACC_INFO}[horse_name]
    ${person_lastname}=    set variable  ${ACC_INFO}[horse_lastname]
    ${person_account_no}=    set variable  ${ACC_INFO}[horse_account_no]
    ${person_account_name}=    set variable  ${ACC_INFO}[horse_account_name]
    ${send_bank_name}=    set variable  ${bank_dict}[${person_account_name}]
    Open Excel Document      filename=${CURDIR}/${FILE_NAME}.xlsx   doc_id=docname1
    FOR    ${i}    IN RANGE    ${horse_count}
        ${tran_count}=    random_number_transaction   1
        ${recv_id}=    create person id 'บุคคลธรรมดา'
        ${recv_type}=    set variable    บุคคลธรรมดา
        ${recv_name}=    create person name 'random'
        # set test variable   ${recv_name}   ทดสอบ2
        ${recv_lastname}=    create person lastname 'random'
        # set test variable   ${recv_lastname}   ทดสอบนะจ๊ะ2
        ${recv_promptpay_type}=    create promptpay type 'random'
        set test variable   ${recv_promptpay_type}   ไม่มี
        ${recv_promptpay_id}=    set variable   ${EMPTY}
        IF  '${recv_promptpay_type}' == 'เบอร์โทร'
                ${recv_phone} =   random_number   9
                ${recv_promptpay_id} =   set variable   +66${recv_phone}
        ELSE IF  '${recv_promptpay_type}' == 'หมายเลขบัตรประชาชน'
                ${recv_promptpay_id} =   generate_thai_citizen_id
        ELSE IF  '${recv_promptpay_type}' == 'เลขนิติบุคคล (Biller Id)'
                ${recv_promptpay_id} =   random_number   15
        ELSE IF  '${recv_promptpay_type}' == 'e-wallet'
                ${recv_promptpay_id} =   random_number   15
        ELSE
                ${recv_promptpay_id} =   set variable   ${EMPTY}
        END
        ${recv_account_no}=    create account_no 'random'
        # set test variable   ${recv_name}   765434232123
        ${horse_short_name}=    set variable    ${bank_words}[${i}]
        ${horse_bank_name}=    set variable  ${bank_name_dict}[${horse_short_name}]  
        ${recv_bank_name}=    create bank name '${horse_bank_name}'
        &{horse_dict}=    Create Dictionary     horse_id=${recv_id}    horse_type=${recv_type}    horse_name=${recv_name}    horse_lastname=${recv_lastname}    horse_account_no=${recv_account_no}    horse_account_name=${recv_bank_name}
        Set To Dictionary   ${horse_list_dict}   ${send_bank_name}_${horse_short_name}=${horse_dict}
        set test variable    ${horse_list_dict}

        FOR   ${n}   IN RANGE    ${tran_count}
                ${victim_ip_address}=    create ip address 'random'
                ${txn_date}=    create transaction date 'before_create_case'
                ${txn_time}=   create transaction time 'random'
                ${txn_id}=   create transacion id 'random'
                ${txn_amount}=   create transacion amount 'random'
                Write Excel Cell	${start_row}   2    ${person_name}    sheet_name=AddSubCase
                Write Excel Cell	${start_row}   3    ${person_lastname}    sheet_name=AddSubCase
                Write Excel Cell	${start_row}   4    ${person_account_no}    sheet_name=AddSubCase
                Write Excel Cell	${start_row}   5    ${person_account_name}    sheet_name=AddSubCase
                Write Excel Cell	${start_row}   7    ${victim_ip_address}    sheet_name=AddSubCase
                Write Excel Cell	${start_row}   8    ${recv_id}    sheet_name=AddSubCase
                Write Excel Cell	${start_row}   9    ${recv_type}    sheet_name=AddSubCase
                Write Excel Cell	${start_row}   11    ${recv_name}    sheet_name=AddSubCase
                Write Excel Cell	${start_row}   12    ${recv_lastname}    sheet_name=AddSubCase
                Write Excel Cell	${start_row}   13    ${recv_promptpay_type}    sheet_name=AddSubCase
                Write Excel Cell	${start_row}   14    ${recv_promptpay_id}    sheet_name=AddSubCase
                Write Excel Cell	${start_row}   15    ${recv_account_no}    sheet_name=AddSubCase
                Write Excel Cell	${start_row}   16    ${recv_bank_name}    sheet_name=AddSubCase
                Write Excel Cell	${start_row}   18    ${txn_date}    sheet_name=AddSubCase
                Write Excel Cell	${start_row}   19    ${txn_time}    sheet_name=AddSubCase
                Write Excel Cell	${start_row}   20    ${txn_id}    sheet_name=AddSubCase
                Write Excel Cell	${start_row}   21    ${txn_amount}    sheet_name=AddSubCase
                ${start_row}=    evaluate   ${start_row}+${1}
        END
     END
     Save Excel Document      filename=${CURDIR}/${FILE_NAME}.xlsx
     Close Current Excel Document
         ${recv_name} =	Remove String	${recv_name}   \n
     ${recv_lastname} =	Remove String	${recv_lastname}   \n
     ${recv_id} =	Remove String	${recv_id}   \n
        Append to File    ${CURDIR}/temp_trans.txt    Horse2,${master_case_id},${test_case_name},${horse_short_name},${recv_name},${recv_lastname},${recv_account_no},${recv_id}\n


Create transaction subcase to bank '${HORSE_LIST}' bank account in '${FILE_NAME}' with account info '${ACC_INFO}' personal null 4
    @{bank_words} =  Split String    ${HORSE_LIST}       ,
    ${horse_count}=    Get Length    ${bank_words}
    ${start_row}=    set variable   ${12}        
    ${person_name}=    set variable  ${ACC_INFO}[horse_name]
    ${person_lastname}=    set variable  ${ACC_INFO}[horse_lastname]
    ${person_account_no}=    set variable  ${ACC_INFO}[horse_account_no]
    ${person_account_name}=    set variable  ${ACC_INFO}[horse_account_name]
    ${send_bank_name}=    set variable  ${bank_dict}[${person_account_name}]
    Open Excel Document      filename=${CURDIR}/${FILE_NAME}.xlsx   doc_id=docname1
    FOR    ${i}    IN RANGE    ${horse_count}
        ${tran_count}=    random_number_transaction   1
        ${recv_id}=    create person id 'บุคคลธรรมดา'
        ${recv_type}=    set variable    บุคคลธรรมดา
        ${recv_name}=    create person name 'random'
        ${recv_lastname}=    create person lastname 'random'
        ${recv_promptpay_type}=    create promptpay type 'random'
        set test variable   ${recv_promptpay_type}   ไม่มี
        ${recv_promptpay_id}=    set variable   ${EMPTY}
        IF  '${recv_promptpay_type}' == 'เบอร์โทร'
                ${recv_phone} =   random_number   9
                ${recv_promptpay_id} =   set variable   +66${recv_phone}
        ELSE IF  '${recv_promptpay_type}' == 'หมายเลขบัตรประชาชน'
                ${recv_promptpay_id} =   generate_thai_citizen_id
        ELSE IF  '${recv_promptpay_type}' == 'เลขนิติบุคคล (Biller Id)'
                ${recv_promptpay_id} =   random_number   15
        ELSE IF  '${recv_promptpay_type}' == 'e-wallet'
                ${recv_promptpay_id} =   random_number   15
        ELSE
                ${recv_promptpay_id} =   set variable   ${EMPTY}
        END
        ${recv_account_no}=    create account_no 'random'
        ${horse_short_name}=    set variable    ${bank_words}[${i}]
        ${horse_bank_name}=    set variable  ${bank_name_dict}[${horse_short_name}]  
        ${recv_bank_name}=    create bank name '${horse_bank_name}'
        &{horse_dict}=    Create Dictionary     horse_id=${recv_id}    horse_type=${recv_type}    horse_name=${recv_name}    horse_lastname=${recv_lastname}    horse_account_no=${recv_account_no}    horse_account_name=${recv_bank_name}
        Set To Dictionary   ${horse_list_dict}   ${send_bank_name}_${horse_short_name}=${horse_dict}
        set test variable    ${horse_list_dict}

        FOR   ${n}   IN RANGE    ${tran_count}
                ${victim_ip_address}=    create ip address 'random'
                ${txn_date}=    create transaction date 'before_create_case'
                ${txn_time}=   create transaction time 'random'
                ${txn_id}=   create transacion id 'random'
                ${txn_amount}=   create transacion amount 'random'
                Write Excel Cell	${start_row}   2    ${person_name}    sheet_name=AddSubCase
                Write Excel Cell	${start_row}   3    ${person_lastname}    sheet_name=AddSubCase
                Write Excel Cell	${start_row}   4    ${person_account_no}    sheet_name=AddSubCase
                Write Excel Cell	${start_row}   5    ${person_account_name}    sheet_name=AddSubCase
                Write Excel Cell	${start_row}   7    ${victim_ip_address}    sheet_name=AddSubCase
                # Write Excel Cell	${start_row}   8    ${recv_id}    sheet_name=AddSubCase
                # Write Excel Cell	${start_row}   9    ${recv_type}    sheet_name=AddSubCase
                Write Excel Cell	${start_row}   11    ${recv_name}    sheet_name=AddSubCase
                Write Excel Cell	${start_row}   12    ${recv_lastname}    sheet_name=AddSubCase
                Write Excel Cell	${start_row}   13    ${recv_promptpay_type}    sheet_name=AddSubCase
                Write Excel Cell	${start_row}   14    ${recv_promptpay_id}    sheet_name=AddSubCase
                Write Excel Cell	${start_row}   15    ${recv_account_no}    sheet_name=AddSubCase
                Write Excel Cell	${start_row}   16    ${recv_bank_name}    sheet_name=AddSubCase
                Write Excel Cell	${start_row}   18    ${txn_date}    sheet_name=AddSubCase
                Write Excel Cell	${start_row}   19    ${txn_time}    sheet_name=AddSubCase
                Write Excel Cell	${start_row}   20    ${txn_id}    sheet_name=AddSubCase
                Write Excel Cell	${start_row}   21    ${txn_amount}    sheet_name=AddSubCase
                ${start_row}=    evaluate   ${start_row}+${1}
        END
     END
     Save Excel Document      filename=${CURDIR}/${FILE_NAME}.xlsx
     Close Current Excel Document
         ${recv_name} =	Remove String	${recv_name}   \n
     ${recv_lastname} =	Remove String	${recv_lastname}   \n
     ${recv_id} =	Remove String	${recv_id}   \n
        Append to File    ${CURDIR}/temp_trans.txt    Horse2,${master_case_id},${test_case_name},${horse_short_name},${recv_name},${recv_lastname},${recv_account_no},${recv_id}\n

Create transaction subcase to bank '${HORSE_LIST}' bank account in '${FILE_NAME}' with account info '${ACC_INFO}' TC007 '${FOLDER}'
    @{bank_words} =  Split String    ${HORSE_LIST}       ,
    ${horse_count}=    Get Length    ${bank_words}
    ${start_row}=    set variable   ${12}        
    ${person_name}=    set variable  ${ACC_INFO}[horse_name]
    ${person_lastname}=    set variable  ${ACC_INFO}[horse_lastname]
    ${person_account_no}=    set variable  ${ACC_INFO}[horse_account_no]
    ${person_account_name}=    set variable  ${ACC_INFO}[horse_account_name]
    ${send_bank_name}=    set variable  ${bank_dict}[${person_account_name}]
    Open Excel Document      filename=${CURDIR}/${FILE_NAME}.xlsx   doc_id=docname1
    FOR    ${i}    IN RANGE    ${horse_count}
        ${tran_count}=    random_number_transaction   1
        ${recv_id}=    create person id 'บุคคลธรรมดา'
        ${recv_type}=    set variable    บุคคลธรรมดา
        ${recv_name}=    create person name 'random'
        ${recv_lastname}=    create person lastname 'random'
        ${recv_promptpay_type}=    create promptpay type 'random'
        ${recv_promptpay_id}=    set variable   ${EMPTY}
        IF  '${recv_promptpay_type}' == 'เบอร์โทร'
                ${recv_phone} =   random_number   9
                ${recv_promptpay_id} =   set variable   +66${recv_phone}
        ELSE IF  '${recv_promptpay_type}' == 'หมายเลขบัตรประชาชน'
                ${recv_promptpay_id} =   generate_thai_citizen_id
        ELSE IF  '${recv_promptpay_type}' == 'เลขนิติบุคคล (Biller Id)'
                ${recv_promptpay_id} =   random_number   15
        ELSE IF  '${recv_promptpay_type}' == 'e-wallet'
                ${recv_promptpay_id} =   random_number   15
        ELSE
                ${recv_promptpay_id} =   set variable   ${EMPTY}
        END
        ${recv_account_no}=    create account_no 'random'
        ${horse_short_name}=    set variable    ${bank_words}[${i}]
        ${horse_bank_name}=    set variable  ${bank_name_dict}[${horse_short_name}]  
        ${recv_bank_name}=    create bank name '${horse_bank_name}'
        &{horse_dict}=    Create Dictionary     horse_id=${recv_id}    horse_type=${recv_type}    horse_name=${recv_name}    horse_lastname=${recv_lastname}    horse_account_no=${recv_account_no}    horse_account_name=${recv_bank_name}
        Set To Dictionary   ${horse_list_dict}   ${send_bank_name}_${horse_short_name}=${horse_dict}
        set test variable    ${horse_list_dict}
        Append to File    ${CURDIR}/temp_trans.txt    ${master_case_id},${FOLDER},${HORSE_LIST},${recv_name},${recv_lastname},${recv_account_no},${recv_id}\n
        FOR   ${n}   IN RANGE    ${tran_count}
                ${victim_ip_address}=    create ip address 'random'
                ${txn_date}=    create transaction date 'before_create_case'
                ${txn_time}=   create transaction time 'random'
                ${txn_id}=   create transacion id 'random'
                ${txn_amount}=   create transacion amount 'random'
                Write Excel Cell	${start_row}   2    ${person_name}    sheet_name=AddSubCase
                Write Excel Cell	${start_row}   3    ${person_lastname}    sheet_name=AddSubCase
                Write Excel Cell	${start_row}   4    ${person_account_no}    sheet_name=AddSubCase
                Write Excel Cell	${start_row}   5    ${person_account_name}    sheet_name=AddSubCase
                Write Excel Cell	${start_row}   7    ${victim_ip_address}    sheet_name=AddSubCase
                Write Excel Cell	${start_row}   8    ${recv_id}    sheet_name=AddSubCase
                Write Excel Cell	${start_row}   9    ${recv_type}    sheet_name=AddSubCase
                Write Excel Cell	${start_row}   11    ${recv_name}    sheet_name=AddSubCase
                Write Excel Cell	${start_row}   12    ${recv_lastname}    sheet_name=AddSubCase
                Write Excel Cell	${start_row}   13    ${recv_promptpay_type}    sheet_name=AddSubCase
                Write Excel Cell	${start_row}   14    ${recv_promptpay_id}    sheet_name=AddSubCase
                Write Excel Cell	${start_row}   15    ${recv_account_no}    sheet_name=AddSubCase
                Write Excel Cell	${start_row}   16    ${recv_bank_name}    sheet_name=AddSubCase
                Write Excel Cell	${start_row}   18    ${txn_date}    sheet_name=AddSubCase
                Write Excel Cell	${start_row}   19    ${txn_time}    sheet_name=AddSubCase
                Write Excel Cell	${start_row}   20    ${txn_id}    sheet_name=AddSubCase
                Write Excel Cell	${start_row}   21    ${txn_amount}    sheet_name=AddSubCase
                ${start_row}=    evaluate   ${start_row}+${1}
        END
     END
     Save Excel Document      filename=${CURDIR}/${FILE_NAME}.xlsx
     Close Current Excel Document

Create transaction subcase with relation to bank '${HORSE_LIST}' bank account in '${FILE_NAME}' with account info '${ACC_INFO}'
    @{bank_words} =  Split String    ${HORSE_LIST}       ,
    ${horse_count}=    Get Length    ${bank_words}
    ${start_row}=    set variable   ${12}        
    ${person_name}=    set variable  ${ACC_INFO}[horse_name]
    ${person_lastname}=    set variable  ${ACC_INFO}[horse_lastname]
    ${person_account_no}=    set variable  ${ACC_INFO}[horse_account_no]
    ${person_account_name}=    set variable  ${ACC_INFO}[horse_account_name]
    ${send_bank_name}=    set variable  ${bank_dict}[${person_account_name}]
    Open Excel Document      filename=${CURDIR}/${FILE_NAME}.xlsx   doc_id=docname1
    FOR    ${i}    IN RANGE    ${horse_count}
        ${tran_count}=    random_number_transaction   1
        ${recv_id}=    create person id 'บุคคลธรรมดา'
        ${recv_type}=    set variable    บุคคลธรรมดา
        ${recv_name}=    create person name 'random'
        ${recv_lastname}=    create person lastname 'random'
        ${recv_promptpay_type}=    create promptpay type 'random'
        ${recv_promptpay_id}=    set variable   ${EMPTY}
        IF  '${recv_promptpay_type}' == 'เบอร์โทร'
                ${recv_phone} =   random_number   9
                ${recv_promptpay_id} =   set variable   +66${recv_phone}
        ELSE IF  '${recv_promptpay_type}' == 'หมายเลขบัตรประชาชน'
                ${recv_promptpay_id} =   generate_thai_citizen_id
        ELSE IF  '${recv_promptpay_type}' == 'เลขนิติบุคคล (Biller Id)'
                ${recv_promptpay_id} =   random_number   15
        ELSE IF  '${recv_promptpay_type}' == 'e-wallet'
                ${recv_promptpay_id} =   random_number   15
        ELSE
                ${recv_promptpay_id} =   set variable   ${EMPTY}
        END
        ${recv_account_no}=    create account_no 'random'
        ${horse_short_name}=    set variable    ${bank_words}[${i}]
        ${horse_bank_name}=    set variable  ${bank_name_dict}[${horse_short_name}]  
        ${recv_bank_name}=    create bank name '${horse_bank_name}'
        &{horse_dict}=    Create Dictionary     horse_id=${recv_id}    horse_type=${recv_type}    horse_name=${recv_name}    horse_lastname=${recv_lastname}    horse_account_no=${recv_account_no}    horse_account_name=${recv_bank_name}
        Set To Dictionary   ${horse_list_dict}   ${send_bank_name}_${horse_short_name}=${horse_dict}
        set test variable    ${horse_list_dict}

        FOR   ${n}   IN RANGE    ${tran_count}
                ${victim_ip_address}=    create ip address 'random'
                ${txn_date}=    create transaction date 'before_create_case'
                ${txn_time}=   create transaction time 'random'
                ${txn_id}=   create transacion id 'random'
                ${txn_amount}=   create transacion amount 'random'
                Write Excel Cell	${start_row}   2    ${person_name}    sheet_name=AddSubCase
                Write Excel Cell	${start_row}   3    ${person_lastname}    sheet_name=AddSubCase
                Write Excel Cell	${start_row}   4    ${person_account_no}    sheet_name=AddSubCase
                Write Excel Cell	${start_row}   5    ${person_account_name}    sheet_name=AddSubCase
                Write Excel Cell	${start_row}   7    ${victim_ip_address}    sheet_name=AddSubCase
                Write Excel Cell	${start_row}   8    ${recv_id}    sheet_name=AddSubCase
                Write Excel Cell	${start_row}   9    ${recv_type}    sheet_name=AddSubCase
                Write Excel Cell	${start_row}   11    ${recv_name}    sheet_name=AddSubCase
                Write Excel Cell	${start_row}   12    ${recv_lastname}    sheet_name=AddSubCase
                Write Excel Cell	${start_row}   13    ${recv_promptpay_type}    sheet_name=AddSubCase
                Write Excel Cell	${start_row}   14    ${recv_promptpay_id}    sheet_name=AddSubCase
                Write Excel Cell	${start_row}   15    ${recv_account_no}    sheet_name=AddSubCase
                Write Excel Cell	${start_row}   16    ${recv_bank_name}    sheet_name=AddSubCase
                Write Excel Cell	${start_row}   18    ${txn_date}    sheet_name=AddSubCase
                Write Excel Cell	${start_row}   19    ${txn_time}    sheet_name=AddSubCase
                Write Excel Cell	${start_row}   20    ${txn_id}    sheet_name=AddSubCase
                Write Excel Cell	${start_row}   21    ${txn_amount}    sheet_name=AddSubCase
                ${start_row}=    evaluate   ${start_row}+${1}
        END
     END
     Save Excel Document      filename=${CURDIR}/${FILE_NAME}.xlsx
     Close Current Excel Document

Create transaction subcase to '${TOTAL_ACC}' bank account in '${FILE_NAME}' with account info '${ACC_INFO}'
    ${horse_other_list} =    Create List
    ${start_row}=    set variable   ${12}        
    ${person_name}=    set variable  ${ACC_INFO}[horse_name]
    ${person_lastname}=    set variable  ${ACC_INFO}[horse_lastname]
    ${person_account_no}=    set variable  ${ACC_INFO}[horse_account_no]
    ${person_account_name}=    set variable  ${ACC_INFO}[horse_account_name]
    Open Excel Document      filename=${CURDIR}/${FILE_NAME}.xlsx   doc_id=docname1
    FOR    ${i}    IN RANGE    ${TOTAL_ACC}
        ${tran_count}=    random_number_transaction   1
        ${recv_id}=    create person id 'บุคคลธรรมดา'
        ${recv_type}=    set variable    บุคคลธรรมดา
        ${recv_name}=    create person name 'random'
        ${recv_lastname}=    create person lastname 'random'
        ${recv_promptpay_type}=    create promptpay type 'random'
        ${recv_promptpay_id}=    set variable   ${EMPTY}
        IF  '${recv_promptpay_type}' == 'เบอร์โทร'
                ${recv_phone} =   random_number   9
                ${recv_promptpay_id} =   set variable   +66${recv_phone}
        ELSE IF  '${recv_promptpay_type}' == 'หมายเลขบัตรประชาชน'
                ${recv_promptpay_id} =   generate_thai_citizen_id
        ELSE IF  '${recv_promptpay_type}' == 'เลขนิติบุคคล (Biller Id)'
                ${recv_promptpay_id} =   random_number   15
        ELSE IF  '${recv_promptpay_type}' == 'e-wallet'
                ${recv_promptpay_id} =   random_number   15
        ELSE
                ${recv_promptpay_id} =   set variable   ${EMPTY}
        END
        ${recv_account_no}=    create account_no 'random'
        ${recv_bank_name}=    create bank name 'random'
        &{subcase_horse_dict}=    Create Dictionary     horse_id=${recv_id}    horse_type=${recv_type}    horse_name=${recv_name}    horse_lastname=${recv_lastname}    horse_account_no=${recv_account_no}    horse_account_name=${recv_bank_name}   sending_account_name=${person_account_name}
        Append To List   ${horse_other_list}   ${subcase_horse_dict}
        set test variable    ${horse_other_list}
        FOR   ${n}   IN RANGE    ${tran_count}
                ${victim_ip_address}=    create ip address 'random'
                ${txn_date}=    create transaction date 'before_create_case'
                ${txn_time}=   create transaction time 'random'
                ${txn_id}=   create transacion id 'random'
                ${txn_amount}=   create transacion amount 'random'
                Write Excel Cell	${start_row}   2    ${person_name}    sheet_name=AddSubCase
                Write Excel Cell	${start_row}   3    ${person_lastname}    sheet_name=AddSubCase
                Write Excel Cell	${start_row}   4    ${person_account_no}    sheet_name=AddSubCase
                Write Excel Cell	${start_row}   5    ${person_account_name}    sheet_name=AddSubCase
                Write Excel Cell	${start_row}   7    ${victim_ip_address}    sheet_name=AddSubCase
                Write Excel Cell	${start_row}   8    ${recv_id}    sheet_name=AddSubCase
                Write Excel Cell	${start_row}   9    ${recv_type}    sheet_name=AddSubCase
                Write Excel Cell	${start_row}   11    ${recv_name}    sheet_name=AddSubCase
                Write Excel Cell	${start_row}   12    ${recv_lastname}    sheet_name=AddSubCase
                Write Excel Cell	${start_row}   13    ${recv_promptpay_type}    sheet_name=AddSubCase
                Write Excel Cell	${start_row}   14    ${recv_promptpay_id}    sheet_name=AddSubCase
                Write Excel Cell	${start_row}   15    ${recv_account_no}    sheet_name=AddSubCase
                Write Excel Cell	${start_row}   16    ${recv_bank_name}    sheet_name=AddSubCase
                Write Excel Cell	${start_row}   18    ${txn_date}    sheet_name=AddSubCase
                Write Excel Cell	${start_row}   19    ${txn_time}    sheet_name=AddSubCase
                Write Excel Cell	${start_row}   20    ${txn_id}    sheet_name=AddSubCase
                Write Excel Cell	${start_row}   21    ${txn_amount}    sheet_name=AddSubCase
                ${start_row}=    evaluate   ${start_row}+${1}
        END
     END
     Save Excel Document      filename=${CURDIR}/${FILE_NAME}.xlsx
     Close Current Excel Document

Create transaction subcase horse 2 to '${TOTAL_ACC}' bank account in '${FILE_NAME}' with account info '${ACC_INFO}'
    ${horse_2_list} =    Create List
    ${start_row}=    set variable   ${12}        
    ${person_name}=    set variable  ${ACC_INFO}[horse_name]
    ${person_lastname}=    set variable  ${ACC_INFO}[horse_lastname]
    ${person_account_no}=    set variable  ${ACC_INFO}[horse_account_no]
    ${person_account_name}=    set variable  ${ACC_INFO}[horse_account_name]
    Open Excel Document      filename=${CURDIR}/${FILE_NAME}.xlsx   doc_id=docname1
    FOR    ${i}    IN RANGE    ${TOTAL_ACC}
        ${tran_count}=    random_number_transaction   1
        ${recv_id}=    create person id 'บุคคลธรรมดา'
        ${recv_type}=    set variable    บุคคลธรรมดา
        ${recv_name}=    create person name 'random'
        ${recv_lastname}=    create person lastname 'random'
        ${recv_promptpay_type}=    create promptpay type 'random'
        ${recv_promptpay_id}=    set variable   ${EMPTY}
        IF  '${recv_promptpay_type}' == 'เบอร์โทร'
                ${recv_phone} =   random_number   9
                ${recv_promptpay_id} =   set variable   +66${recv_phone}
        ELSE IF  '${recv_promptpay_type}' == 'หมายเลขบัตรประชาชน'
                ${recv_promptpay_id} =   generate_thai_citizen_id
        ELSE IF  '${recv_promptpay_type}' == 'เลขนิติบุคคล (Biller Id)'
                ${recv_promptpay_id} =   random_number   15
        ELSE IF  '${recv_promptpay_type}' == 'e-wallet'
                ${recv_promptpay_id} =   random_number   15
        ELSE
                ${recv_promptpay_id} =   set variable   ${EMPTY}
        END
        ${recv_account_no}=    create account_no 'random'
        ${recv_bank_name}=    create bank name 'random'
        &{subcase_horse_dict}=    Create Dictionary     horse_id=${recv_id}    horse_type=${recv_type}    horse_name=${recv_name}    horse_lastname=${recv_lastname}    horse_account_no=${recv_account_no}    horse_account_name=${recv_bank_name}   sending_account_name=${person_account_name}
        Append To List   ${horse_2_list}   ${subcase_horse_dict}
        set test variable    ${horse_2_list}
        FOR   ${n}   IN RANGE    ${tran_count}
                ${victim_ip_address}=    create ip address 'random'
                ${txn_date}=    create transaction date 'before_create_case'
                ${txn_time}=   create transaction time 'random'
                ${txn_id}=   create transacion id 'random'
                ${txn_amount}=   create transacion amount 'random'
                Write Excel Cell	${start_row}   2    ${person_name}    sheet_name=AddSubCase
                Write Excel Cell	${start_row}   3    ${person_lastname}    sheet_name=AddSubCase
                Write Excel Cell	${start_row}   4    ${person_account_no}    sheet_name=AddSubCase
                Write Excel Cell	${start_row}   5    ${person_account_name}    sheet_name=AddSubCase
                Write Excel Cell	${start_row}   7    ${victim_ip_address}    sheet_name=AddSubCase
                Write Excel Cell	${start_row}   8    ${recv_id}    sheet_name=AddSubCase
                Write Excel Cell	${start_row}   9    ${recv_type}    sheet_name=AddSubCase
                Write Excel Cell	${start_row}   11    ${recv_name}    sheet_name=AddSubCase
                Write Excel Cell	${start_row}   12    ${recv_lastname}    sheet_name=AddSubCase
                Write Excel Cell	${start_row}   13    ${recv_promptpay_type}    sheet_name=AddSubCase
                Write Excel Cell	${start_row}   14    ${recv_promptpay_id}    sheet_name=AddSubCase
                Write Excel Cell	${start_row}   15    ${recv_account_no}    sheet_name=AddSubCase
                Write Excel Cell	${start_row}   16    ${recv_bank_name}    sheet_name=AddSubCase
                Write Excel Cell	${start_row}   18    ${txn_date}    sheet_name=AddSubCase
                Write Excel Cell	${start_row}   19    ${txn_time}    sheet_name=AddSubCase
                Write Excel Cell	${start_row}   20    ${txn_id}    sheet_name=AddSubCase
                Write Excel Cell	${start_row}   21    ${txn_amount}    sheet_name=AddSubCase
                ${start_row}=    evaluate   ${start_row}+${1}
        END
     END
     Save Excel Document      filename=${CURDIR}/${FILE_NAME}.xlsx
     Close Current Excel Document

Create victim information '${FILE_NAME}' of bank name '${BANK_NAME}'
     Open Excel Document      filename=${CURDIR}/${FILE_NAME}.xlsx   doc_id=docname1
     ${victim_person_id}=    create person id 'บุคคลธรรมดา' 
     ${victim_person_name}=    create person name 'random' 
     ${victim_person_lastname}=    create person lastname 'random'
     ${victim_case_type}=    create case type 'หลอกลวงเป็นบุคคลอื่นเพื่อยืมเงิน'
#      ${victim_case_type}=    create case type 'random'
     ${victim_case_detail}=    create case detail 'random'
     ${victim_account_no}=    create account_no 'random'
     ${victim_bank_name}=    create bank name '${BANK_NAME}'
     ${victim_phone_no}=    create phone no 'random'
     ${victim_contact_name}=    create person name 'random'
     ${victim_contact_phone}=   create phone no 'random'
     ${victim_contact_email}=    create contact email 'random'
     ${victim_contact_relation}=    create contact relation 'random'
     set test variable    ${victim_person_name}
     set test variable    ${victim_person_lastname}
     set test variable    ${victim_account_no}
     set test variable    ${victim_bank_name}
     Write Excel Cell	9   1    ${victim_person_id}    sheet_name=CreateBankCase
     Write Excel Cell	9   2    บุคคลธรรมดา    sheet_name=CreateBankCase
     Write Excel Cell	9   3    ${victim_person_name}    sheet_name=CreateBankCase
     Write Excel Cell	9   4    ${victim_person_lastname}    sheet_name=CreateBankCase
     Write Excel Cell	9   5    ${victim_case_type}    sheet_name=CreateBankCase
     Write Excel Cell	9   6    ${victim_case_detail}    sheet_name=CreateBankCase
     Write Excel Cell	9   7    ${victim_account_no}    sheet_name=CreateBankCase
     Write Excel Cell	9   8    ${victim_bank_name}    sheet_name=CreateBankCase    
     Write Excel Cell	9   10    ${victim_phone_no}    sheet_name=CreateBankCase
     Write Excel Cell	9   11    ${victim_contact_name}    sheet_name=CreateBankCase
     Write Excel Cell	9   12    ${victim_contact_phone}    sheet_name=CreateBankCase
     Write Excel Cell	9   13    ${victim_contact_email}    sheet_name=CreateBankCase
     Write Excel Cell	9   14    ${victim_contact_relation}    sheet_name=CreateBankCase
     Save Excel Document      filename=${CURDIR}/${FILE_NAME}.xlsx
     Close Current Excel Document


Create victim information '${FILE_NAME}' of bank name '${BANK_NAME}' SP TEST
     Open Excel Document      filename=${CURDIR}/${FILE_NAME}.xlsx   doc_id=docname1
     ${victim_person_id}=    create person id 'บุคคลธรรมดา'
#      set test variable   ${victim_person_id2}      ${victim_person_id}
     ${victim_person_name}=    create person name 'random' 
     ${victim_person_lastname}=    create person lastname 'random'
     ${victim_case_type}=    create case type 'random'
     ${victim_case_detail}=    create case detail 'random'
     ${victim_account_no}=    create account_no 'random'
     ${victim_account_no2}=    create account_no 'random'
     ${victim_bank_name}=    create bank name '${BANK_NAME}'
     ${victim_phone_no}=    create phone no 'random'
     ${victim_contact_name}=    create person name 'random'
     ${victim_contact_phone}=   create phone no 'random'
     ${victim_contact_email}=    create contact email 'random'
     ${victim_contact_relation}=    create contact relation 'random'
     set test variable    ${victim_person_name}
     set test variable    ${victim_person_lastname}
     set test variable    ${victim_account_no}
     set test variable    ${victim_account_no2}
     set test variable    ${victim_bank_name}
     Write Excel Cell	9   1    ${victim_person_id}    sheet_name=CreateBankCase
     Write Excel Cell	9   2    บุคคลธรรมดา    sheet_name=CreateBankCase
     Write Excel Cell	9   3    ${victim_person_name}    sheet_name=CreateBankCase
     Write Excel Cell	9   4    ${victim_person_lastname}    sheet_name=CreateBankCase
     Write Excel Cell	9   5    ${victim_case_type}    sheet_name=CreateBankCase
     Write Excel Cell	9   6    ${victim_case_detail}    sheet_name=CreateBankCase
     Write Excel Cell	9   7    ${victim_account_no}    sheet_name=CreateBankCase
     Write Excel Cell	9   8    ${victim_bank_name}    sheet_name=CreateBankCase    
     Write Excel Cell	9   10    ${victim_phone_no}    sheet_name=CreateBankCase
     Write Excel Cell	9   11    ${victim_contact_name}    sheet_name=CreateBankCase
     Write Excel Cell	9   12    ${victim_contact_phone}    sheet_name=CreateBankCase
     Write Excel Cell	9   13    ${victim_contact_email}    sheet_name=CreateBankCase
     Write Excel Cell	9   14    ${victim_contact_relation}    sheet_name=CreateBankCase
     Write Excel Cell	10   1    ${victim_person_id}    sheet_name=CreateBankCase
     Write Excel Cell	10   2    บุคคลธรรมดา    sheet_name=CreateBankCase
     Write Excel Cell	10   3    ${victim_person_name}    sheet_name=CreateBankCase
     Write Excel Cell	10   4    ${victim_person_lastname}    sheet_name=CreateBankCase
     Write Excel Cell	10   5    ${victim_case_type}    sheet_name=CreateBankCase
     Write Excel Cell	10   6    ${victim_case_detail}    sheet_name=CreateBankCase
     Write Excel Cell	10   7    ${victim_account_no2}    sheet_name=CreateBankCase
     Write Excel Cell	10   8    ${victim_bank_name}    sheet_name=CreateBankCase    
     Write Excel Cell	10   10    ${victim_phone_no}    sheet_name=CreateBankCase
     Write Excel Cell	10   11    ${victim_contact_name}    sheet_name=CreateBankCase
     Write Excel Cell	10   12    ${victim_contact_phone}    sheet_name=CreateBankCase
     Write Excel Cell	10   13    ${victim_contact_email}    sheet_name=CreateBankCase
     Write Excel Cell	10   14    ${victim_contact_relation}    sheet_name=CreateBankCase
     Save Excel Document      filename=${CURDIR}/${FILE_NAME}.xlsx
     Close Current Excel Document
          ${victim_person_name} =	Remove String	${victim_person_name}   \n
     ${victim_person_lastname} =	Remove String	${victim_person_lastname}   \n
     ${victim_person_id} =	Remove String	${victim_person_id}   \n
    Append to File    ${CURDIR}/temp_trans.txt    Account1,${test_case_name},${BANK_NAME},${master_case_id},${victim_account_no},${victim_person_name},${victim_person_lastname},${victim_person_id}\n
    Append to File    ${CURDIR}/temp_trans.txt    Account2,${test_case_name},${BANK_NAME},${master_case_id},${victim_account_no2},${victim_person_name},${victim_person_lastname},${victim_person_id}\n


Create victim information '${FILE_NAME}' of bank name '${BANK_NAME}' test 1-3
     Open Excel Document      filename=${CURDIR}/${FILE_NAME}.xlsx   doc_id=docname1
     ${victim_person_id}=    create person id 'บุคคลธรรมดา'
#      set test variable   ${victim_person_id2}      ${victim_person_id}
     ${victim_person_name}=    create person name 'random' 
     ${victim_person_lastname}=    create person lastname 'random'
     ${victim_case_type}=    create case type 'random'
     ${victim_case_detail}=    create case detail 'random'
     ${victim_account_no}=    create account_no 'random'
     ${victim_account_no2}=    create account_no 'random'
     ${victim_bank_name}=    create bank name '${BANK_NAME}'
     ${victim_phone_no}=    create phone no 'random'
     ${victim_contact_name}=    create person name 'random'
     ${victim_contact_phone}=   create phone no 'random'
     ${victim_contact_email}=    create contact email 'random'
     ${victim_contact_relation}=    create contact relation 'random'
     set test variable    ${victim_person_name}
     set test variable    ${victim_person_lastname}
     set test variable    ${victim_account_no}
     set test variable    ${victim_account_no2}
     set test variable    ${victim_bank_name}
     Write Excel Cell	9   1    ${victim_person_id}    sheet_name=CreateBankCase
     Write Excel Cell	9   2    บุคคลธรรมดา    sheet_name=CreateBankCase
     Write Excel Cell	9   3    ${victim_person_name}    sheet_name=CreateBankCase
     Write Excel Cell	9   4    ${victim_person_lastname}    sheet_name=CreateBankCase
     Write Excel Cell	9   5    ${victim_case_type}    sheet_name=CreateBankCase
     Write Excel Cell	9   6    ${victim_case_detail}    sheet_name=CreateBankCase
     Write Excel Cell	9   7    ${victim_account_no}    sheet_name=CreateBankCase
     Write Excel Cell	9   8    ${victim_bank_name}    sheet_name=CreateBankCase    
     Write Excel Cell	9   10    ${victim_phone_no}    sheet_name=CreateBankCase
     Write Excel Cell	9   11    ${victim_contact_name}    sheet_name=CreateBankCase
     Write Excel Cell	9   12    ${victim_contact_phone}    sheet_name=CreateBankCase
     Write Excel Cell	9   13    ${victim_contact_email}    sheet_name=CreateBankCase
     Write Excel Cell	9   14    ${victim_contact_relation}    sheet_name=CreateBankCase
#      Write Excel Cell	10   1    ${victim_person_id}    sheet_name=CreateBankCase
#      Write Excel Cell	10   2    บุคคลธรรมดา    sheet_name=CreateBankCase
#      Write Excel Cell	10   3    ${victim_person_name}    sheet_name=CreateBankCase
#      Write Excel Cell	10   4    ${victim_person_lastname}    sheet_name=CreateBankCase
#      Write Excel Cell	10   5    ${victim_case_type}    sheet_name=CreateBankCase
#      Write Excel Cell	10   6    ${victim_case_detail}    sheet_name=CreateBankCase
#      Write Excel Cell	10   7    ${victim_account_no2}    sheet_name=CreateBankCase
#      Write Excel Cell	10   8    ${victim_bank_name}    sheet_name=CreateBankCase    
#      Write Excel Cell	10   10    ${victim_phone_no}    sheet_name=CreateBankCase
#      Write Excel Cell	10   11    ${victim_contact_name}    sheet_name=CreateBankCase
#      Write Excel Cell	10   12    ${victim_contact_phone}    sheet_name=CreateBankCase
#      Write Excel Cell	10   13    ${victim_contact_email}    sheet_name=CreateBankCase
#      Write Excel Cell	10   14    ${victim_contact_relation}    sheet_name=CreateBankCase
     Save Excel Document      filename=${CURDIR}/${FILE_NAME}.xlsx
     Close Current Excel Document
          ${victim_person_name} =	Remove String	${victim_person_name}   \n
     ${victim_person_lastname} =	Remove String	${victim_person_lastname}   \n
     ${victim_person_id} =	Remove String	${victim_person_id}   \n
    Append to File    ${CURDIR}/temp_trans.txt    Account1,${test_case_name},${BANK_NAME},${master_case_id},${victim_account_no},${victim_person_name},${victim_person_lastname},${victim_person_id}\n
    Append to File    ${CURDIR}/temp_trans.txt    Account2,${test_case_name},${BANK_NAME},${master_case_id},${victim_account_no2},${victim_person_name},${victim_person_lastname},${victim_person_id}\n

Create victim information condition 2 ลักษณะเคสซื้อขายสินค้า '${FILE_NAME}' of bank name '${BANK_NAME}'
     Open Excel Document      filename=${CURDIR}/${FILE_NAME}.xlsx   doc_id=docname1
     ${victim_person_id}=    create person id 'บุคคลธรรมดา' 
     ${victim_person_name}=    create person name 'random' 
     ${victim_person_lastname}=    create person lastname 'random'
     ${victim_case_type}=    create case type 'หลอกลวงซื้อขายสินค้า หรือบริการ'
     ${victim_case_detail}=    create case detail 'random'
     ${victim_account_no}=    create account_no 'random'
     ${victim_bank_name}=    create bank name '${BANK_NAME}'
     ${victim_phone_no}=    create phone no 'random'
     ${victim_contact_name}=    create person name 'random'
     ${victim_contact_phone}=   create phone no 'random'
     ${victim_contact_email}=    create contact email 'random'
     ${victim_contact_relation}=    create contact relation 'random'
     set test variable    ${victim_person_name}
     set test variable    ${victim_person_lastname}
     set test variable    ${victim_account_no}
     set test variable    ${victim_bank_name}
     Write Excel Cell	9   1    ${victim_person_id}    sheet_name=CreateBankCase
     Write Excel Cell	9   2    บุคคลธรรมดา    sheet_name=CreateBankCase
     Write Excel Cell	9   3    ${victim_person_name}    sheet_name=CreateBankCase
     Write Excel Cell	9   4    ${victim_person_lastname}    sheet_name=CreateBankCase
     Write Excel Cell	9   5    ${victim_case_type}    sheet_name=CreateBankCase
     Write Excel Cell	9   6    ${victim_case_detail}    sheet_name=CreateBankCase
     Write Excel Cell	9   7    ${victim_account_no}    sheet_name=CreateBankCase
     Write Excel Cell	9   8    ${victim_bank_name}    sheet_name=CreateBankCase    
     Write Excel Cell	9   10    ${victim_phone_no}    sheet_name=CreateBankCase
     Write Excel Cell	9   11    ${victim_contact_name}    sheet_name=CreateBankCase
     Write Excel Cell	9   12    ${victim_contact_phone}    sheet_name=CreateBankCase
     Write Excel Cell	9   13    ${victim_contact_email}    sheet_name=CreateBankCase
     Write Excel Cell	9   14    ${victim_contact_relation}    sheet_name=CreateBankCase
     Save Excel Document      filename=${CURDIR}/${FILE_NAME}.xlsx
     Close Current Excel Document

Create victim information condition 2 '${FILE_NAME}' of bank name '${BANK_NAME}'
     Open Excel Document      filename=${CURDIR}/${FILE_NAME}.xlsx   doc_id=docname1
     ${victim_person_id}=    create person id 'บุคคลธรรมดา' 
     ${victim_person_name}=    create person name 'random' 
     ${victim_person_lastname}=    create person lastname 'random'
     ${victim_case_type}=    create case type without buyer 'random'
     ${victim_case_detail}=    create case detail 'random'
     ${victim_account_no}=    create account_no 'random'
     ${victim_bank_name}=    create bank name '${BANK_NAME}'
     ${victim_phone_no}=    create phone no 'random'
     ${victim_contact_name}=    create person name 'random'
     ${victim_contact_phone}=   create phone no 'random'
     ${victim_contact_email}=    create contact email 'random'
     ${victim_contact_relation}=    create contact relation 'random'
     set test variable    ${victim_person_name}
     set test variable    ${victim_person_lastname}
     set test variable    ${victim_account_no}
     set test variable    ${victim_bank_name}
     Write Excel Cell	9   1    ${victim_person_id}    sheet_name=CreateBankCase
     Write Excel Cell	9   2    บุคคลธรรมดา    sheet_name=CreateBankCase
     Write Excel Cell	9   3    ${victim_person_name}    sheet_name=CreateBankCase
     Write Excel Cell	9   4    ${victim_person_lastname}    sheet_name=CreateBankCase
     Write Excel Cell	9   5    ${victim_case_type}    sheet_name=CreateBankCase
     Write Excel Cell	9   6    ${victim_case_detail}    sheet_name=CreateBankCase
     Write Excel Cell	9   7    ${victim_account_no}    sheet_name=CreateBankCase
     Write Excel Cell	9   8    ${victim_bank_name}    sheet_name=CreateBankCase    
     Write Excel Cell	9   10    ${victim_phone_no}    sheet_name=CreateBankCase
     Write Excel Cell	9   11    ${victim_contact_name}    sheet_name=CreateBankCase
     Write Excel Cell	9   12    ${victim_contact_phone}    sheet_name=CreateBankCase
     Write Excel Cell	9   13    ${victim_contact_email}    sheet_name=CreateBankCase
     Write Excel Cell	9   14    ${victim_contact_relation}    sheet_name=CreateBankCase
     Save Excel Document      filename=${CURDIR}/${FILE_NAME}.xlsx
     Close Current Excel Document

Create victim information '${FILE_NAME}'
     Open Excel Document      filename=${CURDIR}/${FILE_NAME}.xlsx   doc_id=docname1
     ${victim_person_id}=    create person id 'บุคคลธรรมดา' 
     ${victim_person_name}=    create person name 'random' 
     ${victim_person_lastname}=    create person lastname 'random'
     ${victim_case_type}=    create case type 'random'
     ${victim_case_detail}=    create case detail 'random'
     ${victim_account_no}=    create account_no 'random'
     ${victim_bank_name}=    create bank name 'random'
     ${victim_phone_no}=    create phone no 'random'
     ${victim_contact_name}=    create person name 'random'
     ${victim_contact_phone}=   create phone no 'random'
     ${victim_contact_email}=    create contact email 'random'
     ${victim_contact_relation}=    create contact relation 'random'
     set test variable    ${victim_person_name}
     set test variable    ${victim_person_lastname}
     set test variable    ${victim_account_no}
     set test variable    ${victim_bank_name}
     Write Excel Cell	9   1    ${victim_person_id}    sheet_name=CreateBankCase
     Write Excel Cell	9   2    บุคคลธรรมดา    sheet_name=CreateBankCase
     Write Excel Cell	9   3    ${victim_person_name}    sheet_name=CreateBankCase
     Write Excel Cell	9   4    ${victim_person_lastname}    sheet_name=CreateBankCase
     Write Excel Cell	9   5    ${victim_case_type}    sheet_name=CreateBankCase
     Write Excel Cell	9   6    ${victim_case_detail}    sheet_name=CreateBankCase
     Write Excel Cell	9   7    ${victim_account_no}    sheet_name=CreateBankCase
     Write Excel Cell	9   8    ${victim_bank_name}    sheet_name=CreateBankCase    
     Write Excel Cell	9   10    ${victim_phone_no}    sheet_name=CreateBankCase
     Write Excel Cell	9   11    ${victim_contact_name}    sheet_name=CreateBankCase
     Write Excel Cell	9   12    ${victim_contact_phone}    sheet_name=CreateBankCase
     Write Excel Cell	9   13    ${victim_contact_email}    sheet_name=CreateBankCase
     Write Excel Cell	9   14    ${victim_contact_relation}    sheet_name=CreateBankCase
     Save Excel Document      filename=${CURDIR}/${FILE_NAME}.xlsx
     Close Current Excel Document

create promptpay type '${PP_TYPE}'
    IF  '${PP_TYPE}' == 'random'
         ${recv_promptpay_type}=    random_promptpay_type
    ELSE
        ${recv_promptpay_type} =   set variable   ${PP_TYPE}
    END
   RETURN    ${recv_promptpay_type}

ประเภทของการอายัดจากธนาคาร '${BANK_BLOCK_TYPE}'
    IF  '${BANK_BLOCK_TYPE}' == 'random'
         ${bank_block_tpye}=    random_bank_block_type
    ELSE
        ${bank_block_tpye} =   set variable   ${BANK_BLOCK_TYPE}
    END
   RETURN    ${bank_block_tpye}

ประเภทของหมายอายัดจากตำรวจ '${POLICS_BLOCK_TYPE}'
    IF  '${POLICS_BLOCK_TYPE}' == 'random'
         ${polics_block_tpye}=    random_polics_block_type
    ELSE
        ${polics_block_tpye} =   set variable   ${POLICS_BLOCK_TYPE}
    END
   RETURN    ${polics_block_tpye}

create contact relation '${RELATION}'
    IF  '${RELATION}' == 'random'
         ${victim_contact_relation}=    random_relation
    ELSE
        ${victim_contact_relation} =   set variable   ${RELATION}
    END
   RETURN    ${victim_contact_relation}

create contact email '${EMAIL}'
    IF  '${EMAIL}' == 'random'
         ${victim_contact_email}=    random_email   10
    ELSE
        ${victim_contact_email} =   set variable   ${EMAIL}
    END
   RETURN    ${victim_contact_email}

create phone no '${NUMBER}'
    IF  '${NUMBER}' == 'random'
         ${victim_phone_no}=    random_number   10
    ELSE
        ${victim_phone_no} =   set variable   ${NUMBER}
    END
   RETURN    ${victim_phone_no}

create bank name '${BANK_NAME}'
    IF  '${BANK_NAME}' == 'random'
         ${victim_bank_name}=    random_bank
    ELSE
        ${victim_bank_name} =   set variable   ${BANK_NAME}
    END
   RETURN    ${victim_bank_name}

create ip address '${NUMBER}'
    IF  '${NUMBER}' == 'random'
         ${victim_ip_address}=    random_ip_address
    ELSE
        ${victim_ip_address} =   set variable   ${NUMBER}
    END
   RETURN    ${victim_ip_address}

create transacion id '${NUMBER}'
    IF  '${NUMBER}' == 'random'
         ${txn_id}=    random_number   12
    ELSE
        ${txn_id} =   set variable   ${NUMBER}
    END
   RETURN    ${txn_id}

create transacion amount '${NUMBER}'
    IF  '${NUMBER}' == 'random'
         ${txn_amt}=    random_amount
    ELSE
        ${txn_amt} =   set variable   ${NUMBER}
    END
   RETURN    ${txn_amt}

create account_no '${NUMBER}'
    IF  '${NUMBER}' == 'random'
         ${victim_account_no}=    random_number   10
    ELSE
        ${victim_account_no} =   set variable   ${NUMBER}
    END
   RETURN    ${victim_account_no}


create BankCode '${BankCode}'
    IF  '${BankCode}' == 'random'
         ${BankCode}=    random_BankCode
    ELSE
        ${victim_account_no} =   set variable   ${BankCode}
    END
   RETURN    ${BankCode}

create person name '${NAME}'
    IF  '${NAME}' == 'random'
         ${victim_person_name}=    random_locky_name   ${CURDIR}/name.txt
    ELSE
        ${victim_person_name} =   set variable   ${NAME}
    END
   RETURN    ${victim_person_name}

create person lastname '${LAST_NAME}'
    IF  '${LAST_NAME}' == 'random'
         ${victim_person_lastname}=    random_locky_name   ${CURDIR}/name.txt
    ELSE
        ${victim_person_lastname} =   set variable   ${LAST_NAME}
    END
   RETURN    ${victim_person_lastname}

create case type '${CASE_TYPE}'
    IF  '${CASE_TYPE}' == 'random'
         ${victim_case_type}=    random_case_type
    ELSE
        ${victim_case_type} =   set variable   ${CASE_TYPE}
    END
   RETURN    ${victim_case_type}

create case type without buyer '${CASE_TYPE}'
    IF  '${CASE_TYPE}' == 'random'
         ${victim_case_type}=    random_case_type_nobuyer
    ELSE
        ${victim_case_type} =   set variable   ${CASE_TYPE}
    END
   RETURN    ${victim_case_type}

create case detail '${CASE_DETAIL}'
    IF  '${CASE_DETAIL}' == 'random'
         ${victim_case_detail}=    random_string_case_detail   1024
    ELSE
        ${victim_case_detail} =   set variable   ${CASE_DETAIL}
    END
   RETURN    ${victim_case_detail}

create person id '${PERSON_INFO}'
    IF  '${PERSON_INFO}' == 'บุคคลธรรมดา'
         ${victim_person_id} =   generate_thai_citizen_id
    ELSE IF  '${PERSON_INFO}' == 'ชาวต่างชาติ'
         ${victim_person_id} =   random_string   15
    ELSE IF  '${PERSON_INFO}' == 'นิติบุคคล'
         ${victim_person_id} =   random_18_digits
    ELSE
        ${victim_person_id} =   set variable   ${PERSON_INFO}
    END
   RETURN    ${victim_person_id}

create master case id of bank name '${BANK_NAME}'
    ${date}=    Get Current Date
    ${year}=    Convert Date    ${date}    result_format=%Y
    ${month_day}=    Convert Date    ${date}    result_format=%m%d
    ${thai_year}=     evaluate   ${year}+${543}
    ${random_numb_5}=   random_number  4
    ${master_case_id}=    set variable    ${thai_year}${month_day}${BANK_NAME}0${random_numb_5}
    RETURN   ${master_case_id}

create polics date '${CONDITION_DATE}'
    ${date}=    Get Current Date
    ${year}=    Convert Date    ${date}    result_format=%Y
    ${month_day}=    Convert Date    ${date}    result_format=%m-%d
    ${thai_year}=     evaluate   ${year}+${543}
    IF  '${CONDITION_DATE}' == 'same_date_master_case'
        ${polics_date} =   set variable   ${thai_year}-${month_day}
    ELSE IF  '${CONDITION_DATE}' == 'after_create_case'
        ${month_day}=     Add Time To Date    ${date}    2day    result_format=%m-%d
        ${polics_date} =   set variable   ${thai_year}-${month_day}
    ELSE IF  '${CONDITION_DATE}' == 'before_create_case'
        ${month_day}=     Subtract Time From Date    ${date}    2day    result_format=%m-%d
        ${polics_date} =   set variable   ${thai_year}-${month_day}
    ELSE
        ${polics_date} =   set variable   ${EMPTY}
   END
   RETURN    ${polics_date}

create transaction date '${CONDITION_DATE}'
    ${date}=    Get Current Date
    ${year}=    Convert Date    ${date}    result_format=%Y
    ${month_day}=    Convert Date    ${date}    result_format=%m-%d
    ${thai_year}=     evaluate   ${year}+${543}
    IF  '${CONDITION_DATE}' == 'same_date_master_case'
        ${polics_date} =   set variable   ${thai_year}-${month_day}
    ELSE IF  '${CONDITION_DATE}' == 'after_create_case'
        ${month_day}=     Add Time To Date    ${date}    2day    result_format=%m-%d
        ${polics_date} =   set variable   ${thai_year}-${month_day}
    ELSE IF  '${CONDITION_DATE}' == 'before_create_case'
        ${days}=    random_number    1
        ${month_day}=     Subtract Time From Date    ${date}    ${days}day    result_format=%m-%d
        ${polics_date} =   set variable   ${thai_year}-${month_day}
    ELSE
        ${polics_date} =   set variable   ${EMPTY}
   END
   RETURN    ${polics_date}

create block_unblock date time '${CONDITION_DATE}'
    ${date}=    Get Current Date
    ${year}=    Convert Date    ${date}    result_format=%Y
    ${month_day}=    Convert Date    ${date}    result_format=%m-%d %H:%M
    ${thai_year}=     evaluate   ${year}+${543}
    IF  '${CONDITION_DATE}' == 'today'
        ${police_block} =   set variable   ${thai_year}-${month_day}
    ELSE IF  '${CONDITION_DATE}' == 'after_create_case'
        ${days}=    random_number    1
        ${month_day}=     Add Time To Date    ${date}    ${days}day    result_format=%m-%d %H:%M
        ${police_block} =   set variable   ${thai_year}-${month_day}
    ELSE IF  '${CONDITION_DATE}' == 'before_create_case'
        ${days}=    random_number    1
        ${month_day}=     Subtract Time From Date    ${date}    ${days}day    result_format=%m-%d %H:%M
        ${police_block} =   set variable   ${thai_year}-${month_day}
    ELSE
        ${police_block} =   set variable   ${EMPTY}
   END
   RETURN    ${police_block}

create polics time '${TIME}'
    IF  '${TIME}' == 'random'
         ${hour}=    random_hour
         ${minute}=   random_minute
         ${polics_date} =   set variable   ${hour}:${minute}
    ELSE
        ${polics_date} =   set variable   ${TIME}
    END
   RETURN    ${polics_date}

create transaction time '${TIME}'
    IF  '${TIME}' == 'random'
         ${hour}=    random_hour
         ${minute}=   random_minute
         ${second}=   random_minute
         ${txn_time} =   set variable   ${hour}:${minute}:${second}
    ELSE
        ${txn_time} =   set variable   ${TIME}
    END
   RETURN    ${txn_time}

create polics case id '${POLICS_CASE_ID}' total '${NUMBER}' digit
    IF  '${POLICS_CASE_ID}' == 'random'
         ${polics_case_id}=    random_string   ${NUMBER}
    ELSE
        ${polics_case_id} =   set variable   ${POLICS_CASE_ID}
    END
   RETURN    ${polics_case_id}

การตรวจพบรายการ คือ '${SECTION}'
    IF  '${SECTION}' == 'random'
         ${police_section}=    random_string   10
    ELSE
        ${police_section} =   set variable   ${SECTION}
    END
   RETURN    ${police_section}


Check data
  set test variable   ${file_path}      ${CURDIR}Negative/TC001_008.txt

   ${data}=    OperatingSystem.Read File    ${file_path}
    Log    ${data}

# Remove Specified Rows
#     [Arguments]    @{lines}    @{rows_to_delete}
#     FOR    ${row}    IN    @{rows_to_delete}
#         ${index}=    Evaluate    ${row} - 1
#         ${lines}=    Remove From List    ${lines}    ${index}
#     END
#     [Return]    ${lines}


Create transaction to banks '${HORSE_LIST}' in '${FILE_NAME}' Case Insert personalID from add Sub Case
    ${start_row}=    set variable   ${14}
    Open Excel Document      filename=${CURDIR}/${FILE_NAME}.xlsx   doc_id=docname1
    @{bank_words} =  Split String    ${HORSE_LIST}       ,
    ${horse_count}=    Get Length    ${bank_words}
     FOR    ${i}    IN RANGE    ${horse_count}
        ${tran_count}=    random_number_transaction   1
        set test variable   ${tran_count}   1
        ${recv_id}=    create person id 'บุคคลธรรมดา'
        ${recv_type}=    set variable    บุคคลธรรมดา
        ${recv_name}=    create person name 'random'
        ${recv_lastname}=    create person lastname 'random'
        ${recv_promptpay_type}=    create promptpay type 'random'
        set test variable    ${recv_promptpay_type}     ไม่มี
        ${recv_promptpay_id}=    set variable   ${EMPTY}
        IF  '${recv_promptpay_type}' == 'เบอร์โทร'
                ${recv_phone} =   random_number   9
                ${recv_promptpay_id} =   set variable   +66${recv_phone}
        ELSE IF  '${recv_promptpay_type}' == 'หมายเลขบัตรประชาชน'
                ${recv_promptpay_id} =   generate_thai_citizen_id
        ELSE IF  '${recv_promptpay_type}' == 'เลขนิติบุคคล (Biller Id)'
                ${recv_promptpay_id} =   random_number   15
        ELSE IF  '${recv_promptpay_type}' == 'e-wallet'
                ${recv_promptpay_id} =   random_number   15
        ELSE
                ${recv_promptpay_id} =   set variable   ${EMPTY}
        END
        ${horse_short_name}=    set variable    ${bank_words}[${i}]
        ${horse_bank_name}=    set variable  ${bank_name_dict}[${horse_short_name}]  
        ${recv_account_no}=    create account_no 'random'
        # set test variable    ${recv_account_no}     6543211200
        ${recv_bank_name}=    create bank name '${horse_bank_name}'
        &{horse_dict}=    Create Dictionary     horse_id=${recv_id}    horse_type=${recv_type}    horse_name=${recv_name}    horse_lastname=${recv_lastname}    horse_account_no=${recv_account_no}    horse_account_name=${recv_bank_name}
        Set To Dictionary   ${horse_list_dict}   ${horse_short_name}=${horse_dict}
        set test variable    ${horse_list_dict}

        FOR   ${n}   IN RANGE    ${tran_count}
                ${victim_ip_address}=    create ip address 'random'
                ${txn_date}=    create transaction date 'before_create_case'
                ${txn_time}=   create transaction time 'random'
                ${txn_id}=   create transacion id 'random'
                ${txn_amount}=   create transacion amount 'random'
                Write Excel Cell	${start_row}   2    ${victim_person_name}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   3    ${victim_person_lastname}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   4    ${victim_account_no}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   5    ${victim_bank_name}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   7    ${victim_ip_address}    sheet_name=CreateBankCase
                # Write Excel Cell	${start_row}   8    ${recv_id}    sheet_name=CreateBankCase
                # Write Excel Cell	${start_row}   9    ${recv_type}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   11    ${recv_name}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   12    ${recv_lastname}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   13    ${recv_promptpay_type}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   14    ${recv_promptpay_id}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   15    ${recv_account_no}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   16    ${recv_bank_name}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   18    ${txn_date}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   19    ${txn_time}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   20    ${txn_id}    sheet_name=CreateBankCase
                Write Excel Cell	${start_row}   21    ${txn_amount}    sheet_name=CreateBankCase
                ${start_row}=    evaluate   ${start_row}+${1}
        END
     END
     Save Excel Document      filename=${CURDIR}/${FILE_NAME}.xlsx
     Close Current Excel Document
         ${recv_name} =	Remove String	${recv_name}   \n
     ${recv_lastname} =	Remove String	${recv_lastname}   \n
     ${recv_id} =	Remove String	${recv_id}   \n
        Append to File    ${CURDIR}/temp_trans.txt    ${master_case_id},${test_case_name},${horse_short_name},${recv_name},${recv_lastname},${recv_account_no},${recv_id}\n

Get File Text To List
#     query person from cleansing
    set test variable    ${DEFAULT VALUE}    0
    set test variable   ${TOTAL_PERSON_BY_ACCOUNT_Report}  0
    set test variable   ${Total_person_old}  0
    Set Test Variable    ${FILE_PATH}   ${CURDIR}/../keywords/Report_Summary_Cleansing.txt
    Append to File     ${FILE_PATH}      MASTER_CASE_ID,PERSON_OLD,TOTAL_PERSON_BY_ACCOUNT\n
    set test variable    ${FILE_MASTERCASE}     ${CURDIR}/../keywords/temp_MASTER_CASE_ID.txt
    ${file_content}=    Get File    ${FILE_MASTERCASE}
    ${ALL_MASTER_CASE}=           Split To Lines    ${file_content}
    ${Length_All_Master}=    Get Length    ${ALL_MASTER_CASE}
       FOR    ${index}    IN RANGE    0    ${Length_All_Master}
    ${BANK_CASE_ID}=    Get From List    ${ALL_MASTER_CASE}  ${index} 
     set test variable      ${BANK_CASE_ID}
     qeury person '${BANK_CASE_ID}' to bank account

    ${TOTAL_PERSON_BY_ACCOUNT}=    Set Variable If    ${TOTAL_PERSON_BY_ACCOUNT} == None    ${DEFAULT VALUE}    ${TOTAL_PERSON_BY_ACCOUNT}

    Run Keyword If  '${TOTAL_PERSON_BY_ACCOUNT}' == '0'    set test variable  ${Total_person}  0
    Append to File    ${FILE_PATH}    ${BANK_CASE_ID},${Total_person},${TOTAL_PERSON_BY_ACCOUNT}\n

    
    ${TOTAL_PERSON_BY_ACCOUNT_Report}=    Evaluate    ${TOTAL_PERSON_BY_ACCOUNT_Report} + ${TOTAL_PERSON_BY_ACCOUNT}
    set test variable   ${TOTAL_PERSON_BY_ACCOUNT_Report}

    ${Total_person_old}=    Evaluate    ${Total_person_old} + ${Total_person}
    set test variable   ${Total_person_old}
    END
    Append to File    ${FILE_PATH}  จำนวนคนจากเดิม :: ${Total_person_old} คน , จำนวนรวมทั้งหมดที่จะฉีกเส้น :: ${TOTAL_PERSON_BY_ACCOUNT_Report} Account

Recheck File
     qeury Check Duplicate Person ID


Get file aoc test
    log  test


Export Master Case via API 
    set test variable    ${OUTPUT_FILE}    DownLoad.csv   # ตั้งชื่อไฟล์ที่คุณต้องการบันทึก
    set test variable  ${BANK_NAME}   002
    ${json_string}=  Catenate    SEPARATOR=\n
    ...    {
    ...    "masterCaseId": "",
    ...    "policeCaseId": "",
    ...    "detectiveTypeId": "",
    ...    "ownerFirstName": "",
    ...    "ownerLastName": "",
    ...    "ownerIdCard": "",
    ...    "senderAccountNumber": "",
    ...    "senderBankCode": "",
    ...    "receiverAccountId": "",
    ...    "receiverAccountNumber": "",
    ...    "receiverBankCode": "",
    ...    "caseCreateStartDate": "2567/09/09 00:00",
    ...    "caseCreateEndDate": "2567/09/09 23:59",
    ...    "page": null
    ...    }
    ${API_URL}=   Set Variable     ${host}
    Create Session    exampleSession    ${API_URL}
    ${headers} =   Create Dictionary    Content-Type=application/json    X-Institution-Id=${BANK_NAME}xxx   X-Roles=xxx   X-User-Id=xxx
    ${response}=    POST On Session   exampleSession  /api/fraud-cases/search/bank-export-report  data=${json_string}    headers=${headers}
    log  ${response.text}
    log  ${response.header}
#     Should Be Equal As Strings    ${response.status_code}    200
#     Log To Console    Downloading report...
#     Save Response Content To File    ${response}    ${OUTPUT_FILE}

warrantID'${warrantID}' total '${NUMBER}'
    IF  '${warrantID}' == 'random'
         ${warrantID_2}=    random_string_eng   ${NUMBER}
        #  ${warrantID_2}=    random_string   ${NUMBER}
         ${warrantID_3}=    random_string_eng   ${NUMBER}
        #  ${warrantID_3}=    random_string   ${NUMBER}
         ${warrantID_number}=    random_number_warrant   ${NUMBER}
           set test variable    ${warrantID_2}    ${warrantID_2}
           set test variable    ${warrantID_3}    ${warrantID_3}
           set test variable    ${warrantID_number}  ${warrantID_number}
    ELSE
        ${warrantID} =   set variable   ${warrantID}
    END

warrantID'${warrantID}' total '${NUMBER}' SFTP
    IF  '${warrantID}' == 'SFTP'
         ${warrantID_2}=    random_string_eng   ${NUMBER}
         ${warrantID_3}=    random_string_eng   ${NUMBER}
         ${warrantID_number}=    random_number_warrant   ${NUMBER}
         ${warrantID_number_w}=    random_number_warrant   ${NUMBER}
           set test variable    ${warrantID_2}    ${warrantID_2}
           set test variable    ${warrantID_3}    ${warrantID_3}
           set test variable    ${warrantID_number}  ${warrantID_number}
           set test variable    ${warrantID_number_w}  W${warrantID_number_w}
#     ELSE IF 
    ELSE
        ${warrantID} =   set variable   ${warrantID}
    END

warrantID'${warrantID}' total and String ${str1} digis and String2 ${str2} digis And Number ${NUMBER} digis
    IF  '${warrantID}' == 'random'
         ${warrantID_2}=    random_string_eng   ${str1}
         ${warrantID_3}=    random_string_eng   ${str2}
         ${warrantID_number}=    random_number_warrant   ${NUMBER}
           set test variable    ${warrantID_2}    
           set test variable    ${warrantID_3}    
           set test variable    ${warrantID_number}
    ELSE
        ${warrantID} =   set variable   ${warrantID}
    END


warrantDate '${TESTFILE}'
    IF  '${TESTFILE}' == 'Local'
    ${date}=    Get Current Date
    ${year}=    Convert Date    ${date}    result_format=%Y
    ${month_day}=    Convert Date    ${date}    result_format=%m-%d
    ${thai_year}=     evaluate   ${year}+${543}
    ${warrant_date}=    set variable    ${thai_year}-${month_day}
    set test variable   ${warrant_date}    
    set test variable  ${warrant_date_negative}     ${warrant_date}    
    ELSE
        set test variable  ${warrant_date}    ${TESTFILE}
    END

WarrantTime '${timedate}'
    IF  '${timedate}' == 'Local'
    ${date}=    Get Current Date
    ${current_time}=    Get Current Date    result_format=%H:%M
    ${warrant_time}=    set variable    ${current_time}
    set test variable   ${warrant_time} 
    set test variable  ${warrant_time_negative}     ${warrant_time} 
    ELSE
        set test variable  ${warrant_time}    ${timedate}
    END


Get File GPG From ITMX zip
    ${gpg_file_path}=  Set Variable  ${CURDIR}/Data/${FileName_gpg}
    ${output_csv_path}=  Set Variable  ${CURDIR}/Data/${FileName_zip}
    ${passphrase}=  Set Variable   ${Pass.NITMX}
     ${result}=    Decrypt Gpg File    ${gpg_file_path}  ${output_csv_path}  ${passphrase}
    Log    ${result}
    wait until created    ${CURDIR}/Data/${FileName_gpg}   2s
    wait until created    ${CURDIR}/Data/${FileName_zip}   2s




Get File GPG From ITMX
    ${Response_warrant_H_gpg}=     set variable     ${Response_warrant_H}.gpg
    ${Response_warrant_H_csv}=     set variable     ${Response_warrant_H}.csv
    set test variable    ${Response_warrant_H_gpg}
    set test variable    ${Response_warrant_H_csv}
    WHILE    ${RETRY_COUNT} < ${MAX_RETRIES}
    sleep    5s
    ${outbound_exists}=    Run Keyword And Return Status    SSHLibrary.File Should Exist   /home/sftpaoc/${ENVAOC}/cfr/warranth_binding/outbound/${Response_warrant_H_gpg}
    ${inbound_exists}=    Run Keyword And Return Status    SSHLibrary.File Should Exist   /home/sftpaoc/${ENVAOC}/cfr/warranth_binding/inbound/archive/${FileName_Warrant}.gpg
    Run Keyword If    ${RETRY_COUNT} == ${MAX_RETRIES}    Fail    "File not found after ${MAX_RETRIES} retries."
    ${RETRY_COUNT}=    Evaluate    ${RETRY_COUNT} + 1
    Run Keyword If    ${outbound_exists} and ${inbound_exists}    Exit For Loop
    END
    SSHLibrary.Get File     /home/sftpaoc/${ENVAOC}/cfr/warranth_binding/outbound/${Response_warrant_H_gpg}     ${CURDIR}/Data/${Response_warrant_H_gpg}
    ${gpg_file_path}=  Set Variable  ${CURDIR}/Data/${Response_warrant_H_gpg}
    ${output_csv_path}=  Set Variable  ${CURDIR}/Data/${Response_warrant_H_csv}
    ${passphrase}=  Set Variable   ${Pass.AOC}
     ${result}=    Decrypt Gpg File    ${gpg_file_path}  ${output_csv_path}  ${passphrase}
    Log    ${result}
    wait until created    ${CURDIR}/Data/${Response_warrant_H_gpg}   2s
    wait until created    ${CURDIR}/Data/${Response_warrant_H_csv}   2s
    set test variable   ${CSV_FILE}     ${CURDIR}/Data/${Response_warrant_H_csv}
    set test variable   ${GPG_FILE}     ${CURDIR}/Data/${Response_warrant_H_gpg}
    set test variable   ${GPG_FILE_REQ}     ${CURDIR}/Data/${FileName_Warrant}.gpg
    set test variable   ${CSV_FILE_REQ}     ${CURDIR}/Data/${FileName_Warrant}.csv
#     remove file     ${CURDIR}/../${FILENAME_GPG}
#     remove file     ${CURDIR}/../${FILENAME_CSV}

Get File GPG From ITMX Suspicious
    ${Response_warrant_H_gpg}=     set variable     *.gpg
    set test variable    ${Response_warrant_H_gpg}
    WHILE    ${RETRY_COUNT} < ${MAX_RETRIES}
    ${outbound_exists}=    Run Keyword And Return Status    SSHLibrary.File Should Exist   /home/sftpaoc/${ENVAOC}/cfr/suspicious/${Response_warrant_H_gpg}        
#     Execute Command    rm -rf /home/sftpaoc/${ENVAOC}/cfr/suspicious/${Response_warrant_H_gpg}  /home/sftpaoc/${ENVAOC}/cfr/suspicious/archive/${Response_warrant_H_gpg}
    Run Keyword If    ${RETRY_COUNT} == ${MAX_RETRIES}    Fail    "File not found after ${MAX_RETRIES} retries."
    ${RETRY_COUNT}=    Evaluate    ${RETRY_COUNT} + 1
    log to console   "File not found after ${RETRY_COUNT} retries."
    Run Keyword If    ${outbound_exists}     Exit For Loop 
        # Execute Command    rm -rf /home/sftpaoc/${ENVAOC}/cfr/suspicious/${Response_warrant_H_gpg}  /home/sftpaoc/${ENVAOC}/cfr/suspicious/archive/${Response_warrant_H_gpg}
    END
    Execute Command    rm -rf /home/sftpaoc/${ENVAOC}/cfr/suspicious/${Response_warrant_H_gpg}  /home/sftpaoc/${ENVAOC}/cfr/suspicious/archive/${Response_warrant_H_gpg}





Get File GPG From ITMX JSON
    ${Response_warrant_H_gpg}=     set variable     ${Response_warrant_H}.gpg
    ${Response_warrant_H_csv}=     set variable     ${Response_warrant_H}.json
    set test variable    ${Response_warrant_H_gpg}
    set test variable    ${Response_warrant_H_csv}
    WHILE    ${RETRY_COUNT} < ${MAX_RETRIES}
    sleep    5s
    ${outbound_exists}=    Run Keyword And Return Status    SSHLibrary.File Should Exist   /home/sftpaoc/${ENVAOC}/cfr/warranth_binding/outbound/${Response_warrant_H_gpg}
    ${inbound_exists}=    Run Keyword And Return Status    SSHLibrary.File Should Exist   /home/sftpaoc/${ENVAOC}/cfr/warranth_binding/inbound/archive/${FileName_Warrant}.gpg
    Run Keyword If    ${RETRY_COUNT} == ${MAX_RETRIES}    Fail    "File not found after ${MAX_RETRIES} retries."
    ${RETRY_COUNT}=    Evaluate    ${RETRY_COUNT} + 1
    Run Keyword If    ${outbound_exists} and ${inbound_exists}    Exit For Loop
    END
    SSHLibrary.Get File     /home/sftpaoc/${ENVAOC}/cfr/warranth_binding/outbound/${Response_warrant_H_gpg}     ${CURDIR}/Data/${Response_warrant_H_gpg}
    ${gpg_file_path}=  Set Variable  ${CURDIR}/Data/${Response_warrant_H_gpg}
    ${output_csv_path}=  Set Variable  ${CURDIR}/Data/${Response_warrant_H_csv}
    ${passphrase}=  Set Variable   ${Pass.AOC}
     ${result}=    Decrypt Gpg File    ${gpg_file_path}  ${output_csv_path}  ${passphrase}
    Log    ${result}
    wait until created    ${CURDIR}/Data/${Response_warrant_H_gpg}   2s
    wait until created    ${CURDIR}/Data/${Response_warrant_H_csv}   2s
    set test variable   ${CSV_FILE}     ${CURDIR}/Data/${Response_warrant_H_csv}
    set test variable   ${GPG_FILE}     ${CURDIR}/Data/${Response_warrant_H_gpg}
    set test variable   ${GPG_FILE_REQ}     ${CURDIR}/Data/${FileName_Warrant}.gpg
    set test variable   ${CSV_FILE_REQ}     ${CURDIR}/Data/${FileName_Warrant}.json
#     remove file     ${CURDIR}/../${FILENAME_GPG}
#     remove file     ${CURDIR}/../${FILENAME_CSV}

Deleted file 
    remove file    ${GPG_FILE}
    remove file    ${CSV_FILE}
    remove file    ${GPG_FILE_REQ}
    remove file    ${CSV_FILE_REQ}


Get File GPG AOC 
    ${GreyList_response}=     set variable     ${FILENAME_GPG}
    ${GreyList_response_csv}=     set variable     ${FILENAME_CSV}
    SSHLibrary.File Should Exist   /home/sftpaoc/${ENVAOC}/cfr/suspicious/${GreyList_response}
    SSHLibrary.Get File     /home/sftpaoc/${ENVAOC}/cfr/suspicious/${GreyList_response}
    ${gpg_file_path}=  Set Variable  ${CURDIR}/../${GreyList_response}
    ${output_csv_path}=  Set Variable  ${GreyList_response_csv}
    ${passphrase}=  Set Variable   ${Pass.AOC}
     ${result}=    Decrypt Gpg File    ${gpg_file_path}  ${output_csv_path}  ${passphrase}
    Log    ${result}
    wait until created    ${CURDIR}/../${FILENAME_GPG}   2s
    wait until created    ${CURDIR}/../${FILENAME_CSV}   2s
#     remove file     ${CURDIR}/../${FILENAME_GPG}
#     remove file     ${CURDIR}/../${FILENAME_CSV}


Get File GPG BANK 
    ${GreyList_response}=     set variable     ${FILENAME_GPG}
    ${GreyList_response_csv}=     set variable     ${FILENAME_CSV}
    SSHLibrary.File Should Exist   /home/sftpcfr/002cfr/${ENVBANK}/SUSPICIOUS_REPORT/${GreyList_response}
    SSHLibrary.Get File     /home/sftpcfr/002cfr/${ENVBANK}/SUSPICIOUS_REPORT/${GreyList_response}
    ${gpg_file_path}=  Set Variable  ${CURDIR}/../${GreyList_response}
    ${output_csv_path}=  Set Variable  ${GreyList_response_csv}
    ${passphrase}=  Set Variable   ${Pass.BANK002}

     ${result}=    Decrypt Gpg File    ${gpg_file_path}  ${output_csv_path}  ${passphrase}
    wait until created    ${CURDIR}/../${FILENAME_GPG}   2s
    wait until created    ${CURDIR}/../${FILENAME_CSV}   2s
    remove file     ${CURDIR}/../${FILENAME_GPG}
    remove file     ${CURDIR}/../${FILENAME_CSV}


Decrypt File GPG From NITMX ${FILE_NAME_CSV}
    ${GreyList_response}=     set variable     ${CURDIR}\\Data/${FILE_NAME_CSV}.gpg
    ${GreyList_response_csv}=     set variable     ${CURDIR}\\Data/${FILE_NAME_CSV}.csv
    ${gpg_file_path}=  Set Variable  ${GreyList_response}
    ${output_csv_path}=  Set Variable  ${GreyList_response_csv}
    ${passphrase}=  Set Variable   ${Pass.NITMX}
     ${result}=    Decrypt Gpg File    ${gpg_file_path}  ${output_csv_path}  ${passphrase}
    wait until created    ${GreyList_response}   2s
    wait until created    ${GreyList_response_csv}   2s


Encrypt File GPG To NITMX TH ${FILE_NAME_CSV}
    Private key and file path ${FILE_NAME_CSV}
    ${PRIVATE_KEY_PATH}=  Set Variable   ${PRIVATE_KEY_PATH_TO}
    ${FILEPATH}=  Set Variable  ${FILEPATH_CSV}
    ${input_file}  set variable    ${FILEPATH}
    ${DATA}  set variable    ${FILEPATH}
    ${output_file}  set variable   ${OUT_PATH_GPG}
    ${recipients}   set variable   ${secret_key}
    ${result}=   Sign And Encrypt Csv Th   ${PRIVATE_KEY_PATH}  ${DATA}  ${input_file}  ${output_file}  ${recipients}    ${Pass.AOC}
    ${signature}    ${output_path}=    Set Variable    ${result}
    Log    Signature: ${signature}
    Log    Output Path: ${output_path}



Encrypt File GPG To NITMX ${FILE_NAME_CSV}
    Private key and file path ${FILE_NAME_CSV}
    ${PRIVATE_KEY_PATH}=  Set Variable   ${PRIVATE_KEY_PATH_TO}
    ${FILEPATH}=  Set Variable  ${FILEPATH_CSV}
    ${input_file}  set variable    ${FILEPATH}
    ${DATA}  set variable    ${FILEPATH}
    ${output_file}  set variable   ${OUT_PATH_GPG}
    ${recipients}   set variable   ${secret_key}
    ${result}=   Sign And Encrypt Csv   ${PRIVATE_KEY_PATH}  ${DATA}  ${input_file}  ${output_file}  ${recipients}    ${Pass.AOC}
    ${signature}    ${output_path}=    Set Variable    ${result}
    Log    Signature: ${signature}
    Log    Output Path: ${output_path}

Encrypt File GPG To NITMX JSON ${FILE_NAME_CSV}
      Set test Variable   ${PRIVATE_KEY_PATH_TO}    ${CURDIR}\\${SECAOC}.sec
      Set test Variable   ${FILEPATH_CSV}    ${CURDIR}\\Data/${FILE_NAME_CSV}.json
      set test variable   ${OUT_PATH_GPG}    ${CURDIR}\\Data/${FILE_NAME_CSV}.gpg
    ${PRIVATE_KEY_PATH}=  Set Variable   ${PRIVATE_KEY_PATH_TO}
    ${FILEPATH}=  Set Variable  ${FILEPATH_CSV}
    ${input_file}  set variable    ${FILEPATH}
    ${DATA}  set variable    ${FILEPATH}
    ${output_file}  set variable   ${OUT_PATH_GPG}
    ${recipients}   set variable   ${secret_key}
    ${result}=   Sign And Encrypt Json   ${PRIVATE_KEY_PATH}  ${DATA}  ${input_file}  ${output_file}  ${recipients}    ${Pass.AOC}
    ${signature}    ${output_path}=    Set Variable    ${result}
    Log    Signature: ${signature}
    Log    Output Path: ${output_path}


Private key and file path ${FILE_NAME_CSV}
  Set test Variable   ${PRIVATE_KEY_PATH_TO}    ${CURDIR}\\${SECAOC}.sec
  Set test Variable   ${FILEPATH_CSV}    ${CURDIR}\\Data/${FILE_NAME_CSV}.csv
  set test variable   ${OUT_PATH_GPG}    ${CURDIR}\\Data/${FILE_NAME_CSV}.gpg

get current datetime
    ${date}=    Get Current Date
    ${year}=    Convert Date    ${date}    result_format=%Y
    ${month_day}=    Convert Date    ${date}    result_format=%m%d
    ${month}=    Convert Date    ${date}    result_format=%m
    ${day}=    Convert Date    ${date}    result_format=%d

    ${future_date}=    Add Time To Date    ${date}    1 day
    ${future_date_month}=    Add Time To Date    ${date}    31 day
    ${future_day}=    Convert Date    ${future_date}    result_format=%d
    ${future_month}=    Convert Date    ${future_date_month}    result_format=%m
    ${thai_year}=     evaluate   ${year}+${543}
    ${thai_year_future}=     evaluate   ${year}+${544}
    ${filenameDateTime}=    set variable    ${thai_year}${month_day}
    ${filenameDateTime_eng}=    set variable    ${year}${month_day}
    ${filenameDateTime_eng_v1}=    set variable    ${year}-${month}-${day}
    ${filenameDateTime_day_future}=    set variable    ${thai_year}${month}${future_day}
    ${filenameDateTime_year_future}=    set variable    ${thai_year_future}${month}${future_day}
    ${filenameDateTime_month_future}=    set variable    ${year}-${future_month}-${day}
    ${filenameDateTime_month_future_v1}=    set variable    ${year}${future_month}${day}
#     log    ${datetime}
    set test variable    ${filenameDateTime} 
    set test variable    ${filenameDateTime_eng} 
    set test variable    ${filenameDateTime_day_future}  
    set test variable    ${filenameDateTime_month_future}  
    set test variable    ${filenameDateTime_month_future_v1}  
    set test variable    ${filenameDateTime_year_future}  
    set test variable    ${filenameDateTime_eng_v1}  

get current datetime negative
    ${date}=    Get Current Date
    ${year}=    Convert Date    ${date}    result_format=%Y
    ${month_day}=    Convert Date    ${date}    result_format=%m-%d
    ${thai_year}=     evaluate   ${year}+${543}
    ${NDateTime}=    set variable    ${thai_year}-${month_day}
#     log    ${datetime}
    set test variable    ${NDateTime} 

get current datetime Wary juristic
    ${date}=    Get Current Date
    ${year}=    Convert Date    ${date}    result_format=%Y
    ${month_day}=    Convert Date    ${date}    result_format=%m-%d
    ${thai_year}=     evaluate   ${year}+${543}
    ${filenameDateTime}=    set variable    ${thai_year}-${month_day}
#     log    ${datetime}
    set test variable    ${filenameDateTime} 

get current datetime money trail
    ${date}=    Get Current Date
    ${filenameDateTime}=    Convert Date    ${date}    result_format=%Y%m%d%H%M%S%f
    ${final_datetime}=        Set Variable    ${filenameDateTime[:17]}   # เลือกแค่ 3 ตัวสุดท้ายเป็นมิลลิวินาท
    
#     log to console   ${filenameDateTime}
    log to console   ${final_datetime}
    set test variable    ${filenameDateTime}    ${final_datetime}


get current date WarrantH
    ${date}=    Get Current Date
    ${year}=    Convert Date    ${date}    result_format=%Y
    ${month}=    Convert Date    ${date}    result_format=%m
    ${day}=    Convert Date    ${date}    result_format=%d
    ${month_day}=    Convert Date    ${date}    result_format=%m-%d
    ${thai_year}=     evaluate   ${year}+${543}
    ${datetime}=    set variable    ${thai_year}-${month_day}
    ${datetime_eng}=    set variable    ${year}-${month_day}
    ${datetime_eng_1}=    set variable    ${year}-${month}-32
    ${datetime_eng_2}=    set variable    ${year}-13-${day}
    ${datetime_eng_3}=    set variable    ${year}-${month}-TS
    set test variable    ${Date_WarrantH}    ${datetime} 
    set test variable    ${Date_Eng}    ${datetime_eng} 
    set test variable    ${Date_Eng_fix1}    ${datetime_eng_1} 
    set test variable    ${Date_Eng_fix2}    ${datetime_eng_2} 
    set test variable    ${Date_Eng_fix3}    ${datetime_eng_3} 

get current TIME
    ${date}=    Get Current Date
    ${datetime}=    Convert Date    ${date}    result_format=%H%M
    set test variable    ${TIME}    ${datetime}

get current TIME WarrantH
    ${date}=    Get Current Date
    ${datetime}=    Convert Date    ${date}    result_format=%H:%M
    set test variable    ${TIME}    ${datetime}


# select * from AOC_SFTP_WARRANT_REQUEST_FILE_DETAILwhere FILE_ID = '0260e505-d45e-44cb-b206-3299803d4cb6';select * from AOC_SFTP_WARRANT_REQUEST_FILE_INFO;where FILE_NAME = 'CFR_Warrant_H_25671113_1600_999_REQ';select * from AOC_SFTP_WARRANT_RESPONSE_FILE_INFOwhere REQUEST_FILE_ID = '0260e505-d45e-44cb-b206-3299803d4cb6';