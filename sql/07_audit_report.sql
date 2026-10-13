
USE sql_data_quality_checker;

-- Consolidated data quality audit report
SELECT
    'DUPLICATE_CPF' AS tipo_problema,
    'clientes' AS tabela_origem,
    c.id AS registro_id,
    CONCAT('CPF duplicated: ', c.cpf) AS descricao,
    c.cpf AS valor_encontrado
FROM clientes c
INNER JOIN (
    SELECT cpf
    FROM clientes
    WHERE cpf IS NOT NULL
      AND TRIM(cpf) <> ''
    GROUP BY cpf
    HAVING COUNT(*) > 1
) d ON d.cpf = c.cpf

UNION ALL

SELECT
    'MISSING_CUSTOMER_NAME',
    'clientes',
    id,
    'Customer name is NULL, empty, or blank',
    nome
FROM clientes
WHERE nome IS NULL
   OR TRIM(nome) = ''

UNION ALL

SELECT
    'MISSING_CUSTOMER_CPF',
    'clientes',
    id,
    'Customer CPF is NULL or empty',
    cpf
FROM clientes
WHERE cpf IS NULL
   OR TRIM(cpf) = ''

UNION ALL

SELECT
    'MISSING_ORDER_DATE',
    'pedidos',
    id,
    'Order date is missing',
    CAST(data_pedido AS CHAR)
FROM pedidos
WHERE data_pedido IS NULL

UNION ALL

SELECT
    'MISSING_ORDER_AMOUNT',
    'pedidos',
    id,
    'Order total amount is missing',
    CAST(valor_total AS CHAR)
FROM pedidos
WHERE valor_total IS NULL

UNION ALL

SELECT
    'ORPHAN_ORDER',
    'pedidos',
    p.id,
    CONCAT('No customer found for customer_id: ', p.cliente_id),
    CAST(p.cliente_id AS CHAR)
FROM pedidos p
LEFT JOIN clientes c
    ON c.id = p.cliente_id
WHERE c.id IS NULL

UNION ALL

SELECT
    'NEGATIVE_ORDER_AMOUNT',
    'pedidos',
    id,
    'Order total amount is negative',
    CAST(valor_total AS CHAR)
FROM pedidos
WHERE valor_total < 0

ORDER BY tabela_origem, registro_id, tipo_problema;
