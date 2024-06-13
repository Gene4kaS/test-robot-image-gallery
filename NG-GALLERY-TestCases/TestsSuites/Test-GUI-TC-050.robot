*** Settings ***
Documentation       For the 41.5 degree and 0 degree should be their group of regions.

Resource       ../Resources/TestSuite-Keywords.resource

Test Setup    Open NG GALLERY
Test Teardown    Close Browser


*** Test Cases ***   
Test-GUI-TC-050
    [Documentation]    Each of type of imagery should have their group of regions.
    ...    The following steps are executed:
    ...    - Open the NG Gallery page
    ...    - Click on the drop down box
    ...    - Click on the product type 'MSGIODC Visualized Products' (one of the type 41 degree)
    ...    - Click on the layers 'Cloud Top Height – MSG – Indian Ocean'
    ...    - Verify if all regions are visualized
    ...    - Click on the product type 'Meteosat 0 degree RGB Composites' (one of the type 0 degree)
    ...    - Click on the layers 'Dust RGB – MSG – 0 degree'
    ...    - Verify if all regions are visualized
    
    Set Selenium Speed    ${SELENIUM_SPEED}
    Click Element    ${DROP_DOWN_BOX}
    Click Element    ${DROP_DOWN_BOX_PRODUCT_TYPE}//*[contains(text(),' MSGIODC Visualised Products ')]
    Sleep    3s
    Click Element   ${LIST_BOX_LAYERS}//*[contains(text(),'Cloud Top Height - MSG - Indian Ocean')]
    Capture Page Screenshot    filename=regions-for-41-degree-product-type.png
    Click Element    ${DROP_DOWN_BOX}
    Click Element    ${DROP_DOWN_BOX_PRODUCT_TYPE}//*[contains(text(),' Meteosat 0 degree RGB Composites ')]
    Sleep    3s
    Click Element   ${LIST_BOX_LAYERS}//*[contains(text(),'Dust RGB - MSG - 0 degree')]
    Capture Page Screenshot    filename=regions-for-0-degree-product-type.png
