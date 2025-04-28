*** Settings ***
Library     SeleniumLibrary

*** Variables ***
#Constants
${BROWSER}              headlesschrome
${URL}                  https://www.saucedemo.com
${HOMEPAGE_TITLE}       Swag Labs

#Locators
${USERNAME_INPUT}   name:user-name
${PASSWORD_INPUT}   xpath://input[@id='password']
${LOGIN_BUTTON}     id:login-button

*** Keywords ***
Open My Browser
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    
Close Browsers
    Close All Browsers
    
Open Login Page
    Go To    ${URL}

Login To Application
    [Arguments]       ${USERNAME}  ${PASSWORD}
    Input Text        ${USERNAME_INPUT}    ${USERNAME}
    Input Password    ${PASSWORD_INPUT}    ${PASSWORD}
    Click Element     ${LOGIN_BUTTON}

Clear Login Inputs
    Clear Element Text    ${USERNAME_INPUT}
    Clear Element Text    ${PASSWORD_INPUT}

Get Error Message
    ${LOGIN_ERROR_MESSAGE}=      Get Text    xpath://*[@data-test='error']
    RETURN        ${LOGIN_ERROR_MESSAGE}