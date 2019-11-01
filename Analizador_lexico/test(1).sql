/****** Object:  Database prueba    Script Date: 01/10/2019 03:07:05 p.m. ******/
DROP DATABASE prueba
GO

/****** Object:  Database prueba    Script Date: 01/10/2019 03:07:05 p.m. ******/
CREATE DATABASE prueba ON  PRIMARY 
( NAMES = 'prueba', FILE = 'C:\Program Files\Microsoft SQL Server\MSSQL.1\MSSQL\DATA\prueba.mdf' , SIZE = 60608),
( NAMES = 'prueba2', FILE = 'H:\Data\prueba2.ndf' , SIZE = 1048576);

ALTER DATABASE prueba COLLATE SQL_Latin1_General_CP1_CI_AS
GO

/****** Object:  Table test.cqf.DEXTask    Script Date: 01/10/2019 03:33:45 p.m. ******/
CREATE TABLE test.cqf.DEXTask(
	TaskId int IDENTITY(1,1) NOT NULL,
	StartDate varchar(10) NOT NULL,
	EndDate varchar(10) NOT NULL,
	IsProcessed bit NOT NULL,
	ProcessedDate varchar(10) NULL,
	IsHorizontal bit NOT NULL,
 CONSTRAINT PK_DEXTask PRIMARY KEY CLUSTERED 
(
	TaskId ASC
)
) ON PRIMARY
GO


SELECT COUNT(*) AS BeforeTruncateCount   
FROM test.cqf.DEXTask;  
TRUNCATE TABLE test.cqf.DEXTask;  
GO  
SELECT TaskId,
	StartDate,
	EndDate,
	IsProcessed,
	ProcessedDate,
	IsHorizontal, *
FROM test.cqf.DEXTask;
 
--END


