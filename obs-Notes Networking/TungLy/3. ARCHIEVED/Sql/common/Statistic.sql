--https://learn.microsoft.com/en-us/sql/t-sql/statements/set-statistics-io-transact-sql?view=sql-server-ver16
--Table 'Hre_Profile'. Scan count 1, logical reads 880, physical reads 0, page server reads 0, read-ahead reads 0, page server read-ahead reads 0, lob logical reads 0, lob physical reads 0, lob page server reads 0, lob read-ahead reads 0, lob page server read-ahead reads 0.
SET STATISTICS IO ON; 
select * from Hre_Profile
SET STATISTICS IO Off; 

SELECT name, STATS_DATE(object_id, stats_id) AS LastUpdated
FROM sys.stats
WHERE object_id = OBJECT_ID('Hre_Profile')
order by STATS_DATE(object_id, stats_id) desc



SELECT OBJECT_NAME(s.object_id) AS object_name,
    COL_NAME(sc.object_id, sc.column_id) AS column_name,
    s.name AS statistics_name,
    STATS_DATE(s.object_id, s.stats_id) AS last_updated
FROM sys.stats AS s
INNER JOIN sys.stats_columns AS sc
    ON s.stats_id = sc.stats_id AND s.object_id = sc.object_id
WHERE s.name like '_WA%' 
and OBJECT_NAME(s.object_id) ='Hre_Profile'
ORDER BY  STATS_DATE(s.object_id, s.stats_id) desc;


EXEC sp_autostats 'Hre_Profile', 'ON';

EXEC sp_updatestats;
