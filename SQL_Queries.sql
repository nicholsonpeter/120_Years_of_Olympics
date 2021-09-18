SELECT ID
	,Name AS 'Competitor Name' -- Renamed Column
	,CASE WHEN Sex = 'M' THEN 'Male' ELSE 'Female' END AS Sex -- Better name for filters and visualisations
	,Age
	,CASE WHEN Age < 18 THEN 'Under 18' WHEN Age BETWEEN 18
				AND 25 THEN '18-25' WHEN Age BETWEEN 25
				AND 30 THEN '25-30' WHEN Age > 30 THEN 'Over 30' END AS Age_Grouping
	,Height
	,Weight
	,NOC AS 'Nation Code'
	,Team
	,Year
	,Sport
	,Season
	,Event
	,CASE WHEN Medal = 'NA' THEN 'Not Registered' ELSE Medal END AS Medal -- Replaced NA with Not Registered
FROM [olympics].[dbo].[athlete_events$]

--Creating a list of total individual athletes per year for the Summer Games
SELECT year
	,CASE WHEN Sex = 'M' THEN 'Male' ELSE 'Female' END AS Sex
	,COUNT(DISTINCT Name) AS num_athletes
FROM [olympics].[dbo].[athlete_events$]
WHERE season = 'Summer'
GROUP BY year
	,Sex
ORDER BY year

--Creating a list of total individual athletes per year for the Winter Games
SELECT year
	,CASE WHEN Sex = 'M' THEN 'Male' ELSE 'Female' END AS Sex
	,COUNT(DISTINCT Name) AS num_athletes
FROM [olympics].[dbo].[athlete_events$]
WHERE season = 'Winter'
GROUP BY year
	,Sex
ORDER BY year

SELECT Age
	,COUNT(*) AS Total_Medals
FROM [olympics].[dbo].[athlete_events$]
WHERE Age is NOT NULL --AND Medal = 'Gold' AND Season = 'Summer'
GROUP BY Age
ORDER BY Age