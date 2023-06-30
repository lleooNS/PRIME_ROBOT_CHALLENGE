from os import getcwd, rename, remove, makedirs
from os.path import isfile, exists
from pathlib import Path


def validar_diretorio_downloads():

    diretorio = str(Path(getcwd(), 'downloads'))

    if not exists(diretorio):
        makedirs(diretorio)


def retornar_full_path_downloads():

    return str(Path(getcwd(), 'downloads'))


def renomear_download(cnes):

    caminho_arquivos = str(Path(getcwd(), 'downloads'))
    nome_antigo = str(Path(caminho_arquivos, 'fichaCompletaEstabelecimento.pdf'))

    if isfile(nome_antigo):

        nome_atual = cnes + '.pdf'
        nome_novo = str(Path(caminho_arquivos, nome_atual))

        try:
            rename(nome_antigo, nome_novo)
        except Exception:
            remove(nome_antigo)
