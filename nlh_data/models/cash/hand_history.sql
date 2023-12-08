select
  id_hand as hand_id,
  history as hand_history
from {{ source("pt4", "cash_hand_histories") }}