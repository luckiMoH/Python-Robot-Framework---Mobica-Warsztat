*** Settings ***
Documentation   Pierwsze testy!

*** Variables ***
${EXPECTED_TEXT}    Apple

*** Keywords ***
Should Be Equal with Log
    [Arguments]    ${actual}
        Log    Szukane słowo to: ${EXPECTED_TEXT}
        Should Be Equal    ${EXPECTED_TEXT}    ${actual}


*** Test Cases ***
Test Case
    Should Be Equal with Log    Kiwi
    Log To Console    I'm Done!


