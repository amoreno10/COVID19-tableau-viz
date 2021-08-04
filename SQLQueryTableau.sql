/*

DATA VISUALIZATION USING TABLEAU

SQL Server to create the tables which are going to be imported into tableau to create the visualizations.

Main data source: CovidDeaths.xlsx

*/

-- Table1.xlsx
SELECT SUM(new_cases) as Total_cases, SUM(CAST(new_deaths as int)) as Total_deaths, 
SUM(CAST(new_deaths as int))/SUM(new_cases)*100 as DeathPercentage
FROM PortfolioProject..CovidDeaths
WHERE continent is not NULL

-- Table2.xlsx
SELECT location, SUM(CAST(new_deaths as int)) as TotalDeathCount
FROM PortfolioProject..CovidDeaths
WHERE continent is null and location not in ('World', 'International', 'European Union')
GROUP BY location
ORDER BY 2 DESC

-- Table3.xlsx
SELECT location, population, MAX(total_cases) as HighestInfectionCount, 
MAX(total_cases)/population * 100 as PercentagePopulationInfected
FROM PortfolioProject..CovidDeaths
WHERE continent is not null
GROUP BY location, population
ORDER BY 4 DESC

-- Table4.xlsx
SELECT location, population, date, MAX(total_cases) as HighestInfectionCount, 
MAX(total_cases)/population * 100 as PercentagePopulationInfected
FROM PortfolioProject..CovidDeaths
GROUP BY location, population, date
ORDER BY 5 DESC