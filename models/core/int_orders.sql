with orders as (

    select *
    from {{ ref('stg_orders') }}

),

returns as (

    select *
    from {{ ref('stg_returns') }}

)

select

    o.order_id,
    o.customer_id,
    o.product_id,
    o.order_date,

    o.order_amount,

    coalesce(r.return_amount,0) as return_amount,

    o.order_amount
        - coalesce(r.return_amount,0)
        as net_revenue,

    case
        when r.return_id is not null
        then true
        else false
    end as returned_flag

from orders o

left join returns r
    on o.order_id = r.order_id
