--EXPERIMENT 4--
--CONSTRAINTS--



CREATE TABLE `products` (
  `Productcode` int NOT NULL AUTO_INCREMENT,
  `UnitPrice` varchar(45) NOT NULL,
  `Description` varchar(45) NOT NULL,
  PRIMARY KEY (`Productcode`)
) ;


CREATE TABLE `demployee` (
  `Employee_id` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(45) NOT NULL,
  `Address` varchar(45) NOT NULL,
  PRIMARY KEY (`Employee_id`)
) ;


CREATE TABLE `customer` (
  `Customer_id` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(45) NOT NULL,
  `Address` varchar(45) NOT NULL,
  `CEmployee_id` int NOT NULL ,
  PRIMARY KEY (`Customer_id`),
  FOREIGN KEY (CEmployee_id) REFERENCES demployee(Employee_id)
) ;

CREATE TABLE `orders` (
  `OrderNumber` int NOT NULL,
  `OrderDate` date NOT NULL,
  `Quantity` varchar(45) NOT NULL,
  `OCustomer_id` int NOT NULL,
  `OProductCode` int NOT NULL,
  `OEmployee_id` int NOT NULL,
  PRIMARY KEY (`OrderNumber`),
  FOREIGN KEY (OCustomer_id) REFERENCES Customer(Customer_id),
  FOREIGN KEY (OProductCode) REFERENCES products(ProductCode),
  FOREIGN KEY (OEmployee_id) REFERENCES demployee(Employee_id)
);

--relation table used_for--

CREATE TABLE used_for
(
  `ProductCode` int NOT NULL,
  `OccasionCode` int NOT NULL,
  PRIMARY KEY (ProductCode, OccasionCode),
  FOREIGN KEY (ProductCode) REFERENCES Products(ProductCode),
  FOREIGN KEY (OccasionCode) REFERENCES Occasion(OccasionCode)
);

CREATE TABLE Occasion
(
  `OccasionCode` int NOT NULL,
  `Description` varchar(45) NOT NULL,
  PRIMARY KEY (OccasionCode)
);

