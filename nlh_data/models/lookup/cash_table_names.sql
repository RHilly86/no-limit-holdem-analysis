select
  id_table as table_id,
  table_name
from {{ source("pt4", "cash_table") }}