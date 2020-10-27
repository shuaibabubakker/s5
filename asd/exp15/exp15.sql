--   MESS MARKING SYSTEM    
--EXPERIMENT 15
--Creation of Triggers and Cursors
USE `mess`;


-- Cursors
CREATE TABLE board(
    b_age int,
    b_name varchar (50)
);

delimiter $$

CREATE TRIGGER checkage BEFORE 
INSERT ON board 
FOR EACH ROW 
IF NEW.b_age < 0 
THEN SET NEW.b_age = 0; 
END IF;$$ 

delimiter ;

SHOW TRIGGERS;

INSERT INTO board VALUES (45, 'nisar'), (-30, 'rajesh');

SELECT * FROM board;


DROP PROCEDURE list_name;

delimiter $$
CREATE PROCEDURE list_name 
(INOUT name_list varchar(400))
BEGIN
    DECLARE is_done INTEGER DEFAULT 0;
    DECLARE name varchar(50) DEFAULT "";
    DECLARE user_cursor CURSOR FOR SELECT first_name FROM users;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET is_done=1;
    OPEN user_cursor;
    get_list: LOOP
        FETCH user_cursor INTO name;
        IF is_done=1 THEN
            LEAVE get_list;
        END IF;
        SET
        name_list=CONCAT(name,",",name_list);
    END LOOP get_list;
    CLOSE user_cursor;
END $$ 

DELIMITER ;
SET @name_list ="";

CALL list_name(@name_list);

SELECT @name_list;

