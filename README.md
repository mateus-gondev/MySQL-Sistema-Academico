![MySQL](https://img.shields.io/badge/mysql-4479A1.svg?style=for-the-badge&logo=mysql&logoColor=white)
![Visual Studio Code](https://img.shields.io/badge/Visual%20Studio%20Code-0078d7.svg?style=for-the-badge&logo=visual-studio-code&logoColor=white)



# Database - Sistema Acadêmico

Este projeto acadêmico foi desenvolvido durante a faculdade e consistiu na criação de um banco de dados para um sistema acadêmico, utilizando MySQL como ferramenta principal.

* Modelo Conceitual:

    ![Modelo Conceitual](/Modelo_Conceitual.jpg "Modelo Conceitual")

* Modelo Lógico:

    ![Modelo Lógico](/Modelo_Lógico.jpg "Modelo Lógico")

* Modelo Físico: [data_base.sql](https://github.com/mateus-gondev/MySQL-Sistema-Academico/blob/main/data_base.sql)

Além disso, desenvolvemos alguns filtros seguindo as orientações do professor responsável pelo projeto.

1.  Selecionar os alunos de um curso específico.
    ~~~ sql
    SELECT u.nome AS nome_aluno
    FROM Aluno a
    JOIN Matricula m ON a.id_matricula = m.id_matricula
    JOIN Curso c ON m.id_curso = c.id_curso
    JOIN Usuario u ON a.id_usuario = u.id_usuario
    WHERE c.nome = 'Análise e Desenvolvimento de Sistemas'; -- Aqui mudados para o curso desejado.
    ~~~

2. Realiza a contagem de alunos de um determinado curso.
    ~~~ sql
    SELECT COUNT(*) AS total_alunos
    FROM Aluno a
    JOIN Matricula m ON a.id_matricula = m.id_matricula
    JOIN Curso c ON m.id_curso = c.id_curso
    WHERE c.nome = 'Análise e Desenvolvimento de Sistemas'; -- Aqui mudados para o curso desejado.
    ~~~

3. Selecionar todos os alunos de uma disciplina específica com nota maior ou igual a 7.
    ~~~ sql
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
    ~~~

4. Selecionar todos os professores com salário maior ou igual a 8.000,00.
    ~~~ sql
    SELECT u.nome AS nome_professor, f.salario
    FROM Professor p
    JOIN Funcionario f ON p.id_funcionario = f.id_funcionario
    JOIN Usuario u ON p.id_usuario = u.id_usuario
    WHERE f.salario >= 8000.00;
    ~~~

5. Listar todos os usuários que são funcionários e seus departamentos.
    ~~~ sql
    SELECT Usuario.nome AS Nome_Usuario, Funcionario.salario, Departamento.nome AS Nome_Departamento
    FROM Usuario
    JOIN Funcionario ON Usuario.id_usuario = Funcionario.id_usuario
    JOIN Departamento ON Funcionario.id_departamento = Departamento.id_departamento;
    ~~~

6. Lista alunos matriculados em cada turma, com detalhes do curso.
    ~~~ sql
    SELECT Usuario.nome AS Nome_Aluno, Curso.nome AS Nome_Curso, Turma.codigo AS Codigo_Turma, Turma.semestre
    FROM Aluno
    JOIN Usuario ON Aluno.id_usuario = Usuario.id_usuario
    JOIN Matricula ON Aluno.id_matricula = Matricula.id_matricula
    JOIN Turma ON Matricula.id_turma = Turma.id_turma
    JOIN Curso ON Matricula.id_curso = Curso.id_curso;
    ~~~