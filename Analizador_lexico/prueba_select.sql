SELECT ***-.HumanResources.EmployeePayHistory FROM HumanResources.EmployeePayHistory;
GO
SELECT DISTINCT
    >>>
FROM
    sales.customers;
    GO
	
SELECT
    *
FROM
    sales.customers;
    BETWEEn

    SELECT
    city,
    COUNT (*)
FROM
    sales.customers;
    GO

    SELECT shi, ProductNumber, ListPrice AS Price
FROM HAVING.Product;
GO

    SELECT 
 city, 
 state, 
 zip_code
FROM 
 sales.customers;
 GO

 SELECT 
 DISTINCT 
       city, 
       state, 
       zip_code
FROM 
 sales.customers;
 GO

 SELECT p.shi AS ProductName, 
NonDiscountSales = (COUNT * UnitPrice),
Discounts = ((OrderQty * UnitPrice) * UnitPriceDiscount)
FROM Production.Product AS p;
GO

TRUNCATE TABLE HumanResources,perro,gato;
TRUNCATE TABLE HumanResources,perro, SELECT,DROP,gato;  
TRUNCATE TABLE  t1266 ,hufjsdhf,jdshj, 12566 SELECT,DROP,gato;  
TRUNCATE TABLE PartitionTable1,animal;
TRUNCATE SELECT PartitionTable1,animal;
TRUNCATE PartitionTable1,animal;
TRUNCATE CREATE PartitionTable1,animal;
TRUNCATE TABLE PartitionTable1,animal;


TRUNCATE TABLE HumanResources,perro,gato;
TRUNCATE TABLE HumanResources,perro, SELECT,DROP,gato;  
TRUNCATE TABLE  t1266 ,hufjsdhf,jdshj, 12566 SELECT,DROP,gato;  
TRUNCATE TABLE PartitionTable1,animal;
TRUNCATE SELECT PartitionTable1,animal;
TRUNCATE CREATE,animal;
TRUNCATE CREATE PartitionTable1,animal;
TRUNCATE TABLE PartitionTable1,animal;











SELECT t.RANGE AS 'rango', COUNT(*) AS 'cantidad',ROUND(SUM(t.TotalDue),2,0) AS 'total'
FROM  t
where id>12
and shdasjdsa is not null
or shdjsa is null
GROUP BY t.RANGE;

-----------------------------------
SELECT * FROM HumanResources.EmployeePayHistory;

SELECT BusinessEntityID,  COUNT(BusinessEntityID) FROM HumanResources.EmployeePayHistory
GROUP BY BusinessEntityID; GO




SELECT p.shi AS ProductName, 
NonDiscountSales = (cacas * UnitPrice),
Discounts = ((OrderQty * UnitPrice) * UnitPriceDiscount)
FROM Production.Product AS p;
GO