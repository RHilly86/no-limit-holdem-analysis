select
  ctss.id_session as session_id,
  ctss.id_player as player_id,
  ctss.id_limit as limit_id,
  ctss.id_table as table_id,
  ctss.date_start as session_start_ts,
  ctss.date_end as session_end_ts,
  ctss.cnt_minutes as session_minutes,
  ctss.seat as seat_num,
  ctss.amt_pot as amt_pot_total,
  ctss.amt_won as amt_won_total,
  ctss.amt_rake as amt_rake_total,
  ctss.amt_rake_contributed,
  ctss.amt_rake_contributed_weighted,
  ctss.cnt_hands as num_hands,
  ctss.cnt_hands_won as num_hands_won,
  ctss.cnt_ttl_players as num_players_seen,
  ctss.cnt_ttl_players_flop as num_players_seen_flop,
  
  psp.player_name,
  cl.limit_name,
  ctn.table_name
  
from {{ source("pt4", "cash_table_session_summary") }} as ctss
inner join {{ ref("pokerstars_players") }} as psp
  on ctss.id_player = psp.player_id
left join {{ ref("cash_limits") }} as cl
  on ctss.id_limit = cl.limit_id
left join {{ ref("cash_table_names") }} as ctn
  on ctss.id_table = ctn.table_id


  