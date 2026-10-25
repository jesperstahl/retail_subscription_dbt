-- Active customers should have at least one order

select
    *
from {{ ref('fact_customer_metrics') }}
where active_customer_flag = 1
  and total_orders = 0