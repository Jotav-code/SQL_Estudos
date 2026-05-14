SET search_path TO universidade;
--Liste o nome das disciplinas que possuem turmas

--SELECT d.nome FROM turma t JOIN disciplina d USING(cod_disc) 

--Liste o nome do estudante e o nome de cada disciplina das turmas que ele está
--cursando.

--SELECT u.nome, d.nome FROM usuario u JOIN estudante e ON(u.cpf = e.cpf) JOIN cursa USING(mat_estudante)
--JOIN turma t USING(id_turma)
--JOIN disciplina d USING(cod_disc);

--SELECT ue.nome, u.nome FROM estudante e JOIN plano pl USING(mat_estudante)
--JOIN professor p USING (mat_professor)
--JOIN usuario u ON (p.cpf = u.cpf)
--JOIN usuario ue ON (ue.cpf = e.cpf)

--Considerando todas as turmas, liste o nome do professor, o nome da disciplina que
--ele está lecionando, além disso liste os nomes de todos os alunos cursando essas turmas

--SELECT up.nome, ue.nome, d.nome FROM turma t JOIN leciona l USING(id_turma)
--JOIN disciplina d USING(cod_disc)
--JOIN professor p USING(mat_professor)
--JOIN usuario up ON(up.cpf = p.cpf)
--JOIN cursa USING(id_turma)
--JOIN estudante e USING (mat_estudante)
--JOIN usuario ue ON(ue.cpf = e.cpf );

--Liste o nome da disciplina e o nome do seu pré-requisito. - INNER JOIN

--SELECT d.nome AS disciplinas_atual, d2.nome AS pre
--FROM disciplina d
--JOIN disciplina d2 ON (d2.cod_disc = d.pre_req)

--Liste o nome do professor e o nome do seu chefe. O chefe de um professor é o
--chefe do departamento ao qual ele faz parte.

--SELECT up.nome AS professor, uc.nome AS chefe FROM professor p JOIN departamento d ON(p.departamento = d.cod_depto) 
--JOIN usuario up ON(up.cpf = p.cpf)
--JOIN professor pchefe ON(pchefe.mat_professor = d.chefe)
--JOIN usuario uc ON(uc.cpf = pchefe.cpf)

--Liste o nome da disciplina, número da turma e o nome do professor das disciplinas
--que não são pré-requisito 

/*
SELECT pr.nome, t.numero, u.nome
FROM disciplina d RIGHT JOIN disciplina pr ON (d.pre_req = pr.cod_disc)
JOIN turma t ON(pr.cod_disc = t.cod_disc)
JOIN leciona l USING(id_turma)
JOIN professor p USING(mat_professor)
JOIN usuario u USING(cpf)
WHERE d.cod_disc IS NULL
;
SELECT * FROM leciona
*/

--Liste os nome dos professores e os nomes de seus orientandos (alunos que são
--orientados), inclusive os professores sem orientando

--SELECT up.nome AS professor, u.nome AS estudante FROM plano pl
--JOIN professor p USING(mat_professor)
--JOIN usuario up ON(up.cpf = p.cpf)
--RIGHT JOIN (estudante e JOIN usuario u ON(e.cpf = u.cpf))
--USING(mat_estudante)

/*

SELECT l.id_turma, p.mat_professor FROM leciona l
RIGHT JOIN professor p ON(l.mat_professor = p.mat_professor )
WHERE l.id_turma IS NULL
;
SELECT * FROM professor
*/

SELECT cod_disc, ano_ingresso, avg(nota)media, count(*)
FROM cursa c 
JOIN turma t USING(id_turma)
	JOIN estudante USING(mat_estudante)
WHERE nota IS NOT NULL
GROUP BY cod_disc, ano_ingresso
