# 🧪 Expected Results — SQL Data Quality Checker

> This document describes the expected outcomes of the SQL audit queries using the sample dataset.

## 📊 Test Dataset

| Entity | Expected Records |
|---|---:|
| Customers | 10 |
| Orders | 10 |

## 🔎 Audit Results

### 1. Duplicate CPFs

**Script:** `03_check_duplicates.sql`

| CPF | Expected Count |
|---|---:|
| `222.222.222-22` | 2 |

**Expected finding:** Two customer records share the same CPF: Bruno Lima and Eduardo Costa.

### 2. Missing Required Customer Fields

**Script:** `04_check_required_fields.sql`

| Customer ID | Expected Issue |
|---:|---|
| 6 | Missing name |
| 7 | Missing CPF |
| 8 | Name contains only whitespace |
| 9 | Empty CPF |

**Expected result:** 4 customer records flagged.

### 3. Missing Required Order Fields

**Script:** `04_check_required_fields.sql`

| Order ID | Expected Issue |
|---:|---|
| 7 | Missing order date |
| 9 | Missing total amount |

**Expected result:** 2 order records flagged.

### 4. Orphan Orders

**Script:** `05_check_orphan_records.sql`

| Order ID | Customer ID |
|---:|---:|
| 6 | 99 |

**Expected finding:** Order 6 references customer 99, which does not exist.

### 5. Negative Order Amounts

**Script:** `06_check_invalid_values.sql`

| Order ID | Total Amount |
|---:|---:|
| 8 | -50.00 |

**Expected result:** 1 order with a negative total amount.

### 6. Consolidated Order Audit

**Script:** `06_check_invalid_values.sql`

| Order ID | Expected Issue |
|---:|---|
| 7 | Missing order date |
| 8 | Negative total amount |
| 9 | Missing total amount |

**Expected result:** 3 orders flagged.

## ✅ Validation Summary

| Audit | Expected Findings |
|---|---:|
| Duplicate CPF groups | 1 |
| Customers with missing required fields | 4 |
| Orders with missing required fields | 2 |
| Orphan orders | 1 |
| Orders with negative amounts | 1 |
| Orders with missing or invalid values | 3 |

> **Important:** These are expected findings for the supplied sample data. Results may differ if the dataset is modified or the sample insertion script is executed more than once.

---

*Project: SQL Data Quality Checker · Database: MariaDB*