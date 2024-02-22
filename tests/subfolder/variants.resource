*** Settings ***
Variables    vars
Resource    variant_${variant}.resource

*** Variables ***
${variant}    a
${dd}    ${TEST_VAR_FROM_PY}
