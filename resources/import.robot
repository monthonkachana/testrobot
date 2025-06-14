*** Settings ***
Library        SeleniumLibrary
Library        AppiumLibrary            run_on_failure=No Operation
Library        pabot.PabotLib
Library        RequestsLibrary
Library        REST
Library        JSONLibrary
Library        Pdf2TextLibrary
Library        DatabaseLibrary
Library        OperatingSystem
Library        Collections
Library        DateTime
Library        String
Library        DebugLibrary
Library        ${CURDIR}/../resources/custom_library/custom_appium.py

#################################################################################################################


# ▒█▀▀█ ▒█▀▀▀█ ▒█▀▄▀█ ▒█▀▄▀█ ▒█▀▀▀█ ▒█▄░▒█ 
# ▒█░░░ ▒█░░▒█ ▒█▒█▒█ ▒█▒█▒█ ▒█░░▒█ ▒█▒█▒█ 
# ▒█▄▄█ ▒█▄▄▄█ ▒█░░▒█ ▒█░░▒█ ▒█▄▄▄█ ▒█░░▀█

#file

Resource       ${CURDIR}/../keywords/common/common_app.robot


#Utils
Library        ${CURDIR}/../keywords/common/utils/AdbUtils.py
Library        ${CURDIR}/../keywords/common/utils/AlphabetUtils.py
Library        ${CURDIR}/../keywords/common/utils/AppiumUtils.py
Library        ${CURDIR}/../keywords/common/utils/DateUtils.py
Library        ${CURDIR}/../keywords/common/utils/GeneralUtils.py
Library        ${CURDIR}/../keywords/common/utils/ImageUtils.py
Library        ${CURDIR}/../keywords/common/utils/JsonUtils.py

#translation
Variables        ${CURDIR}/translation/th.yaml

#settings
Variables        ${CURDIR}/settings/config.yaml
Variables        ${CURDIR}/settings/device_${env}.yaml


#################################################################################################################


# ▀▀█▀▀ ▒█▀▀▀ ▒█▀▀▀█ ▀▀█▀▀ 　 ▒█▀▀▄ ░█▀▀█ ▀▀█▀▀ ░█▀▀█ 
# ░▒█░░ ▒█▀▀▀ ░▀▀▀▄▄ ░▒█░░ 　 ▒█░▒█ ▒█▄▄█ ░▒█░░ ▒█▄▄█ 
# ░▒█░░ ▒█▄▄▄ ▒█▄▄▄█ ░▒█░░ 　 ▒█▄▄▀ ▒█░▒█ ░▒█░░ ▒█░▒█

#ui
Variables        ${CURDIR}/testdata/test_data.yaml


#################################################################################################################

#features
Resource        ${CURDIR}/../keywords/ui/features/app_minimal/ttb_features.robot

#locator
Resource        ${CURDIR}/../keywords/ui/locator/app_minimal/ttb_locator.robot

#pages
Resource        ${CURDIR}/../keywords/ui/pages/app_minimal/ttb_page.robot