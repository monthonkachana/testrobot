*** Settings ***
Library     RequestsLibrary
Library     OperatingSystem
Library     Collections
Library     DateTime
Library     String
Library     DatabaseLibrary
Library    ExcelLibrary
Library     JSONLibrary
Library     SSHLibrary
Library     CSVLibrary
# Library  SignatureEncryptLibrary.py
Variables   configs/${ENV}/env_config.yaml
Variables   testdata/${ENV}/test_data.yaml
Variables   testdata/common/testdata.yaml
Variables   testdata/common_responsedata.yaml
Variables   configs/common_configs.yaml
Library     ../pythonlibs/ConnectionDB.py
Library     ../pythonlibs/StringKeyword.py
Library     ../pythonlibs/Decrypt_GPG.py
Resource    ../keywords/common_keyword.robot
Resource    ../keywords/common_keyword_GPG.robot
Resource    ../keywords/common_keyword_GPG_Morify.robot
Resource    ../keywords/common_keyword_Mule_Withdraw.robot
Resource    ../keywords/common_keyword_aoc.robot
Resource    ../keywords/common_db_keyword.robot
Resource    ../keywords/common_black_mule.robot
Library     ../pythonlibs/FileKeyword.py
Library     ../pythonlibs/gen-hash.py
Library   Process
# Library    CryptoLibrary    variable_decryption=True    password=myUnhashedPrivateKeyPassword