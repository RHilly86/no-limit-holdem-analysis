library(DBI)
library(dplyr)

connect_to_db = function() {
  db_host = Sys.getenv("DB_HOST")
  db_port = Sys.getenv("DB_PORT")
  db_user = Sys.getenv("DB_USER")
  db_password = Sys.getenv("DB_PASSWORD")
  db_database = Sys.getenv("DB_DATABASE")
  
  conn = dbConnect(
    drv = RPostgres::Postgres(),
    dbname = db_database,
    host = db_host,
    port = db_port,
    user = db_user,
    password = db_password
  )
  
  return(conn)
}

list_tables = function(conn = connect_to_db(), schema) {
  # NOTE: This also includes views in the schema as well
  tables = glue::glue(
    "select table_name
     from information_schema.tables
     where table_schema = '{schema}'"
  )
  
  data_sources = unname(unlist(dbGetQuery(conn, tables)))
  
  return(data_sources)
}

read_table = function(conn = connect_to_db(), schema = "public", table_name, convert_to_tibble = TRUE) {
  table = dbReadTable(conn, Id(schema = schema, table = table_name))
  
  if (convert_to_tibble) {
    table = as_tibble(table)
  }
  
  return(table)
}





