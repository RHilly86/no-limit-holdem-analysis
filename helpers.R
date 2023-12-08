library(dplyr)

create_hand_matrix = function() {
  cards = c("2", "3", "4", "5", "6", "7", "8", "9", "T", "J", "Q", "K", "A")
  cards_cat = factor(cards, levels = cards, ordered = TRUE)
  
  hand_matrix = tidyr::crossing(cards_cat, rev(cards_cat),
                                .name_repair = \(x) c("card_1", "card_2")) |> 
    mutate(hand = if_else(card_1 > card_2, paste0(card_1, card_2), paste0(card_2, card_1)),
           hand = case_when(
             card_2 > card_1 ~ paste0(hand, "s"),
             card_2 < card_1 ~ paste0(hand, "o"),
             .default = hand
           ))
  return(hand_matrix)
}


single_raise_pots = function(hands, stake) {
  pots = hands |> 
    filter(
      limit_name == stake,
      did_vpip_preflop,
      !did_face_3bet_preflop,
      !did_3bet_preflop,
      !did_face_4bet_preflop,
      !did_4bet_preflop
    )
  return(pots)
}


three_bet_pots = function(hands, stake) {
  pots = hands |> 
    filter(
      limit_name == stake,
      did_vpip_preflop,
      (action_3bet_preflop == "C" | did_3bet_preflop),
      !did_face_4bet_preflop,
      !did_4bet_preflop
    )
  return(pots)
}


holecard_distribution = function(hands, position_name) {
  holecards = hands |> 
    filter(position_name == position_name, action_preflop %in% c("C", "R")) |> 
    count(holecard, action_preflop)
  return(holecards)
}