*** Settings ***

*** Variables ***

#################################################  Selenium Settings  #################################################
${SELENIUM_WAIT}                               2 s
${SELENIUM_TIMEOUT}                            15 seconds
${SELENIUM_SPEED}                              0.5 seconds

#################################################  Application Settings  #################################################
${TIMEOUT}    10s
${TIMEOUT_60}    60s
${TIMEOUT_2m}    120s
${TIMEOUT_5m}    300s
${TIMEOUT_6m}    360s
${SLEEP_TIME}   3s
${RETRY_INTERVAL}    3s
${RETRY_INTERVAL_12}    12s
${RETRY_ATTEMPTS}    10x
${RETRY_ATTEMPTS_20}    40x

#################################################  Application Settings  #################################################
#URLS and endpoints
${NG_GALLERY_PAGE}  http://localhost:80/
${BROWSER}  chrome
${api_base_endpoint}  http://localhost:5000/ 
${DOWNLOAD_DIR}    Downloads
${EUMETSAT_LOGO_BUTTON}    xpath://*[@class='navbar-item']/a
${DROP_DOWN_BOX}    xpath://*[@class='mat-mdc-select-value']
${DROP_DOWN_BOX_PRODUCT_TYPE}    xpath://*[@id='cdk-overlay-0']
${LIST_BOX_LAYERS}    xpath://*[@role="listbox"]
${ZOOM_IN}    xpath://*[@class="ol-zoom-in"]
${ZOOM_OUT}    xpath://*[@class="ol-zoom-out"]
${DOWNLOAD_BUTTON}    xpath://mat-icon
${DOWNLOAD_BUTTON_LIST}    xpath://*[@class="mat-mdc-menu-content"]
${TIMELINE_CURRENT_TIME_MINUS_HOUR}    xpath://*[@id="timeline"]//div[@class='events']//li[last()-4]/a