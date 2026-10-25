with customer_orders as (

    select

        customer_id,

        min(order_date) as first_order_date,

        max(order_date) as latest_order_date

    from {{ ref('fact_orders') }}

    group by customer_id

)

select

    customer_id,

    first_order_date,

    latest_order_date,

    case
        when first_order_date <> latest_order_date
        then 1
        else 0
    end as retained_customer

from customer_orders