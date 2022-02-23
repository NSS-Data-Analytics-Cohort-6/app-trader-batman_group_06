select distinct a.name, a.price AS apple_price,
p.price AS google_price,
a.rating AS apple_rating,
p.rating AS google_rating,
a.primary_genre AS apple_genre,
p.genres AS google_genre,
p.install_count AS google_installs
from app_store_apps AS a
JOIN play_store_apps AS p
ON a.name=p.name
WHERE a.rating>=4.5 AND p.rating>=4.5
ORDER BY apple_rating DESC,google_rating DESC