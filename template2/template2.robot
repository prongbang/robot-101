# Template each test

***Settings
Library             SeleniumLibrary
Library             String
# Resource          resource/sample.robot
Suite Setup         Open Browser to google
Suite Teardown      Close Browser
Test Setup          Back to search page
Default Tags        v1

***Variables
${URL}      http://www.google.com

**Test Cases
Search 
    [Tags]          v1
    [Template]      Search Template
    #   Keyword     |       Expected result
    robotframework      robotframework
    Kotlin              Kotlin
    Java                Java
    Golang              Golang

**Keywords
Search Template
    [Arguments]     ${keyword}      ${result}
    ค้าหาคำว่า        ${keyword} 
    ต้องเจอ          ${result}

ค้าหาคำว่า
    [Arguments]     ${keyword}
    Input Text  name:q  ${keyword}
    Press Keys  name:q  RETURN

Open Browser to google
    Open Browser  ${URL}  headlesschrome

Back to search page
    Go To   ${URL}

ต้องเจอ
    [Arguments]     ${expectedResult}
    Wait Until Element Contains
    ...     //*[@id="brs"]/g-section-with-header/div[1]/h3      # Inspect -> click copy -> copy xpath
    ...     ${expectedResult}

    ${result}=  Get Text    class:med.dPAwzb

    Log To Console  ${\n}
    Log To Console  ${result}
    
    Should Be Equal     การค้นหาที่เกี่ยวข้องกับ ${expectedResult}      ${result}