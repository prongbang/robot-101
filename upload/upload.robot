*** Settings ***
Library     SeleniumLibrary

*** Test Cases ***
Upload File by Single
    Go to Web upload file
    Select Single File 01.jpg
    Select Single File 02.jpg
    Select Single File 03.jpg
    Validate File Queue length before upload file
    Validate File Name before upload file
    Validate File Size before upload file
    Upload File 01.jpg is Success
    Check Icon Status upload file 01.jpg is X
    Upload File 02.jpg is Success
    Check Icon Status upload file 02.jpg is X
    Upload File 03.jpg is Success
    Check Icon Status upload file 02.jpg is X

*** Keywords ***
Go to Web upload file
    # Open Browser  http://nervgh.github.io/pages/angular-file-upload/examples/simple/  headlesschrome
    Open Browser  http://nervgh.github.io/pages/angular-file-upload/examples/simple/  chrome

Select Single File 01.jpg
    Choose File   //*[@id="ng-app"]/body/div/div[2]/div[1]/input[2]     ${CURDIR}/images/01.jpg

Select Single File 02.jpg
    Choose File   //*[@id="ng-app"]/body/div/div[2]/div[1]/input[2]     ${CURDIR}/images/02.jpg

Select Single File 03.jpg
    Choose File   //*[@id="ng-app"]/body/div/div[2]/div[1]/input[2]     ${CURDIR}/images/03.jpg

Select Multiple File 01 - 03
    Choose File   //*[@id="ng-app"]/body/div/div[2]/div[1]/input[1]     ${CURDIR}/images/01.jpg
    Choose File   //*[@id="ng-app"]/body/div/div[2]/div[1]/input[1]     ${CURDIR}/images/02.jpg
    Choose File   //*[@id="ng-app"]/body/div/div[2]/div[1]/input[1]     ${CURDIR}/images/03.jpg

Validate File Queue length before upload file
    Wait Until Element Contains     //*[@id="ng-app"]/body/div/div[2]/div[2]/p  Queue length: 3

Validate File Name before upload file
    Wait Until Element Contains     //*[@id="ng-app"]/body/div/div[2]/div[2]/table/tbody/tr[1]/td[1]/strong  01.jpg
    Wait Until Element Contains     //*[@id="ng-app"]/body/div/div[2]/div[2]/table/tbody/tr[2]/td[1]/strong  02.jpg
    Wait Until Element Contains     //*[@id="ng-app"]/body/div/div[2]/div[2]/table/tbody/tr[3]/td[1]/strong  03.jpg

Validate File Size before upload file
    Wait Until Element Contains     //*[@id="ng-app"]/body/div/div[2]/div[2]/table/tbody/tr[1]/td[2]  0.07 MB
    Wait Until Element Contains     //*[@id="ng-app"]/body/div/div[2]/div[2]/table/tbody/tr[2]/td[2]  0.07 MB
    Wait Until Element Contains     //*[@id="ng-app"]/body/div/div[2]/div[2]/table/tbody/tr[3]/td[2]  0.23 MB

Upload File 01.jpg is Success
    Click Element   //*[@id="ng-app"]/body/div/div[2]/div[2]/table/tbody/tr[1]/td[5]/button[1]
    Wait Until Page Contains Element     //div[@style="width: 33%;"]

Upload File 02.jpg is Success
    Click Element   //*[@id="ng-app"]/body/div/div[2]/div[2]/table/tbody/tr[2]/td[5]/button[1]
    Wait Until Page Contains Element     //div[@style="width: 67%;"]

Upload File 03.jpg is Success
    Click Element   //*[@id="ng-app"]/body/div/div[2]/div[2]/table/tbody/tr[3]/td[5]/button[1]
    Wait Until Page Contains Element     //div[@style="width: 100%;"]

Check Icon Status upload file 01.jpg is X
    Wait Until Page Contains Element    //tr[1]/td[4]/span[3]/i[@class="glyphicon glyphicon-remove"]

Check Icon Status upload file 02.jpg is X
    Wait Until Page Contains Element    //tr[2]/td[4]/span[3]/i[@class="glyphicon glyphicon-remove"]

Check Icon Status upload file 03.jpg is X
    Wait Until Page Contains Element    //tr[3]/td[4]/span[3]/i[@class="glyphicon glyphicon-remove"]

Upload all
    Click Element   //*[@id="ng-app"]/body/div/div[2]/div[2]/div/button[1]

*** Variables ***