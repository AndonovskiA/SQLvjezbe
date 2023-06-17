--U samostanu se nalaze svećenici. Svaki svećenik je zadužen za više poslova. Jedan posao u isto vrijeme može obavljati više svećenika. 
--Svaki svećenik ima samo jednog nadređenog svećenika. 
use master
go

create database samostan;

create table svecenik(
	ime varchar (50),
	prezime varchar (50),
	nadredeni varchar (50),
	posao varchar (50),
	
);

create table posao(
	naziv varchar (50),
	sifra int (50),
	


);

create table nadredeni(
	ime varchar (50),
	prezime varchar (50),
	svecenik varchar (50),


);