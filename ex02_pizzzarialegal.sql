USE db_pizzaria_legal;

CREATE TABLE tb_categorias (
	id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    descricao TEXT
);

CREATE TABLE tb_pizzas (
	id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    preco DECIMAL(5, 2) NOT NULL,
    tamanho VARCHAR(50) NOT NULL,
    categoria_id INT,
    FOREIGN KEY (categoria_id) REFERENCES tb_categorias(id)
);

INSERT INTO tb_categorias (nome, descricao) VALUES
	('Salgada', 'Pizzas salgadas'),
	('Doce', 'Pizzas doces'),
	('Vegetariana', 'Pizzas sem carne'),
	('Especial', 'Pizzas com ingredientes especiais'),
	('Tradicional', 'Pizzas tradicionais');

INSERT INTO tb_pizzas (nome, preco, tamanho, categoria_id) VALUES
	('Margherita', 40.00, 'Grande', 1),
	('Pepperoni', 45.00, 'Média', 1),
	('Chocolate', 35.00, 'Pequena', 2),
	('Brigadeiro', 38.00, 'Média', 2),
	('Vegetariana', 42.00, 'Grande', 3),
	('Quatro Queijos', 50.00, 'Grande', 4),
	('Calabresa', 48.00, 'Média', 5),
	('Portuguesa', 47.00, 'Grande', 5);

SELECT * FROM tb_pizzas WHERE preco > 45.00;

SELECT * FROM tb_pizzas WHERE preco BETWEEN 50.00 AND 100.00;

SELECT * FROM tb_pizzas WHERE nome LIKE '%M%';

SELECT p.*, c.nome AS categoria_nome
FROM tb_pizzas p
INNER JOIN tb_categorias c ON p.categoria_id = c.id;

SELECT p.*, c.nome AS categoria_nome
FROM tb_pizzas p
INNER JOIN tb_categorias c ON p.categoria_id = c.id
WHERE c.nome = 'Doce';
