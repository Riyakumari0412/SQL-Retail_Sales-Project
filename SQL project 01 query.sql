--- SQL AND EXCEL PROJECT OF RETAIL_SALES

create database SQL_Retail_prj
USE SQL_Retail_prj
CREATE TABLE Retail_Sales 
(
transactions_id int primary key,
sale_date date,
sale_time time,
customer_id int,
gender varchar(20),
age int,
category varchar(50),
quantity int,
price_per_unit float,
cogs float,
total_sale float
);
SELECT * FROM Retail_Sales
SELECT * FROM Retail_Sales LIMIT 10

SELECT COUNT(*) FROM Retail_Sales

SELECT * FROM Retail_Sales
WHERE transactions_id IS NULL

SELECT * FROM Retail_Sales
WHERE Sale_date IS NULL
OR
transactions_id IS NULL
OR
sale_date IS NULL
OR
sale_time IS NULL
OR
customer_id IS NULL
OR
gender IS NULL
OR
category IS NULL
OR
quantity IS NULL
OR
price_per_unit IS NULL
OR
cogs IS NULL
OR
total_sale IS NULL

DELETE FROM Retail_Sales
WHERE 
sale_date IS NULL
OR
transactions_id IS NULL
OR
sale_date IS NULL
OR
sale_time IS NULL
OR
customer_id IS NULL
OR
gender IS NULL
OR
category IS NULL
OR
quantity IS NULL
OR
price_per_unit IS NULL
OR
cogs IS NULL
OR
total_sale IS NULL;

-- how many sales we have

SELECT COUNT(*) AS total_sale FROM Retail_Sales

-- how many unique customer we have

SELECT DISTINCT category FROM Retail_Sales

SELECT COUNT(DISTINCT customer_id) AS total_sale FROM Retail_Sales


--- write SQL Query to retrieve all columns for sales made on '2022-11-05'

SELECT * FROM Retail_Sales
WHERE sale_date = '2022-11-05'

--- write a SQL query to retrieve all transactions where the category is 'ELECTRONICS' and 
the quantity sold is more than 10 the month of Nov-2022

SELECT * FROM Retail_Sales
WHERE category = 'clothing'
AND quantity >= 4
AND DATE_FORMAT(sale_date,'YYYY-MM') ='2022-11'

--- write a SQL query to calculate the total sales for each category

SELECT
category,
SUM (total_sales) AS net_sale,
COUNT(*) AS total_orders
FROM Retail_Sales
GROUP BY 1

--- Write a SQL query to find the average age of customer who purchased items form the 'beauty' category

Select avg(age) as avg_age from REtail_Sales
where category = 'Beauty'

Select round(avg(age),2) as avg_age from REtail_Sales
where category = 'Beauty'

---write SQL query to find all transaction where the total_sale is greater than 1000

select * from Retail_Sales
where total_sale > 1000

--- find total number of transaction (transaction_id) made by each gender in each category

select category, gender from Retail_Sales
count(*) as total_trans
from Retail_Sales

--- calculate the average sale for each month find out best selling month in each year

select 
year(sale_date),
month(sale_sate),
avg(total_sale) as avg_sale
from Retail_Sale
group by 1,2
order by 1,2

--- find top 5 customers based on the highest total_sale

select 
customer_id,
sum(total_sale) as total_sales
from Retail_Sales
group by 1
order by 2 desc
limit 5

--- find number of unique customers who purchased items from each category

select category,
count(distinct customer_id)
from Retail_Sales
group by category

---create each shift and number of orders (example morning <= 12, afternoom between 12 & 17, evening >17

with hourly_sale
as
(
select *,
case
when extract (hour from sale_time) < 12 then 'morning',
when extract (hour from sale_time) between 12 and 17 then 'afternoon',
else 'evening'
end as shift
 from Retail_Sales
)
select shift,
from hourly_sale
group by shift

--- END OF PROJECT
