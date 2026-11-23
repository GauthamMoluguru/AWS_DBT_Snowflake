{{config(materialized='incremental', unique_key='listing_id')}}

select
    listing_id,
    host_id,
    {{ trimmer_listings('property_type') }} as property_type,
    room_type,
    city,
    country,
    accommodates,
    bedrooms,
    bathrooms,
    {{ tag('price_per_night') }} as price_per_night_tag,
    created_at
from {{ ref('bronze_listings') }}