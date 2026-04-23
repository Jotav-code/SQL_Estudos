-- Faz com que eu não precise digitar o nome do SCHEMA toda hora --
SET search_path TO universidade;
/*

-- Faz uma consulta ordenada --
SELECT  nome,data_nascimento FROM usuario ORDER BY nome,data_nascimento DESC;
-- Faz um consulta direcionada a uma matricula --
SELECT * FROM cursa WHERE nota >= 5;
-- Ordenar pela maior nota
SELECT * FROM cursa
WHERE nota > 5
ORDER BY nota DESC;
*/
/*

1. Liste o CPF de todos os professores do DMA
Tabela professor

2. Liste o id de todas as turmas que o aluno de matricula E101 está cursando.
Tabela Cursa

3. Liste o Nome e CPF de todos os usuários que têm telefone
tabela usuário

4. Liste o nome e o código de todas as disciplinas que tenham pré requisito e tenham mais de dois créditos
*/
-- 1 --

SELECT cpf FROM professor WHERE departamento = 'DMA';

-- 2 --

SELECT id_turma FROM cursa WHERE mat_estudante = 'E101';

-- 3 -- 

SELECT nome,cpf FROM usuario WHERE telefone IS NOT null;

-- 4 --

SELECT nome, cod_disc FROM disciplina WHERE pre_req IS NOT null AND creditos > 2;

-- juntar tabelas chave estrangeira igual a chave primaria--

SELECT * FROM cursa INNER JOIN turma ON cursa.id_turma = turma.id_turma;

-- Listar nome da discplina e nome do seu departamento responsável --

SELECT * FROM disciplina INNER JOIN departamento ON disciplina.depto_responsavel = departamento.cod_depto

