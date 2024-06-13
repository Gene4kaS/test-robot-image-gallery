*** Settings ***
Documentation       Each view should have their special list of layers.

Resource       ../Resources/TestSuite-Keywords.resource

Test Setup    Open NG GALLERY
Test Teardown    Close Browser


*** Test Cases ***   
Test-GUI-TC-030
    [Documentation]    Verify types of products with certain types of layers.
    ...    The following steps are executed:
    ...    - Open the NG Gallery page
    ...    - Click on the drop down box
    ...    - Click on the product type 'Meteosat 0 degree Imagery' (one of the type 0 degree)
    ...    - Verify that all layers of thet type exist
    ...    - Click on the product type 'MSGIODC RGB Composites' (one of the type 41 degree)
    ...    - Verify that all layers of thet type exist 
    
    Set Selenium Speed    ${SELENIUM_SPEED}
    Click Element    ${DROP_DOWN_BOX}
    Click Element    ${DROP_DOWN_BOX_PRODUCT_TYPE}//*[contains(text(),' Meteosat 0 degree Imagery ')]
    Wait Until Keyword Succeeds   ${RETRY_ATTEMPTS}   ${RETRY_INTERVAL}      Page Should Contain Element    ${LIST_BOX_LAYERS}//*[contains(text(),'High Rate SEVIRI IR3.9 μm Image - MSG - 0 degree')]    ${LIST_BOX_LAYERS}//*[contains(text(),'High Rate SEVIRI IR10.8 μm Image - MSG - 0 degree')]
    Capture Page Screenshot    filename=layers-products-type-0-degree.png
    Click Element    ${DROP_DOWN_BOX}
    Click Element    ${DROP_DOWN_BOX_PRODUCT_TYPE}//*[contains(text(),' MSGIODC RGB Composites ')]
    Wait Until Keyword Succeeds   ${RETRY_ATTEMPTS}   ${RETRY_INTERVAL}      Page Should Contain Element    ${LIST_BOX_LAYERS}//*[contains(text(),'Airmass RGB - MSG - Indian Ocean')]    ${LIST_BOX_LAYERS}//*[contains(text(),'Volcanic Ash RGB - MSG - Indian Ocean')]    ${LIST_BOX_LAYERS}//*[contains(text(),'Convection RGB - MSG - Indian Ocean')]
    Capture Page Screenshot    filename=layers-products-type-41-degree.png
