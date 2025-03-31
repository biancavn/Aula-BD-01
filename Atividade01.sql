DROP TABLE IF EXISTS ALUNO, DISCIPLINA, TURMA, PRE_REQUISITO, REGISTRO_NOTA;
-- faço isso pois vou rodar a tabela VARIAS vezes e precisaria estar apagando ela manualmente
-- ou criando outro SQL file para cada vez que eu for criar 

-- ao criar uma primary key o my sql faz automaticamente o não nulo e único
-- se terei so uma chave posso colocar o nome do lado do atributo que será chave primária

-- a chave estrangeira pode ser nula e não precisa ser única - ex no sigaa to matriculada em um curso e muitas outras pessoas também

CREATE TABLE ALUNO(
Nome VARCHAR(50),
Numero_aluno INT, -- TA SEM CHAVE primaria pois coloco lá embaixo como parte do exercicio
Tipo_aluno CHAR(1), -- um unico char basta G graduação P pos graduação
Curso INT -- coloco de forma mais categorica pois as pessoas podem se inscrever como BTI TI BACHARELADO EM TE......
-- categorizando fica mais facil de ter informações padronizadas

);

CREATE TABLE DISCIPLINA(
Nome_disciplina VARCHAR(50) NOT NULL UNIQUE, 
Numero_disciplina INT,
Creditos INT,
Departamento INT,
PRIMARY KEY(Numero_disciplina)
);

CREATE  TABLE PRE_REQUISITO(
Numero_disciplina INT,
Numero_pre_requisito INT,
PRIMARY KEY(Numero_disciplina, Numero_pre_requisito), 
-- uso duas pois para caracterizar o pre requisto eu preciso das disciplinas que serão o seu pre requisito e o seu proprio numero (quem é você)
-- colocando dessa forma nenhuma das duas pode ser nula
FOREIGN KEY (Numero_disciplina) REFERENCES DISCIPLINA (Numero_disciplina),
-- numero de disciplna de pre requisito referencia para numero de disciplina (que é a chave primaria) em disciplina (outra tabela)
FOREIGN KEY (Numero_pre_requisito) REFERENCES DISCIPLINA (Numero_disciplina)  -- !!! verificar como fazer isso dar certo
-- posso ter uma uma chave estrangeira composta - um exemplo disso é que ao ligar a tabela pre_requisto com outra tabela a chave estrangeira seria essa chave primaria (que é composta)
);
INSERT INTO ALUNO(Nome, Numero_aluno, Tipo_aluno,Curso) VALUES ("Maria", 2, "G", "10");
SELECT * FROM ALUNO; -- exibndo tudo dos alunos
-- para rodar clico em 'query' e executar
-- em schemas atualizar  - para aparecer as tabelas criadas

-- SET SQL_SAFE_UPDATES =0; -- medida de segurança que preciso zerar para conseguir apagar todos os dados (na vida real não precisamos apagar tudo né)
-- DELETE FROM ALUNO;	-- deleto todos os dados da tabela

-- ALTER TABLE NOME DA TABELA ADD O QUE IREI ADICIONAR
-- ALTER TABLE NOME DA TABELA MODIFY QUAL ATRIBUTO QUERO MODIFICAR E O QUE IREI

ALTER TABLE ALUNO ADD PRIMARY KEY(Numero_aluno);
ALTER TABLE ALUNO MODIFY Nome VARCHAR(50) NOT NULL, MODIFY Tipo_aluno CHAR(2) NOT NULL;
ALTER TABLE ALUNO ADD GENERO CHAR(1); -- ALTER TABLE ALUNO ADD GENERO CHAR(1) DEFAULT 'M';
ALTER TABLE ALUNO DROP GENERO; -- apaga esse atributo

-- ATIVIDADE
CREATE TABLE TURMA(
Identificador_turma int PRIMARY KEY,
Numero_disciplina int,
Semestre int,
Ano int,
Professor varchar(50),
FOREIGN KEY (Numero_disciplina) REFERENCES DISCIPLINA (Numero_disciplina) 
);

CREATE TABLE REGISTRO_NOTA(
Numero_aluno int,
Identificador_turma int,
Nota numeric(10),
FOREIGN KEY (Numero_aluno) REFERENCES ALUNO (Numero_aluno),
FOREIGN KEY (Identificador_turma) REFERENCES TURMA (Identificador_turma)
);
