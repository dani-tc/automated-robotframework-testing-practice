*** Settings ***
Library     SeleniumLibrary
Variables   ../PageObjects/Locators/Locators.py

*** Keywords ***
Open My Browser
    [Arguments]     ${URL}    ${BROWSER}
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window

Close Browsers
    Close All Browsers

Open Login Page
    [Arguments]     ${URL}
    Go To    ${URL}

Login To Application
    [Arguments]       ${USERNAME}  ${PASSWORD}
    Input Text        ${UsernameInput}    ${USERNAME}
    Input Password    ${PasswordInput}    ${PASSWORD}
    Click Element     ${LoginButton}

Clear Login Inputs
    Clear Element Text    ${UsernameInput}
    Clear Element Text    ${PasswordInput}

Get Error Message
    ${LOGIN_ERROR_MESSAGE}=      Get Text    xpath://*[@data-test='error']
    RETURN        ${LOGIN_ERROR_MESSAGE}