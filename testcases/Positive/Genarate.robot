*** Settings ***
Resource  ../../resources/imports.robot
Library    OperatingSystem
Library    String
Library    Collections
Library    OperatingSystemLibrary

*** Variables ***
${FILE_PATH}         ${CURDIR}/Negative/TC001_008.txt
${ROWS_TO_DELETE}    2    4    6    # ระบุแถวที่ต้องการลบ (เป็น 1-based index)

*** Test Cases ***
Delete Selected Rows In Text File
    [Documentation]    Deletes specified rows in a text file
    ${file_content}=    Read File    ${FILE_PATH}
    @{lines}=    Split String    ${file_content}    \n
    Log    Before deletion: \n${lines}
    @{updated_lines}=    Remove Specified Rows    ${lines}    @{ROWS_TO_DELETE}
    Log    After deletion: \n${updated_lines}
    ${updated_content}=    Join String    ${updated_lines}    \n
    Write File    ${FILE_PATH}    ${updated_content}

