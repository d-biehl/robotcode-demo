*** Settings ***
Resource    variants.resource
Library    ${dd}/lib/playground.py    ${TEST_DICT_FROM_PY}
Library    Browser    AS    br



*** Variables ***
${variant}      a

*** Test Cases ***
first
    keyword variant a
    keyword variant b

    playground.Blahblahblah


*** Keywords ***
do something
    Log    Hello From Suite
