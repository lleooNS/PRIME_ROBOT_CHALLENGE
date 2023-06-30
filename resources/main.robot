*** Settings ***
Library    SeleniumLibrary
Library    OperatingSystem
Library    String

### LIBRARIES ###
Library    ../libraries/helpers.py

### Data ###
Resource    data/geral.robot
Resource    data/chrome.robot

### Pages ###
Resource        pages/home_page.robot
Resource        pages/ficha_page.robot

### Shared ###
