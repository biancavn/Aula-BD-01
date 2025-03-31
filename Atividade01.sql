DROP TABLE IF EXISTS ALUNO, DISCIPLINA, TURMA, PRE_REQUISITO, REGISTRO_NOTA;
-- faço isso pois vou rodar a tabela VARIAS vezes e precisaria estar apagando ela manualmente
-- ou criando outro SQL file para cada vez que eu for criar 


CREATE TABLE ALUNO(
Nome VARCHAR(50),
Numero_aluno INT,
Tipo_aluno CHAR(1), -- um unico char basta G graduação P pos graduação
Curso INT -- coloco de forma mais categorica pois as pessoas podem se inscrever como BTI TI BACHARELADO EM TE......
-- categorizando fica mais facil de ter informações semelhantes
);

CREATE TABLE DISCIPLINA(
Nome_disciplina VARCHAR(50),
Numero_disciplina INT,
Creditos INT,
Departamento INT
);
-- para rodar clico em 'query' e executar