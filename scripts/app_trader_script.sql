select distinct a.name AS name,
CAST(a.price AS MONEY) AS apple_price,
CAST(p.price AS MONEY) AS google_price,
a.rating AS apple_rating,
p.rating AS google_rating,
primary_genre AS apple_genre,
category AS google_category,
CASE WHEN a.rating=4
	THEN 9
	WHEN a.rating=4.5
	THEN 10
	WHEN a.rating=5
	THEN 11
	END AS app_lifespan,
CASE WHEN a.price<=1
	THEN 10000
	ELSE a.price*10000
	END AS apple_cost,
CAST(REPLACE(REPLACE(install_count,'+',''),',','') AS INTEGER) AS google_installs, 
CASE WHEN a.rating BETWEEN 4.0 AND 4.4
	THEN ((9*12*2500)-(9*12*500))
	WHEN a.rating BETWEEN 4.5 AND 4.9
	THEN ((10*12*2500)-(10*12*500))
	ELSE ((11*12*2500)-(11*12*500))
	END AS apple_lifetime_revenue,
CASE WHEN p.rating BETWEEN 4.0 AND 4.4
	THEN ((9*12*2500)-(9*12*500))
	WHEN p.rating BETWEEN 4.5 AND 4.9
	THEN ((10*12*2500)-(10*12*500))
	ELSE ((11*12*2500)-(11*12*500))
	END AS google_lifetime_revenue
from app_store_apps AS a
JOIN play_store_apps AS p
ON a.name=p.name
WHERE a.rating>=4.0 AND p.rating>=4.0 
	AND install_count NOT IN('1,000+','5,000+','100,000+','1,000,000+','10,000+','500,000+','50,000+')
ORDER BY google_lifetime_revenue DESC,apple_lifetime_revenue DESC, google_installs DESC