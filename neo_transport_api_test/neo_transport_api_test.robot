*** Settings ***
Library     neo_transport_api_test.py
*** Variables ***

*** Test Cases ***
TRANSPORT-API TEST
    ${r}    Try Endpoint     %{neo_transport_api_test_host}  %{neo_transport_api_test_port}
    IF      '''${r}''' != None
    Should Be True       isinstance(${r}, list) == True
    ELSE
    FAIL        \nImpossible to compute Request
    END