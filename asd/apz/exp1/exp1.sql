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
  `FEmployee_id` int NOT NULL ,
  PRIMARY KEY (`Customer_id`),
  FOREIGN KEY (FEmployee_id) REFERENCES demployee(Employee_id)
) ;

CREATE TABLE `orders` (
  `OrderNumber` int NOT NULL,
  `OrderDate` date NOT NULL,
  `Quantity` varchar(45) NOT NULL,
  `Customer_id` int NOT NULL,
  `ProductCode` int NOT NULL,
  `Employee_id` int NOT NULL,
  PRIMARY KEY (`OrderNumber`),
  FOREIGN KEY (OCustomer_id) REFERENCES Customer(Customer_id),
  FOREIGN KEY (OProductCode) REFERENCES products(ProductCode),
  FOREIGN KEY (OEmployee_id) REFERENCES demployee(Employee_id)
);

CREATE TABLE Occasion
(
  `OccasionCode` int NOT NULL,
  `Description` varchar(45) NOT NULL,
  PRIMARY KEY (OccasionCode)
);


