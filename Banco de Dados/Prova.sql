/* Criando banco de dados cadastro*/
create database cadastro;

/* Utilizando banco de dados cadastro*/
use cadastro;

/* Criando tabela pessoas*/
create table pessoas (
    id int auto_increment,  #declaração de id como chave prmiária da tabela
    nome varchar(20),
    nascimento date,
    sexo enum('M','F'),
    peso decimal(5,2),         #peso com duas casas decimais
    altura decimal(3,2),       #altura em metros
    nacionalidade varchar(20) default 'Brasil', #Brasil por padrão
    primary key (id)           #declara id como chave primária
) ;

/* Inserindo dados na tabela pessoas*/
insert into pessoas
(id, nome, nascimento, sexo, peso, altura, nacionalidade) values
(1, 'Arthur', '2000-08-18', 'M', '105.3', '1.92', default),
(2, 'Júlia', '2002-07-22', 'F', '87.2', '1.71', 'Argentina'),
(3, 'Marcos', '1998-03-27', 'M', '94.3', '1.64', 'Brasil'),
(4, 'Jean', '2003-02-15', 'M', '87.657', '1.83', 'França');

select * from pessoas;

/* Criando tabela cursos*/
create table cursos (
  idcurso int,
  nome varchar(30),
  descricao text,
  carga int unsigned,
  totalaulas int,
  ano year default '2022'
) ;

/* Inserindo dados na tabela cursos*/
insert into cursos values
(1, 'HTML5', 'Curso de HTML5', 40, 37, 2014),
(2, 'Algoritmos', 'Lógica de programação', 20, 15, 2014),
(3, 'Photoshop', 'Dicas de Photoshop CC', 10, 8, 2014),
(4, 'PHP', 'Curso de PHP para iniciantes', 40, 20, 2015),
(5, 'Cozinha Árabe', 'Aprender a fazer Kibe', '40', '30', '2018');

/*Atualizando dados na tabela cursos*/
update cursos
set nome = 'HTML5'
where idcurso = '1';

update cursos 
set nome = 'Algoritmos', ano = '2015', carga = '40'
where idcurso = '2'
limit 1; 

/*Removendo dados na tabela cursos*/
delete from cursos
where ano ='2018'
limit 2;

select * from cursos;

/* Criando tabela alunos*/
create table alunos (
  id int(11) auto_increment,
  nome varchar(30),
  profissao varchar(20) default 'Estudante',
  nascimento date,
  sexo enum('M','F'),
  peso decimal(5,2),
  altura decimal(3,2),
  nascionalidade varchar(20) default 'Brasil',
  primary key (id)
);

/* Inserindo dados na tabela alunos*/
insert into alunos values
(1, 'Arthur', 'Advogado', '2000-08-18', 'M', '105.3', '1.92', default),
(2, 'Júlia', default ,'2002-07-22', 'F', '87.2', '1.71', 'Argentina'),
(3, 'Marcos', 'Cozinheiro' ,'1998-03-27', 'M', '94.3', '1.64', 'Brasil'),
(4, 'Jean', 'Professor','2003-02-15', 'M', '87.657', '1.83', 'França');

select * from alunos;

/* Criando tabela aluno_estudando*/
create table aluno_estudando (
	id int auto_increment,
  data date,
  idaluno int,
  idcurso int,
 primary key (id),
  foreign key (idaluno) references alunos(id),
  foreign key (idcurso) references cursos(idcurso)
);

/*Inserindo dados na tabela aluno_estudando*/
insert into aluno_estudando values (default, '2020-05-25', '1','3');
insert into aluno_estudando values ( default,'2021-12-03', '2','1');
insert into aluno_estudando values (default, '2021-08-19', '3','4');
insert into aluno_estudando values (default, '2022-02-08', '4','2');

select * from aluno_estudando;

alter table alunos add column cursopreferido int;

/*especifica que o campo curso preferido será uma chave estrangeira com referencia dessa chave na tabela cursos no campo de chave primaria idcurso*/
alter table alunos add foreign key(cursopreferido) references cursos(idcurso);

/*preenche no aluno com o codigo do curso preferido desse aluno*/
update alunos set cursopreferido = '2' where id ='1';
update alunos set cursopreferido = '4' where id ='2';
update alunos set cursopreferido = '1' where id ='3';
update alunos set cursopreferido = '3' where id ='4';

/*Junção usando o self join*/
select a1.id, a2.id
from aluno_estudando a1 inner join aluno_estudando a2
on (a1.idaluno <> a2.idaluno)
where a1.idcurso = a2.idcurso
order by a1.id;

/*Junção usando o inner join*/
select a.nome, a.cursopreferido, c.nome, c.ano
from alunos as a inner join cursos as c
on c.idcurso = a.cursopreferido
order by a.nome;

/*Junção usando o left join*/
select a.nome, a.cursopreferido, c.nome, c.ano
from alunos as a left outer join cursos as c
on a.cursopreferido = c.idcurso
order by a.nome;

/*Junção usando o right join*/
select a.nome, a.cursopreferido, c.nome, c.ano
from alunos as a right outer join cursos as c
on a.cursopreferido = c.idcurso
order by c.nome;

/*Junção usando o cross join*/
select a.id, c.idcurso
from alunos as a
cross join cursos as c
where a.id = c.idcurso
order by a.nome;

/*Junção usando o full join*/
select a.nome, p.id
from alunos as a
left join pessoas as p on a.id = p.id 
Union all
select a.id, p.id
from alunos as a
right join pessoas as p on a.id = p.id
order by nome;