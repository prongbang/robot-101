***Settings***
Library             SeleniumLibrary
Library             String
Suite Setup         เข้าไปยังหน้าค้นหาของ Google
Suite Teardown      Close Browser
Test Teardown       กลับไปยังหน้าค้นหา

**Variables***
${URL}      http://www.google.com

***Test Cases***
ค้าหาคำว่าเหล็กไหล
    [Tags]  Search1
    ค้าหาเหล็กไหล
    จะต้้องเจอดูเหล็กไหล

ค้าหาคำว่าไออุ่น
    [Tags]  Search3
    ค้าหาคำว่า        ไออุ่น        # Arguments

***Keywords***
กลับไปยังหน้าค้นหา
    Go To   ${URL}

เข้าไปยังหน้าค้นหาของ Google
    Open Browser  ${URL}  headlesschrome

ค้าหาคำว่า
    [Arguments]     ${keyword}
    Input Text  name:q  ${keyword}
    Press Keys  name:q  RETURN

ค้าหาเหล็กไหล
    Input Text  name:q  ดูเหล็กไหล
    Press Keys  name:q  RETURN

จะต้้องเจอดูเหล็กไหล
    Wait Until Element Contains
    ...     xpath://*[@id="tvcap"]/div/div/div/div/h3/span      # Inspect -> click copy -> copy xpath
    ...     ดูเหล็กไหล
    ${result}=  Get Text    id:resultStats
    @{resultSplit}=   Split String    
                ...     ${result}
                ...     separator=${SPACE}
                ...     max_split=3
    Log To Console  .
    Log To Console  0=>${resultSplit}[0]
    Log To Console  1=>${resultSplit}[1]
    Log To Console  2=>${resultSplit}[2]
    Log To Console  3=>${resultSplit}[3]

    Should Be Equal As Integers     100     ${100}
    Should Be Equal     ผลการค้นหาประมาณ     ${resultSplit}[0]
    Should Be Equal     รายการ     ${resultSplit}[2]

    ${cleanSpace}=     Remove String   ${resultSplit}[3]  ${SPACE}
    Should Start With   ${cleanSpace}   (
    Should End With     ${cleanSpace}   )
