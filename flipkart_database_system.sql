create database flipkart;
use flipkart;

-- Select All Mobiles
select * from mobiles;

-- Price Range Distribution by Brand
select 
brand,
sum(case when mrp between 0 and 9999 then 1 else 0 end) as 'price between 10k',
sum(case when mrp between 10000 and 19999 then 1 else 0 end) as 'price between 10k-20k',
sum(case when mrp between 20000  and 29999 then 1 else 0 end) as 'price between 20k-40k',
sum(case when mrp >= 40000 then 1 else 0 end) as 'price above 40k'
from mobiles
group by
brand
order by
brand;

-- Brand with Maximum Discount
select
brand,
max(mrp-msp) as maxdiscount
from 
mobiles
group by 
brand
order by 
maxdiscount desc
limit 1;

-- Brand with Minimum Discount
select
brand,
max(mrp-msp) as maxdiscount
from 
mobiles
group by 
brand
order by 
maxdiscount asc
limit 1;

--  Top 5 Brands by Average Rating
select
brand,avg(ratings) as avg_rating
from 
mobiles
group by 
brand
order by avg_rating desc
limit 5;

select
brand,
sum(no_of_reviews) as total_reviews
from 
mobiles
group by 
brand
order by 
total_reviews desc
limit 5;

-- Mobiles with Rating Greater Than 4.5
select*
from mobiles
where ratings>4.5;

-- Mobiles with Discount Greater Than 40%
select* from mobiles
where
discount > 40;

--  Average Rating and Total Reviews by Brand
select brand, avg(ratings) as avg_rating,sum(no_of_reviews) as total_reviews
from mobiles
group by brand
order by avg_rating desc;

-- Brands with High Ratings and Reviews
select brand 
from mobiles
group by brand
having avg(ratings)>4.5 and
sum(no_of_reviews)>30000;
-- Top 5 Mobiles by Discount
select* from mobiles 
order by  discount desc 
limit 5;

-- Top 2 Mobiles by Discount
select* from mobiles 
order by  discount desc 
limit 2;

-- Top 2 Mobiles by Brand (Descending Order)
select * from mobiles
order by brand desc
limit 2;

--  Top 3 Brands by Discount
select brand
from mobiles
order by discount desc 
limit 3;

-- Change Column Name (Mobile Table)
alter table mobile 
change name mobile_name varchar(250);

-- list All Brands Alphabetically
select brand
from mobiles 
order by brand ;

-- 	Brand with the Most Mobiles
select brand,
count(name) as totalmobiles
from mobiles group by brand order by totalmobiles desc
limit 1;