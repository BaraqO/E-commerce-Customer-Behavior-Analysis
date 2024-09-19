use [E-commerce]

select * from INFORMATION_SCHEMA.TABLES
select * from [E-commerce]

--What is the Gender distribution of the customers?
select [E-commerce].Gender,
COUNT(*) 
as [Customer Gender distribution]
from [E-commerce]
group by Gender

--What location does the store get most of its customers?
select Location,
count (*)
as [Location Distribution]
from [E-commerce]
group by Location -- We realize that most of the stores e-commerce sales come from city D


select Location, 
SUM([E-commerce].Price) as [amount spent],
count(*)
as [Customer numbers]
from [E-commerce]
group by Location
-- City E has the highest revenue even after not topping in the number of customers
--RECOMMENDATION: Probably offer free shipping to city D and city E past a certain Total price threshold


--Which product category is most bought by e-commerce customers?
select Product_Category,
count(*)
as [Popularity of the categories]
from [E-commerce]
group by Product_Category --Electronics is the most famous

-- Of these what brings the highest revenue
select Product_Category, 
SUM([E-commerce].Price) as [amount spent],
count(*)
as [Popularity of the categories]
from [E-commerce]
group by Product_Category --Electronics brings in the highest revenue
--RECOMMENDATION: Bring in different varieties of electronics and maybe have a sale for the without sacrificing profit.

select * from [E-commerce]

--who are the repeat customers and how many are they?
select Customer_ID, Gender, Location
from [E-commerce]
where  Repeat_Purchase=1

select Repeat_Purchase,
COUNT(*)
as [Number of customers]
from [E-commerce]
group by Repeat_Purchase --KEY:1-Repeat customers, 0-Non-repeat customers

--How is the rating distribution?
select Numerical_Rating,
COUNT (*)
as [number of customers]
from [E-commerce]
group by Numerical_Rating

--average time spent on the site
select 
avg(Time_on_Site_In_minutes)
as [Average time on site (minutes)]
from [E-commerce]

       -- by gender?
select Gender,
avg(Time_on_Site_In_minutes)
as [Average time on site (minutes)]
from [E-commerce]
group by Gender

       --by city
select Location,
avg(Time_on_Site_In_minutes)
as [Average time on site (minutes)]
from [E-commerce]
group by Location

       -- by amount spent in each of the above
select Gender,
sum(Price)
as [Amount Spent],
avg(Time_on_Site_In_minutes)
as [Average time on site (minutes)]
from [E-commerce]
group by Gender

select Location,
sum(Price)
as [Amount Spent],
avg(Time_on_Site_In_minutes)
as [Average time on site (minutes)]
from [E-commerce]
group by Location


select Repeat_Purchase,
sum(Price)
as [Amount Spent],
avg(Time_on_Site_In_minutes)
as [Average time on site (minutes)]
from [E-commerce]
group by Repeat_Purchase


select Numerical_Rating,
sum(Price)
as [Amount Spent],
avg(Time_on_Site_In_minutes)
as [Average time on site (minutes)]
from [E-commerce]
group by Numerical_Rating -- we see that the ones who rated the products higher (4>) spent more avg time on the site probably looking through different options