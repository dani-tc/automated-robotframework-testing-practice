*** Settings ***
Resource    ../Resources/resources.robot

*** Test Cases ***
SECONDTEST
    [Tags]  demo2
    Log My Specific Username and Password    ${DICTIONARY2}[username]    ${DICTIONARY2}[password]
