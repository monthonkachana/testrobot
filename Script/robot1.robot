*** Settings ***
Resource    ../Resource/import.robot
*** Variables ***
${HEIGHT}    5
${WIDTH}    50
${expected_userId}    [1]
${expected_id}    1
${expected_title}    ['delectus aut autem']
${expected_completed}    False
*** Test Cases ***
test    
    Open Browser With Chrome    ${URL_youtube}
    Search Vedio babyshark    ${keywork}
    Sleep    15s

test api
    ${response}=    GET    ${API_URL_GET}
    Should Be Equal As Numbers    ${response.status_code}    200
    Log    ${response}
    ${json_data}=    Convert To String For JSON    ${response.json()}
    Log    ${json_data}
    ${filename}    Set Variable    Getuser101
    ${file_content}    WriteFile    CollectionFile   ${filename}    ${json_data} 
    Log    ${file_content}
    Should Be Equal As Strings    ${file_content}    ${json_data}
    ${load}    Load JSON From File For JSON    CollectionFile    Getuser101
    Log    ${load}
    ${userId}    JSONLibrary.Get Value From Json    ${load}    $..userId 
    Log    ${userId}
    ${id}    JSONLibrary.Get Value From Json    ${load}    $..id 
    ${title}    JSONLibrary.Get Value From Json    ${load}    $..title 
    ${completed}    JSONLibrary.Get Value From Json    ${load}    $..completed
Get All Posts and Save to File
    ${response}=    GET    ${API_URL_POST}
    Should Be Equal As Numbers    ${response.status_code}    200
    Log    ${response.json()}
    ${json_data}=    Convert To String For JSON    ${response.json()}
    Log    ${json_data}
    ${filename}    Set Variable    PostAll
    ${file_content}    WriteFile    CollectionFile    ${filename}    ${json_data}
    Log    ${file_content}
    Should Be Equal As Strings    ${file_content}    ${json_data}

Create And Display Pyramid
    ${pyramid_output}=    Create Pyramid    ${HEIGHT}    ${WIDTH}
    Log    ${pyramid_output}

