*** Settings ***
Documentation    This file contains browser activity keywords
...    and screenshot directory

Library    OperatingSystem    
Library    SeleniumLibrary    screenshot_root_directory=Screenshot    

*** Variables ***
${BROWSER_NAME}    chrome
${URL}    https://demo.openemr.io/b/openemr/interface/login/login.php?site=default


*** Keywords ***
Launch Browser
    Append To Environment Variable    Path     ${OUTPUT_DIR}${/}driver
    Open Browser    browser=${BROWSER_NAME}
    Maximize Browser Window
    Set Selenium Implicit Wait    30s
    Go To    url=${URL}
    
End Browser    
    # Capture Page Screenshot    
    Close Browser
    

