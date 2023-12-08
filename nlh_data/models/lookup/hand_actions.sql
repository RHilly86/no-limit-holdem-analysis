select
  id_action as action_id,
  action
from {{ source("pt4", "lookup_actions") }}