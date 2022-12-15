/* Criando banco de dados db_zero_to_hero*/
create database db_zero_to_hero;

/* Utilizando banco de dados db_zero_to_hero*/
use db_zero_to_hero;

/* Criando tabela usuario*/
create table usuario (
  usuarioid int not null auto_increment,
  nome varchar(50) ,
  email varchar(50),
  nascimento date,
  primary key (usuarioId)
);

/* Inserindo dados na tabela usuario*/
insert into usuario
(usuarioid, nome, nascimento, email) values
(1, 'Arthur', '2000-08-18', 'arthur123@gmail.com'),
(2, 'Júlia', '2002-07-22', 'ju_julia@hotmail.com'),
(3, 'Marcos', '1998-03-27', 'marcos@gmail.com'),
(4, 'Eduarda', '2003-02-15', 'eduarda10@hotmail.com');

select * from usuario;

/* Criando tabela post*/
create table post (
  postid int,
  conteudo varchar(500),
  criacao date default '2022-11-30',
  idusuario int not null auto_increment,
 primary key (postid),
  key idusuario (idusuario),
  constraint post_ibfk_1 foreign key (idusuario) references usuario (idusuario)
);


/* Criando tabela comentario*/
create table comentario(
  comentarioid int,
  descricao varchar(500) default null,
  criacao date default '2022-11-30',
  idusuario int not null auto_increment,
  postid int,
  primary key (comentarioid),
  key idusuario (idusuario),
  key postid (postid),
  constraint comentario_ibfk_1 foreign key (idusuario) references usuario (idusuario),
  constraint comentario_ibfk_2 foreign key (postid) references post (postid)
);

