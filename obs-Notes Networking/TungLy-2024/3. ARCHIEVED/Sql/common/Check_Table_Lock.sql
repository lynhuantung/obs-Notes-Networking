SELECT tbl.name, dtl.*
FROM sys.dm_tran_locks dtl join sys.tables tbl on dtl.resource_associated_entity_id = tbl.object_id
WHERE dtl.resource_type = 'OBJECT' 
AND DB_NAME(dtl.resource_database_id) = 'HRM9_FGL'