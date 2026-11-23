{% macro trimmer_hosts(col_name) %}

    {{ col_name | trim | replace(' ', '_') }}
    
{% endmacro %}