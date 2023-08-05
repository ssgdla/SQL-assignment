select 
	customer_id
from
(
	select 
		product_id,
		customer_id,
		sum(1) as subscribe_count
	from tblsubscriptioninfo
	group by product_id, customer_id
	having subscribe_count >= 3
) t;