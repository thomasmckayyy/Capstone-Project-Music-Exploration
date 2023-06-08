--Queries used to set the data set up for excel

SELECT *
FROM AllTracks at2


--Checking to see how many songs are betweeen these dates
--in order to breakdwon the data set for EXL.

--Seeing how many values are in each decade to choose right data set
--ARTISTS
SELECT 
    FLOOR("year" / 10) * 10 AS decade,
    COUNT(DISTINCT artists) AS artist_count
FROM 
    AllTracks at2 
GROUP BY 
    decade
ORDER BY 
    decade;
    
--SONGS
SELECT 
    FLOOR("year" / 10) * 10 AS decade,
    COUNT(*) AS song_count
FROM 
    AllTracks at2 
GROUP BY 
    decade
ORDER BY 
    decade;
    
--Checking to see how many songs are from the 1970s and up.
--Allows me to explore what sample size I should take.
SELECT 
    FLOOR("year" / 10) * 10 AS decade,
    COUNT(*) AS song_count
FROM 
    AllTracks at2
WHERE decade >= 1970
GROUP BY 
    decade
ORDER BY 
    decade;
   
    
--Due to large dataset I only want to take the first 10,000 songs from each decade from 70s to present.
--Export to Excel
SELECT *
FROM (
    SELECT *,
        ROW_NUMBER() OVER (PARTITION BY FLOOR(year / 10) * 10 ORDER BY id) AS row_num
    FROM AllTracks at2 
    WHERE year >= 1970
) AS subquery
WHERE row_num <= 10000
ORDER BY year asc


-- Another View I want to see is how artists differed by decade.
--Here I took the average of each column for each artists, the result shows the average states of each artist.
--This view allows me to use the whole data set and not limited to 10,000 entries.
--Export to Excel
SELECT 
    artist_ids,
    artists,
    AVG(explicit) AS explicit,
    AVG(danceability) AS danceability,
    AVG(energy) AS energy,
    AVG(key) AS key,
    AVG(loudness) AS loudness,
    AVG(mode) AS mode,
    AVG(speechiness) AS speechiness,
    AVG(acousticness) AS acousticness,
    AVG(instrumentalness) AS instrumentalness,
    AVG(liveness) AS liveness,
    AVG(valence) AS valence,
    AVG(tempo) AS tempo,
    AVG(duration_ms) AS duration_ms,
    AVG(time_signature) AS time_signature,
    AVG(year) AS year
FROM 
    AllTracks
GROUP BY 
    artist_ids
ORDER BY artists ASC