*** Settings ***
Documentation       This test validates the working zoom selecting the buttons.

Resource       ../Resources/TestSuite-Keywords.resource

Test Setup    Open NG GALLERY
Test Teardown    Close Browser


*** Test Cases ***   
Test-GUI-TC-020
    [Documentation]    Verify the overlap with several screen resolutions and zoom.
    ...    The following steps are executed:
    ...    - Open the NG Gallery page
    ...    - Click on the drop down box
    ...    - Verify if product type 'MSGIODC Visualised Products' exist
    ...    - Click on the product type 'MSGIODC Visualised Products'
    ...    - Verify if list box with layers exist
    ...    - Click on the layer 'Cloud Top Height - MSG - Indian Ocean'
    ...    - Verify if buttons 'zoom in' and 'zoom out' exist
    ...    - Click on the 'zoom in'
    ...    - Verify if button 'zoom in' shows globe with a zoom in
    ...    - Click on the 'zoom out'
    ...    - Verify if button 'zoom out' shows globe with a zoom out 
    
    Set Selenium Speed    ${SELENIUM_SPEED}
    Capture Page Screenshot    filename=NG-gallery-page.png
    Click Element    ${DROP_DOWN_BOX}
    Capture Page Screenshot    filename=drop-down-box.png
    Wait Until Keyword Succeeds   ${RETRY_ATTEMPTS}   ${RETRY_INTERVAL}      Page Should Contain Element    ${DROP_DOWN_BOX_PRODUCT_TYPE}//*[contains(text(),' MSGIODC Visualised Products ')]
    Click Element    ${DROP_DOWN_BOX_PRODUCT_TYPE}//*[contains(text(),' MSGIODC Visualised Products ')]
    Capture Page Screenshot    filename=drop-down-box-products-type.png
    Wait Until Keyword Succeeds   ${RETRY_ATTEMPTS}   ${RETRY_INTERVAL}      Page Should Contain Element    ${LIST_BOX_LAYERS}//*[contains(text(),'Cloud Top Height - MSG - Indian Ocean')]
    Click Element   ${LIST_BOX_LAYERS}//*[contains(text(),'Cloud Top Height - MSG - Indian Ocean')]
    Sleep    5s
    Capture Page Screenshot    filename=list-box-layers.png
    Wait Until Keyword Succeeds   ${RETRY_ATTEMPTS}   ${RETRY_INTERVAL}      Page Should Contain Element    ${ZOOM_IN}    ${ZOOM_OUT}
    Click Element     ${ZOOM_IN}   
    Click Element     ${ZOOM_IN}
    Sleep    5s
    Capture Page Screenshot    filename=zoom-in-two-clicks.png
    Click Element     ${ZOOM_OUT}   
    Click Element     ${ZOOM_OUT}
    Sleep    5s
    Capture Page Screenshot    filename=zoom-out-two-clicks.png
