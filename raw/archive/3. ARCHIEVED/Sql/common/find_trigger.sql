
--find trigger for all table
SELECT sysobjects.name AS trigger_name
,s.name AS table_schema
,OBJECT_NAME(parent_obj) AS table_name
FROM sysobjects
JOIN sysusers ON sysobjects.uid = sysusers.uid
JOIN sys.tables t ON sysobjects.parent_obj = t.object_id
JOIN sys.schemas s ON t.schema_id = s.schema_id
WHERE sysobjects.type = 'TR'