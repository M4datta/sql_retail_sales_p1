SELECT transactions_id, sale_date, sale_time, customer_id, gender, age, category, quantity, price_per_unit, cogs, total_sale
	FROM public.retail_sales;


	select * from retail_sales limit 10;

	Select Count(*) from retail_sales

	select * from retail_sales where transactions_id is null
	or sale_date is null or gender is null or total_sale is null;

	Delete from retail_sales where total_sale is null;

	select count(*) as total_sale from retail_sales;


	--Q1 write a sql query to retrieve all columns for sales made on '22-11-05'

	select * from retail_sales where sale_date ='2022-11-05';


	select category , sum(quantity) from retail_sales where category='Clothing'and To_char(sale_date,'YYYY-MM')='2022-11'
	and quantity>=4

	---Q3 Write a sql query to calculate the total_sales (total_sale) for each category.

	select category , sum(total_sale) as net_sale,count(*) as total_orders from retail_sales group by 1


	--Q4 write a sql query to find the average age of customers who purchased items from the 'Beauty' category

	select round(avg(age),2) as avg_age from retail_sales where category='Beauty'


	select category, gender, count(*) as total_trans from retail_sales group by category, gender order by 1


	select Extract (YEAR from sale_date) as year, Extract (MONTH from sale_date) as month,sum(total_sale) from retail_sales
	group by 1,2
	order by 1,3 desc


	select customer_id , sum(total_sale) as total_sales  from retail_sales group by 1 order by 2 Desc Limit 5


	select category, count(distinct customer_id) as cnt_unique_cs from retail_sales group by category
	
	with hourly_sale AS
	(select *, case when extract(HOUR from sale_time )<12 then 'Morning' 
	when extract (HOUR from sale_time) between 12 and 17 then 'Afternoon'else 'Evening'
	end as shift 
	from retail_sales)

	select shift ,count(*) as total_orders from hourly_sale group by shift