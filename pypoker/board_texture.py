import polars as pl
from polars import col

def append_boards_flop(hands: pl.DataFrame) -> pl.DataFrame:
    cards = pl.Enum(["2", "3", "4", "5", "6", "7", "8", "9", "T", "J", "Q","K", "A"])
    
    boards = (
        hands
        .with_columns([
            col("card_1").str.slice(0, 1).cast(dtype=cards, strict=False),
            col("card_2").str.slice(0, 1).cast(dtype=cards, strict=False),
            col("card_3").str.slice(0, 1).cast(dtype=cards, strict=False),
        ])
        .select(["card_1", "card_2", "card_3", "hand_id"])
        .melt(id_vars="hand_id")
        # Since the data is on the player-hand level, we'll have duplicate rows for each hand_id
        # This won't matter since we're interested in constructing a board for a given hand so we'll randomly drop
        # one of the hands
        .unique()
        .group_by("hand_id")
        .agg(col("value").sort_by("value", descending=True).alias("board_flop"))
        .with_columns(col("board_flop").list.drop_nulls())
    )
    
    hands = hands.join(boards, how="left", on="hand_id")
    
    return hands