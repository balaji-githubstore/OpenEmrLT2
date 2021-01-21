*** Settings ***
Documentation    This file test the add patient feature

Resource    ../Resource/common_functionality.resource   

Resource    ../Resource/Pages/LoginPage.resource    
Resource    ../Resource/Pages/DashboardPage.resource
Resource    ../Resource/Pages/PatientFinderPage.resource
Resource    ../Resource/Pages/SearchOrAddPatientPage.robot

Test Setup    Launch Browser
Test Teardown    End Browser
*** Test Cases ***
Verify_Add_Patient_Test   
    Enter Username    admin
    Enter Password    pass
    Select Language    English (Indian)   
    Click Login
    
    #dashboard page
    MouserOver On Patient Client
    Click Patient
    
    # PatientFinderPage
    Switch To Fin Frame  
    Click Add New Patient   
    Switch Out From Fin Frame
    
    #SearchOrAddPatientPage
    Sleep    3s    
    Switch To Pat Frame
    Enter Firstname    bala
    Enter Lastname    dina
    Enter DOB    2021-01-19  
    Enter Gender    Male 
    Click Create Patient
    Switch Out From Pat Frame
    Switch To Modal Frame
    Click Confirm Create New Patient
    Switch Out From Modal Frame
    
    # ${alerttext}    Set Variable    New Due Clinical Reminders  Assessment: Tobacco   (See the Clinical Reminders widget for more details)
    
    Validate and Handle Alert Message    New Due Clinical Reminders
    # Validate and Handle Alert Message    ${alerttext}
    Handle Happy Birthday Message  
    Switch To Pat Frame    
    Verify Add Patient Detail    Medical Record Dashboard - Bala Dina
    Switch Out From Pat Frame
    

    







        
           