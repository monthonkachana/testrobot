*** Settings ***
Resource         ${CURDIR}/../../../resource/import.robot

*** Keywords ***
Get User Profile Success
    &{header}              BuiltIn.Create dictionary    x-api-key=${x_api_key}
    ${response}            REST.GET    endpoint=${end_point_1}    headers=${header}
    ${data_status}=         Get From Dictionary    ${response}    status
    ${response}            REST.Output    response body
    ${data_id}             JSONLibrary.Get value from json    ${response}            $..data.id
    ${data_email}          JSONLibrary.Get value from json    ${response}            $..data.email
    ${data_first_name}     JSONLibrary.Get value from json    ${response}            $..data.first_name
    ${data_last_name}      JSONLibrary.Get value from json    ${response}            $..data.last_name
    ${data_avatar}         JSONLibrary.Get value from json    ${response}            $..data.avatar
    
    [Return]    ${data_status}    ${data_id}    ${data_email}    ${data_first_name}    ${data_last_name}    ${data_avatar}   

Get User Profile Not Found
    &{header}              BuiltIn.Create dictionary    x-api-key=${x_api_key}
    ${response}            REST.GET    endpoint=${end_point_2}    headers=${header}
    ${data_status}=         Get From Dictionary    ${response}    status
    ${response}            REST.Output    response body
    ${data_id}             BuiltIn.Evaluate     json.loads('''${response}''')    modules=json
    [Return]    ${data_status}    ${data_id}