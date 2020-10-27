
-------------------------------------------------------------
-------------------------------------------------------------
--EXPERIMENT 15--
--Creation of Triggers and Cursors--


CREATE TABLE `customer_audit` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Customer_id` INT NOT NULL,
  `Name` varchar(45) NOT NULL,
  `Address` varchar(45) NOT NULL,
  changedat DATETIME DEFAULT NULL,
  PRIMARY KEY (`id`),
  action VARCHAR(20) DEFAULT NULL
) ;

CREATE TRIGGER before_customer_update 
    BEFORE UPDATE ON customer
    FOR EACH ROW 
 INSERT INTO customer_audit
 SET action = 'update',
     Customer_id = Customer_id,
     Name = OLD.Name,
     Address = OLD.Address,
     changedat = NOW();

SHOW TRIGGERS;

UPDATE customer 
SET 
    Name = 'Josie Parker'
WHERE
    Customer_id = 0;

SELECT * FROM employees_audit;

CREATE TABLE billings (
    billingNo INT AUTO_INCREMENT,
    customerNo INT,
    billingDate DATE,
    amount DEC(10 , 2 ),
    PRIMARY KEY (billingNo)
);

DELIMITER $$
CREATE TRIGGER before_billing_update
    BEFORE UPDATE 
    ON billings FOR EACH ROW
BEGIN
    IF new.amount > old.amount * 10 THEN
        SIGNAL SQLSTATE '45000' 
            SET MESSAGE_TEXT = 'New amount cannot be 10 times greater than the current amount.';
    END IF;
END$$    
DELIMITER ;


SHOW TRIGGERS;

DROP TRIGGER before_billing_update;

SHOW TRIGGERS;

DROP TABLE IF EXISTS Sales;

CREATE TABLE Sales (
    id INT AUTO_INCREMENT,
    product VARCHAR(100) NOT NULL,
    quantity INT NOT NULL DEFAULT 0,
    fiscalYear SMALLINT NOT NULL,
    fiscalMonth TINYINT NOT NULL,
    CHECK(fiscalMonth >= 1 AND fiscalMonth <= 12),
    CHECK(fiscalYear BETWEEN 2000 and 2050),
    CHECK (quantity >=0),
    UNIQUE(product, fiscalYear, fiscalMonth),
    PRIMARY KEY(id)
);

INSERT INTO Sales(product, quantity, fiscalYear, fiscalMonth)
VALUES
    ('2001 Ferrari Enzo',140, 2021,1),
    ('1998 Chrysler Plymouth Prowler', 110,2021,1),
    ('1913 Ford Model T Speedster', 120,2021,1);

SELECT * FROM Sales;

DROP TABLE IF EXISTS SalesChanges;

CREATE TABLE SalesChanges (
    id INT AUTO_INCREMENT PRIMARY KEY,
    salesId INT,
    beforeQuantity INT,
    afterQuantity INT,
    changedAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);
DELIMITER $$

CREATE TRIGGER after_sales_update
AFTER UPDATE
ON sales FOR EACH ROW
BEGIN
    IF OLD.quantity <> new.quantity THEN
        INSERT INTO SalesChanges(salesId,beforeQuantity, afterQuantity)
        VALUES(old.id, old.quantity, new.quantity);
    END IF;
END$$

DELIMITER ;

UPDATE Sales 
SET quantity = 350
WHERE id = 1;

SELECT * FROM SalesChanges;

UPDATE Sales 
SET quantity = CAST(quantity * 1.1 AS UNSIGNED);

---------------------------------------------------------
-----CURSORS-------

DELIMITER $$
CREATE PROCEDURE createAddressList (
	INOUT AddressList varchar(4000)
)
BEGIN
	DECLARE finished INTEGER DEFAULT 0;
	DECLARE Address varchar(100) DEFAULT "";

	-- declare cursor for customer Address--
	DEClARE curAddress
		CURSOR FOR 
			SELECT Address FROM customer;

	-- declare NOT FOUND handler
	DECLARE CONTINUE HANDLER 
        FOR NOT FOUND SET finished = 1;

	OPEN curAddress;

	getAddress: LOOP
		FETCH curAddress INTO Address;
		IF finished = 1 THEN 
			LEAVE getAddress;
		END IF;
		-- build Address list
		SET AddressList = CONCAT(Address,";",AddressList);
	END LOOP getAddress;
	CLOSE curAddress;

END$$
DELIMITER ;

SET @AddressList = ""; 
CALL createAddressList(@AddressList); 
SELECT @AddresslList;