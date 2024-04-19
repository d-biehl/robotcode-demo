*** Keywords ***
Given there are ${count} cucumbers
    Log    We have ${count} cucumber

Do Something before Test
    [Tags]    gherkin:before-scenario
    Log    this happens before test
