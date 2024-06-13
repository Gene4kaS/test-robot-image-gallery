*** Settings ***
Documentation       This test verifies that all the API functions retrieve a 200 response

Resource       ../Resources/TestSuite-Keywords.resource

Test Setup    Open API
Test Teardown    Close Browser


*** Test Cases ***   
Test-API-TC-010
    [Documentation]    Validate get all data to API and get response 200.
    ...    The following steps are executed:
    ...    - Open the API page
    ...    - Call list-layers endpoint
    ...    - Verify if response is True 
    ...    - Call list-regions endpoint
    ...    - Verify if response is True
    ...    - Call list-supported-formats endpoint
    ...    - Verify if response is True
    ...    - Call list-regions endpoint
    ...    - Verify if response is True
    ...    - Call add-parameter endpoint
    ...    - Verify if response is True
    ...    - Call retrieve-image endpoint
    ...    - Verify if response is True
    ...    - Call list-available-times endpoint
    ...    - Verify if response is True
    
    Create Session    API_testing    ${api_base_endpoint}
    ${get_response}  run keyword and return status  get on session  API_testing  /
    should be equal  '${get_response}'  'True'
    ${get_response}  run keyword and return status  get on session  API_testing  list-layers
    should be equal  '${get_response}'  'True'
    ${get_response}  run keyword and return status  get on session  API_testing  list-regions
    should be equal  '${get_response}'  'True'
    ${get_response}  run keyword and return status  get on session  API_testing  list-supported-formats
    should be equal  '${get_response}'  'True'
    ${get_response}  run keyword and return status  get on session  API_testing  add-parameter
    should be equal  '${get_response}'  'True'
    ${params}=  create dictionary  layer=msg_iodc:rgb_natural
    ${get_response}  run keyword and return status  get on session  API_testing  list-available-times  params=${params}
    should be equal  '${get_response}'  'True'
    ${params}=  create dictionary  layer=msg_iodc:rgb_natural
    ${get_response}  run keyword and return status  get on session  API_testing  retrieve-image  params=${params}
    should be equal  '${get_response}'  'True'
    