use Lukas;

/*
DROP TABLE SPJ;
DROP TABLE S;
DROP TABLE P;
DROP TABLE J;
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
CONSTRAINT PK_Slot# PRIMARY KEY(Slot#)
);


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
CONSTRAINT PK_V PRIMARY KEY(V#)
);


--SPECIALITY(SP#, Description)
--PK- SP#
CREATE TABLE SPECIALITY(
SP# int IDENTITY(1,1),
Description varchar(200),
CONSTRAINT PK_SP PRIMARY KEY(SP#)
);

--SITE(Site#, SiteType, StreetNo, StreetName, Suburb)
--PK- Site#
CREATE TABLE SITE(
Site# int IDENTITY(1,1),
SiteType varchar(25),
StreetNo varchar(10),
StreetName varchar(50),
Suburb varchar(50),
CONSTRAINT PK_Site PRIMARY KEY(Site#)
);


--VS (V#, SP#)
--PK � (V#, SP#) � composite key
--FK � V#, and SP#
CREATE TABLE VS (
	V# int,
	SP# int,
 CONSTRAINT PK_VSP PRIMARY KEY(V#,SP#),
 CONSTRAINT FK_V_VSP FOREIGN KEY(V#) REFERENCES VET(V#),
 CONSTRAINT FK_SP_VSP FOREIGN KEY(SP#) REFERENCES SPECIALITY(SP#));


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
 CONSTRAINT FK_C_A FOREIGN KEY(C#) REFERENCES CLIENT(C#));


--SCHEDULE(Sch#, V#, Slot#, R#,Oncall)
--R#, V# and Slot# nulls should be allowed
--PK - Sch#
--FK � V#, Slot# and R#
CREATE TABLE SCHEDULE (
	Sch# int IDENTITY(1,1),
	V# int,
	Slot# int,
	R# int,
	Oncall varchar(30),	--?
 CONSTRAINT PK_Sch PRIMARY KEY(Sch#),
 CONSTRAINT FK_V_Sch FOREIGN KEY(V#) REFERENCES VET(V#),
 CONSTRAINT FK_Slot_Sch FOREIGN KEY(Slot#) REFERENCES TIMESLOT(Slot#),
 CONSTRAINT FK_R_Sch FOREIGN KEY(R#) REFERENCES ROOM(R#));


--CALL_SCHEDULE (V#, Site#, From, To)
--PK � (V#, Site#) � composite key
--FK � V#, and Site#
CREATE TABLE CALL_SCHEDULE (
	V# int,
	Site# int,
	Fromm TIME(0),
	Too TIME(0),
 CONSTRAINT PK_VSite PRIMARY KEY(V#, Site#),
 CONSTRAINT FK_V_VSite FOREIGN KEY(V#) REFERENCES VET(V#),
 CONSTRAINT FK_Site_VSite FOREIGN KEY(Site#) REFERENCES SITE(Site#));


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
 CONSTRAINT FK_V_T FOREIGN KEY(V#) REFERENCES VET(V#),
 CONSTRAINT FK_A_T FOREIGN KEY(A#) REFERENCES ANIMAL(A#),
 CONSTRAINT FK_Site_T FOREIGN KEY(Site#) REFERENCES SITE(Site#));