--EXPERIMENT 7--
--VIEWS AND ASSERTIONS--

--VIEWS--

--CREATE VIEW --

CREATE VIEW `productmenu` AS
SELECT Description, UnitPrice
FROM products 
WHERE UnitPrice > "$15" ;

SELECT * FROM `productmenu`;

CREATE VIEW `customerorder` AS
SELECT customer.Customer_id,customer.Name,orders.OrderDate
FROM customer, orders 
WHERE customer.Customer_id = orders.OCustomer_id ;

SELECT * FROM `customerorder`;

CREATE VIEW `productcustomer` AS
SELECT products.Productcode,products.Description,customer.Customer_id , customer.Name
FROM products, customer
WHERE products.Productcode = customer.Customer_id ;

SELECT * FROM `productcustomer`;

--DELETE VIEW--
DROP VIEW `customerorder` ;

--UPDATING VIEW--

CREATE OR REPLACE VIEW `productcustomer` AS
SELECT products.Productcode,products.Description,customer.Customer_id , customer.Name , customer.Address
FROM products, customer
WHERE products.Productcode = customer.Customer_id;

SELECT * FROM `productcustomer`;

--INSERTING ROW INTO VIEW--
INSERT INTO `productmenu`(Description,UnitPrice) 
VALUES("Lilly","Malachai Parker");
INSERT INTO `productmenu`(Description,UnitPrice) 
VALUES("Roses","$28");
INSERT INTO `productmenu`(Description,UnitPrice) 
VALUES("Dianthus","$25");

--DELETE ROW FROM VIEW--

DELETE FROM `productmenu`
WHERE UnitPrice = "Malachai Parker";

