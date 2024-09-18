*** Settings ***
Resource    ../Resource/import.robot

*** Test Cases ***
Register New User
    [Documentation]    ทดสอบการลงทะเบียนผู้ใช้ใหม่ผ่าน API โดยการอ่านข้อมูลจากไฟล์ JSON
    ${user_data}=    Load JSON From File For JSON    PreparaData    userdata
    Log    ${user_data}
    ${response}=    Post Request Data    Create Post    ${POST_URL}    ${user_data}
    Log    ${response}
    Should Be Equal As Numbers    ${response.status_code}    201
    Log    ${response.text}

Get Registered User
    [Documentation]    ทดสอบการดึงข้อมูลผู้ใช้ที่สมัครเรียบร้อยแล้ว
    ${post_id}=    Set Variable    1
    ${response}=    Get Request Data    Get User    ${BASE_URL}/posts/${post_id}
    Should Be Equal As Numbers    ${response.status_code}    200
    Log    ${response.text}
    ${expectedresponse}    ReplaceStringForVerifyLog    ${response.text}
    Log    ${expectedresponse}
    # Should Be Equal    ${expectedresponse}    ${response.text}
    ${filename}    Set Variable    RegisteredUser
    ${file_content}    WriteFile    CollectionFile    ${filename}    ${expectedresponse} 
    Should Be Equal As Strings    ${file_content}    ${expectedresponse} 
