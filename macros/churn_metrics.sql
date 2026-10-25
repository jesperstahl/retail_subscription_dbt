{% macro churn_rate(cancelled, active) %}

round(
    ({{ cancelled }} * 100.0)
    / nullif({{ active }},0),
    2
)

{% endmacro %}