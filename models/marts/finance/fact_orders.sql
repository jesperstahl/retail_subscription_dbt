{{
    config(
        materialized='incremental',
        unique_key='order_id'
    )
}}

select

    order_id,
    customer_id,
    product_id,

    order_date,

    order_amount,
    return_amount,
    net_revenue,

    returned_flag

from {{ ref('int_orders') }}

{% if is_incremental() %}

where order_date >

(
    select max(order_date)
    from {{ this }}
)

{% endif %}