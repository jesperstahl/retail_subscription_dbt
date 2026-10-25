select

    customer_id,

    total_orders,

    lifetime_revenue as customer_lifetime_value,

    case
        when total_orders > 0
        then 1
        else 0
    end as active_customer_flag,

    first_order_date,

    latest_order_date,

    (
        latest_order_date - first_order_date
    ) as customer_lifetime_days

from {{ ref('int_customers') }}