




--5. Prikažite novcica iz tablice zarucnica, neprijatelj iz tablice brat te 
--haljina iz tablice neprijatelj uz uvjet da su vrijednosti kolone 
--drugiputa iz tablice cura poznate te da su vrijednosti kolone vesta iz 
--tablice decko sadrže niz znakova ba. Podatke posložite po haljina iz 
--tablice neprijatelj silazno. (10)
--6. Prikažite kolone vesta i asocijalno iz tablice decko ?iji se primarni 
--klju? ne nalaze u tablici decko_zarucnica. (5

use master;

drop database if exists vjezba2;
go
create database vjezba2;
use vjezba2;

create table brat(
    id int not null primary key identity (1,1),
    suknja varchar (47),
    ogrlica int not null,
    asocijalno bit not null,
    neprijatelj int not null
);

create table neprijatelj(
    id int not null primary key identity (1,1),
    majica varchar(32),
    haljina varchar (43) not null,
    lipa decimal (16,8),
    modelnaocala varchar(49) not null,
    kuna decimal(12,6) not null,
    jmbag char (11),
    cura int
);

create table cura(
    id int not null primary key identity (1,1),
    haljina varchar (33) not null,
    drugiputa datetime not null,
    suknja varchar (38),
    narukvica int,
    introvertno bit,
    majica varchar(40),
    decko int
);
create table decko(
    id int not null primary key identity (1,1),
    indiferentno bit,
    vesta varchar (34),
    asocijalno bit not null
);

create table decko_zarucnica(
    id int not null primary key identity (1,1),
    decko int not null,
    zarucnica int not null
);

create table zarucnica(
    id int not null primary key identity(1,1),
    narukvica int,
    bojakose varchar (37) not null,
    novcica decimal(15,9),
    lipa decimal (15,8) not null,
    indiferentno bit not null

);

create table prijatelj(
    id int not null primary key identity (1,1),
    modelnaocala varchar(37),
    treciputa datetime not null,
    ekstrovertno bit not null,
    prviputa datetime,
    svekar int not null
);

create table svekar(
    id int not null primary key identity (1,1),
    stilfrizura varchar(48),
    ogrlica int not null,
    asocijalno bit not null
);

alter table prijatelj add foreign key (svekar) references svekar(id);
alter table brat add foreign key (neprijatelj) references neprijatelj(id);
alter table neprijatelj add foreign key (cura) references cura(id);
alter table cura add foreign key (decko) references decko(id);
alter table decko_zarucnica add foreign key (decko) references decko(id);
alter table decko_zarucnica add foreign key (zarucnica) references zarucnica(id);


--neprijatelj cura i decko_zarucnica po tri reda

insert into neprijatelj(majica,haljina,lipa,modelnaocala,kuna,jmbag,cura)
values	
	('plavozelena','tamna','10.50','neke avijaticarke','25.35','13469631245','2'),
	('siva sa bijelim prugama','plava na cvjetice','25.68','vintage','33.58','46132694612','3'),
	('crvena','plava',null,'?etvrtaste','21.12',null,'4');

insert into cura(haljina,drugiputa,suknja,narukvica,introvertno,majica,decko) 
	values 
	('nova','2023-03-05 00:00:00','roza','7','1','rozena','4'),
	('crna','2023-05-01 00:00:00','plava','2','1','crvena','5'),
	('tigrasta','2023-01-03 00:00:00','zelena','5','1',null,'6');

	select*from cura;
	select*from brat;
	select*from zarucnica;
	select*from decko;

insert into decko_zarucnica(decko,zarucnica)
	values 
	('1','1'),
	('2','2'),
	('3','3');

insert into brat(suknja,ogrlica,asocijalno,neprijatelj)
	values 
	('zelena na zmajeve','55','1','3');
	select*from neprijatelj;

insert into decko(indiferentno,vesta,asocijalno)
	values 
		('1','plava mucasta','0'),
		('0','zelenoplavocrvena','1'),
		('1','jkdhjd','1');



insert into zarucnica(narukvica,bojakose,novcica,lipa,indiferentno)
	values
	('12','smedjeplava',null,'25.61','1'),
	('12','plava',null,'23.55','0'),
	('31','ljubicasta',null,'19.99','1');

  --2. U tablici prijatelj postavite svim zapisima kolonu treciputa na 
--vrijednost 30. travnja 2020. (4)
update prijatelj set treciputa='2020-04-30';

--3. U tablici brat obrišite sve zapise ?ija je vrijednost kolone ogrlica 
--razli?ito od 14. (4)

delete from brat where ogrlica<>14;


--4. Izlistajte suknja iz tablice cura uz uvjet da vrijednost kolone 
--drugiputa nepoznate. (6)

select suknja from cura where drugiputa is null;

--5. Prikažite novcica iz tablice zarucnica, neprijatelj iz tablice brat te 
--haljina iz tablice neprijatelj uz uvjet da su vrijednosti kolone 
--drugiputa iz tablice cura poznate te da su vrijednosti kolone vesta iz 
--tablice decko sadrže niz znakova ba. Podatke posložite po haljina iz 
--tablice neprijatelj silazno. (10)


SELECT z.novcica, b.neprijatelj, n.haljina
FROM zarucnica z
inner join decko_zarucnica dz ON dz.zarucnica = z.id
inner join decko d ON dz.decko = d.id
inner join cura c on c.decko = d.id
inner join neprijatelj n on n.cura = c.id
inner join brat b ON b.neprijatelj = n.id
WHERE c.drugiputa is not null
and d.vesta like '%ba%' 
order by n.haljina desc;