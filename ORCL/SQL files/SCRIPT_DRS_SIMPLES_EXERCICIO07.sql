/*
1.) Escreva e execute a instrução SQL, para realizar a consulta na tabela PROJETO.
Liste todos os projetos finalizados, a partir de 01/08/2018.
A lista deve ser apresentada de forma ordenada pela data término do projeto, em ordem
decrescente.
Mostrar: código, nome, data início e data término o projeto.
Apresentar a coluna data término com o apelido “Finalizado em:”.
*/

  SELECT CD_PROJETO, NM_PROJETO, DT_INICIO, DT_TERMINO "FINALIZADO EM:"
    FROM T_SIP_PROJETO
   WHERE DT_TERMINO IS NOT NULL
         AND DT_TERMINO >= TO_DATE('01/08/2018','DD/MM/YYYY')
ORDER BY DT_TERMINO DESC;

/*
2.) Escreva e execute a instrução SQL, para realizar a consulta na tabela PROJETO.
Liste todos os projetos não finalizados, que tiveram início a partir de 01/05/2015.
A lista deve ser apresentada de forma ordenada pela data de início do projeto, em ordem
crescente.
Mostrar: código, nome, data início e data término do projeto.
Apresentar a coluna data início com o apelido “Iniciado em:”.
*/

  SELECT CD_PROJETO, NM_PROJETO, DT_INICIO AS "Iniciado em:", DT_TERMINO
    FROM T_SIP_PROJETO
   WHERE DT_TERMINO IS NULL AND DT_INICIO >= TO_DATE('01/05/2015','DD/MM/YYYY')
ORDER BY DT_INICIO;

/*
3.) Escreva e execute a instrução SQL, para realizar a consulta na tabela IMPLANTACAO.
Liste todas as implantações que possuem funcionários ativos, realizando atividades para um
determinado projeto.
A lista deve ser apresentada de forma ordenada por código do projeto, número de matrícula
do funcionário e data de entrada, todos crescentes.
Mostrar: código da implantação, código do projeto, número de matrícula do funcionário, data
de entrada e data de saída do funcionário.
*/

SELECT CD_IMPLANTACAO, CD_PROJETO, NR_MATRICULA, DT_ENTRADA, DT_SAIDA
  FROM T_SIP_IMPLANTACAO
 WHERE DT_SAIDA IS NULL
ORDER BY CD_PROJETO, NR_MATRICULA, DT_ENTRADA;

/*
4.) Escreva e execute a instrução SQL, para realizar a consulta na tabela IMPLANTACAO.
Liste todas as implantações finalizadas por funcionários.
A lista deve ser apresentada de forma ordenada por código do projeto, número de matrícula
do funcionário em ordem crescente e data da saída em ordem decrescente.
Mostrar: código da implantação, código do projeto, número de matrícula do funcionário, data
de entrada e data de saída do funcionário.
Apresentar a coluna data início, com o apelido “Início em:”.
Apresentar a coluna data término, com o apelido “Conclusão:”.
*/

  SELECT CD_IMPLANTACAO, CD_PROJETO, NR_MATRICULA, DT_ENTRADA AS "INÍCIO EM:", DT_SAIDA AS "CONCLUSAO:"
    FROM T_SIP_IMPLANTACAO
   WHERE DT_SAIDA IS NOT NULL
ORDER BY CD_PROJETO, NR_MATRICULA, DT_SAIDA DESC;

/*
5.) Escreva e execute a instrução SQL, para realizar a consulta na tabela IMPLANTACAO.
Liste quais funcionários participam ou já participaram de implantações (em andamento ou
finalizadas).
Apresente o número de matrícula do funcionário, sem repetição.
Mostrar: número de matrícula do funcionário.
Apresentar a coluna número de matrícula do funcionário, com o apelido “Funcionário”.
*/
  SELECT DISTINCT NR_MATRICULA AS "Funcionários"
    FROM  T_SIP_IMPLANTACAO
   ORDER BY NR_MATRICULA;
   
/*
6.) Escreva e execute a instrução SQL, para realizar a consulta na tabela NOTA_FISCAL.
Liste quem são os clientes que realizaram alguma compra em nossa loja virtual.
A lista deve ser apresentada de forma ordenada por código do cliente, em ordem crescente.
Apresente o código do cliente, sem repetição.
Mostrar: código do cliente, com o apelido “Cliente”.
*/
 SELECT DISTINCT CD_CLIENTE AS "CLIENTE"
    FROM T_SPV_NOTA_FISCAL
    ORDER BY CD_CLIENTE;
/*
7)Escreva e execute a instrução SQL, para realizar a consulta na tabela NOTA_FISCAL.
Liste todas as notas fiscais, pertencentes ao cliente de código igual a 1, emitidas a partir de
15/08/2014.
A lista deve ser apresentada de forma ordenada por data da emissão, em ordem crescente.
Mostrar: código do cliente, número da nota fiscal, data da emissão e valor total da nota fiscal
*/
  SELECT CD_CLIENTE  "código do cliente", NR_NOTA_FISCAL "número da nota fiscal",DT_EMISSAO "data da emissão",VL_TOTAL_NT_FISCAL "valor total da nota fiscal"
    FROM T_SPV_NT_FISC
   WHERE CD_CLIENTE = 1 AND DT_EMISSAO > TO_DATE('15/08/2014','DD/MM/YYYY')
ORDER BY DT_EMISSAO ASC;
/*
8.) Escreva e execute a instrução SQL, para realizar a consulta na tabela NOTA_FISCAL.
Liste todas as notas fiscais, emitidas entre “01/08/2019” e “31/08/2019” (inclusive as
extremidades), que não tenham desconto concedido.
A lista deve ser apresentada de forma ordenada por data da emissão, em ordem
decrescente.
Mostrar: número da nota fiscal, data da emissão, valor total da nota fiscal e valor do
percentual de desconto.
Utilizar o operador especial BETWEEN para a condição referente a data da emissão.
*/
     SELECT NR_NOTA_FISCAL "NUMERO DA NOTA FISCAL", 
       DT_EMISSAO "DATA DA EMISSÃO", 
       VL_TOTAL_NT_FISCAL "VALOR TOTAL", 
       VL_DESCONTO "VALOR DESCONTO"
       FROM T_SPV_NT_FISC
      WHERE DT_EMISSAO BETWEEN TO_DATE('01/08/2019', 'DD/MM/YYYY') 
AND TO_DATE('31/08/2019', 'DD/MM/YYYY') AND VL_DESCONTO = 0
   ORDER BY DT_EMISSAO DESC;

/*
9.) Escreva e execute a instrução SQL, para realizar a consulta na tabela NOTA_FISCAL.
Liste todas as notas fiscais, que tenham algum desconto concedido.
A lista deve ser apresentada de forma ordenada pelo valor do percentual de desconto, em
ordem decrescente.
Mostrar: número da nota fiscal, data da emissão, valor total da nota fiscal e valor do
percentual de desconto.
*/
    SELECT NR_NOTA_FISCAL,DT_EMISSAO,VL_TOTAL_NT_FISCAL,VL_DESCONTO
      FROM T_SPV_NT_FISC
     WHERE VL_DESCONTO > 0
     ORDER BY vl_desconto DESC;
/*
10.)Escreva e execute a instrução SQL, para realizar a consulta na tabela NOTA_FISCAL.
Liste todas as notas fiscais, emitidas em 2019, que possuam o valor total da nota fiscal,
superior a R$ 1000.00.
Nesta lista, deve ser apresentado o valor do desconto concedido, através do cálculo:
Valor total da nota fiscal * (valor do percentual de desconto / 100)
A lista deve ser apresentada de forma ordenada pelo valor do desconto concedido
(calculado), em ordem decrescente.
Mostrar: número da nota fiscal, data da emissão, valor total da nota fiscal, valor do percentual
de desconto e o resultado do cálculo do valor do desconto concedido.
Utilizar a função TO_CHAR(<conteúdo>, <formato>) para extrair o ano data, para utilizar no
momento do filtro da consulta.
Apresentar a coluna valor do percentual de desconto, com o apelido “% Desconto”.
Apresentar a coluna cálculo do valor de desconto concedido, com o apelido “Valor do
desconto”. 
*/
SELECT
    NR_NOTA_FISCAL "Número da Nota Fiscal",
    dt_emissao "Data de Emissão",
    VL_TOTAL_NT_FISCAL "Valor total da Nota Fiscal",
    vl_desconto "% Desconto",
    (VL_TOTAL_NT_FISCAL * (vl_desconto)/100) "Valor do desconto"
    FROM t_spv_NT_FISC
WHERE TO_CHAR(dt_emissao, 'YYYY') IN ('2019') AND VL_TOTAL_NT_FISCAL > 1000;
/*
11.)Escreva e execute a instrução SQL, para realizar a consulta na tabela ITEM_NOTA_FISCAL.
Liste todos os itens da nota fiscal de número: 1235.
Nesta lista, deve ser apresentado o valor do item, através do cálculo:
Valor do item = quantidade vendida * valor do preço unitário
Mostrar: número da nota fiscal, código do produto, quantidade vendida, preço unitário e o
resultado do cálculo do valor de cada item.
Apresentar a coluna cálculo do valor de cada item, com o apelido “Valor do item”. 
*/

SELECT NR_NOTA_FISCAL,
       CD_PRODUTO,
       QT_ITEM_VENDIDA,
       VL_PRECO_UNIT,
       QT_ITEM_VENDIDA * VL_PRECO_UNIT "VALOR DO ITEM" 
FROM T_SPV_ITEM_NTFISC
WHERE NR_NOTA_FISCAL = 1235;

/*
12.)Escreva e execute a instrução SQL, para realizar a consulta na tabela NOTA_FISCAL.
Liste todas as notas emitidas no ano 2019 ou 2020 e que possuem valor total da nota fiscal
inferior a R$ 900.00.
A lista deve ser apresentada de forma ordenada pela data de emissão, em ordem
decrescente.
Mostrar: número da nota fiscal, data da emissão, valor total da nota fiscal e o valor do
percentual de desconto.
Utilizar a função TO_CHAR(<conteúdo>, <formato>) para extrair o ano data, para utilizar no
momento do filtro da consulta.
Utilizar o operador especial IN(<lista de valores>) para validar o ano da data, ao realizar a
condição de filtro da consulta.
*/

  SELECT NR_NOTA_FISCAL, DT_EMISSAO, VL_TOTAL_NT_FISCAL, VL_DESCONTO
    FROM T_SPV_NT_FISC
   WHERE TO_CHAR(DT_EMISSAO,'YYYY') IN('2019','2020') AND VL_TOTAL_NT_FISCAL < 900
ORDER BY DT_EMISSAO DESC;

/*
13.)Escreva e execute a instrução SQL, para realizar a consulta na tabela NOTA_FISCAL.
Liste todas as notas emitidas nos dias da semana: 6= sexta-feira e 7=sábado.
A lista deve ser apresentada de forma ordenada pela data de emissão, em ordem
decrescente.
Mostrar: número da nota fiscal, data da emissão e valor total da nota fiscal.
Utilizar a função TO_CHAR(<conteúdo>, <formato>) para extrair o dia da data, ao realizar a
condição de filtro da consulta. O formato utilizado será o “D” – Dia da semana de uma data.
Utilizar o operador especial IN(<lista de valores>) para validar o dia da semana da data, ao
realizar a condição de filtro da consulta.
*/
  SELECT NR_NOTA_FISCAL, DT_EMISSAO, VL_TOTAL_NT_FISCAL
    FROM T_SPV_NT_FISC
   WHERE TO_CHAR(DT_EMISSAO,'D') IN('6','7') 
ORDER BY DT_EMISSAO DESC;
/*
14.)Escreva e execute a instrução SQL, para realizar a consulta na tabela PRODUTO.
Liste todos os produtos em estoque.
Nesta lista, deve ser apresentado o valor do estoque do produto, através do cálculo:
Valor do estoque do produto = quantidade estoque * valor do preço unitário
A lista deve ser apresentada de forma ordenada pelo valor em estoque do produto calculado,
em ordem decrescente.
Mostrar: código do produto, descrição do produto, quantidade em estoque, preço unitário do
produto e o resultado do cálculo do valor do estoque do produto.
Apresentar a coluna cálculo do valor do estoque do produto, com o apelido “Valor em
Estoque do Produto”.
*/
SELECT CD_PRODUTO,DS_PRODUTO,QT_ESTOQUE,VL_PRECO_UNIT, VL_PRECO_UNIT * QT_ESTOQUE "Valor em Estoque do Produto"
  FROM T_SPV_PRODUTO
ORDER BY "Valor em Estoque do Produto" DESC;
  
/*
15.)Escreva e execute a instrução SQL, para realizar a consulta na tabela PRODUTO.
Liste todos os produtos em estoque.
Apresentar uma mensagem com o seguinte texto:
"O PRODUTO (<CÓDIGO DO PRODUTO> - <DESCRIÇÃO DO PRODUTO>) POSSUI
<QUANTIDADE EM ESTOQUE> UNIDADES EM ESTOQUE".
A lista deve ser apresentada de forma ordenada pela quantidade em estoque, em ordem
decrescente.
Apresentar a coluna mensagem, com o apelido “Estoque de Produtos”.
Utilizar o operador para concatenação “||”, para concatenar o texto ao conteúdo dos campos.
*/
SELECT
    'O PRODUTO (' || cd_produto ||' - '
    || ds_produto || ') ' ||'POSSUI '
    || qt_estoque || ' UNIDADES EM ESTOQUE' "Estoque de Produtos"
    FROM t_spv_produto
ORDER BY qt_estoque DESC; 
/*
16.)Escreva e execute a instrução SQL, para realizar a consulta na tabela NOTA_FISCAL.
Liste todas as notas fiscais.
Nesta lista, deve ser apresentado o tempo em que cada nota foi emitida, através do cálculo:
Tempo de emissão = SYSDATE – Data da emissão
Apresentar uma mensagem com o seguinte texto:
"A NOTA FISCAL FOI EMITIDA HÁ ( <CÁLCULO DO TEMPO EM QUE FORAM EMITIDAS> ) DIAS."
A lista deve ser apresentada de forma ordenada pelo tempo de emissão, em ordem
decrescente.
Apresentar a coluna mensagem, com o apelido “Tempo de Emissão”.
Utilizar o operador para concatenação “||”, para concatenar o texto ao conteúdo dos campos.
Utilizar a função TO_CHAR(<conteúdo>, <formato>) para formatar o resultado do cálculo
entre as duas datas, no momento da apresentação dos dados.
*/
SELECT 'A NOTA FISCAL FOI EMITIDA HÁ ('|| TO_NUMBER(SYSDATE - DT_EMISSAO)||') DIAS)' "TEMPO DE EMISSÃO"
FROM T_SPV_NT_FISC
ORDER BY DT_EMISSAO DESC;