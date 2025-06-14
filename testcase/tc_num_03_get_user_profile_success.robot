*** Settings ***
Resource         ${CURDIR}/../resource/import.robot

*** Test Cases ***
Get User Profile Success
    [Tags]    tc_num_03_get_user_profile_success    test
    ${data_status}    ${data_id}    ${data_email}    ${data_first_name}    ${data_last_name}    ${data_avatar}    ttb_api.Get User Profile Success
    ${id}            BuiltIn.Catenate        @{data_id}
    ${email}         BuiltIn.Catenate        @{data_email}
    ${first_name}    BuiltIn.Catenate        @{data_first_name}
    ${last_name}     BuiltIn.Catenate        @{data_last_name}   
    ${avatar}        BuiltIn.Catenate        @{data_avatar}
    Should Be Equal    ${result_api['id']}             ${id}
    Should Be Equal    ${result_api['email']}          ${email}
    Should Be Equal    ${result_api['first_name']}     ${first_name}
    Should Be Equal    ${result_api['last_name']}      ${last_name}
    Should Be Equal    ${result_api['avatar']}         ${avatar}
    ${status}          BuiltIn.Convert To String       ${data_status}
    Should Be Equal    ${result_api['status_code_success']}    ${status}