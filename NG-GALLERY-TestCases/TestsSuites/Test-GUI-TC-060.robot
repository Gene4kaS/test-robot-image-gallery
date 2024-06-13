*** Settings ***
Documentation       The timeline shall keep a rolling buffer of 3 days of images history for every 15 minutes. The layers should be change with changing time. On the display should visualize the time which chosen.

Resource       ../Resources/TestSuite-Keywords.resource

Test Setup    Open NG GALLERY
Test Teardown    Close Browser


*** Test Cases ***   
Test-GUI-TC-050
    [Documentation]    Verify the timeline with the changeable layers depends on time.
    ...    The following steps are executed:
    ...    - Open the NG Gallery page
    ...    - Click on the drop down box
    ...    - Click on the product type 'MSGIODC Visualized Products'
    ...    - Click on the layers 'Cloud Top Height – MSG – Indian Ocean'
    ...    - Cupture screenshot of the layer for current time
    ...    - Click on the timeline time before 1 hour
    ...    - Cupture screenshot of the layer for that time 
    
    Set Selenium Speed    ${SELENIUM_SPEED}
    Click Element    ${DROP_DOWN_BOX}
    Click Element    ${DROP_DOWN_BOX_PRODUCT_TYPE}//*[contains(text(),' MSGIODC Visualised Products ')]
    Sleep    3s
    Click Element   ${LIST_BOX_LAYERS}//*[contains(text(),'Cloud Top Height - MSG - Indian Ocean')]
    Sleep    10s
    Capture Page Screenshot    filename=image-of-layer-current-time.png
    Click Element    ${TIMELINE_CURRENT_TIME_MINUS_HOUR}    
    Sleep    20s
    Capture Page Screenshot    filename=image-of-layer-current-time-minus-hour.png
