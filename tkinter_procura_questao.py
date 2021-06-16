import PySimpleGUI as sg 
import re   
from fitz import *


class TelaPython:
    def __init__(self):
        sg.change_look_and_feel('LightBlue1')
        #layout
        layout = [
            [sg.Text("ano", size=(10,0)), sg.Input(size=(15,0), key='ano')],
            [sg.Text("pesquisa", size=(10,0)), sg.Input(size=(15,0), key='pesquisa')],
            [sg.Text("digite o ano da prova e as primeiras 5 palavras da questão")],
            [sg.Button("pesquisar")],
            [sg.Output(size=(50, 10))]
        ]
        self.janela = sg.Window("microdados Enem").layout(layout)

    def Iniciar(self):
        #dados necessarios
        #funçoes principais
        #enfiando dados
        #
        def procuraPDF(ano_prova, procura): 
            pdf = fitz.open('caderno_enem_{}.pdf'.format(ano_prova))
            paginas = pdf.pageCount
            listinha = []
            for i in range(0, paginas):
                pagina = pdf.loadPage(i)
                textop = pagina.getTextPage()
                texto = textop.extractText()
                if procura in texto:
                    x = texto.index(procura)
                    listinha = re.findall("Questao \d", texto)
                    if listinha == []:
                        listinha = re.findall("Questao \d\d", texto)
                        if listinha == []:
                            listinha = re.findall("Questao \d\d\d", texto)
                            if listinha == []:
                                listinha.append(texto[x-18:x-1])
                                if listinha == []:
                                    print('não encontrei! :( tente escrever exatamente o que está no texto')
            
            lista_do_numero = re.findall('\d', listinha[0])
            numero = ''
            if lista_do_numero[0] == 0:
                numero = numero + lista_do_numero[1]
            else:
                if len(lista_do_numero) == 1:
                    numero = lista_do_numero[0]
                elif len(lista_do_numero) == 2:
                    numero = lista_do_numero[0] + lista_do_numero[1]
                elif len(lista_do_numero) == 3:
                    numero = lista_do_numero[0] + lista_do_numero[1] + lista_do_numero[2]
            numero = int(numero)
            infos = [ano_prova, numero]
            return infos

        def acha_na_planilha(ano_prova, pesquisa_prova):
            infos = []
            dados = procuraPDF(ano_prova, pesquisa_prova)
            for i in range(1, planilha.max_row + 1):
                if planilha[i][1].value == dados[0] and planilha[i][2].value == dados[1]:
                    infos = [planilha[i][0].value, planilha[i][1].value, planilha[i][2].value, planilha[i][3].value, planilha[i][4].value, planilha[i][5].value, planilha[i][6].value]
            if infos == []:
                print('não deu! :(')
            else:
                print('APLICAÇÃO: ', infos[0])
                print('ANO: ', int(infos[1]))
                print('NÚMERO NA PROVA: ', int(infos[2]))
                print('GRANDE ÁREA: ', infos[3])
                print('COR DA PROVA: ', infos[4])
                print('GABARITO OFICIAL: ', infos[5])
                print('HABILIDADE: ', int(infos[6]))
                print(' ')
            
        pesquisa = [' ']
        while pesquisa != ['']:
           #janela
            #self.janela = sg.Window("microdados Enem").layout(layout)
            #extraindo dados da tela
            self.button, self.values = self.janela.Read()  
            ano_prova = int(self.values['ano'])
            pesquisa_prova = str(self.values['pesquisa'])
            resposta = acha_na_planilha(ano_prova, pesquisa_prova)
            

tela = TelaPython()
tela.Iniciar()
tela.refresh()
