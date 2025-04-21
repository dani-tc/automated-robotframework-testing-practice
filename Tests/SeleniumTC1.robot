*** Settings ***
Library     SeleniumLibrary
Resource    ../Resources/LoginKeywords.robot
Suite Setup         Open My Browser     https://www.saucedemo.com       chrome
Suite Teardown      Close All Browsers

*** Variables ***
#Data
${VALID_USERNAME}       standard_user
${INVALID_USERNAME}     test
${VALID_PASSWORD}       secret_sauce
${INVALID_PASSWORD}     test
${HOMEPAGE_TITLE}       Swag Labs

*** Keywords ***


*** Test Cases ***
Valid Login Test
    [Documentation]     Executable path is going to be deprecated
    # Set Selenium Speed    2 seconds
    # Set Selenium Timeout    10 seconds
    # ${TIME}=   Get Selenium Timeout
    Element Should Be Visible    ${USERNAME_INPUT}
    Element Should Be Enabled    ${USERNAME_INPUT}
    Login To Application    ${INVALID_USERNAME}    ${INVALID_PASSWORD}
    Wait Until Element Contains    xpath://*[@data-test='error']    Epic sadface: Username and password do not match any user in this service
    ${ERROR_MESSAGE}=        Get Error Message
    Log    ${ERROR_MESSAGE}
    Sleep    3
    Login To Application    ${VALID_USERNAME}       ${VALID_PASSWORD}
    Wait Until Element Contains    //*[@data-test='title']    Products      10 seconds
    Title Should Be    ${HOMEPAGE_TITLE}
    Execute Javascript      window.scrollTo(0,document.body.scrollHeight)
    Sleep    3
    Close Browser


