import polars as pl
from polars import col, lit
from pypoker.statistics import *
from pypoker.board_texture import append_boards_flop
from pypoker.db_utils import *
import toolz

cash_table_names = list_tables(schema_name="cash")
lookup_table_names = list_tables(schema_name="lookup")

cash_tables = {
    table_name: read_table(schema_name="cash", table_name=table_name)
    for table_name in cash_table_names
}

lookup_tables = {
    table_name: read_table(schema_name="lookup", table_name=table_name)
    for table_name in lookup_table_names
}

villain_hand_player_stats = (
    cash_tables["hand_player_statistics"]
    .filter(
        (~col("is_hero")) &
        (col("limit_name") == "$0.50 NL (6 max)")
    )
    .join(
        cash_tables["hand_history"],
        how="left",
        on="hand_id"
    )
)

# TODO: Add all stats we want to see for pool overall
pool_stats = (
    villain_hand_player_stats
    .pipe(append_boards_flop)
    .select(
        three_bet_pct(column="did_3bet_preflop", street="preflop").alias("3bet_pct_preflop"),
        four_bet_pct(column="did_4bet_preflop", street="preflop").alias("4bet_pct_preflop"),
        squeeze_pct(column="did_squeeze_preflop", street="preflop").alias("squeeze_pct_preflop"),
        (col("did_vpip_preflop").mean().round(3) * 100.0).alias("vpip_pct_preflop"),
        (col("did_limp_preflop").mean().round(3) * 100.0).alias("limp_pct_preflop"),
        
        
        cbet_pct(column="did_cbet_flop", street="flop").alias("cbet_pct_flop"),
        call_cbet_pct(column="action_cbet_flop", street="flop").alias("call_cbet_pct_flop"),
        fold_to_cbet_pct(column="action_cbet_flop", street="flop").alias("fold_to_cbet_pct_flop"),
        raise_cbet_pct(column="action_cbet_flop", street="flop").alias("raise_cbet_pct_flop"),
        
        check_raise_pct(column="did_check_raise_flop", street="flop").alias("check_raise_pct_flop"),
        donk_pct(column="did_donk_flop", street="flop").alias("donk_pct_flop"),
        col("did_cbet_flop").filter((col("had_opp_to_cbet_flop")) & (col("board_flop").list.first() == "A")).mean().round(3).alias("cbet_Ace_high_pct_flop"),
        col("did_cbet_flop").filter((col("had_opp_to_cbet_flop")) & (col("board_flop").list.first() == "K")).mean().round(3).alias("cbet_King_high_pct_flop"),
        col("did_cbet_flop").filter((col("had_opp_to_cbet_flop")) & (col("board_flop").list.first() == "Q")).mean().round(3).alias("cbet_Queen_high_pct_flop"),
        
    )
)

(
    villain_hand_player_stats
    .pipe(append_boards_flop)
    .filter(
        (col("pot_type") == "2BP") &
        (col("had_opp_to_cbet_flop")) &
        (col("board_flop").list.first() == "A")
    )
)






