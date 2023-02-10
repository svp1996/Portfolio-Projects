SELECT * FROM tutorial.aapl_historical_stock_price

/* Using the COUNT aggregate function for counting the number of rows */

SELECT COUNT (*)
  FROM tutorial.aapl_historical_stock_price

/* Using the COUNT function with high, provides a count of all rows in which the high column is not null
This value is lower than the first COUNT executed. High has some nulls. */
  
SELECT COUNT(high)
  FROM tutorial.aapl_historical_stock_price

/* Using LOW to see the count of non-null rows */

SELECT COUNT(low) 
  FROM tutorial.aapl_historical_stock_price

/* Query shows the total number of non-null rows */

SELECT COUNT(date) AS count_of_date
  FROM tutorial.aapl_historical_stock_price
  
/* This query determines counts of every single column. Looking at the data we see that the Year, Month, Close columns has the most null values */
  
SELECT COUNT (year) AS year,
       COUNT (month) AS month,
       COUNT (open) AS open,
       COUNT (high) AS high,
       COUNT (low) AS low,
       COUNT (close) AS close,
       COUNT (volume) AS volume
FROM tutorial.aapl_historical_stock_price

/* Here we explore the SUM aggregate function. It shows the total value in a given column. It only can be used for numerical values */
SELECT SUM(volume)
  FROM tutorial.aapl_historical_stock_price

/* This query calculates the average opening price. We use the COUNT and SUM functions */

SELECT SUM (open)/COUNT(open) AS avg_open_price
  FROM tutorial.aapl_historical_stock_price
  
  /* Use the MIN and MAX aggregate functions to return the lowest and highest values for volume */
  
  SELECT MIN(volume) AS min_volume,
         MAX(volume) AS max_volume
    FROM tutorial.aapl_historical_stock_price

/* This query shows the lowest stock price for Apple in the year of 2014 */

SELECT MIN(low)
  FROM tutorial.aapl_historical_stock_price
  
/* Explore the highest single-day increase in Apple's share value */

SELECT MAX(close-open)
  FROM tutorial.aapl_historical_stock_price

/* AVG aggregate function calculates the avg of a selected group of values. */

SELECT AVG(high) AS avg_high
  FROM tutorial.aapl_historical_stock_price
 
/*  Calculating the average daily trade volume for Apple Stock */

SELECT AVG(volume) AS avg_volume
  FROM tutorial.aapl_historical_stock_price
 
 /* We user GROUP BY to aggregate only part of a table. We use year to see count of entries year */
  
SELECT year,
  COUNT(*) AS count
  FROM tutorial.aapl_historical_stock_price
  GROUP BY  year

/* Group by multiple columns */

SELECT year,
       month,
       COUNT(*) AS count
  FROM tutorial.aapl_historical_stock_price
 GROUP BY year, month
 
 /* Calculating the total number of shares traded each month */
 
 SELECT year,
        month,
        SUM(volume) AS volume_sum
    FROM tutorial.aapl_historical_stock_price
    GROUP BY year, month
    ORDER BY year, month
    
 /* Controlling how the aggregations are grouped together by using ORDER BY */
 
 SELECT year,
       month,
       COUNT(*) AS count
  FROM tutorial.aapl_historical_stock_price
 GROUP BY year, month
 ORDER BY year, month
 
 /* Query calculates average daily price change in Apple stock, grouped by year. */
 
 SELECT year,
        AVG(close-open) AS avg_daily_change
    FROM tutorial.aapl_historical_stock_price
    GROUP BY year
    ORDER BY year
   
/* Calculating the lowest and highest prices for Apple stock each month */ 
 
 SELECT year,
        month,
        MIN(low) AS lowest_price,
        MAX(high) AS highest_price
    FROM tutorial.aapl_historical_stock_price
    GROUP BY year, month
    ORDER BY year, month
    
/* Using Having clause because it allows you to filter on aggregate columns */

SELECT year,
       month,
       MAX(High) AS month_high
    FROM tutorial.aapl_historical_stock_price
    GROUP BY year, month
    HAVING MAX(High) > 400
    ORDER BY year, month
