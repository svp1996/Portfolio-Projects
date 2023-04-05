SELECT * FROM benn.college_football_players

/* Case statement is SQLs version of if/then logic */

SELECT player_name,
       year,
       CASE WHEN year = 'SR' THEN 'yes'
            ELSE NULL END AS is_a_senior
  FROM benn.college_football_players
  
  /* To not have null values in the is_a_senior column, we use NO with ELSE statement */
  
  SELECT player_name,
       year,
       CASE WHEN year = 'SR' THEN 'yes'
            ELSE 'no' END AS is_a_senior
  FROM benn.college_football_players
  
/* Checking to see if has 'yes' flagged when a player is from California, 
sorting the results with those players first */

SELECT  player_name,
        state,
        CASE WHEN state = 'CA' THEN 'YES'
        ELSE NULL END AS from_california
    FROM benn.college_football_players
    ORDER BY 3 
    

/* Defining number of outcomes in a CASE statement with the use of WHEN/THEN statements */

SELECT player_name,
       weight,
       CASE WHEN weight > 250 THEN 'over 250'
            WHEN weight > 200 THEN '201-250'
            WHEN weight > 175 THEN '176-200'
            ELSE '175 or under' END AS weight_group
FROM benn.college_football_players

/* Better way to write the above query to prevent overlap */
SELECT player_name,
      weight,
      CASE WHEN weight > 250 THEN 'over 250'
          WHEN weight > 200 AND weight <= 250 THEN '201-250'
          WHEN weight > 175 AND weight <= 200 THEN '176-200'
          ELSE '175 or under' END AS weight_group
FROM benn.college_football_players

/* Query classifies player names based on four categories of height */

SELECT player_name,
      Height,
      CASE WHEN height > 74 THEN 'over 74'
           WHEN height > 72 AND height <= 74 THEN '73-74'
           WHEN height > 70 AND height <= 72 THEN '71-72'
           ELSE 'under 70' END AS height_group
FROM benn.college_football_players

SELECT player_name,
       CASE WHEN year = 'FR' AND position = 'WR' THEN 'frosh_wr'
            ELSE NULL END AS sample_case_statement
  FROM benn.college_football_players

/* Query that adds additional column that displays players name if that player is a junior or senior */

SELECT *,
       CASE WHEN year IN ('JR', 'SR') THEN player_name ELSE NULL END AS upperclass_player_name
  FROM benn.college_football_players
  
/* Using CASE with aggregate function */
  
SELECT CASE WHEN year = 'FR' THEN 'FR'
            ELSE 'Not FR' END AS year_group,
            COUNT(1) AS count
  FROM benn.college_football_players
 GROUP BY CASE WHEN year = 'FR' THEN 'FR'
               ELSE 'Not FR' END
               
/* Count other conditions by using WHEN */               

SELECT CASE WHEN year = 'FR' THEN 'FR'
            WHEN year = 'SO' THEN 'SO'
            WHEN year = 'JR' THEN 'JR'
            WHEN year = 'SR' THEN 'SR'
            ELSE 'No Year Data' END AS year_group,
            COUNT(year) AS count
  FROM benn.college_football_players
 GROUP BY 1
 
 
 SELECT CASE WHEN year = 'FR' THEN 'FR'
            WHEN year = 'SO' THEN 'SO'
            WHEN year = 'JR' THEN 'JR'
            WHEN year = 'SR' THEN 'SR'
            ELSE 'No Year Data' END AS year_group,
            COUNT(1) AS count
  FROM benn.college_football_players
 GROUP BY CASE WHEN year = 'FR' THEN 'FR'
               WHEN year = 'SO' THEN 'SO'
               WHEN year = 'JR' THEN 'JR'
               WHEN year = 'SR' THEN 'SR'
               ELSE 'No Year Data' END
               
/* Write a query that counts the number of 300+lb palyers for regions west coast CA,OR,WA, Texas and other */

SELECT CASE WHEN state IN ('CA', 'OR', 'WA') THEN 'West Coast'
            WHEN state = 'TX' THEN 'Texas'
            ELSE 'Other' END AS arbitrary_regional_designation,
            COUNT(1) AS players
        FROM benn.college_football_players
        WHERE weight >= 300
        GROUP BY 1
        
/* Write a query that calculates the combined weight of all underclass players (FR/SO)
in CA and the combined weight of all upperclass players (JR/SR) in CA */

SELECT CASE WHEN year IN ('FR', 'SO') THEN 'underclass'
            WHEN year IN ('JR', 'SR') THEN 'uppperclass'
            ELSE NULL END AS class_group,
        SUM(weight) AS combined_player_weight
    FROM benn.college_football_players
    WHERE state = 'CA'
    GROUP BY 1
    
/* Showing data horizontally, like a pivot table in Excel would */
SELECT CASE WHEN year = 'FR' THEN 'FR'
            WHEN year = 'SO' THEN 'SO'
            WHEN year = 'JR' THEN 'JR'
            WHEN year = 'SR' THEN 'SR'
            ELSE 'No Year Data' END AS year_group,
            COUNT(1) AS count
  FROM benn.college_football_players
 GROUP BY 1
 
 SELECT COUNT(CASE WHEN year = 'FR' THEN 1 ELSE NULL END) AS fr_count,
       COUNT(CASE WHEN year = 'SO' THEN 1 ELSE NULL END) AS so_count,
       COUNT(CASE WHEN year = 'JR' THEN 1 ELSE NULL END) AS jr_count,
       COUNT(CASE WHEN year = 'SR' THEN 1 ELSE NULL END) AS sr_count
  FROM benn.college_football_players
  
/* Query to display the number of players in each state, with standings in separate columns,
and another column with total number of players. Order results by states in desc */
SELECT state,
       COUNT (CASE WHEN year = 'FR' THEN 1 ELSE NULL END) AS fr_count,
       COUNT (CASE WHEN year = 'SO' THEN 1 ELSE NULL END) AS so_count,
       COUNT (CASE WHEN year = 'JR' THEN 1 ELSE NULL END) AS jr_count,
       COUNT (CASE WHEN year = 'SR' THEN 1 ELSE NULL END) AS sr_count,
       COUNT (1) AS total_players
    FROM benn.college_football_players
    GROUP BY state
    ORDER BY total_players DESC

/* Query explores the number of players at schools with names that start with A-M and # of 
schools that start with N-Z */
SELECT CASE WHEN school_name < 'n' THEN 'A-M'
            WHEN school_name >= 'n' THEN 'N-Z'
            ELSE NULL END AS school_name_group,
            COUNT(1) AS players
          FROM benn.college_football_players
          GROUP BY 1
          
/* USING JOINS WITH DATA */

/* Explore which conference has the highest avg weight,
use JOIN to connect both tables */

SELECT teams.conference AS conference,
       AVG(players.weight) AS average_weight
  FROM benn.college_football_players players
  JOIN benn.college_football_teams teams
    ON teams.school_name = players.school_name
 GROUP BY teams.conference
 ORDER BY AVG(players.weight) DESC
 
/* Create a query that selects the school name, player name, position and weight
for every player in Georgia, ordered by weight DESC */
SELECT players.school_name, 
       players.player_name,
       players.position,
       players.weight 
    FROM benn.college_football_players players
    WHERE players.state = 'GA'
    ORDER BY players.weight DESC

/* Join the players and teams table */
SELECT *
  FROM benn.college_football_players players
  JOIN benn.college_football_teams teams
    ON teams.school_name = players.school_name

/* Join players and teams tables, differentiate the tables */
SELECT players.school_name AS players_school_name,
       teams.school_name AS teams_school_name
  FROM benn.college_football_players players
  JOIN benn.college_football_teams teams
    ON teams.school_name = players.school_name
    
/* Create a join to display player name, school name and conference 
in FBS division I-A teams */
SELECT players.player_name,
       players.school_name,
       teams.conference 
    FROM benn.college_football_players players
    JOIN benn.college_football_teams teams
    ON teams.school_name = players.school_name 
    WHERE teams.division = 'FBS (Division I-A Teams)' 
    

    
    
