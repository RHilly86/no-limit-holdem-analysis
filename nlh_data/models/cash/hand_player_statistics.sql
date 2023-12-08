select
  chps.id_hand as hand_id,
  chps.id_player as player_id,
  chps.id_holecard as holecard_id,
  chps.id_limit as limit_id,
  chps.id_session as session_id,
  chps.date_played as hand_played_ts,
  chps.position,
  chps.cnt_players as num_players,
  chps.cnt_players_lookup_position as num_players_lookup_position,
  
  chps.flg_p_first_raise as did_raise_first_preflop,
  chps.cnt_p_raise as num_raises_preflop,
  chps.cnt_p_call as num_calls_preflop,
  chps.flg_p_limp as did_limp_preflop,
  chps.flg_p_fold as did_fold_preflop,
  chps.flg_p_ccall as did_cold_call_preflop,
  chps.cnt_p_face_limpers as num_limpers_faced_preflop,
  chps.flg_vpip as did_vpip_preflop,
  
  chps.flg_f_bet as did_bet_flop,
  chps.cnt_f_raise as num_raises_flop,
  chps.flg_f_first_raise as did_raise_first_flop,
  chps.cnt_f_call as num_calls_flop,
  chps.flg_f_check as did_check_flop,
  chps.flg_f_check_raise as did_check_raise_flop,
  chps.flg_f_fold as did_fold_flop,
  chps.flg_f_saw as did_see_flop,
  
  chps.flg_t_bet as did_bet_turn,
  chps.cnt_t_raise as num_raises_turn,
  chps.flg_t_first_raise as did_raise_first_turn,
  chps.cnt_t_call as num_calls_turn,
  chps.flg_t_check as did_check_turn,
  chps.flg_t_check_raise as did_check_raise_turn,
  chps.flg_t_fold as did_fold_turn,
  chps.flg_t_saw as did_see_turn,
  
  chps.flg_r_bet as did_bet_river,
  chps.cnt_r_raise as num_raises_river,
  chps.flg_r_first_raise as did_raise_first_river,
  chps.cnt_r_call as num_calls_river,
  chps.flg_r_check as did_check_river,
  chps.flg_r_check_raise as did_check_raise_river,
  chps.flg_r_fold as did_fold_river,
  chps.flg_r_saw as did_see_river,
  
  chps.enum_allin,
  chps.enum_face_allin_action,
  
  chps.flg_blind_s as in_sb,
  chps.flg_blind_b as in_bb,
  chps.flg_blind_ds as did_post_dead_sb,
  chps.flg_blind_db as did_post_dead_bb,
  chps.flg_sb_steal_fold as did_fold_to_steal_sb,
  chps.flg_bb_steal_fold as did_fold_to_steal_bb,
  chps.flg_blind_def_opp as did_face_steal_blind,
  chps.flg_steal_att as did_attempt_steal,
  
  chps.flg_showdown as went_to_showdown,
  chps.flg_won_hand as won_hand,
  chps.amt_won,
  chps.amt_expected_won, 
  chps.val_equity as equity_allin,
  chps.id_final_hand as final_hand_id,
  chps.flg_showed as did_show_hand,
  chps.enum_folded,
  
  chps.flg_p_face_raise as did_face_raise_preflop,
  chps.flg_p_3bet as did_3bet_preflop,
  chps.flg_p_3bet_opp as had_opp_to_3bet_preflop,
  chps.flg_p_3bet_def_opp as did_face_3bet_preflop,
  chps.enum_p_3bet_action as action_3bet_preflop,
  chps.flg_p_4bet as did_4bet_preflop,
  chps.flg_p_4bet_opp as had_opp_to_4bet_preflop,
  chps.flg_p_4bet_def_opp as did_face_4bet_preflop,
  chps.enum_p_4bet_action as action_4bet_preflop,
  chps.flg_p_squeeze as did_squeeze_preflop,
  chps.flg_p_squeeze_opp as had_opp_to_squeeze_preflop,
  chps.flg_p_squeeze_def_opp as did_face_squeeze_preflop,
  chps.enum_p_squeeze_action as action_squeeze_preflop,
  
  chps.flg_f_face_raise as did_face_raise_flop,
  chps.flg_f_3bet as did_3bet_flop,
  chps.flg_f_3bet_opp as had_opp_to_3bet_flop,
  chps.flg_f_3bet_def_opp as did_face_3bet_flop,
  chps.enum_f_3bet_action as action_3bet_flop,
  chps.flg_f_4bet as did_4bet_flop,
  chps.flg_f_4bet_opp as had_opp_to_4bet_flop,
  chps.flg_f_4bet_def_opp as did_face_4bet_flop,
  chps.enum_f_4bet_action as action_4bet_flop,
  chps.flg_f_cbet as did_cbet_flop,
  chps.flg_f_cbet_opp as had_opp_to_cbet_flop,
  chps.flg_f_cbet_def_opp as did_face_cbet_flop,
  chps.enum_f_cbet_action as action_cbet_flop,
  chps.flg_f_donk as did_donk_flop,
  chps.flg_f_donk_opp as had_opp_to_donk_flop,
  chps.flg_f_donk_def_opp as did_face_donk_flop,
  chps.enum_f_donk_action as action_donk_flop,
  
  chps.flg_t_face_raise as did_face_raise_turn,
  chps.flg_t_3bet as did_3bet_turn,
  chps.flg_t_3bet_opp as had_opp_to_3bet_turn,
  chps.flg_t_3bet_def_opp as did_face_3bet_turn,
  chps.enum_t_3bet_action as action_3bet_turn,
  chps.flg_t_4bet as did_4bet_turn,
  chps.flg_t_4bet_opp as had_opp_to_4bet_turn,
  chps.flg_t_4bet_def_opp as did_face_4bet_turn,
  chps.enum_t_4bet_action as action_4bet_turn,
  chps.flg_t_cbet as did_cbet_turn,
  chps.flg_t_cbet_opp as had_opp_to_cbet_turn,
  chps.flg_t_cbet_def_opp as did_face_cbet_turn,
  chps.enum_t_cbet_action as action_cbet_turn,
  chps.flg_t_float as did_float_turn,
  chps.flg_t_float_opp as had_opp_to_float_turn,
  chps.flg_t_float_def_opp as did_face_float_turn,
  chps.enum_t_float_action as action_float_turn,
  chps.flg_t_donk as did_donk_turn,
  chps.flg_t_donk_opp as had_opp_to_donk_turn,
  chps.flg_t_donk_def_opp as did_face_donk_turn,
  chps.enum_t_donk_action as action_donk_turn,
  
  chps.flg_r_face_raise as did_face_raise_river,
  chps.flg_r_3bet as did_3bet_river,
  chps.flg_r_3bet_opp as had_opp_to_3bet_river,
  chps.flg_r_3bet_def_opp as did_face_3bet_river,
  chps.enum_r_3bet_action as action_3bet_river,
  chps.flg_r_4bet as did_4bet_river,
  chps.flg_r_4bet_opp as had_opp_to_4bet_river,
  chps.flg_r_4bet_def_opp as did_face_4bet_river,
  chps.enum_r_4bet_action as action_4bet_river,
  chps.flg_r_cbet as did_cbet_river,
  chps.flg_r_cbet_opp as had_opp_to_cbet_river,
  chps.flg_r_cbet_def_opp as did_face_cbet_river,
  chps.enum_r_cbet_action as action_cbet_river,
  chps.flg_r_float as did_float_river,
  chps.flg_r_float_opp as had_opp_to_float_river,
  chps.flg_r_float_def_opp as did_face_float_river,
  chps.enum_r_float_action as action_float_river,
  chps.flg_r_donk as did_donk_river,
  chps.flg_r_donk_opp as had_opp_to_donk_river,
  chps.flg_r_donk_def_opp as did_face_donk_river,
  chps.enum_r_donk_action as action_donk_river,
  
  chps.seat as seat_num,
  chps.holecard_1,
  chps.holecard_2,
  chps.flg_hero as is_hero,
  
  chps.amt_before as stack_size_preflop,
  chps.amt_blind as total_amt_blinds,
  chps.amt_ante as total_amt_antes,
  chps.amt_bet_p as amt_bet_preflop,
  chps.amt_bet_f as amt_bet_flop,
  chps.amt_bet_t as amt_bet_turn,
  chps.amt_bet_r as amt_bet_river,
  chps.amt_bet_ttl as amt_bet_total,
  
  chps.id_action_p as action_id_preflop,
  chps.id_action_f as action_id_flop,
  chps.id_action_t as action_id_turn,
  chps.id_action_r as action_id_river,
  
  chps.flg_p_open as did_open_preflop,
  chps.flg_p_open_opp as had_opp_to_open_preflop,
  
  chps.flg_f_first as is_first_to_act_flop,
  chps.flg_f_open as did_open_flop,
  chps.flg_f_open_opp as had_opp_to_open_flop,
  chps.flg_f_has_position as has_position_flop,
  
  chps.flg_t_first as is_first_to_act_turn,
  chps.flg_t_open as did_open_turn,
  chps.flg_t_open_opp as had_opp_to_open_turn,
  chps.flg_t_has_position as has_position_turn,
  
  chps.flg_r_first as is_first_to_act_river,
  chps.flg_r_open as did_open_river,
  chps.flg_r_open_opp as had_opp_to_open_river,
  chps.flg_r_has_position as has_position_river,
  
  chps.amt_p_effective_stack as effective_stack_size_preflop,
  chps.amt_f_effective_stack as effective_stack_size_flop,
  chps.amt_t_effective_stack as effective_stack_size_turn,
  chps.amt_r_effective_stack as effective_stack_size_river,
  
  chps.amt_p_raise_facing as amt_to_call_preflop,
  chps.val_p_raise_facing_pct as pct_of_pot_to_call_preflop,
  chps.amt_p_2bet_facing as amt_to_call_rfi_preflop,
  chps.val_p_2bet_facing_pct as pct_of_pot_to_call_rfi_preflop,
  chps.amt_p_3bet_facing as amt_to_call_3bet_preflop,
  chps.val_p_3bet_facing_pct as pct_of_pot_to_call_3bet_preflop,
  chps.amt_p_4bet_facing as amt_to_call_4bet_preflop,
  chps.val_p_4bet_facing_pct as pct_of_pot_to_call_4bet_preflop,
  chps.amt_p_5bet_facing as amt_to_call_5bet_preflop,
  chps.val_p_5bet_facing_pct as pct_of_pot_to_call_5bet_preflop,
  chps.val_p_raise_aggressor_pos as aggressor_position,
  chps.amt_p_raise_made as amt_raised_preflop,
  chps.val_p_raise_made_pct as pct_of_pot_raised_preflop,
  chps.amt_p_raise_made_2 as amt_raised_2_preflop,
  chps.val_p_raise_made_2_pct as pct_of_pot_raised_2_preflop,
  
  chps.amt_f_raise_facing as amt_to_call_flop,
  chps.val_f_raise_facing_pct as pct_of_pot_to_call_flop,
  chps.amt_f_2bet_facing as amt_to_call_2bet_flop,
  chps.val_f_2bet_facing_pct as pct_of_pot_to_call_2bet_flop,
  chps.amt_f_3bet_facing as amt_to_call_3bet_flop,
  chps.val_f_3bet_facing_pct as pct_of_pot_to_call_3bet_flop,
  chps.amt_f_4bet_facing as amt_to_call_4bet_flop,
  chps.val_f_4bet_facing_pct as pct_of_pot_to_call_4bet_flop,
  chps.val_f_raise_aggressor_pos as aggressor_position_flop,
  chps.amt_f_raise_made as amt_raised_flop,
  chps.val_f_raise_made_pct as pct_of_pot_raised_flop,
  chps.amt_f_raise_made_2 as amt_raised_2_flop,
  chps.val_f_raise_made_2_pct as pct_of_pot_raised_2_flop,
  
  chps.amt_t_raise_facing as amt_to_call_turn,
  chps.val_t_raise_facing_pct as pct_of_pot_to_call_turn,
  chps.amt_t_2bet_facing as amt_to_call_2bet_turn,
  chps.val_t_2bet_facing_pct as pct_of_pot_to_call_2bet_turn,
  chps.amt_t_3bet_facing as amt_to_call_3bet_turn,
  chps.val_t_3bet_facing_pct as pct_of_pot_to_call_3bet_turn,
  chps.amt_t_4bet_facing as amt_to_call_4bet_turn,
  chps.val_t_4bet_facing_pct as pct_of_pot_to_call_4bet_turn,
  chps.val_t_raise_aggressor_pos as aggressor_position_turn,
  chps.amt_t_raise_made as amt_raised_turn,
  chps.val_t_raise_made_pct as pct_of_pot_raised_turn,
  chps.amt_t_raise_made_2 as amt_raised_2_turn,
  chps.val_t_raise_made_2_pct as pct_of_pot_raised_2_turn,
  
  chps.amt_r_raise_facing as amt_to_call_river,
  chps.val_r_raise_facing_pct as pct_of_pot_to_call_river,
  chps.amt_r_2bet_facing as amt_to_call_2bet_river,
  chps.val_r_2bet_facing_pct as pct_of_pot_to_call_2bet_river,
  chps.amt_r_3bet_facing as amt_to_call_3bet_river,
  chps.val_r_3bet_facing_pct as pct_of_pot_to_call_3bet_river,
  chps.amt_r_4bet_facing as amt_to_call_4bet_river,
  chps.val_r_4bet_facing_pct as pct_of_pot_to_call_4bet_river,
  chps.val_r_raise_aggressor_pos as aggressor_position_river,
  chps.amt_r_raise_made as amt_raised_river,
  chps.val_r_raise_made_pct as pct_of_pot_raised_river,
  chps.amt_r_raise_made_2 as amt_raised_2_river,
  chps.val_r_raise_made_2_pct as pct_of_pot_raised_2_river,
  
  psp.player_name,
  hc.holecard,
  cl.limit_name,
  hr.hand_rank,
  hr.hand_details,
  ha_preflop.action as action_preflop,
  ha_flop.action as action_flop,
  ha_turn.action as action_turn,
  ha_river.action as action_river,
  psmc.position as position_name
from {{ source("pt4", "cash_hand_player_statistics") }} as chps
inner join {{ ref("pokerstars_players") }} as psp
  on chps.id_player = psp.player_id
left join {{ ref("holecards") }} as hc
  on chps.id_holecard = hc.holecard_id
left join {{ ref("cash_limits") }} as cl
  on chps.id_limit = cl.limit_id
left join {{ ref("hand_ranks") }} as hr
  on chps.id_final_hand = hr.hand_rank_id
left join {{ ref("hand_actions") }} as ha_preflop
  on chps.id_action_p = ha_preflop.action_id
left join {{ ref("hand_actions") }} as ha_flop
  on chps.id_action_f = ha_flop.action_id
left join {{ ref("hand_actions") }} as ha_turn
  on chps.id_action_t = ha_turn.action_id
left join {{ ref("hand_actions") }} as ha_river
  on chps.id_action_r = ha_river.action_id
left join {{ ref("positions_six_max_cash") }} as psmc
  on chps.position = psmc.position_id
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  