*** Settings ***
Library     Browser    strict=False    enable_presenter_mode=True


*** Test Cases ***
Example Test
    New Browser    chromium    headless=false

    New Page    https://github.com/
    Click    //input[@name="q"]
    Browser.Keyboard Input    insertText    robotcode
    Press Keys    //input[@name="q"]    Enter

    Click    text=d-biehl

    Click    text=robotcode

    Click    //input[@name="q"]
    Browser.Keyboard Input    insertText    robotframework
    Press Keys    //input[@name="q"]    Enter

    Sleep    5s
