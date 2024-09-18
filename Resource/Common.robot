*** Settings ***
Resource    import.robot
*** Keywords ***

Open Browser With Chrome
    [Arguments]    ${url}    
    Open Browser    ${url}    chrome     
    Maximize Browser Window

Search Vedio babyshark
    [Arguments]    ${text}
    Input Text    xpath=//input[@id='search']  ${text}
    Press Keys    xpath=//input[@id='search']  RETURN
    Wait Until Page Contains Element    xpath=//*[@id="video-title"]
    Click Element    xpath=//*[@id="video-title"]
    Wait Until Page Contains Element    id=player    22s
    Log    Playing video for keyword: ${text}
    Should Be Equal    ${text}    ${babyshark_expected}
Convert To String For JSON
    [Arguments]    ${json}
    ${json_string}=    Convert Json To String    ${json}
    Log    ${json_string}
    [Return]    ${json_string}
WriteFile
    [Arguments]     ${Folder}    ${filename}     ${data}
    Log    ${data}
    Create File    ${CURDIR}/${Folder}/${filename}.json     ${data}
    ${file}    Get File    ${CURDIR}/${Folder}/${filename}.json
    [Return]    ${file}
Post Request Data
    [Arguments]    ${name}    ${url}    ${json}
    ${response}=    POST    ${url}    ${json}
    [Return]    ${response}

Get Request Data
    [Arguments]    ${name}    ${url}
    ${response}=    GET    ${url}
    [Return]    ${response}
Get JSON From File For JSON
    [Arguments]    ${Folder}    ${file_path}
    ${json_data}=    Get File    ${CURDIR}/${Folder}/${file_path}.json
    Log    ${json_data}
    # ${parsed_json}=    Load JSON From String    ${json_data}
    [Return]    ${json_data}
Load JSON From File For JSON
    [Arguments]    ${Folder}    ${file_path}
    ${json_data}=    Load Json From File   ${CURDIR}/${Folder}/${file_path}.json
    Log    ${json_data}
    # ${parsed_json}=    Load JSON From String    ${json_data}
    [Return]    ${json_data}

ReplaceStringForVerifyLog
    [Arguments]    ${Data}
    ${Data}    JSONLibrary.Convert Json To String    ${Data}
    ${Data}    String.Replace String    ${Data}    \\n    ${EMPTY}
    ${Data}    String.Replace String    ${Data}    \\    ${EMPTY}
    ${Data}    String.Replace String    ${Data}    ""    ${EMPTY}
    ${Data}    String.Replace String    ${Data}    [    ${EMPTY}
    ${Data}    String.Replace String    ${Data}    ]    ${EMPTY}
    ${Data}    String.Replace String    ${Data}     },    },\n
    ${Data}    String.Remove String    ${Data}    ${SPACE}
    ${Data}    String.Remove String    ${Data}    ""    count=1
    ${Data}    String.Remove String    ${Data}    ''    ${EMPTY}
    Log    ${Data}
    [Return]    ${Data}