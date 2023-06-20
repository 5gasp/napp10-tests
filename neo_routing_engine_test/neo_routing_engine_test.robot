*** Settings ***
Library     neo_routing_engine_test.py
*** Variables ***

*** Test Cases ***
ROUTING-ENGINE-TEST
    ${r}    Try Endpoint     %{neo_routing_engine_test_option}  %{neo_routing_engine_test_host}  %{neo_routing_engine_test_port}
    ${source data}=    Evaluate     json.loads("""${r}""")    json
    ${status}=    Set Variable     ${source data['status']}

    IF      '''${r}''' != None
    Should Be True       '''${status}''' == '%{neo_routing_engine_test_output}'
    ELSE
    FAIL        \nImpossible to compute Request
    END