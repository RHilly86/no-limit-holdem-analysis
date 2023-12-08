select
  id_limit as limit_id,
  limit_name
from {{ source("pt4", "cash_limit") }}

