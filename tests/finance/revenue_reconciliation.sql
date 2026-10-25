with orders as (

    select
        sum(net_revenue) as revenue
    from {{ ref('fact_orders') }}

),

revenue as (

    select
        sum(total_revenue) as revenue
    from {{ ref('fact_revenue') }}

)

select
    *
from orders o
cross join revenue r
where abs(o.revenue - r.revenue) > 1