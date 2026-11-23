{{config(materialized='incremental', unique_key='host_id')}}

select
    host_id,
    {{ trimmer_hosts('host_name') }} as host_name,
    host_since,
    is_superhost,
    CASE WHEN response_rate > 95 THEN 'VERY GOOD' 
         WHEN response_rate > 80 THEN 'GOOD'
         WHEN response_rate > 60 THEN 'AVERAGE'
         ELSE 'POOR' 
    END as response_rate,
    created_at
from {{ ref('bronze_hosts') }}