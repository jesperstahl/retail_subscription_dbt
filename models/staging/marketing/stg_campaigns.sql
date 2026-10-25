with source_data as (

    select *
    from {{ source('marketing', 'campaigns') }}

)

select

    campaign_id,

    trim(campaign_name) as campaign_name,

    upper(channel) as channel,

    cast(campaign_cost as numeric(18,2)) as campaign_cost,

    updated_at

from source_data