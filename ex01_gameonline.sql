USE db_generation_game_online;

CREATE TABLE tb_classes (
	id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    descricao TEXT
);

CREATE TABLE tb_personagens (
	id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    poder_ataque INT NOT NULL,
    poder_defesa INT NOT NULL,
    nivel INT NOT NULL, 
    classe_id INT,
    FOREIGN KEY (classe_id) REFERENCES tb_classes(id)
);

INSERT INTO tb_classes (nome, descricao) VALUES
	('Guerreiro', 'Especialista em combate corpo a corpo'),
	('Mago', 'Usuário de magias e feitiços'),
	('Arqueiro', 'Especialista em combate à distância'),
	('Ladino', 'Mestre em furtividade e ataques rápidos'),
	('Clérigo', 'Curandeiro e suporte ao grupo');
    
INSERT INTO tb_personagens (nome, poder_ataque, poder_defesa, nivel, classe_id) VALUES
	('Aragorn', 2500, 1500, 10, 1),
	('Gandalf', 3000, 1000, 12, 2),
	('Legolas', 2000, 1000, 11, 3),
	('Frodo', 1200, 800, 8, 4),
	('Samwise', 1300, 850, 9, 4),
	('Gimli', 2200, 1700, 10, 1),
	('Boromir', 2400, 1600, 9, 1),
	('Elrond', 2700, 1500, 11, 2),
	('Clérigo', 1500, 1200, 9, 5);

SELECT * FROM tb_personagens WHERE poder_ataque > 2000;

SELECT * FROM tb_personagens WHERE poder_defesa BETWEEN 1000 AND 2000;

SELECT * FROM tb_personagens WHERE nome LIKE '%C%';

SELECT p.*, c.nome AS classe_nome
FROM tb_personagens p
INNER JOIN tb_classes c ON p.classe_id = c.id;

SELECT p.*, c.nome AS classe_nome
FROM tb_personagens p
INNER JOIN tb_classes c ON p.classe_id = c.id
WHERE c.nome = 'Arqueiro'
LIMIT 1;