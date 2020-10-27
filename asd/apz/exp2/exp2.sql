
--INSERTING DELIVERY EMPLOYEE DETAILS --

INSERT INTO demployee(Name,Address)
VALUES ('Anagha C H' , 'ABC House PQR Road California');
INSERT INTO demployee(Name,Address)
VALUES ('Enzo St John' , 'ABC House PQR Road California');
INSERT INTO demployee(Name,Address)
VALUES ('Bonnie Benette' , 'DEF House GHJ Road London');
INSERT INTO demployee(Name,Address)
VALUES ('Caroline Forbes' , 'HIJ House GHK Road Newyork');
INSERT INTO demployee(Name,Address)
VALUES ('Matt Donovan' , 'LMN House SRF Road Denmark');
INSERT INTO demployee(Name,Address)
VALUES ('Damon Salvatore' , 'GKI House GFJ Road California');
INSERT INTO demployee(Name,Address)
VALUES ('Elena Gilbert' , 'CJH House FDT Road California');
INSERT INTO demployee(Name,Address)
VALUES ('Vicki Donovan' , 'LMN House SRF Road Denmark');
INSERT INTO demployee(Name,Address)
VALUES ('Elizabeth Forbes' ,' HIJ House GHK Road Newyork');
INSERT INTO demployee(Name,Address)
VALUES ('Lexi Branson' , 'SGD House NJI Road USA');

--INSERTING PRODUCT DETAILS--
INSERT INTO products(UnitPrice,Description)
VALUES ('$12' , 'Roses');
INSERT INTO products(UnitPrice,Description)
VALUES ('$15' , 'Tulips');
INSERT INTO products(UnitPrice,Description)
VALUES ('$18' , 'Lilly');
INSERT INTO products(UnitPrice,Description)
VALUES ('$20' , 'Orchids');
INSERT INTO products(UnitPrice,Description)
VALUES ('$19' , 'Petunia');
INSERT INTO products(UnitPrice,Description)
VALUES ('$13' , 'Dianthus');
INSERT INTO products(UnitPrice,Description)
VALUES ('$14' , 'Daisies');
INSERT INTO products(UnitPrice,Description)
VALUES ('$17' , 'Aster');
INSERT INTO products(UnitPrice,Description)
VALUES ('$11' , 'Carnation');
INSERT INTO products(UnitPrice,Description)
VALUES ('$10' , 'Dahlia');

--INSERTING CUSTOMER DETAILS--

INSERT INTO customer(Name,Address,CEmployee_id)
VALUES ('Malachai Parker' , 'SFU Villa SGO Road ' , 1);
INSERT INTO customer(Name,Address,CEmployee_id)
VALUES ('Katherine Pierce' , 'AKG Villa WHJ Road ' , 5);
INSERT INTO customer(Name,Address,CEmployee_id)
VALUES ('Nadia Pierce' , 'AJN Villa ZRH Road ' , 6);
INSERT INTO customer(Name,Address,CEmployee_id)
VALUES ('Josette Parker' , 'ZTN Villa BIM Road ' , 9);
INSERT INTO customer(Name,Address,CEmployee_id)
VALUES ('Cade' , 'ZHN Villa ZYN Road ' , 3);
INSERT INTO customer(Name,Address,CEmployee_id)
VALUES ('Aurora de martel' , 'BJL Villa CJO Road ' , 2);

--INSERTING OCCASION DETAILS--
INSERT INTO occasion(OccasionCode,Description)
VALUES (101 , 'Wedding');
INSERT INTO occasion(OccasionCode,Description)
VALUES (102 , 'Betrothal');
INSERT INTO occasion(OccasionCode,Description)
VALUES (103 , 'Funeral');
INSERT INTO occasion(OccasionCode,Description)
VALUES (104 , 'Baptism');
INSERT INTO occasion(OccasionCode,Description)
VALUES (105 , 'Birthday');
INSERT INTO occasion(OccasionCode,Description)
VALUES (106 , 'Mehndi');
INSERT INTO occasion(OccasionCode,Description)
VALUES (107 , 'Haldi');

--INSERTING ORDER DETAILS--
INSERT INTO orders(OrderNumber,OrderDate,Quantity,OCustomer_id,OEmployee_id,OProductCode)
VALUES (1001 , '12/08/20' , '14-20' , 4, 5 , 6);
INSERT INTO orders(OrderNumber,OrderDate,Quantity,OCustomer_id,OEmployee_id,OProductCode)
VALUES (1002 , '13/08/20' , '14-20' , 5,2,3);
INSERT INTO orders(OrderNumber,OrderDate,Quantity,OCustomer_id,OEmployee_id,OProductCode)
VALUES (1003 , '16/08/20' , '14-20' ,6,9,5);
INSERT INTO orders(OrderNumber,OrderDate,Quantity,OCustomer_id,OEmployee_id,OProductCode)
VALUES (1004 , '14/08/20' , '14-20' , 2,8,3);
INSERT INTO orders(OrderNumber,OrderDate,Quantity,OCustomer_id,OEmployee_id,OProductCode)
VALUES (1005 , '15/08/20' , '14-20' ,2,7,3);
INSERT INTO orders(OrderNumber,OrderDate,Quantity,OCustomer_id,OEmployee_id,OProductCode)
VALUES (1006 , '18/08/20' , '14-20' ,2,7,5);
INSERT INTO orders(OrderNumber,OrderDate,Quantity,OCustomer_id,OEmployee_id,OProductCode)
VALUES (1007 , '17/08/20' , '14-20' , 4,6,2);



--UPDATING OPERATIONS--
UPDATE demployee
SET Name = 'Stefan Salvatore', Address= 'GKI House GFJ Road California'
WHERE Employee_id = 1;

UPDATE products
SET UnitPrice = '$20', Description= 'Lavender'
WHERE Productcode = 5;


--DELETING OPERATIONS--
DELETE FROM occasion
WHERE OccasionCode=107;

DELETE FROM orders
WHERE OrderNumber=1001;

--ALTER AND MODIFY OPERATIONS--
ALTER TABLE customer 
ADD `payment satus` VARCHAR (255) NOT NULL;
ALTER TABLE occasion 
ADD `place` VARCHAR (255) NOT NULL;

ALTER TABLE customer
DROP COLUMN `payment satus`;
ALTER TABLE occasion
DROP COLUMN `place`;

ALTER TABLE orders
MODIFY OrderDate DATETIME;
ALTER TABLE orders
MODIFY Quantity VARCHAR(225);