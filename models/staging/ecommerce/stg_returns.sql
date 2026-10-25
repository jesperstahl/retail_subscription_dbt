with source_data as (

    select *
    from {{ source('ecommerce', 'returns') }}

)

select

    return_id,

    order_id,

    cast(return_amount as numeric(18,2)) as return_amount,

    updated_at

from source_data