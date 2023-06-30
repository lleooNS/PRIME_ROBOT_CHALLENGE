
# DESAFIO PRIME ROBOT

Este projeto foi desenvolvido e testado utilizando o `PyCharm` como IDE.

Foi utilizado o `Python` na versão = `3.8.3`

Foi utilizado o `Robot Framework`.

## INSTRUÇÕES

### INSTALAÇÃO

* Clonar o projeto.


* Acessar a pasta do projeto e criar uma virtual env. Assim será possível instalar somente as bibliotecas
que forem necessárias, isolando do sistema operacional.


* Abrir o terminal na raiz do projeto, ativando a venv criada.


* Excutar o comando abaixo para instalar todas as bibliotecas e dependências:

```{python}
pip install -r .\configs\requeriments.txt
```

### EXECUÇÃO

* Executar o projeto com o comando abaixo, gerando os arquivos de logs na pasta results:

```{python}
robot -d results suites/home/home.robot
```

## INFORMAÇÕES

* O arquivo de entrada `LOCALIDADES.csv` está localizado na raiz do projeto.


* Todos os arquivos .pdf baixados do site são armazenados na pasta `downloads`.


* Os dados extraídos das tabelas são imprimidos no console do terminal durante a execução do projeto.

## DECISÕES DE PROJETO

* O arquivo de entrada forneceu somente a sigla de cada estado, por exemplo `ES`.
Já no site utilizado, era necessário selecionar o estado com a descrição do nome por extenso = `ESPIRITO SANTO`.
Por este motivo, foi criado um dicionário para mapear os estados de entrada. Caso seja fornecido outro arquivo de entrada,
os novos estados deverão ser mapeados no código, assim como os seus respectivos municípios.

## MELHORIAS

* Mais tratamentos de erros devem ser acrescentados. A maior preocupação é com o timeout dos elementos.

* Infelizmente foram utilizados alguns Sleeps durante a implementação do código. O Robot Framework
oferece inúmeros tratamentos utilizando o `Wait`, mas seria necessário realizar o mapeamento com mais
calma.














