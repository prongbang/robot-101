*** Settings ***
Library             SeleniumLibrary
Library             String

*** Variables ***
${URL}      https://www.kimschiller.com/page-object-pattern-tutorial/

*** Keywords ***
Open To Browser
    Open Browser  ${URL}  headlesschrome

Fill In Firstname "${firstname}"
    Input Text  id:firstname    ${firstname}

Fill In Lastname "${lastname}"
    Input Text  id:lastname    ${lastname}

Fill In Address "${address}"
    Input Text  id:address    ${address}

Fill In Zipcode "${zipcode}"
    Input Text  id:zipcode     ${zipcode}

SignUp
    Click Element   id:signup