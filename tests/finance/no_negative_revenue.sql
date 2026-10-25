-- Revenue must never be negative

select
    *
from {{ ref('fact_revenue') }}
where total_revenue < 0