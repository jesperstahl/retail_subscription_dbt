-- Net revenue after returns must never be negative

select
    *
from {{ ref('fact_orders') }}
where net_revenue < 0