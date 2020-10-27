--EXPERIMENT 7--
--VIEWS AND ASSERTIONS--

-----    MESS MARKING SYSTEM    -----

USE mess;

--VIEWS--

--CREATE VIEW --
CREATE VIEW `monday_meals` AS SELECT
title, time from meals WHERE day = "mon";
SELECT * FROM monday_meals;

CREATE VIEW `morning_markings` AS
    SELECT users.first_name, 
           markings.date
    FROM users , 
         markings
    WHERE markings.morning = TRUE && markings.fk_mess_id = users.mess_id;
SELECT * FROM morning_markings;


--DELETE VIEW--
DROP VIEW morning_markings;


--UPDATING VIEW--
CREATE OR REPLACE VIEW `morning_markings` AS
    SELECT users.first_name, users.last_name,
           markings.date
    FROM users , 
         markings
    WHERE markings.morning = TRUE && markings.fk_mess_id = users.mess_id;
SELECT * FROM morning_markings;


--INSERTING ROW INTO VIEW--

INSERT INTO `monday_meals` (title, time)  VALUES("saambar", "morning");
INSERT INTO `monday_meals` (title, time)  VALUES("dhum biriyani", "noon");
INSERT INTO `monday_meals` (title, time)  VALUES("kadal curry", "night");



--DELETE ROW FROM VIEW--
DELETE FROM monday_meals
WHERE title = "idli";
