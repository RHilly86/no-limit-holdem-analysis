class PokerStatFormula:
    def __init__(self, stat: str, street: str):
        self.stat = stat
        self.street = street

    def generate_formula(self, condition_type, action=None) -> pl.Expr:
        if condition_type == "opportunity":
            stat_column_name = f"did_{self.stat}_{self.street}"
            condition_column_name = f"had_opp_to_{self.stat}_{self.street}"
            expr = col(stat_column_name).filter(col(condition_column_name)).mean().round(3) * 100.0
        
        elif condition_type == "face":
            stat_column_name = f"action_{self.stat}_{self.street}"
            condition_column_name = f"did_face_{self.stat}_{self.street}"
            expr = (col(stat_column_name) == action).filter(col(condition_column_name)).mean().round(3) * 100.0
            
        return expr