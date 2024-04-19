*** Variables ***
${x}    3

*** Test Cases ***
first

    Run Keywords    Log  Hi  AND  log  hello
    Run Keyword If  $x==1
    ...        Run Keywords  Log  Hello  AND  Log  World
    ...    ELSE IF  $x==2
    ...        Wait Until Keyword Succeeds  1s  2s  Log  Hi
    ...    ELSE
    ...        Log Many  This  is Wrong
