select 
	customer_id
from tblsubscriptioninfo
group by customer_id
having count(distinct product_id) > 2;