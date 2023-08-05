select 
	count(distinct customer_id) as subscriber_count
from tblsubscriptioninfo 
where subscription_end_date>='2023-01-01 00:00:00' and subscription_end_date <= '2023-12-31 23:59:59';