*** Settings ***
Resource    ../Resource/import.robot

*** Variables ***
${URL}         https://jsonplaceholder.typicode.com/comments 
${ENDPOINT}    /comments?postId=  
${expectedpostId}                
${expectedname}                
*** Test Cases ***
Verify Posts On API
    FOR    ${page}    IN RANGE    1    6
    ${response}=    Get Request Data    Get User    ${BASE_URL}${ENDPOINT}${page}
    Should Be Equal As Numbers    ${response.status_code}    200
    Log    ${response.text} 
    ${json_data}    Convert Json To String    ${response.text}
    ${Rawdata}    ReplaceStringForVerifyLog    ${json_data}
    Log    ${Rawdata}
    @{lines}    Split To Lines    ${Rawdata}
    BuiltIn.Log Many    @{lines}
    ${CountRawData}    BuiltIn.Get Length    ${lines}  
    FOR    ${i}     IN RANGE     ${CountRawData}
          ${RawData}=    BuiltIn.Set Variable    ${lines}[${i}]
          Log    ${RawData}
        IF    '${RawData}' != '${EMPTY}'
            
            ${postId}    JSONLibrary.Get Value From Json    ${RawData}    $..postId 

            ${name}    JSONLibrary.Get Value From Json    ${RawData}    $..name     fail_on_empty=${True}
        ELSE
            ${postId}=    BuiltIn.Set Variable    NULL
            ${name}=    BuiltIn.Set Variable    NULL
        END
    comment     Should Be Equal    ${postId}    ${expectedpostId}
    comment     Should Be Equal    ${name}    ${expectedname}
    END 
    END

get vaule for json
    ${response}=    Get Request Data    Get User    ${BASE_URL}${ENDPOINT}1
    Should Be Equal As Numbers    ${response.status_code}    200
    Log    ${response.text}  
    ${filename}    Set Variable    Post101
    ${file_content}    WriteFile    CollectionFile   ${filename}    ${response.text} 
    Log    ${file_content}
    Should Be Equal As Strings    ${file_content}    ${response.text}
    ${Rawdata}    Load JSON From File For JSON    CollectionFile    Post101
    Log    ${Rawdata}
    ${Rawdata}    BuiltIn.Convert To String    ${Rawdata}
    ${Rawdata}    String.Replace String    ${Rawdata}    \\n    ${EMPTY}
    ${Rawdata}    String.Replace String    ${Rawdata}     },    },\n
    ${Rawdata}    String.Replace String    ${Rawdata}    [    ${EMPTY}
    ${Rawdata}    String.Replace String    ${Rawdata}    ]    ${EMPTY}
    Log    ${Rawdata}
    @{lines}    Split To Lines    ${Rawdata}
    BuiltIn.Log Many    @{lines}
    ${CountRawData}    BuiltIn.Get Length    ${lines} 
        FOR    ${i}     IN RANGE     ${CountRawData}
          ${RawData}=    BuiltIn.Set Variable    ${lines}[${i}]
            Log    ${RawData}
        IF    '${RawData}' != '${EMPTY}'
            ${userId}    JSONLibrary.Get Value From Json    ${RawData}    $..userId 
            ${id}    JSONLibrary.Get Value From Json    ${RawData}    $..id 
            ${title}    JSONLibrary.Get Value From Json    ${RawData}    $..title 
            ${completed}    JSONLibrary.Get Value From Json    ${RawData}    $..completed
        ELSE
            ${postId}=    BuiltIn.Set Variable    NULL
            ${name}=    BuiltIn.Set Variable    NULL
        END
    comment     Should Be Equal    ${postId}    ${expectedpostId}
    comment     Should Be Equal    ${name}    ${expectedname}
    END 

    
