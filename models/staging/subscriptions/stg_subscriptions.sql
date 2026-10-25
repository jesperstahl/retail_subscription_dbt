with source_data as (

    select *
    from {{ source('subscriptions', 'subscriptions') }}

)

select

    subscription_id,

    customer_id,

    upper(subscription_status) as subscription_status,

    upper(plan_type) as plan_type,

    start_date,

    renewal_date,

    end_date,

    updated_at

from source_data