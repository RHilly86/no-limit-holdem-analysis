select
  id_player as player_id,
  player_name,
  player_name_search as player_name_lowercase,
  flg_note as flag_note,
  flg_tag as flag_tag,
  flg_anonymous as flag_anonymous
from {{ source("pt4", "player") }}
where id_site = 100 -- Filter to just players in the PokerStars pool
  