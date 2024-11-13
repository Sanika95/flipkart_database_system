create database flipkart;
use flipkart;

select * from mobiles;

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

select*
from mobiles
where ratings>4.5;
select* from mobiles
where
discount > 40;

select brand, avg(ratings) as avg_rating,sum(no_of_reviews) as total_reviews
from mobiles
group by brand
order by avg_rating desc;

select brand 
from mobiles
group by brand
having avg(ratings)>4.5 and
sum(no_of_reviews)>30000;

select* from mobiles 
order by  discount desc 
limit 5;

select* from mobiles 
order by  discount desc 
limit 2;

select * from mobiles
order by brand desc
limit 2;

select brand
from mobiles
order by discount desc 
limit 3;

alter table mobile 
change name mobile_name varchar(250);

select brand
from mobiles 
order by brand ;

select brand,
count(name) as totalmobiles
from mobiles group by brand order by totalmobiles desc
limit 1;