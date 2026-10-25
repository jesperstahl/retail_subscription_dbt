with subscriptions as (

    select *
    from {{ ref('stg_subscriptions') }}

)

select

    subscription_id,
    customer_id,

    plan_type,

    start_date,
    renewal_date,
    end_date,

    subscription_status,

    case
        when subscription_status = 'ACTIVE'
        then 1
        else 0
    end as active_subscription_flag,

    case
        when subscription_status = 'CANCELLED'
        then 1
        else 0
    end as churn_flag,

    case
        when renewal_date is not null
        then 1
        else 0
    end as renewal_flag

from subscriptions