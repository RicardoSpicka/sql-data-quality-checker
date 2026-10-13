# 💡 SQL Examples — Data Quality Auditing

> Practical SQL examples demonstrating how to identify and investigate data quality issues using MariaDB.

## 📚 Overview

This document presents selected SQL queries from the SQL Data Quality Checker project, explaining the techniques used and the business problems they address.

The examples cover duplicate detection, missing information, referential integrity, and invalid values.

## 1. 🔎 Detecting Duplicate Records

**Business rule:** `BR-01 — Duplicate CPF`

### Query

```sql
SELECT
    cpf,
    COUNT(*) AS quantidade
FROM clientes
WHERE cpf IS NOT NULL
  AND TRIM(cpf) <> ''
GROUP BY cpf
HAVING COUNT(*) > 1;
```

### Techniques

- `WHERE`: excludes missing or blank CPFs from duplicate analysis.
- `GROUP BY`: groups customers by CPF.
- `COUNT(*)`: counts records in each group.
- `HAVING`: returns only groups containing more than one record.

### Expected result

| CPF | Count |
|---|---:|
| `222.222.222-22` | 2 |

**Business value:** Helps identify potential duplicate customer records for further investigation.

## 2. 🧾 Identifying Missing Required Fields

**Business rules:** `BR-02`, `BR-03`, `BR-04`, and `BR-05`

### Query

```sql
SELECT
    id,
    nome,
    cpf
FROM clientes
WHERE nome IS NULL
   OR TRIM(nome) = ''
   OR cpf IS NULL
   OR TRIM(cpf) = ''
ORDER BY id;
```

### Techniques

- `IS NULL`: identifies fields without a value.
- `TRIM()`: detects strings containing only whitespace.
- `OR`: flags a record when at least one condition is true.

### Expected result

Four customer records are flagged: IDs 6, 7, 8, and 9.

**Business value:** Helps locate incomplete customer records that may affect reporting, integrations, or business processes.

## 3. 🔗 Finding Orphan Orders

**Business rule:** `BR-06 — Customer Reference Integrity`

### Query

```sql
SELECT
    p.id AS pedido_id,
    p.cliente_id,
    p.data_pedido,
    p.valor_total
FROM pedidos p
LEFT JOIN clientes c
    ON c.id = p.cliente_id
WHERE c.id IS NULL;
```

### Techniques

- `LEFT JOIN`: preserves every order in the result of the join.
- `ON`: defines the relationship between orders and customers.
- `WHERE c.id IS NULL`: identifies orders without a matching customer.

### Expected result

| Order ID | Customer ID |
|---:|---:|
| 6 | 99 |

**Business value:** Helps identify inconsistencies caused by imports, migrations, or integrations between systems.

## 4. ⚠️ Classifying Invalid Order Values

**Business rule:** `BR-07 — Non-Negative Order Amount`

### Query

```sql
SELECT
    id AS pedido_id,
    valor_total,
    CASE
        WHEN valor_total IS NULL
            THEN 'Missing amount'
        WHEN valor_total < 0
            THEN 'Negative amount'
    END AS problema
FROM pedidos
WHERE valor_total IS NULL
   OR valor_total < 0
ORDER BY id;
```

### Techniques

- `CASE`: assigns a meaningful classification to each issue.
- `IS NULL`: detects missing amounts.
- `< 0`: identifies negative amounts.
- `ORDER BY`: organizes the output by order ID.

### Expected result

| Order ID | Issue |
|---:|---|
| 8 | Negative amount |
| 9 | Missing amount |

**Business value:** Converts technical validation conditions into results that are easier to interpret and investigate.

## 5. 📊 Consolidated Audit Report

**Script:** `07_audit_report.sql`

The consolidated audit report combines findings from multiple data quality checks into a single result set.

### Key technique: `UNION ALL`

`UNION ALL` combines compatible result sets without removing duplicate rows. This allows each audit finding to remain visible, even when multiple findings refer to the same customer or order.

The report includes:

- `tipo_problema`: identifies the violated rule.
- `tabela_origem`: identifies the source table.
- `registro_id`: identifies the affected record.
- `descricao`: explains the issue.
- `valor_encontrado`: provides the relevant value when available.

**Expected result:** 10 audit findings using the original sample dataset.

The report is read-only and does not automatically modify or delete records.


## 6. 🧠 Key Takeaways

This project demonstrates how SQL can be used not only to retrieve data, but also to investigate its reliability.

The examples combine filtering, aggregation, joins, and conditional logic to translate business rules into reproducible data quality checks.

All queries identify issues without automatically modifying or deleting records.

---

*Project: SQL Data Quality Checker · Database: MariaDB*
