*** Settings ***
Library     TestLib    ${None}


*** Test Cases ***
first
    Increment
    ${v}    Get Value
