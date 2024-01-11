import polars as pl
import configparser

from typing import List

def build_uri() -> str:
    config = configparser.ConfigParser()
    config.read("/Users/rhilly/no-limit-holdem-analysis/db_creds.ini")
    
    user = config["DB CREDS"]["user"]
    password = config["DB CREDS"]["password"]
    host = config["DB CREDS"]["host"]
    port = config["DB CREDS"]["port"]
    database = config["DB CREDS"]["database"]
    
    URI = f"postgresql://{user}:{password}@{host}:{port}/{database}"
    return URI
    
def list_tables(schema_name: str) -> List[str]:
    """
    List all tables in a schema
    """
    
    query = f"""
    select table_name
    from information_schema.tables
    where table_schema = '{schema_name}'
    """
    
    return pl.read_database_uri(query=query, uri=build_uri(), engine="adbc")["table_name"].to_list()


def read_table(schema_name: str, table_name: str) -> pl.DataFrame:
    """
    Read a table from a schema
    """
    
    query = f"""
    select *
    from {schema_name}.{table_name}
    """
    
    return pl.read_database_uri(query=query, uri=build_uri(), engine="adbc")