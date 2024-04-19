*** Settings ***
Documentation       This is a test suite for the CarConfig application.

Library             Browser

Suite Setup         Open Browser    chromium    headless=True
Test Setup          Log Setup


*** Test Cases ***
Open CarConfig And Login
    New Browser    chromium    False
    New Context
    New Page    http://car.keyword-driven.de
    ${title}    Get Title
    Should Be Equal    ${title}    CarConfigurator
    Sleep    5s
