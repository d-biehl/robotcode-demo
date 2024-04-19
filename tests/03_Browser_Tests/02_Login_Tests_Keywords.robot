*** Settings ***
Library     Browser


*** Test Cases ***
Login with correct data
    Open CarConfigurator
    Type Username    schulung01
    Type Password    @RBTFRMWRK@
    Click Login Button
    Verify Page    CarConfigurator    list

Login user with functional keywords
    Open CarConfigurator
    Login User    admin    @RBTFRMWRK@
    Verify Page    CarConfigurator    list

Login user with business keywords
    Start CarConfig as Administrator
    Verify Page    CarConfigurator    list


*** Keywords ***
Start CarConfig as Administrator
    [Tags]    business
    Open CarConfigurator
    Login User    admin    @RBTFRMWRK@

Login User
    [Tags]    functional
    [Arguments]    ${user}    ${pwd}
    Type Username    ${user}
    Type Password    ${pwd}
    Click Login Button

Type Username
    [Documentation]    Types the given \${username} into the username input element.
    [Tags]    technical
    [Arguments]    ${username}
    Type Text    id=input_username    ${username}

Type Password
    [Documentation]    Types the given \${password} into the password input element.
    [Arguments]    ${password}
    Type Text    id=input_password    ${password}

Click Login Button
    Click    id=button_login

Verify Page
    [Arguments]    ${Title}    ${url}
    Get Title    ==    ${Title}
    Get Url    $=    ${url}

Open CarConfigurator
    New Browser    headless=False
    New Context
    New Page    http://car.keyword-driven.de
