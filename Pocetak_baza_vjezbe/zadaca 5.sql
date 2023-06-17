create database salonuljepšavanje;

create table djelatnik(

	 ime varchar (20),
	 prezime varchar (50),
	 sifra char (6),


);

create table usluga(
	naziv varchar (50),
	cijena decimal (15,2),
	sifra int (20),

); 

create table korisnik(
	ime varchar (50),
	prezime varchar (50),
	usluga varchar (50),
	datumusluge datetime 


);