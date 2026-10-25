-- A cancelled subscription cannot be marked as active

select
    *
from {{ ref('int_subscriptions') }}
where subscription_status = 'CANCELLED'
  and active_subscription_flag = 1