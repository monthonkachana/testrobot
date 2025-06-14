*** Settings ***
Resource    ${CURDIR}/../resources/import.robot
# Test Teardown    common_app.Quit application

*** Test Cases ***
Verify App Minimal
    ttb_page.Open App Minimal
    ttb_page.Verify header
#ตรวจสอบการเพิ่มข้อมูล
    ttb_page.Verify Tap Button Add
    ttb_page.Input Title    ${data_test['text_title']}
    ttb_page.Select Toggle Switch Remind Me
    ttb_page.Verify Date Field Select Date and Tap Cancel    ${data_test['date_future']}
    ttb_page.Verify Date Field Select Date and Tap Cancel    ${data_test['date_past']}
    ttb_page.Verify Date Field Select Date and Tap Ok    ${data_test['date_past']}
    ttb_page.Verify Date Field Select Date Future and Tap Ok    ${data_test['date_future']}    ${data_test['date_select']}
    ttb_page.Tap Button Next
    ttb_page.Check Data At Home    ${data_test['text_title']}
#ตรวจสอบข้อมูลเพิ่มเติม
    ttb_page.Verify Button Kebab
    ttb_page.Tap Button About
    ttb_page.Verify About page
    ttb_page.Tap Button Back