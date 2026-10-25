select

    customer_id,

    sum(net_revenue) as total_revenue,

    count(distinct order_id) as total_orders,

    avg(net_revenue) as average_order_value

from {{ ref('fact_orders') }}

group by customer_id