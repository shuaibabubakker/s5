
-- USE mess DATABASE --

USE mess;

--INSERTING USER DETAILS --

INSERT INTO users VALUES('shuaib','abubakker',973899770,0001,"shuaib@gmail.com","1234");
INSERT INTO users VALUES('salih','pu',9739898778,0002,"salih@gmail.com","1234");
INSERT INTO users VALUES('onji','c',9973898797,0003,"onji@gmail.com","1234");
INSERT INTO users VALUES('sarthak','anil',9737798777,0004,"sarthak@gmail.com","1234");
INSERT INTO users VALUES('kichu','vp',9738987887,0005,"kichu@gmail.com","1234");


--INSERTING ADMIN DETAILS --

INSERT INTO admins VALUES(1,'favas',"1234");
INSERT INTO admins VALUES(2,'midlaj',"1234");



--INSERTING MEAL DETAILS --

INSERT INTO meals VALUES( NULL,  'mon',  'morning', "idli", 001);
INSERT INTO meals VALUES( NULL,  'tues',  'morning', "idli", 002);
INSERT INTO meals VALUES( NULL,  'tues',  'night', "dosa", 003);
INSERT INTO meals VALUES( NULL,  'wed',  'morning', "putt", 004);
INSERT INTO meals VALUES( NULL,  'thurs',  'morning', "pathiri", 005);
INSERT INTO meals VALUES( NULL,  'fri',  'morning', "porotta", 006);
INSERT INTO meals VALUES( NULL,  'sat',  'noon', "rice", 007);
INSERT INTO meals VALUES( NULL,  'sun',  'noon', "ghee rice", 008);
INSERT INTO meals VALUES( NULL,  'tues',  'morning', "soup", 009);
INSERT INTO meals VALUES( NULL,  'mon',  'night', "vellappam", 010);
INSERT INTO meals VALUES( NULL,  'mon',  'noon', "putt", 011);
INSERT INTO meals VALUES( NULL,  'mon',  'night', "pathiri", 012);




--INSERTING MARKING DETAILS --

INSERT INTO markings VALUES(TRUE,  FALSE,  TRUE,  '13/08/20' , 1,1);
INSERT INTO markings VALUES(TRUE,  FALSE,  TRUE,  '14/08/20' , 2,1);
INSERT INTO markings VALUES(TRUE,  FALSE,  TRUE,  '14/08/20' , 3,2);
INSERT INTO markings VALUES(TRUE,  FALSE,  TRUE,  '15/08/20' , 4,1);
INSERT INTO markings VALUES(TRUE,  FALSE,  TRUE,  '15/08/20' , 5,2);
INSERT INTO markings VALUES(TRUE,  FALSE,  TRUE,  '15/08/20' , 6,3);
INSERT INTO markings VALUES(TRUE,  FALSE,  TRUE,  '15/08/20' , 7,4);
INSERT INTO markings VALUES(TRUE,  FALSE,  TRUE,  '16/08/20' , 8,1);


--INSERTING BILL DETAILS --

INSERT INTO bills VALUES (1,1,1222,100,2);
INSERT INTO bills VALUES (2,4,1222,100,2);
INSERT INTO bills VALUES (3,2,1222,100,2);
INSERT INTO bills VALUES (4,3,1222,100,2);
INSERT INTO bills VALUES (5,5,1222,100,2);
INSERT INTO bills VALUES (6,6,1222,100,2);





--INSERTING MD DETAILS --

INSERT INTO mds VALUES(1,'raj',"1234");
INSERT INTO mds VALUES(2,'ram',"1234");
INSERT INTO mds VALUES(3,'anu',"1234");
INSERT INTO mds VALUES(4,'ani',"1234");