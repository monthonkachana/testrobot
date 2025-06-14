*** Settings ***
Resource         ${CURDIR}/../../../resource/import.robot

*** Variables ***
&{ttb_locator} 
...  input_username= xpath=//input[@id="username"]
...  input_password= xpath=//input[@id="password"]
...  button_login= xpath=//button[@type="submit"]
...  message_login_username_error= xpath=//div[@id="flash"][contains(.,'${message_status['message_login_username_error']}')]
...  message_login_password_error= xpath=//div[@id="flash"][contains(.,'${message_status['message_login_password_error']}')]
...  header_login_page= xpath=//h2[text()='Login Page']
...  message_login_success= xpath=//div[@id="flash"][contains(.,'${message_status['message_login_success']}')]
...  message_logout= xpath=//div[@id="flash"][contains(.,'${message_status['message_logout']}')]
...  button_logout= xpath=//a[@class="button secondary radius"][contains(.,'Logout')]