*** Settings ***
Resource         ${CURDIR}/../resource/import.robot

*** Variables ***
@{list_a}         1    2    3    5    6    8    9
@{list_b}         3    2    1    5    6    0  

*** Test Cases ***
Find Duplicate Items
   [Tags]    tc_num_01    test
   ${count_list_a}    BuiltIn.Get Length       ${list_a}
   ${count_list_b}    BuiltIn.Get Length       ${list_b}
   @{list}    BuiltIn.Create list
   FOR  ${index_a}  IN RANGE  0  ${count_list_a}    1
      FOR  ${index_b}  IN RANGE  0  ${count_list_b}    1
         ${data}    BuiltIn.Set Variable     ${list_a}[${index_a}]
         IF    ${data} == ${list_b}[${index_b}]
               Collections.Append to list    ${list}     ${data}
         ELSE
            log    skip!!
         END
      END
   END
   log    ${list}