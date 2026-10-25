{% macro total_revenue(revenue_col) %}

sum({{ revenue_col }})

{% endmacro %}
