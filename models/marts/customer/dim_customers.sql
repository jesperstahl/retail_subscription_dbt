select

    customer_id,
    customer_name,
    email,
    signup_date,

    total_orders,
    lifetime_revenue,
    total_subscriptions,

    current_subscription_status

from {{ ref('int_customers') }}