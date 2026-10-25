# Retail Subscription Analytics Platform

An end-to-end analytics engineering project built with dbt and PostgreSQL.

This project demonstrates modern data transformation practices including layered modeling, data quality testing, snapshots, incremental processing, reusable macros, documentation, exposures, and CI/CD integration.

---

# Project Objective

The objective of this project is to transform raw retail and subscription data into trusted business-ready datasets for reporting and decision-making.

The solution supports analysis of:

- Revenue
- Orders
- Customer performance
- Retention
- Churn
- Subscription activity
- Marketing performance
- Customer acquisition cost (CAC)

---

# Technology Stack

- dbt Core 1.11
- PostgreSQL
- Git
- GitHub
- GitHub Actions
- dbt Docs

---

# Architecture

```text
Sources / Seeds
        │
        ▼
    Staging
        │
        ▼
      Core
        │
        ▼
      Marts
        │
        ▼
 Dashboards / Exposures
```

---

# Project Structure

```text
retail_subscription_dbt/

├── .github/
│   └── workflows/
│       └── dbt-ci.yml
│
├── macros/
│   ├── churn_metrics.sql
│   ├── customer_metrics.sql
│   ├── revenue_metrics.sql
│   └── macros.yml
│
├── models/
│
│   ├── staging/
│   │   ├── customers/
│   │   ├── ecommerce/
│   │   ├── marketing/
│   │   ├── products/
│   │   ├── subscriptions/
│   │   ├── sources.yml
│   │   └── staging_schema.yml
│
│   ├── core/
│   │   ├── int_customers.sql
│   │   ├── int_orders.sql
│   │   ├── int_subscriptions.sql
│   │   ├── int_marketing.sql
│   │   └── core_schema.yml
│
│   ├── marts/
│   │
│   │   ├── customer/
│   │   ├── finance/
│   │   ├── marketing/
│   │   └── subscription/
│   │
│   └── exposures.yml
│
├── snapshots/
│
├── seeds/
│
├── tests/
│
└── dbt_project.yml
```

---

# Data Sources

The project uses six source tables:

| Source | Description |
|----------|----------|
| customers | Customer master data |
| orders | Ecommerce orders |
| products | Product catalog |
| returns | Order returns |
| subscriptions | Subscription lifecycle events |
| campaigns | Marketing campaigns |

For local development these sources are seeded using CSV files located in:

```text
seeds/
```

---

# Staging Layer

The staging layer standardizes raw source data and performs basic cleaning.

Models:

```text
stg_customers
stg_orders
stg_products
stg_returns
stg_subscriptions
stg_campaigns
```

Responsibilities:

- Source abstraction
- Type casting
- Data standardization
- Light transformations

---

# Core Layer

The core layer applies reusable business logic.

Models:

```text
int_customers
int_orders
int_subscriptions
int_marketing
```

Responsibilities:

- Business calculations
- Reusable transformations
- KPI preparation
- Integration across domains

---

# Mart Layer

Business-ready dimensional and fact models.

## Dimensions

```text
dim_customers
dim_products
```

## Facts

```text
fact_orders
fact_revenue
fact_monthly_revenue
fact_customer_metrics
fact_retention
fact_subscriptions
fact_churn
fact_marketing_performance
```

---

# Incremental Processing

The project demonstrates incremental model processing using:

```text
fact_orders
```

Benefits:

- Faster execution
- Reduced compute cost
- Scalable processing for larger datasets

---

# Snapshots

The project tracks historical data changes using dbt snapshots.

Snapshots:

```text
customers_snapshot
subscriptions_snapshot
```

Snapshot strategy:

- Historical tracking
- Slowly changing dimensions
- Auditability

---

# Data Quality Testing

The project includes 67 automated dbt tests.

Test categories:

### Schema Tests

- unique
- not_null
- accepted_values
- relationships

### Custom Business Tests

Examples:

```text
valid_customer_activity
valid_order_amount
no_future_orders
valid_subscription_dates
valid_renewal_logic
no_cancelled_active_subscriptions
no_negative_revenue
revenue_reconciliation
valid_cac
no_negative_campaign_cost
```

---

# Reusable Macros

The project includes reusable business logic implemented as dbt macros.

Macros:

```text
revenue_metrics.sql
customer_metrics.sql
churn_metrics.sql
```

Purpose:

- Reduce code duplication
- Standardize calculations
- Improve maintainability

---

# Exposures

The project documents downstream business assets using dbt exposures.

Exposures:

```text
executive_dashboard
finance_dashboard
marketing_dashboard
```

These dashboards consume data from the mart layer.

---

# Documentation

Generate project documentation:

```bash
dbt docs generate
```

Start local documentation server:

```bash
dbt docs serve
```

Documentation includes:

- Lineage graph
- Sources
- Models
- Snapshots
- Tests
- Exposures
- Column metadata

---

# Local Execution

## Install dependencies

```bash
dbt deps
```

## Load seed data

```bash
dbt seed
```

## Parse project

```bash
dbt parse
```

## Build project

```bash
dbt build
```

## Generate documentation

```bash
dbt docs generate
```

---

# CI/CD

GitHub Actions workflow:

```text
.github/workflows/dbt-ci.yml
```

Pipeline responsibilities:

- Validate project structure
- Execute dbt commands
- Run tests
- Detect failures before deployment

---

# Validation Results

Latest successful validation:

```text
PASS=95
WARN=0
ERROR=0
```

Project assets:

```text
20 Models
2 Snapshots
6 Seeds
6 Sources
67 Tests
3 Exposures
1 Incremental Model
3 Reusable Macros
```

---

# Author

Jesper Ståhl

Retail Subscription Analytics Platform built with dbt and PostgreSQL.
