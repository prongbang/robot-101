***Variables***

***Settings***
Library     SeleniumLibrary

***Test Cases***
Go to Compat View
    Open Browser    https://rdserver.rd.go.th/publish/index.php     chrome
    Click Element   //*[@id="menuList"]/li[3]/a
    Select Frame    //*[@id="lightboxdialog"]/p/iframe
    Click Link      คลิก
    Unselect Frame
    Click Element   //*[@id="lightboxdialog"]/button

***Keywords***
