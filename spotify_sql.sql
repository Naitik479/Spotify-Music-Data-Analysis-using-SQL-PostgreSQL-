-- create table
DROP TABLE IF EXISTS spotify;
CREATE TABLE spotify (
    artist VARCHAR(255),
    track VARCHAR(255),
    album VARCHAR(255),
    album_type VARCHAR(50),
    danceability FLOAT,
    energy FLOAT,
    loudness FLOAT,
    speechiness FLOAT,
    acousticness FLOAT,
    instrumentalness FLOAT,
    liveness FLOAT,
    valence FLOAT,
    tempo FLOAT,
    duration_min FLOAT,
    title VARCHAR(255),
    channel VARCHAR(255),
    views FLOAT,
    likes BIGINT,
    comments BIGINT,
    licensed BOOLEAN,
    official_video BOOLEAN,
    stream BIGINT,
    energy_liveness FLOAT,
    most_played_on VARCHAR(50)
);

select * from spotify;
select count(*) from spotify;

SELECT column_name
FROM information_schema.columns
WHERE table_name = 'spotify'
ORDER BY ordinal_position;;

-- Q1. Retrieve the names of all tracks that have more than 1 billion streams.

SELECT track, views 
FROM spotify
where views>1000000000;
-- total 300

-- for top 10
SELECT track, views 
FROM spotify
WHERE views>1000000000
ORDER BY views DESC
LIMIT 10;

-- Q2. List all albums along with their respective artists.

SELECT COUNT(DISTINCT artist)  FROM spotify; -- 2074
SELECT COUNT(DISTINCT album)  FROM spotify; -- 11854

SELECT artist, album
FROM spotify
GROUP BY artist, album
ORDER BY artist DESC;

-- TOP 10 artist with max veiws
SELECT artist, SUM(views) AS total_views
FROM spotify
GROUP BY artist
ORDER BY total_views DESC
LIMIT 10;

-- Q3. Get the total number of comments for tracks where licensed = TRUE.
SELECT COUNT(DISTINCT track)  FROM spotify; -- 17715

SELECT COUNT(*)
FROM spotify
WHERE track IS NULL; -- 0

SELECT track, SUM(comments) AS noc
FROM spotify
WHERE licensed = 'TRUE'
GROUP BY track
ORDER BY noc DESC;
-- for top 10

SELECT track, SUM(comments) AS noc
FROM spotify
WHERE licensed = 'TRUE'
GROUP BY track
ORDER BY noc DESC
LIMIT 10;

-- Q4. Find all tracks that belong to the album type single

SELECT COUNT(DISTINCT Album_type)  FROM spotify; -- 3 
SELECT DISTINCT Album_type  FROM spotify;

SELECT track
FROM spotify
WHERE Album_type = 'single';

-- TOP 10 track views where album type single

SELECT track , SUM(VIEWS) AS total_veiws
FROM spotify
WHERE Album_type = 'single'
GROUP BY track
ORDER BY total_veiws DESC
LIMIT 10;

-- Q5. Count the total number of tracks by each artist.
SELECT COUNT(DISTINCT artist) FROM spotify;

SELECT artist,
count(track) AS NOFT
FROM spotify 
GROUP BY artist
ORDER BY NOFT DESC;

-- Q6. Calculate the average danceability of tracks in each album.

SELECT album, track,
AVG(danceability) AS avge
FROM spotify
GROUP BY album, track
ORDER BY avge DESC;

-- Q7. Find the top 10 tracks with the highest energy values.

SELECT track ,artist,
energy
from spotify
order by energy desc
limit 10;

-- Q8. List all tracks along with their views and likes where official_video = TRUE.

SELECT track ,artist,
views, likes
from spotify
where official_video = 'TRUE' ; 

-- Q9. For each album, calculate the total views of all associated tracks.

SELECT 
album,
SUM(views) AS total_views
FROM spotify
GROUP BY album
ORDER BY total_views DESC;

-- top 10
SELECT 
album,
SUM(views) AS total_views
FROM spotify
GROUP BY album
ORDER BY total_views DESC
LIMIT 10;

-- Q10. Retrieve the track names that have been streamed on Spotify more than YouTube.

SELECT track
FROM spotify 
WHERE most_played_on = 'Spotify';  -- not spotify take care of ('S')


-- Q11. Find the top 3 most-viewed tracks for each artist using window functions

WITH ranking_artist
AS
(
SELECT 
artist, track,
SUM(VIEWS) AS total_veiws,
DENSE_RANK() OVER (PARTITION BY artist ORDER BY SUM(views) DESC) AS RANK
FROM spotify
GROUP BY artist, track
ORDER BY artist, total_veiws DESC
)

SELECT * FROM ranking_artist 
WHERE RANK<=3

-- Q12. Write a query to find tracks where the liveness score is above the average.

SELECT AVG(liveness) FROM spotify; -- 0.193

SELECT * FROM spotify 
WHERE liveness > 0.193;

-- since it is not a good method since what if data get changed

SELECT * FROM spotify 
WHERE liveness > (SELECT AVG(liveness) FROM spotify);


-- Q13. Use a WITH clause to calculate the difference between the highest and lowest energy values for tracks in each album.


WITH cte
AS
(SELECT 
album,
MAX(energy) as highest_energy,
MIN(energy) as lowest_energery
FROM spotify
GROUP BY album
)
SELECT 
album,
highest_energy - lowest_energery as energy_diff
FROM cte
ORDER BY energy_diff DESC;


-- Q14.Find tracks where the energy-to-liveness ratio is greater than 1.2

WITH ratio
AS
(SELECT 
track,
energy,
liveness
FROM spotify
WHERE liveness != 0
)
SELECT 
track
FROM ratio
where energy/liveness > 1.2;




