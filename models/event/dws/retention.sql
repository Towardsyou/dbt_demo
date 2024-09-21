with logins as (
    select
        user_id,
        date_trunc('day', login_time) as login_date,
        date_trunc('day', register_time) as reg_date,
        if(
            date_add(reg_date, interval '1 day')
            = date_trunc('day', login_time),
            true,
            false
        ) as retention_1_day,
        if(
            date_add(reg_date, interval '7 day')
            = date_trunc('day', login_time),
            true,
            false
        ) as retention_7_day,
        if(
            date_add(reg_date, interval '14 day')
            = date_trunc('day', login_time),
            true,
            false
        ) as retention_14_day
    from {{ ref("logins") }}
)

select
    user_id,
    bool_or(retention_1_day) as retention_1_day,
    bool_or(retention_7_day) as retention_7_day,
    bool_or(retention_14_day) as retention_14_day
from logins
group by 1
