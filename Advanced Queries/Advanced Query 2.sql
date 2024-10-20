-- SQL SERVER ADVANCED QUERY 2
-- The script below generates a table containing data for customer subscriptions to an online magazine. The data are randomly generated so everyone will have different data in the temporary table. Use this data and window functions to calculate the number of active subscriptions at the end of each month. There may be cancellation dates past the latest subscription date, and you can ignore those rows. 

-- Create the temp table
CREATE TABLE #Registrations(ID INT NOT NULL IDENTITY PRIMARY KEY,
DateJoined DATE NOT NULL, DateLeft DATE NULL);

-- Variables
DECLARE @Rows INT = 10000,
@Years INT = 5,
@StartDate DATE = ’2011-01-01’

-- Insert 10,000 rows with five years of possible dates
INSERT INTO #Registrations (DateJoined)
SELECT TOP(@Rows) DATEADD(DAY,CAST(RAND(CHECKSUM(NEWID())) * @Years *
365 as INT) ,@StartDate)
FROM sys.objects a
CROSS JOIN sys.objects b
CROSS JOIN sys.objects c;

-- Give cancellation dates to 75% of the subscribers
UPDATE TOP(75) PERCENT #Registrations
SET DateLeft = DATEADD(DAY,CAST(RAND(CHECKSUM(NEWID())) * @Years * 365
as INT),DateJoined)

-- Your final result set should include four columns: MonthEnding containing the end date of the month, Number Subscribed, Number Unsubscribed, and Active Subscriptions.




-- SOLUTION
with months AS (
    select CONVERT(DATE,'2011-01-01') MonthStart, CONVERT(DATE,'2011-01-31') MonthEnd
    union all
    select dateadd(MONTH,1,MonthStart), dateadd(DAY,-1,dateadd(MONTH,2,MonthStart))
    from months
    where
        dateadd(MONTH,1,MonthStart) < GETDATE()
)
select 
    * 
from months m 
outer apply (
    select
        COUNT(*) UserCount
    from [#Registrations] [U]
    where
        DateJoined <= m.MonthEnd and
        (ISNULL(DateLeft,'3000-01-01')>= m.MonthStart)
) #Registrations
OPTION (MAXRECURSION 0)