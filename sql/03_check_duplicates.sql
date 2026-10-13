
USE sql_data_quality_checker;

-- 1. Identificar CPFs que aparecem mais de uma vez
SELECT
    cpf,
    COUNT(*) AS quantidade
FROM clientes
WHERE cpf IS NOT NULL
  AND TRIM(cpf) <> ''
GROUP BY cpf
HAVING COUNT(*) > 1;


-- 2. Identificar os clientes envolvidos nas duplicidades
SELECT
    c.id,
    c.nome,
    c.cpf,
    c.email
FROM clientes c
INNER JOIN (
    SELECT cpf
    FROM clientes
    WHERE cpf IS NOT NULL
      AND TRIM(cpf) <> ''
    GROUP BY cpf
    HAVING COUNT(*) > 1
) duplicados
    ON duplicados.cpf = c.cpf
ORDER BY c.cpf, c.id;
