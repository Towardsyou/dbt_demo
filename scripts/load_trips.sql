create or replace schema demo;

INSTALL spatial;
LOAD spatial;

create or replace table demo.trips (
    trip_id UUID PRIMARY KEY,
    provider_id INT,
    device_id INT,
    trip_start_ts TIMESTAMP,
    trip_start_geometry GEOMETRY,
    trip_start_city varchar,
    trip_end_ts TIMESTAMP,
    trip_end_geometry GEOMETRY,
    trip_end_city varchar,
);

insert into demo.trips
select
    trip_id,
    provider_id,
    device_id,
    trip_start_ts,
    st_point(trip_start_y, trip_start_x),
    trip_start_city,
    trip_end_ts,
    st_point(trip_end_y, trip_end_x),
    trip_end_city
from 'eggs.csv'
;