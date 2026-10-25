select

    date_trunc('month', start_date)
        as subscription_month,

    count(*) as total_subscriptions,

    sum(churn_flag)
        as cancelled_subscriptions,

    round(
        (
            sum(churn_flag) * 100.0
        ) /
        nullif(count(*),0),
        2
    ) as churn_rate_pct

from {{ ref('fact_subscriptions') }}

group by 1