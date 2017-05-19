
Comandos usados:
Aula3:


use cadastro;
create table pessoas(
nome varchar(30),
idade tinyint,
sexo char(1),
peso float,
altura float,
nacionalidade varchar(20)
);
describe pessoas;


Aula4:


create database cadastro 
default character set utf8
default collate utf8_general_ci;
---
create table pessoas(
	id int not null auto_increment,
	nome varchar(30) not null,
	nascimento date,
	sexo enum('M','F'),
	peso decimal(5,2),
	altura decimal(3,2),
	nacionalidade varchar(20) default 'Brasil',

	primary key(id)
)default charset = utf8;


Aula5:


insert into pessoas
    (pessoasnome, nascimento, sexo, peso, altura, nacionalidade)
    values
    ('Godolfredo','1984-01-02','m','78.5','1.83','Brasil');/*ano-mes-dia*/

    --

insert into pessoas
	 (id, nome, nascimento, sexo, peso, altura, nacionalidade)
values
	 (DEFAULT,'Creuza','1920-12-30','f','55.2','1.65',default);/*ano-mes-dia*/

--

	insert into pessoas values
    (DEFAULT,'Claudio','1975-4-22','M','99.0','2.1','Brasil'),
    (DEFAULT, 'pedro','1995-12-3','F','87','2',default),
    (default, 'Janaína', '1987-11-12', 'M','75.4','1.66','EUA');

Aula6:
    

    describe pessoas;

/*Adicionar coluna/campo*/
alter table pessoas
rename to gafanhotos;





alter table pessoas
add column profissao varchar(10);


alter table pessoas
drop column profissao;


alter table pessoas
add column profissao varchar(10) after nome;   /*-- first = primeiro*/


alter table pessoas
add codigo int first;   /*--"column" opicional*/

/*Adiciona default 0 a coluna
	alter table compras
	alter column recebida set default 0;

 *Adiciona chave estranjeira COM constraint
	alter table compras
	add constraint FK_compras_compradorID foreign key (comprador_id)
	references compradores(id);
*/

alter table pessoas
modify column profissao varchar(20) not null default ''; /*Não muda nome. O default vazio dribla o not null*/


alter table pessoas
change column profissao prof varchar(20) not null;/*renomeia a coluna e muda características*/

/* Muda características da coluna
ALTER TABLE compras
modify observacoes nvarchar(400) not null;
*/


create table if not exists cursos(
nome varchar(30) not null unique,
descricao text,
carga int unsigned,/*Sem sinal. Não pode ser negativo*/
totaulas int unsigned,
ano year default '2016'
)default charset=utf8;


alter table cursos
add column idcurso int first;/*Não da pra adicionar coluna e tornar chave primária em um só comando*/


alter table cursos
add primary key (idcurso);

/*Apagar:
drop table if exists teste;  -apaga uma tabela
drop database ''
*/


create table if not exists teste(
id int,
nome varchar(10),
idade int
);

insert into teste value('1','pedro','19');


insert into teste value
('2','Maria','12'),
('3','Maricota','77');


drop table if exists teste;



aula7:



use cadastro;

select * from cursos;

insert into cursos values
('1','HTML4','Curso de HTML5','40','37','2014'),
('2','Algoritmos','Lógica de Programação','20','15','2014'),
('3','Photoshop','Dicas de Photoshop CC','10','8','2014'),
('4','PGP','Cursos de PHP para iniciantes','40','20','2010'),
('5','Jarva','Instrodução a Linguagem Java','10','29','2010'),
('6','MySQL','Banco de Dados MySQL','30','15','2016'),
('7','Word','Curso completo de Word','40','30','2016'),
('8','Sapateado','Danças Rítmicas','40','30','2018'),
('9','Cozinha Árabe','Aprenda a fazer Kibe','40','30','2018'),
('10','Youtuber','Gerar polêmica e ganhar inscritos','5','2','2018');


update cursos /*Muda valor*/
set nome='HTML5'
where idcurso='1';


update cursos
set nome='PHP', ano='2015'
where idcurso='4';


update cursos
set nome='Java', carga='40',ano='2015'
where idcurso='5'
LIMIT 1;/*limita a quantidade de linhas afetadas*/


update cursos
set ano='2018', carga='0'
where ano='2050'
limit 1;


delete from cursos
where ano='2050'
limit 2;


truncate cursos;/*APAGA A TABELA*/



Aula8:

use cadastro;
select * from cursos;
select * from gafanhotos;
describe gafanhotos;
desc cursos;
drop database cadastro;




Aula9:
Console:

Enter

show databases;
show tables;
status;
use cadastro;
status;
describe cursos; 
desc gafanhotos; /*Descreve trutura de tabela*/



Aula10:

show create table amigos;
show create database exemplo;


Aula11: /*SELECT - BUSCA*/

select * from cursos
order by nome;

select * from cursos
order by nome desc;

select * from cursos
order by nome asc;  /*Continua cem ordem crescente*/

select nome, carga, ano from cursos;

select nome, carga, ano from cursos
order by nome;

select ano, nome, carga from cursos
order by ano;

select ano, nome, carga from cursos
order by ano, nome;

select * from cursos
where ano='2016'
order by nome;

select nome, carga from cursos
where ano='2016'
order by nome;/*"resultset é o resultado da consulta select*/

select nome, descricao, ano from cursos
where ano<= '2015'
order by ano, nome;

select nome, descricao, ano from cursos
where ano != '2016'/*<> faz a mesma coisa*/
order by ano, nome;

select nome, ano from cursos/*ENTRE*/
where ano between '2014' and '2016'
order by ano desc, nome;

select nome, descricao, ano from cursos
where ano in ('2014', '2016')
order by ano;

select nome, carga, totaulas from cursos
where carga > '35' or totaulas < '30'
order by nome;



aula12:


select * from cursos
where nome like 'a%';/*Tem 'a' no inicio  --  inclui os com acento*/

select * from cursos
where nome not like '%a%';/*NÃO tem 'a' em qualquer lugar*/

select idcurso, nome from cursos
where nome like 'PH%P';

select idcurso, nome from cursos
where nome like 'PH%P_';/*'_' Exige que haja algum caracter*/

select idcurso, nome from cursos
where nome like 'P_P%';

select idcurso, nome from cursos
where nome like 'P___o%';

select * from gafanhotos
where nome like '%silva%';


select distinct nacionalidade from gafanhotos
order by nacionalidade;/*exibe todos(e apenas) os valores distintos*/


select count(*) from cursos;

select * from cursos
where carga>'40';

select count(*) from cursos
where carga>'40';


select max(carga) from cursos
order by carga;

select * from cursos
where ano='2016';

select max(totaulas) from cursos
where ano='2016';/*Maior total de aulas dos cursos de 2016*/

select min(totaulas) from cursos
where ano='2016';

select sum(totaulas) from cursos
where ano='2016';/*soma valores do totaulas*/

select avg(totaulas) from cursos/*Média*/
where ano='2016';

Exercicio:


1: /*todas as gafanhotas*/
select nome from gafanhotos
where sexo='F' order by nome;

2: /*Todas as pessoas que nasceram entre as seguintes datas*/
select * from gafanhotos
where nascimento between '2000-01-01' and '2015-12-31';

3: /*todos os homens programadores*/
select nome from gafanhotos
where sexo = 'M' and profissao = 'Programador';

4:/* mulher do brasil começando com j*/
select * from gafanhotos
where sexo = 'F' and nacionalidade = 'Brasil' and nome like 'J%';

5:
select nome, nacionalidade from gafanhotos
where sexo = 'M' and nome like '%silva%' and nacionalidade != 'Brasil' and peso < '100';

6:/*peso máximo dos faganhotos homens brasileiros*/
select max(altura) from gafanhotos
where sexo = 'M' and nacionalidade = 'Brasil';

7:/*média de peso*/
select avg(peso) from gafanhotos;

8:
select min(peso) from gafanhotos
where sexo = 'F' and nacionalidade != 'Brasil' and nascimento between '1990-01-01' and '2000-12-31';

9:
select count(*) from gafanhotos
where sexo = 'F' and altura > '1.90';



Aula13:

/* Uma lista com as profissões dos gafanhotos e seus respectivos quantitativos */
select profissao, count(nome) from gafanhotos
group by profissao;

/* Quantos gafanhotos homens e quantas mulheres nasceram após 01/Jan/2005? */
select sexo, count(nome) from gafanhotos
where nascimento > '2005-01-01'
group by sexo;

/* Uma lista com os gafanhotos que nasceram fora do Brasil, mostrando o país de origem e o total de pessoas nascidas lá. Só nos interessam os países que tiverem mais de 3 gafanhotos com essa nacionalidade." */
select nacionalidade, count(nome) from gafanhotos
where nacionalidade != 'Brasil'
group by nacionalidade
having count(nome)>'3';

/* Uma lista agrupada pela altura dos gafanhotos, mostrando quantas pessoas pesam mais de 100Kg e que estão acima da média de altura de todos os cadastrados. */
select count(nome) from gafanhotos
where peso > '100'
group by altura
having altura > (select avg(altura) from gafanhotos);

Aula15:

alter table gafanhotos
add column cursopreferido int;/*column opicional*/

describe gafanhotos;

alter table gafanhotos
add foreign key (cursopreferido)
references cursos(idcurso);/*torna cursopreferido uma chave estrangeira*/

select * from gafanhotos;
select * from cursos;

update gafanhotos set cursopreferido = '6'
where id='1';/*Adiciona valor a chave estrangeira*/

delete from cursos
where idcurso='6';/*Não apagou por conta de ter sua chave como estrangeira em gafanhotos*/

delete from cursos
where idcurso='28';

/* delete from compras where observacoes is null; deleta sob condição de algo ser nulo. = não funciona */


select * from gafanhotos;

/*Junções*/

select nome, cursopreferido from gafanhotos;
select nome, ano from cursos;

select gafanhotos.nome, gafanhotos.cursopreferido, cursos.nome, cursos.ano
from gafanhotos join cursos;/*sem filtro*/


select gafanhotos.nome, gafanhotos.cursopreferido, cursos.nome, cursos.ano
from gafanhotos join cursos
on cursos.idcurso = gafanhotos.cursopreferido
order by gafanhotos.nome;/*mostra os gafanhotos e seus respectivos cursos preferidos*/


select g.nome, c.nome, c.ano
from gafanhotos as g inner join cursos as c
on c.idcurso = g.cursopreferido
order by g.nome;/*cria apelidos para tabelas "as"*/


select gafanhotos.nome, gafanhotos.cursopreferido, cursos.nome, cursos.ano
from gafanhotos left outer join cursos
on cursos.idcurso = gafanhotos.cursopreferido
order by gafanhotos.nome;/*Mostra todos do campo da esquerda tendo ou não ligações. outer opcional.*/

select gafanhotos.nome, gafanhotos.cursopreferido, cursos.nome, cursos.ano
from gafanhotos right join cursos
on cursos.idcurso = gafanhotos.cursopreferido
order by gafanhotos.nome;
/*
select count(*), month(assiste.data) as mes, year(assiste.data) as ano from assiste
right join cursos on assiste.idcurso = cursos.idcurso
right join gafanhotos on assiste.idgafanhoto = gafanhotos.id
group by mes, ano
order by ano, mes;
*/


Aula16:

use cadastro;	


create table assiste(
id int not null auto_increment,
data date,
idgafanhoto int,
idcurso int,
primary key (id),
foreign key (idcurso) references cursos(idcurso),
foreign key (idgafanhoto) references gafanhotos(id)
) default charset = utf8;

select * from gafanhotos;
select * from cursos;
select * from assiste;

insert into cadastro.assiste values
(default,'2014-03-01','1','2');

insert into assiste values
(default,'2015-12-22','3','6');

insert into assiste values
(default,'2014-01-01','22','12');

insert into assiste values
(default, '2016-05-12','1','19');


select * from gafanhotos g
join assiste a
on g.id = a.idgafanhoto;

select g.nome, c.nome from gafanhotos g
join assiste a
on g.id = a.idgafanhoto
join cursos c
on a.idcurso = c.idcurso
order by g.nome;

/*SENHA MÍNIMA PHP CONDIÇÃO*/

if( !isset( $senha[5] ) ) {
   echo 'Sua senha deve possuir no mínimo 6 caracteres!';
}
/*VERIFICA SE CAMPO DA STRING EXISTE*/



/* 	ATENÇÃO NO ORDER BY, QUE INDICA OS TIPOS DE COLUNAS NA SAÍDA DA CONSULTA
	"as" modifica nome da coluna da seleção de uma função.

select month(data) as mês, year(data) as ano, avg(valor) as 'media' from compras
where valor < 1000
group by recebida,month(data), year(data);

	Outra junção:
select avg(compras.valor) as 'média', month(compras.data) as 'mês', compradores.nome
from compras join compradores on compras.comprador_id = compradores.id
group by nome, mês;

*/



/*Tabela curso data e hora colocados automaticamente
create table matricula(
nmatricula int auto_increment primary key not null,
aluno_fk int not null,
curso_fk int not null,
dataehora datetime not null default current_timestamp,
foreign key (aluno_fk) references aluno(id),
foreign key (curso_fk) references curso(id)
)default charset = utf8;


alter table matricula auto_increment = 2017000;
*/