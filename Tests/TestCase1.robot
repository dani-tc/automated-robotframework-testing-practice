# Mandatory section / Declare libraries
*** Settings ***
Documentation  This is my first test case
Resource    ../Resources/resources.robot

# Mandatory section
*** Test Cases ***
TEST
    [Tags]  demo    demo2
    Log    ${MY-VARIABLE}
    Log    ${LIST}[2]
    Log My Specific Username and Password    ${DICTIONARY}[username]    ${DICTIONARY}[password]

