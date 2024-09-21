select
    date_trunc('month', start_date) as start_month,
    provider_name,
    sum(trip_count) as trip_count
from {{ ref("dws_origin_destination") }}
join {{ ref("provider") }} using (provider_id)
group by 1, 2
order by 2, 1
