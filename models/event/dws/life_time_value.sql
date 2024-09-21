with trans as (
    select
        user_id,
        trans_time,
        register_time,
        date_trunc('day', trans_time) as trans_date,
        date_trunc('day', register_time) as reg_date,
        amount
    from {{ ref("trans" ) }}
)

select
    user_id,
    sum(if(date_diff('day', reg_date, trans_date) <= 7, amount, 0)) as ltv_7,
    sum(if(date_diff('day', reg_date, trans_date) <= 14, amount, 0)) as ltv_14,
    sum(if(date_diff('day', reg_date, trans_date) <= 365, amount, 0)) as ltv_365
from trans
group by 1
