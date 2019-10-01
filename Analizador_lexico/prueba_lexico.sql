ALTER TABLE dbo.dsa
ADD dasd NUMERIC(15,15);
GO
ALTER DATABASE dbo
MODIFY NAME = nuevo;
GO
ALTER TABLE Persons
ADD  CHECK (Age>=18 AND nombre LIKE 'ASD'); 
GO
ALTER TABLE Person.pepe   
ADD CONSTRAINT AK_Password UNIQUE (PasswordHash, PasswordSalt);
GO
ALTER INDEX idxcci_cci_target ON cci_target REBUILD;
GO

ALTER TABLE sales.quotations 
    ADD 
        amount DECIMAL (10, 2) NOT NULL,
        customer_name VARCHAR (50) NOT NULL;
        GO