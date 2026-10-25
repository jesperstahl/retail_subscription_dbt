with source_data as (

    select *
    from {{ source('ecommerce', 'orders') }}

)

select

    order_id,

    customer_id,

    product_id,

    cast(order_date as date) as order_date,

    cast(order_amount as numeric(18,2)) as order_amount,

    updated_at

from source_data