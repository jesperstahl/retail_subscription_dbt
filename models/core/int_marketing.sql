with campaigns as (

    select *
    from {{ ref('stg_campaigns') }}

),

customers as (

    select *
    from {{ ref('stg_customers') }}

)

select

    c.campaign_id,
    c.campaign_name,
    c.channel,

    c.campaign_cost,

    count(distinct cu.customer_id)
        as acquired_customers,

    round(
        c.campaign_cost /
        nullif(count(distinct cu.customer_id),0),
        2
    ) as customer_acquisition_cost

from campaigns c

left join customers cu
    on c.campaign_id = cu.acquisition_campaign_id

group by

    c.campaign_id,
    c.campaign_name,
    c.channel,
    c.campaign_cost
