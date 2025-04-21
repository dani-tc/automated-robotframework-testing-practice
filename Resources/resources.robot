*** Settings ***
Library     OperatingSystem

*** Variables ***
${MY-VARIABLE}      my test variable
${MY-VARIABLE2}     my second test variable

${GOOGLE-SEARCH-FIELD}  //input[@title="Search"]

@{LIST}   test1  test2  test3  test4

&{DICTIONARY}  username=testUser  password=demo
&{DICTIONARY2}  username=testUser2  password=demo2

*** Keywords ***
Log My Username
    [Arguments]     ${USERNAME}
    Log             ${USERNAME}

Log My Password
     [Arguments]    ${PASSWORD}
     Log    ${PASSWORD}

Log My Specific Username and Password
    [Arguments]         ${USERNAME}     ${PASSWORD}
    Log                 ${USERNAME}
    Log                 ${PASSWORD}