*** Settings ***
Resource    ../main.robot

*** Variables ***
&{home}
...     select_estado_xpath=/html/body/div[2]/main/div/div[2]/div/form[1]/div[2]/div[1]/div/select
...     select_municipio_xpath=/html/body/div[2]/main/div/div[2]/div/form[1]/div[2]/div[2]/div/select
...     btn_pesquisar_xpath=/html/body/div[2]/main/div/div[2]/div/form[2]/div/button
...     tabela_xpath=/html/body/div[2]/main/div/div[2]/div/div[3]/table
...     proxima_pagina_xpath=/html/body/div[2]/main/div/div[2]/div/div[3]/div/div/div/ul/li[11]/a
...     BA=BAHIA
...     RJ=RIO DE JANEIRO
...     SP=SAO PAULO
...     MG=MINAS GERAIS
...     PR=PARANA
...     Salvador=SALVADOR
...     Rio_de_Janeiro=RIO DE JANEIRO
...     São_Paulo=SAO PAULO
...     Belo_Horizonte=BELO HORIZONTE
...     Curitiba=CURITIBA

*** Keywords ***
Abrir o site

    validar_diretorio_downloads

    ${downloadPath}=     retornar_full_path_downloads

    ${prefs}   Create Dictionary     download.default_directory=${downloadPath}

    Open Browser    url=${geral.URL}    browser=${geral.BROWSER}
    ...   options=add_argument("--disable-web-security");add_argument("--start-maximized");add_experimental_option("detach", True);add_experimental_option('prefs', ${prefs})


Percorrer arquivo csv

    ${csv}    Get File    ${geral.NOME_ARQUIVO}
    @{read}     Create List    ${csv}
    @{lines}    Split To Lines    @{read}   1

    FOR    ${line}      IN      @{lines}
            @{split}    Split String    ${line}     ,

            ${column_0}     Set Variable    ${split}[0]
            ${column_1}     Set Variable    ${split}[1]

            Log To Console    Executando o estado = ${column_0}, município = ${column_1} ...${\n}

            Controlar execução      ${column_0}     ${column_1}
    END

    Fechar o site


Controlar execução

    [Arguments]     ${uf}        ${municipio}
    Selecionar estado       ${uf}
    Selecionar município        ${municipio}
    Clicar no botão pesquisar

    FOR     ${index}     IN RANGE        1       5
            Percorrer tabela
            Ir para a próxima página
            Sleep    2s
    END


Selecionar estado

    [Arguments]     ${uf}
    Wait Until Element Is Enabled           xpath=${home.select_estado_xpath}
    Wait Until Element Is Visible           xpath=${home.select_estado_xpath}
    Click Element                   xpath=${home.select_estado_xpath}
    Select From List By Label       xpath=${home.select_estado_xpath}       ${home.${uf}}


Selecionar município

    [Arguments]     ${municipio}
    Wait Until Element Is Enabled           xpath=${home.select_municipio_xpath}
    Wait Until Element Is Visible           xpath=${home.select_municipio_xpath}
    Click Element               xpath=${home.select_municipio_xpath}
    Select From List By Label       xpath=${home.select_municipio_xpath}       ${home.${municipio.replace(" ", "_")}}


Clicar no botão pesquisar

    Wait Until Element Is Enabled       xpath=${home.btn_pesquisar_xpath}
    Click Button    xpath=${home.btn_pesquisar_xpath}
    Sleep    10s


Percorrer tabela

    Wait Until Element Is Visible           xpath=${home.tabela_xpath}
    ${rows}=    Get Element Count       xpath=${home.tabela_xpath}/tbody/tr

    FOR    ${row_num}    IN RANGE    1    ${rows+1}
        Log To Console      Registro = ${row_num}

        Wait Until Element Is Visible       xpath=${home.tabela_xpath}/tbody/tr[${row_num}]
        ${colunas}      Set Variable        xpath=${home.tabela_xpath}/tbody/tr[${row_num}]
        Percorrer colunas da tabela         ${colunas}

        ${elemento_td_cnes}      Get Text      ${colunas}/td[3]

        Wait Until Element Is Enabled       xpath=${home.tabela_xpath}/tbody/tr[${row_num}]/td[8]/a
        Wait Until Element Is Visible       xpath=${home.tabela_xpath}/tbody/tr[${row_num}]/td[8]/a
        Realizar o dowload da ficha         xpath=${home.tabela_xpath}/tbody/tr[${row_num}]/td[8]/a         ${elemento_td_cnes}
    END


Percorrer colunas da tabela

    [Arguments]     ${colunas}

    ${elemento_td}      Get Text      ${colunas}/td[1]
    Log To Console      UF = ${elemento_td}

    ${elemento_td}      Get Text      ${colunas}/td[2]
    Log To Console      MUNICÍPIO = ${elemento_td}

    ${elemento_td}      Get Text      ${colunas}/td[3]
    Log To Console      CNES = ${elemento_td}

    ${elemento_td}      Get Text      ${colunas}/td[4]
    Log To Console      NOME FANTASIA = ${elemento_td}

    ${elemento_td}      Get Text      ${colunas}/td[5]
    Log To Console      NATUREZA JURÍDICA (GRUPO) = ${elemento_td}

    ${elemento_td}      Get Text      ${colunas}/td[6]
    Log To Console      GESTÃO = ${elemento_td}

    ${elemento_td}      Get Text      ${colunas}/td[7]
    Log To Console      ATENDE SUS = ${elemento_td}\n


Ir para a próxima página

    Click Link          xpath=${home.proxima_pagina_xpath}


Fechar o site

    Close All Browsers
