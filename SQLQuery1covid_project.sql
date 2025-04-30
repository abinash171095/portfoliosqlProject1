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

SELECT 
    location,
    MAX(cast(total_deaths as int)) AS totalDeathCount,
	MAX(cast(population as int)) as totalPopulation,
	(cast(max(cast(total_deaths as int)) as float)
	/NULLIF(MAX(CAST(population as int)),0))*100 as DeathPercentage

FROM 
    portfolioProject..CovidDeaths$
--WHERE location LIKE '%ndi%'
where continent is not null
GROUP BY 
    location
ORDER BY 
    DeathPercentage desc


	--global numbers

select date , SUM(new_cases)as newCasesPerDay,SUM(cast(new_deaths as int)) as newDeaths
,SUM(cast(new_deaths as int))/Sum(new_cases)*100 as DeathPercentage
from 
portfolioProject..CovidDeaths$
where continent is not null
group by date
order by 1,2

--