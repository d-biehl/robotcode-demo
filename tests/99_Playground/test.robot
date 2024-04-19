*** Variables ***
${blah}    ${None}

*** Test Cases ***
first
    Set Global Variable    ${blah}    123

second
    IF    not $blah    Fail    something wrong
    Log    ${blah}
