--EXPERIMENT 4--
--CONSTRAINTS--




-----    MESS MARKING SYSTEM    -----

-- CREATING DATABSES --

DROP DATABASE IF EXISTS `mess`;

CREATE DATABASE `mess`;

USE `mess`;


-- CREATING TABLES --

CREATE TABLE `admins`(
  `admin_id` INT(5) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(20) NOT NULL,
  `password` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`admin_id`)
);


CREATE TABLE `users`(
  `mess_id` INT(5) NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(20) NOT NULL,
  `last_name` VARCHAR(20) NOT NULL,
  `phone_no` BIGINT(10) NOT NULL,
  `email_id` VARCHAR(20) NOT NULL,
  `password` VARCHAR(20) NOT NULL,
  PRIMARY KEY(`mess_id`)
);

CREATE TABLE `meals`(
  `meal_id` INT(5) NOT NULL AUTO_INCREMENT,
  `image` BLOB DEFAULT NULL,
  `day` ENUM('sun','mon', 'tues', 'wed', 'thurs', 'fri', 'sat') DEFAULT 'mon',
  `time` ENUM('morning', 'noon', 'night') DEFAULT 'morning',
  `title` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`meal_id`)
);

CREATE TABLE `markings` (
  `marking_id` INT NOT NULL AUTO_INCREMENT,
  `morning` BOOLEAN NOT NULL,
  `noon` BOOLEAN NOT NULL,
  `night` BOOLEAN NOT NULL,
  `date` DATE NOT NULL,
  `fk_mess_id` INT NOT NULL,
  PRIMARY KEY (`marking_id`),
  FOREIGN KEY (fk_mess_id) REFERENCES users(mess_id)
);

CREATE TABLE `bills` (
  `bill_id` INT(10) NOT NULL AUTO_INCREMENT,
  `fk_mess_id` INT NOT NULL,
  `amount` INT(10) NOT NULL,
  `per_day_price` INT(5) NOT NULL,
  `month` INT(2) NOT NULL,
  PRIMARY KEY (`bill_id`),
  FOREIGN KEY (fk_mess_id) REFERENCES users(mess_id)
);



CREATE TABLE mds(
  `md_id` INT(5) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(20) NOT NULL,
  `password` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`md_id`)
  
);

-- RELATIONSHIP --


CREATE TABLE md_has_admin(
 `admin_id` INT NOT NULL,
 `md_id` INT NOT NULL,
 PRIMARY KEY (admin_id, md_id),
 FOREIGN KEY (admin_id) REFERENCES admins(admin_id),
 FOREIGN KEY (md_id) REFERENCES mds(md_id)
);

