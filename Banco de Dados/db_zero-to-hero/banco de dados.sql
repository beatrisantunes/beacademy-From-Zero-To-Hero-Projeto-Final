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
  carga int UNSIGNED,
  totalaulas int,
  ano year DEFAULT '2022'
) ;

insert into cursos VALUES
(1, 'HTML5', 'Curso de HTML5', 40, 37, 2014),
(2, 'Algoritmos', 'Lógica de programação', 20, 15, 2014),
(3, 'Photoshop', 'Dicas de Photoshop CC', 10, 8, 2014),
(4, 'PHP', 'Curso de PHP para iniciantes', 40, 20, 2015);

select * from cursos;

create table pessoas_assiste_curso(
	id int not null auto_increment,
    data date,
    idpessoa int,
    idcurso int,
    primary key(id),
    foreign key(idpessoa) references pessoas(id),
    foreign key(idcurso) references cursos(idcursos)
);

insert into pessoas_assiste_curso values
(default,'2015-12-22','03','6'),
(default,'2014-01-01','22','12'),
(default,'2016-05-01','1','19'),
(default,'2017-08-11','20','20');

select * from pessoas_assiste_curso;

desc pessoas;
desc cursos;
desc pessoas_assiste_curso