*** Settings ***
Documentation       This test verifies that the API functions retrieve list supported format.

Resource       ../Resources/TestSuite-2-Keywords.resource

Test Setup    Open API
Test Teardown    Close Browser


*** Test Cases ***   
Test-API-TC-050
    [Documentation]    Verify call endpoint and check that payload does contain formats data (jpeg, png, tiff).
    ...    The following steps are executed:
    ...    - Open the API page
    ...    - Call list-supported-formats   
    ...    - Verify if content length is greater than 0
    
    Create Session    API_testing    ${api_base_endpoint}
    ${get_response}  get on session  API_testing  list-supported-formats
    ${json_response}  set variable  ${get_response.json()}
    ${count}  get length  ${json_response['formats']}
    should be larger than  ${count}  0
    ${count}  get length  ${json_response['_links']}
    Should be larger than  ${count}  0

    