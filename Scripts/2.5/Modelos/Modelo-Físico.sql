CREATE DATABASE SESI;
use SESI;

/*------------------------------------ TABELAS ------------------------------------*/

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
situacao enum("APROVADO","EM ANÁLISE","PENDENTE","REPROVADO"),
created_at timestamp default current_timestamp() ON UPDATE current_timestamp(),
update_at timestamp default current_timestamp(),

/* CHAVE ESTRANGEIRA 1,N */
id_gestor_atl INT(4),
FOREIGN KEY (id_gestor_atl) 
references gestores (idgestor),

id_medico_atl INT(4),
FOREIGN KEY (id_medico_atl)
references medicos (idmedico)

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
pdfexame longblob,
pdfatleta longblob,
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

CREATE TABLE endereco_medico_convs (
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

CREATE TABLE tel_medico_convs (
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


/*------------------------------------ TABELAS ------------------------------------*/

/*------------------------------------ INSERTS ------------------------------------*/
SET foreign_key_checks = 0;

/*------------------------- INSERT GESTOR ADM -------------------------*/

insert into gestor_admins values (default,"rayane","54639920881","ray@gmail.com","ray1234",'F',"gestor admin", NOW(), NOW());

/*------------------------- INSERT GESTOR -------------------------*/

insert into gestores values (default,"Vinicius","53899079817","zile1234","vinicius@gmail.com",'M',"gestor", NOW(), NOW(),"1");
insert into gestores values (default,"Wesley","25694874123","ws1234","ws@gmail.com",'M',"gestor",NOW(), NOW(),"1");
insert into gestores values (default,"Stefanny","25694874123","stefanny1234","stefanny@gmail.com",'F',"gestor",NOW(), NOW(),"1");
insert into gestores values (default,"Paula","45899256374","paula1234","paula@gmail.com",'F',"gestor",NOW(), NOW(),"1");

/*------------------------- INSERT ATLETA  -------------------------*/

INSERT INTO ATLETAS VALUES (DEFAULT, 'ISABEL FERREIRA', '25698745632',"ISA@GMAIL.COM", 'ISABEL123', '2000/05/20', 'F','VOLÊI','LÍBERO','ATLETA', 'VOLÊI PRAIA',"SOLICITADO",'PENDENTE', NOW(), NOW(), '1', '1');
INSERT INTO ENDERECO_ATLETAS VALUES (DEFAULT, '06814090', 'SÃO BERNARDO', 336, 'SÃO MARCOS', 'SERRALHERIA MM', 'EMBU DAS ARTES','São Paulo', 'SP', 'BRASIL','RESIDENCIAL', NOW(), NOW(), '1');
INSERT INTO TEL_ATLETAS VALUES (DEFAULT, '11', 934664070, 'CELULAR',NOW(), NOW(), '1');

INSERT INTO ATLETAS VALUES (DEFAULT, 'PEDRO', '45687954622',"PEDRO@GMAIL.COM", 'PEDRO123', '2000/04/7', 'M','FUTEBOL','LATERAL','ATLETA','FUTEBOL DE CAMPO',"SOLICITADO",'APROVADO',NOW(), NOW(),'2', '2');
INSERT INTO ENDERECO_ATLETAS VALUES (DEFAULT, '04467598', 'RUA 25 DE JANEIRO', 11, 'PARQUE PRIMAVERA', 'EM FRENTE A ARVORE', 'COLEGIO ISABEL VIEIRA FERREIRA', 'SAO PAULO', 'SP', 'BRASIL', 'COMERCIAL',NOW(), NOW(), '2');
INSERT INTO TEL_ATLETAS  VALUES (DEFAULT, '11', 978456679, 'CELULAR',NOW(), NOW(), '2');

/*------------------------- INSERT MEDICO  -------------------------*/
INSERT INTO MEDICOS VALUES (DEFAULT, 'FABIO', '78955623145',"123456987",'M','FABIO@GMAIL.COM','FABIO123','CARDIOLOGISTA','Médico',NOW(), NOW(),1);
INSERT INTO ENDERECO_MEDICOS VALUES (DEFAULT, '04467565', 'RUA 7 DE ABRIL', 30, 'JARDIM APURA',  'COLEGIO THIAGO ABERIONE','avenida carminha', 'SAO PAULO', 'SP', 'BRASIL','RESIDENCIAL' , NOW(), NOW(),'1');
INSERT INTO TEL_MEDICOS VALUES (DEFAULT, '11', 951234788, 'CELULAR', NOW(), NOW(),'1');

INSERT INTO MEDICOS VALUES (DEFAULT, 'REGINA', '45615987654',"987654321",'F','REGINA@GMAIL.COM','REGINA123','ORTOPEDISTA','Médico', NOW(), NOW(),2);
INSERT INTO ENDERECO_MEDICOS VALUES (DEFAULT, '23569874', 'PORIPORÁ', 305, 'SÃO FRANCISCO', 'avenida zile', 'PAPELARIA ENALDO', 'SAO PAULO', 'SP', 'BRASIL','COMERCIAL',NOW(), NOW(), '2');
INSERT INTO TEL_MEDICOS VALUES (DEFAULT, '11', 41492311, 'RESIDENCIAL',NOW(), NOW(), '2');

/*------------------------- INSERT EXAME -------------------------*/
insert into exames values (default,'','','Exame de sangue','lorem', '2022/09/16', 'Pendente', 'lorem', NOW(), NOW(),'1', '1');
insert into exames values (default,'','','Exame cardiologico','lorem', '2022/05/13', 'Concluido','lorem', NOW(), NOW(),'2', '2');

/*------------------------- INSERT MEDICO CONVIDADO -------------------------*/

insert into medico_convs value(default,'Wesley','10283268584','Cardiologia','wesley12@Hotmail.com','ws123456',423843258,'m','Médico convidado', NOW(), NOW(),'1','1');
insert into endereco_medico_convs value(default,'04470389','Travessa São Sebastião',1005,'Parque Primavera','Casa A','lado do Banco','Sâo Paulo','SP','Basil','Residencial', NOW(), NOW(),'1');
insert into TEL_MEDICO_CONVS value(default,11,956923807,'Celular', NOW(), NOW(), '1');

insert into medico_convs value(default,'Gabriel',81382590563,'Traumatologia','Gabriel1@gmail.com','gaab1234',455326132,'m','Médico convidado',NOW(), NOW(),'2','2');
insert into endereco_medico_convs value(default,'04467270','Rua Adauto Lemos',36,'Vila missionaria','Casa B','lado do MC','Rio de Janeiro','Rj','Basil','Comercial', NOW(), NOW(),'2');
insert into TEL_MEDICO_CONVS value(default,11,956389091,'Comercial',NOW(), NOW(), '2');


/*------------------------------------ INSERTS ------------------------------------*/