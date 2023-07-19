--task 3

with pct_rev as(
	with table_joins as(
		select EXTRACT(year from o.occured_at) as year,a."name" as acc_name,o.total_amt_usd as amount
		from orders o join accounts a 
		on o.account_id = a.id
		)
	select year,acc_name,sum(amount) over (partition by year,acc_name)as rev,
	(sum(amount) over (partition by year,acc_name)/sum(amount) over(partition by year)) as pct_yearly_rev
	from table_joins group by year,acc_name,amount order by year,pct_yearly_rev desc
) 
select distinct year, acc_name,rev, pct_yearly_rev, dense_rank() 
over(partition by year order by year asc,pct_yearly_rev desc) from pct_rev
order by year,pct_yearly_rev desc
 