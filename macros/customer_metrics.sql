{% macro active_customers(status_column) %}

count(
    case
        when {{ status_column }} = 'ACTIVE'
        then customer_id
    end
)

{% endmacro %}