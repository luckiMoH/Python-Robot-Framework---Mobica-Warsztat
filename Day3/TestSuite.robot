*** Settings ***
Documentation   Testy z sesji 3!

*** Variables ***
${EXPECTED_TEXT}    Apple

*** Keywords ***
Log Info
    [Arguments]    ${log_message}
        Log    ${log_message}
        
Log Info Delay
    [Arguments]    ${log_message}
    Log    ${log_message}
    Sleep    2 s

Log Warning
    [Arguments]    ${log_message}
        Log    ${log_message}   WARN
        
Keyword Fail
    Fail


*** Test Cases ***
Test o logowaniu INFO
    [Documentation]     Logowanie Info
    Log Info    To jest pierwszy test

Test o logowaniu WARNING
    [Documentation]     Logowanie WARN
    Log Warning     To jest pierwszy test z warningiem

Test z Repeat Keyword
    [Documentation]     Wykorzystanie Repeat Keyword
    Repeat Keyword    3 times   Log Info    Wykonuje 5 razy test logowania Info
    Keyword Fail
    Repeat Keyword    3 times   Log Warning    Wykonuje 5 razy test logowania Warn
    Repeat Keyword    10 s    Log Info Delay    Wykonuję test z opóźnieniem
    
Test z Repeat Keyword and Continue
    [Documentation]     Wykorzystanie Repeat Keyword
    Repeat Keyword    3 times   Log Info    Wykonuje 5 razy test logowania Info
    Run Keyword And Continue On Failure    Keyword Fail
    Repeat Keyword    3 times   Log Warning    Wykonuje 5 razy test logowania Warn
    Repeat Keyword    10 s    Log Info Delay    Wykonuję test z opóźnieniem

Test w Run Keyword If
    [Documentation]     Potestujemy IFa w RF
    Run Keyword If    '${EXPECTED_TEXT}'=='Apple'
    ...    Log Info    ${EXPECTED_TEXT} jest Jabłkiem
    ...  ELSE
    ...    Log Warning    ${EXPECTED_TEXT} nie jest jabłkiem


