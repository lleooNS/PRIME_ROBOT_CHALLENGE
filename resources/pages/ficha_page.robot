*** Settings ***
Resource    ../main.robot

*** Variables ***
&{ficha}
...     btn_impressora_xpath=/html/body/div[2]/main/div/div[3]/div[1]/header/nav/div/a
...     checkbox_ficha_completa_xpath=/html/body/div[2]/main/div/div[3]/div[3]/div/div/div/div/div[1]/div[2]/form/div/div[1]/div[1]/div/div/label/input
...     btn_imprimir_xpath=/html/body/div[2]/main/div/div[3]/div[3]/div/div/div/div/div[2]/button[1]


*** Keywords ***
Realizar o dowload da ficha

    [Arguments]             ${btn_ficha}        ${cnes}
    Click Element           ${btn_ficha}
    Sleep    5s
    Selecionar impressora
    Selecionar ficha completa
    Imprimir ficha
    Renomear arquivo        ${cnes}
    Retornar para a tabela

Selecionar impressora

    Click Link           xpath=${ficha.btn_impressora_xpath}
    Sleep    3s

Selecionar ficha completa

    Wait Until Element Is Visible               xpath=${ficha.checkbox_ficha_completa_xpath}
    Wait Until Element Is Enabled               xpath=${ficha.checkbox_ficha_completa_xpath}
    Click Element       xpath=${ficha.checkbox_ficha_completa_xpath}
    Sleep    3s

Imprimir ficha

    Wait Until Element Is Enabled           xpath=${ficha.btn_imprimir_xpath}
    Click Button            xpath=${ficha.btn_imprimir_xpath}
    Sleep    5s

Renomear arquivo

    [Arguments]             ${cnes}
    renomear_download       ${cnes}

Retornar para a tabela

    Go Back
    Go Back
    Sleep    3s
