{{
  config(
    materialized='view'
  )
}}

select storekey, date_trunc('MONTH', datekey) as violation_month, 
    count(*) as violations, count(distinct productkey) unique_products, 
    avg(onhandquantity - safetystockquantity) as stock_diff 
from {{ source('ft_raw', 'factinventory') }} 
where safetystockquantity > onhandquantity group by storekey, violation_month
