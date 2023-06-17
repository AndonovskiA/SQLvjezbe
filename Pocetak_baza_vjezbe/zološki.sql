	use master;
	drop database if exists ZOO;
	go
	create database ZOO;
	go
	use ZOO;

	create table EMPLOYEE(
	ID int not null primary key identity(1,1),
	FIRST_NAME varchar (50) not null,
	LAST_NAME varchar (50) not null,
	IBAN varchar (50),
	
);

	create table ANIMAL(
	ID int identity (1,1),
	SPECIES varchar (50) not null,
	ANIMAL_NAME varchar (50) not null,
	EMPLOYEE_ID int not null,
	ROOM int not null,
	DATES int not null,
	primary key (ID),
	foreign key (EMPLOYEE_ID) references EMPLOYEE(ID)
	);


create table ROOM(
	ID int not null primary key identity (1,1),
	DIMENSIONS varchar (30),
	MAX_NUMBER int,
	PLACE varchar (50)
);
create table DATES(
	ID int not null primary key identity (1,1),
	DATE_OF_BIRTH varchar(50) not null,
	DATE_OF_ENTRY varchar(50) not null,
	DATE_OF_DEATH DATETIME
);
 
 --alter table ANIMAL add foreign key (EMPLOYEE) references EMPLOYEE(ID);
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
	--('23.05.2001','17.06.2001','31.12.2022'),
	--('05.06.2003','06.09.2003','06.09.2022'),
	--('01.03.2013','28.05.2013','28.2.2023'),
	('13.08.2008','8.05.2013', '2005-06-03');



 insert into ANIMAL(SPECIES,ANIMAL_NAME,EMPLOYEE_ID,ROOM,DATES)
 values
	('MONKEY','ROBERTO','1','1','1'),
	('CAMEL','FREDDY','2','2','2'),
	('CAPIBARA','KAREN','3','3','3'),
	('RHINOCEROS','PETER','4','4','4');

	--NAPRAVI 3 PROMJENE I OBRISI TRI REDA
	--update smjer set naziv='Web programiranje'
	--where sifra=1;

update ROOM set MAX_NUMBER='5'
WHERE ID=1;

update ANIMAL set ANIMAL_NAME='BLOOM'
where ID=2;
