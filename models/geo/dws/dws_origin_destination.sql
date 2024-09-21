select
    date_trunc('day', trip_start_ts) as start_date,
    trip_start_city,
    trip_end_city,
    provider_id,
    count(distinct device_id) as device_cnt,
    count(1) as trip_count,
    sum(date_diff('second', trip_start_ts, trip_end_ts)) as duration_second,
    sum(st_distance(trip_start_geometry, trip_end_geometry)) as distance_meter
from {{ source("demo", "trips") }}
group by 1, 2, 3, 4
