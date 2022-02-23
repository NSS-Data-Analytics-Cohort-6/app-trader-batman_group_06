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
