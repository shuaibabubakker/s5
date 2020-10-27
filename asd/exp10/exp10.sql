--   MESS MARKING SYSTEM    --
--EXPERIMENT 10--

-- Implementation of Order By, Group By& Having clause. --


USE `mess`;

SELECT * FROM users
ORDER BY first_name;

SELECT * FROM meals
ORDER BY meal_id DESC;


SELECT COUNT(meal_id), time
FROM meals
GROUP BY time;

SELECT SUM(amount), month
FROM bills
GROUP BY month
HAVING SUM(amount)>1000;



