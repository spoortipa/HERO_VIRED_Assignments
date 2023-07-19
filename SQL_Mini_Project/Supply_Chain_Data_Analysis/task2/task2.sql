
--task 2.1 
select a.sales_rep_id as sales_rep_id, s.name as sales_rep_name, s.region_id as sales_rep_region,
a.name as account_name,row_number()
over(partition by s.region_id,s.name
order by s.region_id) as acc_num  
from accounts a join sales_rep s
on a.sales_rep_id=s.id;

-- task 2.2

with sales_rep_percent as (
	with table_join as (
		select EXTRACT(YEAR from o.occured_at) as year,sr.name as rep_name, o.total_amt_usd  
		from
		sales_rep sr, orders o, accounts a
		where
		sr.id = a.sales_rep_id
		and o.account_id = a.id
		)
	select year,rep_name,(sum(total_amt_usd) over(partition by year,rep_name)/sum(total_amt_usd) over(partition by year)) as perc_sales_rep
	from table_join
	group by year,rep_name,total_amt_usd
	order by year, perc_sales_rep desc
)
select *,rank() over(partition by year order by perc_sales_rep desc)
from sales_rep_percent 
group by year,rep_name,perc_sales_rep order by year,perc_sales_rep desc;


--task 2.3

with sales_region_percent as(
	with tables_join as (
		select o.account_id,extract(year from o.occured_at) as year,o.total_amt_usd,
		a.sales_rep_id as sales_rep_id,sr.region_id as region_id,r."name" as region_name
		from orders o 
		join accounts a
		on o.account_id = a.id 
		join sales_rep sr 
		on a.sales_rep_id = sr.id 
		join region r 
		on sr.region_id = r.id 
	)
	select year,region_name,
	(sum(total_amt_usd) over(partition by region_name,year)/sum(total_amt_usd)over(partition by year)) as perc_sales_region
--	rank() over(partition by year) as region_rank
	from tables_join
	group by year,region_name,total_amt_usd 
	order by year,perc_sales_region desc)
select year,region_name,perc_sales_region,
rank() over(partition by year order by perc_sales_region DESC)
from sales_region_percent group by year,region_name,perc_sales_region order by year;

