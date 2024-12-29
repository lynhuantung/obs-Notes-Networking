select * from System_SP_Parameters
where SPCode='GET_INSRECORD' and ParameterName='CodeEmp'

select * from [System_SP_SelectColumns]
where SPCode='GET_INSRECORD' and TableName='Ins_InsuranceRecord' and ColumnName='ID' and ColumnAlias='ID'

select * from System_StoreProcs
where SPCode='GET_INSRECORD'

select * from System_SP_TableLinks
where SPCode='GET_INSRECORD' and TableName='Hre_Relatives_hr1'

select * from System_SP_TableLinks_Cached
where SPCode='GET_INSRECORD' and TableName='Hre_Relatives_hr1'


WITH CTE(SPCode,ParameterName,DuplicateCount) 
AS 
(
	SELECT SPCode,ParameterName, ROW_NUMBER() OVER(PARTITION BY SPCode,ParameterName ORDER BY CreatedDate desc) AS DuplicateCount
    FROM System_SP_Parameters
)
--
delete  from CTE
WHERE DuplicateCount > 1;

---- tao rang buoc trung du lieu
--ALTER TABLE System_SP_Parameters
--ADD CONSTRAINT System_SP_Parameters_unique UNIQUE (SPCode,ParameterName)

--store tham khao: 20221205_02.sql