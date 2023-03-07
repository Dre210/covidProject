select *
from covidProject..covidDeath
order by 3, 4

select *
from covidProject..covidVaccinations
order by 3, 4


--selecting needed data

select location, date, total_cases, new_cases, total_deaths, population
from covidProject..covidDeath
order by 1, 2


--looking at total cases vs total deaths
--shows liklihood of dying if you contract covid in the states

select location, date, total_cases, total_deaths, (total_deaths/total_cases)*100 as deathpercentage
from covidProject..covidDeath
--where location like '%states%'
order by 1, 2


--looking at total cases vs population

select location, date, total_cases, population, (total_cases/population)*100 as effectionpopulation_percentage
from covidProject..covidDeath
order by 1, 2


--Looking at the countries with Highest effection Rate compare to population.

select location, population, MAX(total_cases) as infectionCount, MAX(total_cases/population)*100 as percentageofeffectedpopulation
from covidProject..covidDeath
group by location, population
order by percentageofeffectedpopulation desc


--Looking at the countries with Highest Deathcount per population 

select location, MAX(cast (total_Deaths as int)) as TotalDeathsCount
from covidProject..covidDeath
where continent is not null
group by location
order by TotalDeathsCount desc


--Looking at the Continent with Highest Deathcount per population

select continent, MAX(cast (total_Deaths as int)) as TotalDeathsCount
from covidProject..covidDeath
where continent is not null
group by continent
order by TotalDeathsCount desc


--Blobal new Death count

select SUM(new_cases) as total_cases, SUM(cast (new_deaths as int)) as total_deaths, (SUM(cast (new_deaths as int))/SUM(new_cases))*100 as percentage_of_newdeath
from covidProject..covidDeath
where continent is not null
--group by total_deaths


--Looking at population vs total vaccinations

select death.continent, death.location, death.date, death.population, vaccine.total_vaccinations, (vaccine.total_vaccinations/death.population)*100 as percentagepopulation_vaccinated
FROM covidProject..covidDeath death
join covidProject..covidVaccinations vaccine
    ON death.location =vaccine.location
    AND death.date =vaccine.date
	where death.continent is not null
	order by 2,3














