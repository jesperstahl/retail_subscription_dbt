with source_data as (

    select *
    from {{ source('customers', 'customers') }}

)

select

    customer_id,

    trim(customer_name) as customer_name,

    lower(trim(email)) as email,

    signup_date,

    acquisition_campaign_id,

    updated_at

from source_data