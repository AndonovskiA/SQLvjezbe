create database anja;
drop database anja;
create database salon;

create table djelatnik(
	ime varchar (50),
	prezime varchar (50),
	sifra char (4)

);


create table usluga(
	naziv varchar (50),
	cijena decimal (18,2),
	sifra int (20)
	-- ako se sjetim još nesto

);

create table klijent(
	ime varchar (50),
	prezime varchar (50),
	datum datetime,
	usluga varchar (50)


);
