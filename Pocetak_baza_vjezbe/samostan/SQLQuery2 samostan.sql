-- samostan

use master;
drop database if exists samostan;
go
create database samostan;
go
use samostan;

create table svecenik(
	id int not null primary key identity (1,1),
	ime varchar (50) not null,
	prezime varchar (50) not null,
	id_nadredeni int not null,
);

create table posao(
	naziv varchar (50) not null,
	id int not null primary key identity (1,1),


)

create table nadredeni_svecenik(
	ime varchar (50) not null,
	prezime varchar (50) not null,
	id_svecenik int not null primary key identity (1,1)


);

create table posao_svecenik(
	posao int not null,
	svecenik int not null

);


alter table posao_svecenik add foreign key (posao) references svecenik (id);
alter table posao_svecenik add foreign key (svecenik) references posao (id);
alter table svecenik add foreign key (id_nadredeni) references nadredeni_svecenik(id_svecenik);

--alter table grupa add foreign key (smjer) references smjer(sifra);
--alter table clan add foreign key (grupa) references grupa(sifra);
--alter table clan add foreign key (polaznik) references polaznik(sifra);