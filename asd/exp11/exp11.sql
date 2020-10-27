--   MESS MARKING SYSTEM    --
--EXPERIMENT 11--

-- Implementation of set operators, nested queries and Join queries --



SELECT mess_id, first_name FROM users
UNION
SELECT admin_id, name FROM admins;

SELECT amount, fk_mess_id
FROM bills
  WHERE amount>1000;


SELECT first_name
FROM users
WHERE mess_id IN (
  SELECT mess_id
  FROM bills
  WHERE month =2
  );

SELECT mess_id ,  first_name ,  last_name,  phone_no
FROM users
INNER JOIN  bills ON users.mess_id = bills.fk_mess_id

SELECT mess_id ,  first_name ,  last_name,  phone_no
FROM users
LEFT JOIN  bills ON users.mess_id = bills.fk_mess_id

SELECT mess_id ,  first_name ,  last_name,  phone_no
FROM users
RIGHT JOIN  bills ON users.mess_id = bills.fk_mess_id
