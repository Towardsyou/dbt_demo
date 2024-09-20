with pre as (
    select
        date_trunc('month', start_date) as start_month,
        trip_start_city,
        trip_end_city,
        sum(trip_count) as trip_count
    from {{ ref("dws_origin_destination") }}
    group by 1, 2, 3
)
select
    start_month,
    trip_start_city,
    trip_end_city,
    trip_count,
    row_number() over (partition by start_month, trip_start_city, trip_end_city order by trip_count) as rn
from pre
qualify rn <= 3
