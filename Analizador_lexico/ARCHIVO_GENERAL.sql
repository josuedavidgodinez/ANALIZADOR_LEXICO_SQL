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
GO   

CREATE USER bobcontosocom FOR LOGIN bobcontosocom;
GO

CREATE VIEW HumanResources.EmployeeHireDate  
AS  
SELECT p.FirstName, p.LastName, e.HireDate  
FROM HumanResources.Employee AS e JOIN Person.Person AS  p  
ON e.BusinessEntityID = p.BusinessEntityID ;  
GO  


INSERT INTO Customers (CustomerName, ContactName, Address, City, PostalCode, Country)
VALUES ('Cardinal', 'Tom B. Erichsen', 'Skagen 21', 'Stavanger', '4006', 'Norway');
GO

INSERT dbo.Products (ProductName, ProductID, Price, ProductDescription)  
    VALUES ('Screwdriver', 50, 3.17, 'Flat head');  
GO  

INSERT dbo.Products  
    VALUES (75, 'Tire Bar', NULL, 'Tool for changing tires.');  
GO  

INSERT Products (ProductID, ProductName, Price)  
    VALUES (3000, '3mm Bracket', 0.52);  
GO 

INSERT INTO T1 (dlka,asdkjadh,dasjdh,kjdasdh) DEFAULT VALUES;   
GO 

ALTER TABLE dbo.dsa
ADD dasd NUMERIC(15,15);
GO
ALTER DATABASE dbo
MODIFY NAME = nuevo;
GO
ALTER TABLE Persons
ADD  CHECK (Age>=18 AND nombre LIKE 'ASD'); 
GO
ALTER TABLE Person.Password   
ADD CONSTRAINT AK_Password UNIQUE (PasswordHash, PasswordSalt);
GO
ALTER INDEX idxcci_cci_target ON cci_target REBUILD;
GO

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

DROP INDEX table_name.index_name; 
GO

  
DROP INDEX IF EXISTS ix_cust_email
ON sales.customers;
GO


DROP DATABASE Sales, NewSales;
GO

DROP DATABASE sales_snapshot0600;
GO

DELETE FROM employees
WHERE last_name = 'Johnson'
AND employee_id >= 80;
GO

DELETE TOP(3)
FROM employees
WHERE last_name = 'Johnson';
GO

DELETE TOP 10 PERCENT FROM target_table;
GO

DELETE FROM employees
WHERE last_name = 'Johnson'
AND employee_id >= 80;
GO

DELETE TOP(3)
FROM employees
WHERE last_name = 'Johnson';
GO

DELETE TOP 10 PERCENT FROM target_table;
GO

UPDATE Production.Product  
SET Color = 'Metallic Red'  
WHERE Name LIKE 'Road-250%' AND Color = 'Red';  
GO

UPDATE TOP (10) HumanResources.Employee
SET VacationHours = ((VacationHours * 1.25) + 5) , dasd = 'sdad',lksdja = 
5 +(sdad / 4)+2 
WHERE Name LIKE 'Road-250%' AND Color = 'Red'; 
GO  

UPDATE Production.Product  
SET Color = 'CHAPIN' ;
GO


UPDATE TOP 10 PERCENT HumanResources.Employee
SET VacationHours = ((VacationHours * 1.25) + 5) , dasd = 'sdad',lksdja = 
5 +(sdad / 4)+2 
WHERE Name LIKE 'Road-250%' AND Color = 'Red'; 
GO  

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

    SELECT Name, ProductNumber, ListPrice AS Price
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

 SELECT p.Name AS ProductName, 
NonDiscountSales = (OrderQty * UnitPrice),
Discounts = ((OrderQty * UnitPrice) * UnitPriceDiscount)
FROM Production.Product AS p;
GO

SELECT SalesOrderID, SUM(LineTotal) AS SubTotal
FROM Sales.SalesOrderDetail
GROUP BY SalesOrderID
ORDER BY SalesOrderID;
GO



SELECT ProductModelID, AVG(ListPrice) AS [AverageListPrice]
FROM Production.Product
WHERE ListPrice > $1000
GROUP BY ProductModelID
ORDER BY ProductModelID;
GO

SELECT ProductID 
FROM Sales.SalesOrderDetail
GROUP BY ProductID
HAVING AVG(OrderQty) > 5
ORDER BY ProductID;
GO

SELECT ProductID 
FROM Sales.SalesOrderDetail
WHERE UnitPrice < 25.00
GROUP BY ProductID
HAVING AVG(OrderQty) > 5
ORDER BY ProductID;
GO


SELECT ProductID, AVG(OrderQty) AS AverageQuantity, SUM(LineTotal) AS Total
FROM Sales.SalesOrderDetail
GROUP BY ProductID
HAVING SUM(LineTotal) > $1000000.00
AND AVG(OrderQty) < 3;
GO


SELECT
    city,
    COUNT (*)
FROM
    sales.customers
WHERE
    state = 'CA'
GROUP BY
    city
HAVING
    COUNT (*) > 10
ORDER BY
    city;
GO
    SELECT
    *
FROM
    sales.customers
WHERE
    state = 'CA'
ORDER BY
    first_name;
    GO

    SELECT Orders.OrderID, Customers.CustomerName, Orders.OrderDate
FROM Orders
INNER JOIN Customers ON Orders.CustomerID=Customers.CustomerID;
GO

SELECT Orders.OrderID, Customers.CustomerName
FROM Orders
INNER JOIN Customers ON Orders.CustomerID = Customers.CustomerID; 
GO

SELECT Customers.CustomerName, Orders.OrderID
FROM Customers
LEFT JOIN Orders ON Customers.CustomerID = Orders.CustomerID
ORDER BY Customers.CustomerName;
GO

SELECT Orders.OrderID, Employees.LastName, Employees.FirstName
FROM Orders
RIGHT JOIN Employees ON Orders.EmployeeID = Employees.EmployeeID
ORDER BY Orders.OrderID; 
GO

SELECT Customers.CustomerName, Orders.OrderID
FROM Customers
FULL OUTER JOIN Orders ON Customers.CustomerID=Orders.CustomerID
ORDER BY Customers.CustomerName;

GO

SELECT COUNT(CustomerID), Country
FROM Customers
GROUP BY Country
HAVING COUNT(CustomerID) > 5
ORDER BY COUNT(CustomerID) DESC;
GO

SELECT Employees.LastName, COUNT(Orders.OrderID) AS NumberOfOrders
FROM Orders
INNER JOIN Employees ON Orders.EmployeeID = Employees.EmployeeID
GROUP BY LastName
HAVING COUNT(Orders.OrderID) > 10;
GO

SELECT Employees.LastName, COUNT(Orders.OrderID) AS NumberOfOrders
FROM Orders
INNER JOIN Employees ON Orders.EmployeeID = Employees.EmployeeID
WHERE LastName = 'Davolio' OR LastName = 'Fuller'
GROUP BY LastName
HAVING COUNT(Orders.OrderID) > 25;
GO
SELECT COUNT(CustomerID), Country
FROM Customers
GROUP BY Country
HAVING CustomerID > 5
ORDER BY COUNT(CustomerID) DESC;
GO