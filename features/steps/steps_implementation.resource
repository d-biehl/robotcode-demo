*** Keywords ***
I have a simple feature
    Log    hello


start_browser
    [Tags]    gherkin:before-step
    Log    do something

I run it
    Log    run it

it should pass
    Log    passed
