
USE sql_data_quality_checker;

-- 1. Identificar pedidos com valores negativos
SELECT
    id AS pedido_id,
    cliente_id,
    data_pedido,
    valor_total,
    status
FROM pedidos
WHERE valor_total < 0
ORDER BY id;


-- 2. Consolidar pedidos com data ou valor ausente,
--    ou com valor negativo
SELECT
    id AS pedido_id,
    cliente_id,
    data_pedido,
    valor_total,
    CASE
        WHEN data_pedido IS NULL
             AND valor_total IS NULL
            THEN 'Data e valor ausentes'
        WHEN data_pedido IS NULL
            THEN 'Data ausente'
        WHEN valor_total IS NULL
            THEN 'Valor ausente'
        WHEN valor_total < 0
            THEN 'Valor negativo'
    END AS problema
FROM pedidos
WHERE data_pedido IS NULL
   OR valor_total IS NULL
   OR valor_total < 0
ORDER BY id;
