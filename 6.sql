select 
	product_id,
	product_name
from
(
	select 
		product_id,
		product_name,
		count(distinct customer_id) as subscribers 
	from 
		tblsubscriptioninfo 
	where 
		subscription_start_date <= '2022-12-31 23:59:59' and subscription_end_date >= '2022-01-01 00:00:00'
	group by product_id, product_name
) t
order by subscribers desc limit 3;