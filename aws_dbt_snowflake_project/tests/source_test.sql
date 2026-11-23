{{config(
    severity='warn'
)}}

SELECT 
    1
FROM  
    {{ source('SNOW_SCHEMA', 'bookings') }}
WHERE 
    booking_amount < 200