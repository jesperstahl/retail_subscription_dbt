-- Campaign costs cannot be negative

select
    *
from {{ ref('int_marketing') }}
where campaign_cost < 0