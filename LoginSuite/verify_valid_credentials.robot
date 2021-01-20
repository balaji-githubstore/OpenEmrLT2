*** Settings ***
Documentation    This file test the valid credential detail

Resource    ../Resource/common_functionality.resource   
Resource    ../Resource/Pages/LoginPage.resource    
Resource    ../Resource/Pages/DashboardPage.resource

Test Setup    Launch Browser
Test Teardown    End Browser

Test Template    Verify_Valid_Credentials_Template
   
*** Test Cases ***
TC1    admin    pass    English (Indian)    Flow Board
TC2    physician    physician    English (Indian)    Flow Board  
TC3    accountant    accountant    English (Indian)    Flow Board    

*** Keywords ***
Verify_Valid_Credentials_Template
    [Arguments]    ${username}    ${password}    ${language}    ${expectedvalue}        
    Enter Username    ${username}
    Enter Password    ${password}
    Select Language    ${language}   
    Click Login
    Dashboard Page Should Contain    ${expectedvalue}
    MouserOver On Name
    Click Logout    
    



        
           