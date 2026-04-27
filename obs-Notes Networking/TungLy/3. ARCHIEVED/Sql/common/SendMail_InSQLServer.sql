
ALTER PROCEDURE [dbo].[sp_testSendMail] 
@uid nvarchar(100) = 'tungly'
as
begin
EXEC [msdb].[dbo].sp_send_dbmail @profile_name='TestSendMail',
@recipients='tung.ly@vnresource.vn',
@subject='Test message',
@body=N'<strong>Hướng</strong> dẫn gởi email trong sqlserver.',
@body_format ='html'
end



--EXEC sp_configure 'show advanced options', 1;
--RECONFIGURE;

--EXEC sp_configure 'Ad Hoc Distributed Queries', 1;
--RECONFIGURE;