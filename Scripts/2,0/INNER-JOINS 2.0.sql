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


/*------------------------- MEDICO - TELEFONE MEDICO - ENDEREÇO MEDICO -------------------------*/

select M.NOME AS 'MÉDICO RESPONSÁVEL', M.CPF, M.CRM, M.ESPECIALIDADE, T.DDD, T.NUM_TEL_MED, E.LOGRADOURO, E.TIPO_END_MED  FROM MEDICOS M
join TEL_MEDS T
on M.IDMEDICO = T.ID_TEL_MED
JOIN END_MEDS E
ON M.IDMEDICO = E.ID_END_MED;

/*------------------------- MEDICO - GESTOR - ATLETA  -------------------------*/

SELECT M.NOME AS 'MÉDICO RESPONSÁVEL', M.CPF, M.CRM, M.ESPECIALIDADE, G.NOME AS 'GESTOR', G.CPF, A.NOME AS 'ATLETA', A.CATEGORIA, A.MODALIDADE
FROM MEDICOS M
JOIN GESTORES G
ON M.ID_GESTOR_MED = G.IDGESTOR
JOIN ATLETAS A
ON A.ID_GESTOR_ATL = G.IDGESTOR;

/*------------------------- MEDICO - EXAME - MEDICO CONVIDADO -------------------------*/

SELECT M.NOME AS 'MÉDICO RESPONSÁVEL', M.CPF, M.CRM, M.ESPECIALIDADE, E.TIPO AS 'TIPO DO EXAME', E.DESCRIÇÃO AS 'DESCRIÇÃO', E.DATA_EX AS 'DATA DO EXAME', 
C.NOME AS 'MÉDICO CONVIDADO', C.CPF, C.CRM, C.ESPECIALIDADE FROM MED_CONVS c
JOIN EXAMES E
ON c.ID_MED_CONV = e.IDEXAME
join medicos m 
on m.idmedico = e.id_exame_med;

/*------------------------- MEDICO - EXAME - ATLETA -------------------------*/

SELECT M.NOME AS 'MÉDICO RESPONSÁVEL', M.CPF, M.CRM, M.ESPECIALIDADE, E.TIPO AS 'TIPO DO EXAME', E.DESCRIÇÃO AS 'DESCRIÇÃO', E.DATA_EX AS 'DATA SA SOLICITAÇÃO DO EXAME',
A.NOME AS 'ATLETA', A.CATEGORIA, A.MODALIDADE from atletaS a 
join exames e
on e.ID_EXAME_ATL = a.IDATLETA 
join medicos m
on e.ID_EXAME_MED = m.IDMEDICO;

/*------------------------- ATLETA - TELEFONE ATLETA - ENDEREÇO ATLETA -------------------------*/
select a.nome ,	E.bairro, E.NUM_END_ATL, t.num_tel_ATL, T.ddd  from ATLETAS a
inner join END_ATLS e
on e.ID_END_ATL = a.IDATLETA
inner join TEL_ATLS T
on T.ID_TEL_ATL = a.IDATLETA;

/*------------------------- MEDICO CONVIDADO - TELEFONE CONVIDADE - ENDEREÇO CONVIDADO -------------------------*/
select m.nome , m.cpf ,e.LOGRADOURO, e.bairro, e.num_end_med_conv ,t.num_tel_med_conv , t.ddd from MED_CONVS M
inner join END_MED_CONVS e
on e.ID_END_CONV = m.ID_MED_CONV
inner join TEL_MED_CONVS t
on t.ID_TEL_CONV  = m.ID_MED_CONV;

/*------------------------- GESTOR - MEDICO - END MEDICO - TEL MED (WS QUE FEZ NAO SABEMOS O PQ) -------------------------*/
select g.nome,g.sexo,g.cpf from gestores g
inner join Medicos m
on m.ID_GESTOR_MED = g.IDGESTOR
inner join END_MEDS e
on e.ID_END_MED = m.IDMEDICO
inner join TEL_MEDS t
on t.ID_TEL_MED = m.IDMEDICO;
