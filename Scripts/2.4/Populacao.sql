use sesi ;

/* ---------------------------------- SELECTS GESTOR ---------------------------------- */

SELECT * FROM gestores;
SELECT * FROM gestor_admins;
SELECT * FROM exames;


/* ---------------------------------- SELECTS ATLETLA ---------------------------------- */

SELECT * FROM atletas;
SELECT * FROM ENDERECO_ATLETAS;
SELECT * FROM TEL_ATLETAS;

/* ---------------------------------- SELECTS MEDICO ---------------------------------- */

SELECT * FROM medicos; 
SELECT * FROM ENDERECO_MEDICOS;
SELECT * FROM TEL_MEDICOS;

/* ---------------------------------- SELECTS MEDICO CONVIDADO ---------------------------------- */

SELECT * FROM MEDICO_CONVS;
SELECT * FROM ENDERECO_MEDICO_CONVS;
SELECT * FROM TEL_MEDICO_CONVS;


/*------------------------- MEDICO - TELEFONE MEDICO - ENDEREÇO MEDICO -------------------------*/

/*------------------------- INSERT GESTOR ADM -------------------------*/

insert into gestor_admins values (default,"rayane","54639920881","ray@gmail.com","ray1234",'F',"gestor admin", NOW(), NOW());

/*------------------------- INSERT GESTOR -------------------------*/

insert into gestores values (default,"vinicius","53899079817","zile1234","vinicius@gmail.com",'M',"gestor", NOW(), NOW(),"1");
insert into gestores values (default,"ws","25694874123","ws1234","ws@gmail.com",'M',"gestor",NOW(), NOW(),"1");

/*------------------------- INSERT ATLETA  -------------------------*/

INSERT INTO ATLETAS VALUES (DEFAULT, 'ISABEL FERREIRA', '25698745632',"ISA@GMAIL.COM", 'ISABEL123', '2000/05/20', 'F','VOLÊI','LÍBERO','ATLETA', 'VOLÊI PRAIA',"SOLICITADO",'PENDENTE', NOW(), NOW(),'1');
INSERT INTO ENDERECO_ATLETAS VALUES (DEFAULT, '06814090', 'SÃO BERNADO', 336, 'SÃO MARCOS',  'SERRALHERIA MM', 'EMBU DAS ARTES','São Paulo', 'SP', 'BRASIL','RESIDENCIAL',NOW(), NOW(), '1');
INSERT INTO TEL_ATLETAS VALUES (DEFAULT, '11', 934664070, 'CELULAR',NOW(), NOW(), '1');

INSERT INTO ATLETAS VALUES (DEFAULT, 'PEDRO', '45687954622',"PEDRO@GMAIL.COM", 'PEDRO123', '2000/04/7', 'M','FUTEBOL','LATERAL','ATLETA','FUTEBOL DE CAMPO',"SOLICITADO",'APROVADO',NOW(), NOW(),'2');
INSERT INTO ENDERECO_ATLETAS VALUES (DEFAULT, '04467598', 'RUA 25 DE JANIERO', 11, 'PARQUE PRIMAVERA', 'EM FRENTE A ARVORE', 'COLEGIO ISABEL VIEIRA FERREIRA', 'SAO PAULO', 'SP', 'BRASIL', 'COMERCIAL',NOW(), NOW(), '2');
INSERT INTO TEL_ATLETAS  VALUES (DEFAULT, '11', 978456679, 'CELULAR',NOW(), NOW(), '2');

/*------------------------- INSERT MEDICO  -------------------------*/
INSERT INTO MEDICOS VALUES (DEFAULT, 'FABIO', '78955623145',"123456987",'M','FABIO@GMAIL.COM','FABIO123','CARDIOLOGISTA','Médico',NOW(), NOW(),1);
INSERT INTO ENDERECO_MEDICOS VALUES (DEFAULT, '04467565', 'RUA 7 DE ABRIL', 30, 'JARDIM APURA',  'COLEGIO THIAGO ABERIONE','avenida carminha', 'SAO PAULO', 'SP', 'BRASIL','RESIDENCIAL' , NOW(), NOW(),'1');
INSERT INTO TEL_MEDICOS VALUES (DEFAULT, '11', 951234788, 'CELULAR', NOW(), NOW(),'1');

INSERT INTO MEDICOS VALUES (DEFAULT, 'REGINA', '45615987654',"987654321",'F','REGINA@GMAIL.COM','REGINA123','ORTOPEDISTA','Médico', NOW(), NOW(),2);
INSERT INTO ENDERECO_MEDICOS VALUES (DEFAULT, '23569874', 'PORIPORÁ', 305, 'SÃO FRANCISCO', 'avenida zile', 'PAPELARIA ENALDO', 'SAO PAULO', 'SP', 'BRASIL','COMERCIAL',NOW(), NOW(), '2');
INSERT INTO TEL_MEDICOS VALUES (DEFAULT, '11', 41492311, 'RESIDENCIAL',NOW(), NOW(), '2');

/*------------------------- INSERT EXAME -------------------------*/
insert into exames values (default,"", 'Exame de sangue','lorem', '2022/09/16', 'Pendente', 'lorem', NOW(), NOW(),'1', '1');
insert into exames values (default, '','Exame cardiologico','lorem', '2022/05/13', 'Concluido','lorem', NOW(), NOW(),'2', '2');

/*------------------------- INSERT MEDICO CONVIDADO -------------------------*/

insert into medico_convs value(default,'Wesley','10283268584','Cardiologia','wesley12@Hotmail.com','ws123456',423843258,'m','Médico convidado', NOW(), NOW(),'1','1');
insert into endereco_medico_convs value(default,'04470389','Travessa São Sebastião',1005,'Parque Primavera','Casa A','lado do Banco','Sâo Paulo','SP','Basil','Residencial', NOW(), NOW(),'1');
insert into TEL_MEDICO_CONVS value(default,11,956923807,'Celular', NOW(), NOW(), '1');

insert into medico_convs value(default,'Gabriel',81382590563,'Traumatologia','Gabriel1@gmail.com','gaab1234',455326132,'m','Médico convidado',NOW(), NOW(),'2','2');
insert into endereco_medico_convs value(default,'04467270','Rua Adauto Lemos',36,'Vila missionaria','Casa B','lado do MC','Rio de Janeiro','Rj','Basil','Comercial', NOW(), NOW(),'2');
insert into TEL_MEDICO_CONVS value(default,11,956389091,'Comercial',NOW(), NOW(), '2');



