DROP TABLE IF EXISTS ALUNO, DISCIPLINA, TURMA, PRE_REQUISITO, REGISTRO_NOTA, DEPARTAMENTO, CURSO, PROFESSOR;
-- faço isso pois vou rodar a tabela VARIAS vezes e precisaria estar apagando ela manualmente
-- ou criando outro SQL file para cada vez que eu for criar 

-- ao criar uma primary key o my sql faz automaticamente o não nulo e único
-- se terei so uma chave posso colocar o nome do lado do atributo que será chave primária

-- a chave estrangeira pode ser nula e não precisa ser única - ex no sigaa to matriculada em um curso e muitas outras pessoas também

CREATE TABLE ALUNO(
Nome VARCHAR(50),
Numero_aluno INT, -- TA SEM CHAVE primaria pois coloco lá embaixo como parte do exercicio
Tipo_aluno CHAR(1), -- um unico char basta G graduação P pos graduação
Curso INT-- coloco de forma mais categorica pois as pessoas podem se inscrever como BTI TI BACHARELADO EM TE......
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
-- INSERT INTO ALUNO(Nome, Numero_aluno, Tipo_aluno,Curso) VALUES ("Maria", 2, "G", "10");
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

-- ATIVIDADE aula 30/04
CREATE TABLE TURMA(
Identificador_turma int PRIMARY KEY,
Numero_disciplina int NOT NULL,
Semestre CHAR(1) NOT NULL, -- se eu não for realizar operações matemáticas com os números posso colocar um char
Ano int NOT NULL,
-- Professor INT, -- turma pode ser cadastrada sem professor (ex: fmc2)
FOREIGN KEY (Numero_disciplina) REFERENCES DISCIPLINA (Numero_disciplina)
-- FOREIGN KEY (Professor) REFERENCES PROFESSOR (Professor) 
);
 
 -- daqui para baixo reorganiza nomenclatura
 -- depois ajeitar a referenciação da turma
CREATE TABLE REGISTRO_NOTA(
Numero_aluno int,
Identificador_turma int,
Nota numeric(3,1) NOT NULL, 
FOREIGN KEY (Numero_aluno) REFERENCES ALUNO (Numero_aluno),
FOREIGN KEY (Identificador_turma) REFERENCES TURMA (Identificador_turma),
PRIMARY KEY (Numero_aluno, Identificador_turma) -- chave primária composta
);

CREATE TABLE DEPARTAMENTO(
Departamento INT PRIMARY KEY,
Nome_departamento VARCHAR(50),
Localizacao VARCHAR(150)
);

CREATE TABLE CURSO(
Curso INT NOT NULL PRIMARY KEY,
nome VARCHAR(50),
Departamento Int,
foreign key(Departamento) references DEPARTAMENTO(Departamento) -- Tomar cuidado com as numenclaturas para identificar melhor
);
CREATE TABLE PROFESSOR(
Professor INT PRIMARY KEY,
nome VARCHAR(50),
Departamento INT,
salario INT,

FOREIGN KEY (Departamento) references DEPARTAMENTO(Departamento)
);

INSERT INTO ALUNO (Nome, Numero_aluno, Tipo_aluno, Curso) VALUES
("Ana Silva", 1, "G", "10"),
("Carlos Souza", 2, "P", "20"),
("Mariana Oliveira", 3, "G", "10"),
("João Pereira", 4, "G", "30"),
("Patricia Costa", 5, "P", "10"),
("Lucas Santos", 6, "G", "20"),
("Juliana Lima", 7, "P", "30"),
("Felipe Rocha", 8, "G", "10"),
("Fernanda Alves", 9, "P", "20"),
("Rafael Martins", 10, "G", "30"),
("Beatriz Souza", 11, "P", "10"),
("Gabriel Costa", 12, "G", "20"),
("Larissa Silva", 13, "P", "30"),
("Vitor Oliveira", 14, "G", "10"),
("Cláudia Pereira", 15, "P", "20"),
("André Lima", 16, "G", "30"),
("Carla Rocha", 17, "P", "10"),
("Eduardo Santos", 18, "G", "20"),
("Amanda Costa", 19, "P", "30"),
("Marcelo Alves", 20, "G", "10");

select nome from aluno;
select nome, numero_aluno from aluno; -- a ordem com que eu inseri será exibido para mim
select distinct Curso from aluno; -- se tiver mais de um curso igual (varios alunos pertencem ao mesmo curso) então vai exibir uma única vez
select curso, curso*10 from aluno; -- faço essa operação na coluna escolhida e não altera os dados da tabela original apenas exibe a operação para mim
select curso, nome from aluno where curso = 10; -- control f
select curso, nome from aluno where curso <> 10; -- exibe todos os alunos que não sao do curso 10 'se for nome tem q ser entre'
