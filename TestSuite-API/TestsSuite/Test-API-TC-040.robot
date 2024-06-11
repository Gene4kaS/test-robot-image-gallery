*** Settings ***
Documentation       This test verifies that the API functions retrieve coordinates for each region.

Resource       ../Resources/TestSuite-2-Keywords.resource

Test Setup    Open API
Test Teardown    Close Browser


*** Test Cases ***   
Test-API-TC-040
    [Documentation]    Verify call endpoint and check payload contains a dictionary with elements length 4 (for a valid coordinate)
    ...    The following steps are executed:
    ...    - Open the API page
    ...    - Call list-regions   
    ...    - Verify if the values all contain 4 values (valid coordinates for a box)
    
    Create Session    API_testing    ${api_base_endpoint}
    ${get_response}  get on session  API_testing  list-regions
    ${json_response}  set variable  ${get_response.json()}
    ${regions_count}  get length  ${json_response['regions']}
    Should Be Larger Than  ${regions_count}    0
    FOR  ${item}  IN  @{json_response['regions']}
    ${length}  get length  ${json_response['regions']['${item}']}
    should be equal  '${length}'  '4'
    END
    ${count}  get length  ${json_response['_links']}
    Should Be Larger Than  ${count}    0

    