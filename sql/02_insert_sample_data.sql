
USE sql_data_quality_checker;

-- Clientes válidos e registros com inconsistências intencionais
INSERT INTO clientes (nome, cpf, email) VALUES
('Ana Souza',       '111.111.111-11', 'ana@email.com'),
('Bruno Lima',      '222.222.222-22', 'bruno@email.com'),
('Carlos Mendes',   '333.333.333-33', 'carlos@email.com'),
('Daniela Alves',   '444.444.444-44', 'daniela@email.com'),
('Eduardo Costa',   '222.222.222-22', 'eduardo@email.com'),
(NULL,              '555.555.555-55', 'cliente5@email.com'),
('Fernanda Rocha',  NULL,             'fernanda@email.com'),
('  ',              '777.777.777-77', 'cliente7@email.com'),
('Gabriel Martins', '',               'gabriel@email.com'),
('Helena Oliveira', '999.999.999-99', NULL);

-- Pedidos válidos e registros com inconsistências intencionais
INSERT INTO pedidos (cliente_id, data_pedido, valor_total, status) VALUES
(1,  '2026-10-01', 150.00, 'Concluído'),
(2,  '2026-10-02', 250.50, 'Pendente'),
(3,  '2026-10-03',  89.90, 'Concluído'),
(4,  '2026-10-04', 320.00, 'Pendente'),
(1,  '2026-10-05',  75.00, 'Concluído'),
(99, '2026-10-06', 120.00, 'Pendente'),
(2,  NULL,         200.00, 'Pendente'),
(3,  '2026-10-07', -50.00, 'Concluído'),
(4,  '2026-10-08', NULL,   'Pendente'),
(1,  '2026-10-09',   0.00, 'Pendente');
