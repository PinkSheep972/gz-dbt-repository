{% macro margin_percent(revenue, purchase_cost, decimal_places=2) %}
  {% set margin = revenue ~ ' - ' ~ purchase_cost %}
  {% set margin_percent = 'SAFE_DIVIDE(' ~ margin ~ ', ' ~ revenue ~ ')' %}
  {{ 'ROUND(' ~ margin_percent ~ ', ' ~ decimal_places ~ ')' }}
{% endmacro %}
