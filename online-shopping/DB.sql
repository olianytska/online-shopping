CREATE DATABASE OnlineShopping
GO

USE OnlineShopping
GO

CREATE TABLE Client (
	IdClient INT PRIMARY KEY IDENTITY,
    ClientLogin NCHAR (15) NULL,
    ClientPassword NCHAR (15) NULL,
    Name NCHAR (25) NULL,
    Surname NCHAR (30) NULL,
    Phone NCHAR (10) NULL,
    Email NCHAR (30) NULL
)
GO

CREATE TABLE Position (
    IdPosition INT PRIMARY KEY IDENTITY,
    Name NCHAR (25) NOT NULL
)
GO

CREATE TABLE Worker (
    IdWorker INT PRIMARY KEY IDENTITY,
    WorkerLogin NCHAR (10) NOT NULL,
    WorkerPassword NCHAR (10) NOT NULL,
    Name NCHAR (25) NULL,
    Surname NCHAR (25) NULL,
    IdPosition INT NOT NULL,
    FOREIGN KEY (IdPosition) REFERENCES Position (IdPosition)
		ON DELETE CASCADE
		ON UPDATE CASCADE
)
GO

CREATE TABLE Product_Category (
    IdCategory INT PRIMARY KEY IDENTITY,
    Name NCHAR (25) NOT NULL
)
GO

CREATE TABLE Product (
    IdProduct INT PRIMARY KEY IDENTITY,
    IdOrder INT NOT NULL,
    Name NCHAR (50) NOT NULL,
    Price MONEY NOT NULL,
    IdCategory INT NOT NULL,
    ProductDescription TEXT NULL,
    IdStorage INT NOT NULL,
    FOREIGN KEY (IdCategory) REFERENCES Product_Category (IdCategory)
		ON DELETE CASCADE
		ON UPDATE CASCADE
)
GO

CREATE TABLE Payment_Status (
    IdStatus INT PRIMARY KEY IDENTITY,
    Name NCHAR (25) NOT NULL
)
GO

CREATE TABLE Payment_Type (
    IdType INT PRIMARY KEY IDENTITY,
    Name NCHAR (25) NOT NULL
)
GO

CREATE TABLE Payment (
    IdPayment INT PRIMARY KEY IDENTITY,
    IdStatus INT NOT NULL,
    IdType INT NOT NULL,
    Summa MONEY NOT NULL,
    FOREIGN KEY (IdStatus) REFERENCES Payment_Status (IdStatus)
		ON DELETE CASCADE
		ON UPDATE CASCADE,
    FOREIGN KEY (IdType) REFERENCES Payment_Type (IdType)
		ON DELETE CASCADE
		ON UPDATE CASCADE
)
GO

CREATE TABLE Order_Status (
    IdStatus INT PRIMARY KEY IDENTITY,
    Name NCHAR (20) NOT NULL
)
GO

CREATE TABLE Shipping (
    IdShipping INT PRIMARY KEY IDENTITY,
    Country NCHAR (25) NOT NULL,
    City NCHAR (25) NOT NULL,
    Street NCHAR (30) NULL,
    StreetNumber INT NULL,
    Appartement NCHAR (10) NULL,
    ShippingIndex INT NOT NULL
)
GO

CREATE TABLE Orders (
	IdOrder INT PRIMARY KEY IDENTITY,
    IdWorker INT  NOT NULL,
    IdShipping INT  NOT NULL,
    TimeSend DATE NULL,
    TimeObtain DATE NULL,
    IdStatus INT  NOT NULL,
    IdProduct INT  NOT NULL,
    IdPayment INT  NOT NULL,
    IdClient INT  NOT NULL,
    FOREIGN KEY (IdWorker) REFERENCES Worker (IdWorker)
		ON DELETE CASCADE
		ON UPDATE CASCADE,
    FOREIGN KEY (IdShipping) REFERENCES Shipping (IdShipping)
		ON DELETE CASCADE
		ON UPDATE CASCADE,
    FOREIGN KEY (IdStatus) REFERENCES Order_Status (IdStatus)
		ON DELETE CASCADE
		ON UPDATE CASCADE,
    FOREIGN KEY (IdPayment) REFERENCES Payment (IdPayment)
		ON DELETE CASCADE
		ON UPDATE CASCADE,
    FOREIGN KEY (IdClient) REFERENCES Client (IdClient)
		ON DELETE CASCADE
		ON UPDATE CASCADE
)
GO

CREATE TABLE Storage (
    IdStorage INT PRIMARY KEY IDENTITY,
    IdProduct INT NOT NULL,
    IdWorker INT NOT NULL,
    Name NCHAR (25) NOT NULL,
    FOREIGN KEY (IdWorker) REFERENCES Worker (IdWorker)
		ON DELETE CASCADE
		ON UPDATE CASCADE
)
GO

CREATE TABLE Order_Product (
    IdOrder INT NOT NULL,
    IdProduct INT NOT NULL,
    UNIQUE NONCLUSTERED (IdOrder ASC, IdProduct ASC),
    FOREIGN KEY (IdOrder) REFERENCES Orders (IdOrder),
    FOREIGN KEY (IdProduct) REFERENCES Product (IdProduct)
)
GO

CREATE TABLE Storage_Product (
    IdStorage INT NOT NULL,
    IdProduct INT NOT NULL,
    UNIQUE NONCLUSTERED (IdStorage ASC, IdProduct ASC),
    FOREIGN KEY (IdStorage) REFERENCES Storage (IdStorage),
    FOREIGN KEY (IdProduct) REFERENCES Product (IdProduct)
)
GO

CREATE TABLE ContactUs (
	IdContact INT PRIMARY KEY IDENTITY,
	Name NCHAR (25) NOT NULL,
	Surname NCHAR (25) NOT NULL,
	Phone NCHAR (10) NOT NULL,
	Country NCHAR (20) NOT NULL
)
GO