use master;

drop database if exists vjezba_3;
go
create database vjezba_3;
go
use vjezba_3;

create table svekar(
	id int not null primary key identity(1,1),
	novcica decimal (16,8) not null,
	suknja varchar (40) not null,
	bojakose varchar(36),
	prstena int,
	narukvica int not null,
	cura int not null
);

create table cura(
	id int not null primary key identity(1,1),
	dukserica varchar(49),
	maraka decimal(13,7),
	drugiputa datetime,
	majica varchar(49),
	novcica decimal(15,8),
	ogrlica int not null
);
alter table svekar add foreign key (cura) references cura(id);

create table punica(
	id int not null primary key identity(1,1),
	asocijalno bit,
	kratkamajica varchar (44),
	kuna decimal (13,8),
	vesta varchar (32) not null,
	snasa int
);
create table snasa(
	id int not null primary key identity(1,1),
	introvertno bit,
	kuna decimal (15,6) not null,
	eura decimal (12,9) not null,
	treciputa datetime,
	ostavljena int not null
);

create table ostavljena (
	id int not null primary key identity (1,1),
	kuna decimal (17,5),
	lipa decimal (15,6),
	majica varchar (36),
	modelnaocala varchar (31) not null,
	prijatelj int
);
create table prijatelj(
	id int not null primary key identity (1,1),
	kuna decimal (16,10),
	haljina varchar (37),
	lipa decimal (13,10),
	dukserica varchar (31),
	indiferentno bit not null
);

create table prijatelj_brat(
	id int not null primary key identity (1,1),
	prijatelj int not null,
	brat int not null
);

create table brat(
	id int not null primary key identity (1,1),
	jmbag char (11),
	ogrlica int not null,
	ekstrovertno bit not null
);

alter table punica add foreign key (snasa) references snasa(id);
alter table snasa add foreign key (ostavljena) references ostavljena(id);
alter table ostavljena add foreign key (prijatelj) references prijatelj(id);
alter table prijatelj_brat add foreign key(prijatelj) references prijatelj(id);
alter table prijatelj_brat add foreign key (brat) references brat(id);

insert into punica(asocijalno,kuna,vesta)
	values 
	('1','25.60','plava');

insert into snasa( kuna,eura,ostavljena)
	values 
	('225.6','25.53','1'),
	('32.80','55.2','2'),
	('22.13','5.60','3');

	select*from ostavljena;

insert into ostavljena(modelnaocala,prijatelj)
	values
	('ray ban','1'),
	('police','2'),
	('okrugle','1');

insert into prijatelj(kuna,indiferentno)
	values
	('12.30','1'),
	('18.35','0');

insert into prijatelj_brat(prijatelj,brat)
	values 
	('1','1'),
	('1','1'),
	('2','1');

insert into brat(ogrlica,ekstrovertno)
	values 
	('2','1');
	
	select*from prijatelj;
	select*from brat;


update svekar set suknja= 'Osijek';
delete from punica where kratkamajica='ab';select majica from ostavljena where lipa like ('%9''%10''%20''%30''%35');

select b.ekstrovertno,pu.vesta,s.kuna
from brat b 
	join prijatelj_brat pb on b.id = pb.id
	join prijatelj pr on pb.prijatelj= pr.id 
	join ostavljena o on pr.id= o.prijatelj
	join snasa s on s.id=o.id
	join punica pu on pu.id=s.id
where o.lipa <>91 
and pr.haljina like '%ba'
order by s.kuna desc;


select pr.haljina,pr.lipa from prijatelj pr where id not in (select id from prijatelj_brat);


