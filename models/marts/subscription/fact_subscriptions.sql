select

    subscription_id,

    customer_id,

    plan_type,

    start_date,
    renewal_date,
    end_date,

    subscription_status,

    active_subscription_flag,
    renewal_flag,
    churn_flag

from {{ ref('int_subscriptions') }}