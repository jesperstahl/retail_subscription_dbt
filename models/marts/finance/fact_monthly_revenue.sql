select

    date_trunc('month', order_date)
        as revenue_month,

    sum(net_revenue)
        as monthly_revenue

from {{ ref('fact_orders') }}

group by 1