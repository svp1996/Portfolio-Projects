Select *
From CovidPortfolioProject.dbo.CovidDeaths
WHERE continent is not null
ORDER BY 3,4


--Select *
--From CovidPortfolioProject.dbo.CovidVacinations
--ORDER BY 3,4

--Select Data that we are going to be using for the project

Select Location, date, total_cases, new_cases, total_deaths, population
FROM CovidPortfolioProject.dbo.CovidDeaths
WHERE continent is not null
ORDER BY 1,2

-- Looking at the Total Cases vs Total Deaths
-- Shows the likelihood of dying if you contract covid in your country, United States used in this example

Select Location, date, total_cases, total_deaths, (total_deaths/total_cases)*100 as DeathPercentage
FROM CovidPortfolioProject.dbo.CovidDeaths
WHERE LOCATION like '%states%'
and continent is not null
ORDER BY 1,2

-- Looking at Total Cases vs Population
-- Shows what percentage of population got Covid

Select Location, date, population, total_cases, (total_cases/population)*100 as PercentPopulationInfected
FROM CovidPortfolioProject.dbo.CovidDeaths
--WHERE LOCATION like '%states%'
ORDER BY 1,2


-- Countries with highest infection rate compared to population

Select Location, population, MAX(total_cases) AS HighestInfectionCount, MAX((total_cases/population))*100 as PercentPopulationInfected
FROM CovidPortfolioProject.dbo.CovidDeaths
--WHERE LOCATION like '%states%'
GROUP BY Location, population
ORDER BY PercentPopulationInfected desc

--Countries with Highest Death Count per Population
--Using cast due to varchar, to show as int
--Not null is used because Continent Column has NULL values not showing proper continents


SELECT Location, MAX(cast(total_deaths as int)) as TotalDeathCount
FROM CovidPortfolioProject.dbo.CovidDeaths
--WHERE location like '%states%'
WHERE continent is not null
GROUP BY location
ORDER BY TotalDeathCount desc

--Break down by continent
--Showing the continents with the highest death count per population

SELECT continent, MAX(cast(total_deaths as int)) as TotalDeathCount
FROM CovidPortfolioProject.dbo.CovidDeaths
--WHERE location like '%states%'
WHERE continent is not null 
GROUP BY continent 
ORDER BY TotalDeathCount desc

--SELECT location, MAX(cast(total_deaths as int)) as TotalDeathCount
--FROM CovidPortfolioProject.dbo.CovidDeaths
----WHERE location like '%states%'
--WHERE continent is null 
--GROUP BY Location 
--ORDER BY TotalDeathCount desc


--Global Numbers

SELECT SUM(new_cases) as total_cases, SUM(cast(new_deaths as int)) as total_deaths, SUM(cast(new_deaths as int))/SUM(New_Cases)*100 as DeathPercentage
FROM CovidPortfolioProject.dbo.CovidDeaths
--WHERE location like '%states%'
WHERE continent is not null
--GROUP BY is not null
ORDER BY 1,2

--Looking for Total Population vs Vaccinations
-- Shows the percentage of population that has receieved at least one Covid vaccine

SELECT dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations
, SUM(CONVERT(int,vac.new_vaccinations)) OVER (partition by dea.location ORDER BY dea.location, dea.date) as RollingPeopleVacccinated
,(RollingPeopleVaccinated/population)*100
FROM CovidPortfolioProject.DBO.CovidDeaths dea
JOIN CovidPortfolioProject.dbo.CovidVacinations vac
	ON dea.location = vac.location
	AND dea.date = vac.date
WHERE dea.continent is not null
ORDER BY 2,3

-- Using CTE to perform calculation on partition by in previous query

WITH PopvsVac (Continent, Location, Date, Population, New_Vaccinations, RollingPeopleVaccinated)
as 
(
SELECT dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations
, SUM(CONVERT(int,vac.new_vaccinations)) OVER (partition by dea.location ORDER BY dea.location, dea.date) as RollingPeopleVacccinated
--,(RollingPeopleVaccinated/population)*100
FROM CovidPortfolioProject.DBO.CovidDeaths dea
JOIN CovidPortfolioProject.dbo.CovidVacinations vac
	ON dea.location = vac.location
	AND dea.date = vac.date
WHERE dea.continent is not null
--ORDER BY 2,3
)
SELECT *, (RollingPeopleVaccinated/Population)*100
FROM PopvsVac

--TEMP TABLE

--DROP TABLE if exisits #PercentPopulationVaccinated
CREATE TABLE #PercentPopulationVaccinated
(
Continent nvarchar(255),
Location nvarchar(255),
Date datetime,
Population numeric,
New_Vaccinations numeric,
RollingPeopleVaccinated numeric
)

INSERT INTO #PercentPopulationVaccinated
SELECT dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations
, SUM(CONVERT(bigint,vac.new_vaccinations)) OVER (partition by dea.location ORDER BY dea.location, dea.date) as RollingPeopleVacccinated
--,(RollingPeopleVaccinated/population)*100
FROM CovidPortfolioProject.DBO.CovidDeaths dea
JOIN CovidPortfolioProject.dbo.CovidVacinations vac
	ON dea.location = vac.location
	AND dea.date = vac.date
WHERE dea.continent is not null
--ORDER BY 2,3

SELECT *, (RollingPeopleVaccinated/Population)*100
FROM #PercentPopulationVaccinated

--Creating view to store data when visualization later

CREATE VIEW PercentPopulationVaccinated as
SELECT dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations
,SUM(CONVERT(BIGINT,vac.new_vaccinations)) OVER (Partition by dea.location ORDER BY dea.location, dea.date) as RollingPeopleVaccinated
--, (RollingPeopleVaccinated/population)*100
FROM CovidPortfolioProject.dbo.CovidDeaths dea
JOIN CovidPortfolioProject.dbo.CovidVacinations vac
	ON dea.location = vac.location
	AND dea.date = vac.date
WHERE dea.continent is not null 

SELECT * 
FROM PercentPopulationVaccinated