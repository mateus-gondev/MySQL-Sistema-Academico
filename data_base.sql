CREATE DATABASE sistemaacademico;
USE sistemaacademico;


-- CREATE TABLE
CREATE TABLE Usuario (
id_usuario INTEGER AUTO_INCREMENT PRIMARY KEY,
nome varchar(70) NOT NULL,
cpf varchar(16) NOT NULL,
telefone varchar(16),
data_nasc date NOT NULL,
nome_usuario varchar(70) NOT NULL,
senha varchar(20) NOT NULL,
status varchar(20) NOT NULL
);
CREATE TABLE Departamento (
id_departamento INTEGER AUTO_INCREMENT PRIMARY KEY,
nome varchar(70) NOT NULL
);
CREATE TABLE Funcionario (
id_funcionario INTEGER AUTO_INCREMENT PRIMARY KEY,
salario float NOT NULL,
carg_horaria varchar(40),
data_contratacao date NOT NULL,
id_departamento INTEGER,
id_usuario INTEGER,
FOREIGN KEY (id_departamento) REFERENCES Departamento(id_departamento),
FOREIGN KEY (id_usuario) REFERENCES Usuario(id_usuario)
);
CREATE TABLE Coordenador (
id_coord INTEGER AUTO_INCREMENT PRIMARY KEY,
id_usuario INTEGER,
id_funcionario INTEGER,
FOREIGN KEY (id_usuario) REFERENCES Usuario(id_usuario),
FOREIGN KEY (id_funcionario) REFERENCES Funcionario(id_funcionario)
);
CREATE TABLE Diretoria (
id_diretoria INTEGER AUTO_INCREMENT PRIMARY KEY,
id_usuario INTEGER,
id_funcionario INTEGER,
FOREIGN KEY (id_usuario) REFERENCES Usuario(id_usuario),
FOREIGN KEY (id_funcionario) REFERENCES Funcionario(id_funcionario)
);
CREATE TABLE Professor (
id_professor INTEGER AUTO_INCREMENT PRIMARY KEY,
id_usuario INTEGER,
id_funcionario INTEGER,
FOREIGN KEY (id_usuario) REFERENCES Usuario(id_usuario),
FOREIGN KEY (id_funcionario) REFERENCES Funcionario(id_funcionario)
);
CREATE TABLE Curso (
id_curso INTEGER AUTO_INCREMENT PRIMARY KEY,
codigo INTEGER NOT NULL,
nome varchar(70) NOT NULL,
duracao varchar(40) NOT NULL,
quant_matricula INTEGER NOT NULL,
tipo varchar(60) NOT NULL,
id_coord INTEGER,
FOREIGN KEY (id_coord) REFERENCES Coordenador(id_coord)
);
CREATE TABLE Turma (
id_turma INTEGER AUTO_INCREMENT PRIMARY KEY,
codigo INTEGER NOT NULL,
semestre varchar(60) NOT NULL,
quant_aluno INTEGER NOT NULL,
turno varchar(30) NOT NULL,
id_professor INTEGER,
FOREIGN KEY (id_professor) REFERENCES Professor(id_professor)
);
CREATE TABLE Disciplina (
id_disciplina INTEGER AUTO_INCREMENT PRIMARY KEY,
codigo INTEGER NOT NULL,
nome varchar(70) NOT NULL,
semestre varchar(70) NOT NULL,
id_curso INTEGER,
FOREIGN KEY (id_curso) REFERENCES Curso(id_curso)
);
CREATE TABLE Atividade (
id_atividade INTEGER AUTO_INCREMENT PRIMARY KEY,
nome varchar(60) NOT NULL,
data_publicada date NOT NULL,
data_limite date NOT NULL,
tipo varchar(60) NOT NULL,
peso float,
id_disciplina INTEGER,
FOREIGN KEY (id_disciplina) REFERENCES Disciplina(id_disciplina)
);
CREATE TABLE Matricula (
id_matricula INTEGER AUTO_INCREMENT PRIMARY KEY,
data_matricula_inicio date NOT NULL,
data_matricula_fim date NOT NULL,
id_curso INTEGER,
id_turma INTEGER,
FOREIGN KEY (id_curso) REFERENCES Curso(id_curso),
FOREIGN KEY (id_turma) REFERENCES Turma(id_turma)
);
CREATE TABLE Aluno (
id_aluno INTEGER AUTO_INCREMENT PRIMARY KEY,
id_matricula INTEGER,
id_usuario INTEGER,
FOREIGN KEY (id_matricula) REFERENCES Matricula(id_matricula),
FOREIGN KEY (id_usuario) REFERENCES Usuario(id_usuario)
);
CREATE TABLE Nota (
id_nota INTEGER AUTO_INCREMENT PRIMARY KEY,
valor_nota float,
data_atribuicao date,
id_matricula INTEGER,
id_disciplina INTEGER,
id_atividade INTEGER,
FOREIGN KEY (id_matricula) REFERENCES Matricula(id_matricula),
FOREIGN KEY (id_disciplina) REFERENCES Disciplina(id_disciplina),
FOREIGN KEY (id_atividade) REFERENCES Atividade(id_atividade)
);
CREATE TABLE Historico (
id_historico INTEGER AUTO_INCREMENT PRIMARY KEY,
semestre varchar(60) NOT NULL,
id_nota INTEGER,
id_matricula INTEGER,
id_disciplina INTEGER,
FOREIGN KEY (id_nota) REFERENCES Nota(id_nota),
FOREIGN KEY (id_matricula) REFERENCES Matricula(id_matricula),
FOREIGN KEY (id_disciplina) REFERENCES Disciplina(id_disciplina)
);

-- INSERINDO VALORES AS TABELAS.
INSERT INTO Departamento (nome) VALUES ('Acadêmico'), ('Secretaria'),('Diretoria acadêmica'), ('Marketing'), ('Tecnologia da Informação');

INSERT INTO Funcionario (salario, carg_horaria, data_contratacao, id_departamento, id_usuario) VALUES
(22700, '50 Horas semanais','2023-03-06', 3, 2 ),
(20700, '45 Horas semanais','2014-03-06', 1, 12 ),
(32700, '45 Horas semanais','2013-03-06', 1, 13 ),
(2700, '40 Horas semanais','2015-04-01', 1, 14 ),
(5700, '40 Horas semanais','2015-04-02', 1, 15 ),
(1400, '20 Horas semanais','2024-03-12', 5, 4),
(1400, '20 Horas semanais','2024-04-18', 5, 9);

INSERT INTO Curso (codigo, nome, duracao, tipo, quant_matricula, id_coord) VALUES
(1001, 'Análise e Desenvolvimento de Sistemas', '2 Anos e 5 meses', 'Tecnólogo', 4, 1),
(1002, 'Ciências da Computação', '5 Anos', 'Bacharelado', 3, 1),
(1003, 'Administração', '4 Anos', 'Bacharelado', 3, 2);

INSERT INTO Turma (codigo, semestre, quant_aluno, turno, id_professor) VALUES
(2001, '2024.2', 7, 'Noturno', 1), (2002, '2024.2', 3, 'Matutino', 2);

INSERT INTO Disciplina (codigo, nome, semestre, id_curso) VALUES
(3001, 'Lógica da Programação', '1º Semestre', 1),
(3002, 'Intordução ao Java', '1º Semestre', 2 ),
(3003, 'Banco de Dados com SQL' ,'2º Semestre', 1),
(3004, 'Html/css e Javascript' ,'2º Semestre', 2 ),
(3005, 'Introdução a gestão' ,'1º Semestre', 3 ),
(3006, 'Administrando Tempo' ,'2º Semestre', 3 );

INSERT INTO Atividade (nome, data_publicada, data_limite, tipo, peso, id_disciplina ) VALUES
('Entre 01 Ideia do sistemas', '2024-08-07', '2024-08-12', 'Projeto', 20.0, 3),
('Entre 02 Andamento do sistema', '2024-08-17', '2024-08-22', 'Projeto', 20.0, 3),
('Prova avaliativa', '2024-09-03', '2024-09-03', 'Exame Final', 20.0, 3),
('Entre 01 Ideia do sistemas', '2024-08-07', '2024-08-12', 'Projeto', 20.0, 4),
('Entre 02 Andamento do sistema', '2024-08-17', '2024-08-22', 'Projeto', 20.0, 4),
('Prova avaliativa', '2024-09-03', '2024-09-03', 'Exame Final', 20.0, 4),
('Entre 01 Ideia do sistemas', '2024-08-07', '2024-08-12', 'Projeto', 20.0, 6),
('Entre 02 Andamento do sistema', '2024-08-17', '2024-08-22', 'Projeto', 20.0, 6),
('Prova avaliativa', '2024-09-03', '2024-09-03', 'Exame Final', 20.0, 6);

INSERT INTO Matricula (data_matricula_inicio, data_matricula_fim, id_curso, id_turma) VALUES 
('2024-03-05', '2026-06-07', 1, 1), ('2024-03-06', '2026-06-08', 1, 1), ('2024-03-06', '2026-06-08', 1, 1),
('2024-03-04', '2026-06-06', 1, 1), ('2024-03-05', '2026-06-07', 2, 1), ('2024-03-06', '2026-06-08', 2, 1),
('2024-03-06', '2026-06-08', 2, 1), ('2024-03-05', '2026-06-07', 3, 2), ('2024-03-06', '2026-06-08', 3, 2),
('2024-03-06', '2026-06-08', 3, 2);

INSERT INTO Aluno (id_matricula, id_usuario) VALUES
(1,1),(2,3),(3,4),(4,5),(5,6),(6,7),(7,8),(8,9),(9,10),(10,11);

INSERT INTO Nota (valor_nota, data_atribuicao, id_matricula, id_disciplina, id_atividade ) VALUES 
(8.5, '2024-08-12', 1,3,1), (10, '2024-08-22', 1,3,2),  (10, '2024-09-5', 1,3,3),
(10, '2024-08-12', 2,3,1),  (8.8, '2024-08-22', 2,3,2), (10, '2024-09-5', 2,3,3),
(10, '2024-08-12', 3,3,1),  (10, '2024-08-22', 3,3,2),  (9, '2024-09-5', 3,3,3),
(10.0, '2024-09-5', 4,3,1), (7.8, '2024-09-5', 4,3,2), (7.8, '2024-09-5', 4,3,3),
(6.8, '2024-08-12', 5,4,4), (7.0, '2024-08-22', 5,4,5), (4.1, '2024-09-5', 5,4,6),
(7.8, '2024-08-12', 6,4,4), (9.9, '2024-08-22', 6,4,5), (9.7, '2024-09-5', 6,4,6),
(5.6, '2024-08-12', 7,4,4), (6.7, '2024-08-22', 7,4,5), (9.6, '2024-09-5', 7,4,6),
(5.9, '2024-08-12', 8,6,7), (7.0, '2024-08-22', 8,6,8), (4.1, '2024-09-5', 8,6,9),
(5.0, '2024-08-12', 9,6,7), (6.0, '2024-08-22', 9,6,8), (4.1, '2024-09-5', 9,6,9),
(5.0, '2024-08-12', 10,6,7), (6.0, '2024-08-22', 10,6,8), (4.1, '2024-09-5', 10,6,9);

INSERT INTO Historico ( semestre, id_nota, id_matricula, id_disciplina) VALUES 
('2024.2', 1,1,3),('2024.2', 2,1,3),('2024.2', 3,1,3),
('2024.2', 4,2,3),('2024.2', 5,2,3),('2024.2', 6,2,3),
('2024.2', 7,3,3),('2024.2', 8,3,3),('2024.2', 9,3,3),
('2024.2', 10,4,3),('2024.2', 11,4,3),('2024.2', 12,4,3),
('2024.2', 13,5,4),('2024.2', 14,5,4),('2024.2', 15,5,4),
('2024.2', 16,6,4),('2024.2', 17,6,4),('2024.2', 18,6,4),
('2024.2', 19,7,4),('2024.2', 20,7,4),('2024.2', 21,7,4),
('2024.2', 22,8,6),('2024.2', 23,8,6),('2024.2', 24,8,6),
('2024.2', 25,9,6),('2024.2', 26,9,6),('2024.2', 26,9,6),
('2024.2', 27,10,6),('2024.2', 28,10,6),('2024.2', 29,10,6);

INSERT INTO Diretoria (id_usuario, id_funcionario) VALUES (2, 1);
INSERT INTO Coordenador (id_usuario, id_funcionario) VALUES (12, 2), (13, 3);
INSERT INTO Professor (id_usuario, id_funcionario) VALUES (12, 2), (13, 3), (14, 4), (15, 5);

INSERT INTO Usuario (nome, cpf, telefone, data_nasc, nome_usuario, senha, status) VALUES
('nome1', '111.111.111-11', '81 912345678', '2004-07-22', 'nomeuser1', '12345', 'Ativo'),
('nome2', '222.222.222-22', '81 912345678', '2006-07-22', 'nomeuser2', 'neymarhexa2026******', 'Ativo'),
('nome3', '333.333.333-33', '84 933456789', '2000-09-18', 'nomeuser3', 'sansão012', 'Ativo'),
('nome4', '444.444.444-44', '11 957654321', '1985-06-10', 'nomeuser4', 'senha789', 'Ativo'),
('nome5', '555.555.555-55', '21 981234567', '1999-12-02', 'nomeuser5', 'senha321', 'Ativo'),
('nome6', '666.666.666-66', '31 962345678', '2001-04-28', 'nomeuser6', 'senha654', 'Inativo'),
('nome7', '777.777.777-77', '41 974567890', '1988-11-19', 'nomeuser7', 'senha987', 'Ativo'),
('nome8', '888.888.888-88', '81 912789123', '1990-05-14', 'nomeuser8', 'senha789', 'Inativo'),
('nome9', '999.999.999-99', '84 911234567', '2002-08-10', 'nomeuser9', 'senha101', 'Inativo'),
('nome10', '111.111.111-00', '11 914567892', '2000-02-18', 'nomeuser10', 'senha102', 'Ativo'),
('nome11', '222.222.222-11', '21 915678123', '1993-11-25', 'nomeuser11', 'senha103', 'Ativo'),
('nome12', '333.333.333-22', '81 912345678', '1998-02-12', 'nomeuser12', 'senha123', 'Ativo'),
('nome13', '444.444.444-33', '84 933456789', '1995-08-23', 'nomeuser13', 'senha456', 'Ativo'),
('nome14', '555.555.555-44', '11 957654321', '2002-11-14', 'nomeuser14', 'senha789', 'Ativo'),
('nome15', '666.666.666-55', '21 981234567', '1998-04-19', 'nomeuser15', 'senha321', 'Ativo');

--SELEÇÃO DAS FILTROS

-- Seleciona as sequintes tabelas; Usuario, Funcionario e Departamento.
SELECT * FROM Usuario;
SELECT * FROM Funcionario;
SELECT * FROM Departamento;

-- Selecionar os alunos de um curso específico.
SELECT u.nome AS nome_aluno
FROM Aluno a
JOIN Matricula m ON a.id_matricula = m.id_matricula
JOIN Curso c ON m.id_curso = c.id_curso
JOIN Usuario u ON a.id_usuario = u.id_usuario
WHERE c.nome = 'Análise e Desenvolvimento de Sistemas'; -- Aqui mudados para o curso desejado.

-- Realiza a contagem de alunos de um determinado curso.
SELECT COUNT(*) AS total_alunos
FROM Aluno a
JOIN Matricula m ON a.id_matricula = m.id_matricula
JOIN Curso c ON m.id_curso = c.id_curso
WHERE c.nome = 'Análise e Desenvolvimento de Sistemas'; -- Aqui mudados para o curso desejado.

-- Selecionar todos os alunos de uma disciplina específica com nota maior ou igual a 7:
SELECT u.nome AS nome_aluno, d.nome AS nome_disciplina, a.nome AS nome_atividade, n.valor_nota
FROM Aluno al
JOIN Usuario u ON al.id_usuario = u.id_usuario
JOIN Matricula m ON al.id_matricula = m.id_matricula
JOIN Nota n ON n.id_matricula = m.id_matricula
JOIN Disciplina d ON n.id_disciplina = d.id_disciplina
JOIN Atividade a ON n.id_atividade = a.id_atividade
WHERE d.nome = 'Banco de Dados com SQL' -- Aqui mudados para a disciplina desejada.
AND a.nome = 'Prova avaliativa' -- Aqui mudados para o Tipo de atividade desejada.
AND n.valor_nota >=7;

-- Selecionar todos os professores com salário maior ou igual a 8.000,00:
SELECT u.nome AS nome_professor, f.salario
FROM Professor p
JOIN Funcionario f ON p.id_funcionario = f.id_funcionario
JOIN Usuario u ON p.id_usuario = u.id_usuario
WHERE f.salario >= 8000.00;

-- Listar todos os usuários que são funcionários e seus departamentos.
SELECT Usuario.nome AS Nome_Usuario, Funcionario.salario, Departamento.nome AS Nome_Departamento
FROM Usuario
JOIN Funcionario ON Usuario.id_usuario = Funcionario.id_usuario
JOIN Departamento ON Funcionario.id_departamento = Departamento.id_departamento;

-- Listar alunos matriculados em cada turma, com detalhes do curso.
SELECT Usuario.nome AS Nome_Aluno, Curso.nome AS Nome_Curso, Turma.codigo AS Codigo_Turma, Turma.semestre
FROM Aluno
JOIN Usuario ON Aluno.id_usuario = Usuario.id_usuario
JOIN Matricula ON Aluno.id_matricula = Matricula.id_matricula
JOIN Turma ON Matricula.id_turma = Turma.id_turma
JOIN Curso ON Matricula.id_curso = Curso.id_curso;


