--  ADAMA SCIENCES AND TECHNOLOGY UNIVERSITY
--Database Project 
--SECTION 02
--Title: Tecket System
-- 1. Abdi Kumela Lema
-- 2. Tsehay Goremes Balkew
-- 3. Biruk Abebe Abo
-- 4. Mihret Lealem Tesfahun
-- 5. Feben Alebachew Mitku
-- 6. Hibrewerk Demlie Mossie

 ------------------------------------------------creating a Database-------------------------------------------------------------------------
 CREATE DATABASE Ticketing_System; 
 USE Ticketing_System;

-------------------------------------------------------create table --------------------------------------------------------------------
--Table 1
CREATE TABLE Users(
users_id VARCHAR(20) PRIMARY KEY,
first_name varchar(255),
middle_name varchar(255),
last_name varchar(255),
email varchar(255),
phone int(15),
price_intial int,
Address_User varchar(255)
);

--Table 2
create table venue (
venue_id varchar(20) PRIMARY KEY,
venue_name varchar(255),
address_venue varchar(255),
capacity varchar(255));

--Table 3
create table ticketing_event(
event_id INT PRIMARY KEY,
event_name varchar(255), 
description_event varchar(255),
date_event date,
time_event datetime,
venue_id varchar(20),
FOREIGN KEY(venue_id)references venue(venue_id) );

--Table 4
create table seat(
seat_id varchar(20) PRIMARY KEY,
venue_id varchar(20),
seat_number int,
seat_type varchar(255),
FOREIGN KEY(venue_id)references ticketing_event(venue_id) 
);

--Table 5
create table ticketing(
ticket_id  varchar(20) PRIMARY KEY,
event_id int,
seat_id varchar(20),
price varchar(255),
status_ticketing varchar(255),
FOREIGN KEY(event_id)references ticketing_event(event_id),
FOREIGN KEY(seat_id)references seat(seat_id) 
);

--Table 6
create table reservation(
reservation_id varchar(255) PRIMARY KEY,
users_id VARCHAR(20),
ticket_id varchar(255),
date_reservation  DATE,
time_reservation datetime,
Priority_reservation varchar(255),
FOREIGN KEY(users_id)references Users(users_id),
FOREIGN KEY(ticket_id)references ticketing(ticket_id)
);

--Table 7
create table payment(
payment_id VARCHAR(20) PRIMARY KEY,
reservation_id varchar(255),
amount int,
payment_date date,
FOREIGN KEY(reservation_id)references reservation(reservation_id) 
);

------------------------------------------------inserting data------------------------------------------------------------
--Table 1
insert into  Users(users_id,first_name,middle_name,last_name,email,phone,Address_User,price_intial)
values(01,"Gatoch","Tamene","Aschalew","gatochtamene@gmail.com",0911232425,"Addis Ababa",1000),
(02,'Abraham','Gebre','Tamene','abrahamgebre@gmail.com',0911232425,'Adama',1000), 
(03,'Mbratu','Mekebib','Sisay','mebratumekebib@gmail.com',0911090807,'Mojio',2000),
(04,'Solomon','Aragaw','Belachew','solomonaragaw@gmail.com',0911899008,'Hawassa',1200),
(05,'Asefaw','Abate','Kenamen','asefawabate@gmail.com',0918765434,'Adama',1300),
(06,'Abebe','Kebede','Yoseph','abebe.kebede@mail.com',0912345678, 'Afar',1200),
(07,'Meskerem','Mekonnen','Beka', 'meskerem.mekonnen@gmail.com', 0987654321,'Diredewa',1500),
(08,'Mulugeta','Haile','Henok', 'mulugeta.haile@gmail.com', 090055555,'Asem',1000),
(09,'Sara','Alemu','Tesfaye', 'sara.alemu@gmail.com', 099909999,'Bale',1000),
(10,'Temesgen','Hailu','Berhanu', 'temesgen.hailu@gmail.com',092202222,'Wenchi',1300),
(11,'Genet','Assefa','Tadesse', 'genet.assefa@gmail.com',0977007777,'Debrezeyt',1200),
(12,'Mekonnen','Tadesse','Yonas', 'mekonnen.tadesse@gmail.com', 0966966666,'Debrebrhan',2000),
(13,'Yeshiwork','Tsegaye','Gebre','yeshiwork.tsegaye@gmail.com',0944455444,'Wello',1000);

--Table 2
insert into venue (venue_id,venue_name,address_venue,capacity)
values('v01','Stadiom','Addis Ababa','50000'),
('v02','Meskel Square','Addis Ababa','40000'),
('v03','Milinuiom','Addis Ababa','10000'),
('v04','Posta','Adama','4000'),
('v05','Around 04','Adama','2000');
--Table 3
insert into ticketing_event( event_id , event_name,description_event ,date_event,time_event ,venue_id)
values(001,'Ester','no age limit','2023-09-09','09:00:00','v01'),
(002,'Edal-Arefa','no age limit','2023-05-07','09:00:00','v02'),
(003,'Hallowen','above 7 year','2024-07-08','09:00:00','v03'),
(004,'X-mas','no age limit','2024-06-08','09:00:00','v04'),
(005,'Ester','no age limit','2024-05-04','09:00:00','v05');

--Table 4
insert into seat(seat_id,venue_id,seat_number,seat_type)
values('s01','v01',11,'first row'),
('s02','v02',12,'second row'),
('s03','v03',13,'third  row'),
('s04','v04',14,'fourth row'),
('s05','v05',15,'fifth row');

--Table 5
insert into ticketing(ticket_id,event_id ,seat_id,price,status_ticketing)
values('t01',001,'s01',500,'Sold'),
('t02',002,'s02',250,'Sold'),
('t03',003,'s03',440,'Reserved'),
('t04',004,'s04',630,'Available'),
('t05',005,'s05',300,'Available');

--Table 6
insert into reservation(reservation_id,users_id,ticket_id,date_reservation,time_reservation,Priority_reservation)
values('u01',01,'t01','2023-04-09','11:00:00',"low"),
("u02",02,"t02","2023-05-08","09:05:00",'low'),
("u03",03,"t03","2024-04-06","08:00:00",'High'),
("u04",04,"t04","2024-02-07","10:00:00",'High'),
("u05",05,"t05","2023-01-05","10:00:00",'low');

--Table 7
insert into payment(payment_id,reservation_id,amount,payment_date)
values(0001,'u01',null,'2023-09-01'),
(0002,'u02',null,'2023-09-02'),
(0003,'u03',null,'2023-09-03'),
(0004,'u04',null,'2023-09-04'),
(0005,'u05',null,'2023-09-05');

-------------------------------------------------------select all table-------------------------------------------
select * from  Users

select * from venue

select * from ticketing_event

select * from seat

select * from ticketing

select * from reservation

select * from payment


------------------------------------------------------------- Distinict, order by ASC|DESC ,Retrieve, CASE Statement -----------------------------
SELECT DISTINCT *
FROM Users;
SELECT DISTINCT *
FROM venue;
SELECT DISTINCT *
FROM ticketing_event;
SELECT DISTINCT *
FROM seat;

SELECT users_id,date_reservation
FROM reservation
ORDER BY date_reservation ASC;
--time_reservation DESC;
----------------------------------------------------------
-- Retrieve Basic Ticket Information:
SELECT ticket_id, event_id, status_ticketing
FROM ticketing
WHERE status_ticketing = 'Available';

-- Filtering Tickets with Priority and Date Range
use Ticketing_System;
SELECT reservation_id, users_id, Priority_reservation, date_reservation
FROM reservation
WHERE Priority_reservation = 'High' AND date_reservation >= '2024-01-01';

-- Using CASE Statement for Ticket Status Classification:
SELECT ticket_id, event_id,
      CASE
        WHEN status_ticketing = 'Available' THEN 'You can Reserve'
        WHEN status_ticketing = 'Reserved' THEN 'It was Reserved'
        ELSE 'Sold'
      END AS StatusCategory
FROM ticketing;

--Retrive all tickets within a specfic price range
SELECT * FROM ticketing WHERE price BETWEEN 250 AND 400;
SELECT * FROM ticketing WHERE price BETWEEN 410 AND 700;

SELECT event_id, SUM(price) AS total_revenue
FROM ticketing
JOIN reservation ON ticketing.ticket_id = reservation.ticket_id
GROUP BY event_id;

SELECT ticketing_event.event_id, ticketing_event.event_name, ticketing_event.date_event, ticketing_event.venue_id
FROM ticketing_event
JOIN ticketing ON ticketing_event.event_id = ticketing.event_id
WHERE ticketing.ticket_id = 't03';
----------------------------------------------joins, subqueries, and aggregate ------------------------------------------------

SELECT * FROM Users WHERE first_name = 'Gatoch';
--Joining Multiple Tables with Complex Conditions:
SELECT Users.first_name, reservation.date_reservation, ticketing_event.event_name
FROM Users
JOIN reservation ON Users.Users_id = reservation.users_id
JOIN ticketing_event ON reservation.ticket_id = ticketing_event.event_id;


SELECT * FROM reservation WHERE users_id IN (SELECT Users_id FROM Users WHERE first_name = 'Gatoch');

SELECT COUNT(*) FROM reservation;
SELECT COUNT(*) FROM Users;



--------------------------------------------------------transaction------------------------------------------

-- Begin Transaction
START TRANSACTION;

-- Step 1: Check Ticket Availability
SELECT status_ticketing, price FROM ticketing WHERE ticket_id = 't01' FOR UPDATE;

-- Step 2: Reduce Stock Quantity
UPDATE ticketing SET status_ticketing = 'sold' WHERE ticket_id = 't05';
UPDATE seat SET seat_number = seat_number - 1 WHERE seat_id = (SELECT seat_id FROM ticketing WHERE ticket_id = 't01');

-- -- Step 3: Debit Buyer
UPDATE Users SET price_intial= price_intial - (SELECT price FROM ticketing WHERE ticket_id = 't01') WHERE Users_id = '01';

-- Step 4: Credit Seller
UPDATE payment SET amount = amount + (SELECT price FROM ticketing WHERE ticket_id = 't01') WHERE Users_id = (SELECT users_id FROM reservation WHERE ticket_id = 't01');

-- Step 5: Credit Taxer
SET @taxAmount := (SELECT price * 0.15 FROM ticketing WHERE ticket_id = 't01');
UPDATE  ticketing
SET price = price+ @taxAmount 
WHERE ticket_id = 't02';

COMMIT;

--------------------------------------------------------views and procedures----------------------------------------------------------------------------------------
--   CREATING VIEW TABLES

--   UsersView
 CREATE VIEW UsersView AS
 SELECT U.users_id, U.first_name, U.middle_name,U.last_name, U.email, U.phone, R.reservation_ID, R.ticket_id, R.date_reservation, P.payment_id, P.amount, P.payment_date
 FROM Users U
 LEFT JOIN reservation AS R ON U.users_id = R.users_id
 LEFT JOIN payment AS P ON R.reservation_id = P.reservation_id;

--  Available ticket view table
 CREATE VIEW AvailableTickets AS
 SELECT T.ticket_id,E.Event_id,V.venue_name,T.price
 FROM ticketing AS T
 JOIN ticketing_event AS E ON T.event_id = E.event_id
 JOIN venue AS V ON E.venue_id = V.venue_id
 WHERE T.status_ticketing = "Available";

--   Creating a view table for a sold ticket
 CREATE VIEW SoldTickets AS 
 SELECT T.ticket_id,E.event_id,V.venue_name,T.price
 FROM ticketing AS T
 JOIN ticketing_event AS E ON T.event_id = E.event_id
 JOIN venue AS V ON E.venue_id = V.venue_id
 WHERE T.status_ticketing = "Sold";

--   Creating a view table for a reserved ticket
 CREATE VIEW ReservedTickets AS 
 SELECT T.ticket_id,E.event_id,V.venue_name,T.price
 FROM ticketing AS T
 JOIN ticketing_event AS E ON T.event_id = E.event_id
 JOIN venue AS V ON E.venue_id = V.venue_id
 WHERE T.status_ticketing = "Reserved";

 SELECT * FROM UsersView;
 SELECT * FROM AvailableTickets;
 SELECT * FROM SoldTickets;
 SELECT * FROM ReservedTickets;

---------CREATING PROCEDURES TABLES
--------------get user by ID
 DELIMITER $$
 CREATE PROCEDURE FindUsers(IN f_name VARCHAR(255),IN m_name VARCHAR(255), IN l_name VARCHAR(255))
 BEGIN
 SELECT * FROM Users 
 WHERE first_name = f_name and middle_name = m_name and last_name  = l_name ;
 END $$
 DELIMITER ;
   CALL FindUsers("Gatoch","Tamene","Aschalew");

-------------get Event by id
 DELIMITER $$
 CREATE PROCEDURE GetEventByID(IN E_event_id INT)
 BEGIN
     SELECT *
     FROM ticketing_event
     WHERE event_id = E_event_id;
 END $$
 DELIMITER ;

  CALL GetEventByID(3);

------------------create new Event using Procedure

 DELIMITER $$
 CREATE PROCEDURE UpdateTicketStatus(IN T_ticket_id VARCHAR(20), IN S_status VARCHAR(20))
 BEGIN
     UPDATE ticketing
     SET status_ticketing = S_status
     WHERE ticket_id = T_ticket_id;
     
     SELECT ROW_COUNT() AS affected_rows;
     
     SELECT * FROM ticketing WHERE status_ticketing = S_status AND ticket_id = T_ticket_id;
 END $$
 DELIMITER ;
 CALL UpdateTicketStatus('t01',"Sold");


 -------------------------------------------------------------Security ----------------------------------------------------------------------

CREATE USER 'DBadmin_usernams' IDENTIFIED BY 'dbadmin456';
use Ticketing_System;
GRANT ALL PRIVILEGES ON ticketing TO 'DBadmin_usernames';

--To the main admin
CREATE USER 'MainAdmin_username' IDENTIFIED BY 'MainAdmin456';
GRANT SELECT, INSERT, UPDATE, DELETE ON *.* TO 'MainAdmin_username';


--To the ticket seller
CREATE USER 'TicketSeller_username' IDENTIFIED BY 'Tseller456';
GRANT SELECT ON ticketing_event TO 'TicketSeller_username';

GRANT SELECT ON reservation TO 'TicketSeller_username';

GRANT SELECT ON seat TO 'TicketSeller_username';
GRANT SELECT,INSERT,UPDATE,DELETE ON Users TO 'TicketSeller_username';

GRANT SELECT,INSERT,UPDATE,DELETE ON ticketing TO 'TicketSeller_username';

-----To the customers administrator
--Creating a view for customer
CREATE VIEW Cust_view AS
SELECT venue_name,venue_id,address_venue FROM venue;

---giving permission
CREATE USER 'customer' IDENTIFIED BY 'customer123';
GRANT SELECT ON Cust_view TO customer;

GRANT SELECT ON ticketing_event TO customer;
GRANT SELECT ON seat TO customer;
GRANT SELECT ON ticketing TO customer;
GRANT SELECT ON reservation TO customer;
 
GRANT SELECT, INSERT, UPDATE ON Users TO customer;
GRANT SELECT, INSERT ON payment TO customer;

-- Check  AND  show Grants permission
SHOW GRANTS FOR 'DBadmin_username';

SHOW GRANTS FOR 'TicketSeller_username';

SHOW GRANTS FOR 'customer';
SHOW GRANTS FOR 'MainAdmin_username';

SHOW GRANTS FOR 'MainAdmin_username';

----------------------------------------------ADDING TRIGGER FOR THE TABLES---------------------------------------------------------
CREATE TRIGGER after_reservation_insert
AFTER INSERT ON reservation
FOR EACH ROW
BEGIN
    UPDATE ticketing
    SET status_ticketing = 'Reserved'
    WHERE ticket_id = NEW.ticket_id;
END;

CREATE TRIGGER after_payment_insert
AFTER INSERT ON payment
FOR EACH ROW
BEGIN
    UPDATE ticketing
    SET status_ticketing = 'Sold'
    WHERE ticket_id = (SELECT ticket_id FROM reservation WHERE reservation_ID = NEW.reservation_ID);
END;

CREATE TRIGGER before_venue_update
BEFORE UPDATE ON venue
FOR EACH ROW
BEGIN
    DECLARE reserved_count INT;
    
    SELECT COUNT(*)
    INTO reserved_count
    FROM ticketing t
    JOIN EVENT e ON t.Event_id = e.Event_id
    WHERE e.venue_id = OLD.venue_id AND t.status = 'Reserved';
    
    IF reserved_count > 0 THEN
        -- SIGNAL SQLSTATE '45000'
        SET @MESSAGE_TEXT = 'Cannot update the venue capacity. There are reserved tickets for events at this venue.';
    END IF;
END;



