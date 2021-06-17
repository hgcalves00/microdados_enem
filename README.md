# microdados_enem

leitura_csv_no_R.R |
Usei esse script para criar um dataframe com os 0 e 1's gerados pela correção das provas de todos os alunos, de acordo com a cor da prova. 
Como exemplo, deixei as cores das provas de Ciências da Natureza.
O objetivo desse código é obter a matriz de 0 e 1's que a teoria de resposta ao item pede. 
A planilha utilizada é a que vem com o download dos microdados no site do INEP.

leitura_txt_prova.py | 
Supondo aqui que tenhamos a prova de 2015 em txt, é possível acessar a planilha a partir dos dados encontrados pela função de busca! 
É uma alternativa para as provas criptografadas. 
Todos os programas que fazem menção à planilha 'microdados.xlsx' dizem respeito ao arquivo deixado na pasta do projeto!

procura_pdf.py | 
É um script antigo, mas base dos outros que estão hoje mais atualizados.

procura_questao.py |
Um script do ano passado que procura dentro dos pdfs das provas do enem o número da questão de acordo com o início dela e seu respectivo ano. 
Com o retorno dessa função é possível jogar na planilha seu número e devolver informações relevantes como habilidade, gabarito oficial, aplicação, etc... 
A planilha está incompleta, e as provas dizem respeito somente às aplicações regulares. 
Além disso, é possível que em alguns pontos da planilha o gabarito esteja incorreto... mas com a planilha correta é possível fazer tudo, né? :)

tkinter_procura_questao.py |
Criei essa GUI no tkinter para visualizar o que eu encontro das questões, mas apresenta alguns erros ainda, tem muito tempo que implementei esse código!
