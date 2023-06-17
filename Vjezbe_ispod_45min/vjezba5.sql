use master;

drop database if exists vjezba5;
go

create database vjezba5;
go
use vjezba5;

create table mladic(
	id int not null primary key identity(1,1),
	kratkamajica varchar(48) not null,
	haljina varchar(30) not null,
	asocijalno bit,
	zarucnik int not null
);
create table zarucnik(
	id int not null primary key identity(1,1),
	jmbag char (11),
	lipa decimal (13,8),
	indiferentno bit not null
);
alter table mladic add foreign key (zarucnik) references zarucnik(id);

create table ostavljena(
	id int not null primary key identity (1,1),
	majica varchar (33),
	ogrlica int not null,
	carape varchar(44),
	stilfrizura varchar (42),
	punica int not null
);

create table punica(
	id int not null primary key identity(1,1),
	hlace varchar (43) not null,
	nausnica int not null,
	ogrlica int,
	vesta varchar(49) not null,
	modelnaocala varchar(31) not null,
	treciputa datetime not null,
	punac int not null
);

create table punac(
	id int not null primary key identity (1,1),
	diukserica varchar (33),
	prviputa datetime not null,
	majica varchar(36),
	svekar int not null
);

create table svekar(
	id int not null primary key identity(1,1),
	bojakose varchar (33),
	majica varchar (31),
	carape varchar(31) not null,
	haljina varchar (43),
	narukvica int,
	eura decimal(14,5) not null
);
create table svekar_cura(
	id int not null primary key identity(1,1),
	svekar int not null,
	cura int not null
);

create table cura(
	id int not null primary key identity (1,1),
	carape varchar(41) not null,
	maraka decimal(17,10) not null,
	asocijalno bit,
	vesta varchar(47) not null
);

-- tablice punica, punac i svekar_cura unesite po 3 retka. (7)
insert into punica(hlace,nausnica,vesta,modelnaocala,treciputa,punac)
	values
	('osam','5','plava','male crne','2023-12-12 00:00:00','4'),
	('devet','8','zelena','stare','2023-01-01 00:00:02','5'),
	('deset','10','zuta','ogruglokockaste','2023-02-02 12:03:05','6');

insert into punac(prviputa,svekar)
	values
	('2023-03-01 11:11:02','1'),
	('2023-05-01 12:03:05','1'),
	('2022-06-12 21:09:22','1');

	select*from punica;

insert into svekar_cura(svekar,cura)
	values
	('1','1'),
	('1','1'),
	('1','2');

	select*from svekar;
	select*from cura;
insert into svekar(carape,eura)
	values
	('sve moguce','27.80');

insert into cura(carape,maraka,vesta)
	values
	('nisu moje','22.50','osam');


insert into ostavljena(ogrlica,carape,punica)
	values
	('2','osam','1');

update mladic set haljina= 'osijek';

delete from ostavljena where ogrlica=17;

select majica from punac where prviputa is null;

select cu.asocijalno,ost.stilfrizura,pun.nausnica
from ostavljena ost
join punica pun on pun.id=ost.punica
join punac pu on pu.id=pun.punac
join svekar sv on sv.id=pun.id
join svekar_cura sc on sc.svekar=sv.id
join cura cu on cu.id=sc.cura
where pu.prviputa is not null and sv.majica like '%ba%'
order by pun.nausnica desc;



select majica,carape from svekar where id not in(select id from svekar_cura);