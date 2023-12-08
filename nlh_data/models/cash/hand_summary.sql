select
  chs.id_hand as hand_id,
  chs.id_limit as limit_id,
  chs.id_table as table_id,
  chs.hand_no as hand_num,
  chs.date_played as hand_played_at_ts,
  chs.date_imported as hand_imported_at_ts,
  chs.cnt_players as num_players,
  chs.cnt_players_lookup_position, -- TODO: Check what this column is - it has the same values as cnt_players
  chs.cnt_players_f as num_players_flop,
  chs.cnt_players_t as num_players_turn,
  chs.cnt_players_r as num_players_river,
  chs.amt_pot as amt_pot_total,
  chs.amt_rake as amt_rake_total,
  chs.amt_jackpot_fee,
  chs.amt_short_stack as amt_effective_stack,
  chs.amt_pot_p as amt_pot_preflop,
  chs.amt_pot_f as amt_pot_flop,
  chs.amt_pot_t as amt_pot_turn,
  chs.amt_pot_r as amt_pot_river,
  
  chs.str_actors_p as str_actors_preflop,
  chs.str_actors_f as str_actors_flop,
  chs.str_actors_t as str_actors_turn,
  chs.str_actors_r as str_actors_river,
  chs.str_aggressors_p as str_aggressors_preflop,
  chs.str_aggressors_f as str_aggressors_flop,
  chs.str_aggressors_t as str_aggressors_turn,
  chs.str_aggressors_r as str_aggressors_river,
  
  chs.id_win_hand as winning_hand_id,
  chs.id_winner as winner_id,
  chs.button,
  chs.card_1 as card_1_id,
  chs.card_2 as card_2_id,
  chs.card_3 as card_3_id,
  chs.card_4 as card_4_id,
  chs.card_5 as card_5_id,
  
  cl.limit_name,
  cts.table_name,
  psp.player_name as winner_name,
  hr.hand_rank as winning_hand_rank,
  hr.hand_details as winning_hand_details
from {{ source("pt4", "cash_hand_summary") }} as chs
left join {{ ref("cash_limits") }} as cl
  on chs.id_limit = cl.limit_id
left join {{ ref("cash_table_names") }} as cts
  on chs.id_table = cts.table_id
inner join {{ ref("pokerstars_players") }} as psp
  on chs.id_winner = psp.player_id
left join {{ ref("hand_ranks") }} as hr
  on chs.id_win_hand = hr.hand_rank_id
where id_site = 100 -- Filter to just hands played on PokerStars
  