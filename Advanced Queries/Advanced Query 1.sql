-- SQL SERVER ADVANCED QUERY 1 
-- Consider a table with two columns. The first, ID, is an incrementing integer, the primary key of the table. The second column contains data values. Some data values may be NULL. Here is the script that creates the temp table with data values. 

-- Create the table
CREATE TABLE #TableValues(ID INT, Data INT);

-- Populate the table
INSERT INTO #TableValues(ID, Data)
VALUES(1,100),(2,100),(3,NULL),
(4,NULL),(5,600),(6,NULL),
(7,500),(8,1000),(9,1300),
(10,1200),(11,NULL);

-- Display the results
SELECT * FROM #TableValues;

-- The exercise is to use window functions to replace each NULL value with the previous non-NULL value.


-- SOLUTION
SELECT
  id, data, value_partition, first_value(data) over (partition by value_partition order by id) as new_column
FROM (
  SELECT
    id,
    data,
    sum(case when data is null then 0 else 1 end) over (order by id) as value_partition

  FROM #TableValues
  
) as q