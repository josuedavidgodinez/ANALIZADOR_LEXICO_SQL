
BEGIN --error
  SELECT LastName, FirstName, JobTitle, Department  
    FROM HumanResources.vEmployeeDepartment; 

    END;

    BEGIN
INSERT INTO test.cqf.DEXTask(TaskId,StartDate,EndDate,IsProcessed,ProcessedDate,IsHorizontal)
VALUES(12345,'2019-10-01','2019-10-03',1,'2019-10-02',1)
;
 INSERT INTO test.cqf.DEXTask(TaskId,StartDate,EndDate,IsProcessed,ProcessedDate,IsHorizontal)
VALUES(12345,'2019-10-01','2019-10-03',1,'2019-10-02',1)
GO
INSERT INTO test.cqf.DEXTask(TaskId,StartDate,EndDate,IsProcessed,ProcessedDate,IsHorizontal)
VALUES(12345,'2019-10-01','2019-10-03',1,'2019-10-02',1);
END; --error

    BEGIN 


        
INSERT INTO test.cqf.DEXTask(TaskId,StartDate,EndDate,IsProcessed,ProcessedDate,IsHorizontal)
VALUES(12345,'2019-10-01','2019-10-03',1,'2019-10-02',1)
;
 INSERT INTO test.cqf.DEXTask(TaskId,StartDate,EndDate,IsProcessed,ProcessedDate,IsHorizontal)
VALUES(12345,'2019-10-01','2019-10-03',1,'2019-10-02',1)
GO
INSERT INTO test.cqf.DEXTask(TaskId,StartDate,EndDate,IsProcessed,ProcessedDate,IsHorizontal)
VALUES(12345,'2019-10-01','2019-10-03',1,'2019-10-02',1);
INSERT INTO test.cqf.DEXTask(TaskId,StartDate,EndDate,IsProcessed,ProcessedDate,IsHorizontal)
VALUES(12345,'2019-10-01','2019-10-03',1,'2019-10-02',1);


    END;--error

CREATE OR ALTER PROC What_DB_is_that @ID INT   
AS    
SELECT DB_NAME+(@ID) AS ThatDB;; --error  

CREATE PROCEDURE dbo.usp_add_kitchen @dept_id INT, @kitchen_count INT  
WITH EXECUTE AS OWNER, SCHEMABINDING, NATIVE_COMPILATION--error
FOR REPLICATION
AS  
BEGIN  


  
  UPDATE dbo.Departments  
  SET kitchen_count = ISNULL+(kitchen_count+ 0) + @kitchen_count  
  WHERE id = @dept_id  
; END   
GO  


DROP PROC dbo.Departments, What_DB_is_that, dbo.uspGetAllEmployees;

DROP FUNCTION IF EXISTS hola;


CREATE PROCEDURE HumanResources.uspGetAllEmployees  
AS  
 
    SELECT LastName, FirstName, JobTitle, Department  --error
    FROM HumanResources.vEmployeeDepartment;  
GO  

ALTER PROCEDURE dbo.uspMultipleResults   
AS  
BEGIN
INSERT INTO test.cqf.DEXTask(TaskId,StartDate,EndDate,IsProcessed,ProcessedDate,IsHorizontal)--error
VALUES(12345,'2019-10-01','2019-10-03',1,'2019-10-02',1)
;
 INSERT INTO test.cqf.DEXTask(TaskId,StartDate,EndDate,IsProcessed,ProcessedDate,IsHorizontal)
VALUES(12345,'2019-10-01','2019-10-03',1,'2019-10-02',1)
GO
INSERT INTO test.cqf.DEXTask(TaskId,StartDate,EndDate,IsProcessed,ProcessedDate,IsHorizontal)
VALUES(12345,'2019-10-01','2019-10-03',1,'2019-10-02',1)
GO
 
END   
GO  





DECLARE vend_cursor CURSOR  
    FOR SELECT * FROM Purchasing.Vendor;  
OPEN vend_cursor  
FETCH NEXT FROM vend_cursor;  

DECLARE vend_cursor CURSOR  
    FOR SELECT TaskId AS C1, COUNT(1) AS BeforeTruncateCount   
	FROM test.cqf.DEXTask  
	WHERE TaskId > 3240823408
	GROUP BY TaskId
	ORDER BY TaskId ASC
GO 
FOR UPDATE OF IDE, DA, D;


ALTER PROCEDURE dbo.uspMultipleResults   
AS  
SELECT TOP(10) BusinessEntityID, Lastname, FirstName FROM Person.Person;  
SELECT TOP(10) CustomerID, AccountNumber FROM Sales.Customer; 
SELECT TOP(10) CustomerID, AccountNumber FROM Sales.Customer;  
GO 

DECLARE vend_cursor CURSOR  
    FOR SELECT * FROM Purchasing.Vendor ; 
FOR UPDATE ;  


CREATE PROCEDURE dbo.GetPhotoFromDB  
  
    @ProductPhotoID INT,  
    @CurrentDirectory CHAR(8,8),  
    @FileName VARCHAR(9,9),
    @hola BIT(8,9),
    @ID SMALLINT (9,10)
 
AS SELECT TOP(10) CustomerID, AccountNumber FROM Sales.Customer;   
GO

SELECT P.ProductID, P.Name, SUM(SD.LineTotal) AS Total  
    FROM Production.Product AS P   
    JOIN Sales.SalesOrderDetail AS SD ON SD.ProductID = P.ProductID  
    JOIN Sales.SalesOrderHeader AS SH ON SH.SalesOrderID = SD.SalesOrderID  
    JOIN Sales.Customer AS C ON SH.CustomerID = C.CustomerID  
    WHERE C.StoreID = @storeid  
    GROUP BY P.ProductID, P.Name;


ALTER FUNCTION Sales.ufn_SalesByStore (@storeid HOLA)  
RETURNS TABLE  
AS  
RETURN   
(  
    SELECT P.ProductID, P.Name, SUM(SD.LineTotal) AS Total  
    FROM Production.Product AS P   
    JOIN Sales.SalesOrderDetail AS SD ON SD.ProductID = P.ProductID  
    JOIN Sales.SalesOrderHeader AS SH ON SH.SalesOrderID = SD.SalesOrderID  
    JOIN Sales.Customer AS C ON SH.CustomerID = C.CustomerID  
    WHERE C.StoreID = @storeid  
    GROUP BY P.ProductID, P.Name ; 
)
GO


 
EXEC dbo.uspGetWhereUsedProductID 819, @CheckDate;  
 

EXECUTE @retstat = AdventureWorks2012.dbo.uspGetEmployeeManagers @BusinessEntityID = 6;

EXEC @proc_name;  


DELETE @ADIOS FROM TARARA ;

DELETE 

OPENQUERY (AJA, 'ID');

DELETE 
FROM
HO.A.DIOS
;

DELETE p.ProductID 
FROM Production.Product AS p   
JOIN Purchasing.ProductVendor AS v  
ON (p.ProductID = v.ProductID);  

DELETE Production.ProductCostHistory  
WHERE StandardCost BETWEEN 12.00 AND 14.00  
      AND EndDate IS NULL; 

      DELETE FROM Sales.SalesPersonQuotaHistory   
FROM Sales.SalesPersonQuotaHistory AS spqh  
INNER JOIN Sales.SalesPerson AS sp  
ON spqh.BusinessEntityID = sp.BusinessEntityID 
JOIN SALES ON HOLA=5  CROSS JOIN ADIOS
WHERE sp.SalesYTD > 2500000.00;  

DELETE spqh  
  FROM  
        Sales.SalesPersonQuotaHistory AS spqh  
    INNER JOIN Sales.SalesPerson AS sp  
        ON spqh.BusinessEntityID = sp.BusinessEntityID  
  WHERE  sp.SalesYTD > 2500000.00;  

  DELETE TOP (20)   
FROM @HOL  
WHERE DueDate < '20020701';  


DELETE OPENQUERY (MyLinkServer, 'SELECT Name, GroupName FROM AdventureWorks2012.HumanResources.Department  WHERE DepartmentID = 18');  


DELETE Production.ProductProductPhoto  
OUTPUT DELETED.ProductID,  
       p.Name,  
       p.ProductModelID,  
       DELETED.ProductPhotoID  
    INTO @MyTableVar  
FROM Production.ProductProductPhoto AS ph  
JOIN Production.Product AS p   
    ON ph.ProductID = p.ProductID   
    WHERE p.ProductModelID BETWEEN 120 AND 130;  
  


UPDATE Cities  
SET Location.X = 23.5  
WHERE Name = 'Anchorage';  

UPDATE Sales.SalesPerson  
SET Bonus = 6000, CommissionPct = 2.10, SalesQuota = NULL;  

UPDATE TOP (10) HumanResources.Employee
SET VacationHours = VacationHours * 1.25 ;

UPDATE Production.Location  
SET CostRate = DEFAULT  
WHERE CURRENT OF GLOBAL ID;

UPDATE@HOLA SET @HOLA = hola = 30302*2124;

UPDATE dbo.Table2   
SET dbo = dbo.Table2.ColB + dbo.Table1.ColB  
FROM dbo.Table2   
    INNER JOIN dbo.Table1   
    ON (dbo.Table2.ColA = dbo.Table1.ColA);


    UPDATE dbo.Table2   
SET dbo = dbo.Table2.ColB + dbo.Table1.ColB  
FROM dbo.Table2   
    INNER JOIN dbo.Table1   
    ON (dbo.Table2.ColA = dbo.Table1.ColA);

    UPDATE Production.Product  
SET Color = 'Metallic Red'  
WHERE StartDate IN ('20000404', '20000905') AND EndDate IS NOT NULL;

UPDATE Cities  
SET Location.SetXY(23.5, 23.5)  
WHERE Name = 'Anchorage'; 

UPDATE Production.BillOfMaterials  
SET PerAssemblyQty = c.PerAssemblyQty * 2  
FROM Production.BillOfMaterials AS c  
JOIN Parts AS d ON c.ProductAssemblyID = d.AssemblyID  
WHERE CURRENT OF IDEN;  

UPDATE dbo.Table1   
SET c2 = c2 + d2   
FROM dbo.Table2   ;




UPDATE Cities  
SET Location.X = 23.5  
WHERE Name = 'Anchorage';  

UPDATE Sales.SalesPerson  
SET Bonus = 6000, CommissionPct = 2.10, SalesQuota = NULL;  

UPDATE TOP (10) PERCENT HumanResources.Employee
SET VacationHours = VacationHours * 1.25 ;

UPDATE Production.Location  
SET CostRate = DEFAULT  
WHERE CostRate > 20.00;  


DROP TABLE HOLA.HOLA,HOLA.ADIOS,HOLA;
TRUNCATE TABLE HOLA;
DROP TABLE HOLA.HOLA, HOLA;
DROP DATABASE IF EXISTS ID,ID;
DROP DATABASE ID;
DROP VIEW IF EXISTS HOLA.HOLA, HOLA;
SAVE @ID;
DROP VIEW IF EXISTS HOA;
DROP USER EXISTS HAHAHA;
DROP USER IF EXISTS ;

DROP USER JOLA;
SAVE ID;
ROLLBACK TRAN @HOLA;
ROLLBACK TRAN;

ROLLBACK TRANSACTION @HOLA;

ROLLBACK TRAN HOLA;
ROLLBACK TRANSACTION HOLA;
ROLLBACK TRAN @HOLA;

SAVE TRAN ID;
SAVE TRANSACTION;
SAVE TRANSACTION ID;
SAVE TRAN @ ID;
SAVE TRANSACTION @ID;
SAVE TRAN;

BEGIN TRAN;
BEGIN TRANSACTION;

BEGIN TRAN ID;

BEGIN TRANSACTION @ID WITH MARK 'HOLA';
BEGIN TRANSACTIO @ID WITH MARK 'ADIOS';

BEGIN TRAN ID WITH;

BEGIN ;

TRUNCATE TABLE HOLA;

COMMIT TRAN ID WITH (DELAYED_DURABILITY = OFF);


SELECT TaskId AS C1, COUNT(1) AS BeforeTruncateCount   
	FROM test.cqf.DEXTask  
	WHERE TaskId > 3240823408
	GROUP BY TaskId
	ORDER BY TaskId ASC;

SELECT ALL TOP(6) PERCENT tablehola = jaja + fdasf * fdsafdsa, hola.*, *

FROM DFSAHJ TABLESAMPLE (1 PERCENT)

WHERE HOLA>98
GROUP BY (HOLA * 0)

HAVING SUM(450) IN (HOLA);

SELECT NAME, SUM(SALARY) FROM Employee 
GROUP BY NAME
HAVING SUM(SALARY)>3000; 

SELECT *  , *
FROM DimEmployee  
ORDER BY LastName; 

SELECT e.*  
FROM DimEmployee AS e  
ORDER BY LastName;  

SELECT FirstName, LastName, StartDate AS FirstDay  
FROM DimEmployee   
ORDER BY LastName;  

SELECT FirstName, LastName, StartDate AS FirstDay  
FROM DimEmployee   
WHERE EndDate IS NOT NULL   
AND MaritalStatus = 'M'  
ORDER BY LastName;  

SELECT DISTINCT Title  
FROM DimEmployee  
ORDER BY Title;

SELECT SUM(SalesAmount) AS TotalSales  
FROM FactInternetSales  
GROUP BY (OrderDateKey * 10), hk; 

SELECT OrderDateKey, SUM(SalesAmount) AS TotalSales  
FROM FactInternetSales  
GROUP BY OrderDateKey  
HAVING OrderDateKey > 20010000  
ORDER BY OrderDateKey;  


SELECT OrderDateKey, PromotionKey, AVG(SalesAmount) AS AvgSales, SUM(SalesAmount) AS TotalSales  
FROM FactInternetSales  
GROUP BY OrderDateKey, PromotionKey  
ORDER BY OrderDateKey ASC; 

SELECT OrderDateKey, SUM(SalesAmount) AS TotalSales  
FROM FactInternetSales  
GROUP BY OrderDateKey  
ORDER BY OrderDateKey; 

SELECT FirstName, LastName, BaseRate, 40 * BaseRate AS GrossPay  
FROM DimEmployee  
ORDER BY LastName; 

CREATE DATABASE Archive
ON
PRIMARY
    (NAME = Arch1,
    FILENAME = 'D:\SalesData\archdat1.mdf',
    SIZE = 100MB,
    MAXSIZE = 200,
    FILEGROWTH = 20),
    ( NAME = Arch2,
    FILENAME = 'D:\SalesData\archdat2.ndf',
    SIZE = 100MB,
    MAXSIZE = 200,
    FILEGROWTH = 20),
    ( NAME = Arch3,
    FILENAME = 'D:\SalesData\archdat3.ndf',
    SIZE = 100MB,
    MAXSIZE = 200,
    FILEGROWTH = 20)
LOG ON
  (NAME = Archlog1,
    FILENAME = 'D:\SalesData\archlog1.ldf',
    SIZE = 100MB,
    MAXSIZE = 200,
    FILEGROWTH = 20),
  (NAME = Archlog2,
    FILENAME = 'D:\SalesData\archlog2.ldf',
    SIZE = 100MB,
    MAXSIZE = 200,
    FILEGROWTH = 20) ;


CREATE DATABASE Sales
ON PRIMARY
( NAME = SPri1_dat,
    FILENAME = 'D:\SalesData\SPri1dat.mdf',
    SIZE = 10,
    MAXSIZE = 50,
    FILEGROWTH = 15% ),
( NAME = SPri2_dat,
    FILENAME = 'D:\SalesData\SPri2dt.ndf',
    SIZE = 10,
    MAXSIZE = 50,
    FILEGROWTH = 15% ),
FILEGROUP SalesGroup1
( NAME = SGrp1Fi1_dat,
    FILENAME = 'D:\SalesData\SG1Fi1dt.ndf',
    SIZE = 10,
    MAXSIZE = 50,
    FILEGROWTH = 5 ),
( NAME = SGrp1Fi2_dat,
    FILENAME = 'D:\SalesData\SG1Fi2dt.ndf',
    SIZE = 10,
    MAXSIZE = 50,
    FILEGROWTH = 5 ),
FILEGROUP SalesGroup2
( NAME = SGrp2Fi1_dat,
    FILENAME = 'D:\SalesData\SG2Fi1dt.ndf',
    SIZE = 10,
    MAXSIZE = 50,
    FILEGROWTH = 5 ),
( NAME = SGrp2Fi2_dat,
    FILENAME = 'D:\SalesData\SG2Fi2dt.ndf',
    SIZE = 10,
    MAXSIZE = 50,
    FILEGROWTH = 5 )
LOG ON
( NAME = Sales_log,
    FILENAME = 'E:\SalesLog\salelog.ldf',
    SIZE = 5MB,
    MAXSIZE = 25MB,
    FILEGROWTH = 5MB ) ;


CREATE DATABASE sales_snapshot0600 ON
      ( NAME = SPri1_dat, FILENAME = 'D:\SalesData\SPri1dat_0600.ss'),
    ( NAME = SPri2_dat, FILENAME = 'D:\SalesData\SPri2dt_0600.ss'),
    ( NAME = SGrp1Fi1_dat, FILENAME = 'D:\SalesData\SG1Fi1dt_0600.ss'),
    ( NAME = SGrp1Fi2_dat, FILENAME = 'D:\SalesData\SG1Fi2dt_0600.ss'),
    ( NAME = SGrp2Fi1_dat, FILENAME = 'D:\SalesData\SG2Fi1dt_0600.ss'),
    ( NAME = SGrp2Fi2_dat, FILENAME = 'D:\SalesData\SG2Fi2dt_0600.ss')
AS SNAPSHOT OF Sales ;

CREATE DATABASE AdventureWorks2012 ON
    ( NAME = SPri1_dat, FILENAME = 'D:\SalesData\SPri1dat_0600.ss'),
    ( NAME = SPri2_dat, FILENAME = 'D:\SalesData\SPri2dt_0600.ss'),
    ( NAME = SGrp1Fi1_dat, FILENAME = 'D:\SalesData\SG1Fi1dt_0600.ss'),
    ( NAME = SGrp1Fi2_dat, FILENAME = 'D:\SalesData\SG1Fi2dt_0600.ss'),
    ( NAME = SGrp2Fi1_dat, FILENAME = 'D:\SalesData\SG2Fi1dt_0600.ss'),
    ( NAME = SGrp2Fi2_dat, FILENAME = 'D:\SalesData\SG2Fi2dt_0600.ss')
FOR ATTACH;

 

CREATE NONCLUSTERED INDEX IX_SalesPerson_SalesQuota_SalesYTD ON Sales.SalesPerson (SalesQuota, SalesYTD);

CREATE UNIQUE INDEX AK_UnitMeasure_Name
  ON Production.UnitMeasure(Name);

  CREATE UNIQUE CLUSTERED INDEX IDX_V1
  ON Sales.vOrders (OrderDate, ProductID)
GO

CREATE NONCLUSTERED INDEX IX_Address_PostalCode
  ON Person.Address (PostalCode)
  INCLUDE (AddressLine1, AddressLine2, City, StateProvinceID)
GO


CREATE NONCLUSTERED INDEX IX_TransactionHistory_ReferenceOrderID
  ON Production.TransactionHistory (ReferenceOrderID)
  ON TransactionsPS1 (TransactionDate);


  CREATE NONCLUSTERED INDEX 'FIBillOfMaterialsWithEndDate'
  ON Production.BillOfMaterials (ComponentID, StartDate)
  WHERE EndDate IS NOT NULL;

CREATE VIEW prueba.dbo.jr_JOURRSPPAG AS
   SELECT TaskId AS C1, COUNT(1) AS BeforeTruncateCount   
	FROM test.cqf.DEXTask  
	WHERE TaskId > 3240823408
	GROUP BY TaskId
	ORDER BY TaskId ASC GO
    
    GO


CREATE USER RIGHTSHOLDER WITHOUT LOGIN GO
CREATE USER CERTUSER FOR CERTIFICATE SpecialCert GO
CREATE USER CERTUSER FROM CERTIFICATE SpecialCert GO
CREATE USER KEYUSER FOR ASYMMETRIC KEY SecureKey GO
CREATE USER KEYUSER FROM ASYMMETRIC KEY SecureKey GO


CREATE USER AJJA    
    WITH PASSWORD = '340$Uuxwp7Mcxo7Khy' GO

    CREATE USER JinghaoLiu FOR CERTIFICATE CarnationProduction50; 

CREATE USER Wanida FOR LOGIN WanidaBenshoof ;
CREATE USER CustomApp WITHOUT LOGIN GO



CREATE INDEX IX_VendorID ON ProductVendor (VendorID);
CREATE INDEX IX_VendorID ON dbo.ProductVendor (VendorID DESC, Name ASC, Address DESC);
CREATE INDEX IX_VendorID ON Purchasing..ProductVendor (VendorID);


ALTER DATABASE prueba COLLATE SQL_Latin1_General_CP1_CI_AS
GO

ALTER DATABASE AdventureWorks2012
ADD FILE
(
    NAME = Test1dat2,
    FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\t1dat2.ndf',
    SIZE = 5MB,
    MAXSIZE = 100MB,
    FILEGROWTH = 5MB
);

ALTER DATABASE AdventureWorks2012
MODIFY NAME = Northwind ;



ALTER DATABASE AdventureWorks2012
ADD FILE
(
    NAME = test1dat3,
    FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\t1dat3.ndf',
    SIZE = 5MB,
    MAXSIZE = 100MB,
    FILEGROWTH = 5MB
),  
(  
    NAME = test1dat4,
    FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\t1dat4.ndf',
    SIZE = 5MB,
    MAXSIZE = 100MB,
    FILEGROWTH = 5MB
)  
TO FILEGROUP Test1FG1;



ALTER VIEW HumanResources.EmployeeHireDate  
AS  
SELECT p.FirstName, p.LastName, e.HireDate  
FROM HumanResources.Employee AS e JOIN Person.Person AS p  
ON e.BusinessEntityID = p.BusinessEntityID  
WHERE HireDate < CONVERT(DATETIME,'20020101',101) ;  
GO  


ALTER VIEW prueba.dbo.jr_JOURRSPPAG AS
   SELECT TaskId AS C1, COUNT(1) AS BeforeTruncateCount   
	FROM test.cqf.DEXTask  
	WHERE TaskId > 3240823408
	GROUP BY TaskId
	ORDER BY TaskId ASC
GO
;

CREATE VIEW HumanResources.EmployeeHireDate  
AS  
SELECT p.FirstName, p.LastName, e.HireDate  
FROM HumanResources.Employee AS e JOIN Person.Person AS  p  
ON e.BusinessEntityID = p.BusinessEntityID ;  
GO  

ALTER VIEW HumanResources.EmployeeHireDate  
AS  
SELECT p.FirstName, p.LastName, e.HireDate  
FROM HumanResources.Employee AS e JOIN Person.Person AS  p  
ON e.BusinessEntityID = p.BusinessEntityID ;  
GO  




ALTER USER Mary51 WITH DEFAULT_SCHEMA = Purchasing;  

ALTER USER Philip
WITH NAME = Philipe
    , DEFAULT_SCHEMA = Development
    , PASSWORD = 'W1r77TT98%ab@#' OLD_PASSWORD = 'New Devel0per'
    , DEFAULT_LANGUAGE  = French ;  


ALTER USER Mary5 WITH NAME = Mary51; 

ALTER VIEW prueba.dbo.jr_JOURRSPPAG AS
   SELECT TaskId AS C1, COUNT(1) AS BeforeTruncateCount   
	FROM test.cqf.DEXTask  
	WHERE (TaskId > (3240823408+83298))
	GROUP BY TaskId
	ORDER BY TaskId ASC
GO
;



CREATE VIEW HumanResources.EmployeeHireDate  
AS  
SELECT p.FirstName, p.LastName, e.HireDate  
FROM HumanResources.Employee AS e JOIN Person.Person AS  p  
ON e.BusinessEntityID = p.BusinessEntityID ;  
GO  

ALTER VIEW HumanResources.EmployeeHireDate  
AS  
SELECT p.FirstName, p.LastName, e.HireDate  
FROM HumanResources.Employee AS e JOIN Person.Person AS  p  
ON e.BusinessEntityID = p.BusinessEntityID ;  
GO 


ALTER INDEX index1 ON table1 REBUILD;  
  
ALTER INDEX ALL ON table1 REBUILD;  
  
ALTER INDEX ALL ON dbo.table1 REBUILD;  

ALTER INDEX idxcci_cci_target ON cci_target REORGANIZE

-- REORGANIZE a specific partition  

;
ALTER INDEX cci_FactInternetSales2 ON FactInternetSales2 REORGANIZE PARTITION = 0;

ALTER INDEX cci_fact3   
ON fact3  
REBUILD PARTITION = 12;

ALTER INDEX AK_SalesOrderHeader_SalesOrderNumber ON  
    Sales.SalesOrderHeader  
SET (  
    STATISTICS_NORECOMPUTE = ON,  
    IGNORE_DUP_KEY = ON,  
    ALLOW_PAGE_LOCKS = ON  
    ) ;  


ALTER INDEX IX_Employee_ManagerID ON HumanResources.Employee DISABLE;


CREATE TABLE test.cqf.DEXTask(
	TaskId INT IDENTITY(1,1) NOT NULL,
	StartDate VARCHAR(10) NOT NULL,
	EndDate VARCHAR(10) NOT NULL,
	IsProcessed BIT NOT NULL,
	ProcessedDate VARCHAR(10) NULL,
	IsHorizontal BIT NOT NULL,
 CONSTRAINT PK_DEXTask PRIMARY KEY CLUSTERED 
(
	TaskId ASC
)
) ON PRIMARY
GO

CREATE TABLE dbo.PurchaseOrderDetail
(
    PurchaseOrderID INT NOT NULL
        REFERENCES Purchasing.PurchaseOrderHeader(PurchaseOrderID),
   REFERENCES Purchasing.PurchaseOrderHeader(PurchaseOrderID),
   CONSTRAINT PK_PurchaseOrderDetail_PurchaseOrderID_LineNumber
               FOREIGN KEY REFERENCES JKL (JL) ON DELETE SET NULL,
    LineNumber SMALLINT NOT NULL,
    
    LineNumber SMALLINT NOT NULL,

    ProductID INT NULL
        REFERENCES Production.Product(ProductID),
    OrderQty SMALLINT NULL,
    ReceivedQty FLOAT NULL,
    RejectedQty FLOAT NULL,
    ModifiedDate INT NOT NULL,
    LineTotal AS ((UnitPrice*OrderQty)),
    StockedQty AS ((ReceivedQty-RejectedQty)),
    CONSTRAINT PK_PurchaseOrderDetail_PurchaseOrderID_LineNumber
               PRIMARY KEY CLUSTERED (PurchaseOrderID, LineNumber),
               INDEX hoa NONCLUSTERED (HOLA ASC) ON PRIMARY3 (id)
              
)
ON PRIMARY3;

CREATE TABLE T1
    (c1 INT PRIMARY KEY,
    c2 VARCHAR(50) NULL,
    c3 INT NULL);

CREATE TABLE PartitionTable (col1 INT, col2 CHAR(10))
    ON myRangePS1 (col1) ;

CREATE TABLE hola.adios (
  col1 INT PRIMARY KEY
);


CREATE TABLE Department_History
(
    DepartmentNumber CHAR(10) NOT NULL,
    DepartmentName VARCHAR(50) NOT NULL,
    ManagerID INT NULL,
    ParentDepartmentNumber CHAR(10) NULL,
    SysStartTime SMALLINT NOT NULL,
    SysEndTime INTEGER NOT NULL
);
CREATE TABLE dbo.Employee (EmployeeID INT
PRIMARY KEY CLUSTERED);


CREATE TABLE t1 
(
    c1 INT, 
    INDEX ix_1 NONCLUSTERED (c1)
);

CREATE TABLE t2 
(
    c1 INT, 
    c2 INT  INDEX ix_1 NONCLUSTERED
);




CREATE TABLE dbo.Employee (
    EmployeeID INT PRIMARY KEY CLUSTERED
);

CREATE TABLE dbo.PurchaseOrderDetail
(
    PurchaseOrderID INT NOT NULL
        REFERENCES Purchasing.PurchaseOrderHeader(PurchaseOrderID),
    LineNumber SMALLINT NOT NULL,
    ProductID INT NULL
        REFERENCES Production.Product(ProductID),
    UnitPrice INT NULL,
    OrderQty SMALLINT NULL,
    ReceivedQty FLOAT NULL,
    RejectedQty FLOAT NULL,
    DueDate DATETIME NULL,
    rowguid INT ROWGUIDCOL
        CONSTRAINT DF_PurchaseOrderDetail_rowguid DEFAULT (4*4),
    ModifiedDate DATETIME NOT NULL
        CONSTRAINT DF_PurchaseOrderDetail_ModifiedDate DEFAULT (5*5),
    LineTotal AS ((UnitPrice*OrderQty)),
    StockedQty AS ((ReceivedQty-RejectedQty)),
    CONSTRAINT PK_PurchaseOrderDetail_PurchaseOrderID_LineNumber
               PRIMARY KEY CLUSTERED (PurchaseOrderID, LineNumber)
               
)
ON PRIMARY GO

