{% macro generate_schema_name(custom_schema_name, node) %}

  {# 
    This macro dynamically generates the schema name for a model.
    - `custom_schema_name` is the schema defined in the model config (optional)
    - `node` contains information about the current model
  #}

  {# Get the environment variable that defines the prefix, or default to 'dbt' #}
  {% set env_prefix = env_var('DBT_SCHEMA_PREFIX', 'dbt') %}

  {# Use the custom schema if provided, otherwise fall back to the default #}
  {% if custom_schema_name is not none %}
      {{ env_prefix }}_{{ custom_schema_name }}
  {% else %}
      {{ env_prefix }}_{{ target.name }}  {# target.name is the target environment, e.g., dev, prod #}
  {% endif %}

{% endmacro %}
