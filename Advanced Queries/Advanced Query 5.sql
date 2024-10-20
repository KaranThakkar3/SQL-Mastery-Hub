-- SQL SERVER ADVANCED QUERY 5 
-- The table Destination contains the names of four cities. You want to travel among the four cities starting from Warsaw. We have another table named Ticket which lists all possible flight connections and the cost.

-- Your task is to find the path which will be cheapest in terms of the total tick- ets’ cost. List all paths starting from Warsaw that go through all four cities. Order the paths in descending order by TotalCost.

-- Your result set should contain the following columns: Path which contains city names separated by ->, LastId which contains the ID of the last city, TotalCost which contains the total cost of the tickets, NumPlacesVisited which contains the number of places visited; it should equal 4.

-- The script below generates the temporary tables. 

DROP TABLE IF EXISTS #Destination;
GO

-- Create the table
CREATE TABLE #Destination
(
ID INTEGER PRIMARY KEY,
Name VARCHAR(100)
);
GO

-- Populate the table
INSERT INTO #Destination VALUES
(1, ’Warsaw’),
(2,’Berlin’),
(3, ’Bucharest’),
(4, ’Prague’);
GO

DROP TABLE IF EXISTS #Ticket;
GO

-- Create the table
CREATE TABLE #Ticket
(
CityFrom INTEGER,
CityTo INTEGER,
Cost INTEGER
); GO

-- Populate the table
INSERT INTO #Ticket VALUES
(1, 2, 350),
(1, 3, 80),
(1, 4, 220),
(2, 3, 410),
(2, 4, 230),
(3, 2, 160),
(3, 4, 110),
(4, 2, 140),
(4, 3, 75);
GO

-- SOLUTION
with cte1 as 
(
select CityFrom, CityTo, Cost as TotalCost, d.Name as c1, d1.Name as c2
from #Ticket 
inner join #Destination d on #Ticket.CityFrom = d.ID
inner join #Destination d1 on #Ticket.CityTo = d1.ID
)
,cte2 as 
(
select
	CityTo,
    TotalCost,
    2 as NumPlacesVisited,
	cast(concat(c1,'->',c2) as varchar(100)) as Path
from cte1
where CityFrom = 1
union all
select
    cte1.CityTo,
	cte1.TotalCost + cte2.TotalCost,
    cte2.NumPlacesVisited + 1,
	cast(concat(cte2.Path,'->',cte1.c2) as varchar(100)) as Path
from cte1 
inner join cte2 on cte2.CityTo = cte1.CityFrom
where cte2.Path not like '%' + cte1.c2 +'%'
)
select
    Path,
	CityTo as LastId,
	TotalCost,
	NumPlacesVisited
from cte2
where NumPlacesVisited = 4
order by TotalCost DESC;