SELECT * FROM tutorial.billboard_top_100_year_end
  
  
  
  /* In this query by using ORDER BY with the year DESC we are able to see the most recently ranked album.*/
  SELECT *
  FROM tutorial.billboard_top_100_year_end
 ORDER BY year DESC, year_rank
 
 /*The LIKE operator is used in this query to see which rows under “group” starts with “Snoop”. 
 Wildcard “%” is used to represent any character that comes after. We observe Snoop Doggy Dogg, Snoop Dogg, etc. */
 
 SELECT * 
 FROM tutorial.billboard_top_100_year_end
 WHERE "group" LIKE 'Snoop%';
 
 SELECT * 
 FROM tutorial.billboard_top_100_year_end
 WHERE artist ILIKE 'dr_ke'
 
 SELECT *
  FROM tutorial.billboard_top_100_year_end
 WHERE "group" ilike '%ludacris%'

SELECT * 
FROM tutorial.billboard_top_100_year_end
WHERE "group" LIKE 'DJ%'

SELECT *
  FROM tutorial.billboard_top_100_year_end
 WHERE year_rank IN (1, 2, 3)
 
 SELECT *
  FROM tutorial.billboard_top_100_year_end
 WHERE artist IN ('Taylor Swift', 'Usher', 'Ludacris')
 
 /* This query shows all of the entries for Elvis and M.C Hammer. MC hammer is listed in multiple 
 names so we have to write both ways */
 
 SELECT *
  FROM tutorial.billboard_top_100_year_end
 WHERE "group" IN ('M.C. Hammer', 'Hammer', 'Elvis Presley')
 
 
/* Using logical operator to select only rows that are within a specific range of 5 and 10 */
 SELECT *
  FROM tutorial.billboard_top_100_year_end
 WHERE year_rank BETWEEN 5 AND 10
 
 
 /* Using the =  specification will return the exact results */
 
 SELECT *
  FROM tutorial.billboard_top_100_year_end
 WHERE year_rank >= 5 AND year_rank <= 10
 
 /* This query shows all the top 100 songs from Jan 1,1985 through Dec 31,1990 */
 
 SELECT *
  FROM tutorial.billboard_top_100_year_end
 WHERE year BETWEEN 1985 AND 1990
 
 /* An ISNULL statement is run to check all of the values where Artist is NULL or blank.*/
 
 SELECT *
  FROM tutorial.billboard_top_100_year_end
 WHERE artist IS NULL
 
 /* This query shows all of the rows of which song_name is null */
 SELECT *
  FROM tutorial.billboard_top_100_year_end
 WHERE song_name IS NULL
 
 /* This query will return all rows for top-10 recordings in 2012. We use the where clause and the AND clause  */
 
 SELECT *
  FROM tutorial.billboard_top_100_year_end
 WHERE year = 2012 AND year_rank <= 10
 
 /* We are pulling data from the year 2012, where the rank is less than 10 and is grouped by featured music.*/
 
 SELECT *
  FROM tutorial.billboard_top_100_year_end
 WHERE year = 2012
   AND year_rank <= 10
   AND "group" ILIKE '%feat%'
   
   
 /* This query surfaces all rows for top-10 hits for which Ludacris is part of the group */  
   SELECT *
  FROM tutorial.billboard_top_100_year_end
 WHERE year_rank <= 10
   AND "group" ILIKE '%ludacris%'
   
  SELECT *
  FROM tutorial.billboard_top_100_year_end
 WHERE year_rank IN (1, 2, 3)
 
 SELECT * 
  FROM tutorial.billboard_top_100_year_end
WHERE artist IN ('Taylor Swift', 'Usher', 'Ludcaris')

SELECT * 
  FROM tutorial.billboard_top_100_year_end
  WHERE "group" IN ('M.C. Hammer', 'Hammer', 'Elvis Presley')
  
SELECT * 
  FROM tutorial.billboard_top_100_year_end
WHERE year_rank >= 5 AND year_rank <= 10

Select * 
  FROM tutorial.billboard_top_100_year_end
WHERE year BETWEEN 1985 AND 1990

  SELECT *
    FROM tutorial.billboard_top_100_year_end
  WHERE artist ISNULL
  
SELECT * 
  FROM tutorial.billboard_top_100_year_end
WHERE song_name ISNULL

SELECT *
  FROM tutorial.billboard_top_100_year_end
WHERE year = 2012 AND year_rank <= 10

SELECT * 
  FROM tutorial.billboard_top_100_year_end
WHERE year = 2012
  AND year_rank <= 10
  AND "group" ILIKE '%feat%'
  
SELECT * 
  FROM tutorial.billboard_top_100_year_end
WHERE year_rank <= 10
  AND "group" ILIKE '%ludacris%'

/* This query lists all songs from the 1960s with 'Love' in the title */
SELECT *
  FROM tutorial.billboard_top_100_year_end
WHERE year BETWEEN 1960 AND 1969
  AND Song_name ILIKE '%love%'
  
  
/* OR logical operator is used to satisfy either of the two conditions, 
it is similar to AND but and condition has to satisfy both of the two conditions versus OR has to do either one. */
  SELECT * 
    FROM tutorial.billboard_top_100_year_end
  WHERE year_rank = 5 OR artist = 'Gotye'
  
 /* Year is 2013 and the group column is made of like values of macklemore or timberlake */
 
  SELECT *
    FROM tutorial.billboard_top_100_year_end
  WHERE year = 2013
  AND ("group" ILIKE '%macklemore%' OR "group" ILIKE '%timberlake%')
 
 /* The purpose of this query is that it returns all rows for top-10 songs that featured either Katy Perry or Bon Jovi. 
 Group is used to create a column for the two artist to show in. ILIKE is used to populate any Katy Perry and Bon Jovi music with features. 
 Or is used because we want either OR. */
 
  SELECT *
  FROM tutorial.billboard_top_100_year_end
  WHERE year_rank <= 10
    AND ("group" ILIKE '%katy perry%' OR "group" ILIKE '%bon jovi%');

/*This query returns all songs with titles that contain the word “California” in either the 1970s or 1990s. 
Song_name is used with LIKE ‘%California%’ to find like song name. 
Then we use the AND clause with Between and OR because we want to find the song names between 1970-1979 and 1990-1999. */

SELECT *
FROM tutorial.billboard_top_100_year_end
WHERE song_name LIKE '%California%'
  AND (year BETWEEN 1970 AND 1979 OR year BETWEEN 1990 AND 1999);
  
SELECT *
  FROM tutorial.billboard_top_100_year_end
 WHERE "group" ILIKE '%dr. dre%'
   AND (year <= 2000 OR year >= 2010)
  
SELECT *
  FROM tutorial.billboard_top_100_year_end
 WHERE year = 2013
   AND year_rank NOT BETWEEN 2 AND 3
   
   
/* This query, I explore the NOT operator but when looking to identify non-null rows, IS needs to be used beforehand as observed. */

SELECT * 
  FROM tutorial.billboard_top_100_year_end
  WHERE year = 2013
  AND "group" NOT ILIKE '%Macklemore%';
  
SELECT * 
  FROM tutorial.billboard_top_100_year_end
  WHERE year = 2013
  AND artist IS NOT NULL;
  
/* Here we explore all the rows for songs that were on the charts in 2013 and do not contain the letter “a”. */

SELECT * 
FROM tutorial.billboard_top_100_year_end
WHERE song_name NOT ILIKE '%A%'
AND year = 2013;

/* The ORDER BY clause is used to reorder the results based on the data in one or more columns. 
In this instance, we are using ORDER BY Artist and it is “alphabetically ordering from A-Z or Ascending Order which is default in SQL. */

SELECT *
  FROM tutorial.billboard_top_100_year_end
 ORDER BY artist

/* Here we use the ORDER BY clause with year_rank and in DESC ordering.
What this does is it shows us to Higher or top ranking first. Since our table is called top 100 year end, we see the top 100 shows first. */

SELECT * 
FROM tutorial.billboard_top_100_year_end
ORDER BY year_rank DESC;

/* This query returns all rows from 2012, ordered by song title and from DESC Z-A order. */
SELECT * 
FROM  tutorial.billboard_top_100_year_end
WHERE year = 2012
ORDER BY SONG_NAME DESC;

 /* Ordering data by multiple columns. This is helpful when data is in multiple categories. 
 In this example we are organizing by date in the most recent years first and ordering the top rank songs over the lower ranked songs */
SELECT *
  FROM tutorial.billboard_top_100_year_end
  WHERE year_rank <= 3
  ORDER BY year DESC, year_rank

/* This query is similar to the above query but this displays that the order makes a difference on the data pulled. 
Here we see the year rank is first then the year in descending order comes after. */

SELECT *
  FROM tutorial.billboard_top_100_year_end
 WHERE year_rank <= 3
 ORDER BY year_rank, year DESC  
 
 /* Using numbers to substitute the column names to make the query look cleaner */
 SELECT *
  FROM tutorial.billboard_top_100_year_end
 WHERE year_rank <= 3
 ORDER BY 2, 1 DESC
 
 SELECT *
  FROM tutorial.billboard_top_100_year_end
 WHERE year = 2010
 ORDER BY year_rank, artist
 /* This query returns songs that ranked between 10 and 20 (inclusive) in 1993, 2003, or 2013.
 The results are ordered by year and rank. Looking at the results we see year 1993 is shown first and the year rank for the song is shown as well. */
 
SELECT * 
FROM tutorial.billboard_top_100_year_end
WHERE year IN (2013, 2003, 1993) --Select the relevant years
AND year_rank BETWEEN 10 and 20 --Limit the rank to 10-20
ORDER BY year, year_rank
