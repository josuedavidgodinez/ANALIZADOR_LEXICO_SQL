SELECT AdventureWorks2017.HumanResources.EmployeePayHistory FROM HumanResources.EmployeePayHistory;
GO
SELECT DISTINCT
    phone
FROM
    sales.customers;
    GO
	
SELECT
    *
FROM
    sales.customers;
    GO

    SELECT
    city,
    COUNT (*)
FROM
    sales.customers;
    GO

    SELECT shi, ProductNumber, ListPrice AS Price
FROM Production.Product;
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
NonDiscountSales = (OrderQty * UnitPrice),
Discounts = ((OrderQty * UnitPrice) * UnitPriceDiscount)
FROM Production.Product AS p;
GO

