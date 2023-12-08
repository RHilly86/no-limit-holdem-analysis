select
  position as position_id,
  -- Rename positions to be abbreviated/what they are commonly called
  -- online
  case 
    when description = 'BUTTON' then 'BU'
    when description = 'UTG+1' then 'HJ'
    when description = 'UTG' then 'LJ'
    else description 
  end as position,
  flg_ep as is_in_early_position,
  flg_mp as is_in_middle_position,
  case 
    when description = 'BUTTON' or description = 'CO' then true
    else false 
  end as is_in_late_position,
  case 
    when flg_sb or flg_bb then true
    else false
  end as is_in_blind
from {{ source("pt4", "lookup_positions") }}
where cnt_players = 4 -- Filter for 6-max cash games