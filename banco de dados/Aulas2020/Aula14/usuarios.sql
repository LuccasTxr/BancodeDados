/* cria outro database(Banco de Dados)*/
drop database if exists usuarios;
create database usuarios;
use usuarios;
/* Cria a primeira tabela pessoas*/
create table pessoas(
	id_pessoa integer not null auto_increment, 
	nome varchar(40) not null,
	primary key (id_pessoa)
);
/* Cria a tabela telefone*/
create table telefones(
	id_pessoa integer not null,
	telefone varchar(15) not null,
	constraint fk_tel_pess foreign key (id_pessoa)
	references pessoas(id_pessoa)
);
/* Cria a tabela Usuarios*/
create table usuarios(
	id_pessoa integer not null,
	login varchar(10) not null,
	senha varchar(50) not null,
	tipo varchar(20) not null,
	constraint fk_possui foreign key (id_pessoa)
	references pessoas(id_pessoa)
);
/*motras as tabelas*/
describe pessoas;
describe telefones;
describe usuarios;
show tables;

/* adiciona nomes na tabela*/
insert into pessoas(nome) values
("Leonardo"),
("Rodolpho"),
("Jurema");
insert into pessoas(nome) values ("Marcia Souza");
insert into pessoas(nome) values ("Rodrigo vieira");
insert into pessoas values (default,"Maria Silva");

select * from pessoas;

/* adiciona os numeros de telefone */
insert into telefones(id_pessoa,telefone) values 
(1,"19 45677-7897"),
(1,"19 98787-7897");
insert into telefones values (3,"19 8888-8888");

select * from telefones;

/* adiciona sobrenome UPDATE*/
update pessoas set nome = "Leonardo Silva"
where id_pessoa = 1;
update pessoas set nome = "Rodolpho Katsu"
where id_pessoa = 2;
update pessoas set nome = "Jurema Update"
where id_pessoa = 3;



-- Mostra somente as pessoas que possuem telefones
select p.id_pessoa, p.nome, t.telefone
from pessoas p inner join telefones t
on p.id_pessoa = t.id_pessoa;

-- Mostra a tabela da esquerda (pessoas) completa
create view vw_pessoas as
select p.id_pessoa, p.nome, t.telefone
from pessoas p left join telefones t
on p.id_pessoa = t.id_pessoa;
order by p.id_pessoa;

-- Mostra a tabela da direita completa
select p.id_pessoa, p.nome, t.telefone
from pessoas p right join telefones t
on p.id_pessoa = t.id_pessoa;

/*senha password*/
insert into usuarios values
(1,"Silva.Leonar",password("12345678")),
(2,"Katsu.Rodolp",password("12345678")),
(3,"Updade.Jurem",password("12345678")),
(4,"Souza.Marcia",password("12345678")),
(5,"Vieira.Rodri",password("12345678")),
(6,"Silva.Maria",password("12345678"));

select * from usuarios;

/*senha MD5*/
insert into usuarios values
(1,"Silva.Leonar",md5("Senha@123")),
(2,"Katsu.Rodolp",md5("Senha@123")),
(3,"Updade.Jurem",md5("Senha@123")),
(4,"Souza.Marcia",md5("Senha@123")),
(5,"Vieira.Rodri",md5("Senha@123")),
(6,"Silva.Maria",md5("Senha@123"));

select * from usuarios;
select * from usuarios where senha = password("12345678");

select * from usuarios where senha = md5("Senha@123");

/*
md5() tipo de criptografia HASH
password
*/
