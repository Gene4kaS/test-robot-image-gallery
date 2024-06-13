*** Settings ***
Documentation       Shall be possible to download the currently displayed region by just clicking on a button and choose the type which we need: jpeg, png, tiff. The output image should contain a footer with the EUMETSAT logo and timestamp of the selected layer.

Resource       ../Resources/TestSuite-Keywords.resource

Test Setup    Open NG GALLERY
Test Teardown    Close Browser


*** Test Cases ***   
Test-GUI-TC-040
    [Documentation]    Verify the download button.
    ...    The following steps are executed:
    ...    - Open the NG Gallery page
    ...    - Click on the drop down box
    ...    - Click on the product type 'MSGIODC Imagery'
    ...    - Click on the layer 'High Rate SEVIRI IR3.9 \u03bcm Image - MSG - Indian Ocean' 
    ...    - Click on the 'Download' button
    ...    - Verify that all types of images are exist ('jpg', 'png', 'tiff') 
    ...    - Click on the 'jpg' button
    # ...    - Press the ENTER for save the image
    # ...    - Open dowloaded image
    # ...    - Verify if picture has foor with Eumetsat logo, date and time of product layer
    
    Set Selenium Speed    ${SELENIUM_SPEED}
    Click Element    ${DROP_DOWN_BOX}
    Click Element    ${DROP_DOWN_BOX_PRODUCT_TYPE}//*[contains(text(),' MSGIODC Imagery ')]
    Click Element   ${LIST_BOX_LAYERS}//*[contains(text(),'High Rate SEVIRI IR3.9 \u03bcm Image - MSG - Indian Ocean')]
    Sleep    5s
    Capture Page Screenshot    filename=product-type-regions.png
    Click Element    ${DOWNLOAD_BUTTON}
    Wait Until Keyword Succeeds   ${RETRY_ATTEMPTS}   ${RETRY_INTERVAL}      Page Should Contain Element    ${DOWNLOAD_BUTTON_LIST}//*[contains(text(),'JPEG')]    ${DOWNLOAD_BUTTON_LIST}//*[contains(text(),'PNG')]    ${DOWNLOAD_BUTTON_LIST}//*[contains(text(),'TIFF')]
    Capture Page Screenshot    filename=dowload-button-list-image-type.png
    Click Element    ${DOWNLOAD_BUTTON_LIST}//*[contains(text(),'JPEG')]
    Sleep    20s
    # Wait Until Keyword Succeeds    ${RETRY_ATTEMPTS}   ${RETRY_INTERVAL}    File Should Exist    C:/Users/ysavchenko/Downloads/map
    # Press Keys    ${KEY_CTRL}+s
    # Wait Until Keyword Succeeds    ${RETRY_ATTEMPTS}   ${RETRY_INTERVAL}    File Should Exist    C:/Users/ysavchenko/Downloads/map.jpg
