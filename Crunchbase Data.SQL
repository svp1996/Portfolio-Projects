/* Observe the companies table */
SELECT *
  FROM tutorial.crunchbase_companies
/* Observe the acquisitions table */  
  SELECT *
  FROM tutorial.crunchbase_acquisitions

/* Use Inner Join to connect companies and acqusitions table by the primary key of permalink */
SELECT companies.permalink AS companies_permalink,
       companies.name AS companies_name,
       acquisitions.company_permalink AS acquisitions_permalink,
       acquisitions.acquired_at AS acquired_date
    FROM tutorial.crunchbase_companies companies
    JOIN tutorial.crunchbase_acquisitions acquisitions
      ON companies.permalink = acquisitions.company_permalink 
      
  /* Observe LEFT JOIN */
  SELECT companies.permalink AS companies_permalink,
       companies.name AS companies_name,
       acquisitions.company_permalink AS acquisitions_permalink,
       acquisitions.acquired_at AS acquired_date
  FROM tutorial.crunchbase_companies companies
  LEFT JOIN tutorial.crunchbase_acquisitions acquisitions
    ON companies.permalink = acquisitions.company_permalink
    
/* Create an inner join between acqusitions and companies table, count the 
number of non-null rows in each table */
SELECT COUNT(companies.permalink) AS companies_rowcount,
       COUNT(acquisitions.company_permalink) AS acquisitions_rowcount
  FROM tutorial.crunchbase_companies companies
  JOIN tutorial.crunchbase_acquisitions acquisitions
    ON companies.permalink = acquisitions.company_permalink
    
/* Create a LEFT join between acqusitions and companies table, count the 
number of non-null rows in each table */
SELECT COUNT(companies.permalink) AS companies_rowcount,
       COUNT(acquisitions.company_permalink) AS acquisitions_rowcount
  FROM tutorial.crunchbase_companies companies
  LEFT JOIN tutorial.crunchbase_acquisitions acquisitions
    ON companies.permalink = acquisitions.company_permalink

/* Find the number of unique companies without double counting and unique acquired companies by state
Don't show data where thers no state, order by number of acquired companies DESC */
SELECT companies.state_code,
       COUNT(DISTINCT companies.permalink) AS unique_companies,
       COUNT(DISTINCT acquisitions.company_permalink) AS unique_companies_acquired
  FROM tutorial.crunchbase_companies companies
  LEFT JOIN tutorial.crunchbase_acquisitions acquisitions
    ON companies.permalink = acquisitions.company_permalink
 WHERE companies.state_code IS NOT NULL
 GROUP BY 1
 ORDER BY 3 DESC
 
----- WHERE CLAUSE EXPLORATION -----

 SELECT companies.permalink AS companies_permalink,
       companies.name AS companies_name,
       acquisitions.company_permalink AS acquisitions_permalink,
       acquisitions.acquired_at AS acquired_date
  FROM tutorial.crunchbase_companies companies
  LEFT JOIN tutorial.crunchbase_acquisitions acquisitions
    ON companies.permalink = acquisitions.company_permalink
 ORDER BY 1
 
SELECT companies.permalink AS companies_permalink,
       companies.name AS companies_name,
       acquisitions.company_permalink AS acquisitions_permalink,
       acquisitions.acquired_at AS acquired_date
  FROM tutorial.crunchbase_companies companies
  LEFT JOIN tutorial.crunchbase_acquisitions acquisitions
    ON companies.permalink = acquisitions.company_permalink
   AND acquisitions.company_permalink != '/company/1000memories'
 ORDER BY 1
 
 /* Where clause and OR clause used */
 SELECT companies.permalink AS companies_permalink,
       companies.name AS companies_name,
       acquisitions.company_permalink AS acquisitions_permalink,
       acquisitions.acquired_at AS acquired_date
  FROM tutorial.crunchbase_companies companies
  LEFT JOIN tutorial.crunchbase_acquisitions acquisitions
    ON companies.permalink = acquisitions.company_permalink
 WHERE acquisitions.company_permalink != '/company/1000memories'
    OR acquisitions.company_permalink IS NULL
 ORDER BY 1
 
 /* Creating a query to show a company's name, status, and the number of unique investors
 in that company. Order by the number of investors from DESC. Limit by companies in NY */
 SELECT companies.name AS company_name,
        companies.status,
        COUNT(DISTINCT investments.investor_name) AS unique_investors
    FROM tutorial.crunchbase_companies companies
    LEFT JOIN tutorial.crunchbase_investments investments
    ON companies.permalink = investments.company_permalink 
    WHERE companies.state_code = 'NY'
    GROUP BY 1,2
    ORDER BY 3 DESC

/* Obsereve a list of investors based on the number of companies they 
are invested in. Show companies with no investor and order DESC */
SELECT CASE WHEN investments.investor_name IS NULL THEN 'No Investors'
            ELSE investments.investor_name END AS investor,
       COUNT(DISTINCT companies.permalink) AS companies_invested_in
  FROM tutorial.crunchbase_companies companies
  LEFT JOIN tutorial.crunchbase_investments investments
    ON companies.permalink = investments.company_permalink
 GROUP BY 1
 ORDER BY 2 DESC
 
 ----UNION----
 
SELECT *
  FROM tutorial.crunchbase_investments_part1

 UNION

 SELECT *
   FROM tutorial.crunchbase_investments_part2
   
/* Append two crunchbase_investments datasets with duplicate values. Filter first dataset
to only companies name that start with T and filter the second to companies that names
start with M */
SELECT company_permalink,
       company_name,
       investor_name
  FROM tutorial.crunchbase_investments_part1 
  WHERE company_name ILIKE 'T%'

UNION ALL

SELECT company_permalink,
       company_name,
       investor_name
   FROM tutorial.crunchbase_investments_part2 
   WHERE company_name ILIKE 'M%'
   
/*  Show 3 columns, dataset 1 or 2, company status, and count of # of investors */  
SELECT 'investments_part1' AS dataset_name,
       companies.status,
       COUNT(DISTINCT investments.investor_permalink) AS investors
  FROM tutorial.crunchbase_companies companies
  LEFT JOIN tutorial.crunchbase_investments_part1 investments
    ON companies.permalink = investments.company_permalink
 GROUP BY 1,2

 UNION ALL
 
 SELECT 'investments_part2' AS dataset_name,
       companies.status,
       COUNT(DISTINCT investments.investor_permalink) AS investors
  FROM tutorial.crunchbase_companies companies
  LEFT JOIN tutorial.crunchbase_investments_part2 investments
    ON companies.permalink = investments.company_permalink
 GROUP BY 1,2
 
 
 /* SQL Joins with comparasion operators */
 
 SELECT companies.permalink,
       companies.name,
       companies.status,
       COUNT(investments.investor_permalink) AS investors
  FROM tutorial.crunchbase_companies companies
  LEFT JOIN tutorial.crunchbase_investments_part1 investments
    ON companies.permalink = investments.company_permalink
   AND investments.funded_year > companies.founded_year + 5
 GROUP BY 1,2, 3
