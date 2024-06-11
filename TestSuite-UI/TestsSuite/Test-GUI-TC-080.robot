*** Settings ***
Documentation       All regions shall be clickable and addressable with a dedicated URL.

Resource       ../Resources/TestSuite-1-Keywords.resource

Test Setup    Open NG GALLERY
Test Teardown    Close Browser


*** Test Cases ***   
Test-GUI-TC-050
    [Documentation]    Verify URL of the regions.
    ...    The following steps are executed:
    ...    - Open the NG Gallery page
    ...    - Click on the drop down box
    ...    - Click on the product type 'Meteosat 0 degree RGB Composites'
    ...    - Click on the layers 'Dust RGB - MSG - 0 degree'
    ...    - Click on the region of 'America'
    ...    - Copy current url
    ...    - Open new window and paste the url
    ...    - Verify that the url open the same context as the current
    
    Set Selenium Speed    ${SELENIUM_SPEED}
    Click Element    ${DROP_DOWN_BOX}
    Click Element    ${DROP_DOWN_BOX_PRODUCT_TYPE}//*[contains(text(),' Meteosat 0 degree RGB Composites ')]
    Sleep    3s
    Click Element   ${LIST_BOX_LAYERS}//*[contains(text(),'Dust RGB - MSG - 0 degree')]
    Click Element    #variable of path for region America
    Sleep    3s
    Capture Page Screenshot    filename=image-of-current-region.png
    ${url}=  Get Location
    Execute JavaScript  window.open("${url}", "_blank");
    Capture Page Screenshot    filename=image-of-copied-region.png
