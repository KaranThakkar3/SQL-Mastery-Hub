-- SQL SERVER ADVANCED QUERY 4 
-- Take a look at the FolderHierarchy table. Each folder has an ID, a name, and an ID of a parent folder, which is the folder from which we can access the given folder.

-- Show four columns: ID, Name, ParentId, and Path. The last column should contain the path to the folder, starting with ’/’ and followed by all folder names separated by ’/’. At the end of the path, there should be the name of the given folder and a slash (’/’). An example for folder B, which is in the root folder A, would be: /A/B/.

-- The script below generates a temporary table containing the folder hierarchy details. 

-- Create the table
DROP TABLE IF EXISTS #FolderHierarchy;
GO

-- Create the table
CREATE TABLE #FolderHierarchy
(
ID INTEGER PRIMARY KEY,
Name VARCHAR(100),
ParentID INTEGER
);
GO

-- Populate the table
INSERT INTO #FolderHierarchy VALUES
(1, ’my_folder’, NULL),
(2,’my_documents’, 1),
(3, ’events’, 2),
(4, ’meetings’, 3),
(5, ’conferences’, 3),
(6, ’travel’, 3),
(7, ’integration’, 3),
(8, ’out_of_town’, 4),
(9, ’abroad’, 8),
(10, ’in_town’, 4);
GO


-- SOLUTION
with FolderCTE as 
(
select ID, Name, ParentID, cast('/my_folder' as varchar(200)) as Path 
from #FolderHierarchy
where ParentID is null

union all

select f.ID, f.Name, f.ParentID, cast(concat_ws('/', FolderCTE.Path, f.Name) as varchar(200)) as Path
from #FolderHierarchy f

inner join FolderCTE on FolderCTE.ID=f.ParentID
)
select ID, Name, ParentID, concat(Path,'/') as Path
from FolderCTE
order by ID;