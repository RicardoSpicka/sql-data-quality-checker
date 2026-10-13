# 📋 Business Rules — SQL Data Quality Checker

> **Purpose:** Identify data quality issues in customer and order records using SQL auditing queries.

## 🎯 Project Objective

This project simulates a data quality audit in a business database. It identifies inconsistencies, missing information, duplicate records, and relationship problems without modifying or deleting data automatically.

## 👥 Customer Rules

| ID | Rule | Validation |
|---|---|---|
| `BR-01` | Duplicate CPF | Identify non-empty CPFs associated with multiple customer records. |
| `BR-02` | Required Customer Name | Flag names that are `NULL`, empty, or contain only whitespace. |
| `BR-03` | Required CPF | Flag CPFs that are `NULL`, empty, or contain only whitespace. |

## 📦 Order Rules

| ID | Rule | Validation |
|---|---|---|
| `BR-04` | Required Order Date | Identify orders without an order date. |
| `BR-05` | Required Order Amount | Identify orders without a total amount. |
| `BR-06` | Customer Reference Integrity | Identify orders that reference a non-existent customer. |
| `BR-07` | Non-Negative Order Amount | Identify orders with a negative total amount. |

## ⚙️ Audit Principles

- 🔎 **Detect, don't modify:** audit queries identify issues without automatically correcting or deleting records.
- 🧩 **Separate validations:** each SQL script focuses on specific data quality rules.
- 🧪 **Reproducible tests:** sample data includes intentional inconsistencies to validate query results.
- 📖 **Documented expectations:** expected results are recorded to support verification and future maintenance.

## 📌 Business Assumptions

- Each CPF should identify only one customer in this simplified business scenario.
- Customer names and CPFs are mandatory.
- Order dates and total amounts are mandatory.
- Every order must reference an existing customer.
- Negative order totals are invalid.
- A zero-value order is allowed under the current rules.

## 🚧 Scope and Limitations

This project demonstrates SQL-based data auditing. It does not:

- Automatically correct or delete inconsistent records.
- Enforce production database constraints.
- Validate the mathematical format or legal validity of CPF numbers.
- Implement all possible business rules for customers and orders.

The rules represent a simplified scenario and should be reviewed before being applied to a production system.

---

*Project: SQL Data Quality Checker · Database: MariaDB*