*** Settings ***
Documentation    This file will handle all the operation related to patient finder page

Resource   ../common_functionality.resource

*** Variables ***
${FIN_LOCATOR}    fin
${AddNEWPATIENT_LOCATOR}    create_patient_btn1

*** Keywords ***
Switch To Fin Frame
    Select Frame    ${FIN_LOCATOR}

Click Add New Patient
    Click Element    ${AddNEWPATIENT_LOCATOR}
    
Switch Out From Fin Frame
    Unselect Frame        
