*** Settings ***
Documentation    This file will handle all the operation related to search or add patient page

Resource   ../common_functionality.resource

*** Variables ***
${PAT_LOCATOR}    pat
${FIRSTNAME_LOCATOR}    form_fname
${LASTNAME_LOCATOR}    form_lname
${DOB_LOCATOR}    form_DOB
${GENDER_LOCATOR}    form_sex
${CREATEPATIENT_LOCATOR}    create
${MODAL_LOCATOR}    modalframe
${CONFIRMCREATENEWPATIENT_LOCATOR}    //input[@value='Confirm Create New Patient']
${CLOSEHBD_LOCATOR}    //div[@class='closeDlgIframe']
${RecordDashboard_LOCATOR}    //h2[contains(text(),'Record Dashboard')]

*** Keywords ***
Switch To Pat Frame
    Select Frame    ${PAT_LOCATOR}

Enter Firstname
    [Arguments]    ${fname}
    Input Text    ${FIRSTNAME_LOCATOR}    ${fname}    
    
Enter Lastname
    [Arguments]    ${lname}
    Input Text    ${LASTNAME_LOCATOR}    ${lname}    
  
Enter DOB
    [Arguments]    ${dob}
    Input Text    ${DOB_LOCATOR}    ${dob}    
    
Enter Gender
    [Arguments]    ${gender}
    Select From List By Label    ${GENDER_LOCATOR}    ${gender}
    
Switch Out From Pat Frame
    Unselect Frame 
    
Click Create Patient
    Click Element    ${CREATEPATIENT_LOCATOR}
    
Switch To Modal Frame
    Select Frame    ${MODAL_LOCATOR}
    
Click Confirm Create New Patient
    Click Element    ${CONFIRMCREATENEWPATIENT_LOCATOR}

Switch Out From Modal Frame
    Unselect Frame 
    
Validate and Handle Alert Message
    [Arguments]    ${alerttext}
    # Alert Should Be Present    ${alerttext}    timeout=30s
    ${actualtext}    Handle Alert    timeout=30s
    Should Contain    ${actualtext}    ${alerttext}    
    
Handle Happy Birthday Message
    Run Keyword And Ignore Error    Click Element    ${CLOSEHBD_LOCATOR}
    

Verify Add Patient Detail 
    [Arguments]    ${patientaddedname}
    Element Should Contain    ${RecordDashboard_LOCATOR}      ${patientaddedname}      
    

