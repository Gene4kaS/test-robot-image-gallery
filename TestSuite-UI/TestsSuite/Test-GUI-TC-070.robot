*** Settings ***
Documentation       All layers shall be addressable with a dedicated URL.

Resource       ../Resources/TestSuite-1-Keywords.resource

Test Setup    Open NG GALLERY
Test Teardown    Close Browser


*** Test Cases ***   
Test-GUI-TC-050
    [Documentation]    Verify URL of the layers.
    ...    The following steps are executed:
    ...    - Open the NG Gallery page
    ...    - Click on the drop down box
    ...    - Click on the product type 'Meteosat 0 degree RGB Composites'
    ...    - Click on the layers 'Dust RGB - MSG - 0 degree'
    ...    - Copy current url
    ...    - Open new window and paste the url
    ...    - Verify that the url open the same context as the current
    
    Set Selenium Speed    ${SELENIUM_SPEED}
    Click Element    ${DROP_DOWN_BOX}
    Click Element    ${DROP_DOWN_BOX_PRODUCT_TYPE}//*[contains(text(),' Meteosat 0 degree RGB Composites ')]
    Sleep    3s
    Click Element   ${LIST_BOX_LAYERS}//*[contains(text(),'Dust RGB - MSG - 0 degree')]
    Sleep    3s
    Capture Page Screenshot    filename=image-of-layer-current-page.png
    ${url}=  Get Location
    Execute JavaScript  window.open("${url}", "_blank");
    Capture Page Screenshot    filename=image-of-layer-copied-page.png
