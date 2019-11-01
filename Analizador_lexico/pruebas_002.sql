/*SIN ERRORES*/
ALTER VIEW HumanResources.EmployeeHireDate  
AS  
SELECT p.FirstName, p.LastName, e.HireDate  
FROM HumanResources.Employee AS e JOIN Person.Person AS p  
ON e.BusinessEntityID = p.BusinessEntityID  
WHERE HireDate < 2
GO 

ALTER VIEW 
vista_usuarios AS 
SELECT * FROM usuarios WHERE edad < 30;

ALTER VIEW MyView AS SELECT TableCol1 AS ViewCol1,
     TableCol2 AS ViewCol2,
     TableCol3 AS ViewCol3
     FROM MyTable;


ALTER DATABASE testDB
COLLATE French_CI_AI
GO

ALTER USER Mary51;

DROP DATABASE [LineaDiamante]
GO

DROP TABLE AdventureWorks2012.dbo.SalesPerson2 ;

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



SELECT p.Name AS ProductName 
FROM Production.Product AS p 
INNER JOIN Sales.SalesOrderDetail AS sod
ON p.ProductID = sod.ProductID 
ORDER BY ProductName DESC;


CREATE TABLE LICENCIA
(
	id_licencia INT IDENTITY(1,1),
	tipo INT NOT NULL,
	nombre VARCHAR(30) NOT NULL,
	apellido VARCHAR(30) NOT NULL,
	no_licencia VARCHAR(13) NOT NULL,
	fecha_nac DATE NOT NULL,
	fecha_venc DATE NOT NULL,
	CONSTRAINT pk_idLicencia PRIMARY KEY (id_licencia),
	CONSTRAINT fk_idTipo FOREIGN KEY (tipo) REFERENCES TIPO_LICENCIA(id_tipo),
	CONSTRAINT ck_NoLicencia CHECK( no_licencia = 13 AND tipo = 1),
	CONSTRAINT uk_NoLicencia UNIQUE(no_licencia)
);


CREATE TABLE dbo.Employee (EmployeeID INT
PRIMARY KEY CLUSTERED);

CREATE VIEW HumanResources.EmployeeHireDate  
AS  
SELECT p.FirstName, p.LastName, e.HireDate  
FROM HumanResources.Employee AS e JOIN Person.Person AS  p  
ON e.BusinessEntityID = p.BusinessEntityID ;  


CREATE NONCLUSTERED INDEX IX_TransactionHistory_ReferenceOrderID
ON Production.TransactionHistory (ReferenceOrderID)
GO

ALTER TABLE dbo.doc_exc ADD column_b VARCHAR(20) NULL,
CONSTRAINT exb_unique UNIQUE;


ALTER TABLE Production.TransactionHistoryArchive
ADD CONSTRAINT PK_TransactionHistoryArchive_TransactionID
PRIMARY  KEY CLUSTERED (TransactionID);




ALTER TABLE dbo.doc_exb DROP COLUMN column_b;

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

/*ERRORES*/
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

CREATE NONCLUSTERED INDEX IX_Address_PostalCode
Person.Address (PostalCode) --FALTA ON
INCLUDE (AddressLine1, AddressLine2, City, StateProvinceID);



ALTER VIEW HumanResources.EmployeeHireDate  
AS  
SELECT p.FirstName, p.LastName, e.HireDate  
FROM HumanResources.Employee AS e JOIN Person.Person AS p  
ON e.BusinessEntityID  p.BusinessEntityID  --FALTA IGUALACION
WHERE HireDate < 2019
GO  

UPDATE Sales.SalesPerson  
SET Bonus = , CommissionPct = 0.10 --ERROR NO TIENE VALOR BONUS
WHERE SalesQuota = NULL; 


DROP DATABASE 
GO  --ERROR FALTA NOMBRE DE LA BASE



ALTER TABLE HumanResources.Employee DROP CONSTRAINT  EXISTS GOLA --SE ESPERA INDENTIFICADOR O IF
GO



ALTER  TABLE  DROP CONSTRAINT [CK__InformeVi__Pasaj__6D0D32F4] --ERROR FALTA IDENTIFICADOR DE TABLA
GO


CREATE NONCLUSTERED INDEX "FIBillOfMaterialsWithEndDate"	--Se esperaba un ID
ON Production.BillOfMaterials (ComponentID, StartDate)
WHERE EndDate IS NOT NULL;


DELETE TOP (1) FROM AdventureWorks2017.HumanResources.Employee FROM AdventureWorks2017.HumanResources.Employee, Production.Product --Dos veces from
WHERE Employee.BusinessEntityID LIKE 'S%'
GO
