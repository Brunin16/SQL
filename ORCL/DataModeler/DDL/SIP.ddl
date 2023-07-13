DROP TABLE t_sip_departamento CASCADE CONSTRAINTS;

DROP TABLE t_sip_dependente CASCADE CONSTRAINTS;

DROP TABLE t_sip_funcionario CASCADE CONSTRAINTS;

DROP TABLE t_sip_implantacao CASCADE CONSTRAINTS;

DROP TABLE t_sip_projeto CASCADE CONSTRAINTS;


CREATE TABLE t_sip_departamento (
    cd_depto NUMBER(3) NOT NULL,
    nm_depto VARCHAR2(30) NOT NULL,
    sg_depto CHAR(3) NOT NULL
);

ALTER TABLE t_sip_departamento ADD CONSTRAINT pk_sip_departamento PRIMARY KEY ( cd_depto );

ALTER TABLE t_sip_departamento ADD CONSTRAINT un_sip_depto_nome UNIQUE ( nm_depto );

CREATE TABLE t_sip_dependente (
    nr_matricula  NUMBER(5) NOT NULL,
    cd_dependente NUMBER(2) NOT NULL,
    nm_dependente VARCHAR2(50) NOT NULL,
    dt_nascimento DATE NOT NULL
);

ALTER TABLE t_sip_dependente ADD CONSTRAINT pk_sip_dependente PRIMARY KEY ( nr_matricula,
                                                                            cd_dependente );

CREATE TABLE t_sip_funcionario (
    nr_matricula   NUMBER(5) NOT NULL,
    cd_depto       NUMBER(3) NOT NULL,
    nm_funcionario VARCHAR2(50) NOT NULL,
    dt_nascimento  DATE NOT NULL,
    dt_admissao    DATE NOT NULL,
    ds_endereco    VARCHAR2(100) NOT NULL,
    vl_sal_men     NUMBER(7, 2) NOT NULL
);

ALTER TABLE t_sip_funcionario ADD CONSTRAINT ck_sip_func_salario CHECK ( vl_salario_men >= 1212 );

ALTER TABLE t_sip_funcionario ADD CONSTRAINT pk_sip_funcionario PRIMARY KEY ( nr_matricula );

CREATE TABLE t_sip_implantacao (
    cd_projeto     NUMBER(5) NOT NULL,
    cd_implantacao NUMBER(3) NOT NULL,
    nr_matricula   NUMBER(5) NOT NULL,
    dt_entrada     DATE NOT NULL,
    dt_saida       DATE
);

ALTER TABLE t_sip_implantacao ADD CONSTRAINT ck_sip_implantacao_data CHECK ( dt_saida > dt_entrada );

ALTER TABLE t_sip_implantacao ADD CONSTRAINT pk_sip_implantacao PRIMARY KEY ( cd_projeto,
                                                                              cd_implantacao );

CREATE TABLE t_sip_projeto (
    cd_projeto        NUMBER(5) NOT NULL,
    nm_projeto        VARCHAR2(40) NOT NULL,
    dt_inicio_projeto DATE NOT NULL,
    dt_fim_projeto    DATE
);

ALTER TABLE t_sip_projeto ADD CONSTRAINT ck_sip_projeto_data CHECK ( dt_fim_projeto > dt_inicio_projeto );

ALTER TABLE t_sip_projeto ADD CONSTRAINT pk_sip_projeto PRIMARY KEY ( cd_projeto );

ALTER TABLE t_sip_projeto ADD CONSTRAINT un_sip_projeto_nome UNIQUE ( nm_projeto );

ALTER TABLE t_sip_dependente
    ADD CONSTRAINT fk_sip_dependente_func FOREIGN KEY ( nr_matricula )
        REFERENCES t_sip_funcionario ( nr_matricula );

ALTER TABLE t_sip_funcionario
    ADD CONSTRAINT fk_sip_func_depto FOREIGN KEY ( cd_depto )
        REFERENCES t_sip_departamento ( cd_depto );

ALTER TABLE t_sip_implantacao
    ADD CONSTRAINT fk_sip_implant_func FOREIGN KEY ( nr_matricula )
        REFERENCES t_sip_funcionario ( nr_matricula );

ALTER TABLE t_sip_implantacao
    ADD CONSTRAINT fk_sip_implant_projeto FOREIGN KEY ( cd_projeto )
        REFERENCES t_sip_projeto ( cd_projeto );
