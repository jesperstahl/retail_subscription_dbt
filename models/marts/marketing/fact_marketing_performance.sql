select

    campaign_id,

    campaign_name,

    channel,

    campaign_cost,

    acquired_customers,

    customer_acquisition_cost,

    round(
        acquired_customers * 100.0 /
        nullif(
            sum(acquired_customers)
            over (),
            0
        ),
        2
    ) as acquisition_share_pct

from {{ ref('int_marketing') }}