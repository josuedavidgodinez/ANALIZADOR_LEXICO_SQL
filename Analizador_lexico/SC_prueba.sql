ALTER VIEW HumanResources.EmployeeHireDate  
AS  
SELECT p.FirstName, p.LastName, e.HireDate  
FROM HumanResources.Employee AS e JOIN Person.Person AS p  
ON e.BusinessEntityID  p.BusinessEntityID  --FALTA IGUALACION
WHERE HireDate < 2019;  
GO  

SELECT p.Name AS ProductName 
FROM Production.Product AS p 
INNER JOIN Sales.SalesOrderDetail AS sod
ON p.ProductID = sod.ProductID 
ORDER BY ProductName DESC;

CREATE NONCLUSTERED INDEX IX_Address_PostalCode
Person.Address (PostalCode) --FALTA ON
INCLUDE (AddressLine1, AddressLine2, City, StateProvinceID);

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
ON TransactionsPS1 (TransactionDate);

ALTER TABLE dbo.doc_exc ADD column_b VARCHAR(20) NULL
CONSTRAINT exb_unique UNIQUE;

ALTER TABLE dbo.doc_exc ADD column_b VARCHAR(20) NULL
exb_unique UNIQUE; --FALTA PALABRA RESERVADA CONSTRAINT (ME PIDE PYC DESPUES DE NULL)


--NO DEBERIA MARCHAR ERROR PORQUE ID'S MUY GRANDES
ALTER TABLE Production.TransactionHistoryArchive
ADD CONSTRAINT PK_TransactionHistoryArchive_TransactionID PRIMARY  CLUSTERED (TransactionID); --FALTA KEY DESPUES DE PRIMARY

ALTER TABLE Production.TransactionHistoryArchive
ADD CONSTRAINT PK_TransactionHistoryArchive_TransactionID PRIMARY  KEY CLUSTERED (TransactionID);




ALTER TABLE dbo.doc_exb DROP COLUMN column_b;

ALTER TABLE dbo.doc_exc
DROP CONSTRAINT my_constraint, my_pk_constraint, COLUMN column_b ;
GO

ALTER TABLE dbo.doc_exa ADD column_b VARCHAR(20) NULL ;
GO


UPDATE Sales.SalesPerson  
SET Bonus = 6, CommissionPct = 0.10
WHERE SalesQuota = NULL;


UPDATE Sales.SalesPerson  
SET Bonus = , CommissionPct = 0.10 --ERROR NO TIENE VALOR BONUS
WHERE SalesQuota = NULL; 

DROP DATABASE [LineaDiamante]
GO

ALTER  TABLE [dbo].[InformeViajes] DROP CONSTRAINT [CK__InformeVi__Pasaj__6D0D32F4]
GO

DELETE TOP (1) FROM AdventureWorks2017.HumanResources.Employee FROM AdventureWorks2017.HumanResources.Employee, Production.Product 
WHERE Employee.BusinessEntityID LIKE 'S%'
GO

DROP DATABASE 
GO  --ERROR FALTA NOMBRE DE LA BASE

DROP USER IF EXISTS user_name
GO

ALTER TABLE HumanResources.Employee DROP CONSTRAINT  EXISTS GOLA; --SE ESPERA INDENTIFICADOR O IF
GO

ALTER DATABASE testDB
COLLATE French_CI_AI;

DELETE TOP (1) FROM AdventureWorks2017.HumanResources.Employee FROM AdventureWorks2017.HumanResources.Employee, Production.Product 
WHERE Employee.BusinessEntityID IN (1, 5, 8, 0);

ALTER  TABLE  DROP CONSTRAINT [CK__InformeVi__Pasaj__6D0D32F4] --ERROR FALTA IDENTIFICADOR DE TABLA
GO


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


