select 
  count(distinct customer_id) as subscriber_count
from 
  (
    select 
      customer_id 
    from 
      (
        select 
          customer_id, 
          case when subscription_start_date < '2022-01-01 00:00:00' then '2022-01-01 00:00:00' else subscription_start_date end as subscription_start_date, 
          case when subscription_end_date > '2022-12-31 23:59:59' then '2022-12-31 23:59:59' else subscription_end_date end as subscription_end_date 
        from 
          tblsubscriptioninfo 
        where 
          subscription_start_date <= '2022-12-31 23:59:59' and subscription_end_date >= '2022-01-01 00:00:00'
      ) t1 
    group by customer_id 
    having sum(DATEDIFF(subscription_end_date, subscription_start_date)) > 90
  ) t;