-- Renewal date must not precede start date

select
    *
from {{ ref('int_subscriptions') }}
where renewal_date is not null
  and renewal_date < start_date