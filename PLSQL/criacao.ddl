
-- DROP TABLE aluguel CASCADE ;

-- DROP TABLE cliente CASCADE ;

-- DROP TABLE empregado CASCADE ;

-- DROP TABLE filme CASCADE ;

-- DROP TABLE loja CASCADE ;

CREATE TABLE aluguel (
    datasaida          DATE,
    datavolta          DATE,
    total_aluguel      NUMeric(6, 2),
    numdaoperacaoaluga NUMeric(6) NOT NULL,
    numcliente         NUMeric(4) NOT NULL,
    videoid            NUMeric(5) NOT NULL,
    empregadoid        NUMeric(3) NOT NULL
);

ALTER TABLE aluguel ADD CONSTRAINT aluguel_pk PRIMARY KEY ( numdaoperacaoaluga );

CREATE TABLE cliente (
    numcliente NUMeric(4) NOT NULL,
    nome       VARCHAR(20) NOT NULL,
    endereco   VARCHAR(30)
);

ALTER TABLE cliente ADD CONSTRAINT cliente_pk PRIMARY KEY ( numcliente );

CREATE TABLE empregado (
    empregadoid NUMeric(3) NOT NULL,
    nome        VARCHAR(25),
    salario     NUMeric(5, 2),
    loja        NUMeric(4) NOT NULL
);

ALTER TABLE empregado ADD CONSTRAINT empregado_pk PRIMARY KEY ( empregadoid );

CREATE TABLE filme (
    videoid      NUMeric(5) NOT NULL,
    qntestoque   NUMeric(3),
    custo        NUMeric(3, 2),
    categoria    VARCHAR(25),
    precoaluguel NUMeric(3, 2),
    titulo 		 varchar(30)
);

ALTER TABLE filme ADD CONSTRAINT filme_pk PRIMARY KEY ( videoid );

CREATE TABLE loja (
    endereco VARCHAR(40),
    nome     VARCHAR(25) NOT NULL,
    numloja  NUMeric(4) NOT NULL
);

ALTER TABLE loja ADD CONSTRAINT loja_pk PRIMARY KEY ( numloja );

ALTER TABLE aluguel
    ADD CONSTRAINT aluguel_cliente_fk FOREIGN KEY ( numcliente )
        REFERENCES cliente ( numcliente );

ALTER TABLE aluguel
    ADD CONSTRAINT aluguel_empregado_fk FOREIGN KEY ( empregadoid )
        REFERENCES empregado ( empregadoid );

ALTER TABLE aluguel
    ADD CONSTRAINT aluguel_filme_fk FOREIGN KEY ( videoid )
        REFERENCES filme ( videoid );

ALTER TABLE empregado
    ADD CONSTRAINT loja FOREIGN KEY ( loja )
        REFERENCES loja ( numloja );
commit;