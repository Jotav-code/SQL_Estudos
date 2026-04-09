

CREATE SCHEMA universidade;
CREATE TYPE universidade.tipo_status_discente AS ENUM ('ATIVO', 'REGULAR', 'NAOESTA');
	
    CREATE TABLE universidade.discente(
    	matricula NUMERIC(13),
      	nome VARCHAR(60),
      	ano_ingresso SMALLINT NOT NULL,
      	periodo_ingresso NUMERIC NOT NULL,
      	status_discente universidade.tipo_status_discente,
      	nome_curso VARCHAR
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
