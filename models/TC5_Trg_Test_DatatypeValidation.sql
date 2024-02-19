{{ config(materialized='table') }}
select sum(l_quantity) as sum_qty, max(l_extendedprice) as max_prc, min(l_extendedprice) as min_prc, l_shipmode as shp_mde
from {{source('hrncir_tpc', 'lineitem')}} inner join {{source('hrncir_tpc', 'orders')}} on l_orderkey = o_orderkey
where l_shipmode = 'SHIP' and o_orderdate < TO_DATE('2018-01-01')
group by l_shipmode