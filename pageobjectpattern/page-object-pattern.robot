# Page Object Pattern Test

*** Settings 
Library             SeleniumLibrary
Library             String
Library             FakerLibrary
Resource            pages/signup_page.robot
Resource            pages/thank_page.robot

*** Variables

*** Test Cases
นายโปร่งบางทำการสมัครสมาชิกในระบบ
    Loop
    กรอกชื่อ "prong" นามสกุล "bang"
    กรอกที่อยู่ "Bangkok, Thailand" "10400"
    ทำการส่งข้อมูลการสมัคร
    สมัครสำเร็จ ต้องแสดงคำว่า "Thank you!"

*** Keywords

Loop    
    FOR     ${index}    IN RANGE   1   11
        ${name}=    Name Male
        Log to Console      ${index}=>${name}
    END

กรอกชื่อ "${firstname}" นามสกุล "${lastname}"
    signup_page.Open To Browser
    signup_page.Fill In Firstname "${firstname}"
    signup_page.Fill In Lastname "${lastname}"

กรอกที่อยู่ "${address}" "${zipcode}"
    signup_page.Fill In Address "${address}"
    signup_page.Fill In Zipcode "${zipcode}"

ทำการส่งข้อมูลการสมัคร
    signup_page.SignUp

สมัครสำเร็จ ต้องแสดงคำว่า "${message}"
    thank_page.ThankYou ${message}

