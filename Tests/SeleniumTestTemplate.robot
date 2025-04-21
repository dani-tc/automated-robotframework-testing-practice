*** Settings ***
Library     SeleniumLibrary
Resource    ../Resources/login_resources.robot
Suite Setup         Open My Browser
Suite Teardown      Close All Browsers
Test Template       Invalid Login

*** Variables ***
#Data
${VALID_USERNAME}       standard_user
${INVALID_USERNAME}     test
${VALID_PASSWORD}       secret_sauce
${INVALID_PASSWORD}     test

*** Keywords ***
Invalid Login
    [Arguments]     ${USERNAME}     ${PASSWORD}
    Set Selenium Timeout    10 seconds
    Login To Application    ${USERNAME}    ${PASSWORD}
    Wait Until Element Contains    xpath://*[@data-test='error']    Epic sadface:
    Element Should Contain    xpath://*[@data-test='error']    Epic sadface:
    ${ERROR_MESSAGE}=        Get Error Message
    Log    ${ERROR_MESSAGE}
    Clear Login Inputs

*** Test Cases ***              username                password
Right user empty password       ${VALID_USERNAME}        ${EMPTY}
Right user wrong password       ${VALID_USERNAME}        ${INVALID_PASSWORD}
Wrong user right password       ${INVALID_USERNAME}      ${VALID_PASSWORD}
Wrong user empty password       ${INVALID_USERNAME}      ${EMPTY}
Wrong user wrong password       ${INVALID_USERNAME}      ${INVALID_PASSWORD}
