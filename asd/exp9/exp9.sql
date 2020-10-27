--EXPERIMENT 9--
--* Implementation of various aggregate functions in SQL --

-----    MESS MARKING SYSTEM    -----


USE mess;

select * from bills;

select max(amount) from bills;
select min(amount) from bills;
select avg(amount) from bills;
select count(bill_id) from bills;

select * from bills;

select sum(amount) from bills as total_amount;
select stddev(amount) from bills;
select variance(amount) from bills;
