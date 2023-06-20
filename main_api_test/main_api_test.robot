*** Settings ***
Library     main_api_test.py
*** Variables ***

*** Test Cases ***
MAIN API TEST
    ${r}    Try Endpoint     %{main_api_test_host}  %{main_api_test_port}
    IF      '''${r}''' != None
    Should Be True       '''${r}''' != 'ERROR'
    ELSE
    FAIL        \nImpossible to compute Request
    END