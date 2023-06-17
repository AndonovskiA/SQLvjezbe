use master;

drop database if exists vjezba1;

create database vjezba1;
use vjezba1;

create table punac( 
    ID int not null primary key identity(1,1),
    OGRLICA int,
    GUSTOCA decimal (14,9),
    HLACE varchar(14) NOT NULL
);

create table cura(
    ID int not null primary key identity(1,1),
    NOVCICA DECIMAL (16,5) not null,
    GUSTOCA DECIMAL (18,6) not null,
    LIPA DECIMAL (13,10),
    OGRLICA INT NOT NULL,
    BOJAKOSE VARCHAR(38),
    SUKNJA VARCHAR(36),
    PUNAC INT
);

create table sestra(
    ID int not null primary key identity (1,1),
    INTROVERTNO bit,
    HALJINA varchar (31) not null,
    maraka decimal (16,6),
    HLACE varchar (46) not null,
    NARUKVICA int not null
);

create table zena(
    ID INT not null primary key identity (1,1),
    TRECIPUTA datetime,
    HLACE varchar (31),
    KRATKAMAJICA varchar (31) not null,
    JMBAG char (11) not null,
    BOJAOCIJU varchar (44) not null,
    HALJINA varchar (44),
    SESTRA int not null
);

create table muskarac(
    ID int not null primary key identity (1,1),
    BOJAOCIJU varchar (50) not null,
    HLACE varchar (30),
    MODELNAOCALA varchar(43),
    MARAKA decimal (14,5) not null,
    ZENA int not null
);

create table mladic(
    ID int not null primary key identity (1,1),
    SUKNJA varchar(50) not null,
    KUNA decimal (16,8) not null,
    DRUGIPUTA datetime,
    ASOCIJALNO bit,
    EKSTROVERTNO bit not null,
    DUKSERICA varchar (48) not null,
    MUSKARAC int
); 

create table sestra_svekar(
    ID int not null primary key identity (1,1),
    SESTRA int not null,
    SVEKAR int not null
);

create table svekar(
    ID int not null primary key identity (1,1),
    BOJAOCIJU varchar(40) not null,
    PRSTENA int,
    DUKSERICA varchar(41),
    LIPA decimal (13,8),
    EURA decimal (12,7),
    MAJICA varchar(35)
);

alter table cura add foreign key (punac) references cura(ID);
alter table sestra_svekar add foreign key (svekar) references svekar(ID);
alter table sestra add foreign key (narukvica) references sestra_svekar(ID);
alter table zena add foreign key(sestra) references sestra(ID);
alter table muskarac add foreign key (zena) references zena(ID);
alter table mladic add foreign key (muskarac) references muskarac(ID);


insert into zena(TRECIPUTA,KRATKAMAJICA,JMBAG,BOJAOCIJU,HALJINA,SESTRA)
	values 
	('2022-03-07 00:00:00','abcd','13264976121','plava','duga','7'),
	('2019-06-30 00:00:00','jklm','12345678911','zelena','mini','8'),
	('2010-12-12 00:0:00','asdf','13649761231','crna','duga','9');

insert into sestra(INTROVERTNO,HALJINA,maraka,HLACE,NARUKVICA)
	values
	('1','asdfghj','15.80','onakve','1'),
	('1','cbvnsdk','12.53','plave','2'),
	('0','mala','10.80','crvene','3');

	select*from sestra;

insert into muskarac(BOJAOCIJU,HLACE,MODELNAOCALA,MARAKA,ZENA)
	values
	('plava','zelene','deo','12.95','1'),
	('zelena','duge', null,'20.00','2'),
	('crna','moje','petnaest','8.50','3');

	select*from zena;

insert into mladic(SUKNJA,KUNA,DRUGIPUTA,ASOCIJALNO,EKSTROVERTNO,DUKSERICA)
	values
	('mala plava','10.80','2021-03-03 00:00:00','1','0','neka tamo nike'),
	('vintage na pruge','25.60',null,'1','0','zelena na zmaja'),
	('nije moja','55.60','2021-06-08 00:00:00','1','0','crna');

	select*from muskarac;

insert into sestra_svekar(SESTRA,SVEKAR)
	values 
	('1','1'),
	('2','2'),
	('3','3');

insert into svekar(BOJAOCIJU,PRSTENA)
	values
	('smeda','3'),
	('plava','5'),
	('zuta','2');

select*from svekar;
select*from muskarac;
select*from sestra_svekar;
select*from sestra;
select*from zena;
select*from mladic;

UPDATE curaSET gustoca = 15.77;DELETE FROM mladicWHERE kuna > 15.78;SELECT z.kratkamajica FROM zena zWHERE z.hlace LIKE '%ana%';
SELECT sv.dukserica, ml.asocijalno, mu.hlace
		FROM svekar sv	
		JOIN sestra_svekar sesv ON sv.Id = sesv.SVEKAR
		JOIN muskarac mu ON ze.ID = mu.zena
		JOIN mladic ml ON mu.ID = ml.MUSKARAC
		JOIN sestra_svekar sest ON se.Id = sesv.sestra
		JOIN svekar sv ON sesv.SVEKAR = sv.ID
		WHERE ze.hlace LIKE 'a%'
		AND se.HALJINA LIKE '%ba%'
		ORDER BY mu.hlace DESC;

-- Prikazite kolone haljina i maraka iz tablice sestra ciji se primarni kljuc ne nalaze u tablici sestra_svekar. 


