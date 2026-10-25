{% snapshot subscriptions_snapshot %}

{{
    config(
        target_schema='snapshots',
        unique_key='subscription_id',
        strategy='check',
        check_cols=[
            'subscription_status',
            'plan_type',
            'renewal_date',
            'end_date'
        ]
    )
}}

select *
from {{ ref('stg_subscriptions') }}

{% endsnapshot %}