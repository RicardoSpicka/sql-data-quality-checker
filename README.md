# 🔎 SQL Data Quality Checker

**A SQL-based data auditing project built with MariaDB to identify inconsistencies in customer and order records.**

![Database](https://img.shields.io/badge/Database-MariaDB-003545?logo=mariadb&logoColor=white)
![Language](https://img.shields.io/badge/Language-SQL-blue)
![Status](https://img.shields.io/badge/Status-In%20Progress-orange)

## 📌 About the Project

The **SQL Data Quality Checker** simulates a data quality audit in a business database.

The project uses SQL queries to identify duplicate customer records, missing required fields, orphan orders, and invalid order amounts.

The goal is to demonstrate practical SQL skills, relational data analysis, business rule validation, and technical documentation.

## 🎯 Objectives

- Identify duplicate customer CPFs.
- Detect missing or empty required fields.
- Find orders without a matching customer.
- Identify negative order amounts.
- Document business rules and expected audit results.

## 🛠️ Technologies

- **Database:** MariaDB
- **Query Language:** SQL
- **Database Client:** HeidiSQL
- **Documentation:** Markdown
- **Version Control:** Git and GitHub

## 🗂️ Project Structure

```text
sql-data-quality-checker/
├── README.md
├── sql/
│   ├── 01_create_tables.sql
│   ├── 02_insert_sample_data.sql
│   ├── 03_check_duplicates.sql
│   ├── 04_check_required_fields.sql
│   ├── 05_check_orphan_records.sql
│   └── 06_check_invalid_values.sql
└── docs/
    ├── business-rules.md
    └── expected-results.md
```

## 🔍 Data Quality Checks

| Check | Description |
|---|---|
| Duplicate CPFs | Identifies CPFs associated with multiple customer records. |
| Missing customer fields | Detects missing names and CPFs. |
| Missing order fields | Detects missing order dates and total amounts. |
| Orphan orders | Finds orders without a matching customer. |
| Invalid amounts | Identifies negative order totals. |

## 🚀 How to Run

### Prerequisites

- MariaDB Server
- HeidiSQL or another compatible SQL client

### Execution Steps

1. Clone or download this repository.
2. Open the SQL scripts in your database client.
3. Execute `01_create_tables.sql` to create the database and tables.
4. Execute `02_insert_sample_data.sql` to populate the sample dataset.
5. Execute the audit scripts individually to inspect the results.

> **Important:** Run the sample insertion script only once on a fresh dataset. Running it repeatedly will insert duplicate sample records and change the expected audit results.

## 🧪 Sample Dataset

The project includes 10 customer records and 10 order records, with intentional inconsistencies for testing.

Examples include duplicate CPFs, missing fields, an order referencing a non-existent customer, and a negative order amount.

See [`docs/expected-results.md`](docs/expected-results.md) for the expected findings.

## 📚 Documentation

- [Business Rules](docs/business-rules.md)
- [Expected Results](docs/expected-results.md)
- [SQL Examples](docs/sql-examples.md)

## ⚠️ Scope and Limitations

This is a demonstration project for SQL-based data auditing.

The queries identify inconsistencies but do not automatically modify or delete records. The sample rules are simplified and would need to be reviewed before use in a production environment.

## 👨‍💻 Author

**Ricardo Spicka**

---

*Built as a practical project to explore SQL auditing, data quality, and business rule validation.*
