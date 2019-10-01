CREATE table personal(
id_personal int identity(1,1)  primary key,
nombre varchar(200),
genero varchar(1),
nacimiento date,
apellido varchar(20),
id_area int not null,
id_horario int not null,
CONSTRAINT FK_id_area foreign key (id_area) references area(id_area),
constraint FK_id_horario foreign key (id_horario) references horario(id_horario),
constraint CK_id_area unique(id_area,id_personal),
constraint CK_genero check(genero='M'or genero='F')
);
ALTER TABLE Person.pepe   
ADD CONSTRAINT AK_Password UNIQUE (PasswordHash, PasswordSalt);
GO
ALTER TABLE sales.quotations 
    ADD 
        amount DECIMAL (10, 2) NOT NULL,
        customer_name VARCHAR (50) NOT NULL;
        GO
		TRUNCATE TABLE PartitionTable1;
GO
DROP INDEX IF EXISTS [ix_cust_email]
ON sales.customers;
GO