*** Settings ***
Resource    .././import.robot
# Library    RequestsLibrary
*** Variables ***

*** Keywords ***

robot test api use lib RequestsLibrary 
    [Documentation]    รองรับ HTTP methods เช่น GET, POST, PUT, DELETE, PATCH
...    ส่ง request พร้อม headers, parameters, และ body ได้
...    รองรับ JSON, XML, form-data
...    ตรวจสอบ status code และ response body ได้ง่าย
...    ** my flow  เตรียม API: เริ่มจากการสร้าง session เพื่อกำหนด base URL
...    * ยิง Request: ระบุ method เช่น GET, POST, PUT, DELETE พร้อมใส่ header, parameter, และ body ตามที่ต้องการ
...    * รับผลลัพธ์: เก็บ response ที่ได้จาก API
...    * ตรวจสอบผลลัพธ์ (Verify): เช็กว่า status code ถูกต้อง และตรวจสอบค่าต่างๆ ใน response body ว่าตรงกับที่คาดไว้
    Create Session    myapi    https://example.com
    ${response}=    POST    myapi    /users    json={"name": "Test", "email": "test@example.com"}
    Should Be Equal As Numbers    ${response.status_code}    201
    Dictionary Should Contain Value    ${response.json()}    Test

# -------------------------------------------------------------------------------------------------------------------------------------

connect to cfr database horse
    [Documentation]    เก็บแบงค์
    ${db_connect}    connect    ${dbapp.username}    ${dbapp.password}    ${dbapp.conn_str}
    set test variable    ${db_connect}
get current datetime dark brown mule max
    # lib datetime
    ${date}=    Get Current Date
    ${year}=    Convert Date    ${date}    result_format=%Y
    ${thai_year}=    Evaluate    ${year} + 543
    ${filenameDateTime}=    Convert Date    ${date}    result_format=%Y%m%d%H%M%S%f
    ${filenameDATE_YMD_THAI}=    Convert Date    ${date}    result_format=${thai_year}-%m-%d
    ${filenameDATE_YMD_THAI_V1}=    Convert Date    ${date}    result_format=${thai_year}-%m-
    ${filenameDATE_YMD}=    Convert Date    ${date}    result_format=%Y-%m-%d
    ${final_datetime}=        Set Variable    ${filenameDateTime[:17]}   # เลือกแค่ 3 ตัวสุดท้ายเป็นมิลลิวินาท
