--   MESS MARKING SYSTEM    
--EXPERIMENT 13

-- * Creation of Procedures and Functions


USE `mess`;

-- creating procedure
delimiter //
 CREATE PROCEDURE typecount(IN _time VARCHAR(20), OUT cnt INT)
       BEGIN
         SELECT COUNT(*) INTO cnt FROM meals
         WHERE _time = meals.time;
       END//
       
-- calling procedure
CALL typecount('morning', @cnt);
SELECT @cnt;



-- creating function
CREATE FUNCTION getoffer(
	price int
) 
RETURNS VARCHAR(20)
DETERMINISTIC
BEGIN
    DECLARE offer VARCHAR(20);
     IF price <= 500 THEN
        SET offer = '5%';
    ELSEIF price <= 1000 THEN
        SET offer = '10%';
	ELSEIF price <= 2000 THEN
        SET offer = '20%';
    ELSE
        SET offer = '30%';
    END IF;
	RETURN (offer);
END$$
DELIMITER ;

SHOW FUNCTION STATUS 
WHERE db = 'mess';

-- calling function
SELECT 
    bill_id, 
    getoffer(amount)
FROM
    bills;
