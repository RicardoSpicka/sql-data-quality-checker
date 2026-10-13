
USE sql_data_quality_checker;

-- Identificar pedidos que não possuem cliente correspondente
SELECT
    p.id AS pedido_id,
    p.cliente_id,
    p.data_pedido,
    p.valor_total,
    p.status
FROM pedidos p
LEFT JOIN clientes c
    ON c.id = p.cliente_id
WHERE c.id IS NULL
ORDER BY p.id;
