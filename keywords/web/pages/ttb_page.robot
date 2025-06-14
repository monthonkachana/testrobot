*** Settings ***
Resource         ${CURDIR}/../../../resource/import.robot


*** Keywords ***

Open Web Herokuapp
    ${chrome_options}=     BuiltIn.Evaluate       sys.modules['selenium.webdriver'].ChromeOptions()     sys, selenium.webdriver
    BuiltIn.Call Method     ${chrome_options}     add_argument     --incognito
    SeleniumLibrary.Open Browser        https://the-internet.herokuapp.com/login       browser=chrome    options=${chrome_options}
    SeleniumLibrary.Maximize Browser Window

Check Login Page
    SeleniumLibrary.Wait Until Element Is Visible    ${ttb_locator['header_login_page']}

Input Username
    [Arguments]    ${text_username}
    SeleniumLibrary.Wait Until Element Is Visible    ${ttb_locator['input_username']}   30s
    SeleniumLibrary.Input Text    ${ttb_locator['input_username']}    ${text_username}

Input Password
    [Arguments]    ${text_password}
    SeleniumLibrary.Wait Until Element Is Visible    ${ttb_locator['input_password']}   30s
    SeleniumLibrary.Input Text    ${ttb_locator['input_password']}    ${text_password}

Click Btn Login
    SeleniumLibrary.Click Element    ${ttb_locator['button_login']}
    

Click Btn Logout
    SeleniumLibrary.Click Element    ${ttb_locator['button_logout']}
