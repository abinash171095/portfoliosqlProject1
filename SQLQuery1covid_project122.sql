--Select *
--From portfolioProject..CovidDeaths$
--order by 3,4


--select *
--From portfolioProject..CovidVaccinations$
--order by 3,4


--select Data that we are going to using

--select location, date, total_cases,new_cases,total_deaths,population
--from portfolioProject..CovidDeaths$
--order by 1,2


--select location, date, total_cases,total_deaths,(total_deaths/total_cases)*100 as DeathPercentage
--from portfolioProject..CovidDeaths$
--where location like '%ndi%'
--order by location,date



--select location, date,population,MAX(total_cases/population)*100 as DeathPercentage
---from portfolioProject..CovidDeaths$
--where location like '%ndi%'
--order by location,date


--counties with highest infrection rate
--SELECT 
  --  location,
    --population, 
--    date, 
  --  MAX(total_cases) AS HighestInfectionRate,
    --MAX((total_cases / population)) * 100 AS populationInfectedPerPerson
--FROM 
   -- portfolioProject..CovidDeaths$
--WHERE location LIKE '%ndi%'
--GROUP BY 
   -- location, population, date
--ORDER BY 
  --  populationInfectedPerPerson desc

	--countries  with hieghest deaths

--SELECT 
  --  location,
    --MAX(cast(total_deaths as int)) AS totalDeathCount,
	--MAX(cast(population as int)) as totalPopulation,
--	(cast(max(cast(total_deaths as int)) as float)
	--/NULLIF(MAX(CAST(population as int)),0))*100 as DeathPercentage

--FROM 
  --  portfolioProject..CovidDeaths$
--WHERE location LIKE '%ndi%'
--where continent is not null
--GROUP BY 
  --  location
--ORDER BY 
    --DeathPercentage desc


	--global numbers

--select date , SUM(new_cases)as newCasesPerDay,SUM(cast(new_deaths as int)) as newDeaths
--,SUM(cast(new_deaths as int))/Sum(new_cases)*100 as DeathPercentage
--from 
--portfolioProject..CovidDeaths$
--where continent is not null
--group by date
--order by 1,2

--
--select * from 
--portfolioProject..CovidDeaths$

--Select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations,
--SUM(CONVERT(int,vac.new_vaccinations)) OVER (partition by dea.location Order by dea.date)
--as RollingPopulationVaccinated,
--(RollingPopulationVaccinated/population)*100
--from PortfolioProject..CovidDeaths$ dea
--JOIN PortfolioProject..CovidVaccinations$ vac
--On dea.location= vac.location
--and dea.date=vac.date
--where dea.continent is not null
--order by 2,3
--use cte
--WITH PopvsVac AS (
  --SELECT 
    --dea.continent,
    --dea.location,
    --dea.date,
    --dea.population,
    --vac.new_vaccinations,
    --SUM(CONVERT(int, vac.new_vaccinations)) OVER (
      --PARTITION BY dea.location 
--      ORDER BY dea.date
    --) AS RollingPopulationVaccinated,
    -- Calculate the percentage of the population vaccinated (rolling sum)
    --(SUM(CONVERT(int, vac.new_vaccinations)) OVER (
--      PARTITION BY dea.location 
      --ORDER BY dea.date
--    ) * 100.0 / dea.population) AS VaccinationPercent
  --FROM PortfolioProject..CovidDeaths$ dea
  --JOIN PortfolioProject..CovidVaccinations$ vac
    --ON dea.location = vac.location
  -- AND dea.date = vac.date
--  WHERE dea.continent IS NOT NULL
--)
--SELECT *
--FROM PopvsVac
--ORDER BY location, date;
--temp table
-- Create a temporary table to hold vaccination percentages
--Drop table if exists #PercentPopulationVaccinated
--CREATE TABLE #PercentPopulationVaccinated
--(
  --  Continent nvarchar(255),
    --Location nvarchar(255),
    --Date datetime,
    --Population numeric,
    --New_vaccinations numeric,
    --RollingPeopleVaccinated numeric
--);

-- Populate the temporary table with data from both source tables.
-- The cumulative sum (RollingPeopleVaccinated) is calculated per location in chronological order.
--INSERT INTO #PercentPopulationVaccinated
--SELECT 
    --dea.Continent, 
    --dea.Location, 
    --dea.Date, 
    --dea.Population, 
    --vac.New_vaccinations,
    --SUM(CONVERT(int, vac.New_vaccinations)) OVER(
        --PARTITION BY dea.Location 
        --ORDER BY dea.Location, dea.Date
    --) AS RollingPeopleVaccinated
--FROM portfolioProject..CovidDeaths$ dea
--JOIN portfolioProject..CovidVaccinations$ vac
--  ON dea.Location = vac.Location 
--  AND dea.Date = vac.Date
--WHERE dea.Continent IS NOT NULL;

-- Calculate and select the percentage of the population that has been vaccinated.
-- (RollingPeopleVaccinated/Population)*100 gives the percentage value.
--SELECT *,
    --(RollingPeopleVaccinated / Population) * 100 AS PercentPopulationVaccinated
--FROM #PercentPopulationVaccinated;


--view
-- Create the view that calculates the rolling total of vaccinations per location

CREATE VIEW PercentPopulationVaccinated AS
SELECT  
    dea.Continent,  
    dea.Location,  
    dea.Date,  
    dea.Population,  
    vac.New_vaccinations,
    SUM(CONVERT(int, vac.New_vaccinations)) OVER(
        PARTITION BY dea.Location 
        ORDER BY dea.Location, dea.Date
    ) AS RollingPeopleVaccinated
FROM portfolioProject..CovidDeaths$ dea
JOIN portfolioProject..CovidVaccinations$ vac
  ON dea.Location = vac.Location 
  AND dea.Date = vac.Date
WHERE dea.Continent IS NOT NULL;
GO

-- Fetch all records from the newly created view
SELECT *
FROM PercentPopulationVaccinated;