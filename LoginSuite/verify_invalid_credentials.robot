*** Settings ***
Documentation    This file test the valid credential detail

Library    DataDriver    file=../Testdata/Openemrdata.xlsx    sheet_name=Verify_Invalid_Credentials_Temp 

Resource    ../Resource/common_functionality.resource 
Resource    ../Resource/Pages/LoginPage.resource
  
Test Setup    Launch Browser
Test Teardown    End Browser

Test Template    Verify_Invalid_Credentials_Template

*** Test Cases ***
Verify_Invalid_Credentials_Test_${username}

*** Keywords ***
Verify_Invalid_Credentials_Template
    [Arguments]    ${username}    ${password}    ${language}    ${expectedvalue}   
    Enter Username    ${username}
    Enter Password    ${password}
    Select Language    ${language}   
    Click Login 
    Verify Error Message    ${expectedvalue}
    