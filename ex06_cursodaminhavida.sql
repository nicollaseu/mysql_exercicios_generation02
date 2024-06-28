USE db_curso_da_minha_vida;

CREATE TABLE tb_categorias (
	id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    descricao TEXT
);

CREATE TABLE tb_cursos ( 
	id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    descricao TEXT,
    preco DECIMAL(10, 2) NOT NULL,
    categoria_id INT,
    FOREIGN KEY (categoria_id) REFERENCES tb_categorias(id)
);

INSERT INTO tb_categorias (nome, descricao) VALUES
	('Desenvolvimento', 'Cursos relacionados ao desenvolvimento de software'),
	('Design', 'Cursos relacionados a design gráfico e digital'),
	('Marketing', 'Cursos relacionados a marketing e publicidade');
    
INSERT INTO tb_cursos (nome, descricao, preco, categoria_id) VALUES
	('Java Programming', 'Curso de Programação em Java', 200.00, 1),
	('JavaScript Basics', 'Curso de Fundamentos de JavaScript', 150.00, 1),
	('Joomla Development', 'Curso de Desenvolvimento em Joomla', 180.00, 1),
	('JSON Essentials', 'Curso de Essenciais de JSON', 100.00, 1),
	('Jenkins Automation', 'Curso de Automação com Jenkins', 250.00, 1),
	('Advanced Java', 'Curso Avançado de Java', 600.00, 1),
	('Graphic Design', 'Curso de Design Gráfico', 700.00, 2),
	('SEO Basics', 'Curso de Fundamentos de SEO', 300.00, 3),
	('Digital Marketing', 'Curso de Marketing Digital', 800.00, 3);
    
SELECT * FROM tb_cursos WHERE preco > 500.00;

SELECT * FROM tb_cursos WHERE preco BETWEEN 600.00 AND 1000.00;

SELECT * FROM tb_cursos WHERE nome LIKE '%J%';

SELECT c.*, cat.nome AS categoria_nome
FROM tb_cursos c
INNER JOIN tb_categorias cat ON c.categoria_id = cat.id;