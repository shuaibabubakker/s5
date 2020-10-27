//Database triggers 
CREATE TABLE staff(st_age int ,st_name varchar (50));
delimiter // 
CREATE TRIGGER checkage BEFORE INSERT ON staff FOR EACH ROW IF NEW.st_age < 0 
THEN SET NEW.st_age = 0; END IF;// 
INSERT INTO staff VALUES (25, 'vam'), (25, 'ram');
select*from staff;

//Database cursors
delimiter $$
CREATE PROCEDURE list_name 
(INOUT name_list varchar(400))
 BEGIN
 DECLARE is_done INTEGER DEFAULT 0;
 DECLARE c_name varchar(50) DEFAULT "";
 DECLARE cust_cursor CURSOR FOR SELECT c_name FROM customer;
 DECLARE CONTINUE HANDLER FOR NOT FOUND SET is_done=1;
 OPEN cust_cursor;
 get_list: LOOP
 FETCH cust_cursor INTO c_name;
 IF is_done=1 THEN
 LEAVE get_list;
 END IF;
 SET
 name_list=CONCAT(c_name,";",name_list);
 END LOOP get_list;
 CLOSE cust_cursor;
 END $$ 
SET @name_list ="";
 CALL list_name(@name_list);
 SELECT @name_list;

