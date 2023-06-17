use master;

drop database if exists vjezba4;
go
create database vjezba4;
go
use vjezba4;

create table punac(
	 id int not null primary key identity (1,1),
	 treciputa datetime,
	 majica varchar (46),
	 jmbag char(11) not null,
	 novcica decimal(18,7) not null,
	 maraka decimal (12,6) not null,
	 ostavljen int not null
);

create table ostavljen(
	id int not null primary key identity (1,1),
	modelnaocala varchar (43),
	introvertno bit,
	kuna decimal (14,10)
);

alter table punac add foreign key (ostavljen) references ostavljen(id);


create table prijatelj(
	id int not null primary key identity(1,1),
	eura decimal (16,9),
	prstena int not null,
	gustoca decimal (16,5),
	jmbag char(11) not null,
	suknja varchar (47) not null,
	becar int not null
);

create table becar(
	id int not null primary key identity (1,1),
	novcica decimal (14,8),
	kratkamajica varchar (48) not null,
	bojaociju varchar (36) not null,
	snasa int not null
);

create table snasa(
	id int not null primary key identity (1,1),
	introvertno bit,
	treciputa datetime,
	haljina varchar (44) not null,
	zena int not null
);

create table zena(
	id int not null primary key identity (1,1),
	suknja varchar (39) not null,
	lipa decimal (18,7),
	prstena int not null
);

create table zena_mladic(
	id int not null primary key identity (1,1),
	zena int not null,
	mladic int not null
);

create table mladic(
	id int not null primary key identity (1,1),
	kuna decimal (15,9),
	lipa decimal (15,5),
	nausnica int,
	stilfrizura varchar(49),
	vesta varchar (34) not null
);

alter table prijatelj add foreign key (becar) references becar(id);
alter table becar add foreign key (snasa) references snasa(id);
alter table snasa add foreign key(zena) references zena(id);
alter table zena_mladic add foreign key (zena) references zena(id);
alter table zena_mladic add foreign key (mladic) references mladic(id);


insert into becar (kratkamajica,bojaociju,snasa)
	values
	('plava','zelena','1'),
	('crvena','plava','3'),
	('nije moja','crna','6');
	

	select*from snasa;
insert into snasa(haljina,zena)
	values 
	('plava','1'),
	('zelena','1'),
	('crna','1');

insert into zena_mladic(zena,mladic)
	values 
	('1','1'),
	('1','1'),
	('1','1');

insert into prijatelj(prstena,jmbag,suknja,becar)
	values
	('2','16494623915','osam crnih',' ');
insert into zena(suknja, prstena)
	values
	('plava','2');
insert into mladic(vesta)
	values
	('sarena');
update punac set majica = 'osijek';

delete from prijatelj where prstena >17;

select haljina from snasa where treciputa is null;

select ml.nausnica,pri.jmbag,be.kratkamajica
from mladic ml
join zena_mladic zm on zm.mladic=ml.id
join zena ze on zm.zena=ze.id
join snasa sn on sn.zena=ze.id
join becar be on be.snasa=sn.id
join prijatelj pri on pri.becar=be.id
where sn.treciputa is not null
and ze.lipa <>29
order by be.kratkamajica desc;


select ze.lipa,ze.prstena from zena ze where id not in(select id from zena_mladic);