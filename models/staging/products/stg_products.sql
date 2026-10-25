with source_data as (

    select *
    from {{ source('ecommerce', 'products') }}

)

select

    product_id,

    trim(product_name) as product_name,

    trim(product_category) as product_category,

    cast(product_price as numeric(18,2)) as product_price,

    updated_at

from source_data