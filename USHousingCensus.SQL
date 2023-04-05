SELECT * 
FROM tutorial.us_housing_units;

SELECT year,
      month,
      west 
FROM tutorial.us_housing_units 

SELECT year,
       month,
       month_name,
       west,
       midwest,
       south,
       northeast
  FROM tutorial.us_housing_units
  
  SELECT west AS West_Region,
       south AS South_Region
  FROM tutorial.us_housing_units
  
  SELECT year AS "Year",
        month AS "Month",
        month_name AS "Month Name",
        west AS "West",
        midwest AS "Midwest",
        south AS "South",
        northeast AS "Northeast"
  FROM tutorial.us_housing_units 
  
  SELECT * 
    FROM tutorial.us_housing_units 
    LIMIT 100
  
  SELECT * FROM tutorial.us_housing_units 
  
  SELECT * 
    FROM tutorial.us_housing_units 
    WHERE month = 1
    
  SELECT * 
    FROM tutorial.us_housing_units 
    WHERE west > 30

  SELECT * 
    FROM tutorial.us_housing_units 
    WHERE west < 30
  
   SELECT * 
    FROM tutorial.us_housing_units 
    WHERE west = 30
    
    SELECT *
  FROM tutorial.us_housing_units
 WHERE south <= 20
 
   SELECT *
  FROM tutorial.us_housing_units
 WHERE south < 20
 
 SELECT *
  FROM tutorial.us_housing_units
 WHERE west > 50
        
SELECT *
  FROM tutorial.us_housing_units
 WHERE month_name != 'January'
 
 SELECT *
  FROM tutorial.us_housing_units
 WHERE month_name > 'January'
 
SELECT *
  FROM tutorial.us_housing_units
 WHERE month_name = 'February'
        
  SELECT *
  FROM tutorial.us_housing_units
 WHERE month_name < 'o'
 
 SELECT year,
       month,
       west,
       south,
       west + south AS south_plus_west
  FROM tutorial.us_housing_units
  
  SELECT year,
       month,
       west,
       south,
       west + south - 4 * year AS nonsense_column
  FROM tutorial.us_housing_units
  
  SELECT year,
       month,
       west,
       south,
       midwest,
       northeast,
       west + south + midwest +northeast AS usa_total
  FROM tutorial.us_housing_units
  
  SELECT year,
       month,
       west,
       south,
       (west + south)/2 AS south_west_avg
  FROM tutorial.us_housing_units
  
  SELECT year,
       month,
       west,
       south,
       midwest,
       northeast
  FROM tutorial.us_housing_units
  WHERE west > (midwest + northeast)
  
  SELECT year,
         month,
         west/(west + south + midwest + northeast)*100 AS west_pct,
         south/(west + south + midwest + northeast)*100 AS south_pct,
         midwest/(west + south + midwest + northeast)*100 AS midwest_pct,
         northeast/ (west + south + midwest + northeast)*100 as northeast_pct
  from tutorial.us_housing_units 
  WHERE year >= 2000
  
