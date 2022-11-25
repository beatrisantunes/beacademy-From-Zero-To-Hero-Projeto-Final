/*  CRIAÇÃO DO NOVO BANCO DE DADOS  */
create database cadastro;

/*UTILIZAÇÃO DO BANCO DE DADOS*/
use cadastro;

/*  CRIAÇÃO DA TABELA PESSOAS  */
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
/*  INSERÇÃO DE DADOS NA TABELA PESSOAS*/
insert into pessoas
(id, nome, nascimento, sexo, peso, altura, nacionalidade) values
(1, 'Arthur', '2000-08-18', 'M', '105.3', '1.92', default),
(2, 'Júlia', '2002-07-22', 'F', '87.2', '1.71', 'Argentina'),
(3, 'Marcos', '1998-03-27', 'M', '94.3', '1.64', 'Brasil'),
(4, 'Jean', '2003-02-15', 'M', '87.657', '1.83', 'França');

select * from pessoas;

create table cursos (
  idcurso int,
  nome varchar(30),
  descricao text,
  carga int unsigned,
  totalaulas int,
  ano year default '2022'
) ;

insert into cursos values
(1, 'HTML5', 'Curso de HTML5', 40, 37, 2014),
(2, 'Algoritmos', 'Lógica de programação', 20, 15, 2014),
(3, 'Photoshop', 'Dicas de Photoshop CC', 10, 8, 2014),
(4, 'PHP', 'Curso de PHP para iniciantes', 40, 20, 2015),
('5', 'Cozinha Árabe', 'Aprender a fazer Kibe', '40', '30', '2018');
select * from cursos;

describe cursos;
select * from cursos;

update cursos
set nome = 'HTML5'
where idcurso = '1';

select * from cursos;

update cursos 
set nome = 'Algoritmos', ano = '2015', carga = '40'
where idcurso = '2'
limit 1; 

delete from cursos
where ano ='2018'
limit 2;

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

insert into alunos values
(1, 'Arthur', 'Advogado', '2000-08-18', 'M', '105.3', '1.92', default),
(2, 'Júlia', default ,'2002-07-22', 'F', '87.2', '1.71', 'Argentina'),
(3, 'Marcos', 'Cozinheiro' ,'1998-03-27', 'M', '94.3', '1.64', 'Brasil'),
(4, 'Jean', 'Professor','2003-02-15', 'M', '87.657', '1.83', 'França');

select * from alunos;

create table aluno_assiste_curso (
	id int auto_increment,
  data date,
  idaluno int,
  idcurso int,
 primary key (id),
  foreign key (idaluno) references alunos(id),
  foreign key (idcurso) references cursos(idcurso)
);

/*Inserindo dados na tabela aluno_assiste_curso*/
insert into aluno_assiste_curso values (default, '2020-05-25', '1','3');
insert into aluno_assiste_curso values ( default,'2021-12-03', '2','1');
insert into aluno_assiste_curso values (default, '2021-08-19', '3','4');
insert into aluno_assiste_curso values (default, '2022-02-08', '4','2');

select * from aluno_assiste_curso;

alter table alunos add column cursopreferido int;

/*especifica que o campo curso preferido será uma chave estrangeira com referencia dessa chave na tabela cursos no campo de chave primaria idcursos*/
alter table alunos add foreign key(cursopreferido) references cursos(idcurso);

/*preenche no aluno 1 com o codigo do curso preferido desse aluno*/
update alunos set cursopreferido = '2' where id ='1';
update alunos set cursopreferido = '4' where id ='2';
update alunos set cursopreferido = '1' where id ='3';
update alunos set cursopreferido = '3' where id ='4';

/*mostra no result set os campos nome aluno, curso preferido aluno, nome curso(referenciado no codigo numerico do curso), ano do curso(referenciado pelo codigo numerico do curso)*/
/*tabela de referencia inicial alunos, junta com a tabela cursos*/
/*aonde o codigo do curso preferido dos alunos se juntam com o codigo da tabela de referencia dos cursos*/
select alunos.nome, alunos.cursopreferido, cursos.nome, cursos.ano
from alunos join cursos
on alunos.cursopreferido = cursos.idcurso;

/*mostra no result set os campos nome aluno, curso preferido aluno, nome curso(referenciado no codigo numerico do curso), ano do curso(referenciado pelo codigo numerico do curso)*/
/*tabela de referencia inicial alunos, junta com a tabela cursos, aonde tambem atraves da palavra "as" as tabelas adquirem apelidos para simplificar a sintaxe*/
/*aonde o codigo do curso preferido dos alunos se juntam com o codigo da tabela de referencia dos cursos*/
/*ordenado por nome*/
select a.nome, a.cursopreferido, c.nome, c.ano
from alunos as a inner join cursos as c
on c.idcurso = a.cursopreferido
order by a.nome;

/*mostra no result set os campos nome aluno, curso preferido aluno, nome curso(referenciado no codigo numerico do curso), ano do curso(referenciado pelo codigo numerico do curso)*/
/*tabela de referencia inicial alunos, junta com a tabela cursos dando prioridade no result set para a tabela a esquerda no comando, aonde tambem atraves da palavra "as" as tabelas adquirem apelidos para simplificar a sintaxe*/
/*aonde o codigo do curso preferido dos alunos se juntam com o codigo da tabela de referencia dos cursos*/
/*ordenado por nome*/
select a.nome, a.cursopreferido, c.nome, c.ano
from alunos as a left outer join cursos as c
on a.cursopreferido = c.idcurso
order by a.nome;

/*mostra no result set os campos nome aluno, curso preferido aluno, nome curso(referenciado no codigo numerico do curso), ano do curso(referenciado pelo codigo numerico do curso)*/
/*tabela de referencia inicial alunos, junta com a tabela cursos dando prioridade no result set para a tabela a direita no comando, aonde tambem atraves da palavra "as" as tabelas adquirem apelidos para simplificar a sintaxe*/
/*aonde o codigo do curso preferido dos alunos se juntam com o codigo da tabela de referencia dos cursos*/
/*ordenado por nome*/
select a.nome, a.cursopreferido, c.nome, c.ano
from alunos as a right outer join cursos as c
on a.cursopreferido = c.idcurso
order by c.nome;