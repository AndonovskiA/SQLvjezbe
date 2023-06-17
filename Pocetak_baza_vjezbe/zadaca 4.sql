 create database udruga;

 create table djelatnik(
	ime varchar (50),
	prezime varchar (50),
	sifra char (10),

 
 
 );

 create table prostorija(

	nazivprostorije varchar (50),
	brojprostorije int (15),
	imezivotinje varchar (50),


	);

	create table zivotinja(
	
		ime varchar (50),
		vrsta varchar (50),
		spol varchar (10),
		prostorija int (15),
		djelatnik varchar (50)
	
	
	);
