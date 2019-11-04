--CREATE DATABASE Lukas;
use Lukas;

/*
DROP TABLE TREATMENT;
DROP TABLE CALL_SCHEDULE;
DROP TABLE SCHEDULE;
DROP TABLE ANIMAL;
DROP TABLE CLIENT;
DROP TABLE VS;
DROP TABLE SITE;
DROP TABLE SPECIALITY;
DROP TABLE VET;
DROP TABLE TIMESLOT;
DROP TABLE ROOM;
DROP TABLE EMPLOYEE;
*/


--EMPLOYEE(E#, E_Firstname, E_Surname, StreetNo, StreetName, Suburb)
--PK- E#
CREATE TABLE EMPLOYEE(
E# int IDENTITY(1,1),
E_Firstname varchar(40),
E_Surname varchar(40),
StreetNo varchar(10),
StreetName varchar(50),
Suburb varchar(50),
CONSTRAINT PK_E PRIMARY KEY(E#));


--ROOM(R#, RoomName)
--PK- R#
CREATE TABLE ROOM(
R# int IDENTITY(1,1),
RoomName varchar(30),
CONSTRAINT PK_R PRIMARY KEY(R#));


--TIMESLOT(Slot#, From, To)
--PK- Slot#
CREATE TABLE TIMESLOT(
Slot# int IDENTITY(1,1),
Fromm TIME(0),
Too TIME(0),
CONSTRAINT PK_Slot# PRIMARY KEY(Slot#));


--VET (V#, V_Firstname, V_Surname, StreetNo, StreetName, Suburb, ContactNo)
--PK- V#
CREATE TABLE VET(
V# int IDENTITY(1,1),
V_Firstname varchar(40),
V_Surname varchar(40),
StreetNo varchar(10),
StreetName varchar(50),
Suburb varchar(50),
ContactNo varchar(35),
CONSTRAINT PK_V PRIMARY KEY(V#));


--SPECIALITY(SP#, Description)
--PK- SP#
CREATE TABLE SPECIALITY(
SP# int IDENTITY(1,1),
Description varchar(200),
CONSTRAINT PK_SP PRIMARY KEY(SP#));

--SITE(Site#, SiteType, StreetNo, StreetName, Suburb)
--PK- Site#
CREATE TABLE SITE(
Site# int IDENTITY(1,1),
SiteType varchar(25),
StreetNo varchar(10),
StreetName varchar(50),
Suburb varchar(50),
CONSTRAINT PK_Site PRIMARY KEY(Site#));


--VS (V#, SP#)
--PK � (V#, SP#) � composite key
--FK � V#, and SP#
CREATE TABLE VS (
	V# int,
	SP# int,
 CONSTRAINT PK_VSP PRIMARY KEY(V#,SP#),
 CONSTRAINT FK_V_VSP FOREIGN KEY(V#) REFERENCES VET(V#) ON DELETE CASCADE ON UPDATE CASCADE,
 CONSTRAINT FK_SP_VSP FOREIGN KEY(SP#) REFERENCES SPECIALITY(SP#) ON DELETE CASCADE ON UPDATE CASCADE);


--CLIENT(C#, C_Firstname, C_Surname, StreetNo, StreetName, Suburb, ContactNo)
--PK- C#
CREATE TABLE CLIENT(
C# int IDENTITY(1,1),
C_Firstname varchar(40),
C_Surname varchar(40),
StreetNo varchar(10),
StreetName varchar(50),
Suburb varchar(50),
ContactNo varchar(35),
CONSTRAINT PK_C PRIMARY KEY(C#));


--ANIMAL(A#, AName, C#)
--PK- A#
--FK � C#
CREATE TABLE ANIMAL (
	A# int IDENTITY(1,1),
	AName# varchar(60),
	C# int,
 CONSTRAINT PK_A PRIMARY KEY(A#),
 CONSTRAINT FK_C_A FOREIGN KEY(C#) REFERENCES CLIENT(C#) ON DELETE CASCADE ON UPDATE CASCADE);


--SCHEDULE(Sch#, V#, Slot#, R#,Oncall)
--R#, V# and Slot# nulls should be allowed
--PK - Sch#
--FK � V#, Slot# and R#
CREATE TABLE SCHEDULE (
	Sch# int IDENTITY(1,1),
	V# int,
	Slot# int,
	R# int,
	Oncall BIT,
 CONSTRAINT PK_Sch PRIMARY KEY(Sch#),
 CONSTRAINT FK_V_Sch FOREIGN KEY(V#) REFERENCES VET(V#) ON DELETE CASCADE ON UPDATE CASCADE,
 CONSTRAINT FK_Slot_Sch FOREIGN KEY(Slot#) REFERENCES TIMESLOT(Slot#) ON DELETE CASCADE ON UPDATE CASCADE,
 CONSTRAINT FK_R_Sch FOREIGN KEY(R#) REFERENCES ROOM(R#) ON DELETE CASCADE ON UPDATE CASCADE);


--CALL_SCHEDULE (V#, Site#, From, To)
--PK � (V#, Site#) � composite key
--FK � V#, and Site#
CREATE TABLE CALL_SCHEDULE (
	V# int,
	Site# int,
	Fromm TIME(0),
	Too TIME(0),
 CONSTRAINT PK_VSite PRIMARY KEY(V#, Site#),
 CONSTRAINT FK_V_VSite FOREIGN KEY(V#) REFERENCES VET(V#) ON DELETE CASCADE ON UPDATE CASCADE,
 CONSTRAINT FK_Site_VSite FOREIGN KEY(Site#) REFERENCES SITE(Site#) ON DELETE CASCADE ON UPDATE CASCADE);


--TREATMENT(T#, Date_of_Treatment, V#, A#, Site#, Treatment_Given)
--Site# - nulls should be allowed
--PK - T#
--FK � V#, A# and Site#
CREATE TABLE TREATMENT (
	T# int IDENTITY(1,1),
	Date_of_Treatment date,
	V# int,
	A# int,
	Site# int,
	Treatment_Given varchar(200),
 CONSTRAINT PK_T PRIMARY KEY(T#),
 CONSTRAINT FK_V_T FOREIGN KEY(V#) REFERENCES VET(V#) ON DELETE CASCADE ON UPDATE CASCADE,
 CONSTRAINT FK_A_T FOREIGN KEY(A#) REFERENCES ANIMAL(A#) ON DELETE CASCADE ON UPDATE CASCADE,
 CONSTRAINT FK_Site_T FOREIGN KEY(Site#) REFERENCES SITE(Site#) ON DELETE CASCADE ON UPDATE CASCADE);








--EMPLOYEE data insert
INSERT INTO EMPLOYEE([E_Firstname],[E_Surname],[StreetNo],[StreetName],[Suburb]) VALUES('Arthur','Goff','61','Elit, St.','Austin');
INSERT INTO EMPLOYEE([E_Firstname],[E_Surname],[StreetNo],[StreetName],[Suburb]) VALUES('Acton','Silva','29','Maecenas Rd.','Aosta');
INSERT INTO EMPLOYEE([E_Firstname],[E_Surname],[StreetNo],[StreetName],[Suburb]) VALUES('Yuli','Calhoun','74','Venenatis St.','Baiso');
INSERT INTO EMPLOYEE([E_Firstname],[E_Surname],[StreetNo],[StreetName],[Suburb]) VALUES('Callie','Roth','75','Ullamcorper Street','Nashville');
INSERT INTO EMPLOYEE([E_Firstname],[E_Surname],[StreetNo],[StreetName],[Suburb]) VALUES('Tarik','Landry','100','Sed, Street','Chépica');
INSERT INTO EMPLOYEE([E_Firstname],[E_Surname],[StreetNo],[StreetName],[Suburb]) VALUES('Stacey','Salas','130','Justo Road','Llanidloes');
INSERT INTO EMPLOYEE([E_Firstname],[E_Surname],[StreetNo],[StreetName],[Suburb]) VALUES('Rahim','Yang','113','Ultrices St.','Bhusawal');
INSERT INTO EMPLOYEE([E_Firstname],[E_Surname],[StreetNo],[StreetName],[Suburb]) VALUES('Iris','Snyder','99','Ornare, Avenue','Koszalin');
INSERT INTO EMPLOYEE([E_Firstname],[E_Surname],[StreetNo],[StreetName],[Suburb]) VALUES('Rashad','Baker','54','Neque Rd.','Chimbarongo');
INSERT INTO EMPLOYEE([E_Firstname],[E_Surname],[StreetNo],[StreetName],[Suburb]) VALUES('Abra','Hinton','127','Fermentum Avenue','Chantemelle');



--ROOM data insert
INSERT INTO ROOM([RoomName]) VALUES('Red Room');
INSERT INTO ROOM([RoomName]) VALUES('X-Ray');
INSERT INTO ROOM([RoomName]) VALUES('Treatment Room 1');
INSERT INTO ROOM([RoomName]) VALUES('Treatment Room 2');
INSERT INTO ROOM([RoomName]) VALUES('Treatment Room 3');



--TIMESLOT data insert
INSERT INTO TIMESLOT([Fromm],[Too]) VALUES('07:00:00', '07:30:00');
INSERT INTO TIMESLOT([Fromm],[Too]) VALUES('07:45:00', '08:15:00');
INSERT INTO TIMESLOT([Fromm],[Too]) VALUES('08:30:00', '09:00:00');
INSERT INTO TIMESLOT([Fromm],[Too]) VALUES('09:15:00', '09:45:00');
INSERT INTO TIMESLOT([Fromm],[Too]) VALUES('10:00:00', '10:30:00');
INSERT INTO TIMESLOT([Fromm],[Too]) VALUES('10:45:00', '11:15:00');
INSERT INTO TIMESLOT([Fromm],[Too]) VALUES('11:30:00', '12:00:00');
INSERT INTO TIMESLOT([Fromm],[Too]) VALUES('12:15:00', '12:45:00');



--VET data insert
INSERT INTO VET([V_Firstname],[V_Surname],[StreetNo],[StreetName],[Suburb],[ContactNo]) VALUES('Ferdinand','Cobb','91','Venenatis Rd.','Devizes','1694111035599');
INSERT INTO VET([V_Firstname],[V_Surname],[StreetNo],[StreetName],[Suburb],[ContactNo]) VALUES('Bevis','Fields','18','Accumsan St.','Solihull','1623041589899');
INSERT INTO VET([V_Firstname],[V_Surname],[StreetNo],[StreetName],[Suburb],[ContactNo]) VALUES('Harlan','Estes','90','Ligula. Rd.','SŽlange','1685021802299');
INSERT INTO VET([V_Firstname],[V_Surname],[StreetNo],[StreetName],[Suburb],[ContactNo]) VALUES('Luke','Howard','12','Phasellus Rd.','Gaggio Montano','1674032563399');
INSERT INTO VET([V_Firstname],[V_Surname],[StreetNo],[StreetName],[Suburb],[ContactNo]) VALUES('Nero','Rutledge','122','Accumsan Rd.','Rankweil','1633031790399');
INSERT INTO VET([V_Firstname],[V_Surname],[StreetNo],[StreetName],[Suburb],[ContactNo]) VALUES('Madison','Valentine','95','Molestie Road','Thane','1617071402699');
INSERT INTO VET([V_Firstname],[V_Surname],[StreetNo],[StreetName],[Suburb],[ContactNo]) VALUES('Winter','Copeland','120','Phasellus Rd.','Ancona','1643102355199');
INSERT INTO VET([V_Firstname],[V_Surname],[StreetNo],[StreetName],[Suburb],[ContactNo]) VALUES('Cadman','Vinson','10','Parturient Rd.','Çeşme','1645060648799');



--SPECIALITY data insert
INSERT INTO SPECIALITY([Description]) VALUES('Anaesthesiology');
INSERT INTO SPECIALITY([Description]) VALUES('Cardiology');
INSERT INTO SPECIALITY([Description]) VALUES('Dentistry');
INSERT INTO SPECIALITY([Description]) VALUES('Internal medicine');
INSERT INTO SPECIALITY([Description]) VALUES('Porcine');
INSERT INTO SPECIALITY([Description]) VALUES('Preventive medicine');





--SITE data insert
INSERT INTO SITE([SiteType],[StreetNo],[StreetName],[Suburb]) VALUES('House','25','Ipsum Street','Farciennes');
INSERT INTO SITE([SiteType],[StreetNo],[StreetName],[Suburb]) VALUES('Farm','15','Mollis Ave','Diets-Heur');
INSERT INTO SITE([SiteType],[StreetNo],[StreetName],[Suburb]) VALUES('Clinic','39','Scelerisque Street','Vichy');
INSERT INTO SITE([SiteType],[StreetNo],[StreetName],[Suburb]) VALUES('House','143','Lorem St.','Aydın');
INSERT INTO SITE([SiteType],[StreetNo],[StreetName],[Suburb]) VALUES('Farm','17','Vehicula St.','Dilsen-Stokkem');
INSERT INTO SITE([SiteType],[StreetNo],[StreetName],[Suburb]) VALUES('Farm','3','Ornare St.','Roux-Miroir');
INSERT INTO SITE([SiteType],[StreetNo],[StreetName],[Suburb]) VALUES('Farm','113','Mauris Rd.','Chiny');
INSERT INTO SITE([SiteType],[StreetNo],[StreetName],[Suburb]) VALUES('Clinic','124','Sit St.','Coleville Lake');
INSERT INTO SITE([SiteType],[StreetNo],[StreetName],[Suburb]) VALUES('House','97','Iaculis St.','Olivar');
INSERT INTO SITE([SiteType],[StreetNo],[StreetName],[Suburb]) VALUES('House','49','Magna. Av.','Gresham');
INSERT INTO SITE([SiteType],[StreetNo],[StreetName],[Suburb]) VALUES('House','39','Faucibus Rd.','Coinco');
INSERT INTO SITE([SiteType],[StreetNo],[StreetName],[Suburb]) VALUES('House','118','Nam Rd.','Leffinge');
INSERT INTO SITE([SiteType],[StreetNo],[StreetName],[Suburb]) VALUES('Farm','87','Ac St.','Baie-Comeau');
INSERT INTO SITE([SiteType],[StreetNo],[StreetName],[Suburb]) VALUES('Farm','38','Tristique Rd.','Kingston-on-Thames');
INSERT INTO SITE([SiteType],[StreetNo],[StreetName],[Suburb]) VALUES('Farm','143','Ante St.','Omaha');
INSERT INTO SITE([SiteType],[StreetNo],[StreetName],[Suburb]) VALUES('House','121','Nulla Avenue','Ruddervoorde');
INSERT INTO SITE([SiteType],[StreetNo],[StreetName],[Suburb]) VALUES('Farm','53','Diam. Av.','Castelbianco');
INSERT INTO SITE([SiteType],[StreetNo],[StreetName],[Suburb]) VALUES('Clinic','24','Vestibulum, Street','Orsogna');
INSERT INTO SITE([SiteType],[StreetNo],[StreetName],[Suburb]) VALUES('Farm','112','Tristique St.','Wichita');
INSERT INTO SITE([SiteType],[StreetNo],[StreetName],[Suburb]) VALUES('House','138','Nunc Street','Osgoode');
INSERT INTO SITE([SiteType],[StreetNo],[StreetName],[Suburb]) VALUES('Farm','70','Vulputate, St.','Coquimbo');
INSERT INTO SITE([SiteType],[StreetNo],[StreetName],[Suburb]) VALUES('Farm','98','Mauris Rd.','Bonnyville Municipal District');
INSERT INTO SITE([SiteType],[StreetNo],[StreetName],[Suburb]) VALUES('Clinic','90','Non Rd.','Stalhille');
INSERT INTO SITE([SiteType],[StreetNo],[StreetName],[Suburb]) VALUES('Clinic','70','Egestas Avenue','Gdańsk');
INSERT INTO SITE([SiteType],[StreetNo],[StreetName],[Suburb]) VALUES('Clinic','67','Sit St.','Baunatal');
INSERT INTO SITE([SiteType],[StreetNo],[StreetName],[Suburb]) VALUES('House','146','At Rd.','Kilwinning');
INSERT INTO SITE([SiteType],[StreetNo],[StreetName],[Suburb]) VALUES('House','54','In Road','Salzwedel');
INSERT INTO SITE([SiteType],[StreetNo],[StreetName],[Suburb]) VALUES('Clinic','59','Nam Ave','Jerez de la Frontera');
INSERT INTO SITE([SiteType],[StreetNo],[StreetName],[Suburb]) VALUES('House','90','Pulvinar Rd.','Reutlingen');



--VS data insert
INSERT INTO VS([V#],[SP#]) VALUES(1,1);
INSERT INTO VS([V#],[SP#]) VALUES(2,4);
INSERT INTO VS([V#],[SP#]) VALUES(2,5);
INSERT INTO VS([V#],[SP#]) VALUES(3,3);
INSERT INTO VS([V#],[SP#]) VALUES(4,5);
INSERT INTO VS([V#],[SP#]) VALUES(5,6);
INSERT INTO VS([V#],[SP#]) VALUES(6,2);
INSERT INTO VS([V#],[SP#]) VALUES(7,5);
INSERT INTO VS([V#],[SP#]) VALUES(8,4);



--CLIENT data insert
INSERT INTO VET([C_Firstname],[C_Surname],[StreetNo],[StreetName],[Suburb],[ContactNo]) VALUES('Blaze','Nolan','102','Dapibus Street','Town of Yarmouth','1650100273799');
INSERT INTO VET([C_Firstname],[C_Surname],[StreetNo],[StreetName],[Suburb],[ContactNo]) VALUES('Ashely','Hooper','58','Nam Rd.','Zeebrugge','1659100177999');
INSERT INTO VET([C_Firstname],[C_Surname],[StreetNo],[StreetName],[Suburb],[ContactNo]) VALUES('Rhona','Shepherd','51','Adipiscing Rd.','Compiano','1662121092499');
INSERT INTO VET([C_Firstname],[C_Surname],[StreetNo],[StreetName],[Suburb],[ContactNo]) VALUES('Ferdinand','Oneal','132','Cursus Avenue','Heidenheim','1612112135099');
INSERT INTO VET([C_Firstname],[C_Surname],[StreetNo],[StreetName],[Suburb],[ContactNo]) VALUES('Kameko','Pena','74','Euismod St.','Alto del Carmen','1664092578499');
INSERT INTO VET([C_Firstname],[C_Surname],[StreetNo],[StreetName],[Suburb],[ContactNo]) VALUES('Chadwick','Ortega','95','Sapien. St.','Plainevaux','1653021115299');
INSERT INTO VET([C_Firstname],[C_Surname],[StreetNo],[StreetName],[Suburb],[ContactNo]) VALUES('Davis','Flynn','140','Euismod Street','Brescia','1676071947399');
INSERT INTO VET([C_Firstname],[C_Surname],[StreetNo],[StreetName],[Suburb],[ContactNo]) VALUES('Cain','Marquez','144','In Av.','Tredegar','1683012204399');
INSERT INTO VET([C_Firstname],[C_Surname],[StreetNo],[StreetName],[Suburb],[ContactNo]) VALUES('Axel','Miller','33','Urna Rd.','Orsogna','1669020400199');
INSERT INTO VET([C_Firstname],[C_Surname],[StreetNo],[StreetName],[Suburb],[ContactNo]) VALUES('Ramona','Munoz','88','Augue Ave','Katowice','1602122749699');
INSERT INTO VET([C_Firstname],[C_Surname],[StreetNo],[StreetName],[Suburb],[ContactNo]) VALUES('Conan','Howe','139','Aliquet Av.','Kapolei','1669022610699');
INSERT INTO VET([C_Firstname],[C_Surname],[StreetNo],[StreetName],[Suburb],[ContactNo]) VALUES('Keegan','Love','58','Amet Av.','Turriaco','1630080806199');
INSERT INTO VET([C_Firstname],[C_Surname],[StreetNo],[StreetName],[Suburb],[ContactNo]) VALUES('Donovan','Floyd','128','Integer Road','Miami','1663011549799');
INSERT INTO VET([C_Firstname],[C_Surname],[StreetNo],[StreetName],[Suburb],[ContactNo]) VALUES('Scarlett','Mcclure','27','Amet Road','Moose Jaw','1647070745699');
INSERT INTO VET([C_Firstname],[C_Surname],[StreetNo],[StreetName],[Suburb],[ContactNo]) VALUES('Rylee','Mullen','46','Habitant Road','Ruisbroek','1672120518699');
INSERT INTO VET([C_Firstname],[C_Surname],[StreetNo],[StreetName],[Suburb],[ContactNo]) VALUES('Montana','Fuentes','25','Dui, Rd.','Jerez de la Frontera','1685091201799');
INSERT INTO VET([C_Firstname],[C_Surname],[StreetNo],[StreetName],[Suburb],[ContactNo]) VALUES('Camilla','Tillman','45','Eget, Road','Brodick','1605061184199');
INSERT INTO VET([C_Firstname],[C_Surname],[StreetNo],[StreetName],[Suburb],[ContactNo]) VALUES('Perry','Walters','81','Odio. Av.','Sandy','1623102475899');
INSERT INTO VET([C_Firstname],[C_Surname],[StreetNo],[StreetName],[Suburb],[ContactNo]) VALUES('Yardley','Hebert','63','Tristique Av.','Jonesboro','1642080338499');
INSERT INTO VET([C_Firstname],[C_Surname],[StreetNo],[StreetName],[Suburb],[ContactNo]) VALUES('Michelle','Waters','127','Interdum. Ave','Wepion','1665061934499');



--ANIMAL data insert
INSERT INTO ANIMAL([C_Firstname],[C#]) VALUES('Cedric',1);
INSERT INTO ANIMAL([C_Firstname],[C#]) VALUES('Slade',7);
INSERT INTO ANIMAL([C_Firstname],[C#]) VALUES('Carla',16);
INSERT INTO ANIMAL([C_Firstname],[C#]) VALUES('Julie',20);
INSERT INTO ANIMAL([C_Firstname],[C#]) VALUES('Cailin',14);
INSERT INTO ANIMAL([C_Firstname],[C#]) VALUES('Gemma',14);
INSERT INTO ANIMAL([C_Firstname],[C#]) VALUES('Jakeem',14);
INSERT INTO ANIMAL([C_Firstname],[C#]) VALUES('Lillith',6);
INSERT INTO ANIMAL([C_Firstname],[C#]) VALUES('Doris',15);
INSERT INTO ANIMAL([C_Firstname],[C#]) VALUES('Gannon',1);
INSERT INTO ANIMAL([C_Firstname],[C#]) VALUES('Keane',14);
INSERT INTO ANIMAL([C_Firstname],[C#]) VALUES('Urielle',13);
INSERT INTO ANIMAL([C_Firstname],[C#]) VALUES('Ivan',6);
INSERT INTO ANIMAL([C_Firstname],[C#]) VALUES('Burke',18);
INSERT INTO ANIMAL([C_Firstname],[C#]) VALUES('Eleanor',2);
INSERT INTO ANIMAL([C_Firstname],[C#]) VALUES('Rhona',17);
INSERT INTO ANIMAL([C_Firstname],[C#]) VALUES('Bradley',2);
INSERT INTO ANIMAL([C_Firstname],[C#]) VALUES('Remedios',10);


--SCHEDULE data insert
INSERT INTO SCHEDULE([V#],[Slot#],[R#],[Oncall]) VALUES(1,1,2,0);
INSERT INTO SCHEDULE([V#],[Slot#],[R#],[Oncall]) VALUES(1,3,1,0);
INSERT INTO SCHEDULE([V#],[Slot#],[R#],[Oncall]) VALUES(1,5,3,0);
INSERT INTO SCHEDULE([V#],[Slot#],[R#],[Oncall]) VALUES(1,6,2,0);
INSERT INTO SCHEDULE([V#],[Slot#],[R#],[Oncall]) VALUES(2,2,2,0);
INSERT INTO SCHEDULE([V#],[Slot#],[R#],[Oncall]) VALUES(2,4,1,1);
INSERT INTO SCHEDULE([V#],[Slot#],[R#],[Oncall]) VALUES(2,7,2,1);
INSERT INTO SCHEDULE([V#],[Slot#],[R#],[Oncall]) VALUES(2,8,2,0);




--CALL_SCHEDULE data insert
INSERT INTO CALL_SCHEDULE([Site#],[Fromm],[Too]) VALUES(10,'07:00:00','09:00:00');
INSERT INTO CALL_SCHEDULE([Site#],[Fromm],[Too]) VALUES(15,'12:00:00','14:00:00');
INSERT INTO CALL_SCHEDULE([Site#],[Fromm],[Too]) VALUES(11,'13:00:00','16:00:00');
INSERT INTO CALL_SCHEDULE([Site#],[Fromm],[Too]) VALUES(2,'08:00:00','08:30:00');
INSERT INTO CALL_SCHEDULE([Site#],[Fromm],[Too]) VALUES(23,'08:00:00','09:00:00');
INSERT INTO CALL_SCHEDULE([Site#],[Fromm],[Too]) VALUES(12,'11:00:00','12:00:00');
INSERT INTO CALL_SCHEDULE([Site#],[Fromm],[Too]) VALUES(6,'10:00:00','13:00:00');


--TREATMENT data insert
INSERT INTO CALL_SCHEDULE([Date_of_Treatment],[V#],[A#],[Site#],[Treatment_Given]) VALUES('2019-10-07',5,11,19,'Antibiotics given');
INSERT INTO CALL_SCHEDULE([Date_of_Treatment],[V#],[A#],[Site#],[Treatment_Given]) VALUES('2019-11-02',5,1,20,'Ambutated left rear foot');
INSERT INTO CALL_SCHEDULE([Date_of_Treatment],[V#],[A#],[Site#],[Treatment_Given]) VALUES('2019-10-19',5,6,4,'Pain killers for next two weeks');
INSERT INTO CALL_SCHEDULE([Date_of_Treatment],[V#],[A#],[Site#],[Treatment_Given]) VALUES('2019-10-25',5,15,15,'Therapy recommended');
INSERT INTO CALL_SCHEDULE([Date_of_Treatment],[V#],[A#],[Site#],[Treatment_Given]) VALUES('2019-10-25',2,8,21,'Administered injection');






