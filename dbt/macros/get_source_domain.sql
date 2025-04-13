{#
    This macro returns the domain from the sourceurl 
#}

{% macro get_source_domain(SOURCEURL) %}

    REGEXP_EXTRACT({{ SOURCEURL }}, r'https?://([^/]+)')

{% endmacro %}