SELECT DISTINCT a.name, a.rating AS apple_rating, p.rating AS google_rating, a.price AS apple_price, p.price AS google_price, p.install_count AS google_install_count, a.primary_genre AS apple_genre, p.genres AS google_genre
FROM app_store_apps AS a
JOIN play_store_apps AS p
ON a.name=p.name
WHERE a.rating >= 4.5 AND p.rating >= 4.5
ORDER BY google_install_count;
