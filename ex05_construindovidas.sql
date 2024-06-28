USE db_construindo_vidas;

CREATE TABLE tb_categorias (
	id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    descricao TEXT
);

CREATE TABLE tb_produtos (
	id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    preco DECIMAL(5, 2) NOT NULL,
    estoque INT NOT NULL,
    categoria_id INT,
    FOREIGN KEY (categoria_id) REFERENCES tb_categorias(id)
);

INSERT INTO tb_categorias (nome, descricao) VALUES
	('Masculino', 'Roupas masculinas'),
	('Feminino', 'Roupas femininas'),
	('Infantil', 'Roupas infantis'),
	('Acessórios', 'Acessórios diversos'),
	('Calçados', 'Calçados variados');
    
INSERT INTO tb_produtos (nome, preco, estoque, categoria_id) VALUES
	('Camisa Social', 150.00, 20, 1),
	('Vestido', 200.00, 15, 2),
	('Calça Jeans', 120.00, 25, 1),
	('Tênis', 180.00, 30, 5),
	('Boné', 50.00, 40, 4),
	('Blusa Infantil', 60.00, 30, 3),
	('Sapatilha', 80.00, 20, 5),
	('Saia', 100.00, 25, 2);
    
SELECT * FROM tb_produtos WHERE preco > 100;

SELECT * FROM tb_produtos WHERE preco BETWEEN 50.00 AND 150.00;

SELECT * FROM tb_produtos WHERE nome LIKE '%S%' AND (nome = 'Sapatilha' OR nome = 'Saia');

SELECT p.*, c.nome AS categoria_nome
FROM tb_produtos p
INNER JOIN tb_categorias c ON p.categoria_id = c.id;

SELECT p.*, c.nome AS categoria_nome
FROM tb_produtos p
INNER JOIN tb_categorias c ON p.categoria_id = c.id
WHERE c.nome = 'Acessórios';
	