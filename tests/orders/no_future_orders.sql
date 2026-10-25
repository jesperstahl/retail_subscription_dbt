-- Orders cannot exist in the future

select
    *
from {{ ref('fact_orders') }}
where order_date > current_date