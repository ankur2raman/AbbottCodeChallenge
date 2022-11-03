*** Settings ***
Library  SeleniumLibrary
Resource  ${EXECDIR}/Resources/Variable.robot
Resource  ${EXECDIR}/Resources/Landingpage.robot

*** Keywords ***
Accept Cookies
    ${present}=  Run Keyword And Return Status   Element Should Be Visible  //*[@id="truste-consent-button"]
    Run Keyword If  ${present}  Click Element  //*[@id="truste-consent-button"]

*** Test Cases ***
This is sample test
    [documentation]  Select Region
    [tags]  Functional Test
    Open Browser  https://pat.libreview.io/.  chrome
    Maximize Browser Window
    #Landingpage.Select country and language  ${SelectUS}  ${SelectEnglish}
    #Click Element  //*[@id="modalSubmit"]
    #Accept Cookies
    #Sleep  1s
    #Page Should Contain Element  //*[@id="patHeaderLink"]
    #Page Should Contain Element  //*[@id="proHeaderLink"]

    Landingpage.Select country and language  ${SelectFR}  ${SelectFrench}
    Click Element  ${Submit}
    Accept Cookies
    Sleep  1s
    Page Should Not Contain Element  ${PatientHeader}
    Page Should Not Contain Element  ${ProfessionalHeader}
    Close Browser



