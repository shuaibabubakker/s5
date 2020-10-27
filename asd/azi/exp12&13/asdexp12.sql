USE boutique;

-- if
DELIMITER $$
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
WHERE db = 'boutique';

SELECT 
    sale_id, 
    getoffer(sale_amt)
FROM
    sales;




-- while
DELIMITER $$
CREATE FUNCTION smallamt(
	rps INT
)
RETURNS INT
DETERMINISTIC
BEGIN
	DECLARE sml INT;
    SET sml=1000;
    label1:WHILE rps < sml DO
        RETURN rps;
    END WHILE label1;
    RETURN 1;
END$$
DELIMITER ;

SELECT 
    smallamt(sale_amt)
FROM
    sales;




-- loop
DELIMITER //
CREATE FUNCTION target( amount INT )
RETURNS INT
DETERMINISTIC
BEGIN
   DECLARE amt INT;
   SET amt = 0;
   label1: REPEAT
     SET amt = amt + amount;
   UNTIL amt >= 5000 
   END REPEAT label1;
   RETURN 1;
END //
DELIMITER ;

SELECT 
    target(sum(sale_amt))
FROM
    sales;
