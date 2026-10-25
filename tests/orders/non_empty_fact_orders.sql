-- Fact table should never be empty

select
    1
where (
    select count(*)
    from {{ ref('fact_orders') }}
) = 0