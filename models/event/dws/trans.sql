select
    trans.user_id,
    trans.event_time as trans_time,
    register.event_time as register_time,
    trans.amount
from {{ source("demo", "transactions") }} as trans
inner join
    {{ source("demo", "registers") }} as register
on trans.user_id = register.user_id
