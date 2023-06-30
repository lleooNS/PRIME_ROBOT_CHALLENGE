*** Settings ***
Resource    ../main.robot
Library    chromedriver_autoinstaller

*** Keywords ***

Configure ChromeDriver
    chromedriver_autoinstaller.Install