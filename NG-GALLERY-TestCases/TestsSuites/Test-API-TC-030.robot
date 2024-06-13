*** Settings ***
Documentation       This test verifies that if include the parameters (name of the layer) the API functions retrieve a time data.

Resource       ../Resources/TestSuite-Keywords.resource

Test Setup    Open API
Test Teardown    Close Browser


*** Test Cases ***   
Test-API-TC-030
    [Documentation]    Verify call endpoint and check that payload does contain time data
    ...    The following steps are executed:
    ...    - Open the API page
    ...    - Call list-available-times with a parameter  
    ...    - Verify that the response contains values  
    
    Create Session    API_testing    ${api_base_endpoint}
    ${params}=  create dictionary  layer=msg_iodc:rgb_natural
    ${get_response}  get on session  API_testing  list-available-times  params=${params}
    ${json_response}  set variable  ${get_response.json()}
    ${count}  get length  ${json_response['times']}
    Should Be Larger Than    ${count}   0
    ${count}  get length  ${json_response['_links']}
    Should Be Larger Than  ${count}    0

    