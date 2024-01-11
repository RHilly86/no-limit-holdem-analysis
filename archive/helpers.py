import polars as pl
from polars import col, lit

def create_hand_matrix() -> pl.DataFrame:
    """
    Create a matrix of all possible hands.
    """
    hand_list = ["2", "3", "4", "5", "6", "7", "8", "9", "T", "J", "Q","K", "A"]
    hands = pl.DataFrame(pl.Series("hands", hand_list, dtype=pl.Categorical))
    hand_matrix = (
        hands
        .join(hands, how="cross")
        .rename({"hands": "card_1", "hands_right": "card_2"})
        .with_columns([
            pl.when(col("card_1") > col("card_2"))
            .then(pl.concat_str([col("card_1"), col("card_2")]))
            
            .otherwise(pl.concat_str([col("card_2"), col("card_1")]))
            .alias("hand")
        ])
        .with_columns([
            pl.when(col("card_2") > col("card_1"))
            .then(pl.concat_str([col("hand"), lit("s")]))
            
            .when(col("card_2") < col("card_1"))
            .then(pl.concat_str([col("hand"), lit("o")]))
            
            .otherwise(col("hand"))
            .alias("hand")
        ])
    )
    return hand_matrix


def single_raise_pots(hands: pl.DataFrame, stake: str) -> pl.DataFrame:
    """
    Return all hands that were single raised pots.
    """
    
    pots = (
        hands
        .filter(
            (col("limit_name") == stake) &
            (col("did_vpip_preflop")) &
            ~(col("did_face_3bet_preflop")) &
            ~(col("did_3bet_preflop")) &
            ~(col("did_face_4bet_preflop")) &
            ~(col("did_4bet_preflop")) 
        )
    )
    return pots


def three_bet_pots(hands: pl.DataFrame, stake: str) -> pl.DataFrame:
    """
    Return all hands that were three bet pots.
    """
    
    pots = (
        hands
        .filter(
            (col("limit_name") == stake) &
            (col("did_vpip_preflop")) &
            ((col("action_3bet_preflop") == "C") | (col("did_3bet_preflop"))) &
            ~(col("did_face_4bet_preflop")) &
            ~(col("did_4bet_preflop"))
        )
    )
    return pots


def holecard_dist(hands: pl.DataFrame, position_name: str) -> pl.DataFrame:
    """
    Return the distribution of hole cards for a given position.
    """
    
    holecards = (
        hands
        
        # NOTE: Some action sequences are things like Raise-Raise, or Call-Fold so I think it's
        # fine to just group these as "Raises" or "Calls", regardless of the final action
        .with_columns(
            pl.when(col("action_preflop").str.starts_with("R"))
            .then(lit("R"))
            
            .when(col("action_preflop").str.starts_with("C"))
            .then("C")
            .otherwise(col("action_preflop"))
            .alias("action_preflop")
        )
        .filter(col("position_name") == position_name, col("action_preflop").is_in(["C", "R"]))
        .group_by(["holecard", "action_preflop"])
        .agg(pl.count().alias("n"))
    )
    return holecards
