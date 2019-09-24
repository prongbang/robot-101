*** Settings ***
Library  SeleniumLibrary

*** Variables ***

*** Test Cases ***
ค้าหาคำว่าเหล็กไหล
    เข้าไปยังหน้าค้นหาของ Google
    ค้าหาเหล็กไหล
    จะต้้องเจอดูเหล็กไหล

*** Keywords ***
เข้าไปยังหน้าค้นหาของ Google
    Open Browser  http://www.google.com  headlesschrome
    # Open Browser  http://www.google.com  chrome

ค้าหาเหล็กไหล
    Input Text  name:q  ดูเหล็กไหล
    Press Keys  name:q  RETURN

จะต้้องเจอดูเหล็กไหล
    Wait Until Element Contains
    ...     xpath://*[@id="tvcap"]/div/div/div/div/h3/span      # Inspect -> click copy -> copy xpath
    ...     ดูเหล็กไหล
