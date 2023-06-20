*** Settings ***
Library     osrm_test.py
*** Variables ***

*** Test Cases ***
OSRM TEST DISTANCE
            ${r}    Try Endpoint    %{osrm_test_host}  %{osrm_test_port}
            ${source data}=    Evaluate     json.loads("""${r}""")    json
            ${distance}=    Set Variable     ${source data['routes'][0]['distance']}
            IF      '''${r}''' != None
            Should Be True       ${distance} >= 0
            ELSE
            FAIL        \nImpossible to compute Request
            END
OSRM TEST TIME
       ${r}    Try Endpoint    %{osrm_test_host}  %{osrm_test_port}
            ${source data}=    Evaluate     json.loads("""${r}""")    json
            ${time}=    Set Variable     ${source data['routes'][0]['duration']}
            IF      '''${r}''' != None
            Should Be True        ${time} >= 0
            ELSE
            FAIL        \nImpossible to compute Request
            END