-- 1.Which region generated the highest total revenue? Show region and total revenue, sorted descending ?

select region,round(sum(revenue)) total_revenue from sales_table
group by region
order by total_revenue desc
limit 1;

-- 2.How many orders were returned (return_flag = 'Yes') in each product category? Sort by most returns first ?

select category,count(return_flag) as returned from sales_table
where return_flag="yes"
group by category
order by returned desc;

-- 3.Find all sales reps whose average customer rating is below 3.5. Show the sales rep name and their average rating ?

select sales_rep,round(avg(customer_rating),2) as customer_rating from sales_table
group by sales_rep
having customer_rating<3.5;

-- 4.Classify each order's profit margin as 'High' (profit/revenue > 0.3), 'Medium' (0.1–0.3), or 'Low' (below 0.1). Count how many orders fall in each bucket.

select profit,round((profit/revenue),2) as profit_margin,
	case when(profit/revenue)>0.3 then "high"
    when (profit/revenue) between 0.1 and 0.3 then "medium"
    when (profit/revenue) < 0.1 then "low" end  as classification from sales_table;
    
-- 5.For each sales channel, rank the cities by total revenue using RANK(). Show channel, city, total revenue, and rank ?

with ranking as 
	(select city,sales_channel,round(sum(revenue),2) as total_revenue from sales_table
    group by sales_channel,city
    order by total_revenue desc)
select city,sales_channel,total_revenue,rank() over(partition by sales_channel order by total_revenue desc) as rn from ranking;

-- 6.Find all orders where the revenue is greater than the average revenue of their own product category ?

with total_revenue as 
	(select category,round(sum(revenue)) as total from sales_table group by category)
, avg_revenue as 
	(select category,round(avg(revenue)) as avg_rev from sales_table group by category)
select tr.category,tr.total,ar.avg_rev from total_revenue tr
join avg_revenue ar on tr.category=ar.category
where tr.total>ar.avg_rev;

-- 7.Find the month-over-month revenue growth percentage for each quarter. Show quarter, month, total revenue, and % change from the previous month ?

with sales as 
	(select sum(revenue) as total_sales,month(date) as month,quarter(date) as quarter from sales_table
    group by month(date),quarter(date))
select quarter,month,round((total_sales),2),
round((total_sales-lag(total_sales) over(order by month))/lag(total_sales) over(order by month)*100,2) as montly_pct_change from sales;

-- 8.Which combination of customer_segment and sales_channel has the highest average profit? Show the top 3 combinations ?

select sales_channel,customer_segment,round(avg(profit),2) as avg_sales from sales_table
group by sales_channel,customer_segment
order by avg_sales desc
limit 3;

-- 9.For each product category, find the total revenue from male vs. female customers side by side in one row. (Pivot-style output.)

select category,
round(sum(case when customer_gender='Male' then revenue else 0 end)) as male_revenue,
round(sum(case when customer_gender='female' then revenue else 0 end)) as female_revenue
from sales_table
group by category;

-- 10.Find the top 3 products with the highest return rate (returns / total orders) in the Electronics category, but only consider products with more than 5 total orders ?

create view top3_returned_product as 
SELECT 
    product,
    COUNT(*) AS total_orders,
    COUNT(CASE WHEN return_flag = 'Yes' THEN 1 END) AS total_returns,
    ROUND(
        COUNT(CASE WHEN return_flag = 'Yes' THEN 1 END) * 100.0 
        / COUNT(*), 2
    ) AS return_rate_pct
FROM sales_table
WHERE category = 'Electronics'
GROUP BY product
HAVING COUNT(*) > 5
ORDER BY return_rate_pct DESC
LIMIT 3;
