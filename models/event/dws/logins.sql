select
    login.user_id,
    login.event_time as login_time,
    register.event_time as register_time
from {{ source("demo", "logins") }} as login
inner join
    {{ source("demo", "registers") }} as register
on login.user_id = register.user_id
