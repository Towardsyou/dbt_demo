select
    date_trunc('month', start_date) as start_month,
    sum(trip_count) as trip_count,
    sum(duration_second) as duration_second,
    sum(distance_meter) as distance_meter,
    sum(duration_second) / sum(trip_count) as duration_second_per_trip,
    sum(distance_meter) / sum(trip_count) as distance_meter_per_trip
from {{ ref("dws_city") }}
group by 1
