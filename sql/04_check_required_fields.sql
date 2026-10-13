
USE sql_data_quality_checker;

-- 1. Identificar clientes sem nome ou CPF
SELECT
    id,
    nome,
    cpf,
    email,
    CASE
        WHEN nome IS NULL OR TRIM(nome) = ''
            THEN 'Nome ausente'
        WHEN cpf IS NULL OR TRIM(cpf) = ''
            THEN 'CPF ausente'
    END AS problema
FROM clientes
WHERE nome IS NULL
   OR TRIM(nome) = ''
   OR cpf IS NULL
   OR TRIM(cpf) = ''
ORDER BY id;


-- 2. Identificar pedidos sem data ou valor
SELECT
    id AS pedido_id,
    cliente_id,
    data_pedido,
    valor_total,
    CASE
        WHEN data_pedido IS NULL
            THEN 'Data do pedido ausente'
        WHEN valor_total IS NULL
            THEN 'Valor do pedido ausente'
    END AS problema
FROM pedidos
WHERE data_pedido IS NULL
   OR valor_total IS NULL
ORDER BY id;
