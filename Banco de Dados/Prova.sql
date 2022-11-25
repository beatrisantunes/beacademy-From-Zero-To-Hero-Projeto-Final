/*  CRIAÇÃO DO NOVO BANCO DE DADOS  */
create database cadastro;

/*UTILIZAÇÃO DO BANCO DE DADOS*/
use cadastro;

/*  CRIAÇÃO DA TABELA PESSOAS  */
create table pessoas (
    id int auto_increment ,  #declaração de id como chave prmiária da tabela
    nome varchar(20),
    nascimento date,
    sexo enum('M','F'),
    peso decimal(5,2),         #peso com duas casas decimais
    altura decimal(3,2),       #altura em metros
    nacionalidade varchar(20) default 'Brasil', #Brasil por padrão
    primary key (id)           #declara id como chave primária
) 

/*  ACRESCENTANDO NOVA COLUNA   */
alter table pessoas add column profissao varchar(10) default 'Estudante';

/*  INSERÇÃO DE DADOS NA TABELA PESSOAS     */
insert into pessoas
(id, nome, nascimento, sexo, peso, altura, nacionalidade, profissao) values
(default, 'Arthur', '2000-08-18', 'M', '105.3', '1.92', default, default),
(default, 'Júlia', '2002-07-22', 'F', '87.2', '1.71', 'Argentina', default);

/*  SEGUNDA FORMA DE INSERÇÃO, CASO SEJA NA MESMA ORDEM DECLARADA NA TABELA*/
insert into pessoas values
(default, 'Marcos', '1998-03-27', 'M', '94.3', '1.64', 'Brasil', 'Tradutor'),
(default, 'Jean', '2003-02-15', 'M', '87.657', '1.83', 'França', 'Estudante');

/*  MOSTRA TODA A TABELA PESSOAS   */
select * from pessoas;

/*  CRAINDO TABELA CURSO SEM CHAVE PRIMÁRIA   */
create table cursos(
    nome varchar(30) not null unique,   # define nome como único, porém, não como chave primária
    descricao text,
    carga int unsigned,     #inteiro positivo (sem sinal), economiza 1 byte de armazenamento
    totaulas int unsigned,
    ano year default '2022'
)

/*  ADICIONANDO CHAVE PRIMÁRIA NA PRIMEIRA COLUNA   */
alter table cursos add column id_curso int unsigned first;
alter table cursos add primary key (id_curso);
desc cursos;