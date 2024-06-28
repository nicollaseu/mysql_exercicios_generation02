USE db_farmacia_bem_estar;

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
	('Medicamentos', 'Produtos medicinais'),
	('Beleza', 'Produtos de beleza e cuidados pessoais'),
	('Vitaminas', 'Suplementos vitamínicos'),
	('Higiene', 'Produtos de higiene pessoal'),
	('Infantil', 'Produtos para crianças e bebês');
    
INSERT INTO tb_produtos (nome, preco, estoque, categoria_id) VALUES
	('Aspirina', 10.00, 100, 1),
	('Shampoo', 25.00, 50, 2),
	('Vitamina C', 30.00, 70, 3),
	('Sabonete', 5.00, 200, 4),
	('Fralda', 40.00, 30, 5),
	('Paracetamol', 15.00, 150, 1),
	('Protetor Solar', 50.00, 20, 2),
	('Creme Dental', 7.00, 100, 4);
    
SELECT * FROM tb_produtos WHERE preco >= 50;

SELECT * FROM tb_produtos WHERE preco BETWEEN 5.00 AND 60.00;

SELECT * FROM tb_produtos WHERE nome LIKE '%C%';

SELECT p.*, c.nome AS categoria_nome
FROM tb_produtos p
INNER JOIN tb_categorias c ON p.categoria_id = c.id;

SELECT p.*, c.nome AS categoria_nome
FROM tb_produtos p
INNER JOIN tb_categorias c ON p.categoria_id = c.id
WHERE c.nome = 'Beleza';