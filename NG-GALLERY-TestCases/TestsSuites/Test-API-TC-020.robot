*** Settings ***
Documentation       This test verifies that if not include the parameters of the API functions retrieve a 400 response

Resource       ../Resources/TestSuite-Keywords.resource

Test Setup    Open API
Test Teardown    Close Browser


*** Test Cases ***   
Test-API-TC-020
    [Documentation]    Test that retrieve-image fails when a layer is not specified.
    ...    The following steps are executed:
    ...    - Open the API page
    ...    - Call retrieve-image endpoint without required parameters 
    ...    - Verify if response code is 400  
    
    Create Session    API_testing    ${api_base_endpoint}
    ${get_response}=  run keyword and return status  get on session  API_testing  retrieve-image
    should be equal  '${get_response}'  'False'

    