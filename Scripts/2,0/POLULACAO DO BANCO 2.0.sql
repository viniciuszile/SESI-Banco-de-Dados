use sesi ;

/* ---------------------------------- SELECTS GESTOR ---------------------------------- */

SELECT * FROM gestores;
SELECT * FROM gestor_admins;
SELECT * FROM exames;


/* ---------------------------------- SELECTS ATLETLA ---------------------------------- */

SELECT * FROM atletas;
SELECT * FROM END_ATLS;
SELECT * FROM TEL_ATLS;

/* ---------------------------------- SELECTS MEDICO ---------------------------------- */

SELECT * FROM medicos;
SELECT * FROM END_MEDS;
SELECT * FROM TEL_MEDS;

/* ---------------------------------- SELECTS MEDICO CONVIDADO ---------------------------------- */

SELECT * FROM MED_CONVS;
SELECT * FROM END_MED_CONVS;
SELECT * FROM TEL_MED_CONVS;


/*------------------------- INSERT GESTOR ADM -------------------------*/

insert into gestor_admins values (default,"rayane","54639920881","ray1234","ray@gmail.com","gestor admin", 1);

/*------------------------- INSERT GESTOR -------------------------*/

insert into gestores values (default,"vinicius","53899079817","zile1234","vinicius@gmail.com","gestor","1");
insert into gestores values (default,"ws","25694874123","ws1234","ws@gmail.com","gestor","1");

/*------------------------- INSERT ATLETA  -------------------------*/

INSERT INTO ATLETAS VALUES (DEFAULT, 'ISABEL FERREIRA', '25698745632',"ISA@GMAIL.COM", 'ISABEL123', '2000/05/20', 'F','VOLÊI', 'VOLÊI PRAIA',"SOLICITADO",'PENDENTE',"atleta", '1');
INSERT INTO END_ATLS VALUES (DEFAULT, '06814-090', 'SÃO BERNADO', 336, 'SÃO MARCOS', '', 'SERRALHERIA MM', 'EMBU DAS ARTES', 'SP', 'BRASIL','RESIDENCIAL', '1');
INSERT INTO TEL_ATLS VALUES (DEFAULT, '11', 934664070, 'CELULAR', '1');

INSERT INTO ATLETAS VALUES (DEFAULT, 'PEDRO', '45687954622',"PEDRO@GMAIL.COM", 'PEDRO123', '2000/04/7', 'M','VOLÊI','VOLÊI QUADRA',"SOLICITADO",'APROVADO',"atleta", '2');
INSERT INTO END_ATLS VALUES (DEFAULT, '04467598', 'RUA 25 DE JANIERO', 11, 'PARQUE PRIMAVERA', 'EM FRENTE A ARVORE', 'COLEGIO ISABEL VIEIRA FERREIRA', 'SAO PAULO', 'SP', 'BRASIL', 'COMERCIAL', '2');
INSERT INTO TEL_ATLS VALUES (DEFAULT, '11', 978456679, 'CELULAR', '2');

/*------------------------- INSERT MEDICO  -------------------------*/
INSERT INTO MEDICOS VALUES (DEFAULT, 'FABIO', '78955623145',"123456987",'M','FABIO@GMAIL.COM','FABIO123','CARDIOLOGISTA','Médico',1);
INSERT INTO END_MEDS VALUES (DEFAULT, '04467565', 'RUA 7 DE ABRIL', 30, 'JARDIM APURA', '', 'COLEGIO THIAGO ABERIONE', 'SAO PAULO', 'SP', 'BRASIL','RESIDENCIAL' ,'1');
INSERT INTO TEL_MEDS VALUES (DEFAULT, '11', 951234788, 'CELULAR', '1');

INSERT INTO MEDICOS VALUES (DEFAULT, 'REGINA', '45615987654',"987654321",'F','REGINA@GMAIL.COM','REGINA123','ORTOPEDISTA','Médico',2);
INSERT INTO END_MEDS VALUES (DEFAULT, '23569874', 'PORIPORÁ', 305, 'SÃO FRANCISCO', '', 'PAPELARIA ENALDO', 'SAO PAULO', 'SP', 'BRASIL','COMERCIAL', '2');
INSERT INTO TEL_MEDS VALUES (DEFAULT, '', 41492311, 'RESIDENCIAL', '2');

/*------------------------- INSERT EXAME -------------------------*/
insert into exames values (default, 'Exame de sangue','lorem', '2022/09/16', 'Pendente', 'lorem','1', '1');
insert into exames values (default, 'Exame cardiologico','lorem', '2022/05/13', 'Concluido','lorem', '2', '2');




/*------------------------- INSERT MEDICO CONVIDADO -------------------------*/

insert into MED_CONVS value(default,'Wesley','10283268584','Cardiologia','wesley12@Hotmail.com',423843258,'m','Médico convidado','1','1');
insert into END_MED_CONVS value(default,'04470389','Travessa São Sebastião',1005,'Parque Primavera','Casa A','lado do Banco','Sâo Paulo','SP','Basil','Residencial','1');
insert into TEL_MED_CONVS value(default,11,956923807,'Celular','1');

insert into MED_CONVS value(default,'Gabriel',81382590563,'Traumatologia','Gabriel1@gmail.com',455326132,'m','Médico convidado','2','2');
insert into END_MED_CONVS value(default,'04467270','Rua Adauto Lemos',36,'Vila missionaria','Casa B','lado do MC','Rio de Janeiro','Rj','Basil','Comercial','2');
insert into TEL_MED_CONVS value(default,11,956389091,'Comercial','2');