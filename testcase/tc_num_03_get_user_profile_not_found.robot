*** Settings ***
Resource         ${CURDIR}/../resource/import.robot

*** Test Cases ***
Get User Profile But User Not Found
    [Tags]    tc_num_03_get_user_profile_not_found    test
    ${data_status}    ${data_id}    ttb_api.Get User Profile Not Found
    ${id}            BuiltIn.Catenate        @{data_id}
    Should Be Equal    ${EMPTY}             ${id}
    ${status}          BuiltIn.Convert To String       ${data_status}
    Should Be Equal    ${result_api['status_code_fail']}    ${status}