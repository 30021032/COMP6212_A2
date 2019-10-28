use wacs_db;

/*
DROP TABLE SPJ;
DROP TABLE S;
DROP TABLE P;
DROP TABLE J;
*/


--EMPLOYEE(E#, E_Firstname, E_Surname, StreetNo, StreetName, Suburb)
--PK- E#
CREATE TABLE EMPLOYEE(
E# varchar(2)  NOT NULL,
E_Firstname varchar(30) NULL,
E_Surname varchar(30) NULL,
StreetNo int NULL,
StreetName varchar(30) NULL,
Suburb varchar(30) NULL,
CONSTRAINT PK_E PRIMARY KEY(E#));




--ROOM(R#, RoomName)
--PK- R#
CREATE TABLE ROOM(
R# varchar(2)  NOT NULL,
RoomName varchar(20) NULL,
CONSTRAINT PK_R PRIMARY KEY(R#));






--TIMESLOT(Slot#, From, To)
--PK- Slot#
CREATE TABLE TIMESLOT(
Slot# varchar(2),
Fromm varchar(10) NULL,
Too varchar(10) NULL,
CONSTRAINT PK_Slot# PRIMARY KEY(Slot#)
);


--VET (V#, V_Firstname, V_Surname, StreetNo, StreetName, Suburb, ContactNo)
--PK- V#
CREATE TABLE VET(
V# varchar(2),
V_Firstname varchar(10) NULL,
V_Surname varchar(10) NULL,
StreetNo int NULL,
StreetName varchar(30) NULL,
Suburb varchar(30) NULL,
ContactNo int NULL,
CONSTRAINT PK_V PRIMARY KEY(V#)
);


--SPECIALITY(SP#, Description)
--PK- SP#
CREATE TABLE SPECIALITY(
SP# varchar(2),
Description varchar(10) NULL,
CONSTRAINT PK_SP PRIMARY KEY(SP#)
);


--VS (V#, SP#)
--PK – (V#, SP#) – composite key
--FK – V#, and SP#
CREATE TABLE VS (
	V# varchar(2) NOT NULL,
	SP# varchar(2) NOT NULL,
 CONSTRAINT PK_VSP PRIMARY KEY(V#,SP#),
 CONSTRAINT FK_V_VSP FOREIGN KEY(V#) REFERENCES VET(V#),
 CONSTRAINT FK_SP_VSP FOREIGN KEY(SP#) REFERENCES SPECIALITY(SP#));




--CLIENT(C#, C_Firstname, C_Surname, StreetNo, StreetName, Suburb, ContactNo)
--PK- C#
CREATE TABLE CLIENT(
C# varchar(2),
C_Firstname varchar(10) NULL,
C_Surname varchar(30) NULL,
StreetNo int NULL,
StreetName varchar(30) NULL,
Suburb varchar(30) NULL,
ContactNo int NULL,
CONSTRAINT PK_C PRIMARY KEY(C#));


--ANIMAL(A#, AName, C#)
--PK- A#
--FK – C#
CREATE TABLE ANIMAL (
	A# varchar(2) NOT NULL,
	AName# varchar(2) NOT NULL,
	C# varchar(2) NULL,
 CONSTRAINT PK_A PRIMARY KEY(A#),
 CONSTRAINT FK_C_A FOREIGN KEY(C#) REFERENCES CLIENT(C#));


--SCHEDULE(Sch#, V#, Slot#, R#,Oncall)
--R#, V# and Slot# nulls should be allowed
--PK - Sch#
--FK – V#, Slot# and R#


--CALL_SCHEDULE (V#, Site#, From, To)
--PK – (V#, Site#) – composite key
--FK – V#, and Site#


--TREATMENT(T#, Date_of_Treatment, V#, A#, Site#, Treatment_Given)
--Site# - nulls should be allowed
--PK - T#
--FK – V#, A# and Site#


--SITE(Site#, SiteType, StreetNo, StreetName, Suburb)
--PK- Site#