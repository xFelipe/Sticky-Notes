

CREATE TABLE TCIDADE(
    COD_CIDADE INTEGER,
    NOME VARCHAR(40),
    CONSTRAINTS pk_cidade PRIMARY KEY(COD_CIDADE)
    );
    
    
CREATE TABLE tbairro(
    cod_cidade integer not null,
    cod_bairro integer,
    constraint pk_bairro PRIMARY KEY(cod_cidade, cod_bairro)
    );
    
    
ALTER TABLE tbairro add constraint fk_cod_cidade
FOREIGN KEY (cod_cidade)
REFERENCES tcidade (COD_CIDADE);


create table trua(
cod_rua integer,
cod_bairro integer,
cod_cidade integer,
nome varchar(40),
constraint pk_rua primary key(cod_rua)
);

alter table trua
add constraint fk_cidadebairro
foreign key(cod_cidade, cod_bairro)
references tbairro(cod_cidade, cod_bairro);




create table tpessoa(
    cod_pessoa  int not null,
    tipo        varchar2(1) not null,
    nome        varchar2(30) not null,
    pessoa      varchar2(1) not null,
    cod_rua     integer not null,
    cpf         varchar(15),
    constraint pk_pessoa primary key(cod_pessoa)
    );
    
--Unique key

alter table tpessoa
add constraint uk_cpf unique(cpf);


select * from tpessoa;
select * from trua;

alter table tpessoa
add constraint fk_cod_rua foreign key (cod_rua) references trua(cod_rua);

alter table tpessoa
drop constraint fk_cod_rua;

alter table tpessoa
add constraint FK_PESSOA_RUA
foreign key (cod_rua)
references TRUA; /*É necessário ligar obrigatóriamente com a PK*/

--CIDADES
insert into tcidade values (1, 'NOVO HAMBURGO');
insert into tcidade values (2, 'IVOTI');
insert into tcidade values (3, 'SAPIRANGA');
insert into tcidade values (4, 'TAQUARA');
--SELECT * FROM TPESSOA;

--BAIRROS


INSERT INTO TBAIRRO VALUES(1, 1, 'CENTRO');
INSERT INTO TBAIRRO VALUES(2 ,1, 'RIO BRANCO');
INSERT INTO TBAIRRO VALUES(3 ,1, 'CENTRO');
INSERT INTO TBAIRRO VALUES(4 ,1, 'FRITZ');
INSERT INTO TBAIRRO VALUES(5 ,1, 'AMARAL');
INSERT INTO TBAIRRO VALUES(6 ,1, 'EMPRESA');

SELECT * FROM TBAIRRO;
COMMIT;


INSERT INTO TRUA VALUES (1,1,1, 'MARCILIO DIAS');
INSERT INTO TRUA VALUES (2,1,1, 'FRITZ');
INSERT INTO TRUA VALUES (3,3,1, 'JACOBINA');
INSERT INTO TRUA VALUES (4,3,1, 'JOA DA SILVA');
SELECT * FROM TRUA;
