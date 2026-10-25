-- Customer acquisition cost must be positive
-- whenever customers were acquired

select
    *
from {{ ref('int_marketing') }}
where acquired_customers > 0
  and customer_acquisition_cost <= 0