

CREATE SCHEMA universidade;
CREATE TYPE universidade.tipo_status_discente AS ENUM ('ATIVO', 'REGULAR', 'NAOESTA');
CREATE TYPE universidade.tipo_grau AS ENUM ('BACHARELADO', 'LICENCIATURA', 'mestrado');
CREATE TYPE universidade.tipo_nivel AS ENUM ('GRADUADO', 'MESTRADO');
CREATE TYPE universidade.tipo_turno AS ENUM ('MATUTINO', 'VESPERTINO', 'NOTURNO');
CREATE TYPE universidade.tipo_campus AS ENUM ('São Cristovão', 'gloria');


	    CREATE TABLE universidade.curso(
      	id_curso SERIAL,
    	nome varchar,
      	grau universidade.tipo_grau,
      	nivel universidade.tipo_nivel,
      	turno universidade.tipo_turno,
      	campus universidade.tipo_campus,
      	coordenador VARCHAR,
      	PRIMARY KEY(id_curso)
    );

    CREATE TABLE universidade.discente(
    	matricula NUMERIC(13),
      	nome VARCHAR(60),
      	ano_ingresso SMALLINT NOT NULL,
      	periodo_ingresso NUMERIC NOT NULL,
      	status_discente universidade.tipo_status_discente,
      	curso INT,
      	FOREIGN KEY (curso) REFERENCES universidade.curso (id_curso)
    );
    
INSERT INTO universidade.curso (nome, grau, nivel, turno, campus, coordenador) VALUES ('engenharia de computação', 'BACHARELADO', 'GRADUADO', 'MATUTINO','gloria', 'joao vitor' ),('Sistemas de informação', 'BACHARELADO', 'GRADUADO', 'MATUTINO','gloria', 'joao vitor' ) ;   

   

INSERT INTO universidade.discente VALUES ('202400064307', 'joao', '2024', '1', 'ATIVO', 1), ('202400029110', 'esther kelre', '2024', '1', 'ATIVO', 1), (null, 'esther kelre', '2024', '1', 'ATIVO', 2);



ALTER TABLE universidade.discente 
	ADD numero NUMERIC;
    

UPDATE universidade.discente
	SET NUMERO = 7999606
    WHERE nome = 'joao';
    

UPDATE universidade.discente
	SET NUMERO = 7999606
    WHERE nome = 'esther kelre';
    

 
