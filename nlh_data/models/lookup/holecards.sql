select
  id_holecard as holecard_id,
  hole_cards as holecard,
  flg_h_suited as is_suited,
  flg_h_connector as is_connector,
  flg_h_1_gap as is_one_happer,
  flg_h_2_gap as is_two_gapper
from {{ source("pt4", "lookup_hole_cards") }}
where id_gametype = 1 -- Filter to just NLH hands (i.e. not PLO)


