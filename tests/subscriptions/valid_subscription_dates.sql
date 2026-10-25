-- Subscription end date cannot occur before start date

select
    *
from {{ ref('int_subscriptions') }}
where end_date is not null
  and end_date < start_date