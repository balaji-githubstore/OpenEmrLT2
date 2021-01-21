*** Settings ***
Documentation    This file will handle all the operation related to login page

Resource   ../common_functionality.resource

*** Variables ***
${USERNAME_LOCATOR}    authUser
${PASSWORD_LOCATOR}    clearPass
${LANGUAGE_LOCATOR}    languageChoice
${LOGIN_LOCATOR}    //button[@type='submit']
${ERROR_LOCATOR}    //*[contains(text(),'Invalid')]

*** Keywords ***
Enter Username
    [Documentation]    Enters username \n
    ...    Examples \n
    ...    | Enter Username | balaji@gmail.com |
    [Arguments]    ${username}
    Input Text    ${USERNAME_LOCATOR}    ${username}
    
Enter Password
    [Arguments]    ${password}
    [Documentation]    Enters Password \n
    ...    Examples \n
    ...    | Enter Password | we123 |
    Input Password    ${PASSWORD_LOCATOR}    ${password}
    
Select Language
    [Arguments]    ${language}
    [Documentation]    Select Language \n
    ...    Examples \n
    ...    | Select Language | Dutch |
    Select From List By Label    ${LANGUAGE_LOCATOR}       ${language}
    
Click Login
    [Documentation]    Click Login
    Click Element     ${LOGIN LOCATOR}

Verify Error Message
    [Arguments]    ${errormessage}
    [Documentation]    Verify Error Message
    ...   Examples \n
    ...   | Verify Error Message | Invalid Username and Password |
    Element Should Contain    ${ERROR_LOCATOR}    ${errormessage}      
    

