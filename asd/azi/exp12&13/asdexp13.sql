USE boutique;

-- creating procedure
delimiter //
 CREATE PROCEDURE typecount(IN protype VARCHAR(20), OUT cnt INT)
       BEGIN
         SELECT COUNT(*) INTO cnt FROM products
         WHERE pro_type = protype;
       END//
       
-- calling procedure
CALL typecount('cotton', @cnt);
SELECT @cnt;


-- creating function
DELIMITER $$
CREATE FUNCTION saleLevel(
	purchase INT
) 
RETURNS VARCHAR(20)
DETERMINISTIC
BEGIN
    DECLARE salelev VARCHAR(20);

    IF purchase > 6000 THEN
		SET salelev = 'PLATINUM';
    ELSEIF (purchase >= 5000 AND 
			purchase <= 2000) THEN
        SET salelev = 'GOLD';
    ELSEIF purchase < 2000 THEN
        SET salelev = 'SILVER';
    END IF;
	-- return the salel level
	RETURN (salelev);
END$$
DELIMITER ;

-- calling function
SELECT 
     saleLevel(sum(sale_amt))
FROM
    sales;
    
