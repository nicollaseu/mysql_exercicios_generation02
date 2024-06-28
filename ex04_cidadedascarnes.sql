USE db_cidade_das_carnes;

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
	('Carnes Bovinas', 'Produtos de carne bovina'),
	('Carnes Suínas', 'Produtos de carne suína'),
	('Aves', 'Produtos de carne de aves'),
	('Frutos do Mar', 'Produtos de frutos do mar'),
	('Hortifruti', 'Produtos de hortifruti');
    
INSERT INTO tb_produtos (nome, preco, estoque, categoria_id) VALUES
	('Picanha', 70.00, 30, 1),
	('Costela', 35.00, 50, 1),
	('Pernil', 25.00, 40, 2),
	('Filé de Frango', 20.00, 60, 3),
	('Camarão', 90.00, 20, 4),
	('Alface', 5.00, 100, 5),
	('Tomate', 8.00, 80, 5),
	('Peito de Frango', 22.00, 50, 3);
    
SELECT * FROM tb_produtos WHERE preco >= 50;

SELECT * FROM tb_produtos WHERE preco BETWEEN 20.00 AND 100.00;

SELECT * FROM tb_produtos WHERE nome LIKE '%C%' AND (nome = 'Costela' OR nome = 'Camarão') LIMIT 2;

SELECT p.*, c.nome AS categoria_nome
FROM tb_produtos p
INNER JOIN tb_categorias c ON p.categoria_id = c.id;

SELECT p.*, c.nome AS categoria_nome
FROM tb_produtos p
INNER JOIN tb_categorias c ON p.categoria_id = c.id
WHERE c.nome = 'Carnes Bovinas';

