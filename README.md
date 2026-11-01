# Spotify-Music-Data-Analysis-using-SQL-PostgreSQL-
Analyzed Spotify music streaming data using PostgreSQL to explore track popularity, artist performance, album statistics, and audio characteristics. Solved SQL queries using filtering, aggregation, joins, GROUP BY, CTEs, and window functions to extract meaningful insights from music streaming data.
# Spotify Music Data Analysis using SQL (PostgreSQL)

## Project Overview

This project focuses on analyzing Spotify music streaming data using **PostgreSQL**. The objective is to explore music trends, track performance, artist statistics, album characteristics, and streaming platform comparisons through SQL queries.

A total of **14 SQL questions** were solved, covering basic to advanced SQL concepts.

## Objectives

- Analyze track popularity based on streams, views, and likes.
- Explore artist and album performance.
- Understand audio characteristics such as danceability, energy, liveness, and other metrics.
- Compare Spotify and YouTube streaming performance.
- Apply advanced SQL techniques to extract meaningful insights.

## SQL Concepts Used

- SELECT and DISTINCT
- WHERE and ORDER BY
- GROUP BY and aggregate functions
- COUNT(), SUM(), AVG(), MAX(), MIN()
- Filtering using Boolean conditions
- Common Table Expressions (CTEs)
- Subqueries
- Window Functions
- RANK() and PARTITION BY
- Mathematical operations and calculated columns

## Questions Solved

### 1. Basic SQL Queries

1. Retrieve the names of all tracks that have more than 1 billion streams.
2. List all albums along with their respective artists.
3. Get the total number of comments for tracks where `licensed = TRUE`.
4. Find all tracks that belong to the album type `single`.
5. Count the total number of tracks by each artist.

### 2. Intermediate SQL Queries

1. Calculate the average danceability of tracks in each album.
2. Find the top 5 tracks with the highest energy values.
3. List all tracks along with their views and likes where `official_video = TRUE`.
4. For each album, calculate the total views of all associated tracks.
5. Retrieve track names that have been streamed on Spotify more than YouTube.

### 3. Advanced SQL Queries

1. Find the top 3 most-viewed tracks for each artist using window functions.
2. Find tracks where the liveness score is above the average.
3. Use a CTE to calculate the difference between the highest and lowest energy values for tracks in each album.
4. Find tracks where the energy-to-liveness ratio is greater than 1.2.

## Tools & Technologies

- **Database:** PostgreSQL
- **SQL Environment:** pgAdmin 4
- **Language:** SQL
- **Dataset:** Spotify Tracks Dataset

## Repository Structure

```text
Spotify-Music-Data-Analysis/
│
├── README.md
├── Spotify_SQL_Queries.sql
├── Spotify_Dataset.csv
└── Spotify_Analysis_Report.pdf
```


## Key Learning Outcomes

- Improved understanding of PostgreSQL and relational data analysis.
- Practiced writing optimized filtering and aggregation queries.
- Learned to use CTEs and window functions for advanced analytical tasks.
- Gained experience extracting insights from real-world music streaming data.

## Conclusion

This project strengthened my practical SQL skills by applying basic, intermediate, and advanced querying techniques to a music streaming dataset. It provided hands-on experience in data exploration, aggregation, ranking, and analytical problem-solving.

---

**If you find this project useful, feel free to explore the SQL queries!**
