-- Order amount must be positive

select
    *
from {{ ref('fact_orders') }}
where order_amount <= 0