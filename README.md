# microdados_enem

leitura_csv_no_R.R
usei esse script pra gerar um dataframe com os 0 e 1's gerados pela correção das provas de todos os alunos, de acordo com a cor da prova. 
como exemplo, deixei as cores das provas de ciências da natureza.
o objetivo desse código é obter a matriz de 0 e 1's que a teoria de resposta ao item pede. 

leitura_txt_prova.py
supondo aqui que tenhamos a prova de 2015 em txt, é possível acessar a planilha a partir dos dados encontrados pela função de busca! 
é uma alternativa para as provas criptografadas. 
todos os programas que fazem menção à planilha 'microdados.xlsx' dizem respeito ao arquivo deixado na pasta do projeto!

procura_pdf.py
é um script antigo, mas base dos outros que estão hoje mais atualizados.

procura_questao.py
um script do ano passado que procura dentro dos pdfs das provas do enem o número da questão de acordo com o início dela e seu respectivo ano. 
com o retorno dessa função é possível jogar na planilha seu número e devolver informações relevantes como habilidade, gabarito oficial, aplicação, etc... 
como tive que fazer tudo sozinha, a planilha está incompleta! e as provas dizem respeito somente às aplicações regulares. 
além disso, é possível que em alguns pontos da planilha o gabarito esteja incorreto... mas com a planilha correta é possível fazer tudo, né? :)

tkinter_procura_questao.py
criei essa GUI no tkinter pra visualizar o que eu encontro das questões, mas apresenta alguns erros ainda, tem muito tempo que implementei esse código!
