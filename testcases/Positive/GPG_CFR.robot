*** Settings ***
Resource  ../../resources/imports.robot

*** Test Cases ***


TC001_000_001 DOWNLOAD FILE GPG By AOC
   [Documentation]    Test Case GPG
   Given Decrypt File GPG AOC and 1

TC001_000_002 DOWNLOAD FILE GPG By BANK
   [Documentation]    Test Case GPG
   Given Decrypt File GPG BANK and 1


TC001_000_003 Encrypt File
    Given Decrypt File GPG NITMX and CFR_GreyList_20241011_0_0000-1541
    Given Encrypt File GPG To NITMX CFR_GreyList_20241011_0_0000-1541