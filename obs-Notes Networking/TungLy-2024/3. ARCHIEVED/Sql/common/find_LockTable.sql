--Lấy danh sách các bảng bị lock
SELECT tbl.name as [table_name], dtl.request_session_id as [SessionID], dtl.*
FROM sys.dm_tran_locks dtl join sys.tables tbl on dtl.resource_associated_entity_id = tbl.object_id
WHERE dtl.resource_type = 'OBJECT'
--AND dtl.request_owner_type = 'TRANSACTION'
AND dtl.resource_database_id = DB_ID('HRM9_FGL')
--AND dtl.resource_associated_entity_id = OBJECT_ID('Hre_Profile')
--and dtl.request_session_id=240

--Để kill lock bảng trong SQL Server, bạn có thể sử dụng câu lệnh sau để kill session đang sở hữu lock trên bảng đó (trong đó 235 là field dm_tran_locks.request_session_id)
--kill 235