-- SELECT DISTINCT a.name, 
-- CAST(a.price AS money) AS apple_price, 
-- CAST(p.price AS money) AS google_price,
-- a.rating AS apple_rating,
-- p.rating AS google_rating,
-- a.primary_genre AS apple_genre,
-- p.genres AS google_genre
-- FROM app_store_apps AS a
-- JOIN play_store_apps AS p
-- ON a.name = p.name
-- ORDER BY apple_rating DESC, google_rating DESC;

-- SELECT *
-- FROM play_store_apps
-- WHERE type = 'Paid' 
-- 	AND rating IS NOT NULL
-- 	AND install_count >='50,000+'
-- ORDER BY rating DESC;
--Query to look at paid Google Apps with non-null rating.

-- SELECT *
-- FROM app_store_apps
-- WHERE price > '0'
-- AND rating IS NOT NULL
-- ORDER BY rating DESC;
--Query to look at paid Apple Apps with non-null rating.



