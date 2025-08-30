*** Settings ***
Resource  ../../resources/imports.robot

*** Test Cases ***

TC001_001
    [Documentation]    Verify Wary Juristic Mule Report files received from AOC(CCIB) at SFTP Server.
    Given create File Name Wary Juristic max
    WHEN Create Warrant H FILE CSV
    THEN Get Data Police Case Number is null 1
    Given Zip CSV File max
    Then Read ZIP File
    WHEN Encrypt File ZIP max To NITMX ${filename}
    WHEN login to sftp server and Put file by Wary_max
    WHEN Call API Sending file Wary Jutistic from aoc to ITMX
    Then PreparaData File Download Wary Juristic Mule Report
    THEN Get File Zip From ITMX for Report Way Juristic
    Then Validate Check file name
    Then Deleted path file all

TC001_002
    [Documentation]    Verify Data Wary Juristic Mule Report
    Given create File Name Wary Juristic max
    WHEN Create Warrant H FILE CSV
    THEN Get Data Police Case Number is null 1
    Given Zip CSV File max
    Then Read ZIP File
    WHEN Encrypt File ZIP max To NITMX ${filename}
    WHEN login to sftp server and Put file by Wary_max
    WHEN Call API Sending file Wary Jutistic from aoc to ITMX
    Then PreparaData File Download Wary Juristic Mule Report
    Then Get File Zip From ITMX for Report Way Juristic
    Then Deleted path file all

TC001_003
    [Documentation]    Verify file Data Wary Juristic Mule Report - กรณี data ข้างใน emtry
    Given create File Name Wary Juristic max
    Given Compress Empty File
    WHEN Encrypt File ZIP max To NITMX ${filename}
    WHEN login to sftp server and Put file by Wary_max
    WHEN Call API Sending file Wary Jutistic from aoc to ITMX
    Then Deleted path file and folder all 

TC001_004
    [Documentation]    Verify file Data Wary Juristic Mule Report - กรณีไม่พบไฟล์ gpg
    Given create File Name Wary Juristic max
    WHEN Create Warrant H FILE CSV
    THEN Get Data to file csv wary juristic 1 morify csv
    Given Zip CSV File max
    WHEN Encrypt File ZIP max To NITMX ${filename}
    WHEN Call API Sending file Wary Jutistic from aoc to ITMX
    WHEN login to sftp server and Put file by Wary_check
    Then Deleted path file all

TC001_005
    [Documentation]    Verify file Data Wary Juristic Mule Report - - ด้านในมีไฟล์ .txt
    Given create File Name Wary Juristic max
    WHEN Create Warrant H FILE TEXT
    THEN Get Data to file csv wary juristic 1 morify txt
    Given Zip TEXT File
    WHEN Encrypt File ZIP max To NITMX ${filename}
    WHEN login to sftp server and Put file by Wary_max
    WHEN Call API Sending file Wary Jutistic from aoc to ITMX
    Then Deleted path file all

TC001_006
    [Documentation]    Verify file Data Wary Juristic Mule Report - กรณีชื่อไฟล์ YYYY-MM-DD ไม่เท่ากับ Job Execute Date
    Given create File Name Wary Juristic max
    WHEN Create Warrant H FILE TEXT
    THEN Get Data to file csv wary juristic 1 morify txt
    Given Zip TEXT File
    WHEN Encrypt File ZIP max To NITMX ${filename}
    WHEN login to sftp server and Put file by Wary_max
    WHEN Call API Sending file Wary Jutistic from aoc to ITMX
    Then Deleted path file all

TC001_007
    [Documentation]    Verify file Data Wary Juristic Mule Report -- กรณี ชื่อไฟล์ Pattern file name ไม่ถูกต้อง
    Given create File Name Wary Juristic max
    WHEN Create Warrant H FILE TEXT
    THEN Get Data to file csv wary juristic 1 morify txt
    Given Zip TEXT File
    WHEN Encrypt File ZIP max To NITMX ${filename}
    WHEN login to sftp server and Put file by Wary_max
    WHEN Call API Sending file Wary Jutistic from aoc to ITMX
    Then Deleted path file all

TC001_008
    [Documentation]    Verify file Data Wary Juristic Mule Report -- ด้านในเป็น Folder เปล่า (ไม่ใช่ .zip)
    Given create File Name Wary Juristic max
    Given Compress Empty File
    WHEN Encrypt File ZIP max To NITMX ${filename}
    WHEN login to sftp server and Put file by Wary_max
    WHEN Call API Sending file Wary Jutistic from aoc to ITMX
    Then Deleted path file and folder all 

TC002_001
    [Documentation]    Verify SFTP Connection Error - กรณีเชื่อมต่อ SFTP ไม่ได้
    Given create File Name Wary Juristic max
    WHEN Create Warrant H FILE TEXT
    THEN Get Data to file csv wary juristic 1 morify txt
    Given Zip TEXT File
    WHEN Encrypt File ZIP max To NITMX ${filename}
    WHEN login to sftp server and Put file by Wary_max
    WHEN Call API Sending file Wary Jutistic from aoc to ITMX
    Then Deleted path file all

TC002_002
    [Documentation]    Verify Maximum file size - กรณีข้อมูล  Report file (.zip)  มีขนาด <= 10 MB 
    Given PreparaData Less File 10 mb for sead
    WHEN login to sftp server and Put file by Wary_10
    WHEN Call API Sending file Wary Jutistic from aoc to ITMX
    Then PreparaData File Download Wary Juristic Mule Report
    Then Get File Zip From ITMX for Report Way Juristic Download file
    Then Validate Check file name
    Then Deleted path file all

TC002_003
    [Documentation]    Verify Maximum file size - กรณีข้อมูล  Report file (.zip)  มีขนาด => 10 MB 
    Given PreparaData More File 10 mb for sead
    WHEN login to sftp server and Put file by Wary_10
    WHEN Call API Sending file Wary Jutistic from aoc to ITMX
    Then PreparaData File Download Wary Juristic Mule Report
    Then Get File Zip From ITMX for Report Way Juristic Download file
    Then Validate Check file name
    Then Deleted path file all

TC002_004
    [Documentation]    'Verify amount file in path - กรณีพบไฟล์ 1 ไฟล์ 
    Given create File Name Wary Juristic max
    WHEN Create Warrant H FILE CSV
    THEN Get Data to file csv wary juristic 1 morify csv
    Given Zip CSV File max
    Then Read ZIP File
    WHEN Encrypt File ZIP max To NITMX ${filename}
    WHEN login to sftp server and Put file by Wary_max
    WHEN Call API Sending file Wary Jutistic from aoc to ITMX
    Then PreparaData File Download Wary Juristic Mule Report
    Then Get File Zip From ITMX for Report Way Juristic
    Then Validate Check file name
    Then Deleted path file all

TC002_005
    [Documentation]    'Verify amount file in path - กรณีพบไฟล์มากกว่า 1 ไฟล์ 
    Given create File Name Wary Juristic max
    WHEN Create Warrant H FILE CSV
    THEN Get Data to file csv wary juristic 1 morify csv
    # Given Zip File more
    Given Zip CSV File max
    Then Read ZIP File
    WHEN Encrypt File ZIP max To NITMX ${filename}
    WHEN login to sftp server and Put file by Wary_max
    WHEN Call API Sending file Wary Jutistic from aoc to ITMX
    Then PreparaData File Download Wary Juristic Mule Report
    Then Get File Zip From ITMX for Report Way Juristic
    Then Validate Check file name
    Then Deleted path file all

