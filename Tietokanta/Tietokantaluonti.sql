start transaction;

-- Asiakas-taulu
create table asiakas (
         asiakasnumero integer unsigned not null auto_increment,
         nimi varchar(60) not null,
         lahiosoite varchar(80),
         postinumero varchar(5),
         postitoimipaikka varchar(30),
         puh varchar(20),
         constraint asiakas_pk 
               primary key (asiakasnumero) 
);

-- Tuote-taulu
create table tuote (
         tuotenumero integer unsigned not null auto_increment,
         tuotenimi varchar(60) not null,
         hinta dec(10,2),
         varasto int,
         constraint tuote_pk 
               primary key (tuotenumero) 
);

-- Tilaus-taulu
create table tilaus (
         tilausnumero integer unsigned not null auto_increment,
         pvm date not null,
         asiakasnumero int unsigned,
         tuotenumero int unsigned,
         maara int,
         constraint tilaus_pk
                 primary key (tilausnumero),
         constraint viiteeheys_asiakkaisiin
                 foreign key (asiakasnumero)
                 references asiakas (asiakasnumero),
         constraint viiteeheys_tuotteisiin
                 foreign key (tuotenumero)
                 references tuote (tuotenumero)
);

create index tilaus_pvm on tilaus(pvm);
create index tuotteet on tuote(tuotenimi,hinta);

insert into asiakas (nimi,lahiosoite,postinumero,postitoimipaikka,puh)
            values ('Meikäläinen Matti','Kotikuja 5 c 7','50100','Mikkeli','050-123456'); 
insert into asiakas (nimi,lahiosoite,postinumero,postitoimipaikka,puh)
            values ('Meikäläinen Maija','Kirkkokatu 15','50100','Mikkeli','050-454545');
insert into asiakas (nimi,lahiosoite,postinumero,postitoimipaikka,puh)
            values ('Ahonen Aimo','Satamakatu 17 a 10','52500','Kerava','040-176543'); 
insert into asiakas (nimi,lahiosoite,postinumero,postitoimipaikka,puh)
            values ('Öhman Taisto','Rantatie 10 b 3','50600','Rauma','044-222333'); 

insert into tuote (tuotenimi,hinta,varasto)
            values ('Saha',40.20,15);  
insert into tuote (tuotenimi,hinta,varasto)
            values ('Kirves',130.50,22);   
insert into tuote (tuotenimi,hinta,varasto)
            values ('Potkukelkka',420.00,7);  

insert into tilaus (pvm,asiakasnumero,tuotenumero,maara)
            values ('2010-10-5',2,1,6); 
insert into tilaus (pvm,asiakasnumero,tuotenumero,maara)
            values ('2010-9-15',1,1,8);  
insert into tilaus (pvm,asiakasnumero,tuotenumero,maara)
            values ('2010-9-18',1,2,3);
insert into tilaus (pvm,asiakasnumero,tuotenumero,maara)
            values ('2010-9-22',1,3,2);
insert into tilaus (pvm,asiakasnumero,tuotenumero,maara)
            values ('2010-10-1',3,2,1);
insert into tilaus (pvm,asiakasnumero,tuotenumero,maara)
            values ('2010-10-5',3,1,3);                 

commit;













