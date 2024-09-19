CREATE DATABASE SESI;
use SESI;


/* -- TABELAS GESTOR -- */

CREATE TABLE gestor_admins (
idadmin INT(4) PRIMARY KEY auto_increment,
nome VARCHAR(50),
cpf CHAR(11),
email VARCHAR(50),
senha VARCHAR(100),
sexo ENUM("M","F"),
cargo VARCHAR(30),
created_at timestamp default current_timestamp() ON UPDATE current_timestamp(),
update_at timestamp default current_timestamp()
);

CREATE TABLE gestores (
idgestor INT (4) PRIMARY KEY auto_increment,
nome VARCHAR(50),
cpf CHAR(11),
senha VARCHAR(100),
email VARCHAR(50),
sexo ENUM("M","F"),
cargo VARCHAR(30),
created_at timestamp default current_timestamp() ON UPDATE current_timestamp(),
update_at timestamp default current_timestamp(),

/* CHAVE ESTRANGEIRA*/
id_admin INT(4),
FOREIGN KEY (id_admin)
references gestor_admins (idadmin)
);



/* -- TABELAS MEDICO -- */
CREATE TABLE medicos (
idmedico INT(4) PRIMARY KEY auto_increment,
nome VARCHAR(50),
cpf CHAR(11),
crm CHAR(13),
sexo ENUM("M","F"),
email VARCHAR(50),
senha VARCHAR(100),
especialidade VARCHAR(35),
cargo VARCHAR (30),
created_at timestamp default current_timestamp() ON UPDATE current_timestamp(),
update_at timestamp default current_timestamp(),

/* CHAVE ESTRANGEIRA*/
id_gestor_med INT(4),
FOREIGN KEY (id_gestor_med) 
references gestores (idgestor)
);

CREATE TABLE endereco_medicos (
idend_med INT(4) PRIMARY KEY auto_increment,
cep CHAR(8),
logradouro VARCHAR(100),
num_end_med varchar(7),
bairro VARCHAR(100),
complemento VARCHAR(50),
pt_ref VARCHAR(50),
cidade VARCHAR(60),
uf CHAR(2),
pais VARCHAR(30),
tipo_end_med ENUM ('RESIDENCIAL', 'COMERCIAL'),
created_at timestamp default current_timestamp() ON UPDATE current_timestamp(),
update_at timestamp default current_timestamp(),

/* CHAVE ESTRANGEIRA*/								
id_end_med INT(4),
FOREIGN KEY (id_end_med) 
references medicos (idmedico)
);

CREATE TABLE tel_medicos (
idtel_med INT(4) PRIMARY KEY auto_increment,
ddd CHAR(2),
num_tel_med VARCHAR(9),
tipo_tel_med ENUM('RESIDENCIAL', 'COMERCIAL','CELULAR'),
created_at timestamp default current_timestamp() ON UPDATE current_timestamp(),
update_at timestamp default current_timestamp(),

/* CHAVE ESTRANGEIRA*/
id_tel_med INT(4),
FOREIGN KEY (id_tel_med) 
references medicos (idmedico)
);
/* -- TABELAS MEDICO -- */


/* -- TABELAS ATLETA -- */
CREATE TABLE atletas (
idatleta INT(4) PRIMARY KEY auto_increment,
nome VARCHAR(100),
cpf CHAR(11),
email varchar(50),
senha VARCHAR(100),
d_nasc DATE,
sexo ENUM('F','M'),
categoria VARCHAR(30),
posicao VARCHAR(40),
cargo VARCHAR(30),
modalidade VARCHAR(30),
solicitacao ENUM("SOLICITADO","NÃO SOLICITADO"),
situacao enum("APROVADO","EM ANÁLISE","REPROVADO"),
created_at timestamp default current_timestamp() ON UPDATE current_timestamp(),
update_at timestamp default current_timestamp(),

/* CHAVE ESTRANGEIRA 1,N */
id_gestor_atl INT(4),
FOREIGN KEY (id_gestor_atl) 
references gestores (idgestor)
);

CREATE TABLE endereco_atletas (
idend_atl INT(4) PRIMARY KEY auto_increment,
cep CHAR(8),
logradouro VARCHAR(100),
num_end_atl varchar(7),
bairro VARCHAR(100),
complemento VARCHAR(50),
pt_ref VARCHAR(50),
cidade VARCHAR(60),
uf CHAR(2),
pais VARCHAR(30),
tipo_end_atl ENUM ('RESIDENCIAL', 'COMERCIAL'),
created_at timestamp default current_timestamp() ON UPDATE current_timestamp(),
update_at timestamp default current_timestamp(),

id_end_atl INT(4),
FOREIGN KEY (id_end_atl) 
references atletas (idatleta)
);

CREATE TABLE tel_atletas (
idtel_atl INT(4) PRIMARY KEY auto_increment,
ddd CHAR(2),
num_tel_atl VARCHAR(9),
tipo_tel_atl ENUM('RESIDENCIAL', 'COMERCIAL','CELULAR'),
created_at timestamp default current_timestamp() ON UPDATE current_timestamp(),
update_at timestamp default current_timestamp(),

id_tel_atl INT(4),
FOREIGN KEY (id_tel_atl) 
references atletas (idatleta)
);
/* -- TABELAS ATLETA -- */


/* -- TABELAS EXAME -- */
CREATE TABLE exames(
idexame INT(4) PRIMARY KEY auto_increment,
pdf longblob,
tipo VARCHAR(100),
descricao TEXT,
data_ex DATETIME,
situacao ENUM("CONCLUIDO","EM ANALISE","PENDENTE"),
observacao TEXT,
created_at timestamp default current_timestamp() ON UPDATE current_timestamp(),
update_at timestamp default current_timestamp(),

/* CHAVE ESTRANGEIRA*/
id_exame_atl INT(4),
FOREIGN KEY (id_exame_atl) 
references atletas (idatleta),

id_exame_med INT(4),
FOREIGN KEY (id_exame_med) 
references medicos (idmedico)
);
/* -- TABELAS EXAME -- */


/* TABELAS MEDICO CONVIDADO*/
CREATE TABLE medico_convs (
id_med_conv INT(4) PRIMARY KEY auto_increment,
nome VARCHAR(50),
cpf CHAR(11),
especialidade VARCHAR(30),
email VARCHAR(100),
senha VARCHAR(100),
crm CHAR(13),
sexo ENUM("M","F"),
cargo VARCHAR(30),
created_at timestamp default current_timestamp() ON UPDATE current_timestamp(),
update_at timestamp default current_timestamp(),

/* CHAVE ESTRANGEIRA*/
id_gest_conv INT(4),
FOREIGN KEY (id_gest_conv) 
references gestores (idgestor),

id_exame_conv INT(4),
FOREIGN KEY (id_exame_conv) 
references exames (idexame)
);

CREATE TABLE ENDERECO_MEDIDCO_CONVS (
id_end_med_conv INT(4) PRIMARY KEY auto_increment,
cep CHAR(8),
logradouro VARCHAR(100),
num_end_med_conv varchar(7),
bairro VARCHAR(100),
complemento VARCHAR(50),
pt_ref VARCHAR(50),
cidade VARCHAR(60),
uf CHAR(2),
pais VARCHAR(30),
tipo_end_med_conv ENUM ('RESIDENCIAL', 'COMERCIAL'),
created_at timestamp default current_timestamp() ON UPDATE current_timestamp(),
update_at timestamp default current_timestamp(),

/* CHAVE ESTRANGEIRA*/
id_end_conv INT(4),
FOREIGN KEY (id_end_conv) 
references medico_convs (id_med_conv)
);

CREATE TABLE TEL_MEDICO_CONVS (
idtel_med_conv INT(4) PRIMARY KEY auto_increment,
ddd CHAR(2),
num_tel_med_conv VARCHAR(9),
tipo_tel_med_conv ENUM('RESIDENCIAL', 'COMERCIAL','CELULAR'),
created_at timestamp default current_timestamp() ON UPDATE current_timestamp(),
update_at timestamp default current_timestamp(),

/* CHAVE ESTRANGEIRA*/
id_tel_conv INT(4),
FOREIGN KEY (id_tel_conv) 
references medico_convs (id_med_conv)
);

/* TABELAS RECUPERAR A SENHA */

CREATE TABLE recuperar_senha (
idrecsenha INT(4) PRIMARY KEY auto_increment,
codigo CHAR(6),
email VARCHAR(100),
created_at timestamp default current_timestamp() ON UPDATE current_timestamp(),
update_at timestamp default current_timestamp()
);
