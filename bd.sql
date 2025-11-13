CREATE DATABASE IF NOT EXISTS newton_paiva;
USE newton_paiva;
CREATE TABLE IF NOT EXISTS usuarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    cpf varchar(11) NOT NULL,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    senha VARCHAR(200) NOT NULL,
    tipo ENUM('secretaria','professor','aluno') NOT NULL
);
CREATE TABLE IF NOT EXISTS alunos(
	id INT PRIMARY KEY,
	curso VARCHAR(40),
	FOREIGN KEY (id) REFERENCES usuarios(id) ON DELETE CASCADE
);
-- A tabela professores vai se relacionar com usuarios
CREATE TABLE IF NOT EXISTS professores (
	id INT PRIMARY KEY,
    titulacao VARCHAR(20),
    area_atuacao VARCHAR(20),
    FOREIGN KEY (id) REFERENCES usuarios(id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS diciplinas (
	id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    professor_id INT NOT NULL,
    FOREIGN KEY (professor_id) REFERENCES professor(id) ON DELETE RESTRICT
);



-- Tabela de notas
CREATE TABLE IF NOT EXISTS notas (
	id INT AUTO_INCREMENT PRIMARY KEY,
    disciplinas_id INT NOT NULL,
    aluno_id INT NOT NULL,
    professor_id INT NOT NULL,
    nota_trabalho DECIMAL(4,2) NOT NULL CHECK (nota_trabalho >= 0 AND nota_trabalho <= 5),
    nota_prova DECIMAL(4,2) NOT NULL CHECK (nota_prova >= 0 AND nota_prova <= 5),
    
    FOREIGN KEY (aluno_id) REFERENCES alunos(id) ON DELETE CASCADE,
    FOREIGN KEY (professor_id) REFERENCES professor_id ON DELETE CASCADE,
    FOREIGN KEY (disciplinas_id) REFERENCES disciplina(id) ON DELETE CASCADE
);