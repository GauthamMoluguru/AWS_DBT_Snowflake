{% macro trimmer_listings(col_name) %}

    {{ col_name | trim | upper }}

{% endmacro %}