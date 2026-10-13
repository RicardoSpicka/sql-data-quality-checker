
CREATE DATABASE IF NOT EXISTS sql_data_quality_checker
    CHARACTER SET utf8mb4
    COLLATE utf8mb4_unicode_ci;

USE sql_data_quality_checker;

CREATE TABLE IF NOT EXISTS clientes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(150),
    cpf VARCHAR(14),
    email VARCHAR(150),
    data_cadastro DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS pedidos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    cliente_id INT,
    data_pedido DATE,
    valor_total DECIMAL(10, 2),
    status VARCHAR(30)
);
