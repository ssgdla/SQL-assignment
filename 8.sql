select 
	t1.customer_id as customer_id
from
(
	select 
		customer_id,
		product_id
	from 
		tblsubscriptioninfo 
	where 
		subscription_start_date >= '2023-01-01 00:00:00' and subscription_start_date <= '2023-12-31 23:59:59'
	group by customer_id, product_id
) t1
join 
(
	select
		customer_id,
		product_id
	from 
		tblsubscriptioninfo 
	where 
		subscription_start_date < '2023-01-01 00:00:00'
	group by customer_id, product_id
) t2
on t1.customer_id = t2.customer_id and t1.product_id = t2.product_id