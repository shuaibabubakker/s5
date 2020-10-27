--EXPERIMENT 8--
--** Implementation of Build in functions in  RDBMS  --

-----    MESS MARKING SYSTEM    -----

USE mess;

/* built in string funtions*/
select lower(first_name) from users as lower_name ;
select upper(first_name) from users as upper_name ;
select *,CONCAT(first_name," ",last_name) as name from users;
select replace("shuaib", "s", "S");



/*built in numeric funtions*/

select abs(-34) as absvalue;
select avg(amount) as averageAmount from bills;
select sum(amount) as total from bills;
select count(bill_id) as billCount from bills;



/*built in dateTime functions; */

/* inserting values */
INSERT INTO markings VALUES(TRUE,  FALSE,  TRUE,  '13/08/20' , 10,1);
INSERT INTO markings VALUES(TRUE,  FALSE,  TRUE,  '14/08/20' , 11,2);
select * from markings;


select day("2020-09-29");
select * from markings where day(date)>10 ;
select month("2020-09-29");
select * from markings where month(date)=8;
select year("2020-09-29");
select * from markings where year(date)=20;


/* built in advanced functions */

select if(amount>1000,"yes","no") from bills;
select cast("14:06:10" AS TIME); 
select convert(150,char);
select current_user;
