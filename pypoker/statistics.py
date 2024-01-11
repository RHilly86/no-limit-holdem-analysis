import polars as pl
from polars import col

def cbet_pct(column: str, street: str) -> pl.Expr:
    street_column = f"had_opp_to_cbet_{street}"
    return col(column).filter(col(street_column)).mean().round(3) * 100.0


def three_bet_pct(column: str, street: str) -> pl.Expr:
    street_column = f"had_opp_to_3bet_{street}"
    return col(column).filter(col(street_column)).mean().round(3) * 100.0


def four_bet_pct(column: str, street: str) -> pl.Expr:
    street_column = f"had_opp_to_4bet_{street}"
    return col(column).filter(col(street_column)).mean().round(3) * 100.0


def squeeze_pct(column: str, street: str) -> pl.Expr:
    street_column = f"had_opp_to_squeeze_{street}"
    return col(column).filter(col(street_column)).mean().round(3) * 100.0


def check_raise_pct(column: str, street: str) -> pl.Expr:
    street_column = f"had_opp_to_check_raise_{street}"
    return col(column).filter(col(street_column)).mean().round(3) * 100.0


def donk_pct(column: str, street: str) -> pl.Expr:
    street_column = f"had_opp_to_donk_{street}"
    return col(column).filter(col(street_column)).mean().round(3) * 100.0


def fold_to_cbet_pct(column: str, street: str) -> pl.Expr:
    street_column = f"did_face_cbet_{street}"
    return (col(column) == "F").filter(col(street_column)).mean().round(3) * 100.0


def raise_cbet_pct(column: str, street: str) -> pl.Expr:
    street_column = f"did_face_cbet_{street}"
    return (col(column) == "R").filter(col(street_column)).mean().round(3) * 100.0


def call_cbet_pct(column: str, street: str) -> pl.Expr:
    street_column = f"did_face_cbet_{street}"
    return (col(column) == "C").filter(col(street_column)).mean().round(3) * 100.0