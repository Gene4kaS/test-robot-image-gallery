*** Settings ***
Documentation       This test verifies that the API functions retrieve list of layers

Resource       ../Resources/TestSuite-Keywords.resource

Test Setup    Open API
Test Teardown    Close Browser


*** Test Cases ***   
Test-API-TC-060
    [Documentation]    Verify call endpoint and check that payload does contain layers data.
    ...    The following steps are executed:
    ...    - Open the API page
    ...    - Call list-layers    
    ...    - Verify if content length is greater than 0
    
    Create Session    API_testing    ${api_base_endpoint}
    ${get_response}  get on session  API_testing  list-layers
    ${json_response}  set variable  ${get_response.json()}
    ${count}  get length  ${json_response['configuration']}
    Should be larger than  ${count}  0
    ${count}  get length  ${json_response['_links']}
    Should be larger than  ${count}  0


    