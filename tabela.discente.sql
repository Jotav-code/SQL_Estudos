

CREATE SCHEMA universidade;
CREATE TYPE universidade.tipo_status_discente AS ENUM ('ATIVO', 'REGULAR', 'NAOESTA');
CREATE TYPE universidade.tipo_grau AS ENUM ('graduação', 'pós graduação', 'mestrado');
CREATE TYPE universidade.tipo_nivel AS ENUM ('');
CREATE TYPE universidade.tipo_turno AS ENUM ('MATUTINO', 'VESPERTINO', 'NOTURNO');
CREATE TYPE universidade.tipo_campus AS ENUM ('São Cristovão', 'gloria');

    CREATE TABLE universidade.discente(
    	matricula NUMERIC(13),
      	nome VARCHAR(60),
      	ano_ingresso SMALLINT NOT NULL,
      	periodo_ingresso NUMERIC NOT NULL,
      	status_discente universidade.tipo_status_discente,
      	nome_curso VARCHAR
    );
    
    CREATE TABLE universidade.curso(
    	nome varchar,
      	grau universidade.tipo_grau,
      	nivel universidade.tipo_nivel,
      	turno universidade.tipo_turno,
      	campus universidade.tipo_campus
      	coordenador VARCHAR
    );
   

   

INSERT INTO universidade.discente VALUES ('202400064307', 'joao', '2024', '1', 'ATIVO', 'engenharia de computação'), ('202400029110', 'esther kelre', '2024', '1', 'ATIVO', 'engenharia de computação'), (null, 'esther kelre', '2024', '1', 'ATIVO', 'engenharia de computação');



ALTER TABLE universidade.discente 
	ADD numero NUMERIC;
    

UPDATE universidade.discente
	SET NUMERO = 7999606
    WHERE nome = 'joao';
    

UPDATE universidade.discente
	SET NUMERO = 7999606
    WHERE nome = 'esther kelre';
