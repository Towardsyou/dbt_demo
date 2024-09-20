select
    date_trunc('day', trip_start_ts) as start_date,
    trip_start_city as city,
    provider_id,
    count(distinct device_id) as device_cnt,
    count(1) as trip_count,
    SUM(date_diff('second', trip_start_ts, trip_end_ts)) as duration_second,
    SUM(ST_Distance(trip_start_geometry, trip_end_geometry)) as distance_meter,
from {{ source("demo", "trips") }}
GROUP BY 1, 2, 3
