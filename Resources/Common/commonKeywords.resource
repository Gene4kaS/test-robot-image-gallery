*** Settings ***
Resource           ./commonLibraries.resource
Resource           ./commonVariables.resource


*** Keywords ***
Setup chrome
    [Documentation]    Configure the google chrome webdriver
    ${options_chrome}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Call Method    ${options_chrome}    add_argument    no-sandbox
    Call Method    ${options_chrome}    add_argument    headless
    Call Method    ${options_chrome}    add_argument    enable-automation
    Call Method    ${options_chrome}    add_argument    disable-gpu
    Call Method    ${options_chrome}    add_argument    force-device-scale-factor\=0.65
    Log    ${EXECDIR}   
    Create Webdriver    driver_name=Chrome    executable_path=${EXECDIR}/Runners/chromedriver.exe    chrome_options=${options_chrome}
    Set Window Size    1920    1080

Open NG GALLERY
    [Documentation]    Open the web browser passed as argument (default browser is chrome) and open the NG GALLERY webpage
    [Arguments]    ${browser}=${BROWSER}    ${ng_galleryl_page}=${NG_GALLERY_PAGE}
    Run Keyword    Setup ${browser}
    Go To    ${ng_galleryl_page}
    Capture Page Screenshot    filename=ng-gallery-main-page.png

Open API
    [Documentation]    Open the web browser passed as argument (default browser is chrome) and open the API page
    [Arguments]    ${browser}=${BROWSER}    ${ng_api_page}=${api_base_endpoint}
    Run Keyword    Setup ${browser}
    Go To    ${ng_api_page}
    Capture Page Screenshot    filename=ng-api-page.png


Should Be Larger Than
    [Arguments]    ${value_1}    ${value_2}
    Run Keyword If    ${value_1} <= ${value_2}    
    ...    Fail    The value ${value_1} is not larger than ${value_2}