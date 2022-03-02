/*The highest rated apps that are in both the Play store and the Apple store that are free to install (meaning the lowest purchase price) and have a projected lifespan of over 10 years with at least 5 million installs:*/

SELECT 
DISTINCT a.name, 
a.rating AS apple_rating, 
p.rating AS google_rating, 
CAST(a.price AS money) AS apple_price, 
CAST(p.price AS money) AS google_price, 
REPLACE(p.install_count,'+','') AS google_install_count, 
a.primary_genre AS apple_genre, 
p.category AS google_category,
p.genres AS google_genre
FROM app_store_apps AS a
JOIN play_store_apps AS p
ON a.name=p.name
WHERE a.rating >= 4.5 AND p.rating >= 4.5
AND a.price = '0'
ORDER BY a.rating DESC, p.rating DESC;

/*Total count of distinct genre in each store: The Apple store has 22 genres and the Play store has 57:
SELECT 
COUNT(DISTINCT a.primary_genre) AS apple_genre, 
COUNT(DISTINCT p.genres) AS google_genre
FROM app_store_apps AS a
JOIN play_store_apps AS p
ON a.name=p.name;*/

/*Genre in Apple store with the highest count (largest amount of apps):Games
SELECT 
primary_genre,
COUNT(primary_genre)
FROM app_store_apps
GROUP BY primary_genre;*/

/*Genre in Play store with the highest count(largest amount of apps):Tools 
SELECT 
genres,
COUNT(genres)
FROM play_store_apps
GROUP BY genres;*/

/*Top 5 genres in Apple store with the highest average rating: 
Productivity | Music | Photo & Video | Business | Health & Fitness
SELECT 
primary_genre,
AVG(rating)
FROM app_store_apps
GROUP BY primary_genre
ORDER BY AVG(rating) DESC;*/

/*Top 5 genres in Play store with the highest average rating:
Board;Pretend Play | Comics;Creativity | Health & Fitness;Education | Puzzle;Education | Adventure;Brain Games
SELECT 
genres,
AVG(rating)
FROM play_store_apps
GROUP BY genres
ORDER BY AVG(rating) DESC;*/

