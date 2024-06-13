*** Settings ***
Documentation       This test validates the access to https://www.eumetsat.int/ selecting the EUMETSAT logo.

Resource       ../Resources/TestSuite-Keywords.resource

Test Setup    Open NG GALLERY
Test Teardown    Close Browser


*** Test Cases ***   
Test-GUI-TC-010
    [Documentation]    Validates if the EUMESAT logo hyperlink leads to the EUMETSAT corporate website.
    ...    The following steps are executed:
    ...    - Open the NG Gallery page
    ...    - Click on the EUMETSAT logo in the upper-left corner
    ...    - Verify if EUMETSAT corporate website open 
    
    Set Selenium Speed    ${SELENIUM_SPEED}
    Capture Page Screenshot    filename=NG-gallery-page.png
    Wait Until Keyword Succeeds   ${RETRY_ATTEMPTS}   ${RETRY_INTERVAL}      Page Should Contain Element    ${EUMETSAT_LOGO_BUTTON}
    Click Element    ${EUMETSAT_LOGO_BUTTON}
    Switch Window    NEW
    ${url}=    Get Location
    Should Be Equal As Strings    ${url}    https://www.eumetsat.int/
    Capture Page Screenshot    filename=EUMETSAT-corporate-page.png    
    # Close Window
    # Switch Window    title=NG Gallery
    