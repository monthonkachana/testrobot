*** Settings ***
Resource    ${CURDIR}/../../../../resources/import.robot

*** Keywords ***
Open App Minimal
    [Documentation]  Open app minimal
    Open application from path    ${app_minimal}    appWaitForLaunch=true    unicodeKeyboard=true    resetKeyboard=true    autoGrantPermissions=true

Verify header
    AppiumLibrary.Wait until element is visible    ${ttb_locator['header_app']}

Tap Button Add 
    common_app.Tap element when ready    ${ttb_locator['btn_add']}

Input Title
    [Arguments]    ${text_title}
    common_app.Input text to element when ready    ${ttb_locator['input_title']}    ${text_title}

Select Toggle Switch Remind Me
    common_app.Tap element when ready    ${ttb_locator['switch_remind_me']}

Verify Tap Button Add
    common_app.Tap element when ready    ${ttb_locator['btn_add']}
    AppiumLibrary.Wait until element is visible    ${ttb_locator['header_title']}

Verify Tap Toggle Switch
    AppiumLibrary.Wait until element is visible    ${ttb_locator['date']}
    AppiumLibrary.Wait until element is visible    ${ttb_locator['time']}

Verify Date Field Select Date and Tap Cancel
    [Arguments]    ${select_date}
    common_app.Tap element when ready    ${ttb_locator['date']}
    ${select_date_calendor}    String.Replace string      ${ttb_locator['select_date']}    {date}    ${select_date}
    common_app.Tap element when ready    ${select_date_calendor}
    common_app.Tap element when ready    ${ttb_locator['btn_cancel']}
    AppiumLibrary.Wait until element is visible    ${ttb_locator['date_today']}

Verify Date Field Select Date and Tap Ok
    [Arguments]    ${select_date}
    common_app.Tap element when ready    ${ttb_locator['date']}
    ${select_date_calendor}    String.Replace string      ${ttb_locator['select_date']}    {date}    ${select_date}
    common_app.Tap element when ready    ${select_date_calendor}
    common_app.Tap element when ready    ${ttb_locator['btn_ok']}
    AppiumLibrary.Wait until element is visible    ${ttb_locator['date_today']}

Verify Date Field Select Date Future and Tap Ok
    [Arguments]    ${select_date}    ${date_format_text}
    common_app.Tap element when ready    ${ttb_locator['date']}
    ${select_date_calendor}    String.Replace string      ${ttb_locator['select_date']}    {date}    ${select_date}
    common_app.Tap element when ready    ${select_date_calendor}
    common_app.Tap element when ready    ${ttb_locator['btn_ok']}
    ${select_date_calendor}    String.Replace string      ${ttb_locator['date_format_text']}    {date_format_text}    ${date_format_text}
    AppiumLibrary.Wait until element is visible    ${select_date_calendor} 

Tap Button Next
    common_app.Tap element when ready    ${ttb_locator['btn_next']}

Check Data At Home
    [Arguments]     ${text_title}
    ${xpath}    String.Replace string      ${ttb_locator['check_text']}    {text_title}    ${text_title}
    AppiumLibrary.Wait until element is visible    ${xpath}

Tap Button Kebab
    common_app.Tap element when ready    ${ttb_locator['btn_kebab']}

Verify Button Kebab
    common_app.Tap element when ready    ${ttb_locator['btn_kebab']}
    AppiumLibrary.Wait until element is visible    ${ttb_locator['btn_settings']}
    AppiumLibrary.Wait until element is visible    ${ttb_locator['btn_about']}

Tap Button About
    common_app.Tap element when ready     ${ttb_locator['btn_about']}

Verify About page
    AppiumLibrary.Wait until element is visible    ${ttb_locator['check_text_minimal']}
    AppiumLibrary.Wait until element is visible    ${ttb_locator['check_text_version']}
    AppiumLibrary.Wait until element is visible    ${ttb_locator['check_text_made_by']}
    AppiumLibrary.Wait until element is visible    ${ttb_locator['check_text_contact']}
    AppiumLibrary.Wait until element is visible    ${ttb_locator['check_text_email']}

Tap Button Back
    common_app.Tap element when ready     ${ttb_locator['btn_back']}