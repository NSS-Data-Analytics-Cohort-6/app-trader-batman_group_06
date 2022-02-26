--app_store_apps data
SELECT *
FROM app_store_apps

--play_store_apps data
SELECT * 
FROM play_store_apps

--Converted the review_count column in the app_store_apps table from text to integer. 
ALTER TABLE app_store_apps ALTER COLUMN review_count TYPE integer USING (review_count::integer);

--Number of apps in the app_store_apps table?
SELECT COUNT(DISTINCT name)
FROM app_store_apps
--Answer: 7195

--Number of apps in the play_store_apps table?
SELECT COUNT(DISTINCT name)
FROM play_store_apps
--Answer: 9659

--Number of apps in BOTH app_store_apps and play_store_apps tables?
SELECT COUNT(DISTINCT name)
FROM app_store_apps
	INNER JOIN play_store_apps
	USING (name);
--Answer: 328

--Apps in BOTH app_store_apps and play_store_apps.
SELECT DISTINCT name
FROM app_store_apps
	INNER JOIN play_store_apps
	USING (name)
	ORDER BY name;

--Apps in app_store_apps but NOT IN play_store_apps. 
SELECT DISTINCT name
FROM app_store_apps
WHERE name NOT IN 
	(SELECT name
	FROM play_store_apps);
	
--Apps in play_store_apps but NOT IN app_store_apps.
SELECT DISTINCT name
FROM play_store_apps
WHERE name NOT IN
	(SELECT name
	FROM app_store_apps);
	
--Using the Round function to round ratings in the play_store_app to the nearest .5.
SELECT name, rating, (ROUND(rating * 2, 0) / 2)/.5 + 1 AS Longevity
FROM play_store_apps

--Apps in BOTH app_store_apps and play_store_apps.
SELECT DISTINCT name, p.review_count, a.rating
FROM app_store_apps AS a
	INNER JOIN play_store_apps AS p
	USING (name)
	ORDER BY name;
-------------------------------------------App Trader Project-----------------------------------------------
SELECT DISTINCT name, a.review_count, p.review_count
FROM app_store_apps AS a
	INNER JOIN play_store_apps AS p
	USING (name)
	ORDER BY name;


	


