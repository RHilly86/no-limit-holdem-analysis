source("helpers.R")

plot_preflop_range = function(hands, position_name) {
  position_holecard_dist = holecard_distribution(hands, position_name)
  hand_matrix = create_hand_matrix()
  calls_raises_position = left_join(position_holecard_dist, hand_matrix,
                                     by = c("holecard" = "hand"))
  
  plot_labels = list(
    title = glue::glue("Preflop calling and raising ranges for {position_name}"),
    facets = c(C = "Calls", R = "Raises")
  )
  
  preflop_ranges = calls_raises_position |> 
    ggplot() +
    geom_tile(data = calls_raises_position,
              aes(x = forcats::fct_rev(card_1), y = card_2, fill = n), color = "grey50") +
    geom_text(data = hand_matrix, aes(x = forcats::fct_rev(card_1), y = card_2, label = hand)) +
    facet_wrap(~action_preflop, labeller = labeller(action_preflop = plot_labels$facets)) +
    theme_minimal() +
    scale_fill_distiller(palette = "PuBu", direction = 1) +
    labs(
      x = NULL,
      y = NULL,
      fill = "# of hands",
      title = plot_labels$title
    ) +
    theme(
      axis.text = element_blank(),
      axis.ticks = element_blank(),
      panel.grid.major = element_blank(),
      plot.title = element_text(hjust = 0.5, face = "bold", size = 14),
      strip.text = element_text(size = 12, face = "bold"),
      legend.title = element_text(face = "bold"),
    )
  
  return(preflop_ranges)
}
