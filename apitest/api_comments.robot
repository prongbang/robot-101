*** Settings ***
Library    Collections
Library    RequestsLibrary
Library    String

*** Variables ***

*** Test Cases ***
Flow 1 
    ${firstComment}=    Get First Comments
    Log To Console      ${firstComment}
    Post Comments

*** Keywords ***
Get First Comments
    Create Session  api-comment   https://jsonplaceholder.typicode.com
    ${response}=  Get Request  api-comment  /comments

    # Status code = 200
    Should Be Equal     ${response.status_code}     ${200}
    Should Be Equal As Strings      ${response.status_code}     200

    # Check first comment
    ${length}=  Get Length   ${response.json()}
    Should Be Equal     ${length}               ${500}
    Length Should Be    ${response.json()}      500

    # Format of comment
    Should Be Equal     ${response.json()[0]["id"]}         ${1}
    Should Be Equal     ${response.json()[0]["email"]}      Eliseo@gardner.biz
    Should Contain Match    ${response.json()[0]}   id
    Should Contain Match    ${response.json()[0]}   postId
    Should Contain Match    ${response.json()[0]}   name
    Should Contain Match    ${response.json()[0]}   email
    Should Contain Match    ${response.json()[0]}   body

    [Return]    ${response.json()[0]}

Post Comments
    Create Session  api-comment   https://jsonplaceholder.typicode.com
    ${response}=  Post Request  api-comment  /comments
    Should Be Equal     ${response.status_code}     ${201}