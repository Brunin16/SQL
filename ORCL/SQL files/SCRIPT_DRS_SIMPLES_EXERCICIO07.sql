/*
1.) Escreva e execute a instru��o SQL, para realizar a consulta na tabela PROJETO.
Liste todos os projetos finalizados, a partir de 01/08/2018.
A lista deve ser apresentada de forma ordenada pela data t�rmino do projeto, em ordem
decrescente.
Mostrar: c�digo, nome, data in�cio e data t�rmino o projeto.
Apresentar a coluna data t�rmino com o apelido �Finalizado em:�.
*/

  SELECT CD_PROJETO, NM_PROJETO, DT_INICIO, DT_TERMINO "FINALIZADO EM:"
    FROM T_SIP_PROJETO
   WHERE DT_TERMINO IS NOT NULL
         AND DT_TERMINO >= TO_DATE('01/08/2018','DD/MM/YYYY')
ORDER BY DT_TERMINO DESC;

/*
2.) Escreva e execute a instru��o SQL, para realizar a consulta na tabela PROJETO.
Liste todos os projetos n�o finalizados, que tiveram in�cio a partir de 01/05/2015.
A lista deve ser apresentada de forma ordenada pela data de in�cio do projeto, em ordem
crescente.
Mostrar: c�digo, nome, data in�cio e data t�rmino do projeto.
Apresentar a coluna data in�cio com o apelido �Iniciado em:�.
*/

  SELECT CD_PROJETO, NM_PROJETO, DT_INICIO AS "Iniciado em:", DT_TERMINO
    FROM T_SIP_PROJETO
   WHERE DT_TERMINO IS NULL AND DT_INICIO >= TO_DATE('01/05/2015','DD/MM/YYYY')
ORDER BY DT_INICIO;

/*
3.) Escreva e execute a instru��o SQL, para realizar a consulta na tabela IMPLANTACAO.
Liste todas as implanta��es que possuem funcion�rios ativos, realizando atividades para um
determinado projeto.
A lista deve ser apresentada de forma ordenada por c�digo do projeto, n�mero de matr�cula
do funcion�rio e data de entrada, todos crescentes.
Mostrar: c�digo da implanta��o, c�digo do projeto, n�mero de matr�cula do funcion�rio, data
de entrada e data de sa�da do funcion�rio.
*/

SELECT CD_IMPLANTACAO, CD_PROJETO, NR_MATRICULA, DT_ENTRADA, DT_SAIDA
  FROM T_SIP_IMPLANTACAO
 WHERE DT_SAIDA IS NULL
ORDER BY CD_PROJETO, NR_MATRICULA, DT_ENTRADA;

/*
4.) Escreva e execute a instru��o SQL, para realizar a consulta na tabela IMPLANTACAO.
Liste todas as implanta��es finalizadas por funcion�rios.
A lista deve ser apresentada de forma ordenada por c�digo do projeto, n�mero de matr�cula
do funcion�rio em ordem crescente e data da sa�da em ordem decrescente.
Mostrar: c�digo da implanta��o, c�digo do projeto, n�mero de matr�cula do funcion�rio, data
de entrada e data de sa�da do funcion�rio.
Apresentar a coluna data in�cio, com o apelido �In�cio em:�.
Apresentar a coluna data t�rmino, com o apelido �Conclus�o:�.
*/

  SELECT CD_IMPLANTACAO, CD_PROJETO, NR_MATRICULA, DT_ENTRADA AS "IN�CIO EM:", DT_SAIDA AS "CONCLUSAO:"
    FROM T_SIP_IMPLANTACAO
   WHERE DT_SAIDA IS NOT NULL
ORDER BY CD_PROJETO, NR_MATRICULA, DT_SAIDA DESC;

/*
5.) Escreva e execute a instru��o SQL, para realizar a consulta na tabela IMPLANTACAO.
Liste quais funcion�rios participam ou j� participaram de implanta��es (em andamento ou
finalizadas).
Apresente o n�mero de matr�cula do funcion�rio, sem repeti��o.
Mostrar: n�mero de matr�cula do funcion�rio.
Apresentar a coluna n�mero de matr�cula do funcion�rio, com o apelido �Funcion�rio�.
*/
  SELECT DISTINCT NR_MATRICULA AS "Funcion�rios"
    FROM  T_SIP_IMPLANTACAO
   ORDER BY NR_MATRICULA;
   
/*
6.) Escreva e execute a instru��o SQL, para realizar a consulta na tabela NOTA_FISCAL.
Liste quem s�o os clientes que realizaram alguma compra em nossa loja virtual.
A lista deve ser apresentada de forma ordenada por c�digo do cliente, em ordem crescente.
Apresente o c�digo do cliente, sem repeti��o.
Mostrar: c�digo do cliente, com o apelido �Cliente�.
*/
 SELECT DISTINCT CD_CLIENTE AS "CLIENTE"
    FROM T_SPV_NOTA_FISCAL
    ORDER BY CD_CLIENTE;
/*
7)Escreva e execute a instru��o SQL, para realizar a consulta na tabela NOTA_FISCAL.
Liste todas as notas fiscais, pertencentes ao cliente de c�digo igual a 1, emitidas a partir de
15/08/2014.
A lista deve ser apresentada de forma ordenada por data da emiss�o, em ordem crescente.
Mostrar: c�digo do cliente, n�mero da nota fiscal, data da emiss�o e valor total da nota fiscal
*/
  SELECT CD_CLIENTE  "c�digo do cliente", NR_NOTA_FISCAL "n�mero da nota fiscal",DT_EMISSAO "data da emiss�o",VL_TOTAL_NT_FISCAL "valor total da nota fiscal"
    FROM T_SPV_NT_FISC
   WHERE CD_CLIENTE = 1 AND DT_EMISSAO > TO_DATE('15/08/2014','DD/MM/YYYY')
ORDER BY DT_EMISSAO ASC;
/*
8.) Escreva e execute a instru��o SQL, para realizar a consulta na tabela NOTA_FISCAL.
Liste todas as notas fiscais, emitidas entre �01/08/2019� e �31/08/2019� (inclusive as
extremidades), que n�o tenham desconto concedido.
A lista deve ser apresentada de forma ordenada por data da emiss�o, em ordem
decrescente.
Mostrar: n�mero da nota fiscal, data da emiss�o, valor total da nota fiscal e valor do
percentual de desconto.
Utilizar o operador especial BETWEEN para a condi��o referente a data da emiss�o.
*/
     SELECT NR_NOTA_FISCAL "NUMERO DA NOTA FISCAL", 
       DT_EMISSAO "DATA DA EMISS�O", 
       VL_TOTAL_NT_FISCAL "VALOR TOTAL", 
       VL_DESCONTO "VALOR DESCONTO"
       FROM T_SPV_NT_FISC
      WHERE DT_EMISSAO BETWEEN TO_DATE('01/08/2019', 'DD/MM/YYYY') 
AND TO_DATE('31/08/2019', 'DD/MM/YYYY') AND VL_DESCONTO = 0
   ORDER BY DT_EMISSAO DESC;

/*
9.) Escreva e execute a instru��o SQL, para realizar a consulta na tabela NOTA_FISCAL.
Liste todas as notas fiscais, que tenham algum desconto concedido.
A lista deve ser apresentada de forma ordenada pelo valor do percentual de desconto, em
ordem decrescente.
Mostrar: n�mero da nota fiscal, data da emiss�o, valor total da nota fiscal e valor do
percentual de desconto.
*/
    SELECT NR_NOTA_FISCAL,DT_EMISSAO,VL_TOTAL_NT_FISCAL,VL_DESCONTO
      FROM T_SPV_NT_FISC
     WHERE VL_DESCONTO > 0
     ORDER BY vl_desconto DESC;
/*
10.)Escreva e execute a instru��o SQL, para realizar a consulta na tabela NOTA_FISCAL.
Liste todas as notas fiscais, emitidas em 2019, que possuam o valor total da nota fiscal,
superior a R$ 1000.00.
Nesta lista, deve ser apresentado o valor do desconto concedido, atrav�s do c�lculo:
Valor total da nota fiscal * (valor do percentual de desconto / 100)
A lista deve ser apresentada de forma ordenada pelo valor do desconto concedido
(calculado), em ordem decrescente.
Mostrar: n�mero da nota fiscal, data da emiss�o, valor total da nota fiscal, valor do percentual
de desconto e o resultado do c�lculo do valor do desconto concedido.
Utilizar a fun��o TO_CHAR(<conte�do>, <formato>) para extrair o ano data, para utilizar no
momento do filtro da consulta.
Apresentar a coluna valor do percentual de desconto, com o apelido �% Desconto�.
Apresentar a coluna c�lculo do valor de desconto concedido, com o apelido �Valor do
desconto�. 
*/
SELECT
    NR_NOTA_FISCAL "N�mero da Nota Fiscal",
    dt_emissao "Data de Emiss�o",
    VL_TOTAL_NT_FISCAL "Valor total da Nota Fiscal",
    vl_desconto "% Desconto",
    (VL_TOTAL_NT_FISCAL * (vl_desconto)/100) "Valor do desconto"
    FROM t_spv_NT_FISC
WHERE TO_CHAR(dt_emissao, 'YYYY') IN ('2019') AND VL_TOTAL_NT_FISCAL > 1000;
/*
11.)Escreva e execute a instru��o SQL, para realizar a consulta na tabela ITEM_NOTA_FISCAL.
Liste todos os itens da nota fiscal de n�mero: 1235.
Nesta lista, deve ser apresentado o valor do item, atrav�s do c�lculo:
Valor do item = quantidade vendida * valor do pre�o unit�rio
Mostrar: n�mero da nota fiscal, c�digo do produto, quantidade vendida, pre�o unit�rio e o
resultado do c�lculo do valor de cada item.
Apresentar a coluna c�lculo do valor de cada item, com o apelido �Valor do item�. 
*/

SELECT NR_NOTA_FISCAL,
       CD_PRODUTO,
       QT_ITEM_VENDIDA,
       VL_PRECO_UNIT,
       QT_ITEM_VENDIDA * VL_PRECO_UNIT "VALOR DO ITEM" 
FROM T_SPV_ITEM_NTFISC
WHERE NR_NOTA_FISCAL = 1235;

/*
12.)Escreva e execute a instru��o SQL, para realizar a consulta na tabela NOTA_FISCAL.
Liste todas as notas emitidas no ano 2019 ou 2020 e que possuem valor total da nota fiscal
inferior a R$ 900.00.
A lista deve ser apresentada de forma ordenada pela data de emiss�o, em ordem
decrescente.
Mostrar: n�mero da nota fiscal, data da emiss�o, valor total da nota fiscal e o valor do
percentual de desconto.
Utilizar a fun��o TO_CHAR(<conte�do>, <formato>) para extrair o ano data, para utilizar no
momento do filtro da consulta.
Utilizar o operador especial IN(<lista de valores>) para validar o ano da data, ao realizar a
condi��o de filtro da consulta.
*/

  SELECT NR_NOTA_FISCAL, DT_EMISSAO, VL_TOTAL_NT_FISCAL, VL_DESCONTO
    FROM T_SPV_NT_FISC
   WHERE TO_CHAR(DT_EMISSAO,'YYYY') IN('2019','2020') AND VL_TOTAL_NT_FISCAL < 900
ORDER BY DT_EMISSAO DESC;

/*
13.)Escreva e execute a instru��o SQL, para realizar a consulta na tabela NOTA_FISCAL.
Liste todas as notas emitidas nos dias da semana: 6= sexta-feira e 7=s�bado.
A lista deve ser apresentada de forma ordenada pela data de emiss�o, em ordem
decrescente.
Mostrar: n�mero da nota fiscal, data da emiss�o e valor total da nota fiscal.
Utilizar a fun��o TO_CHAR(<conte�do>, <formato>) para extrair o dia da data, ao realizar a
condi��o de filtro da consulta. O formato utilizado ser� o �D� � Dia da semana de uma data.
Utilizar o operador especial IN(<lista de valores>) para validar o dia da semana da data, ao
realizar a condi��o de filtro da consulta.
*/
  SELECT NR_NOTA_FISCAL, DT_EMISSAO, VL_TOTAL_NT_FISCAL
    FROM T_SPV_NT_FISC
   WHERE TO_CHAR(DT_EMISSAO,'D') IN('6','7') 
ORDER BY DT_EMISSAO DESC;
/*
14.)Escreva e execute a instru��o SQL, para realizar a consulta na tabela PRODUTO.
Liste todos os produtos em estoque.
Nesta lista, deve ser apresentado o valor do estoque do produto, atrav�s do c�lculo:
Valor do estoque do produto = quantidade estoque * valor do pre�o unit�rio
A lista deve ser apresentada de forma ordenada pelo valor em estoque do produto calculado,
em ordem decrescente.
Mostrar: c�digo do produto, descri��o do produto, quantidade em estoque, pre�o unit�rio do
produto e o resultado do c�lculo do valor do estoque do produto.
Apresentar a coluna c�lculo do valor do estoque do produto, com o apelido �Valor em
Estoque do Produto�.
*/
SELECT CD_PRODUTO,DS_PRODUTO,QT_ESTOQUE,VL_PRECO_UNIT, VL_PRECO_UNIT * QT_ESTOQUE "Valor em Estoque do Produto"
  FROM T_SPV_PRODUTO
ORDER BY "Valor em Estoque do Produto" DESC;
  
/*
15.)Escreva e execute a instru��o SQL, para realizar a consulta na tabela PRODUTO.
Liste todos os produtos em estoque.
Apresentar uma mensagem com o seguinte texto:
"O PRODUTO (<C�DIGO DO PRODUTO> - <DESCRI��O DO PRODUTO>) POSSUI
<QUANTIDADE EM ESTOQUE> UNIDADES EM ESTOQUE".
A lista deve ser apresentada de forma ordenada pela quantidade em estoque, em ordem
decrescente.
Apresentar a coluna mensagem, com o apelido �Estoque de Produtos�.
Utilizar o operador para concatena��o �||�, para concatenar o texto ao conte�do dos campos.
*/
SELECT
    'O PRODUTO (' || cd_produto ||' - '
    || ds_produto || ') ' ||'POSSUI '
    || qt_estoque || ' UNIDADES EM ESTOQUE' "Estoque de Produtos"
    FROM t_spv_produto
ORDER BY qt_estoque DESC; 
/*
16.)Escreva e execute a instru��o SQL, para realizar a consulta na tabela NOTA_FISCAL.
Liste todas as notas fiscais.
Nesta lista, deve ser apresentado o tempo em que cada nota foi emitida, atrav�s do c�lculo:
Tempo de emiss�o = SYSDATE � Data da emiss�o
Apresentar uma mensagem com o seguinte texto:
"A NOTA FISCAL FOI EMITIDA H� ( <C�LCULO DO TEMPO EM QUE FORAM EMITIDAS> ) DIAS."
A lista deve ser apresentada de forma ordenada pelo tempo de emiss�o, em ordem
decrescente.
Apresentar a coluna mensagem, com o apelido �Tempo de Emiss�o�.
Utilizar o operador para concatena��o �||�, para concatenar o texto ao conte�do dos campos.
Utilizar a fun��o TO_CHAR(<conte�do>, <formato>) para formatar o resultado do c�lculo
entre as duas datas, no momento da apresenta��o dos dados.
*/
SELECT 'A NOTA FISCAL FOI EMITIDA H� ('|| TO_NUMBER(SYSDATE - DT_EMISSAO)||') DIAS)' "TEMPO DE EMISS�O"
FROM T_SPV_NT_FISC
ORDER BY DT_EMISSAO DESC;