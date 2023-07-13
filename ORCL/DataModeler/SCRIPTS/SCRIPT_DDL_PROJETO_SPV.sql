
DROP TABLE t_spv_cfop CASCADE CONSTRAINTS;

DROP TABLE t_spv_cliente CASCADE CONSTRAINTS;

DROP TABLE t_spv_item_ntfisc CASCADE CONSTRAINTS;

DROP TABLE t_spv_nt_fisc CASCADE CONSTRAINTS;

DROP TABLE t_spv_produto CASCADE CONSTRAINTS;

DROP TABLE t_spv_uni_cml CASCADE CONSTRAINTS;


CREATE TABLE t_spv_cfop (
    nr_cfop          NUMBER(4) NOT NULL,
    nr_tipo_operacao NUMBER(1) NOT NULL,
    nm_operacao      VARCHAR2(30) NOT NULL,
    ds_nat_operacao  VARCHAR2(60) NOT NULL
);

ALTER TABLE t_spv_cfop
    ADD CONSTRAINT ck_spv_cfop_tipo_op CHECK ( nr_tipo_operacao = 1
                                               OR nr_tipo_operacao = 2 );

ALTER TABLE t_spv_cfop ADD CONSTRAINT pk_spv_cfop PRIMARY KEY ( nr_cfop );

ALTER TABLE t_spv_cfop ADD CONSTRAINT un_spv_cfop_nat UNIQUE ( ds_nat_operacao );

CREATE TABLE t_spv_cliente (
    cd_cliente    NUMBER(5) NOT NULL,
    nm_completo   VARCHAR2(50) NOT NULL,
    dt_nascimento DATE,
    ds_genero     CHAR(2) NOT NULL,
    ds_endereco   VARCHAR2(100) NOT NULL,
    nm_ddd_tel    NUMBER(2),
    nm_telefone   NUMBER(12),
    ds_email      VARCHAR2(80),
    nr_cpf        NUMBER(9) NOT NULL,
    nr_cpf_dig    NUMBER(2) NOT NULL,
    nr_rg         NUMBER(8) NOT NULL,
    nr_rg_dig     CHAR(2) NOT NULL
);

ALTER TABLE T_SPV_CLIENTE 
    ADD CONSTRAINT CK_SPV_CLIENTE_GENERO 
    CHECK ( upper(ds_genero) = 'M'
                                                                       OR upper(ds_genero) = 'H' OR upper(ds_genero) == 'NB')
;
ALTER TABLE t_spv_cliente ADD CONSTRAINT pk_spv_cliente PRIMARY KEY ( cd_cliente );

CREATE TABLE t_spv_item_ntfisc (
    cd_produto      NUMBER(5) NOT NULL,
    nr_nota_fiscal  NUMBER(5) NOT NULL,
    qt_item_vendida NUMBER(3) NOT NULL,
    vl_preco_unit   NUMBER(7, 2) NOT NULL,
    vl_total_item   NUMBER(7, 2) NOT NULL
);

ALTER TABLE t_spv_item_ntfisc ADD CONSTRAINT ck_spv_item_ntfisc_qntd_vd CHECK ( qt_item_vendida > 0 );

ALTER TABLE t_spv_item_ntfisc
    ADD CONSTRAINT ck_spv_item_ntfisc_preco_unit CHECK ( vl_preco_unit > 0.00 );

ALTER TABLE t_spv_item_ntfisc ADD CONSTRAINT pk_spv_item_ntfisc PRIMARY KEY ( cd_produto,
                                                                              nr_nota_fiscal );

CREATE TABLE t_spv_nt_fisc (
    nr_nota_fiscal     NUMBER(5) NOT NULL,
    cd_cliente         NUMBER(5) NOT NULL,
    nr_cfop            NUMBER(4) NOT NULL,
    dt_emissao         DATE NOT NULL,
    dt_saida           DATE NOT NULL,
    vl_total_nt_fiscal NUMBER(7, 2) NOT NULL,
    vl_desconto        NUMBER(3, 1)
);

ALTER TABLE T_SPV_NT_FISC 
    ADD CONSTRAINT CK_SPV_NT_FISC_DESCONTO 
    CHECK ( 0.0 <= vl_desconto <=25.0)
;
ALTER TABLE t_spv_nt_fisc ADD CONSTRAINT ck_spv_nt_fisc_data CHECK ( dt_saida >= dt_emissao );

ALTER TABLE t_spv_nt_fisc ADD CONSTRAINT pk_spv_nt_fisc PRIMARY KEY ( nr_nota_fiscal );

CREATE TABLE t_spv_produto (
    cd_produto      NUMBER(5) NOT NULL,
    cd_unit_cml     NUMBER(3) NOT NULL,
    ds_produto      VARCHAR2(30) NOT NULL,
    ds_produto_comp VARCHAR2(500) NOT NULL,
    qt_estoque      NUMBER(3) NOT NULL,
    vl_preco_unit   NUMBER NOT NULL
);

ALTER TABLE t_spv_produto
    ADD CONSTRAINT ck_spv_produto_preco_unit CHECK ( vl_preco_unit > 0.0 );

ALTER TABLE t_spv_produto ADD CONSTRAINT pk_spv_produto PRIMARY KEY ( cd_produto );

ALTER TABLE t_spv_produto ADD CONSTRAINT un_spv_produto_desc UNIQUE ( ds_produto );

CREATE TABLE t_spv_uni_cml (
    cd_unit_cml NUMBER(3) NOT NULL,
    sg_unit_cml CHAR(6) NOT NULL,
    ds_unit_cml VARCHAR2(30) NOT NULL
);

ALTER TABLE t_spv_uni_cml ADD CONSTRAINT pk_spv_uni_cml PRIMARY KEY ( cd_unit_cml );

ALTER TABLE t_spv_uni_cml ADD CONSTRAINT un_spv_uni_cml_desc UNIQUE ( ds_unit_cml );

ALTER TABLE t_spv_item_ntfisc
    ADD CONSTRAINT fk_spv_item_ntfisc_nt_fisc FOREIGN KEY ( nr_nota_fiscal )
        REFERENCES t_spv_nt_fisc ( nr_nota_fiscal );

ALTER TABLE t_spv_item_ntfisc
    ADD CONSTRAINT fk_spv_item_ntfisc_produto FOREIGN KEY ( cd_produto )
        REFERENCES t_spv_produto ( cd_produto );

ALTER TABLE t_spv_nt_fisc
    ADD CONSTRAINT fk_spv_nt_fis_cliente FOREIGN KEY ( cd_cliente )
        REFERENCES t_spv_cliente ( cd_cliente );

ALTER TABLE t_spv_nt_fisc
    ADD CONSTRAINT fk_spv_nt_fisc_cfop FOREIGN KEY ( nr_cfop )
        REFERENCES t_spv_cfop ( nr_cfop );

ALTER TABLE t_spv_produto
    ADD CONSTRAINT fk_spv_produto_uni_cml FOREIGN KEY ( cd_unit_cml )
        REFERENCES t_spv_uni_cml ( cd_unit_cml );