select
  id_site as site_id,
  site_abbrev as site_name_short,
  site_name as site_name_full
from {{ source("pt4", "lookup_sites") }}