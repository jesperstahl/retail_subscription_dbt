with customers as (

    select *
    from {{ ref('stg_customers') }}

),

orders as (

    select
        customer_id,
        count(*) as total_orders,
        min(order_date) as first_order_date,
        max(order_date) as latest_order_date,
        sum(order_amount) as lifetime_revenue
    from {{ ref('stg_orders') }}
    group by customer_id

),

subscriptions as (

    select
        customer_id,
        count(*) as total_subscriptions,
        max(subscription_status) as current_subscription_status
    from {{ ref('stg_subscriptions') }}
    group by customer_id

)

select

    c.customer_id,
    c.customer_name,
    c.email,
    c.signup_date,

    coalesce(o.total_orders,0) as total_orders,
    coalesce(o.lifetime_revenue,0) as lifetime_revenue,
    o.first_order_date,
    o.latest_order_date,

    coalesce(s.total_subscriptions,0) as total_subscriptions,
    s.current_subscription_status

from customers c

left join orders o
    on c.customer_id = o.customer_id

left join subscriptions s
    on c.customer_id = s.customer_id
