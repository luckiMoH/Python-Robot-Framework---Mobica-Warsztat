*** Settings ***
Documentation   Testy z sesji 3!

*** Variables ***
${EXPECTED_TEXT}    Apple

*** Test Cases ***
Tworzenie listy
    @{list} =   Create List     1   2   3   4   5   łoś
#    Length Should Be     ${list}    5
    Log Many    @{list}