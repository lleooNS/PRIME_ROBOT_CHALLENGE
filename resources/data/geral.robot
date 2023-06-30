*** Settings ***
Resource    ../main.robot

*** Variables ***
&{geral}
...     URL=https://cnes.datasus.gov.br/pages/estabelecimentos/consulta.jsp
...     BROWSER=chrome
...     NOME_ARQUIVO=LOCALIDADES.csv
