***Settings
Library             SeleniumLibrary
Library             String
Resource            ../resource/sample-shared.robot
Suite Setup         Open Browser to google
Suite Teardown      Close Browser
Test Setup          Back to search page
Test Template       Search Template

***Variables


**Test Cases
#
#  Name                 |     Keyword       |   Expected result
#
Seatch robotframework       robotframework      robotframework
Seatch Kotlin               Kotlin              Kotlin

**Keywords
Search Template
    [Arguments]     ${keyword}      ${result}
    ค้าหาคำว่า        ${keyword} 
    ต้องเจอ          ${result}

ค้าหาคำว่า
    [Arguments]     ${keyword}
    Input Text  name:q  ${keyword}
    Press Keys  name:q  RETURN

ต้องเจอ
    [Arguments]     ${expectedResult}
    Wait Until Element Contains
    ...     //*[@id="brs"]/g-section-with-header/div[1]/h3      # Inspect -> click copy -> copy xpath
    ...     ${expectedResult}

    ${result}=  Get Text    class:med.dPAwzb

    Log To Console  ${\n}
    Log To Console  ${result}
    
    Should Be Equal     การค้นหาที่เกี่ยวข้องกับ ${expectedResult}      ${result}