use master;
drop database if exists ZOO;
go
create database ZOO;
go
use ZOO;

create table ANIMAL(
	ID int not null primary key identity (1,1),
	SPECIES varchar (50) not null,
	ANIMAL_NAME varchar (50) not null,
	EMPLOYEE int not null,
	ROOM int not null,
	DATES int not null
);

create table EMPLOYEE(
	ID int not null primary key identity(1,1),
	FIRST_NAME varchar (50) not null,
	LAST_NAME varchar (50) not null,
	IBAN varchar (50)
);
create table ROOM(
	ID int not null primary key identity (1,1),
	DIMENSIONS varchar (30),
	MAX_NUMBER int,
	PLACE varchar (50)
);
create table DATES(
	ID int not null primary key identity (1,1),
	DATE_OF_BIRTH datetime,
	DATE_OF_ENTRY datetime,
	DATE_OF_DEATH datetime 
);
 
 alter table ANIMAL add foreign key (EMPLOYEE) references EMPLOYEE(ID);
 alter table ANIMAl add foreign key (ROOM) references ROOM(ID);
 alter table ANIMAL add foreign key (DATES) references DATES(ID);

 insert into EMPLOYEE(FIRST_NAME,LAST_NAME,IBAN)
 values
 ('john','newman','65165464'),
 ('mark','peterson','55464544'),
 ('rachel','green','64924864777'),
 ('jaden','american','65464646468');



 insert into ROOM(DIMENSIONS,MAX_NUMBER,PLACE)
 values
 ('5','2','GREEN'),
 ('17','5','YELLOW'),
 ('25','3','BLUE'),
 ('50','4','RED');



 insert into DATES(DATE_OF_BIRTH,DATE_OF_ENTRY,DATE_OF_DEATH)
 values 
 ('2006-05-23 10:53:07','2006-12-05 09:05:06','2022-01-31 19:32:50'),
 ('2007-09-03 15:16:28','2008-03-05 08:30:15','2023-03-05 21:59:53'),
 ('2010-12-15 05:03:01','2011-03-01', '2022-01-31 19:32:50'),
 ('2022-01-01 02:03:56','2022-02-03', '2022-01-31 19:32:50');

 insert into ANIMAL(SPECIES,ANIMAL_NAME,EMPLOYEE,ROOM,DATES)
 values
 ('MONKEY', 'BLUE','1','1','1'),
 ('LION','PETER','2','2','2'),
 ('ELEPHANT','BOSTON','3','3','3'),
 ('CAPIBARA','MELODY','4','4','4');


 

 