/*
1.) Escreva e execute a instrução SQL, para realizar a consulta nas tabelas FUNCIONÁRIO E
DEPENDENTE.
Liste todos os funcionários que possuam dependentes.
A lista deve ser apresentada de forma ordenada por nome do funcionário, em ordem
crescente e nome do dependente, em ordem crescente.
Mostrar: número da matrícula, nome do funcionário, nome do dependente e data de
nascimento do dependente.
Utilize apelidos e qualificadores para as tabelas.
Utilize o conceito de junção de tabelas.
*/
    SELECT F.NR_MATRICULA, F.NM_FUNCIONARIO, D.NM_DEPENDENTE, D.DT_NASCIMENTO
      FROM T_SIP_DEPENDENTE D INNER JOIN T_SIP_FUNCIONARIO F
        ON(F.NR_MATRICULA = D.NR_MATRICULA)
  ORDER BY F.NM_FUNCIONARIO ASC, D.NM_DEPENDENTE ASC;
/*
2.) Escreva e execute a instrução SQL, para realizar a consulta nas tabelas DEPARTAMENTO,
FUNCIONÁRIO E DEPENDENTE.
Liste todos os funcionários que possuam dependentes.
A lista deve ser apresentada de forma ordenada por nome do funcionário, em ordem
crescente e nome do dependente, em ordem crescente.
Mostrar: número da matrícula, nome do funcionário, nome do departamento, nome do
dependente e data de nascimento do dependente.
Utilize apelidos e qualificadores para as tabelas.
Utilize o conceito de junção de tabelas.
*/
  SELECT F.NR_MATRICULA, F.NM_FUNCIONARIO,DP.NM_DEPTO, D.NM_DEPENDENTE, D.DT_NASCIMENTO
    FROM T_SIP_DEPENDENTE D
         INNER JOIN T_SIP_FUNCIONARIO F ON (F.NR_MATRICULA = D.NR_MATRICULA)-- PK=FK
         INNER JOIN T_SIP_DEPARTAMENTO DP ON (F.CD_DEPTO = DP.CD_DEPTO)
ORDER BY F.NM_FUNCIONARIO ASC, D.NM_DEPENDENTE ASC;