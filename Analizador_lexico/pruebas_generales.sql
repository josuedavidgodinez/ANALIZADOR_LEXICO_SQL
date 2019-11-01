BEGIN TRANSACTION;
UPDATE Production.Product  
SET Color = 'Metallic Red'  
WHERE Name LIKE 'Road-250%' AND Color = 'Red';  


UPDATE TOP (10) HumanResources.Employee
SET VacationHours = ((VacationHours * 1.25) + 5) , dasd = 'sdad',lksdja = 
5 +(sdad / 4)+2 
WHERE Name LIKE 'Road-250%' AND Color = 'Red'; 

INSERT INTO Customers (CustomerName, ContactName, Address, City, PostalCode, Country)
VALUES ('Cardinal', 'Tom B. Erichsen', 'Skagen 21', 'Stavanger', '4006', 'Norway');



UPDATE Production.Product  
SET Color = 'CHAPIN' GO

DROP TABLE IF EXISTS dbo.Product,asdad;

DROP INDEX index_name ON table_name,sdakdja ON table_name; 

DROP INDEX ON table_name.index_name; --FALTA EL NOMBRE DEL INDEX

	
DROP INDEX IF EXISTS ix_cust_email
ON sales.customers;


SELECT SalesOrderID, SUM(LineTotal) AS SubTotal
FROM Sales.SalesOrderDetail
GROUP BY SalesOrderID
ORDER BY SalesOrderID;

COMMIT;

SELECT ProductModelID, AVG(ListPrice) AS [AverageListPrice]
FROM Production.Product
WHERE ListPrice > $1000
GROUP BY ProductModelID
ORDER BY ProductModelID;


SELECT ProductID 
FROM Sales.SalesOrderDetail
GROUP BY ProductID
HAVING AVG(OrderQty) > 5
ORDER BY ProductID;


SELECT ProductID 
FROM Sales.SalesOrderDetail
WHERE UnitPrice < 25.00
GROUP BY ProductID
HAVING AVG(OrderQty) > 5
ORDER BY ProductID;



SELECT ProductID, AVG(OrderQty) AS AverageQuantity, SUM(LineTotal) AS Total
FROM Sales.SalesOrderDetail
GROUP BY ProductID
HAVING SUM(LineTotal) > $1000000.00
AND AVG(OrderQty) < 3;

TRUNCATE TABLE HumanResources.JobCandidate;  


TRUNCATE TABLE PartitionTable1;


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

    SELECT
    *
FROM
    sales.customers
WHERE
    state = 'CA'
ORDER BY
    first_name;
    

    SELECT Orders.OrderID, Customers.CustomerName, Orders.OrderDate
FROM Orders
INNER JOIN Customers ON Orders.CustomerID=Customers.CustomerID;


SELECT Orders.OrderID, Customers.CustomerName
FROM Orders
INNER JOIN Customers ON Orders.CustomerID = Customers.CustomerID; 


SELECT Customers.CustomerName, Orders.OrderID
FROM Customers
LEFT JOIN Orders ON Customers.CustomerID = Orders.CustomerID
ORDER BY Customers.CustomerName;


SELECT Orders.OrderID, Employees.LastName, Employees.FirstName
FROM Orders
RIGHT JOIN Employees ON Orders.EmployeeID = Employees.EmployeeID
ORDER BY Orders.OrderID; 


SELECT Customers.CustomerName, Orders.OrderID
FROM Customers
FULL OUTER JOIN Orders ON Customers.CustomerID=Orders.CustomerID
ORDER BY Customers.CustomerName;




DROP DATABASE Sales, NewSales;


DROP DATABASE sales_snapshot0600;



UPDATE TOP 10 PERCENT HumanResources.Employee
SET VacationHours = ((VacationHours * 1.25) + 5) , dasd = 'sdad',lksdja = 
5 +(sdad / 4)+2 
WHERE Name LIKE 'Road-250%' AND Color = 'Red'; 	


DELETE FROM employees
WHERE last_name = 'Johnson'
AND employee_id >= 80;

DELETE TOP(3)
lkads Employees			--FALTA EL FROM
WHERE last_name = 'Johnson';


DELETE TOP 10 PERCENT FROM target_table;


INSERT dbo.Products (ProductName, ProductID, Price, ProductDescription)  
    VALUES ('Screwdriver', 50, 3.17, 'Flat head');  


INSERT dbo.Products  
    VALUES (75, 'Tire Bar', NULL, 'Tool for changing tires.');  




SELECT COUNT(CustomerID), Country
FROM Customers
GROUP BY Country
HAVING COUNT(CustomerID) > 5
ORDER BY COUNT(CustomerID) DESC;


SELECT Employees.LastName, COUNT(Orders.OrderID) AS NumberOfOrders
FROM Orders
INNER JOIN Employees ON Orders.EmployeeID = Employees.EmployeeID
GROUP BY LastName
HAVING COUNT(Orders.OrderID) > 10;


SELECT Employees.LastName, COUNT(Orders.OrderID) AS NumberOfOrders
FROM Orders
INNER JOIN Employees ON Orders.EmployeeID = Employees.EmployeeID
WHERE LastName = 'Davolio' OR LastName = 'Fuller'
GROUP BY LastName
HAVING COUNT(Orders.OrderID) > 25;

SELECT COUNT(CustomerID), Country
FROM Customers
GROUP BY Country
HAVING CustomerID > 5
ORDER BY COUNT(CustomerID) DESC;


INSERT Products (ProductID, ProductName, Price)  
    VALUES (3000, '3mm Bracket', 0.52);  


INSERT INTO T1 (dlka,asdkjadh,dasjdh,kjdasdh) DEFAULT VALUES;   



	
CREATE FUNCTION sales.udfNetSale(
    @quantity INT,
    @list_price DECIMAL(10,2),
    @discount DECIMAL(4,2)
)
RETURNS DECIMAL(10,2)
AS 
BEGIN
    RETURN @quantity * @list_price * (1 - @discount);
END;


CREATE OR ALTER FUNCTION dbo.ufn_FindReports (@InEmpID INT)  
RETURNS @retFindReports TABLE   
(  
    EmployeeID INT PRIMARY KEY NOT NULL,  
    FirstName VARCHAR(255) NOT NULL,  
    LastName VARCHAR(255) NOT NULL,  
    JobTitle VARCHAR(50) NOT NULL,  
    RecursionLevel INT NOT NULL  
)  
--Returns a result set that lists all the employees who report to the   
--specific employee directly or indirectly.*/  
AS  
BEGIN  

        -- Get the initial list of Employees for Manager n
        SELECT e.BusinessEntityID, e.OrganizationNode, p.FirstName, p.LastName, e.JobTitle, 0   
        FROM HumanResources.Employee e   
INNER JOIN Person.Person p   
ON p.BusinessEntityID = e.BusinessEntityID;      
        -- Join recursive member to anchor
        SELECT e.BusinessEntityID, e.OrganizationNode, p.FirstName, p.LastName, e.JobTitle, RecursionLevel + 1   
        FROM HumanResources.Employee e   
            INNER JOIN EMP_cte  
            ON e.OrganizationNode.GetAncestor = EMP_cte.OrganizationNode  
INNER JOIN Person.Person p   
ON p.BusinessEntityID = e.BusinessEntityID ;
        
-- copy the required columns to the result of the function      
   RETURN  1;
END;  


CREATE FUNCTION Sales.ufn_SalesByStore (@storeid INT)  
RETURNS TABLE  
AS  
BEGIN
RETURN @storeid;
END
GO  

BEGIN TRANSACTION;  
DELETE FROM HumanResources.JobCandidate  
    WHERE JobCandidateID = 13;  
COMMIT;  

CREATE TABLE ValueTable (id INT);  
BEGIN TRANSACTION;  
       INSERT INTO ValueTable VALUES(1);  
       INSERT INTO ValueTable VALUES(2);  
 ROLLBACK;
CREATE PROCEDURE HumanResources.uspGetEmployeesTest2   
    @LastName VARCHAR(50),   
    @FirstName VARCHAR(50)   
AS   

    SET NOCOUNT ON;  
    SELECT FirstName, LastName, Department  
    FROM HumanResources.vEmployeeDepartmentHistory  
    WHERE FirstName = @FirstName AND LastName = @LastName  
    AND EndDate IS NULL;  
GO  


CREATE PROCEDURE SelectAllCustomers @City VARCHAR(30), @PostalCode VARCHAR(10)
AS
SELECT * FROM Customers WHERE City = @City AND PostalCode = @PostalCode;
GO


CREATE PROCEDURE FindSite
  @site_name VARCHAR(50) OUT

AS

BEGIN

   DECLARE @site_id INT;

   SET @site_id = 8;

   
      SET @site_name = 'TechOnTheNet.com';
   
      SET @site_name = 'CheckYourMath.com';

;

EXECUTE HumanResources.uspGetEmployeesTest2 'Ackerman', 'Pilar'; 
EXEC HumanResources.uspGetEmployeesTest2 @LastName = 'Ackerman', @FirstName = 'Pilar';  



DECLARE @TranName VARCHAR(20);  

  
BEGIN TRANSACTION @TranName;  

DELETE FROM AdventureWorks2012.HumanResources.JobCandidate  
    WHERE JobCandidateID = 13;  
  
COMMIT TRANSACTION @TranName;  



DECLARE product_cursor CURSOR FOR   
    SELECT v.Name  
    FROM Purchasing.ProductVendor pv, Production.Product v  
    WHERE pv.ProductID = v.ProductID AND  
    pv.VendorID = @vendor_id  -- Variable value from the outer cursor  
  
    OPEN product_cursor  
    FETCH NEXT FROM product_cursor INTO @product;


    DECLARE vend_cursor CURSOR  
    FOR SELECT * FROM Purchasing.Vendor  
OPEN vend_cursor  
FETCH NEXT FROM vend_cursor; 


SELECT Sales.ufn_SalesByStore(5) FROM dasda;

	
DROP FUNCTION sales.udfNetSale;

DROP PROCEDURE FindSite;