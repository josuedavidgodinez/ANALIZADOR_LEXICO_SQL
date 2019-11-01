DROP INDEX IX_ProductVendor_BusinessEntityID   
    ON Purchasing.ProductVendor
GO  

DROP INDEX  
    IX_PurchaseOrderHeader_EmployeeID ON Purchasing.PurchaseOrderHeader,  
    IX_Address_StateProvinceID ON Person.Address;  

DROP VIEW IF EXISTS dbo.Reorder
GO

CREATE VIEW hiredate_view  
AS   
SELECT p.FirstName, p.LastName, e.BusinessEntityID, e.HireDate  
FROM HumanResources.Employee e   
JOIN Person.Person AS p ON e.BusinessEntityID = p.BusinessEntityID;

CREATE VIEW DimEmployeeBirthDates AS  
SELECT FirstName, LastName, BirthDate   
FROM DimEmployee;

CREATE CLUSTERED INDEX IX_ProductVendor_VendorID ON Purchasing.ProductVendor (VendorID);

CREATE UNIQUE INDEX AK_UnitMeasure_Name
  ON Production.UnitMeasure(Name);

CREATE DATABASE MyOptionsTest
COLLATE French_CI_AI;

CREATE USER [ContosoFritz]
GO 

CREATE USER AbolrousHazem;

CREATE TABLE dbo.T1
(
    c1 INT,
    c2 VARCHAR(200)
);  


SELECT *
FROM Production.Product
ORDER BY Name ASC;

SELECT Name, ProductNumber, ListPrice AS Price
FROM Production.Product 
WHERE ProductLine = 'R' 
AND DaysToManufacture < 4
ORDER BY Name ASC;

SELECT p.Name AS ProductName
FROM Production.Product AS p 
INNER JOIN Sales.SalesOrderDetail AS sod
ON p.ProductID = sod.ProductID 
ORDER BY ProductName DESC;

SELECT SalesOrderID, SUM(LineTotal) AS SubTotal
FROM Sales.SalesOrderDetail
GROUP BY SalesOrderID
ORDER BY SalesOrderID
GO

SELECT ProductModelID, AVG(ListPrice) AS [AverageListPrice]
FROM Production.Product
WHERE ListPrice > 1000
GROUP BY ProductModelID
ORDER BY ProductModelID;


SELECT ProductID, AVG(UnitPrice) AS [AveragePrice]
FROM Sales.SalesOrderDetail
WHERE OrderQty > 10
GROUP BY ProductID
ORDER BY AVG(UnitPrice)
GO

SELECT ProductID 
FROM Sales.SalesOrderDetail
GROUP BY ProductID
HAVING AVG(OrderQty) > 5
ORDER BY ProductID
GO

SELECT SalesOrderID, CarrierTrackingNumber   
FROM Sales.SalesOrderDetail  
GROUP BY SalesOrderID, CarrierTrackingNumber  
HAVING CarrierTrackingNumber LIKE '4BD%'  
ORDER BY SalesOrderID ;  

SELECT ProductID 
FROM Sales.SalesOrderDetail
WHERE UnitPrice < 25.00
GROUP BY ProductID
HAVING AVG(OrderQty) > 5
ORDER BY ProductID
GO

SELECT ProductID, AVG(OrderQty) AS AverageQuantity, SUM(LineTotal) AS Total
FROM Sales.SalesOrderDetail
GROUP BY ProductID
HAVING SUM(LineTotal) > 1000000.00
AND AVG(OrderQty) < 3
GO

SELECT ProductID, SUM(LineTotal) AS Total
FROM Sales.SalesOrderDetail
GROUP BY ProductID
HAVING COUNT(*) > 1500
GO

UPDATE Sales.SalesPerson  
SET Bonus = 6, CommissionPct = 0.10
WHERE SalesQuota = NULL;

DROP DATABASE [LineaDiamante]
GO

ALTER  TABLE [dbo].[InformeViajes] DROP CONSTRAINT [CK__InformeVi__Pasaj__6D0D32F4]
GO

DROP USER IF EXISTS user_name 
GO

ALTER DATABASE testDB
COLLATE French_CI_AI;

DELETE TOP (1) FROM AdventureWorks2017.HumanResources.Employee 
WHERE Employee.BusinessEntityID IN (1, 5, 8, 0);

INSERT INTO UBICACION (ciudad, zona, descripcion) VALUES ('Guatemala', 4, 'El trebol'), ('Guatemala', 3, 'El Basurero'), ('Guatemala', 8, 'Atlntico')
														,('Guatemala', 1, 'Palacio'), ('Guatemala', 11, 'Peri'), ('Guatemala', 11, 'MiraFlowers')
														,('Guatemala', 5, 'La Asuncion'), ('Guatemala', 7, 'El Naranjal'), ('Guatemala', 6, 'El Mercadito'),
														('Guatemala', 17, 'km 10');

CREATE INDEX IX_FF ON dbo.FactFinance ( FinanceKey, DateKey, OrganizationKey DESC);

CREATE NONCLUSTERED INDEX IX_TransactionHistory_ReferenceOrderID
ON TransactionsPS1 (TransactionDate); 

CREATE UNIQUE INDEX AK_UnitMeasure_Name
  ON Production.UnitMeasure(Name);

ALTER PROCEDURE usp_test1 @EmployeeIDParam INT,
					@MaxTotal INT OUTPUT
AS
BEGIN
	SELECT	vE.EmailAddress, vE.FirstName, vE.LastName
	FROM	HumanResources.vEmployee vE
	WHERE	vE.BusinessEntityID = @EmployeeIDParam;

	SELECT	@MaxTotal =  MAX(TotalDue)
	FROM	Sales.SalesOrderHeader;
END;

CREATE PROCEDURE HumanResources.uspGetAllEmployees  
AS 
BEGIN
    SELECT LastName, FirstName, JobTitle, Department  
    FROM HumanResources.vEmployeeDepartment;  
 END
GO  

EXECUTE Production.uspGetList '%Bikes%', 700;

CREATE PROCEDURE dbo.uspMultipleResults   
AS  
BEGIN
SELECT TOP(10) BusinessEntityID, Lastname, FirstName FROM Person.Person;  
SELECT TOP(10) CustomerID, AccountNumber FROM Sales.Customer;  
END
GO  

CREATE PROCEDURE HumanResources.uspGetEmployees   
    @LastName NVARCHAR(50),   
    @FirstName NVARCHAR(50)   
AS   
 BEGIN 
    SELECT FirstName, LastName, JobTitle, Department  
    FROM HumanResources.vEmployeeDepartment  
    WHERE FirstName = @FirstName AND LastName = @LastName;  
    END
GO  

EXECUTE HumanResources.uspGetEmployees2;  

CREATE PROCEDURE Production.uspGetList @Product VARCHAR(40)   
    , @MaxPrice MONEY   
    , @ComparePrice MONEY OUTPUT  
    , @ListPrice MONEY OUT  
AS  
BEGIN 
    SELECT p.[Name] AS Product, p.ListPrice AS 'List Price'  
    FROM Production.Product AS p  
    JOIN Production.ProductSubcategory AS s   
      ON p.ProductSubcategoryID = s.ProductSubcategoryID  
    WHERE s.[Name] LIKE @Product AND p.ListPrice < @MaxPrice;  
	SELECT MAX(p.ListPrice)  
        FROM Production.Product AS p  
        JOIN  Production.ProductSubcategory AS s   
          ON p.ProductSubcategoryID = s.ProductSubcategoryID  
        WHERE s.[Name] LIKE @Product AND p.ListPrice < @MaxPrice;  
END
GO  

DECLARE contact_cursor SCROLL CURSOR FOR  
SELECT LastName, FirstName FROM Person.Person  
ORDER BY LastName, FirstName;  

DECLARE vendor_cursor CURSOR FOR   
SELECT VendorID, Name  
FROM Purchasing.Vendor  
WHERE PreferredVendorStatus = 1  
ORDER BY VendorID;  

DECLARE vend_cursor CURSOR  
    FOR SELECT * FROM Purchasing.Vendor;
GO

BEGIN TRANSACTION @TranName;  
USE AdventureWorks2012;  
DELETE FROM AdventureWorks2012.HumanResources.JobCandidate  
    WHERE JobCandidateID = 13;  
  
COMMIT TRANSACTION @TranName;  
GO  

BEGIN TRANSACTION CandidateDelete  
    WITH MARK 'Deleting a Job Candidate';  
GO  
USE AdventureWorks2012;  
GO  
DELETE FROM AdventureWorks2012.HumanResources.JobCandidate  
    WHERE JobCandidateID = 13;  
GO  
COMMIT TRANSACTION CandidateDelete;  
GO  

DECLARE contact_cursor CURSOR FOR  
SELECT LastName FROM Person.Person  
WHERE LastName LIKE 'B%'  
ORDER BY LastName;  

USE tempdb;  
GO  
CREATE TABLE ValueTable ([value] INT);  
GO  
  
INSERT INTO ValueTable VALUES(3),(4);  
  
SELECT [value] FROM ValueTable;  
  
DROP TABLE ValueTable;  

CREATE FUNCTION CtrAmount ( @Ctr_Id INT(10) )
  RETURNS MONEY
  AS
  BEGIN
        SELECT @CtrPrice = SUM(amount)
          FROM Contracts
        WHERE contract_id = @Ctr_Id ;
      RETURN(@CtrPrice)
  END
GO

ALTER TABLE dbo.doc_exc
DROP CONSTRAINT my_constraint, my_pk_constraint
GO

ALTER TABLE dbo.doc_exa ADD column_b VARCHAR(20) NULL
GO

UPDATE Sales.SalesPerson  
SET Bonus = 6, CommissionPct = 0.10
WHERE SalesQuota = NULL;

DROP DATABASE [LineaDiamante]
GO

ALTER  TABLE [dbo].[InformeViajes] DROP CONSTRAINT [CK__InformeVi__Pasaj__6D0D32F4]
GO
DROP USER IF EXISTS user_name
GO

ALTER DATABASE testDB
COLLATE French_CI_AI;

DELETE TOP (1) FROM AdventureWorks2017.HumanResources.Employee 
WHERE Employee.BusinessEntityID IN (1, 5, 8, 0);

INSERT INTO UBICACION (ciudad, zona, descripcion) VALUES ('Guatemala', 4, 'El trebol'), ('Guatemala', 3, 'El Basurero'), ('Guatemala', 8, 'Atlntico')
														,('Guatemala', 1, 'Palacio'), ('Guatemala', 11, 'Peri'), ('Guatemala', 11, 'MiraFlowers')
														,('Guatemala', 5, 'La Asuncion'), ('Guatemala', 7, 'El Naranjal'), ('Guatemala', 6, 'El Mercadito'),
														('Guatemala', 17, 'km 10');

CREATE INDEX IX_FF ON dbo.FactFinance ( FinanceKey, DateKey, OrganizationKey DESC);

CREATE UNIQUE INDEX AK_UnitMeasure_Name
ON Production.UnitMeasure(Name);

CREATE TABLE TIPO_LICENCIA
(
	id_tipo INT IDENTITY(1,1),
	tipo VARCHAR(1) NOT NULL,
	CONSTRAINT pk_idTipo PRIMARY KEY (id_tipo),
	CONSTRAINT uk_tipoLicencia UNIQUE(tipo),
	CONSTRAINT ck_tipoLicencia CHECK(tipo IN ('A','B','C','M'))
)
GO

--NO DEBERIA MARCHAR ERROR PORQUE ID'S MUY GRANDES
ALTER TABLE Production.TransactionHistoryArchive
ADD CONSTRAINT PK_TransactionHistoryArchive_TransactionID PRIMARY  KEY CLUSTERED (TransactionID);

ALTER TABLE sales.quotations 
    ADD 
        amount DECIMAL (10, 2) NOT NULL,
        customer_name VARCHAR (50) NOT NULL;
        GO

ALTER VIEW HumanResources.EmployeeHireDate  
AS  
SELECT p.FirstName, p.LastName, e.HireDate  
FROM HumanResources.Employee AS e JOIN Person.Person AS p  
ON e.BusinessEntityID = p.BusinessEntityID  
WHERE HireDate < '20020101';
GO  
TRUNCATE TABLE HumanResources.JobCandidate;  
GO

TRUNCATE TABLE PartitionTable1;
GO
DROP TABLE IF EXISTS dbo.Product,asdad;
GO

DROP INDEX index_name ON table_name,sdakdja ON table_name; 
GO

DROP INDEX IF EXISTS ix_cust_email
ON sales.customers;
GO


DROP DATABASE Sales, NewSales;
GO

DROP DATABASE sales_snapshot0600;

CREATE DATABASE Testdb;
GO

CREATE TABLE suppliers
( supplier_id INT NOT NULL,
  supplier_name CHAR(50) NOT NULL,
  contact_name CHAR(50),
  CONSTRAINT suppliers_pk PRIMARY KEY (supplier_id),
  CONSTRAINT suppliers_pk PRIMARY KEY (supplier_id),
  CONSTRAINT suppliers_pk PRIMARY KEY (supplier_id)
);
GO

CREATE TABLE sales.visits (
    visit_id INT PRIMARY KEY IDENTITY (1, 1),
    first_name VARCHAR (50) NOT NULL,
    last_name VARCHAR (50) NOT NULL,
    visited_at DATETIME,
    phone VARCHAR(20),
    store_id INT NOT NULL,
    FOREIGN KEY (store_id) REFERENCES sales.stores (store_id),
    PRIMARY KEY (sdada,sdsada)
);
GO

DELETE FROM employees
WHERE last_name = 'Johnson'
AND employee_id >= 80;
GO
  
CREATE NONCLUSTERED INDEX index_name
ON table_name(column_list);
GO

  
CREATE INDEX ix_customers_city
ON sales.customers(city);
GO
CREATE INDEX ix_customers_name 
ON sales.customers(last_name, first_name);
GO

CREATE INDEX ix_customers_name 
ON sales.customers(last_name, first_name) INCLUDE (last_name, first_name);
GO

CREATE USER AbolrousHazem FOR LOGIN AbolrousHazem;  

/*AQUI EMPIEZAN LOS ERRORES*/

CREATE NONCLUSTERED INDEX IX_Address_PostalCode
Person.Address (PostalCode) --FALTA ON
INCLUDE (AddressLine1, AddressLine2, City, StateProvinceID);

ALTER  TABLE  DROP CONSTRAINT [CK__InformeVi__Pasaj__6D0D32F4] --ERROR FALTA IDENTIFICADOR DE TABLA
GO

CREATE NONCLUSTERED INDEX "FIBillOfMaterialsWithEndDate"	--Se esperaba un ID
ON Production.BillOfMaterials (ComponentID, StartDate)
WHERE EndDate IS NOT NULL;

DELETE TOP (1) FROM AdventureWorks2017.HumanResources.Employee FROM AdventureWorks2017.HumanResources.Employee, Production.Product --Dos veces from
WHERE Employee.BusinessEntityID LIKE 'S%'
GO

SELECT ProductID, SpecialOfferID, AVG(UnitPrice) AS [Average Price], --ALIAS NO VALIDO
SUM(LineTotal) AS SubTotal
FROM Sales.SalesOrderDetail
GROUP BY ProductID, SpecialOfferID
ORDER BY ProductID
GO

SELECT AVG(OrderQty) AS [AverageQuantity], --coma mala
FROM Sales.SalesOrderDetail
GROUP BY (OrderQty * UnitPrice)
ORDER BY (OrderQty * UnitPrice) DESC;

UPDATE Sales.SalesPerson  
SET Bonus = , CommissionPct = 0.10 --ERROR NO TIENE VALOR BONUS
WHERE SalesQuota = NULL; 

DROP DATABASE --ERROR FALTA NOMBRE DE LA BASE
GO

ALTER TABLE HumanResources.Employee DROP CONSTRAINT  EXISTS GOLA --SE ESPERA INDENTIFICADOR O IF
GO

ALTER  TABLE  DROP CONSTRAINT [CK__InformeVi__Pasaj__6D0D32F4] --ERROR FALTA IDENTIFICADOR DE TABLA //
GO

ALTER TABLE HumanResources.Employee DROP CONSTRAINT  EXISTS GOLA --SE ESPERA INDENTIFICADOR O IF
GO  
  
BEGIN TRAN @TransactionName  					--Falta ; o GO
       INSERT INTO ValueTable VALUES(1), (2);  
ROLLBACK TRAN @TransactionName;  

CREATE PROCEDURE usp_InsertProductionLocation  
@TVP LocationTableType READONLY  
AS   
BEGIN
	INSERT INTO [AdventureWorks2012].[Production].[Location]  
           ([Name]  
           ,[CostRate]  
           ,[Availability]  
           ,[ModifiedDate]);				--Falta un valor para el insert

    SELECT *, 0, vEmployeeDepartment  
    FROM Employee E; 
END

CREATE FUNCTION Sales.ufn_SalesByStore (@storeid INT)  
RETURNS DATETIME 
AS  
BEGIN
	SELECT P.ProductID, P.Name, SUM(SD.LineTotal) AS 'Total'  
    FROM Production.Product AS P   
    JOIN Sales.SalesOrderDetail AS SD ON SD.ProductID = P.ProductID  
    JOIN Sales.SalesOrderHeader AS SH ON SH.SalesOrderID = SD.SalesOrderID  --Palabra ON
    JOIN Sales.Customer AS C ON SH.CustomerID = C.CustomerID  
    WHERE C.StoreID = @storeid  
    GROUP BY P.ProductID, P.Name;
RETURN   
(  
    'Puto Josue'
)
END;

ALTER VIEW HumanResources.EmployeeHireDate  
AS  
SELECT p.FirstName, p.LastName, e.HireDate  
FROM HumanResources.Employee AS e JOIN Person.Person AS p1  
ON e.BusinessEntityID  p.BusinessEntityID  --FALTA IGUALACION
WHERE HireDate < 2019
GO  

UPDATE Sales.SalesPerson  
SET Bonus = , CommissionPct = 0.10 --ERROR NO TIENE VALOR BONUS
WHERE SalesQuota = NULL; 

DROP INDEX table_name.index_name; 	--Falta on
GO

