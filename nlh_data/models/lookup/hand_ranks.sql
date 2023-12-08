select
  id_hand_rank as hand_rank_id,
  id_group as group_id,
  group_name as hand_rank,
  group_details as hand_details
from {{ source("pt4", "lookup_hand_ranks") }}
