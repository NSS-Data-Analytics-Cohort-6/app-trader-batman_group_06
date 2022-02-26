SELECT *
from app_store_apps

select *
from play_store_apps

select a.name as app_store_name, g.name as play_store_name, a.size_bytes as app_size, g.size as play_size, a.price as app_price, g.price as play_price, a.review_count as app_reviews, g.review_count as play_reviews, a.rating as app_rating, g.rating as play_rating, a.content_rating as app_content_rating, g.content_rating as play_content_rating, a.primary_genre as app_genre, g.genres as play_genre, g.category as play_category, g.install_count as play_install_count
from app_store_apps as a
inner join play_store_apps as g
on a.name = g.name;

select distinct a.name, a.rating as app_rating, g.rating as play_rating
from app_store_apps as a
inner join play_store_apps as g
on a.name = g.name
where a.rating >= 4.5 and g.rating >= 4.5;

SELECT *
FROM app_store_apps
order by name asc;

select 
	a.name,
	a.price,
	p.price,
	a.primary_genre,
	p.genres,
	a.review_count,
	p.review_count,
	round(((a.rating + p.rating)/2),2) as avg_rating
	sum(a.review_count + p.review_count) as total_reviews
from app_store_apps as a
inner join play_store_apps as p
on a.name = p.name
group by 
	a.name,
	a.price,
	p.price,
	a.primary_genre,
	p.genres,
	a.rating,
	p.rating,
	a.review_count,
	p.review_count
order by avg_rating desc
and  desc;

/*Finding difference between rating scores between both stores to determine possible risk of investment*/

select
	a.name,
	abs(a.rating - p.rating) as diff_rating
from
	app_store_apps as a
inner join
	play_store_apps as p
on
	a.name = p.name
order by
	diff_rating asc;
	
/*Find which apps are $1 or less in both stores*/

select
	a.name,
	cast(a.price as money) as app_price,
	cast(p.price as money) as play_price
from
	app_store_apps as a
inner join
	play_store_apps as p
on
	a.name = p.name
where
	a.price <= '1.00'
	and p.price <= '1.00';
	
/*Creating table of info on all apps from both stores that are $1 or less sorted by avg rating and content ratings excluding 17+ and mature*/

select
	distinct a.name,
	a.content_rating,
	p.content_rating,
	a.primary_genre,
	p.genres,
	p.category,
	a.review_count,
	p.review_count,
	p.install_count,
	round(((a.rating + p.rating)/2),2) as avg_rating,
	cast(a.price as money) as app_price, -- done to convert p.price to same data type as a.price
	cast(p.price as money) as play_price
from
	app_store_apps as a
inner join
	play_store_apps as p
on
	a.name = p.name
where
	a.content_rating <> '17+'
	and p.content_rating <> 'Mature%'
	and a.price <= '1.00' --issue with one app in play where price is 1.20 row 238 sugar, suger and row 404 Peppa Pig where price is 2.99
	and p.price <= '1.00'
group by
	a.name,
	a.content_rating,
	p.content_rating,
	a.primary_genre,
	p.genres,
	p.category,
	a.review_count,
	p.review_count,
	p.install_count,
	a.rating,
	p.rating,
	a.price,
	p.price
order by
	avg_rating desc;
	
/*Trying to put all of it together*/

select
	distinct a.name,
	a.primary_genre,
	p.genres,
	p.install_count,
	round(((a.rating + p.rating)/2),2) as avg_rating,
	abs(a.rating - p.rating) as diff_rating,
	cast(a.price as money) as app_price,
	cast(p.price as money) as play_price
from
	app_store_apps as a
inner join 
	play_store_apps as p
on
	a.name = p.name
where
	a.content_rating <> '17+'
	and p.content_rating <> 'Mature%'
	and a.price <= '1.00'
	and p.price <= '1.00'
group by
	a.name,
	a.rating,
	p.rating,
	a.primary_genre,
	p.genres,
	p.install_count,
	a.price,
	p.price
order by
	avg_rating desc;
	