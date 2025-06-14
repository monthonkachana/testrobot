*** Settings ***
Library        SeleniumLibrary
Library        String
Library        OperatingSystem
Library        Collections
Library        DatabaseLibrary
Library        pymysql
Library        DateTime
Library        ExcelLibrary
Library        ExcelRobot
Library        REST
Library        RequestsLibrary
#Dobby
Resource       DobbyCommonLibrary/DobbyCommon.robot
Resource       DobbyCommonLibrary/DobbyWebCommon.robot

#api
Resource      ${CURDIR}/../keywords/web/api/ttb_api.robot

#common
Resource      ${CURDIR}/../keywords/web/common/common.robot

#feature
Resource      ${CURDIR}/../keywords/web/features/ttb_feature .robot

#page
Resource      ${CURDIR}/../keywords/web/pages/ttb_page.robot

#locator
Resource      ${CURDIR}/../keywords/web/locator/ttb_locator.robot

#menu

#database

#test_data 
Variables     ${CURDIR}/testdata/test_data.yaml

#setting
Variables     ${CURDIR}/settings/setting.yaml

#th
Variables     ${CURDIR}/translation/th.yaml

