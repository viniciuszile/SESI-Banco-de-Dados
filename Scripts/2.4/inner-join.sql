use sesi;

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

SELECT * from MEDICOS m
inner join endereco_medicos e
on m.idmedico = e.idend_med;

/*------------------------- MEDICO - GESTOR - ATLETA  -------------------------*/

SELECT M.NOME AS 'MÉDICO RESPONSÁVEL', M.CPF, M.CRM, M.ESPECIALIDADE, G.NOME AS 'GESTOR', G.CPF, A.NOME AS 'ATLETA', A.CATEGORIA, A.MODALIDADE
FROM MEDICOS M
inner JOIN gestores G
ON m.id_gestor_med = G.IDGESTOR
JOIN ATLETAS A
ON A.ID_GESTOR_ATL = G.IDGESTOR;

/*------------------------- MEDICO - EXAME - MEDICO CONVIDADO -------------------------*/

SELECT M.NOME AS 'MÉDICO RESPONSÁVEL', M.CPF, M.CRM, M.ESPECIALIDADE, E.TIPO AS 'DESCRIÇÃO', E.DATA_EX AS 'DATA DO EXAME', 
C.NOME AS 'MÉDICO CONVIDADO', C.CPF, C.CRM, C.ESPECIALIDADE FROM medico_convs c
JOIN exames E
ON c.id_med_conv = e.idexame
join medicos m 
on m.idmedico = e.id_exame_med;

/*------------------------- MEDICO - EXAME - ATLETA -------------------------*/

SELECT M.NOME AS 'MÉDICO RESPONSÁVEL', M.CPF, M.CRM, M.ESPECIALIDADE, E.TIPO  AS 'DESCRIÇÃO', E.DATA_EX AS 'DATA SA SOLICITAÇÃO DO EXAME',
A.NOME AS 'ATLETA', A.CATEGORIA, A.MODALIDADE from atletas a 
join exames e
on e.id_exame_atl = a.IDatleta
join medicos m
on e.ID_EXAME_MED = m.IDMEDICO;


/*------------------------- ATLETA - TELEFONE ATLETA - ENDEREÇO ATLETA -------------------------*/
select a.nome As 'Nome de atletas',	E.bairro, E.NUM_END_ATL, t.num_tel_ATL, T.ddd  from ATLETAS a
inner join endereco_atletas e
on e.idend_atl= a.IDATLETA
inner join tel_atletas T
on T.idtel_atl= a.IDATLETA;

 

/*------------------------- MEDICO CONVIDADO - TELEFONE CONVIDADE - ENDEREÇO CONVIDADO -------------------------*/
select m.nome , m.cpf ,e.LOGRADOURO, e.bairro, e.num_end_med_conv ,t.num_tel_med_conv , t.ddd from MEDico_CONVS M
inner join ENDERECO_MEDICO_CONVS e
on m.ID_MED_CONV =  e.id_end_med_conv
inner join TEL_MEDICO_CONVS t
on t.idtel_med_conv  = m.ID_MED_CONV;

/*------------------------- MEDICO CONVIDADO - GESTOR -------------------------*/
select m.nome , m.cpf, m.id_gest_conv, g.nome, g.cargo, g.idgestor from medico_convs m
inner join gestores g
on m.id_gest_conv = g.idgestor;

/*------------------------- MEDICO CONVIDADO - EXAME -------------------------*/
select m.nome as 'nome do médico convidado', m.crm, m.especialidade, e.tipo from medico_convs m
inner join exames e
on m.id_exame_conv = e.idexame;
