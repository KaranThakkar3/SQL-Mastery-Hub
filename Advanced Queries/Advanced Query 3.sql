-- SQL SERVER ADVANCED QUERY 3 
-- In this exercise you have a table showing clock in and clock out times for em- ployees. The script below generates a temporary table containing the clock in and clock out data for each employee. 

-- Create the table
DROP TABLE IF EXISTS #TimeCards;

CREATE TABLE #TimeCards(
TimeStampID INT NOT NULL IDENTITY PRIMARY KEY,
EmployeeID INT NOT NULL,
ClockDateTime DATETIME2(0) NOT NULL,
EventType VARCHAR(5) NOT NULL);

-- Populate the table
INSERT INTO #TimeCards(EmployeeID,
ClockDateTime, EventType)
VALUES
(1,’2021-01-02 08:00’,’ENTER’),
(2,’2021-01-02 08:03’,’ENTER’),
(2,’2021-01-02 12:00’,’EXIT’),
(2,’2021-01-02 12:34’,’ENTER’),
(3,’2021-01-02 16:30’,’ENTER’),
(2,’2021-01-02 16:00’,’EXIT’),
(1,’2021-01-02 16:07’,’EXIT’),
(3,’2021-01-03 01:00’,’EXIT’),
(2,’2021-01-03 08:10’,’ENTER’),
(1,’2021-01-03 08:15’,’ENTER’),
(2,’2021-01-03 12:17’,’EXIT’),
(3,’2021-01-03 16:00’,’ENTER’),
(1,’2021-01-03 15:59’,’EXIT’),
(3,’2021-01-04 01:00’,’EXIT’);

-- Write a query which uses window functions to calculate how long each employee worked on each shift. The time worked on each shift in your result set should include hours:minutes:seconds. For example, if an employee worked for 7 hours 15 minutes, then it should display 07:15:00. The final result set should contain three columns: EmployeeID, WorkDate, and TimeWorked.

-- SOLUTION
select s1.EmployeeID,CAST(s1.ClockDateTime as date) as WorkDate,concat(
 right('0'+ CAST((datediff(SECOND,s1.ClockDateTime,s2.ClockDateTime))/3600 AS VARCHAR),2) + ':',
 right('0'+CAST(((datediff(SECOND,s1.ClockDateTime,s2.ClockDateTime))/60)%60 AS VARCHAR),2) + ':',
 RIGHT('0'+CAST((datediff(SECOND,s1.ClockDateTime,s2.ClockDateTime))%60 AS VARCHAR),2)) as TimeWorked
 from
 (
 select rank() over (partition by t1.employeeID, t1.eventtype order by t1.ClockDateTime) as seq,*
 from #TimeCards t1)s1
 join
 (select *,
 rank() over (partition by t1.employeeID, t1.eventtype order by t1.ClockDateTime) as seq
 from #TimeCards t1)s2
 on s1.EmployeeID = s2.EmployeeID and s1.seq=s2.seq
 where s1.EventType < s2.EventType and s1.ClockDateTime<s2.ClockDateTime;