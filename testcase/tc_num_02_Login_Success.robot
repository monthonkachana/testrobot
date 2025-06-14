*** Settings ***
Resource         ${CURDIR}/../resource/import.robot
Test Setup       ttb_page.Open web herokuapp
Test Teardown    SeleniumLibrary.Close all browsers

*** Test Cases ***
Login Success
    [Tags]    tc_num_02_Login_Success    test
    ttb_page.Check Login Page
    ttb_page.Input Username    ${account['username_pass']}
    ttb_page.Input Password    ${account['password_pass']}
    ttb_page.Click Btn Login
    SeleniumLibrary.Wait Until Element Is Visible    ${ttb_locator['message_login_success']}
    ttb_page.Click Btn Logout
    SeleniumLibrary.Wait Until Element Is Visible    ${ttb_locator['message_logout']}