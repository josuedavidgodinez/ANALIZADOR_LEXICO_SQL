CREATE DATABASE Testdb;
GO


CREATE TABLE suppliers 
( supplier_id INT NOT NULL,
  supplier_name CHAR(50) NOT NULL,
  contact_name CHAR(50),
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
    FOREIGN KEY (store_id) REFERENCES sales.stores (store_id)
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

CREATE USER bobcontosocom FOR LOGIN bobcontosoom;
GO